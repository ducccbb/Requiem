# Deep audit ODMG Requiem → Scarlet

Ngày audit: 2026-07-20

## Kết luận

Port hiện tại **chưa đạt logic Requiem 100%**. Phần kéo cơ bản đã gần với bộ
Ejector hiện tại của Requiem, nhưng state machine bao quanh nó chưa được port
đủ. Lỗi lớn nhất không nằm ở một hằng số lực đơn lẻ mà nằm ở ownership/handoff:

1. Ejector Requiem phát state `SLIDING` khi đang grapple sát đất.
2. `CharacterMovementRunner` ghi nhớ `GearVelocity` và `GearGyro` nhưng không
   tạo lực cạnh tranh trong lúc `GRAPPLING`.
3. Khi grapple cuối được thả, Ejector bỏ parent hai mover của gear.
4. Slide runner clone vận tốc/gyro cuối sang `SlideGearVelocity` và
   `SlideGearGyro`, rồi tiếp tục coast.
5. LeftShift chuyển sang instant stop; Space sau 0,3 giây thực hiện point launch.

Scarlet hiện phá chuỗi này ở bước 2 và 3: `Sliding.luau` không được require, tạo
hoặc step, còn `_beginRelease()` gọi `SetSlidingState(false)` trước handoff. Vì
vậy việc không thấy momentum slide là kết quả tất yếu của code hiện tại.

Audit tự động semantic ghi nhận:

- 4 `CRITICAL`
- 18 `HIGH`
- 7 `MEDIUM`
- 1 `LOW`
- 2 `INFO`
- 1 `PASS`

Báo cáo máy đầy đủ nằm tại `docs/ODMG-DEEP-AUDIT-AUTOMATED.md` và JSON tương
ứng. Audit này không chỉnh source Scarlet.

## Source chuẩn được dùng

Logic movement hiện tại lấy từ:

- `D:\Requiem\src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Ejector\Default.luau`
- `D:\Requiem\src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Gyroscope\Default.luau`
- `D:\Requiem\src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Winches\Default.luau`
- `D:\Requiem\src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Housing\Default.luau`
- `D:\Requiem\src\ReplicatedStorage\Client\User\Character\CharacterMovementRunner.luau`
- `D:\Requiem\src\ReplicatedStorage\Common\Utilities\Raycast.luau`

Source 2024 chỉ dùng để audit `PlayerSlide` cũ:

- `C:\Users\ducsh\Downloads\requiem-main (1)\requiem-main\src\client\entities\player\movement\ClientSlideMovement.ts`

Hai version Ejector không cùng kiến trúc. Requiem 2024 dùng các ease
`speed/gas/power/direction/force`; bản hiện tại dùng velocity gain 55 giây,
reel boost và simulated momentum. Không thể gọi một implementation là “100%”
với cả hai version. Báo cáo này chọn Requiem hiện tại làm chuẩn cho ODMG và chỉ
giữ slide crouch 2024 như một feature độc lập.

## 1. Các lỗi critical

### C1 — Momentum slide là dead code

`Movement/Sliding.luau` có `SlideGearVelocity`, `SlideGearGyro`, coast và point
launch, nhưng `Movement/init.luau` chỉ require `Slacking`, `WallInteraction` và
`PlayerSlide`. Không có `Sliding.new`, `StepGrappling`, `BeginCoast` hoặc
`StepCoast` ở runtime.

Đây là lý do audit marker trước đây bị sai: sự tồn tại của file và tên
`SlideGearVelocity` không chứng minh code có thể chạy.

### C2 — Release xóa state trước handoff

Scarlet `_beginRelease()` gọi theo thứ tự:

```text
DetachGearPhysics → StopHang → SetSlidingState(false) → clear effects → release
```

Requiem cần giữ `SLIDING=true` qua biên release để slide runner lấy hai mover
cuối. Scarlet xóa state và effect trước khi bất kỳ coast controller nào có cơ
hội sở hữu physics.

### C3 — Không bridge state conflict sang Scarlet States

`SetSlidingState` và `SetWallState` chỉ ghi field trên object ODMG và phát
`RuntimeChanged`. Chúng không acquire/release state `GRAPPLING`, `SLIDING`,
`WALL_SLIDING`, `WALL_HANGING`.

Trong Requiem, những state này điều phối:

| State | Solver được sở hữu physics | Solver phải lùi |
|---|---|---|
| `GRAPPLING` | Ejector + Gyroscope | slide coast |
| `SLIDING` sau release | slide runner | normal humanoid movement |
| `WALL_SLIDING` | Housing | Ejector BodyVelocity |
| `WALL_HANGING` | anchored wall hang | Ejector và slide |
| `SWIMMING`/busy | water/action system | toàn bộ gear physics |

