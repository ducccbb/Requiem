# Deep audit: Requiem Titan -> Scarlet

Ngay audit: 2026-07-20

## Ket qua hien tai

Da doi chieu 11 Utilities, Default/Anger/Idiocy actions, client registry/scheduler, animation transport, Protocol va server grab transaction. Audit tinh lan cuoi bang `tools/titan-deep-audit-v2.ps1`:

| Muc | Ket qua |
|---|---:|
| CRITICAL | 0 |
| HIGH | 0 |
| MEDIUM | 0 |
| LOW | 0 |
| PASS | 164 |

Day la ket qua static semantic audit, khong phai xac nhan runtime trong Roblox Studio. Chua co Rojo/Luau CLI trong moi truong nay, vi vay cac marker animation, `.Touched`, IK, collision group va timing ping can test truc tiep trong Studio.

## Da sua trong dot audit nay

- Detection resolver ho tro ca `Hitboxes/Detections/Lookup` + `Hitboxes/HumanoidRootPart` va layout Requiem co reference nam trong `Detections`.
- Detection prediction co curved prediction, reeling goal prediction, ping buffer, three-sample impact window, batch cache theo frame va debug outer/inner/prediction points trong Studio.
- Limb hitbox da tro ve mo hinh Requiem: auxiliary `Part` weld vao limb dang animate, `CanTouch=true`, `CanQuery=false`, `Massless=true`, `.Touched`, debounce/delayed/priority va cleanup connection/instance.
- Wire branch dung raycast vao visual Titan, resistance/Deep Hooks, ungrapple, velocity, ragdoll, concussion, sounds, shake va Monologue.
- Visual Titan giu `CanQuery=true` de raycast thay pose animation; auxiliary hitbox moi la phan xu ly touch.
- Server response khong con fallback accept tuyet doi; physical validation phai gan dung mouth/foot/hand/arm. `responseEpoch` chi consume sau khi handler tra `true`.
- Server physical validation va grab weld resolve canonical rig point qua `RigMap`, tranh loi `Mouth`/`Eyes` la Weld hoac Attachment thay vi BasePart.
- Grab server co target ownership map, cleanup khi humanoid death, character removal, PlayerRemoving va cancel/despawn.
- Core reaction cooldown 20 giay khong bi action cleanup xoa som.
- Kinematic LookAt/Bite defaults da dat lai theo Requiem; normal grab khong bi gan generic IK.
- Crush va GrappleJumpShake ragdoll da dung 5 giay; landing co preset shake rieng.
- Cac action grapple hit checks va crush raycast ho tro ca authoritative/server model va Scarlet client visual.
- Prediction runner da duoc doi sang phan tich delta-vi-tri theo cua so 0.5 giay, weighted velocity, angular velocity/curve direction va fixed-step integration 0.016s; van giu guard teleport/NaN va cache theo frame.
- Detection tach ro bon mode `free_curve`, `gear_linear`, `gear_reel` va `gear_orbit`; nhanh khong grapple khong bi tinh nham nhu orbit.
- Model visual khong con clamp root translation moi frame trong attack; chi chan transform bat thuong lon, tranh lam ngan tam voi va lam bien dang tay.
- LongRangeAboveGrab khong con bat buoc detection tra lateral side cho mot don hai tay; mouth response chi gui joint token, khong gui Instance cua client visual qua RemoteEvent.
- Grab reset phuc hoi collision cho moi Titan dang bi danh dau grabbed, tranh de lai visual bi CanCollide=false sau respawn.
- Runtime Gear facade co fallback cho snapshot partial trong respawn/gear replacement; Protocol luu va kiem tra `targetUserId` cua action response, tranh client khac hoan tat transaction.
- Client legacy khong con register lai Titan `Normal` khi Requiem runtime dang quan ly variant `Default`; loai bo hai model/Animator/IK cung chay tren mot Titan.
- Audit tool doc truc tiep 30 action Requiem de so detection `box/impactAt`, cooldown chinh va random threshold voi file Scarlet; wrapper `Common.createBite` cung duoc kiem tra theo implementation chung.
- Registry dong bo `targetUserId`; chi client dang la Enemy cua Titan moi chay local action chooser, cac observer chi dong bo visual va khong spam action intent.
- Khong destroy mouth hitbox dong bo sau `Signal:Fire()`; Scarlet Signal tach callback bang `task.spawn`, nen bite callback co the gui response truoc khi lifecycle cleanup huy hitbox.
- Bo sung asset contract `Animations.Requiem.Eaten` cho player reaction trong `DefaultTitanChewing`; truoc day reference nay la `nil`.
- Sua lifetime cua `LongRangeBite` ve cong thuc Requiem `0.833 / animationSpeed`; ban cu bi chia `/1.05` hai lan lam cua so bite ngan hon source.
- Movement sound policy va wire sound fade/volume/playback da duoc kiem theo action contract, khong con ap dung random playback cho cac action source dung plain/none.
- Nape actions khong con dung `RigMap` fallback `Nape -> Head`; `NapeGrabAttack`, `BackGrab` va `NapeGrabSwats` chi chap nhan diem `UpperTorso.Nape`, tranh danh nape som tai dau.
- Them action trace Studio co the bat bang attribute `ReplicatedStorage.DebugTitanActions = true`; trace ghi distance, action bi reject/ly do, action selected va commit epoch. Co them `TitanDebugOnlyAction` va `TitanDebugBypassRandomRejects` cho test cuc bo trong Studio.
- Hitbox RenderStepped runner giu ownership theo local connection; record tu destroy trong callback khong con co the dan den `heartbeat` nil/replaced roi goi `Disconnect()`.
- Server Titans dang ky `Runtime` bang `Distributor:GetModule("Runtime")` trong `Initalization`, sau do lay dependency da resolve bang `Distributor:GetModules()` trong `Start`. Day la contract thuc cua Scarlet Distributor; `GetModule()` chi co side effect dang ky va khong tra module.
- Them `Runtime/RagdollService` adapter lease-based de noi `RuntimeServer.Ragdoll:Acquire/Release` vao `Individual.Character.Ragdoll`; giu server lam noi tao/xoa constraint va cleanup theo player.

