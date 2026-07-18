# Notion「内容矩阵」页模版（建库 + 每条立项页照这个填）

> 🔴 这是内容矩阵 database 的**标准模版**。00 守门人建库时照「一、属性」建栏位；之后**每建一条立项页，正文照「二、正文」填成这个样子**（Claude 建页时就填好，别留空页）。
> 🔴🔴🔴 下面的具体值（学员见证/内容创作者/数字营销/「一个人扛全公司」/「AI营销系统」…）**全是 SUMA 示例——只是「长什么样」的形状参考，绝不照抄它的角度/产品/卖点**。内容（内容角度/文案/图prompt/台词）必须**从这个业务自己的品牌地基长出来**（它卖什么、卖给谁、怎么交付）：代运营 agency=「交给我们做」· 卖货=「产品解决你什么」· 服务店=「来店体验」，跟 SUMA「教你自己搭系统」完全不同。
> 🔴 **每格的文案/图prompt/台词 = 现场套对应 skill 规则真写**（文案→02 · 图→03 · 台词→04），别在建库时随手填、别套模版例子当真内容。
> 🔴 **「Notion 默认模版」API 设不了** —— 见「三、设为默认」，教学员手动点一次。

---

## 🚦 Status 工作流（🔴 Status 决定这一步该做什么 —— 开工前先看它）

> 🔴🔴 **动任何一条内容前，先读它的 `Status`；Status 决定这一步做什么，别不看 Status 就闷头产出。做完这一步就把 Status 推进到下一状态。**

| Status | 含义 | 🔴 这一步该做什么 |
|---|---|---|
| **Not Started** | 还没开始（刚开的空行）| 定角度方向、照模版把立项页填起来 → 角度写好改 `Need Review Idea` |
| **Need Review Idea** | 角度 / 想法待审 | 审角度（Hook ＋ ❤️人性需求 ＋ 🧠NLP、贴不贴业务）；过 → `Proceed to Generate`，不行 → `Need Modify` 或 `Rejected` |
| **Proceed to Generate** | 已批准生产 | 写文案 / 图 prompt / 脚本（如还没写）＋ 🔴 去生成图 / 视频 / 数字人（**生成前先把 prompt ＋ 预计 credit 给用户确认再烧**）→ `Need Review Poster/Video` |
| **Need Review Poster/Video** | 成品出来了，待审 | 审成品（渲染 / 乱码 / 外国脸 / 合规）；过 → **成品三落归档**（本地 ＋ Notion ＋ Drive）→ `Checked`；要改 → `Need Modify` |
| **Checked** | ✅ **全部做完 ＋ 审过 ＋ 归档好，只差还没发** | 排期 / 等发；发出去 → `Posted` |
| **Need Modify** | 角度 / 成品要改 | 按反馈改（文案 / prompt / 重生成）→ 改好回 `Need Review Poster/Video`（或对应待审）|
| **Rejected** | 这条弃用 | 不再产出，留着当记录 / 教训 |
| **Posted** | 已发布 | 回看数据表现，好的角度复用 |

> 🔴 这 8 个 Status 是标准工作流值（可按业务微调），但**「先看 Status、Status 决定做什么、做完改 Status」这条铁律不变**。
> 🔴🔴 **`Checked` ＝ 万事俱备、只差发布**（不是「角度审过」）—— 它在流程**倒数第二步**，别搞反。

---

## 一、database 属性（栏位）

> 🔴 **建 database 时，属性就按这个表从上到下的顺序建**（= Notion 里从左到右的列顺序，照做就行）。
> 🔴 **Title（Aa 属性）= `内容角度`**（页面大标题就是那句角度整句），**不是**「命名标题」（命名标题是另一个文本属性 = 编号命名串）。

