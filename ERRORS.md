# Error Log & Learning System

Dự án: Requiem (Eldia RPG / Titan Automation Suite)

---

## [2026-09-21 15:58] - Luna Interface Suite Load Failure (HTTP / Network Fallback)

- **Type**: Integration
- **Severity**: High
- **File**: `d:\Requiem\tools\requiem_luna_hub.luau:275`
- **Agent**: Jarvis
- **Root Cause**: Lệnh `game:HttpGet` trực tiếp tới URL `raw.githubusercontent.com` bị chặn/bóp băng thông bởi nhà mạng Việt Nam hoặc đường dẫn `refs/heads/master` không phản hồi trong Roblox executor, đồng thời `readfile` bị giới hạn trong thư mục workspace cục bộ của executor.
- **Error Message**: 
  ```
  [Requiem Hub] Không thể tải thư viện Luna Interface Suite! Vui lòng kiểm tra kết nối mạng hoặc đường dẫn file.
  ```
- **Fix Applied**:
  1. Thêm bản sao thư viện Luna Suite vào dự án tại `tools/modules/luna_source.luau`.
  2. Nâng cấp cơ chế nạp sang Multi-Tier CDN Failsafe: Ưu tiên jsDelivr CDN (`cdn.jsdelivr.net`), kết hợp GitHub raw của repository và fallback cục bộ.
  3. Bổ sung cơ chế in log chi tiết (`lastLoadErrors`) nếu toàn bộ nguồn thất bại thay vì nuốt lỗi.
- **Prevention**: Luôn cung cấp URL CDN dự phòng (như jsDelivr / Statically) khi nạp tài nguyên từ bên thứ ba trên Roblox Executor tại Việt Nam.
- **Status**: Fixed

---

## [2026-09-21 16:10] - Luau Reserved Keyword 'continue' Crash in Luna Suite loadstring

- **Type**: Syntax
- **Severity**: Critical
- **File**: `d:\Requiem\tools\modules\luna_source.luau:1692`
- **Agent**: Jarvis
- **Root Cause**: Mã nguồn gốc của Luna Interface Suite (từ Nebula Softworks) chứa đoạn mã BlurModule cũ có `local continue = IsNotNaN(...)`. Trong Luau hiện đại của Roblox, `continue` là từ khóa hệ thống (Reserved Keyword) dành riêng cho vòng lặp, khiến hàm `loadstring` trên mọi Roblox Executor báo lỗi cú pháp `Expected identifier when parsing variable name, got 'continue'` và trả về nil.
- **Error Message**: 
  ```
  [Requiem Hub] Không thể tải thư viện Luna Interface Suite!
  Loadstring failed: Expected identifier when parsing variable name, got 'continue'
  ```
- **Fix Applied**:
  1. Loại bỏ triệt để thân hàm `BlurModule` trong `tools/modules/luna_source.luau` (vừa triệt tiêu hoàn toàn lỗi cú pháp `continue`, vừa chống mờ màn hình người dùng).
  2. Vô hiệu hóa vòng lặp gọi liên tục `Players:GetFriendsAsync` trong `checkFriends` để chống lỗi `HTTP 429 Too Many Requests`.
  3. Cập nhật bộ lọc `sanitizeLunaSource` trong `requiem_luna_hub.luau` để tự động đổi `continue` thành `continueVar` nếu người dùng tải từ bất kỳ nguồn online bên ngoài nào.
- **Prevention**: Luôn kiểm tra tính tương thích từ khóa của Roblox Luau (`continue`, `export`, `type`) khi nhúng hoặc nạp các thư viện Lua 5.1/LuaJIT cũ từ cộng đồng.
- **Status**: Fixed

---
