# Skill · AI 影片（工具：Higgsfield / Seedance）

> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**

> 🔴 **底层三层（跟 SKILL.md 一致，这一包出的每样东西都要套）：① 说服（大师：**Blair Warren 为客户处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte 客户是英雄）· ② 语言（NLP：换框/未来预演/连续肯定/锚定）· ③ 动机（6 大人性需求：确定/新鲜/重要/爱与连接/成长/贡献）。做完要能说出「这套了哪个大师 + 哪个 NLP + 戳哪个人性需求」——说不出 = 只做了表面，重来。**



**在系统里的工位：** 把脚本变成完整口播短视频 —— 视频生产线的核心（数字人见 `7大AI启动包/05-《AI数字分身》启动包`，音乐见 `7大AI启动包/07-《AI品牌配乐》启动包`）。

> 🔴 **先分两条路线**（跟院长 slide 一致，脚本角度完全不同）：
> - **个人 IP / AI 数字人口播**：你（或数字分身）出镜讲观点/方法，建立个人影响力——台词是「你的主张」，靠持续 + 独特观点。
> - **卖产品 / 服务影片广告**：推货/服务成交——台词是「痛点→产品价值→证据→CTA」，B-roll show 产品/成品/使用场景。

## 🔴🔴 开工前硬闸门：先有完整脚本，才做口播视频

**不该「视频」「声音」分开做 —— 口播视频 = 一个完整脚本长出来的。** 没脚本就生成 = 东一句西一句、人物/台词跑偏。

- 🔴 **先查 Notion**：内容矩阵里这条内容，有没有**完整分镜脚本**（一 shot 一 row：镜号/类型 · Prompt · 台词 · 平台）？
  - **没有 → 做不了，先回 `02 AI文案` 把脚本写完整**（8 分镜 + 每镜台词 + 每镜画面 prompt），进 Notion 表，再回来。
- 🔴 **脚本里已经给好角色的 prompt**（每个口播镜重复完整 persona）—— 你**不用重新设计人物**。
- 🔴 **开工只问几个关键 info，确保脚本/prompt 不跑偏**（一题一张选项卡）：
  1. **主角形象**（跟脚本 persona 一致吗？男/女 · 气质 · 本地人）
  2. **说话语言**（中文 / 中英混 / 英文 / 方言）
  3. **有真人本尊出镜吗？** 有 → 用他 3 张脸参考图；**没有 → 先去 `05 AI数字人` 做一个数字人**，拿到参考图再回来。
- 确认这几点 → 脚本 + 角色 prompt 都齐了 → 才进下面的流水线生成。

---

## 流水线
```
✅ 完整脚本(Notion) + 角色参考图 → seedance 逐镜生成
              → 抽帧验证 → 拼接完整版 → 后期剪辑(字幕/音效/BGM)
```
1. **脚本已在 Notion 表**（上面的硬闸门已确认）：镜号/类型 · Prompt · 台词 · 平台。整支约 60–100s。
2. **人物参考图**：有真人 → 他 3 张脸参考图；没真人 → 从 `05 AI数字人` 拿数字人参考图（九宫格选人的机制见下面 §0，但**决定用什么方式做数字人在 05**）。
3. **锁人物（口播镜）**：用 **3 张脸参考图**（正脸+不同角度更稳）当 `image_references`，每个真人镜 prompt **重复完整 persona 描述** → 全片同一个人。
4. **逐镜生成**：`seedance_2_0` · `9:16` · 每镜 4–15s。
5. **验证 + 拼接**：抽帧检查（无 ffmpeg 用 `imageio_ffmpeg`）→ 统一参数 → concat 完整版。
6. **后期剪辑**：字幕 / 花字 / 音效 / BGM → 见「AI 剪片」段 + 本包两份配套文档。

---

## §0. 人物从哪来（没有真人的时候）

第 3 步要「3 张脸参考图」——**但如果你没有真人可拍，那张脸从哪来？** 这一节答的就是这个。

> 🔴 **两步，中间必须停下来等你选。** 别让 AI 一口气跑完——脸没锁死，后面每一镜都会跑样，整支重做。

### 0a. 九宫格选人（一张图，9 个不同的人）

让 Claude 直接生成（`generate_image`，1:1 正方）：