| 栏位 | 类型 | 说明 / 示例值 |
|---|---|---|
| **广告投放日期** | Date | 可空 |
| **Status** | Select | Not Started / Need Review Idea / Checked / Proceed to Generate / Need Review Poster/Video / Need Modify / Rejected / Posted（工作流状态，见上方 🚦 Status 工作流）|
| **Stage** | Select | ToFu / MoFu / BoFu |
| **目标受众** | Select | 按用户受众（例：内容创作者_In-house Marketer / Freelance Marketer） |
| **领域** | Select | 按用户领域（例：数字营销） |
| **行业** | Select | 按用户行业（例：Marketer） |
| **主讲人** | Person | 谁出镜（可空） |
| **命名标题** | 文本 | `编号 Hook - Stage - 受众：一句话`，例：`06 学员见证 - MOFU - 内容创作者_In-house Marketer：搭了AI内容营销系统后产能提升、被看见` |
| 🔴 **内容角度** | **标题(Title · Aa)** | 这条内容的角度**整句 = 页面标题本身**（例：「学员见证：从前一个人在公司加班到十点还追不完内容，搭了一套自己的AI内容营销系统后…」）。**这就是数据库的 Title 属性。** |
| **Hook 类型** | Select | 学员见证 / 行业揭秘 / 痛点直击 / 对比反差 / 趋势警醒 …（按业务扩） |
| **🏷️ 关联主题** | Multi-select | 🔴 **按业务自己的内容主题/系列**（例：客户见证 / 行业干货 / 产品展示 / 优惠活动…）。⚠️ **不是「AI内容课」**——那是 SUMA 自己的字段；通用业务一律用自己的主题。 |
| **媒体类型** | Select | 视频 / 图文 |
| **备注** | 文本 | 可空 |
| **❤️ 人性需求** | Select | 确定 / 新鲜 / 重要 / 爱与连接(Love & Connection) / 成长 / 贡献 |
| **🧠 NLP技巧** | Select | social proof 社会认同 / 换框 / 锚定 / 未来预演 / 连续肯定 … |
| **📽️ Hook变体(A/B)** | 文本 | 前3秒评分 X/10 + 变体A（角度1）/ 变体B（角度2），用来 A/B 测钩子 |

---

## 二、页面正文模版（每条立项页照填，别留空页）

> 🔴🔴 **文案按这条的 `Stage` 走对应 SOP —— ToFu/MoFu/BoFu 卖的东西不一样，写法也不一样，别一套模板套三层：**
> - **ToFu 觉醒**：戳痛点 / 趋势、让人「对，就是我」，**不硬卖、不放价**。9 拍：钩子标题 → 痛点场景 → 二次扎心 → 正名(不怪客户) → 后果/对比 → 换框 → 好消息=你的产品/服务 → 愿景 → CTA。🔴 字数 **250–400 字**（写完数一遍中文字数，不到下限就回去把某几拍展开更细再数，达标才输出）。
> - **MoFu 考虑**：拆方法 / 给证据 / 讲 USP，证明「这方法/产品行」。9 拍：钩子(揭秘/见证) → 点破误区 → 方法一 → 方法二 → 证据(before→after) → 关键点 → 为什么选我 → 收口 → CTA。🔴 字数 **300–500 字**（同上，数够才输出）。
> - **BoFu 决策**：算账 ROI + 紧迫 + offer，推「现在就下手」。6 拍：钩子(算账/限时) → 算账对比 → offer 内容 → 消除顾虑 → 紧迫 → 愿景+CTA。🔴 字数 **200–350 字**（同上，数够才输出）。
> 🔴 三层都守：**卖自己产品/服务·AI 隐形 · 分段 + emoji(3–6) · NLP 按漏斗层挑 + 戳 ❤️需求**。完整三张节拍表 + 三行业示范在**本 skill 最前面「✍️ 文案框架」(02)**。🔴 **选错层 / 少了中段 / 字数不够 = 没 follow SOP，重写。**


### 📹 视频类（媒体类型=视频）

> 🔴🔴 **硬性比例：口播短视频一律 vertical 9:16（竖版）** —— 不用 16:9 / 1:1。

正文顺序（🔴 **概念是概念、文案是文案、台词是台词 —— 三样分开，别塞一起**）：

**## 概念**
`<角度类型（如 觉醒型ToFu）+ 用的 NLP：这条内容的「想法/角度」一句话 —— 跟图文的「概念」同一种，不是 caption>`

**## 📱 视频社媒文案**（= 文案，发帖 caption）
`<🔴 完整文案：照 02「§四 节拍表」填满每一拍（ToFu/MoFu 9 拍 · BoFu 6 拍）· **卖自己产品/服务，AI 全程隐形** · 字数达标（**ToFu 250–400 / MoFu 300–500 / BoFu 200–350 字**，🔴 写完数中文字数、不到下限展开再数，够了才输出）· 分段（每拍空行）+ 适当 emoji（3–6 个）· NLP 按漏斗层挑 + 戳 ❤️人性需求 · 参照 02「§五 示范」· + hashtags —— 绝不缩成 2 句 caption>`

