---
name: suma-ai-03-image
description: >-
  SUMA AI 内容系统 · 第 03 步。出场景化海报/成品图 + 合 logo。
  触发词：出图 / 海报 / 产品图 / 做图。
  跟用户说话中英双语；教练式一题一题问。
metadata:
  type: reference
  scope: SUMA AI内容课 · 独立 skill · part 03
---

# suma-ai-03-image —— 出场景化海报/成品图 + 合 logo。

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-03-image` |
| ② First Prompt（说一句话）| 「帮我出海报／产品图」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **交互铁律：** 问用户任何选择题 → 一题一题、一题一张可点选项卡（`AskUserQuestion`，每题≤4 个+「其他」）、**绝不一次全倒**。只有开放题才打字。
> 🔴 **底层三层：** 出的每样东西都套 ① 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）· ② 语言（NLP）· ③ 动机（6 大人性需求）。说得出「用了哪个大师+哪个NLP+戳哪个需求」，说不出＝重来。

> 🔴 **强制记录：** 全程把决定/产出记进用户的「业务 md」（`业务-<品牌名>.md`）——品牌地基、每条内容的角度/大师/需求、Notion 结构、产出链接。没有这个文件 → 先建。

> 🔴🔴 **前置闸门（先查再做，缺了就挡）：**
> 1. **connector 连好没？** 🔴 **Notion + Google Drive + GitHub 必连**（Notion 建大脑、Drive 存成品、GitHub 装 skill）；出图/视频还要 Higgsfield、剪片要 ChatCut。缺 → 让她去 Claude 设置 → Connectors 连，或回 `suma-ai-00-setup`。🔴 **还要她的 Google Drive folder 链接**（成品同步存这），没有先要。
> 2. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 3. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。
> 🔴🔴 **成品归档（做完必做，禁找任何借口）：** 每个成品（图/视频/音乐/PPT）做完，**三处都要落，一处都不能跳**：① 本地成品 folder；② 🔴 **贴进 Notion**（对应立项页的「成品」块 + 改 Status）；③ 🔴 **`rclone copy` 传进用户 Google Drive 成品 folder**。🔴 **②③ 只要有一处没做，就是没做完 —— 绝不说「传不了 / 太大 / 浪费算力 / 你自己上传 / 你自己拖」这类借口。**
>
> **② 贴进 Notion（学生用 Notion connector，真能跑的路径 —— 别再卡在这找借口）：**
> `notion-create-attachment` 的 `content` 只收文本（≤200KiB），**本地二进制成品（图/视频/音乐）必须走 `source_url`（公开 HTTPS）**。本地文件没有公开 URL → 这样拿：
> 1. 用 Higgsfield `media_upload`（filename=成品文件）拿 presigned `upload_url` → PUT 上传字节 → `media_confirm`；再用 `show_medias` / `media_import_url` 取回该成品的**公开 HTTPS URL**。
> 2. 把这条公开 URL 喂 `notion-create-attachment` 的 `source_url` → 拿回 `markdown_source`。
> 3. 用 `notion-update-page`（insert_content）把 `markdown_source` 放进立项页的「成品」块。🔴 **1 小时内贴完**（临时上传会过期）。
> 🔴 免费 Notion `source_url` ≤5MiB（付费 workspace 50MiB）：成品超了先压到限额内再传，**不是不传**。
>
> **③ 传进 Drive：** Drive connector 传大图不行（base64 太大），但 **rclone 直传就行、多大都可以**（00 已帮学员配好 `gdrive` remote）。命令：`rclone copy "<本地成品>" gdrive: --drive-root-folder-id <Drive成品folder的ID>`（folder ID = Drive 链接 `/folders/` 后那段）。rclone 没配 → 先带学员配一次（见 `suma-ai-00-setup`），别跳过、别甩给用户手动。

---

> 🔴🔴 **动手前必做（第 0 件事）：先用 `Read` 把本文件夹里的每一个 `.md` 文件读一遍**（框架 / NLP / SOP / 模版 —— 完整规则在那里），读进来再开工。**别只看这份 SKILL.md 就动手 = 出烂成品。**

## 第一步：先跟用户敲定海报风格（5 选 1，一题一张卡问）
促销 / BoFu 海报从这 5 种里挑，按行业 / 受众搭配，🔴 同批次别整批用同一种：
- **A｜战报证明风**：立体描边大标题 + 实心横幅放一个**温和**成果/转变陈述（不写离谱金额、不做个人结果保证）+ 圆形 icon 打勾清单 + 真人合照压底做背书。→ 需强背书行业（电商、招生、补习、小生意老板）。
- **B｜信息流悬浮 UI 风**：深色背景真人拿手机/电脑，周围悬浮半透明发光 UI 卡片（内容一律抽象色块、**无可读文字**），标题带光效。→ 科技/年轻潮流（美妆、服装、副业人）。
- **C｜导师权威风**：深色科技背景，自信真人张开双臂"掌控"数据面板，一个**放大的数字/徽章**当视觉核心。→ 专业权威（保险、顾问、Marketer、打工人）。
- **D｜赛博游戏化风（🔴慎用）**：高度风格化人物 + 霓虹 + 能量特效 + "LEVEL UP"式用语。最花哨，只在受众明显年轻/游戏化时用，**默认不选**。
- **E｜扁平色块对角风（最稳/保底）**：对角撞色色块 + 立体描边大标题 + icon 打勾清单 + 真人 + 真 logo。→ 补习/才艺班/克制的顾问型个人 IP。

## 🔴🔴 图文海报 = 要渲染大字！别当成没字的场景照
**图文海报 ≠ 视频镜头。** 海报要 Higgsfield **把「图内文字层级」的中文大字渲染进图**（headline / 受众 pill / 色块横幅 / 清单，中文放**引号**里）。
- 🔴 **绝不写 `no text overlay`** —— 那是 04 视频的无字幕规则！海报**要字**，写了就出一张没字的空场景照（烂成品）。
- 🔴 护栏是「**只渲染引号里的中文** + `NO garbled text`」（防乱码），不是"不要字"。
- 🔴 prompt 里必须带上你在「图内文字层级」写好的那几句中文（headline/pill/横幅/清单），不是只写场景。

## 🔴🔴 标准 prompt 黄金模板（照这个逐行填 —— 好海报的结构，绝不缩水成一句场景）
以 **A 战报证明风** 为例（换风格只换视觉，TOP/headline/banner/MIDDLE/checklist/CRITICAL 结构不变）：
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, [品牌色] gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '[受众一句话]'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '[痛点/反差主标题]'.
Below headline: a solid [品牌深色] colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '[方案+温和成果]'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of [主角详细:本地人+年龄+气质,NOT auntie], [真实场景+道具+情绪], natural window light, real camera look NOT AI-looking, authentic [本地].
Below the photo: an icon-checklist row, [N] small colourful circular icon badges with checkmarks and tiny labels: '✅[卖点]' × [N], small clean single row, must NOT dominate the poster.
[可选·合规才放] a tiny price-hint line near the bottom: '[从 RMxxx 起]'.
NO course-name capsule, NO sign-up button, NO specific outcome guarantee (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is the Chinese specified above, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters; the person is a real local [本地] (photoreal, not cartoon/CGI).
```
🔴 **结构必须齐**：① TOP 受众 pill ② 大字痛点标题(3D描边) ③ 色块横幅=方案+成果 ④ 中段真人纪实照(NOT cutout·NOT auntie·本地) ⑤ 一行图标打勾清单 ⑥ 起价小字(合规才放) ⑦ 右上 logo 空位 ⑧ **CRITICAL 只渲染引号中文·proofread·no garbled·绝不出英文**。
🔴 人脸锁定：`generate_image` 传 `medias:[{value:<media_id>, role:"image"}]` + `the person's face MUST match the reference exactly`；屏幕内容 `abstract blurred colour blocks, NO legible text`。