Không có state bridge thì các system Scarlet khác không thể biết ai đang sở hữu
root physics, dù nội bộ ODMG có một số `if` thủ công.

### C4 — “Slide” đang chạy là feature khác

`PlayerSlide.luau` là bản rút gọn của `ClientSlideMovement.ts` 2024: crouch slide
khởi động bằng LeftControl khi không grapple. Nó **không phải** momentum slide
của gear hiện tại.

Port hiện tại vừa bỏ mất slide hiện tại, vừa chỉ port một phần slide 2024.

## 2. Những phần thiếu hoặc sai hành vi mức cao

### 2.1 Slide hiện tại của Requiem

Các nhánh đã viết nhưng chưa nối:

- Capture `GearVelocity/GearGyro` khi sát đất trong lúc grappling.
- Handoff sang `SlideGearVelocity/SlideGearGyro` sau release.
- Coast decay theo `GearGroundSlidingLength * 0.8`.
- Dừng khi tốc độ dưới 50.
- LeftShift instant stop với recovery animation, WalkSpeed và FOV lease.
- Space point launch sau 0,3 giây, tiêu tốn 60 gas.
- Launch speed: cap 150, multiplier `max(2, speed/50)`, ngang `95`, dọc `60`.
- Launch animation từ `Gear.Launches`.
- Replicated effect `Dash`.
- State `TURBINE` trong 0,7 giây.
- JumpPower bị khóa trong slide và cleanup khi state kết thúc.

`Sliding.luau` hiện có phần physics và các số point launch, nhưng thiếu input,
animation, effect, state/FOV/walk/jump lifecycle; quan trọng hơn, file không chạy.

### 2.2 PlayerSlide 2024 chỉ được port một phần

Scarlet đã có ray slope, obstacle, velocity `1.3x`, decay và stop dưới 12. Các
phần còn thiếu/sai:

- Không kiểm tra sprint thật; `WalkSpeed >= 14` không tương đương
  `ClientSprintMovement.isSprinting`.
- Không chặn BUSY và COMBAT category.
- Không subscribe stunned để cancel.
- Không có slide jump, `SLIDE_JUMP` animation và FOV +20.
- Không publish busy/sliding state lease.
- Scarlet dừng slide khi nhả LeftControl; source 2024 chỉ xử lý input `Begin`.
- Controller chỉ tồn tại khi ODMG đang equip, trong khi bản 2024 là player
  movement runner độc lập.

### 2.3 Release momentum

Nhánh high-speed đã mang các số quan trọng `0.65`, terminal `-200`, delay 1 giây,
fade 1,85 giây, tổng 2,85 giây và spherecast `2.5/4`. Tuy nhiên:

- Low-speed Requiem tween `BodyForce.Force` từ `gravity * 2` về zero trong
  1,5 giây. Scarlet giữ lực cố định đủ 1,5 giây rồi destroy, tạo lift quá mạnh.
- Spherecast thiếu `CollisionGroup = "Universal"`.
- Thiếu guard swimming, water touching, `no_physics`, gear busy và cleanup
  tương ứng.
- `ClearPhysics()` không đặt `_release=nil`; release cũ có thể chạy lại sau khi
  ragdoll/grab/NoMovement tạm thời kết thúc.
- `_gasAccumulator` không được xóa khi goal/release/cleanup đổi nhánh, nên phần
  gas chưa flush có thể bị trừ vào lần grapple tiếp theo.

Điều kiện horizontal trong source decompile hiện tại có một nhánh đảo khó tin
(`1 >= horizontal.Magnitude`). Không nên “sửa theo chữ decompile” ở nhánh này;
cần trace runtime Requiem/Studio để chốt. Các mismatch ở trên không phụ thuộc
vào đoạn decompile mơ hồ đó.

### 2.4 Input và conflict

- Boost được set ngay từ keybind Space dù không có grapple. Vì Space cũng là
  wall-run, Scarlet có thể bật GasPart, phát gas sound và giữ `_boosting=true`
  trong wall-run. Requiem chỉ cập nhật boost effect trong goal branch.
- Khi suppression gọi `ClearPhysics`, Scarlet reset boost/reel/slack request.
  Nếu người chơi vẫn giữ phím, không có `InputBegan` mới để khôi phục. Requiem
  đọc gas key trực tiếp mỗi gear frame và giữ các state cần thiết qua nhánh tạm.
- Thiếu `Toggle Reeling` và `Toggle Slacking`.
- Thiếu Reeling/ReelingEnd sound và orbit-direction sound.
- Legacy Scarlet double-tap A/D vẫn gọi `ODMG:Dash`. Sau adapter, `Velocity()`
  trả `GearVelocity` chưa được parent trong `Dash`, nên nhánh này vừa không còn
  đúng Requiem vừa có thể không tạo lực.
