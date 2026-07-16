---
name: chatcut-editing
description: >-
  用 ChatCut MCP 剪中文竖屏广告片（口播 + B-roll + 字幕 + 重点字 + 音效 + BGM）的完整作战手册。
  含全部库存清单（音效35 / 转场13 / 特效9 / 推近4 / MG 210 / LUT 2）、每个 ID 的中文说明、
  以及 2026-07-15 实战踩出来的 12 个坑（fps、字幕、中文、音频、素材）。
  When to use: 要用 ChatCut 剪任何中文影片；或者别的 AI 剪辑工具做不到中文字幕/花字时。
  ⭐ 动手前先读「12 个坑」——每一条都是真金白银试出来的，不读会重蹈覆辙。
  ⭐⭐ 最贵的一条：**转录是可以改的源数据，不是只读事实**。标点写回转录 = 一切分页问题的根治。
---

# ChatCut 剪辑作战手册

> 实战基准：SUMA「AI 内容课」Jared LP 广告片，84 秒竖屏，2026-07-15
> Project: `007d3e90-42f3-4e24-bbbe-f5b00c66c327`

---

## 为什么是 ChatCut

同一天试过、全部撞死的路：

| 工具 | 死因 |
|---|---|
| Gemini Omni | 生成不可控 |
| HyperFrames | **拉丁文专用** —— 字体、ASCII 匹配器、16:9 锚点全是为英文写的 |
| 剪映 | **草稿加密**，程序化剪辑走不通（UI 自动化慢且脆） |
| Seedance 生 B 机 | 会重造人脸 |

**ChatCut 是唯一为 agent 设计、且认真做过中文的剪辑器**（音效库说明都是中文写的）。

---

# 🔴 14 个坑（动手前必读）

## 0. 说明写的是「功能」，不是「文化」 ⚠️ 最根本的一条

`vine-boom-impact` 的说明写着「适合…**重点字幕**」—— 功能上完全正确。
**但 Vine Boom 是网络迷因音效**，带强烈的戏谑/反讽语气。打在学院的专业课程广告上 = **调性灾难**。

**库里的说明只告诉你它「做什么」，不告诉你它「听起来像什么文化」。**

### 三问判断法（每个候选都要过）

> **① 形状对不对？** 砸 / 飞 / 卡进位 / 累积 —— 跟动画匹配吗？
> **② 这个声音属于哪个文化圈？** 我在哪听过它？谁在用它？
> **③ 那个文化圈，跟这个品牌是同一群人吗？**

**第 ② 问是关键。** 说明书永远不会写「这是 Z 世代玩梗音」—— 你得自己问「我在哪听过」。

### ⚠️ 没有绝对的禁忌音 —— 别背黑名单

唱片刮擦在潮牌片里是神来之笔，罐头笑声在综艺里是刚需。
**只有「这个声音的文化圈」和「这个品牌的人群」对不对得上。**

**黑名单会过时**（库一更新就废），**而且把「判断」降级成「查表」**。
**AI 的活是拿到品牌人格后，对整个库跑一遍三问，列出候选 + 每个的理由。**

### 本片（学院品牌，「沉稳/有底气/不玩梗」）跑完三问的结论

| ✅ 过了 | 理由 |
|---|---|
| `deep-short-whoosh` | 砸 · 电影预告感 · 有重量不搞笑 |
| `sharp-bass-riser` | 低频冲击 · 商业片 |
| `short-drum-roll-sting` | 揭晓 · 颁奖/公布 · 庄重 |
| `gear-turn-click` | 卡进位 · 精密机械 · **而且本片论点就是「串成一台机器」——声音在演绎主题** |
| `short-shutter-click` | 干净定格 |
| `clean-ding` / `light-clock-tick` | 完成 / 倒计时 |
| `tr-rack-focus` `tr-clean-line-wipe` `tr-anticipation-zoom` `tr-flash` `tr-luma-blend` | 电影语言 |

