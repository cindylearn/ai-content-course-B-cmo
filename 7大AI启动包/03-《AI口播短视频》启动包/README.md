# Skill · AI 影片（工具：Higgsfield / Seedance）

**在系统里的工位：** 把脚本变成完整口播短视频 —— 视频生产线的核心（数字人见 `7大AI启动包/05-《AI数字分身》启动包`，音乐见 `7大AI启动包/07-《AI品牌配乐》启动包`）。

> 🔴 **先分两条路线**（跟院长 slide 一致，脚本角度完全不同）：
> - **个人 IP / AI 数字人口播**：你（或数字分身）出镜讲观点/方法，建立个人影响力——台词是「你的主张」，靠持续 + 独特观点。
> - **卖产品 / 服务影片广告**：推货/服务成交——台词是「痛点→产品价值→证据→CTA」，B-roll show 产品/成品/使用场景。

## 流水线
```
分镜脚本(进表) → 锁人物(多张脸参考) → seedance 逐镜生成 → 抽帧验证 → 拼接完整版
```
1. **分镜脚本进表格**（一 shot 一 row）：镜号/类型 · Prompt · 台词 · 平台。整支约 60–100s。列宽示例 199 / 562 / 290 / 120（Prompt 列最宽）。
2. **锁人物（口播镜）**：用 **3 张真人脸参考图**（正脸+不同角度更稳）当 `image_references`，每个真人镜 prompt **重复完整 persona 描述** → 全片同一个人。
3. **逐镜生成**：`seedance_2_0` · `9:16` · 每镜 4–15s。
4. **验证 + 拼接**：抽帧检查（无 ffmpeg 用 `imageio_ffmpeg`）→ 统一参数 → concat 完整版。

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

## AI 剪片（字幕 / 配乐 / 音效 —— 不用 CapCut 也能做不少）
生成 + 拼接之后的剪辑，Claude + ffmpeg 现在就能做：
- **上字幕（自动）**：台词和 TTS 时间我们本来就有 → Claude 按时间生成 `.srt`/`.ass`（带样式：字体/描边/位置），ffmpeg 烧进画面：`ffmpeg -i v.mp4 -vf "subtitles=sub.ass" out.mp4`。**不用手动 CapCut 打字。**
- **配乐**：Suno 背景乐 ffmpeg 垫底轨、音量压低（见 `7大AI启动包/07-《AI品牌配乐》启动包`）。
- **音效**：在时间点混 SFX（转场声/点击声）→ ffmpeg `adelay` + `amix`。
- **基础特效/转场**：淡入淡出、缩放推拉、文字动画（ffmpeg `fade` / `zoompan` / `drawtext`）。
- 🔴 **复杂特效/花哨转场**（花字、贴纸、节奏卡点）→ 用下面的 **HyperFrames**，或剪映/CapCut。

---

## 🔥 AI 剪辑进阶：HyperFrames（写 HTML → 渲染视频 · 免费商用 · 实测可用）

CapCut 那种「动态字幕 / 花字 / 下三分标 / 卡点」，现在能**用代码做**——而且是 **AI agent 直接帮你写**。这是「一直人头、没包装」这个缺口的真解。

**它是什么**：HeyGen 开源的框架（**Apache-2.0，免费商用**），把 HTML/CSS/动画渲染成**确定性**的 MP4（同样输入 → 同样结果，可重跑、可参数化批量出片）。自带 20 个 skills 给 Claude Code 用。

**装（一次过）**：
```bash
npx skills add heygen-com/hyperframes --all --full-depth --yes   # 20 个 skills
brew install ffmpeg                                              # 必需（Windows 用 winget/choco）
npx hyperframes doctor                                           # ffmpeg / ffprobe / Chrome 要全绿
```

**对着现成口播片，最常用这三个**（先读路由 `/hyperframes`，它会帮你选）：

| skill | 干什么 |
| --- | --- |
| `/talking-head-recut` | 给人头片加**动态标题 / 下三分标 / 数据 callout / 引言卡 / 画中画** —— 治「一直人头」 |
| `/embedded-captions` | 只加字幕（原片不动），主体还能**挡住**字幕（有层次） |
| `/motion-graphics` | 单独做 10 秒内的动态图形 / logo sting / **透明**下三分标（可叠进剪映） |

### 🔴 中文三大坑（实测踩过，照抄解法就好）

1. **自带字体没有中文** —— 它 bundle 的 6 个字体**全是 latin 子集**（`LXGWWenKaiTC-400-latin.woff2` 才 19KB，真中文字体是 5–20MB）。直接用 → **中文全变豆腐块 □□□**。
   → **解法**：自己放一个中文字体（**Noto Sans SC**，开源 OFL 可商用）进 `public/fonts/`，用 `@font-face` 引用。别只写 `font-family`，它的静态分析器不认。
2. **Whisper 默认模型是纯英文** —— `tiny.en / small.en / medium.en` 全带 `.en`。
   → **中文必须** `--model large-v3 --language zh`（多语言的只有 large-v3，约 3GB，第一次会自动下）。
3. **中文没空格 → word 级时间码直接躺平** —— whisper-cpp 会把 84 秒整段吐成**一个** word（`0.32 → 84.04`），卡片定时全废。
   → **解法**：如果你的片是**分镜拼的**，用 ffmpeg **检测硬切点**拿真实分段，再套**你自己的脚本文字**（比 ASR 还准、零错字）：
   ```bash
   ffmpeg -i in.mp4 -filter:v "select='gt(scene,0.3)',showinfo" -f null - 2>&1 | grep -oE "pts_time:[0-9.]+"
   ```
   ✅ **校验法**：每段「**字数 ÷ 秒数**」应稳定在 **~6 字/秒**；某段偏太多 = 那个切点抓错了（B-roll 的横摇/动画会产生假切点，要剔掉）。

**它不干的事**（别指望）：**不改原片本身** —— 重新剪节奏、换背景、调色、改音频 = NLE 剪辑，超出它范围。原片在底下**完整播**，它只在上面叠设计好的图层。

## 其他两条路（实测结论，别浪费时间）
- **Remotion**（用 React 写视频）：能力相当、中文渲染同样干净。⚠️ 但 **>3 人的营利公司商用要买 Company License**（remotion.pro）；**个人 / ≤3 人公司 / 非营利 / 评估期免费**。你是小团队就能白嫖。
- **Gemini Omni**（Google）：能生成视频、也能「附参考片 + 原片」做风格迁移。**实测：效果不稳、不好用**，中文字幕也烧不干净。当玩具行，别当生产工具。

## 接进系统
- 成品贴回你的内容表 + 归档：`[Stage]/[受众]/Video 素材/[命名]/[分镜 + 完整版]`。
- 拼接：`imageio_ffmpeg` concat；字幕/配乐用上面「AI 剪片」；花哨特效后期加。

---
> 📎 **SUMA 内部示例**（仅供参考，不是通用规则）：主播 Jared + 极致鸭嗓克隆声；B-roll = 6 个 AI 工具逐个近景示范（写文案屏/出图/数字人/PPT/波形/剪辑）；合规红线 = 不写价格/免费/具体名额数字（用「名额有限」）、完整品牌名、人物一律马来西亚本地人。换成你自己行业的即可。
