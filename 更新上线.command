#!/bin/bash
# ============================================================
#  一键更新上线脚本
#  用法:在原始 HTML 改完内容后,双击本文件即可
#  它会:1) 把最新的原始文件同步进网站文件夹
#       2) 提交并推送到 GitHub  → Cloudflare 自动重新部署
# ============================================================

cd "$(dirname "$0")" || exit 1

SRC="/Users/hll/Desktop/高手进阶：数据分析能力提升 的大型指南（第二次更新）"

echo "🔄 正在同步最新内容..."

cp "$SRC/知识星球_视频下载/ABtest与因果推断/汇总/★终版-《ABtest与因果推断》交互练习册.html"        "abtest/index.html"     && echo "  ✅ ABtest与因果推断"
cp "$SRC/知识星球_视频下载/2小时速通统计学/汇总/★终版-《2小时速通统计学》交互练习册.html"          "tongjixue/index.html"  && echo "  ✅ 2小时速通统计学"
cp "$SRC/知识星球_视频下载/详解-销售分析/《详解·销售分析》学习训练册.html"                          "xiaoshou/index.html"   && echo "  ✅ 详解·销售分析"
cp "$SRC/知识星球_视频下载/行业分析大合集-游戏/汇总/★终版-《游戏行业分析》交互练习册.html"          "youxi/index.html"      && echo "  ✅ 游戏行业分析"
cp "$SRC/知识星球_视频下载/高手思维-结构化思维/《高手之路·结构化思考》学习训练册（完整版）.html"    "jiegouhua/index.html"  && echo "  ✅ 高手之路·结构化思考"
cp "$SRC/崔崔职场课/能成事的表达课/31节完整视频课/能成事的表达课-学习训练册.html"                  "biaoda/index.html"     && echo "  ✅ 能成事的表达课"

echo ""
if git diff --quiet && git diff --cached --quiet; then
  echo "ℹ️  内容没有变化,无需更新。"
else
  echo "📤 正在推送到 GitHub..."
  git add -A
  git commit -m "更新内容 $(date '+%Y-%m-%d %H:%M')"
  if git push; then
    echo ""
    echo "🎉 完成!Cloudflare 将在约 1 分钟内自动更新线上网站。"
  else
    echo ""
    echo "⚠️  推送失败。可能原因:还没连 GitHub 远程仓库,或需要登录。"
    echo "    第一次请先按文档完成"创建仓库 + 推送"那一步。"
  fi
fi

echo ""
echo "（窗口可关闭）"