```
A single square 1:1 casting board arranged as a clean 3x3 grid of 9 passport-style
headshots of 9 DIFFERENT [目标市场] [men/women], all [age range] with a [vibe] look.
IMPORTANT: each of the 9 is a DIFFERENT individual with a DIFFERENT face — different
face shape, eyes, nose, eyebrows, lips, jawline, skin tone and hairstyle. They must
NOT look like the same person; do not reuse one face with different hair. Every cell:
head-and-shoulders, front-facing, neutral friendly expression, pure white background,
even soft lighting, consistent framing. Place a small clean number (1 to 9) in the
TOP-LEFT corner of each cell.
<真实感条款>
The 9 people:
1 — [脸1：脸型/眼/鼻/眉/唇/肤色/发型]
2 — [脸2：…]   3 — […]   4 — […]   5 — […]   6 — […]   7 — […]   8 — […]   9 — […]
```

- 🔴 **9 个不同的人，不是同一张脸换 9 个发型**——这是最容易出错的一条。**先把五官写死再写头发**，模型才不会偷懒。
- 🔴 **9 张脸的清单要写出来给你看**，你才知道几号是谁。
- ⏸️ **停。等你回一个号码（1–9）。** 只能选 1 个。

### 0b. 定妆照锁脸（把那张脸钉死）

拿到号码后，**把九宫格原图当参考图一起送回去**，prompt 里**点名号码**——这才是锁脸的关键：

```
Using the attached 3x3 casting grid image as reference, recreate the EXACT same person
shown in CELL NUMBER [N] (the headshot labelled "[N]" in its top-left corner). Keep that
person's identity unchanged — same face shape, eyes, nose, eyebrows, lips, jawline, skin
tone and hairstyle as cell [N]; do not blend with the other faces.
[把 [N] 号那张脸的五官原样重述一遍] [气质] [服装]. Pure white background, front-facing,
neutral friendly expression, head-and-shoulders framing.
<真实感条款>
```

- 🔴 **不点名号码 = 模型会把 9 张脸糊在一起**，出来是个「平均脸」，跟你选的那个不是同一个人。
- 建议再出**不同角度各一张**（正脸 + 侧一点 + 微笑）→ 正好凑够第 3 步要的 **3 张脸参考图**。

### 0c. 真实感条款（0a / 0b / 每一镜都要带）

```
candid photo shot on a real camera (50mm, f/2.8), natural realistic skin texture with
visible pores, fine lines and subtle imperfections, natural facial asymmetry, true-to-life
natural lighting, slight film grain, documentary realism, looks like a real unretouched
photo of a real person, NOT AI-generated, no CGI, no 3D render, no plastic or
over-smoothed skin, no waxy look, no airbrushing, no over-saturation, no perfect symmetry.
```

漏了它 → 出来就是一眼假的「AI 脸」：皮肤打蜡、五官完美对称、没毛孔。**这条跟 §2「照片级真人」是同一场仗的两条战线**：§0 管那张**脸**不假，§2 管那个**人**会动。

---

## 🔴 硬规则（实操固化，最重要）

### 1. 强制无字幕（最容易踩）
- **原生配音（`generate_audio=true`）默认会把台词烤成字幕**，模型不会自己去掉。
- **prompt 写死这句**（漏了就有字幕，写了就干净——已验证）：
  > `ABSOLUTELY NO on-screen text, NO subtitles, NO captions, NO burned-in words of ANY kind anywhere in the frame — completely clean footage, all text added later in post.`
- 品牌名 / CTA / 字幕 **全部后期（CapCut/Canva）加**，AI 生成保持干净无字。

### 2. 真人感：照片级真人 + 会眨眼 + 眼珠会动（否则「卡通脸 / 木偶死眼」）
- 🔴 **数字人必须「照片级真人」**（不是卡通、不是 3D avatar）：prompt 写死
  > `PHOTOREAL, REALISTIC HUMAN presenter talking to camera, a real-looking person, natural skin, NOT a cartoon, NOT a 3D avatar, NOT CGI.`
  漏了这条第一版就会出卡通/塑料脸（详见 `7大AI启动包/05-《AI数字分身》启动包`）。
- prompt 再写活人细节：
  > `BLINKS naturally, EYES alive with the eyeballs MOVING via subtle micro-saccades, gaze shifts naturally, small head/eyebrow micro-movements, gentle breathing — a real living human, NOT a staring mannequin with dead eyes.`