**## 📽️ 分镜脚本（8-shot）**（表格；里面的「台词」列 = 每 shot 主播讲的话，又是另一回事）
分镜表格列（🔴 **`Higgsfield Prompt` 列宽 ≈ 562px** —— 这是曾定的标准列宽，够宽才看得全 prompt）：

> 🔴🔴 **每个 shot 的 Higgsfield/seedance prompt = 照下面黄金模板【整段完整写】（这才是标准长度）。🔴🔴 每个 shot 都把整段（含整段超详细 CHARACTER 人物描述）逐字重写一遍 —— 每个 shot 是【独立生成】的，模型看不到「上一个 shot」，只有每 shot 都重复同一段超详细人物特征，8 个 shot 才会是同一个人。🔴 绝不写「同上固定条款 / same as above / only change: …」这种偷懒 shortcut（那样每 shot 会换脸）。每 shot 只有 `[动作/道具]` 和 `[台词]` 不同，其余逐字一样：**
>
> ```
> 🔴 SPEECH STARTS IMMEDIATELY AT FRAME 1 — ZERO silence, ZERO pause before the first word.
> 🔴 PACING (CRITICAL): speaks at a QUICK, CONFIDENT pace — noticeably brisker than slow relaxed conversation, energetic and forward-moving — BUT every single syllable stays CRISPLY ENUNCIATED and fully intelligible. NOT rushed to the point of blurring or slurring words together, NOT mumbling, NOT dropping syllables. Picture a professional bilingual news presenter reading a quick punchy segment: fast enough to feel snappy and energetic, but each word lands clearly and is easy to understand on first listen. Clarity and pace are equally non-negotiable — if forced to choose, prioritize clarity slightly over raw speed, but do not slow down into a leisurely or deliberate pace.
> CHARACTER (🔴 keep 100% IDENTICAL in every one of the 8 shots — a down-to-earth [受众身份，如 e-commerce seller / tuition teacher], NOT a glossy model): [🔴 超详细本地人物，够细 + 带独特辨识点才锁得住脸：a local Malaysian Chinese [性别], [年龄], [脸型 e.g. square-ish oval face, slightly strong jaw], [肤色 e.g. warm medium-tan skin], [眼型 e.g. single-eyelid slightly hooded eyes], [眉/鼻/唇 e.g. low flat brows, small flat nose, natural lips no lipstick], [独特标记 e.g. a tiny dark mole at the right corner of the mouth, a faint acne scar on the left cheek], [发型 e.g. straight black hair in a messy bun with a clip, a few frizzy strands], [配饰 e.g. thin round-frame glasses, a black elastic hair-tie on the wrist], [穿着 e.g. a plain oversized grey cotton tee, sleeves pushed up], [气色+身形 e.g. no makeup, slightly tired but sharp eyes, short bare nails, practical stocky build]].
> [🔴 这一 shot 的动作/道具：如 her hand pauses on a half-sealed courier bag, she looks up at camera and lowers her voice like leaking a secret], [场景：如 cramped packing corner with stacked boxes, daylight]. photoreal real-camera look, NOT AI, no CGI, natural skin texture, shallow depth of field, authentic documentary vibe. realistic believable documentary photo, NO sci-fi, NO energy/glow, NOT exaggerated.
> 🔴 NO subtitles, NO caption bar, NO burned-in spoken text, NO on-screen captions, NO course-name/CTA capsule on screen (the CTA is only SPOKEN in the final shot).
> 🔴 The person (incl. an AI digital-human presenter) is a REAL LIVING human with natural micro-motion: BLINKS naturally, eyes and pupils MOVE and track/shift gaze, natural breathing and subtle facial micro-expressions — alive, NOT a frozen stare, NOT motionless glassy eyes, NOT a lifeless mannequin/3D avatar.
> 🔴 运镜/cinematography: dynamic real camera, NOT a static locked-off frame. Talking-head shots = subtle handheld UGC motion with a slow push-in and natural reframing; B-roll shots = motivated camera moves (slow pan/tilt/dolly push-in, rack focus, close-up insert cuts). Movement is smooth and natural, never robotic or jittery.
> Spoken in natural Malaysian Chinese (Mandarin, local accent, clean — no filler particles). Saying: "[这一 shot 的台词全文]"
> ```
> 🔴 **B-roll shot**（讲工具/数据/成果）：人物换成对应**空镜**（screen recording of a dashboard、产品特写、打包桌近景…），但 CHARACTER 以外的固定条款（9:16 · 无字幕 · REAL LIVING/运镜 · 清晰不虚不乱码）**照样整段重写**，别一直怼人头。
> 🔴🔴 **禁 shortcut**：`同上` / `same as above` / `only change` 一律不行。**每个 shot 的 prompt 都是完整一大段。**