| ❌ 形状对但文化圈不对 | 属于哪个圈 |
|---|---|
| `vine-boom-impact` | Z 世代玩梗 |
| `anime-wow-reaction` | 动漫/综艺 |
| `sitcom-laugh-track` | 情景喜剧 |
| `awkward-crow-flyby` | 冷场梗 |
| `record-scratch-stop` / `-rewind` | DJ / 喜剧打断 |
| `dramatic-thunder-roll` | 过度戏剧 |
| `tr-impact-shake` | 电竞 / 赛博（RGB 分离）|
| `fx-crt` / `fx-ascii-rain` | 赛博 / 复古亚文化 |

**这是「本片的结论」，不是「通用规则」。换品牌重跑三问。**

## 1. fps 必须 30 —— 填「原片的真实 fps」会炸

`create_project` 的 `fps` 默认 30。**不要改。**

原片 24fps → 我诚实地填 24 → **字幕引擎硬编码 30fps**，结果：
- 时间线 2017 帧 @24fps = 84 秒 ✅ 画面正常
- 字幕引擎认为 2017 帧 = 67 秒
- **67 秒之后的字幕全部掉出时间线，永远不出现**
- 前面的全部漂移 1.25 倍（= 30÷24）

**判据**：`find_transcript` 找不到片尾的句子 = 你中招了。
**修法**：新建 30fps 项目重铺。`manage_timelines` **没有 fps 参数**，改不了。

## 2. 转录是可以改的源数据 —— 这是最贵的一条

`manage_transcript action=fix` 能改任何词。**标点是地基，不是排版细节。**

无标点转录 → 分页器只能按长度硬切 → 我手工打了 21 个断点去救。
**把标点写回去** → 转录引擎当场重新分段（2 大坨 → 26 个干净句子）→ 分页自己就对了。

而且标点顺手修 ASR 黏词：
```
"张图会"    → "张图，" + "会写句"     逗号进去 + 「会」还给下一句
"作图"      → "做，图"                错字 + 逗号 + 断句，一刀三修
"AIPPTAI"   → "AI PPT、" + "AI 音乐、" 拆开合体词
```

**先修转录，再调分页。** 反过来是在修症状。

## 3. 中文逐字高亮是废的 —— `highlightUnit` 别碰

中文 ASR 的「word」= **单个字**。`highlightUnit:"word"` = 逐字卡拉OK，高亮的是「现」「都」「套」这种废字。

**ChatCut 默认给 CJK 关掉（`CJK=off`），它是对的。** 我强行打开 = 覆盖掉它的正确判断。

**「重点字」只能用 MG 层做。** `display_text` 只能换字/隐藏/拆句，**不能给单词上色或放大**。

## 4. 描边是宋体的天敌（犯了两次）

宋体的辨识度全靠**横细竖粗 + 三角衬脚**。描边 >5px 会把细横笔画整个吞掉 → 看起来就是黑体。

**宋体用阴影，不用描边。**
```json
{"strokeWidth": 4, "shadowStrength": 85}          // 字幕
textShadow: '0 5px 0 rgba(0,0,0,.55), 0 12px 26px rgba(0,0,0,.9)'  // MG 纯色字
```

## 5. `normalBackground: null` 静默失效

传 `null` → 不报错、不生效、不进 `ignoredFields`。**最坑的那种。**
**要用 `{"backgroundOpacity": 0}`。**

## 6. 空格算字数

「6 个 AI 技能」看着 6 个字，实际占 **9 格**（`6`+空格+`个`+空格+`AI`+空格+`技能`）。
中英混排的卡要多留 2–3 格预算。

## 7. 一卡一行，否则词组会被劈开

`maxLines:2` → 换行处会切断词组（「这堂课」→「这堂 / 课」）。
**`maxLines:1` + `maxCharactersPerLine:9`** = 每张卡一个完整词组。

## 8. `split_item` 会孤儿化字幕覆盖

切片段 → 旧 item ID 销毁 → 所有 `display_text` 覆盖失效（`edited` 标记消失，断句全部退回）。

