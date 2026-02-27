#!/bin/bash

# 定义要替换的图片映射
declare -A IMAGE_MAP=(
  # 头像
  ["https://avatars.githubusercontent.com/u/6887683?v=4"]="/images/avatars/github-avatar.jpg"
  
  # 论文图片
  ["https://tencent.github.io/MimicMotion/favicon.svg"]="/images/papers/mimicmotion-preview.png"
  ["https://github.com/megvii-research/MOTR/raw/main/figs/motr.png"]="/images/papers/motr-framework.png"
  ["https://raw.githubusercontent.com/zyayoung/oss/main/motrv2_main.jpg"]="/images/papers/motrv2-demo.jpg"
  ["https://github.com/HenryHuYu/DiffPhysDrone/blob/master/gifs/20ms.gif?raw=true"]="/images/papers/diffphys-drone.gif"
  ["https://camo.githubusercontent.com/a18cd263d531c2fde6b909b40e85d97fc6db6f81dd0fcd937e870f390c34b058/68747470733a2f2f692e696d6775722e636f6d2f73684937636e342e706e67"]="/images/papers/iter-deformable-detr.png"
  ["https://github.com/DavidWu0928/OnlineRefer/blob/main/assets/online_refer.png?raw=true"]="/images/papers/online-refer.png"
  ["https://github.com/Megvii-BaseDetection/MOTRv3/blob/main/assets/architecture.png?raw=true"]="/images/papers/motrv3-architecture.png"
  ["https://github.com/yuanz27/VPD/blob/master/images/total_result.png?raw=true"]="/images/papers/variational-pedestrian.png"
  ["https://github.com/yuanz27/vpof/blob/master/images/method_overview.jpg?raw=true"]="/images/papers/optical-flow-obstacle.jpg"
  ["https://camo.githubusercontent.com/fdcef4d136f7eebdcef8f283f5a9f6b5826fcf8bf9e0fe80ccf57fc5a3075a97/68747470733a2f2f692e696d6775722e636f6d2f4f4f684645785a2e706e67"]="/images/papers/vlm-eval.png"
  ["https://github.com/Mikachu233/Consistent-Video-Colorization/blob/main/docs/overview.png?raw=true"]="/images/papers/video-colorization.png"
  ["https://github.com/Tencent/ShoulderShot/blob/main/assets/poster.png?raw=true"]="/images/papers/shouldshot-poster.png"
  
  # 项目图片
  ["https://tencent.github.io/MimicMotion/favicon.svg"]="/images/projects/mimicmotion-icon.svg"
  ["https://github.com/megvii-research/MOTR/raw/main/figs/motr.png"]="/images/projects/motr-framework.png"
  ["https://raw.githubusercontent.com/zyayoung/oss/main/motrv2_main.jpg"]="/images/projects/motrv2-demo.jpg"
  ["https://github.com/HenryHuYu/DiffPhysDrone/blob/master/gifs/20ms.gif?raw=true"]="/images/projects/diffphys-drone.gif"
  ["https://camo.githubusercontent.com/a18cd263d531c2fde6b909b40e85d97fc6db6f81dd0fcd937e870f390c34b058/68747470733a2f2f692e696d6775722e636f6d2f73684937636e342e706e67"]="/images/projects/iter-deformable-detr.png"
  ["https://camo.githubusercontent.com/fdcef4d136f7eebdcef8f283f5a9f6b5826fcf8bf9e0fe80ccf57fc5a3075a97/68747470733a2f2f692e696d6775722e636f6d2f4f4f684645785a2e706e67"]="/images/projects/vlm-eval.png"
)

# 源文件
SOURCE_FILE="src/pages/index.astro"
BACKUP_FILE="$SOURCE_FILE.backup"

# 备份原文件
cp "$SOURCE_FILE" "$BACKUP_FILE"

echo "开始更新图片引用..."

temp_file=$(mktemp)
cp "$SOURCE_FILE" "$temp_file"

# 进行替换
for remote_url in "${!IMAGE_MAP[@]}"; do
  local_path="${IMAGE_MAP[$remote_url]}"
  echo "替换: $remote_url -> $local_path"
  
  # 使用sed进行替换，注意转义特殊字符
  safe_remote_url=$(printf '%s
' "$remote_url" | sed 's/[\/&]/\\&/g')
  safe_local_path=$(printf '%s
' "$local_path" | sed 's/[\/&]/\\&/g')
  
  sed -i '' "s|$safe_remote_url|$safe_local_path|g" "$temp_file"
done

# 检查替换效果
echo "检查替换结果..."
num_changes=$(diff "$SOURCE_FILE" "$temp_file" | grep -c "^<")

echo "共进行了 $num_changes 处替换"

# 如果替换成功，则更新原文件
if [ $num_changes -gt 0 ]; then
  cp "$temp_file" "$SOURCE_FILE"
  echo "✅ 成功更新了 $num_changes 个图片引用"
  echo "原文件已备份为: $BACKUP_FILE"
else
  echo "⚠️ 没有进行任何替换"
fi

rm -f "$temp_file"

echo "完成!"