| 画面构图 | Higgsfield Prompt（含图内文字与排版规格）| 台词 | 适用平台 | 🎯涉及的USP（独特卖点）|
|---|---|---|---|---|
| 口播开场，学员对镜头真诚自述 | `<🔴 整段完整写：照上面黄金模板逐字（含整段 CHARACTER），只 [动作/道具]+[台词] 不同；绝不写「同上/only change」—— 每 shot 一大段>` | Shot 1 台词：… | 小红书 / IG / FB | <这一 shot 戳中的独特卖点，如「一人顶一队」/「方法论不是工具」> |
| …（共 8 行，一 shot 一行）| … | … | … | … |

> 🔴 **台词 ≠ 文案，别混：** 这列是**台词**（每个 shot 主播嘴里讲的话）；**文案**（发帖 caption）是另一回事，在上面「概念 → 📱视频社媒文案」那段。台词是台词、文案是文案。
> 🔴 **`🎯涉及的USP` = 这一 shot 卖的「独特卖点/独特销售主张」**（不是用了哪个 AI skill —— 这条属于哪个主题在页面属性「关联主题」里）。每个 shot 挂它主打的 USP，方便看整支片有没有把卖点讲全。

> 🔴 视频类台词/脚本 = 文案，**先套 CMO + 文案大师身份再写**（见 `02 AI文案`）；prompt 规则以 `04 AI口播短视频` 为准（声画一起生成、无字幕护栏、人物贴受众）。

### 🖼️ 图文类（媒体类型=图文）

> 🔴🔴 **硬性比例：图 / 海报一律 vertical 3:4（竖版）** —— 不用 1:1 / 16:9。

正文顺序照这个（比视频多「图内文字层级」和「素材」两段）：

**## 概念**
`<角度类型（如 觉醒型ToFu）+ 用的 NLP：这条内容的角度一句话说明>`

**## 📱 社媒文案**（= 发帖 caption，🔴 完整一整段放这里，**别拆进下面表格**）
`<🔴 完整文案：照 02「§四 节拍表」填满每一拍（ToFu/MoFu 9 拍 · BoFu 6 拍）· 卖自己产品/服务·AI 全程隐形 · 字数达标（ToFu 250–400 / MoFu 300–500 / BoFu 200–350 字，写完数中文字数够了才输出）· 分段（每拍空行）+ emoji（3–6）· NLP 按漏斗层挑 + 戳 ❤️需求 · 参照 02「§五 示范」· + hashtags —— 绝不缩成 2 句 caption>`

**## 🖼️ 图内文字层级**（海报上要出现的字，分层 —— 就是 poster 三层分工）
- 🔴 **顶部受众 pill**：<受众一句话，如「在公司做 Marketing 的你」>
- 🟠 **立体描边大标题**（黑色粗描边 + 品牌渐变）：<最痛/最爽一句，如「一个人，扛全公司的内容」>
- 🟥 **色块横幅**（品牌深色底，白/黄字）：<解决方案一句>
- ⚪ **底部技能/卖点打勾清单一行**：✅… ✅…（按业务，别太多字）
- ⚪ **起价小字（可选 · 合规才放）**：<如「从 RMxxx 起」——🔴 ToFu 只暗示、BoFu 才明码；不合规就不放>
- ⚪ **右上角留 logo 位**
> 🔴 **分层铁律**：ToFu 只戳痛点、字要少；BoFu 才放 offer/价（跟海报 SOP 一致）。

**## 🖼️ 已生成图片**
`待生成`（生成后把图贴这）

**## 📸 提供给 Higgsfield 的素材**
- ① **素材图**：<真实场景描述 —— 人物一律本地人、真实办公/生活场景>
- ② **风格参考**：<文档感 / 光线 / 「一个人 vs 一整间公司」压力对比 / 负空间多、字少>