## 图内文字层级（画面 carry，文字精简）
① 受众 pill（顶部小标签，点名"就是你"）② 大标题 headline（立体描边、全图最大、戳痛点/给结果）③ 色块横幅/sub（一行成果或时间陈述，温和可信）④ 技能/工具清单（圆形 icon 打勾）⑤ logo 位（右上/顶部纯色留空，绝不让 AI 画）。

## 通用海报硬规则（哪种风格都套）
- 🔴 **ToFu 不放价格**（价格是 BoFu 专属）：ToFu 用温和时间型 hero 巨字（例：「1 天」渐变/发光）当钩子。
- 🔴 **真实纪实场景 + 悬浮科技元素混搭**，不要纯棚拍/纯抠图；人物在行业相关真实场景里（例：电商打包桌、老师画室），科技只点缀。
- 🔴 **不 overpromise**：不写夸张金额、不写「保证/包你/一定能」。
- 🔴 **同批不同受众分不同风格**，别整批一样。
- **光效按漏斗层**：BoFu/促销可酌情用；ToFu 纪实软钩子风 + 所有 MoFu **禁 sci-fi/glow**。

## 🔴 踩坑（每个都花过时间）
- 🔴 **色号别贴着要渲染的文字**：写 `#28C2E7 sub '文字'` 会把 `#28C2E7` 印进图。颜色用**词**描述，色号只结尾单列 + 写「hex 只是样式、绝不渲染成文字」。
- 🔴 **别写字体规格标注**（例 `Source Han Sans 60px` 会被印进图）。
- 🔴 **人物一律本地 + 贴行业气质**：连屏幕里/模特/背景都本地人（例：美妆老板娘=年轻好皮肤、不要 aunty）。
- 🔴 **对比图/split-screen**：写 `full-bleed，这就是海报本身，NOT 印刷海报立街边/白框`，否则画「海报中的海报」。
- 🔴 **比例统一 3:4 竖版**。
- 🔴 **生成后一定 Read 图人工审**：色号泄漏 / 乱码 / 外国脸 / 撞 logo，任一命中就重出。