- 静态参考图 + 没写眼动 → 模型只动嘴、眼睛发呆。

### 3. 运镜 / 动作（1–3 镜点缀，避免死机位）
- 推镜 `SLOW CINEMATIC CAMERA PUSH-IN`（hook / CTA 收尾）· 横摇 `CAMERA SLOWLY PANS`（展示一排东西）· 手持 `slight handheld camera movement`（口语段）· 动作：手势 / 前倾 / 指向。别每镜都加。

### 4. B-roll = 无脸真实近景，对应台词点名的东西
- 🔴 **首选：无脸真实近景（close-up）实拍/录屏，show 那句台词点名的东西本身**（工具/产品/成品/流程）。真实、贴题。
- 🔴 **优先用你自己的真实素材**：开工前把该**工具/产品/成品的真实截图或短片**发给 Claude → 当 `image_references` 或让它照着写 prompt，B-roll 才贴、才真、**不乱造假界面**。没参考时才让它按台词描述生成近景示范。
- 🔴 **B-roll 一律不放主播、不需要口型** → 生成时 `generate_audio=false` 且**不给 `audio_references`** → 无口型问题、几乎不烤字幕。
- ❌ **别让主播出镜做演示镜**：主播一开口就要对口型，而 audio_ref 口型在演示镜上不稳、还随机烤字幕。口播归口播、演示归无脸 B-roll，分开最稳。
- 🔴 **B-roll 必须跟那句台词内容对应**（讲 A 就 show A），泛泛「人在打电脑」不算。
- 🔴 **画面要快切**：prompt 写 `FAST-PACED, snappy quick HARD CUTS every ~1.2–1.5s, everything moving fast, no slow lingering shots`。
- 🔴 **prompt 绝不写 hex 色号 / 文字标签**（会被烤成乱码文字，跟海报「别写字体规格」同一个坑）；改写方向词（如 `blue-and-white palette`）+ **纯图标/纯抽象**，并加死 `NO letters, NO numbers, NO words, NO labels of ANY kind`。
- 屏幕内容一律 **soft/out of focus，无可读文字**。

### 4.5 口型对齐 + 声音一致（真人口播镜正解）
要「同一把声音 + 无字幕 + 口型准」三者都满足 → 走「静音生成 + 合声」，别用原生：
1. **选声**（见 §5）→ 拿到 voice_id。
2. **逐句 TTS**（`seed_audio`；`speech_rate` 用整数，正=快）→ 每句 wav + 时长。
3. **静音生成视频**（`generate_audio=false` + `audio_references=<该句TTS>` + 脸参考），**`duration = round(音频秒数)`**（🔴 **别 ceil！** ceil 会把嘴型摊长、越到后面越拖——实测音频 12.23s 设 13 就飘，设 12 就准）。
4. **PTS 精确合声**：视频与音频差零点几秒时，mux 把视频 `setpts` 拉/缩到音频时长再贴，端到端不漂、不丢词。

⚠️ 原生 `generate_audio=true` 会烤字幕、且每镜声音会飘，无字幕护栏也不 100% 可靠。要口型紧可用它，但要**无字幕+同声就不能用** → 真人镜一律走上面的「静音+合声」。`voice_change`（换音色保时序）只在**源视频已无字幕**时才有用。

### 5. 选声（按数字人性别）
- **默认走 preset，按数字人性别挑**：男→男声、女→女声。`list_voices` 看全部（男/女各约 20 把）+ `preview_url` 试听；用 `voice_type='preset'` + `voice_id`。
- **想更像某个真人本尊** → 才克隆（`create_voice_from_confirmed_audio`，干净样本：安静、近麦 ~15cm、无背景乐、连续讲 ~1 分钟；样本脏 → 克隆薄+带杂音）。
- ⚠️ preset 偏英语训练，**中文/其他语口播可能带点口音**；在意腔调就试听后定，或用克隆。
- B-roll 旁白用同一把声保持一致。

### 6. 台词
- **用你目标市场的语言/口语**、**无口头禅**；要多要实；从第一帧就讲、不留白；语速偏快不拖。

