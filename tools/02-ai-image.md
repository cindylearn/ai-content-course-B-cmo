# Skill · AI 图像（工具：Higgsfield / nano_banana）

**在系统里的工位：** 出海报 / 成品图 —— 图文生产线的核心。

## 怎么用好（核心：场景化 + 画面感）
主视觉 = **该受众的真实日常场景**（照片级实拍 / documentary / NOT AI / 本地感），把痛点**可视化**，不是抽象排版。文字精简（headline + sub + 工具 pill + CTA 胶囊），让画面 carry。

**Prompt 骨架（图文海报）：**
```
vertical 3:4 portrait poster, photoreal documentary real-camera, NOT AI, 本地感
+ SCENE: [受众真实场景，人物+道具+情绪]
+ 中文 headline / sub（用颜色词描述颜色，别贴 hex）
+ 一行 6 工具 pill 标签
+ 底部 CTA 胶囊
+ 顶部/右上留空给 logo（后期合成）
+ 🔴护栏：只渲染引号里的中文；色号不当文字；无假 logo/watermark；人物一律本地；无乱码
```

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

## 接进系统
出图 → PIL 合 logo → 上传 Notion（**图片附件必须归 image 块自己**，否则渲染 Error 400；上传后验证图真的渲染 200）→ 改状态 → Drive 归档（文件名=页内 heading）。
