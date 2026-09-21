# Requiem

Requiem Master Hub & Automation Suite for Requiem.

## 🚀 Quick Start (Roblox Executor Loader)

Chạy dòng lệnh sau trong Roblox Executor để nạp bản mới nhất (khuyên dùng CDN jsDelivr để chống cache và vượt rào cản nhà mạng VN):

```lua
loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/ducccbb/Requiem@main/tools/requiem_luna_hub.luau"))()
```

*Hoặc nạp trực tiếp qua GitHub Raw (kèm anti-cache):*
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/ducccbb/Requiem/main/tools/requiem_luna_hub.luau?t=" .. tick()))()
```

---

## 📦 Các Tính Năng Nổi Bật (Features)

### ⚔️ Chiến Đấu Titan (Titan Combat Exploits)
- **Titan Invincibility (Bất Tử Trước Titan)**: Vô hiệu hóa `DetectionBoxTitanClient` và `HitboxTitanClient`, triệt tiêu toàn bộ hitbox tóm/cắn/nuốt, chống Stun/Ragdoll và tự động giải phóng nhân vật.
- **Limb to Nape Redirect (Chém Chi Thành Gáy)**: Chuyển hướng mọi đòn chém trúng bất kỳ chi nào của Titan (chân, tay, ngực) thành sát thương chí mạng vào Gáy (Nape).
- **Infinite Gas & Blades**: Vô hạn khí nén ODMG (`math.huge`) và khóa độ bền lưỡi dao 100% không bao giờ mòn/gãy.

### 🔮 Bùa Chú & Tiến Trình (Progression & Enchantments Suite)
- **Hệ Thống 308 Bùa Chú**: Dropdown bar 2 tầng phân loại theo 5 nhóm thực chiến và 4 phẩm cấp (Mythic, Unique, Legendary, Epic).
- **1-Click God Buffs Presets**:
  - *Insight + Deduction*: Tối đa hóa khả năng tích lũy điểm kinh nghiệm và chỉ số.
  - *Siêu Cơ Động ODMG*: Tăng tốc độ bay lượn, nhảy 2 lần trên không, giảm hao mòn.
  - *Giác Quan Thứ 6*: Cảnh báo sớm hướng Titan tiếp cận.
- **Auto Gacha**: Tự động nhận diện và nhận bùa mong muốn, Auto Open Pack, Fallback Rarest.
- **Skill Caster & Hotkey (V)**: Thi triển nhanh chiêu thức bùa chủ động.
- **Thần Nhãn Native ESP**: Định vị Titan, vật phẩm và đồng đội lên đến 1.200 studs.
- **Auto Counter-Parry**: Tự động phản đòn cận chiến.

### 🥊 Huấn Luyện & Thể Lực (Training & Minigames)
- **Auto Aimlabs**: Bắn bia luyện phản xạ (chế độ Legit & Instant).
- **Auto Punching Bag**: Đấm bao cát AFK tăng sức mạnh.
- **Auto Benchpress**: Nâng tạ tự động giải QTE.
- **Auto Fishing**: Câu cá tự bắt không trượt.
- **Auto Minigames**: Cân bằng trống Drum Q/E, Rhythm Osu, Skillcheck Spacebar.
- **Auto Lore Quiz**: Tự động trả lời ngân hàng 50 câu hỏi Lore với độ chính xác 100%.
