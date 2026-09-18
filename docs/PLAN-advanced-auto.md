# PLAN & IMPLEMENTATION - Advanced Auto Module

## 🎯 1. Mục tiêu cốt lõi (Clear Goals) - ĐÃ HOÀN THÀNH
Tích hợp thành công Tab **"Advanced Auto"** vào Hub `requiem_luna_hub.luau` sử dụng giao diện **Luna Interface Suite**, đáp ứng trọn vẹn các yêu cầu tự động hóa mô phỏng người thật (Anti-Ban / Spectate Proof):
1. **Auto Minigames (Balance, Rhythm, Skillcheck qua VirtualInputManager)**:
   - **Auto Balance Drum**: Dò tìm nốt nhịp tiệm cận vạch tâm ($|\Delta X| \le 0.045$), phân loại nốt Trái (màu hồng) -> gõ `Q`, nốt Phải (màu cyan) -> gõ `E` qua VIM.
   - **Auto Rhythm OSU**: Tự động gõ phím `Q/E` luân phiên khi vòng tròn co nhỏ trong bài huấn luyện cơ động Hard.
   - **Auto Skillcheck QTE**: Đọc góc quay `Spinner.Rotation` và `Validation.Rotation`, gõ `Spacebar` qua VIM khi kim lọt vào dải góc an toàn $\pm 12^\circ$ (PERFECT 100%).
2. **Auto Lore Quiz (Trắc nghiệm Lịch sử)**:
   - Tích hợp Database chuẩn hóa 50/50 câu hỏi & đáp án từ `ReplicatedStorage.Common.Types.Quiz`.
   - Tự động quét 20 câu hỏi hiển thị, so khớp đáp án, click chọn với thời gian suy nghĩ ngẫu nhiên ($1.0 - 3.0$s) mô phỏng người thật và tự bấm Submit khi hoàn thành.
3. **Full Combat Auto (Silent-Aim Recoil-Proof & Auto Cannon Reload)**:
   - **Silent-Aim Musket**: Bẻ cong tia đạn bất chấp **độ giật Recoil camera** và **Inaccuracy offset** của súng.
     - Hook `Workspace:Raycast` qua `hookmetamethod`: Tự động chuyển vector `direction` hướng thẳng vào tâm mục tiêu (`Target` bia ngắm, `Nape` gáy Titan, `Head` đầu Titan).
     - Hook `Mouse.Hit` & `Mouse.Target`: Khử hoàn toàn sai lệch góc nhìn khi camera bị giật lên trời.
     - Vòng tròn FOV Circle hiển thị trực quan quanh con trỏ chuột bằng Drawing API.
     - **Anti-Recoil Camera**: Khử góc nảy Pitch tức thời của camera khi bóp cò.
   - **Auto Cannon Reload**: Tự động nạp đạn cho đại bác khi cầm hoặc có `Cannonball` trong balo khi lại gần đại bác ($14$ studs).

---

## 🧱 2. Cấu trúc Triển khai trong `requiem_luna_hub.luau`

| Module | Cơ chế thực thi | Mức độ an toàn (Anti-Ban) |
| :--- | :--- | :--- |
| **Auto Balance Drum** | `VirtualInputManager:SendKeyEvent(Q/E)` khi $X \approx 0.5$ | ⭐⭐⭐⭐⭐ Tuyệt đối (Server chỉ nhận keybind hợp lệ) |
| **Auto Skillcheck QTE** | `VirtualInputManager:SendKeyEvent(Space)` khi $\Delta\theta \le 12^\circ$ | ⭐⭐⭐⭐⭐ Tuyệt đối (Game tự tính điểm qua logic client gốc) |
| **Auto Lore Quiz** | Dò tìm đáp án trong DB 50 câu, click mô phỏng chuột kèm delay $1-3$s | ⭐⭐⭐⭐⭐ Tuyệt đối (Spectate nhìn như người thật đang đọc đề) |
| **Silent-Aim Musket** | Metamethod Hooking `__namecall (Raycast)` + `__index (Mouse.Hit)` | ⭐⭐⭐⭐ Cực cao (Raycast hợp lệ từ nòng súng tới mục tiêu) |
| **Anti-Recoil Camera** | Giữ ổn định Pitch của `Camera.CFrame` khi cầm súng | ⭐⭐⭐⭐⭐ An toàn (Chỉ can thiệp góc nhìn phía client) |
| **Auto Cannon Reload** | Kích hoạt `Interaction.Event.unreliablePost` hoặc `CannonReloadModule` | ⭐⭐⭐⭐⭐ An toàn (Theo luồng nạp đạn chuẩn của game) |

---

## 🔎 3. Kế hoạch Nghiệm thu (Verification Status)

- [x] Cú pháp Luau chuẩn xác, không có lỗi runtime.
- [x] Tích hợp đầy đủ các Slider tùy biến tốc độ, dung sai, bán kính FOV.
- [x] Khử triệt để hiện tượng đạn bị giật lên trời hoặc lệch tâm do Recoil/Inaccuracy của súng hỏa mai.