- `AdjustMomentum()` legacy vẫn chạy mỗi frame nhưng movement mới không đọc
  `self.Momentum`.

### 2.5 Effect không xuất hiện

Code tìm các object tên `MovementParticle`, `EjectorParticle` và
`SlideParticle`. Inventory của `D:\scarlet\scarlet.rbxl` chỉ xác nhận
`GasPart`; không có string `MovementParticle` hoặc `SlideParticle`.

Kết quả:

- Gas boost còn có fallback Scarlet `GasPart.Attachment.Boost3` và
  `GasPart.Gas`.
- Normal grapple effect không có asset target để bật.
- Ground/momentum slide effect không có asset target để bật.
- Point launch cũng thiếu `Effects.sendReplicatedEffect("Dash")`.

Nếu Studio đang có asset mới chưa save về `scarlet.rbxl`, cần kiểm lại live tree;
source-controlled build hiện tại vẫn chưa có contract đảm bảo các asset này tồn
tại hoặc được attach vào character.

### 2.6 Animation chưa faithful

Các ID fallback đúng đã có cho ground slide, orbit action/default idle, wall run
và hang. Nhưng loop hiện tại chỉ thêm fallback khi Scarlet package chưa có cùng
tên. Do đó animation Scarlet cũ vẫn thắng animation Requiem.

Các asset/nhánh movement hiện tại còn thiếu:

- `Forward`: `92644101274615`.
- Left grapple idle boosting: `76656511162291`.
- Right grapple idle boosting: `111466842883640`.
- Launches, gồm `98227138288925` và `108398223984723`.
- Recovery: `120620528209768`.

Movement còn gọi generic `Idle` thay vì lifecycle `Forward` rồi idle variant
`Left/Right + Default/Boosting` như Requiem.

### 2.7 Wall hang và raycast parameters

Wall-run constants chính đã khớp. Wall-hang grid thì chưa:

| Thành phần | Requiem | Scarlet hiện tại |
|---|---:|---:|
| X source grid | `-1.2..1.2`, step `1` | `{-0.6, 0.6}` |
| Y source grid | `0..5`, step `2` | `{0, 2.5}` |
| Spacing | `0.5` | đã bake vào offset |
| Tổng ray thực tế | 9 | 4 |
| Số hit tối thiểu | 4/9 | 4/4 |
| Ray length | 15 | 15 |

Scarlet vì vậy yêu cầu cả bốn ray đều hit và dùng vùng sample khác, dễ làm wall
hang fail trên cạnh/góc. Normal còn bị normalize trong Scarlet trong khi utility
Requiem trả average normal.

Ngoài ra Scarlet đặt `RespectCanCollide=true` cho ground/wall/slide raycasts;
các raycast được audit của Requiem không set field này, tức dùng mặc định false.
Điều này thay đổi việc nhận diện part `CanQuery=true`, `CanCollide=false`.

Wall-run slowdown Scarlet là linear thủ công. Requiem dùng Tween/default easing
cho BodyVelocity P và number easing cho speed, nên curve chưa giống hoàn toàn.

### 2.8 Slacking

Phần lõi đã đúng: một `RodConstraint`, initial length `distance * 0.9`, target
15, thời gian 30 giây và goal trung bình khi hai grapple hợp lệ.

Khác biệt còn lại:

- Requiem hỗ trợ Toggle Slacking; Scarlet chỉ hold.
- Requiem keybind chỉ bind khi có grapple; Scarlet multiplex LeftControl với
  PlayerSlide trong ODMG.
- Scarlet ép tắt boost và xóa reeling request khi bắt đầu slack; Requiem giữ
  state input riêng và Ejector chỉ nhường BodyVelocity. Sau khi bỏ slack, Scarlet
  không tự phục hồi reeling/boost dù phím còn giữ.
- Requiem expression `elapsed / 30` không clamp; Scarlet clamp alpha 0..1. Đây
  là thay đổi an toàn nhưng không phải hành vi 100% nếu giữ cả bug gốc.
- Side attach/release khi đang slack chưa có event-driven length refresh giống
  `updateSlackingRope()`.

## 3. Formula nào đã đúng

Trong policy neutral multiplier đã khóa trước đây, các phần sau được port khá
sát Requiem hiện tại:

- `BASE_SPEED = 60`.
- `BASE_GAS_BOOST = 40`.
- `MAX_VELOCITY_BASE_SPEED_MULTIPLIER = 1.3`.
- `MAXIMUM_VELOCITY_MULTIPLIER = 1.65`.
- Velocity gain time `55`, gas gain time `1`.
- Reel `15→30`; gas reel `10→15`; gas/reel gain multiplier `1.5`.
- BodyVelocity `P=1000`; BodyGyro `P=10000`, `D=500`.
- Response toward desired velocity: `0.05`, reeling `0.3`, close goal `0.15`,
  sau đó exponential response `*165`.
- Upward goal cộng `Y=5`.
- Gas neutral `6/s`, boost tổng `18/s`.
- Grapple goal trung bình hai bên và không kéo side còn ở cast easing.
- Wall-run constants chính (grid, speed, cooldown, force, kick) khớp config
  Housing hiện tại.
- Slacking core parameters `0.9 / 15 / 30` khớp Winches hiện tại.

Orbit direction magnitude và cách cộng vào goal cơ bản đúng, nhưng turn alpha
chưa đúng. Requiem dùng:

```text
clamp(lerp(0.0175, 0.03, clamp(velocityGain/15)) * 240 * dt, 0, 1)
```

Scarlet dùng cố định `ORBIT_DIRECTION_RESPONSE * dt = 10 * dt`, nhanh hơn curve
Requiem và không phụ thuộc velocity gain.

## 4. Những phần cố ý chưa port

Theo policy đã khóa trước đây, progression/tinker/enchantment được neutral hóa.
Vì vậy các nhánh sau không được tính là regression ngoài ý muốn, nhưng đồng
nghĩa “100%” chỉ đúng trong neutral policy:

- Component level và tinker modifiers.
- Downward Surge, Terminator, Double Time, Pacifist/bladeless, Overtuned.
- Gear velocity/time/max multipliers từ progression.
- Tether Control W/S đặc biệt.

Ngoài ra Scarlet grapple raycast hiện loại toàn bộ player character, nên PvP
mutual grapple, jousting slowdown và PvP turn reduction của Requiem không thể
được kích hoạt. Đây là incompatibility ngoài progression và phải được quyết
định riêng nếu yêu cầu exact PvP.

## 5. Thứ tự sửa đúng

1. Bridge các state lease và xây một owner state machine duy nhất.
2. Wire `Sliding` vào Ejector: capture khi grappling sát đất, preserve state ở
   release, handoff mover, coast/stop/launch, cleanup.
3. Thêm slide effects, launch/recovery animation và Dash effect adapter.
4. Tách requested input khỏi effective boost/reel/slack; gate boost bằng goal và
   thêm toggle/audio lifecycle.
5. Sửa low-speed release tween, guards, collision group và cleanup `_release`.
6. Sửa wall-hang grid/raycast semantics và wall-run easing/state guards.
7. Hoàn thiện hoặc tách hẳn PlayerSlide 2024 thành player movement runner.
8. Xóa/disable legacy Dash và dead `AdjustMomentum` sau khi xác nhận không còn
   caller ngoài scope.
9. Chỉ sau đó cân chỉnh orbit curve và thực hiện Studio trace cho đoạn release
   decompile mơ hồ.

## 6. Gate Play Test bắt buộc

Momentum slide chỉ được coi là đạt khi trace mỗi frame cho thấy:

```text
grapple sát đất:
  GearVelocity parent=yes, SlideGearVelocity=no, Sliding=true, Grappling=true

release grapple cuối:
  GearVelocity parent=no, SlideGearVelocity=yes, Sliding=true, Grappling=false

speed < 50 / rời mặt đất / swimming:
  SlideGearVelocity=no, SlideGearGyro=no, Sliding=false
```

Các case còn lại:

- LeftShift khi coast thực hiện recovery/instant stop.
- Space trước 0,3 giây không launch; sau 0,3 giây trừ đúng 60 gas và phát Dash.
- Space không grapple không phát gas boost sound/particle.
- Low-speed release BodyForce giảm liên tục về zero, không giữ lực phẳng.
- Ragdoll/grab/NoMovement giữa release không làm momentum cũ quay lại.
- Wall hang pass với 4/9 ray, không đòi 4/4.
- Respawn/equip/unequip không để lại mover, constraint, animation, FOV hoặc
  state lease.

## 7. Audit tool

Tool semantic mới:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  D:\Requiem\tools\odmg-deep-audit.ps1 `
  -OutputPath docs\ODMG-DEEP-AUDIT-AUTOMATED.md `
  -JsonPath docs\ODMG-DEEP-AUDIT-AUTOMATED.json `
  -Strict
```

`-Strict` fail nếu còn `CRITICAL` hoặc `HIGH`. Tool cũ vẫn hữu ích cho inventory
và marker cơ bản, nhưng không được dùng làm cổng nghiệm thu semantic.