### 7. 背景
- 背景**虚化、无可读文字**（`background softly out of focus, NO readable text`）——否则参考图里的字会被带进画面。

### 8. 合规红线
- **按你自己行业/品牌的合规红线走**（该写什么、绝不写什么）。
- **人物贴你的目标市场**（含背景/屏幕里的人）。

---

## 参数 & 成本（省 credit）
- **一律 480p + `mode fast`**（≈15–18 credit/镜）；实测 `std/720p` 没明显差别、不值 3–4 倍。
- `count=1`，一镜一条。
- 弹 `preset` 推荐不想用 → 带 `declined_preset_id` 原样重发。
- **先验 1 镜确认「声音+无字幕+眨眼+脸」→ OK 再批量。**

## AI 剪片（字幕 / 配乐 / 音效）

**🔴 生成 ≠ 成品。** 拼接完只是**素材**。字幕/花字/音效/BGM 这一层，才是「广告片」和「AI 生成视频」的分界线。

### 用什么剪 —— 中文片只有一条路（2026-07 实测）

| 工具 | 结论 |
|---|---|
| ⭐ **ChatCut**（MCP 连接器）| ✅ **唯一为 AI agent 设计、且认真做过中文的剪辑器**（音效库说明都是中文写的、内置 CJK 字体后备、CJK 逐字高亮它自己默认关掉——因为它知道中文不该那样）|
| **ffmpeg + Claude** | ✅ 基础够用：`.srt/.ass` 烧字幕、垫 BGM、混音效、淡入淡出/缩放 |
| **HyperFrames** | ⚠️ **叠图层可以，中文字幕别用** —— 见下 |
| **剪映 / CapCut** | ❌ **草稿加密**，AI 程序化剪不了（只能手动或 UI 自动化，慢且脆）|
| **Gemini Omni** | ❌ 实测不稳，中文字幕烧不干净 |

### 📄 三份配套文档（在本包同目录）

| 文档 | 是什么 | 什么时候看 |
|---|---|---|
| **`VIDEO-PROMPT-SKILL.md`** | **前段 skill（出片）** —— 引导流程：读 script → 问方向 → 九宫格选人 → 逐镜 prompt | 有 script 要开拍时。**它只管流程，规则以本 README 为准** |
| **`SOP-AI自动剪辑.md`** | **通用方法论** —— 五层模型 · 14 条规则 · **教练式提问脚本** · 全行业适配表 | **剪之前先看这份**。换工具、换行业都成立 |
| **`CHATCUT-SKILL.md`** | **后段 skill（剪片）** —— ChatCut 说明书：全库存清单（音效35/转场13/特效9/推近4/MG 210）+ 14 个坑 | 动手剪时查 |

> **一条生产线两段：`VIDEO-PROMPT-SKILL`（出片）→ `CHATCUT-SKILL`（剪片）。** 两份 skill 都只写流程，**硬规则单一源头在本 README** —— 改一处全对。

### 🔴 五条最容易赔钱的（详见 SOP）

1. **建项目 fps 用工具默认值（30），别用原片真实值** —— 引擎硬编码 30fps；实测填 24 → **片尾 17 秒字幕永远不出现**
2. **转录是可以改的源数据** —— 没标点先补标点。补完转录引擎自己重新分段（2 大坨 → 26 句），分页自动就对；不补就得手工打 20+ 个断点救症状
3. **中文逐字高亮是废的** —— 中文 ASR 的「word」= 单个字，高亮会跟着废字乱跑。**花字只能用动态图形层做**
4. **描边是宋体的天敌** —— >5px 会把细笔画吃光，宋体变黑体。**衬线体用阴影**
5. **声音出问题先查开关** —— 静音的轨道和音量不足，症状一模一样（实测：BGM 调了三轮音量，那条轨是 muted）

### 🔴 选音效/转场：三问，不是查表

> ① **形状对不对？**（砸/飞/卡进位/累积 —— 跟动画匹配吗）
> ② **这个声音属于哪个文化圈？**（我在哪听过它）
> ③ 那个圈，**跟这个品牌是同一群人吗？**

说明书只写「它做什么」，不写「它听起来像什么文化」。某个音效说明写着「适合重点字幕」——功能全对，**但它是网络迷因音**，打在专业品牌上是灾难。

