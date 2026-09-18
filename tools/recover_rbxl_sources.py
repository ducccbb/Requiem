"""Extract Script/ModuleScript sources from a Roblox binary place.

Small recovery utility for local Argon build artifacts. It intentionally only
parses the RBXL fields needed for source recovery: INST and string PROP chunks.
"""

from __future__ import annotations

import argparse
import struct
from dataclasses import dataclass
from pathlib import Path


def read_u32(data: bytes, offset: int) -> tuple[int, int]:
    return struct.unpack_from("<I", data, offset)[0], offset + 4


def read_string(data: bytes, offset: int) -> tuple[bytes, int]:
    length, offset = read_u32(data, offset)
    return data[offset : offset + length], offset + length


def lz4_decompress(data: bytes, expected: int) -> bytes:
    output = bytearray()
    cursor = 0
    while cursor < len(data):
        token = data[cursor]
        cursor += 1
        literal_length = token >> 4
        if literal_length == 15:
            while True:
                value = data[cursor]
                cursor += 1
                literal_length += value
                if value != 255:
                    break
        output.extend(data[cursor : cursor + literal_length])
        cursor += literal_length
        if cursor >= len(data):
            break
        match_offset = struct.unpack_from("<H", data, cursor)[0]
        cursor += 2
        match_length = token & 0x0F
        if match_length == 15:
            while True:
                value = data[cursor]
                cursor += 1
                match_length += value
                if value != 255:
                    break
        match_length += 4
        start = len(output) - match_offset
        for index in range(match_length):
            output.append(output[start + index])
    if len(output) != expected:
        raise ValueError(f"LZ4 size mismatch: {len(output)} != {expected}")
    return bytes(output)


def decode_referents(data: bytes, count: int, offset: int) -> tuple[list[int], int]:
    raw = [0] * count
    for byte_index in range(4):
        for item_index in range(count):
            raw[item_index] |= data[offset] << (8 * (3 - byte_index))
            offset += 1
    values: list[int] = []
    previous = 0
    for value in raw:
        signed = (value >> 1) ^ -(value & 1)
        previous += signed
        values.append(previous)
    return values, offset


@dataclass
class ClassInfo:
    name: str
    referents: list[int]


def parse_chunks(place: bytes) -> list[tuple[str, bytes]]:
    if not place.startswith(b"<roblox!"):
        raise ValueError("Not a Roblox binary place/model")
    chunks: list[tuple[str, bytes]] = []
    offset = 32
    while offset + 16 <= len(place):
        name = place[offset : offset + 4].decode("ascii", "replace")
        compressed, uncompressed, _reserved = struct.unpack_from("<III", place, offset + 4)
        offset += 16
        stored_length = compressed if compressed else uncompressed
        payload = place[offset : offset + stored_length]
        offset += stored_length
        if compressed:
            payload = lz4_decompress(payload, uncompressed)
        chunks.append((name, payload))
        if name == "END\x00":
            break
    return chunks


def extract_sources(place_path: Path, output_root: Path) -> int:
    chunks = parse_chunks(place_path.read_bytes())
    classes: dict[int, ClassInfo] = {}
    names: dict[int, str] = {}
    sources: dict[int, str] = {}

    for chunk_name, payload in chunks:
        if chunk_name != "INST":
            continue
        offset = 0
        class_id, offset = read_u32(payload, offset)
        class_name_raw, offset = read_string(payload, offset)
        class_name = class_name_raw.decode("utf-8", "replace")
        _is_service = payload[offset]
        offset += 1
        count, offset = read_u32(payload, offset)
        referents, offset = decode_referents(payload, count, offset)
        classes[class_id] = ClassInfo(class_name, referents)

    for chunk_name, payload in chunks:
        if chunk_name != "PROP":
            continue
        offset = 0
        class_id, offset = read_u32(payload, offset)
        prop_raw, offset = read_string(payload, offset)
        prop_name = prop_raw.decode("utf-8", "replace")
        prop_type = payload[offset]
        offset += 1
        info = classes.get(class_id)
        if not info or prop_type != 1 or prop_name not in {"Name", "Source"}:
            continue
        for referent in info.referents:
            value_raw, offset = read_string(payload, offset)
            value = value_raw.decode("utf-8", "replace")
            if prop_name == "Name":
                names[referent] = value
            else:
                sources[referent] = value

    output_root.mkdir(parents=True, exist_ok=True)
    recovered = 0
    for referent, source in sources.items():
        name = names.get(referent, f"script_{referent}")
        safe_name = "".join(character if character not in '<>:"/\\|?*' else "_" for character in name)
        target = output_root / f"{referent}_{safe_name}.luau"
        target.write_text(source, encoding="utf-8")
        recovered += 1
    return recovered


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("place", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    print(f"Recovered {extract_sources(args.place, args.output)} script sources")


if __name__ == "__main__":
    main()