## Cac diem van can runtime test

1. **Asset va rig**: kiem tra `Lookup` box, `HumanoidRootPart`, `RigMap` va cac ten `LeftHand/RightHand/LowerArm/Foot` tren rig Scarlet that.
2. **Touched**: mot client chay vao auxiliary limb hitbox phai tao response dung mot lan; kiem tra collision groups co cho phep touch hay khong.
3. **Animation**: kiem tra animation reupload co `Length`, marker `Up`/`Down`, toc do va server-time offset dung. Neu marker khac ten, GrappleJumpShake se khong ap dung vertical impulse.
4. **Kinematic**: test LongRangeBite/BiteAim rieng; khong dung IK generic cho normal grab. Can calibration them neu rig Scarlet la R6 hoac chain Motor6D khac.
5. **Prediction/ODMG**: test dung yen, linear, orbit, reeling, slacking, teleport va respawn; bat tat attr `ReplicatedStorage.ShowTitanPredictionBoxes` de quan ly debug geometry.
6. **Server security**: test response sai limb, response lap, sequence cu, rate limit, hai Titan tranh cung player, player death/removal va titan despawn.
7. **Action policy**: server hien damage non-grab la 100 theo policy Scarlet; neu game muon damage rieng theo action thi can them bang config/validator, khong nen hard-code tiep.

## Chuoi normal grab can quan sat

`DetectionBox -> action attempt -> animation -> welded limb .Touched -> ActionResponse -> server physical validation -> grab transaction -> Eating/Chewing -> cleanup`

Kinematic khong nam tren duong normal grab trong source Requiem hien tai; no chi can cho BiteAim/nhung action that su dung IK. Neu animation chay nhung khong bat player, uu tien xem theo thu tu: Detection box, limb auxiliary hitbox/CanTouch/collision group, `.Touched` filter, response epoch/server validator, sau cung moi xem IK.

## Cach chay lai audit

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\titan-deep-audit-v2.ps1 `
  -ScarletRoot D:\scarlet `
  -RequiemRoot D:\Requiem `
  -OutputPath .\docs\TITAN-DEEP-AUDIT.md `
  -JsonPath .\docs\TITAN-DEEP-AUDIT.json
```

File JSON/Markdown sinh tu script la checklist tu dong; report nay bo sung phan giai thich va gioi han cua static audit.