**没有绝对的禁忌音**（唱片刮擦在潮牌片里是神来之笔），**只有对不对得上**。别背黑名单——**拿到品牌人格，对整个库跑一遍三问**。

---

## HyperFrames（叠图层可以，中文字幕别用）

HeyGen 开源（Apache-2.0 免费商用），HTML/CSS → 确定性 MP4。**做透明叠加图层 / logo sting 是好用的。**

**但 `/embedded-captions` 是拉丁文专用**（2026-07 实测）——不是配置问题，是设计假设：

1. **自带 6 个字体全是 latin 子集**（`LXGWWenKaiTC-400-latin.woff2` 才 19KB，真中文字体 5–20MB）→ 中文全变豆腐块 □□□
   → 换 Noto Sans SC 能修
2. **Whisper 默认模型全带 `.en`** → 中文必须 `--model large-v3 --language zh`
   → 能修
3. **中文没空格 → word 级时间码躺平**（84 秒整段吐成**一个** word）
   → 用 ffmpeg 检测硬切点 + 套自己的脚本文字（比 ASR 准、零错字）：
   ```bash
   ffmpeg -i in.mp4 -filter:v "select='gt(scene,0.3)',showinfo" -f null - 2>&1 | grep -oE "pts_time:[0-9.]+"
   ```
   ✅ 校验：每段「字数 ÷ 秒数」应稳定在 **~6 字/秒**；偏太多 = 切点抓错（B-roll 横摇会产生假切点）
4. 🔴 **修完前三个还是不行** —— 它的匹配器是 **ASCII** 的、锚点是 **16:9 硬编码**的。**中文字幕就走 ChatCut。**

**它不干的事**：不改原片本身（重剪节奏/换背景/调色/改音频 = NLE 的活）。原片在底下完整播，它只叠图层。

## 其他两条路（实测结论，别浪费时间）
- **Remotion**（React 写视频）：能力相当、中文渲染干净。⚠️ **>3 人的营利公司商用要买 Company License**（remotion.pro）；个人/≤3人/非营利/评估期免费。
- **Gemini Omni**：能生成、也能「附参考片+原片」做风格迁移。**实测效果不稳**，中文字幕烧不干净。当玩具行，别当生产工具。

## 🧰 工具清单（全部链接 + 实测结论）

> 这一节的每个结论都是**真金白银试出来的**（2026-07-15 一整天）。
> 淘汰的那几个也留着 —— **别重走一遍死路**。

### ✅ 生产线在用的

| 工具 | 链接 | 干什么 | 要装吗 |
|---|---|---|---|
| ⭐ **Claude**（Claude Code）| <https://claude.ai/code> | **总指挥** —— 下面每个 connector 都是它在调。没它一个都跑不起来 | 订阅 |
| **Higgsfield**（Seedance 2.0）| <https://higgsfield.ai> | **生成**口播镜 + B-roll | connector · 按 credit 付费（**具体看官网**）|
| ⭐ **ChatCut** | <https://www.chatcut.io> · 编辑器 <https://app.chatcut.io> | **剪辑** —— 字幕/花字/音效/BGM/转场。**中文片唯一可行的 AI 剪辑路** | connector · **具体看官网** |
| **Suno** | <https://suno.com> | 背景乐（ChatCut 内也能直接生成）| connector · **具体看官网** |
| **Notion** | <https://notion.so> | 内容矩阵（分镜表 / 排期）| connector · **具体看官网** |
| **Google Drive** | — | 存原片 | connector |
| **ffmpeg** | `brew install ffmpeg` | **拼接分镜** · 探测规格 | 🔧 **唯一要装的东西**（免费开源）|
| **Pexels / Pixabay** | <https://pexels.com> · <https://pixabay.com> | 免费商用素材 | 不用注册（ChatCut 内建 `search_stock_media` 直接搜）|

> 💰 **价格一律「具体看官网」** —— 各家套餐一直在变，写死了教材立刻过时。
> 🔧 **学员唯一要装的是 ffmpeg**，其余全是 connector（Claude 直接调，零安装）。
> 🐍 **不用 Python / node** —— 那些是我们出教材才用的。

### ⚠️ 素材的两个坑（实测）