**顺序：先切片段，再做断句。**
好消息：**词的 sub-ID 是稳的**，只有 item 前缀变。按帧段换前缀就能批量重建：
```
旧 0ca218cf29:d14dd26559 → 新 8c0132d019:d14dd26559
```

## 9. 声音出问题，先查开关，再查音量

BGM「太小声」调了三轮（16%→62%→85%）—— **那条轨是 `muted: true`**。
症状跟音量不足一模一样，所以会一直往音量上修。

**`edit_track action=list` 会回 `muted` 状态。先看它。**

## 10. 别压两层

`role:"follower"`（自动闪避）+ 手动 `volume:0.16` = 叠加衰减，几乎无声。
**闪避管人声下的压低，底噪就该是正常音量。**
```
BGM: decibelAdjustment ≈ -1.4  +  duckDepthDb: -19
```

## 11. 音效长度差 20 倍 —— 加之前看时长

`short-shutter-click` 6 帧 · `light-clock-tick` **1508 帧（50 秒循环）**
我铺了一条 50 秒的滴答声，一路响到片尾外面。

**循环类音效（`*-loop`, `*-tick`）必须裁 + 淡出。**

## 12. 先看素材，再放素材

`fx-luma-key` + Pixabay「gold glitter」→ 实拍是**洋红色泡泡**，糊了主播一脸。
**标签会骗人。** ChatCut 当时就警告过：

> `visualReviewRequired: use view_asset_frames to inspect this item's source frame(s)`

**它叫你先看，就先看。**

## 12.5 S3 直传的两个坑（走底层通道时）

`import_media` 的正式通道被 WAF 挡（403，卡在 128KB）→ 只能走 `request_asset_upload_url` + S3 直传。

| 坑 | 现象 | 解法 |
|---|---|---|
| 🔴 **`size` 必须是精确字节数** | 估一个 → **403**。预签名 URL **签了 `content-length`**，差一个字节签名就废 | 先 `ls -l` / `stat` 量准再报 |
| 🟡 **S3 会瞬时 503** | 第一次 503，重试立刻 200 | **要有重试**（3 次 + 退避）|
| 🔴 **这条路没有标点** | 底层通道不走正式 ingest → 转录**无标点** | 用 `manage_transcript fix` 补（见坑 #2）|

## 12.6 多分镜可以直接排，不用先拼 —— 但通常不该这么做

**实测**：`edit_item` 的 `alignTo:"track-end"` **自动首尾相接**，连 **24fps 源 → 30fps 项目**都自动换算。

```json
{"adds":[
  {"type":"video","assetId":"...","trackId":"...","fromFrame":0},
  {"type":"video","assetId":"...","trackId":"...","alignTo":"track-end"},   // → 自动 from=298
  {"type":"video","assetId":"...","trackId":"...","alignTo":"track-end"}    // → 自动 from=596
]}
```

**所以理论上能省掉 ffmpeg concat。但通常不划算：**

| | 8 支直传 | 先拼成 1 支 |
|---|---|---|
| 转录 | **8 段** | 1 段 |
| 补标点 | **×8**（最费工的一步）| ×1 |
| 跨分镜的句子 | **会被切断**（一句话跨两个 shot → 字幕断开）| 完整 |

**→ 先拼再传。** `alignTo` 留给「本来就要分开处理每段」的场景。

## 13. 先翻库，再手写 ⚠️ 今天最贵的时间

`browse_library category=motion-graphics` = **210 个现成 MG**，含：
- `text-effects` 8 · `talking-head-overlays` 8 · `title-cards` 26 · `lower-thirds` 10
- 「**Talking Head Keyword Card**」= 我手写的重点字卡
- 「**Numbered Talking Head Overlay**」= 我手写的六宫格

**我一个都没翻，全部从零写。** 动手前先 `browse_library`。

---

# 库存清单

## 🔊 音效 35 个（`browse_library category=sound-effects`）

