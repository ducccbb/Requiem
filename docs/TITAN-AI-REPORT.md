# Báo Cáo Chuyên Sâu: Trí Tuệ Nhân Tạo (AI) Của Hệ Thống Requiem Titan

> **Mục tiêu**: Phân tích logic AI cốt lõi để chuẩn bị port 100% sang hệ thống mới.
> **Trạng thái hệ thống cũ của bạn (`d:\Titan`)**: Rất lỗi thời (Monolithic Server-side). Gộp tất cả vào 1 file `TitanMain.server.luau` (34KB) gây giật lag server, khó mở rộng (scale) và không có khả năng Client-Prediction.

---

## 1. 🧠 Mô Hình Mạng Của AI (Network Model)
Requiem **KHÔNG CHẠY AI TÌM MỒI Ở SERVER**. Mô hình của nó là **Client-Authoritative Prediction**:
- **Tại sao?** Game di chuyển bằng dây Grapple quá nhanh. Nếu đợi Server phán xét thì Titan vồ sẽ toàn bị trượt do độ trễ mạng (Ping).
- **Cách hoạt động**:
  1. Máy tính của mỗi người chơi sẽ tự thu thập các con Titan đứng gần mình.
  2. Máy tính sẽ tự chạy thuật toán: *"Titan này có vồ trúng mình được không?"*
  3. Nếu tính ra là CÓ ➔ Client nộp đơn lên Server: *"Con Titan ID 5 cắn tôi, xử lý đi!"*.
  4. Server chỉ việc phê duyệt và phát lệnh (Broadcast) cho các máy khác render hoạt ảnh.

---

## 2. ⏱️ Bộ Lọc Hiệu Năng & Tối Ưu Tần Số (Action Budget & LOD)
Để Client không bị quá tải khi có 100 con Titan, AI áp dụng cơ chế **LOD (Level of Detail)**:

| Khoảng cách (Studs) | Tần suất nghĩ (Throttle) | Hành động |
|---|---|---|
| ≤ 600 (Near) | **0s (Mỗi khung hình)** | AI hoạt động toàn công suất, theo dõi liên tục. |
| ≤ 1200 (Mid) | **1.5s / lần** | Chỉ check xem có ai lại gần không. Tắt các vòng lặp nặng. |
| > 1200 (Idle) | **8s / lần** | Đóng băng gần như hoàn toàn. |

**Luật Action Budget**:
Bất kể có bao nhiêu Titan ở gần (Near), hệ thống ép buộc **chỉ có tối đa 3 con Titan được phép chạy vòng lặp suy nghĩ (AI Loop) trong cùng 1 khung hình (RenderStepped)**. Con thứ 4 sẽ bị đẩy sang khung hình tiếp theo để tính toán.

---

## 3. 🎯 Vòng Lặp Ra Quyết Định Của AI (Decision Loop)
Đây là trái tim của AI (nằm ở `DefaultTitanClient.luau`). Nó không dùng IF/ELSE dài dằng dặc như `TitanMain.server.luau` của bạn, mà dùng cấu trúc **Mô-đun Hóa (Modular Actions)**.

### Cấu trúc 1 File Đòn Đánh (VD: `ShortRangeGrab.luau`)
Mỗi đòn đánh là 1 file độc lập, bắt buộc phải trả về bảng (table) sau:
```lua
return {
    priority = 1,                 -- Ưu tiên càng nhỏ càng cao
    engageRangeStuds = 120,       -- Tầm đánh
    
    -- AI sẽ gọi hàm này ĐẦU TIÊN để hỏi "Có nên dùng chiêu này không?"
    attempt = function(titan, playerDistance, attributeValue)
        -- Kiểm tra cooldown, kiểm tra DetectionBox (dự đoán đường bay)
        return true -- Nếu thoả mãn, lập tức xin phép Server
    end,
    
    -- Nếu Server ĐỒNG Ý, hàm này mới được chạy
    execute = function(titan, cleanup, seed, respond, ...)
        -- Phát âm thanh vồ mồi
        -- Bật Hitbox tàng hình lên tay
        -- Phát Animation vồ
    end,
}
```

### Cách AI chọn chiêu (Action Selection):
Mỗi khung hình, AI thực hiện các bước sau để chọn ra 1 đòn đánh:
1. **Check Cooldown Khóa**: Nếu Titan đang ăn (`"eating"`), bị mù (`"blinded"`), đang chết (`"dying"`) ➔ Hủy suy nghĩ.
2. **Check Đặc tính (Attributes)**: Titan có các tính cách như `Anger` (Tức giận) hoặc `Idiocy` (Ngu ngốc). AI sẽ nạp các chiêu thức của bộ `Anger` vào trước.
3. **Sort và Duyệt**: AI sắp xếp các chiêu theo `priority` (ưu tiên). Nó chạy hàm `attempt()` của từng chiêu từ trên xuống dưới.
4. **Fallback (Phương án B)**: Nếu không có chiêu `Anger` nào trúng, nó sẽ tự động lùi về kho chiêu thức `Default` (Bộ chiêu mặc định gồm 25 chiêu như Vồ ngắn, Vồ xa, Đá, Giậm chân).
5. **Quyết Định Cuối Cùng**: Chiêu nào có `attempt() == true` đầu tiên ➔ AI chốt chiêu đó và gửi lên Server. Các chiêu bên dưới bị bỏ qua.

---

## 4. 🔮 Thuật Toán Dự Đoán Điểm Rơi (Detection & Impact Time)
Thay vì dùng Magnitude check khoảng cách đơn thuần, Requiem dùng AI Dự đoán:
- AI đọc chỉ số `impactAt` của đòn đánh (Ví dụ đòn Vồ Ngắn mất `0.32` giây để tay vươn tới đích).
- Nó tính toán vector vận tốc (Velocity) hiện tại của người chơi.
- Nó kiểm tra xem người chơi có đang bám dây (Reeling) hay không để tính lực kéo Parabol.
- Sau đó nội suy: **"Vào đúng 0.32 giây nữa trong tương lai, người chơi có lọt vào hộp va chạm (Detection Box) này không?"**. Nếu có ➔ Tung đòn. Điều này tạo ra những cú vồ chuẩn xác như "đọc suy nghĩ" người chơi.

---

## 5. Kế Hoạch Chuyển Đổi (Migration Plan) cho Dự Án Của Bạn

Hệ thống cũ của bạn (`d:\Titan`) là một tệp Server nguyên khối. Để lên đời giống hệt Requiem, chúng ta cần:

1. **Xóa sổ `TitanMain.server.luau`**: Phá nó ra thành các module.
2. **Tạo Hệ Thống Mạng (Networking)**: Xây dựng các sự kiện (RemoteEvents) cho `Titan.Create`, `Titan.Action`, `Titan.Respond`.
3. **Dựng Khung Client-Side (Client Architecture)**: Viết lại Handler trên Client để quản lý `RenderStepped` và `Throttle` (Giới hạn hiệu năng).
4. **Bóc Tách Chiêu Thức**: Biến các đoạn `if distance < 10 then vồ()` của bạn thành các file module độc lập (`ShortRangeGrab.luau`, v.v.) có chứa `attempt` và `execute`.
5. **Xây Dựng Hitbox Rời**: Di dời tính toán va chạm từ Server (.Touched) xuống Client bằng Raycast và DetectionBox.

*(Tài liệu này đã sẵn sàng để làm bản thiết kế (Blueprint) cho việc code lại AI của Titan).*
