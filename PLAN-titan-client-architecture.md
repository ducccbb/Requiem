# Titan Client Architecture

Tài liệu architecture cũ đã được thay bằng bản phân tích theo source và dependency graph tại:

- [`docs/TITAN-CLIENT-ARCHITECTURE.md`](docs/TITAN-CLIENT-ARCHITECTURE.md)

Bản mới bao gồm:

- liên kết giữa handler, variants, actions và utilities;
- lifecycle create/update/action/respond/destroy;
- action contract và thứ tự decision;
- phân tích các module ngoài Titan được gọi trực tiếp;
- network contract và runtime assets;
- ownership/cleanup;
- các lỗi integrity do source decompile;
- impact map khi thêm action hoặc variant.

File này được giữ làm entry point để các đường dẫn cũ không bị mất.