### UI & Motion Feedback（13）
| ID | 说明 |
|---|---|
| `tiny-bubble-pop` | 极短气泡 pop，MG 卡片/贴纸/提示气泡弹出 |
| `synthetic-bubble-pop` | 有设计感的合成气泡，卡片弹出/按钮反馈 |
| `keyboard-typing-loop` | 连续键盘声，搜索/代码/表单/打字机 |
| `slow-dell-keyboard-typing` | 慢速真实键盘，办公/录屏感 |
| `mouse-click` | 清晰鼠标点击，按钮/选中/教程操作反馈 |
| `new-notification-ping` | 短促新消息提醒 |
| `ui-pop-up-alert` | UI 弹窗/提醒 |
| `phone-notification-ping` | 手机通知 |
| `sent-message-ping` | 发送消息提示，表单提交/任务完成 |
| `video-call-ringtone` | 视频来电铃声 |
| `clean-ding` | 干净叮声，成功/完成/**重点强调** |
| `censor-beep` | 消音哔（脏话遮盖）|
| `cash-register-success` | 收银机成交声，**价格/金额/数字展示** |

### Transition & Emphasis（9）
| ID | 说明 |
|---|---|
| `simple-whoosh` | 短促干净飞入/切换扫过 |
| `deep-short-whoosh` | 低沉干声短 whoosh，**有重量感的重点信息出现** |
| `airy-short-whoosh` | 轻、空气感，贴纸/字幕/UI 滑入滑出 |
| `long-suspense-riser` | 长上升铺垫，悬念/揭晓/倒计时 |
| `fast-suspense-riser` | 快速 riser，短视频制造期待接反转 |
| `sharp-bass-riser` | 很短的低频上升，冲击/标题弹出前铺垫 |
| `short-drum-roll-sting` | 短滚鼓，答案揭晓/排名公布 |
| `record-scratch-stop` | 唱片刮擦急停，突然打断/喜剧转场 |
| `record-scratch-rewind` | 更长的 scratch，倒放/回到前一刻 |

### Device & Texture（8）
| ID | 说明 |
|---|---|
| `camera-shutter` | 标准快门，拍照/截图/**画面定格** |
| `vintage-camera-shutter` | 复古快门，旧片感定格 |
| `short-shutter-click` | 极短快门/点击，轻量定格，**也能当转场** |
| `mechanical-clicking-loop` | ⚠️循环 机械运转，齿轮/设备启动 |
| ⭐ `gear-turn-click` | 短齿轮卡扣，**数字滚动、同类元素切换（并列项！）** |
| ⚠️ `light-clock-tick` | ⚠️**循环 1508 帧** 轻时钟滴答，**倒计时/紧张** |
| `glitchy-tv-signal` | 信号故障质感，MG motion/glitch 转场 |
| `tv-switch-off-noise` | 电视关机噪，**MG 消失动画/收尾** |

### Reaction & Mood（5）
| ID | 说明 |
|---|---|
| ⭐ `vine-boom-impact` | 经典低频 boom，震惊/反转/**重点字幕**/画面停顿 |
| `dramatic-thunder-roll` | 雷声（情绪烘托，非环境音）|
| `anime-wow-reaction` | 动漫/综艺正向 wow，**隆重登场/揭幕** |
| `awkward-crow-flyby` | 乌鸦冷场，尴尬沉默 |
| `sitcom-laugh-track` | 罐头笑声 |

## 🎬 转场 13 个（`category=transitions`）

| ID | 说明 | 需要素材余量？ |
|---|---|---|
| `tr-impact-shake` | 抖动 + RGB 分离 + 闪光，**在切点上打一下** | ❌ 不需要 |
| `tr-flash` | 中点爆白 + 过曝光晕 | ❌ |
| `tr-anticipation-zoom` | 先回缩 → 猛推 + 方向拖影 | 少量 |
| `tr-rack-focus` | 失焦成散景 → 回焦 + 色差光晕 | 少量 |
| `tr-whip-pan` | 甩镜：A 拖出 B 甩入 + 弹性回弹 | 少量 |
| `tr-luma-blend` | 按亮度混合，提亮高光 | 是 |
| `tr-cross-dissolve` | 叠化 | 是 |
| `tr-dip-to-black` | 淡黑→停→淡出（**吃时间**）| 是 |
| `tr-soft-wipe` | 羽化横向擦除 + 视差 | 是 |
| `tr-clean-line-wipe` | 细线扫过的方向性擦除 | 是 |
| `tr-organic-dissolve` | 有机噪波边缘 + 发光烧穿 | 是 |
| `tr-page-curl` | 翻页卷曲 + 纸张纹理 | 是 |
| `tr-audio-cross-fade` | 音频接缝交叉淡化 | — |

