#!/bin/bash
# 把这 9 个 skill 全部装进 ~/.claude/skills/
set -e
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"
HERE="$(cd "$(dirname "$0")" && pwd)"
for d in "$HERE"/*/; do
  name="$(basename "$d")"
  [ -f "$d/SKILL.md" ] || continue
  rm -rf "$DEST/$name"
  cp -R "$d" "$DEST/$name"
  echo "✅ 装好: $name"
done
echo "全部 9 个 skill 已装进 ~/.claude/skills/ —— 重开 Claude 就能用。第一次调 suma-ai-00-setup。"