## Logo 合成（PIL 后期，别靠 prompt 留白）
prompt「留白」不可靠且会出假 logo。做法：**成图最上方叠一条纯色 header 带**，logo 放带内右侧，带色**自适应**（顶部浅→白带+深 logo，深→深带+白 logo），原图缩到留出带位、保持 3:4 → logo 永远有干净空位、不撞标题。

## 📌 完整实例（SUMA 真实产出 · 照抄结构，换成你的行业/受众/卖点）
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, orange-to-yellow gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '开中学补习班的你'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '教得再好，家长网上看不到你'.
Below headline: a solid red/deep-orange colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '1 天学会 AI内容营销系统，自己做出招生内容'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of a young Malaysian secondary-school (SPM) tuition teacher (around 30, sharp and professional, good skin light makeup, NOT an auntie) sitting alone at dusk in her bright classroom, a whiteboard still full of handwritten SPM-level questions (algebra equations, chemistry formulas), a row of empty student chairs beside her, textbooks and exam papers on the desk, her phone lying silent with no new enquiry, quietly waiting, a little worried, honest calm moment, natural window light, real camera look NOT AI-looking, authentic Malaysian.
Below the photo: an icon-checklist row, 6 small colourful circular icon badges with checkmarks and tiny labels: '✅AI文案', '✅AI图像', '✅AI数字人', '✅AI PPT', '✅AI音乐', '✅AI影片', small clean single row, must NOT dominate the poster.
A tiny price-hint line near the bottom: '从 RM500/人起'.
NO course name capsule, NO sign-up button, NO specific outcome guarantee to an individual (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is Chinese as specified, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters, the person is a real local Malaysian (photoreal, not cartoon/CGI), young professional teacher, never an auntie.
```
🔴 换行业时：受众 pill / 痛点标题 / 方案+成果 / 主角 / 卖点清单 全换成你业务的；**8 块结构 + CRITICAL 那段一字不动照搬**。

## 接进系统 + 归档（🔴 三处都要落，一处都不能跳）
出图 → PIL 合 logo → **成品三落**（见顶部「成品归档」铁律，别找借口）：
1. 本地成品 folder。
2. 🔴 **贴进 Notion 立项页「成品海报」块**：本地 PNG 没公开 URL → `media_upload`(成品.png) PUT 上传 → `media_confirm` → `show_medias` 取公开 URL → `notion-create-attachment` 的 `source_url` 喂它 → 拿 `markdown_source` → `notion-update-page`(insert_content) 贴进「成品海报」块（🔴 1 小时内贴完）。免费版 ≤5MiB，超了先压。
3. 🔴 **`rclone copy "<成品.png>" gdrive: --drive-root-folder-id <Drive成品folder ID>` 传进 Drive**。
🔴 **绝不说「图太大 / 传不了 Notion / 传不了 Drive / 你自己上传 / 你自己拖」** —— Notion 走 source_url、Drive 走 rclone，两条都跑得通。
> 📌 附：你（开发者 Cindy）自己用 token 直连 Notion API 时，附件要归 image 块自己（record.id=新建 image 块 id，否则渲染 Error 400）+ `getSignedFileUrls` GET=200 验证 —— 那是内部脚本路径，**学生用 connector 走上面 source_url 那套**。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，务必先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。


---

# 📚 完整参考资料（已全部收进本 skill · 按序号排 —— 下面就是各 md 全文，不用再翻别的文件）


---

## 📄 README.md

# Skill · AI 图像（工具：Higgsfield / nano_banana）

> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**

> 🔴 **底层三层（跟 SKILL.md 一致，这一包出的每样东西都要套）：① 说服（大师：**Blair Warren 为客户处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte 客户是英雄）· ② 语言（NLP：换框/未来预演/连续肯定/锚定）· ③ 动机（6 大人性需求：确定/新鲜/重要/爱与连接/成长/贡献）。做完要能说出「这套了哪个大师 + 哪个 NLP + 戳哪个人性需求」——说不出 = 只做了表面，重来。**



**在系统里的工位：** 出海报 / 成品图 —— 图文生产线的核心。

## 怎么用好（核心：场景化 + 画面感）
主视觉 = **该受众的真实日常场景**（照片级实拍 / documentary / NOT AI / 本地感），把痛点**可视化**，不是抽象排版。文字精简（headline + sub + 工具 pill + CTA 胶囊），让画面 carry。

**🔴🔴 标准 prompt 黄金模板（照这个逐行填 —— 这是产出好海报的结构，绝不缩水成一句场景）：**
以 **A 战报证明风** 为例（换风格只换视觉，TOP/headline/banner/MIDDLE/checklist/CRITICAL 结构不变）：
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, [品牌色] gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '[受众一句话，例:开中学补习班的你]'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '[痛点/反差主标题，例:教得再好，家长网上看不到你]'.
Below headline: a solid [品牌深色] colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '[方案+温和成果，例:1天学会…自己做出…]'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of [主角详细:本地人+年龄+气质，NOT auntie], [真实场景+道具+情绪], natural window light, real camera look NOT AI-looking, authentic [本地].
Below the photo: an icon-checklist row, [N] small colourful circular icon badges with checkmarks and tiny labels: '✅[卖点]' × [N], small clean single row, must NOT dominate the poster.
[可选·合规才放] a tiny price-hint line near the bottom: '[例:从 RMxxx 起]'.
NO course-name capsule, NO sign-up button, NO specific outcome guarantee to an individual (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is the Chinese specified above, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters; the person is a real local [本地] (photoreal, not cartoon/CGI).
```
🔴 **结构必须齐**：① TOP 受众 pill ② 大字痛点标题(3D描边) ③ 色块横幅=方案+温和成果 ④ 中段真人纪实照(NOT cutout·NOT auntie·本地) ⑤ 一行图标打勾清单 ⑥ 起价小字(合规才放) ⑦ 右上 logo 空位 ⑧ **CRITICAL 只渲染引号里中文·proofread·no garbled·绝不出英文**。🔴 绝不写 `no text overlay`（海报要字）。

## 海报风格库（5 种可选风格 · 按受众挑，🔴 同批次别全用同一种）
促销 / BoFu 海报可从这 5 种风格里挑，按你的行业 / 受众自由搭配：
- **A｜战报证明风**：立体描边大标题 + 实心横幅放一个**温和**的成果/转变陈述（不写离谱金额、不做个人结果保证）+ 圆形 icon 打勾清单 + 真人合照压底做背书。→ 需强背书的行业（电商、招生、补习、小生意老板）。
- **B｜信息流悬浮UI风**：深色背景真人拿手机/电脑，周围悬浮半透明发光 UI 卡片（内容一律抽象色块、**无可读文字**），标题带光效。→ 偏科技 / 年轻潮流（美妆、服装、副业人）。
- **C｜导师权威风**：深色科技背景，自信真人张开双臂"掌控"周围数据面板，一个**放大的数字/价格徽章**当视觉核心。→ 专业权威调性（保险、顾问、Marketer、打工人）。
- **D｜赛博游戏化风（慎用）**：高度风格化人物 + 霓虹 + 能量特效 + "LEVEL UP"式用语。冲击最强但最花哨，只在受众明显年轻/游戏化时用，**默认不用**。
- **E｜扁平色块对角风（最稳/保底）**：对角撞色色块 + 立体描边大标题 + icon 打勾清单 + 真人 + 真 logo。→ 补习/才艺班/克制的顾问型个人 IP。

## 通用海报硬规则（无论哪种风格都套）
1. 🔴 **人物用真人脸参考锁定身份**：`generate_image` 传 `medias:[{value:<media_id>, role:"image"}]` + prompt 写 `the person's face/identity MUST match the reference image exactly`，别让模型生成陌生脸。
2. 🔴 **同批次不同受众分配不同风格**，别整批长一样。
3. 🔴 **ToFu 不放价格**（价格是 BoFu 专属）：ToFu 改用一个**温和可信的时间型 hero 大字**（如「1 天」）做成渐变/发光巨字当视觉钩子，配小字呼应该行业产出。
4. 🔴 **画面 = 真实纪实场景 + 悬浮科技元素混搭**，不要纯棚拍/纯深色抠图 —— 人物必须在跟行业相关的**真实场景**里（电商打包桌、老师画室…），科技元素只做点缀。
5. 🔴 **屏幕内容** `abstract blurred colour blocks, NO legible text`（防乱码假 UI）。
6. 🔴 **右上留 logo 位** + prompt 写 `do NOT render the word 'LOGO'`（防占位字）。
7. 🔴 **不 overpromise**：不写夸张金额结果、不写「保证/包你/一定能」；可用温和时间框架（如「1 天学会」）。
8. **光效按漏斗层**：BoFu/促销 + ToFu 走 A–E 促销风格时可酌情用；ToFu 纪实软钩子风 + 所有 MoFu 仍**禁 sci-fi/glow**。

> 📎 例（仅示范，换成你行业）：BoFu 三档报价用「**人均价当巨大主视觉数字**」（人均价看着没那么痛，是更好的价格锚点），不用总价当大字；具体报价/人脸素材/命名是各品牌自己的事。

## 踩坑（我们学到的，每个都花过时间）
- 🔴 **色号别贴着要渲染的文字**：写 `#28C2E7 sub '文字'` 会把 `#28C2E7` 印进图。颜色用**词**描述，色号只在结尾单独注明 + 加「hex 只是样式、绝不渲染成文字」。
- 🔴 **别写字体规格标注**（`Source Han Sans 60px` 会被印进图）。
- 🔴 **人物一律本地 + 贴行业气质**：连屏幕里/模特/背景都要本地人；美妆老板娘=年轻漂亮好皮肤，**不要 aunty**。
- 🔴 **对比图/split-screen**：写 `full-bleed，这就是海报本身，NOT 印刷海报立街边/易拉宾/白框`，否则模型画「海报中的海报」。
- 🔴 **logo 别让 AI 画**（会出假 logo）：右上/顶部留空，真 logo 后期 PIL 合成。
- 🔴 **比例统一 3:4 竖版**。
- 🔴 **生成后一定 Read 图人工审**：色号泄漏 / 乱码 / 外国脸 / 撞 logo。

## Logo 合成（PIL，系统关键技巧）
不靠 prompt「留白」（不可靠 + 会出假 logo），也不用底板——**在成图最上方叠一条纯色 header 带**，logo 放带内右侧。带色**自适应**：取顶部亮度，浅→白带+蓝 logo，深→深带+白 logo。原图缩到留出带位、保持 3:4。→ logo 永远有干净空位、绝不撞标题。

## 接进系统 + 归档（🔴 三处都要落，一处都不能跳）
出图 → PIL 合 logo → 成品三落，**别找借口**：
1. 本地成品 folder。
2. 🔴 **贴进 Notion 立项页「成品海报」块**：学生用 Notion connector，本地 PNG 没公开 URL → 用 Higgsfield `media_upload`(成品.png) PUT 上传 → `media_confirm` → `show_medias` 取公开 URL → 喂 `notion-create-attachment` 的 `source_url` → 拿 `markdown_source` → `notion-update-page`(insert_content) 贴进「成品海报」块（🔴 1 小时内贴完；免费版 source_url ≤5MiB，超了先压）。
3. 🔴 **`rclone copy "<成品.png>" gdrive: --drive-root-folder-id <Drive成品folder ID>` 传进 Drive**（文件名=页内 heading）。
🔴 **绝不说「图太大 / 传不了 Notion / 传不了 Drive / 你自己上传 / 你自己拖」**。
> 📌 附：开发者用 token 直连 Notion API 时附件要归 image 块自己（record.id=新 image 块 id，否则 Error 400）+ getSignedFileUrls GET=200 —— 那是内部脚本路径，学生走上面 source_url 那套。