**🔑 关键认知**：ChatCut 转场标记为 `visual XXX` —— **它是「在接缝上盖一层视觉效果」，不是两段重叠混合**。所以：
- 片段是**对接**的，不重叠、不重复画面、**完全不碰音频**
- 在连续素材上 `split_item` 后加转场 **不会**产生回音或冻帧
- 用法：`{type:"transition", assetId, outgoingItemId, incomingItemId, durationInFrames}`
- 竖屏广告：**10–14 帧（0.33–0.47 秒）**，1 秒太拖

## ✨ 特效 9 个（`category=fx`）

| ID | 说明 |
|---|---|
| ⭐ `fx-shake` | Camera Shake：fbm 噪波抖动 + 旋转 + 缩放 + 呼吸脉冲 |
| `fx-magnify` | 圆形放大镜 + 白边框（指 UI 细节）|
| `fx-tilt-shift` | 移轴微缩 + 饱和度提升 + 暗角 |
| `fx-crt` | CRT 复古：扫描线 + 屏幕曲率 + RGB 偏移 + 噪点 |
| `fx-ascii-rain` | 蓝色 ASCII 字符雨落在亮部 |
| ⭐ `fx-luma-key` | **黑底素材叠加**（火焰/烟/光效/粒子）—— 抠黑留亮 |
| ⭐ `fx-circle-mask` | 软边圆形遮罩（**圆形 PIP 反应窗**）|
| `fx-rect-mask` | 圆角矩形遮罩 |
| `fx-local-mosaic` | 局部马赛克打码 |

**剪映有但 ChatCut 没有**：像素化 / 百叶窗 / 拼贴 / 火焰 / 爱心 / 旋转 / 燃烧 / **全部人物特效**。
**人物特效做不了的根因**：缺 **人物分割 AI** 和 **人脸追踪**。所以「人物聚焦/高光时刻/大头/电光眼」不可能。

## 🔍 推近 4 个（`category=zoom`）

| ID | 说明 |
|---|---|
| `zoom:punch` | 快速推近冲击 |
| `zoom:instant` | 瞬间放大，无动画 |
| `zoom:slow-push` | 全片渐渐放大 |
| `zoom:hold` | 推入 → 停 → 退出 |

用法：`{type:"effect", assetId:"library:zoom:punch", trackId, fromFrame, durationInFrames}`

## 🎨 MG 210 个（`category=motion-graphics`）⚠️ 先翻这个

| 组 | 数量 |
|---|---|
| Uncategorized | 102 |
| Data Visualization | 35 |
| Title Cards | 26 |
| Infographics | 12 |
| Lower Thirds | 10 |
| **Talking Head Overlays** | **8** |
| **Text Effects** | **8** |
| Quote Cards | 5 |
| Social Media | 3 |

## 🎞 LUT 2 个 · Audio-FX 0 个（空）

---

# 中文字幕配方（实战验证）