1. **一定要传原片，不是 `_web` 压缩档** —— 实测：4.6MB 的 480p 剪出来**整支糊**，原片 100MB。「打点做得再精致，垫在 480p 底下也白搭」
2. **有分镜文件就不用侦测切点** —— 分镜的**时长本身就是切点表**，精确、免费、零误差。
   实测：8 段累计 `9.93/23.93/33.15/42.99/57.46/65.33/77.56` = ffmpeg 侦测出来的 `9.92/23.92/33.17/43.00/57.46/65.33/77.58`，**分毫不差**。
   → **侦测只对「拿到一支拼好的片、不知道切点」才有用**（而且 B-roll 横摇会骗出假切点）

### 🔤 字体（授权红线）

| 字体 | 链接 | 授权 |
|---|---|---|
| **思源宋体** `Noto Serif SC` | <https://fonts.google.com/noto/specimen/Noto+Serif+SC> | ✅ **开源，免费商用**。宋体系正解 |
| **思源黑体** `Noto Sans SC` | <https://fonts.google.com/noto/specimen/Noto+Sans+SC> | ✅ 同上 |
| ❌ 极宋 / 研宋 / 方正 / 汉仪 | — | 🔴 **付费商用字库**。方正/汉仪维权是出了名的，**商用别碰** |

### ❌ 试过、淘汰的（别浪费时间）

| 工具 | 链接 | 为什么不行 |
|---|---|---|
| **HyperFrames** | <https://github.com/heygen-com/hyperframes> | **叠图层可以，中文字幕不行**。字体是 latin 子集、匹配器是 ASCII、锚点 16:9 硬编码 —— **是设计假设，不是配置问题** |
| **Remotion** | <https://www.remotion.dev> · <https://github.com/remotion-dev/remotion> | 能力相当、中文渲染干净。⚠️ **>3 人的营利公司要买 Company License**（<https://remotion.pro>）；个人/≤3人/非营利免费 |
| **Gemini Omni** | <https://gemini.google.com/app> | 能生成、能风格迁移。**实测不稳**，中文字幕烧不干净。当玩具行 |
| **剪映专业版 / CapCut** | <https://www.capcut.cn> | **草稿加密** → AI 读不了、写不了，**程序化剪辑走不通**（只能手动或 UI 自动化，慢且脆）。<br>⚠️ 注：我们**没实测过用它手剪整支** —— 只验证了「AI 接不进去」。你自己手剪它当然能用，只是 AI 帮不了你 |

### 📖 参考读物（看结论就好，别照抄）

| | 链接 | 怎么看 |
|---|---|---|
| Clipchamp「20 种转场」 | <https://clipchamp.com/zh-hans/blog/video-transitions/> | ⚠️ **是微软 Clipchamp 的产品软文**，20 个转场是它自己的素材库目录，不是行业标准。**但里面两条是真的**：①「交换切换」= Before/After 卡片对比 ②「确保足够的时间和空间，不会因为剪辑而分散注意力」|

### 💡 找风格参考的正确姿势

**别用文字描述风格 —— 直接甩片子。**

今天最有效的一步：直接发 2 支 Instagram reel 说「要这种感觉」，比写 500 字的 prompt 精准得多。

```
「参考这两支的节奏和花字：[链接1] [链接2]
 我的素材是 [链接]，帮我拆解它们的做法，套到我的片上」
```

**⚠️ 但要分清楚**：参考片是**别人的口播节奏**。
如果参考片的人在「爆句」（2-5 字一停），而你的主播是流畅连贯讲的，
**那个 2-5 字字幕的风格你学不来** —— 那是拍摄时的表演方式，不是剪辑技巧。
**这个门槛在摄影棚，不在剪辑台。**

---

## 接进系统
- 成品贴回你的内容表 + 归档：`[Stage]/[受众]/Video 素材/[命名]/[分镜 + 完整版]`。
- 拼接：`imageio_ffmpeg` concat → **再进 ChatCut 做后期**（字幕/花字/音效/BGM，见上）。

---
> 📎 **SUMA 内部示例**（仅供参考，不是通用规则）：主播 Jared + 极致鸭嗓克隆声；B-roll = 6 个 AI 工具逐个近景示范（写文案屏/出图/数字人/PPT/波形/剪辑）；合规红线 = 不写价格/免费/具体名额数字（用「名额有限」）、完整品牌名、人物一律马来西亚本地人。换成你自己行业的即可。