**## 表格：画面构图 | Higgsfield Prompt**（🔴 只两列 —— 发帖文案在上面「📱 社媒文案」段，别塞进表格）
🔴 **`Higgsfield Prompt` 列宽 ≈ 562px**（跟视频表同一标准列宽）。

> 🔴🔴 **每张图的出图 prompt = 照下面这个黄金模板逐行填（这才是标准长度，不是一句话）。硬锁 vertical 3:4，固定条款一字不动，只换 `[中括号]` 里的行业/受众专属部分：**
>
> ```
> vertical 3:4 BOLD promo-style poster, Style [A 战报证明风 —— 按受众从 5 种风格挑，见 03]: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, [品牌色] gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
> TOP: small kicker pill naming the audience: '[受众一句话，如 在公司做 Marketing 的你]'.
> Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '[痛点/反差主标题，如 同岗位，产能却差十倍]'.
> Below headline: a solid [品牌深色] colour-block banner strip containing bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '[方案+温和成果，如 1 天学会…，一人顶一队]'.
> MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of [主角：young local Malaysian Chinese …贴受众气质、NOT auntie] [真实场景+道具+情绪/动作，如 standing at her desk in bright daylight, calm and confident, one hand on laptop showing finished deliverables, glancing at the wall clock as she packs up on time] — a single candid photo, NOT a split screen.
> Below the photo: an icon-checklist row, [N] small colourful circular icon badges with checkmarks and tiny labels: '✅[卖点]' … , small clean single row, must NOT dominate the poster.
> [可选·合规才放] A tiny price-hint line near the bottom: '[如 从 RMxxx 起]'.
> NO course-name capsule, NO sign-up button, NO specific outcome guarantee to an individual (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder. Any phone/screen content in the photo must be blurred abstract colour blocks with NO legible text/characters at all.
> 🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is the Chinese specified above, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters, the person is a real local Malaysian (photoreal, not cartoon/CGI).
> ```
> 🔴 **一字不动的固定条款**：vertical 3:4 · 结构(pill→3D描边大标题→色块横幅=方案+温和成果→中段真人纪实照 NOT cutout/NOT split → icon 打勾清单 → 起价小字[合规才放] → 右上留 logo 位不写'LOGO') · 手机/屏幕内容 blurred abstract 无可读字 · 整段 CRITICAL(NO English/逐字校对/no garbled/真人本地非卡通)。
> 🔴 **只换**：`[风格]` / `[受众 pill]` / `[痛点标题]` / `[方案+成果]` / `[主角外形+场景+动作]` / `[卖点清单]` / `[起价]`。🔴 引号里就是要渲染进图的中文（对应「图内文字层级」），**绝不写 `no text overlay`**（那是视频规则，海报要字）。

| 画面构图 | Higgsfield Prompt（含图内文字与排版规格）|
|---|---|
| `<一句画面描述>` | `<照上方黄金模板填：vertical 3:4、固定条款一字不动，只换 [风格]/[受众pill]/[痛点标题]/[方案+成果]/[主角+场景]/[卖点清单]/[起价]>` |

> 🔴 **发帖 caption 在上面「📱 社媒文案」段（完整一整段）**；图内的字在「图内文字层级」；表格只放 画面构图 + prompt，**别把 caption 拆进表格**。

**## 成品海报（最终标准版：真人脸 + 真实场景 + 大字）**
`<合 logo 后的成品图贴这>`

---

## 三、🔴 设为默认模版（Notion API 做不到，手动一次 · Claude 教学员点）

建完库、填好一条示例页后，让 Claude **一步步教学员**在 Notion 里把它设成默认（之后每次 **New** 自动套）：

1. 打开这个内容矩阵 database。
2. 「**New**」按钮右边的 **⌄** → **+ New template**。
3. 把上面「二、正文」的结构（概念 + 8-shot 表 / 海报 prompt）做进这个模版页、属性留空当占位。
4. 模版页右上 **⋯** → **Set as default**（设为默认）→ 选「for all views」。
5. 以后点 **New** 就自动是这个模版；Claude 通过 API 建页时也照「二、正文」填，两边一致。

> 为什么要手动这一步：Notion 的**公开 API 不支持创建/设置 database 模版**（那是界面功能）。所以 Claude 能建库、能把每页正文填成模版样子，但「点 New 自动套」这个默认只能手动设一次。