```json
// 1. enable + 套 bili 预设（原生 Noto Sans SC，唯一原生 CJK 的预设之一）
{"action":"enable", "preset":"bili"}

// 2. 换宋体 + 关掉逐字高亮 + 一卡一行
{"action":"style", "json":{
  "fontFamily":"Noto Serif SC",   // 思源宋体，开源免费商用
  "fontWeight":"900",
  "sizePx":145,                    // 84秒竖屏的甜蜜点
  "color":"#FFFFFF",
  "highlightUnit":"off",           // 🔴 中文必须 off
  "maxLines":1,                    // 🔴 否则词组会被劈开
  "maxCharactersPerLine":9,
  "strokeWidth":4,                 // 🔴 >5 会吃掉宋体的细笔画
  "shadowStrength":85,
  "backgroundOpacity":0            // 🔴 传 null 无效
}}

// 3. 只读 V1，不要读音效/BGM 轨
{"action":"source_set", "json":{"mode":"explicit","sources":[{"trackId":"V1"}]}}
```

**原生 CJK 字体的预设**：`bili`（Noto Sans SC）· `tiktok`（Noto Sans SC）· `deyi-card`（Smiley Sans）
**字体授权**：`Noto Serif SC` = 思源宋体，免费商用 ✅ ｜ **极宋/研宋 = 造字工房/汉仪付费字库，商用有维权风险** ❌

---

# 重点字（花字）配方

**字幕轨做不到，只能 MG。** 四维同时叙事：

| 维度 | 规则 |
|---|---|
| **文字** | 挑「观众认得的那个**东西**」，不挑形容词。<br>✅ `AI 课` `慢慢手做`　❌ `一大堆` `一条一条` |
| **长度** | **≤5 字**。175px × 7 字 = 1225px > 1080 画面宽，装不下 |
| **颜色** | 白=问题 → 品牌色=解方 → 强调色=最核心（≤3 处）。<br>🔴 深色品牌色（#0F75BC）打在深色底上=隐形 |
| **形式** | 纯色字=常规（不挡画面）· 胶囊=最狠的 5 个。**光靠「有没有底」就分出主次** |
| **动画** | 否定→stamp · 列举→slide · 揭晓→wave · 承诺→pop |
| **音效** | stamp→`vine-boom-impact` · 列举→`gear-turn-click` · pop→`short-shutter-click` |

**🔑 动画和音效的形状必须匹配**：
逐字弹入 15 帧 × 单发 whoosh = 声音在开头、爆点在 0.5 秒后 = **「不配」**。
**把动画压进 5 帧内**，声音和爆点才同步。

**whoosh = 东西飞过去 ｜ boom = 字砸下来。** 用错类别，帧位再准也不配。

---

# 工作流（正确顺序）

```
1. create_project fps=30 (别改!) → 1080x1920
2. 上传素材
   ├─ import_media（正式通道，转录带标点）← 首选
   └─ WAF 挡了(403)？→ request_asset_upload_url → S3 直传 → finalize
      ⚠️ 代价：这条路的转录**没有标点**
3. 转录 → manage_transcript action=fix 把标点写回去 ⭐⭐
4. split_item 切片段（如果要转场）← 必须在断句之前
5. enable captions + style + source_set
6. browse_library ⭐ 先翻 210 个 MG，别急着手写
7. 铺 MG / 转场 / fx / 音效
8. edit_track: V1=anchor, BGM=follower + duckDepthDb
9. edit_track action=list 查 muted ⭐
10. view_timeline_frames 逐帧验
```

**每改一步都 `view_timeline_frames` 验** —— 它是云渲染，不用等人看。
**`read_captions` 的 frame 是估算**（工具自己说 `timing is render-dependent`），页边界以渲染为准。

---

# 已知 ChatCut 缺陷

| 缺陷 | 影响 |
|---|---|
| 字幕/转录引擎硬编码 30fps | 非 30fps 项目字幕全崩（见坑 #1）|
| `manage_timelines` 文档说能改 fps，实际无此参数 | 建错了只能重建 |
| `normalBackground: null` 静默失效 | 用 `backgroundOpacity: 0` |
| S3 直传通道的转录无标点 | 用 `manage_transcript fix` 补 |
| `find_transcript` 也按 30fps 算 | 非 30fps 时找不到片尾句子 |
| 内嵌 `show_preview` 在桌面版渲不出 | 直接开 editor URL |
| 云渲染偶尔超时 | 减少 frames 数量重试 |
