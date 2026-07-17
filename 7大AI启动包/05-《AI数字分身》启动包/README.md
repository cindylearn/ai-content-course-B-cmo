# Skill · AI 数字人（工具：Higgsfield / Seedance）

> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**


**在系统里的工位：** 让一个「数字主播」替你出镜口播——不敢/不方便真人露脸也能做品牌口播、个人 IP、口播短视频。同时也是**跨分镜锁定同一个人**的技术核心。

## 两种用法

### 1. 主角本人 = 数字人（整支口播一致）
先出**一张人物参考图**（`generate_image`，9:16，锁脸/发型/衣着/场景），当每个分镜的 `image_references`，`seedance` 就能让 8 段视频**同一个人、同一套形象**、还能对上台词口型。
> 这就是「一个人讲 8 段」一致性的解法。

### 2. 画面里 show 一个数字主播（B-roll）
讲「AI 数字人」这个工具时，手机/屏幕铺满画面，里面是一个数字主播在讲。

## 🔴 踩坑 / 标准
- **数字人要「照片级真人」**：prompt 写 `PHOTOREAL, REALISTIC HUMAN presenter, a real-looking [本地] person talking to camera, NOT a cartoon, NOT a 3D avatar`。第一版出成卡通/塑料脸就是没写死这条。
- **人物一律本地** + 贴行业气质。
- 参考图要**具体到特征**（脸型/眼镜/衣着/痣/表），换镜不换人。
- 屏幕里的主播也**不要乱码字**。

## Prompt 骨架
```
generate_image: 一张 9:16 人物参考图，[受众 persona 具体特征] + [场景]
→ generate_video seedance_2_0, 9:16, generate_audio,
   medias=[{role:image_references, value:参考图job_id}],
   prompt=[同一套人物特征] + [该镜动作] + Saying:「台词」
```

## 接进系统
参考图 job_id 存好，整支视频复用 → 人物一致；数字主播镜头归到视频生产线（`7大AI启动包/04-《AI口播短视频》启动包`）。
