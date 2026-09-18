# Titan animation re-upload manifest

Nguồn đối chiếu: `src/ReplicatedStorage/Common/Animations/Titans.luau` của Requiem dump 2024.

Sau khi upload vào Scarlet, thay từng ID trong `D:\scarlet\src\ReplicatedStorage\Shared\Titans\Animations.luau` bằng ID mới. Giữ nguyên cấu trúc key; action code đã lookup theo các key này.

## Core / movement

| Key | Requiem source ID(s) |
|---|---|
| Downslam.Start / End | `127198877432080` / `117514738082057` |
| Dash.Start / End | `122040642524697` / `87861655747000` |
| Smash.Arm | `78380858052901` |
| Stomp.Left / Right | `127028936556401` / `105029023250330` |
| Mouth.Open / Chomp | `95997777051948` / `132411345488480` |
| Lunges.Left | `128370620835869` |
| Chewing | `118539634885238` |
| LongRangeAboveGrab | `135338316117173` |
| LongRangeAttackAir | `127857932477365` |
| LongRangeAttackGround | `87199352747485` |
| ShortRangeAttackGround | `137557642566996`, `79807870470249` |
| MediumRangeAttackGround | `111508788215614` |
| Trapped | `126801537503175` |

## Locomotion / state

| Key | Requiem source ID(s) |
|---|---|
| Idles | `98428851775328`, `105439298125202`, `101153968529196`, `112874586140841`, `129440424455208`, `130961698872478`, `134199797444221`, `72000978259631`, `90171943289522`, `138465633617709`, `123595942836156`, `77210455827516`, `91056377441816`, `125875427487911`, `85074124209864` |
| Stuns | `85807105242722`, `89723743152987`, `139113429027606`, `102357484816662`, `134356389412425` |
| Sleeps | `119043431539046`, `92795514143560`, `132330307762661`, `128270574163145`, `92758232418349` |
| Walks | `140316891408290`, `113003905215186`, `98204805605607`, `99705096541950`, `128226785281920` |
| Runs | `94859566811000`, `108579470300757`, `118288539531101`, `103181743486226`, `92898578055992`, `116817501070954`, `138041159547453`, `73164365796871`, `72197556886619`, `111230920998655`, `135292723721238`, `95338990684409`, `82677010326076` |
| Jumps | `91866332123690`, `103674282960577`, `121871653542021`, `90937269674308`, `108149328703884`, `82841655296232` |
| Clicker.Run | `134254437706633` |
| Ice.Walks | `140316891408290`, `113003905215186` |
| Ice.Idles | `98428851775328`, `105439298125202` |
| Deaths | `90040104467902`, `72926003257057`, `71028017021241`, `136342643925713` |

## Attacks, grabs and kicks

| Key | Requiem source ID(s) |
|---|---|
| MediumRangeBite.Right / Left | `99158762186667` / `125284277416841` |
| LongRangeBite.Right / Left | `89797832039833` / `136176959503942` |
| MediumRangeGrab.Right / Left | `72180201149498` / `105613450754242` |
| SidewaysGrab.Right / Left | `83959182693768` / `117878040011299` |
| ShortRangeSwat.Right / Left | `77483083534261` / `135960797402588` |
| ShortRangeGrab.Right / Left | `93916929623858` / `74117188628577` |
| ShortRangeFrontArmGrab.Right / Left | `97643219256036` / `124463473649107` |
| ShortRangeGrabLeg.Right / Left | `78662966195254` / `93004327399439` |
| LongRangeGrab.Right / Left | `97016819631864` / `132145672736993` |
| WideRangeGrab.Right | `118891384152531`, `111959123887976` |
| WideRangeGrab.Left | `89792317470241`, `114947392927302` |
| BackGrab.Right / Left | `115215726134288` / `114870892249594` |
| MediumRangeKick.Right / Left | `108782407133647` / `119139537002039` |
| LongRangeKick.Left / Right | `79132812249686` / `74361663996121` |
| Grabs.Nape.Right / Left | `130230322498062` / `79865411368428` |
| Swats.Front | `103985177785577` |
| Swats.Nape.Right / Left | `106427404834521` / `73744024218726` |
| Angry.Frenzy / Left / Right | `77813612645452` / `70574408029556` / `119319050839523` |

## Eating / reaction

| Key | Requiem source ID(s) |
|---|---|
| Eats.Left.Slow | `100174564330577`, `83151224663611`, `133506414206473` |
| Eats.Left.Medium | `78660561753509`, `129816957204480` |
| Eats.Left.Fast | `133145540906429`, `117335172537286` |
| Eats.Right.Slow | `91613851280115`, `102395689553826`, `86962345035543` |
| Eats.Right.Medium | `117227207886115`, `91629720063159` |
| Eats.Right.Fast | `96769735491031`, `127154239386306` |

## Ngoại lệ Scarlet

Requiem IDs của `Blinds`, `Armcuts` và `Legcuts` vẫn được giữ trong manifest dữ liệu để đối chiếu, nhưng runtime không dùng chúng. `Animations.SourcePolicy` tiếp tục trả `Scarlet` cho `DefaultTitanBlinded`, `DefaultTitanArmCut` và `DefaultTitanLegCut`, vì ba animation damage này phụ thuộc rig Scarlet.

`Eaten = 73386827069988` là animation phản ứng của player trong transaction ăn; nó không nằm trong bảng Titan animation dump nhưng được giữ trong module vì action eating của Scarlet cần một contract chung.

## Quy trình upload

1. Upload animation với owner/permission của experience Scarlet.
2. Thay số trong `Animations.luau`, giữ tiền tố `rbxassetid://`.
3. Không đổi tên key hoặc chuyển `Right`/`Left`; Kinematic/Hitbox chọn limb theo đúng nhánh này.
4. Kiểm tra marker và length của `ShortRangeAttackGround`, các `*Grab`, `*Bite`, `*Kick`, `Grabs.Nape` trước.
5. Bật debug action để xác nhận animation được chọn: `DebugTitanActions = true`, và nếu cần đặt `TitanDebugOnlyAction` thành tên action.
