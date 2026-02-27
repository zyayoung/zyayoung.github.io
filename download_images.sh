#!/bin/bash

# 设置目录
IMAGES_DIR="public/images"
PAPERS_DIR="$IMAGES_DIR/papers"
PROJECTS_DIR="$IMAGES_DIR/projects"
AVATARS_DIR="$IMAGES_DIR/avatars"

# 创建目录
mkdir -p $PAPERS_DIR $PROJECTS_DIR $AVATARS_DIR

# 下载函数
download_image() {
  local url=$1
  local output=$2
  local filename=$(basename $output)
  
  echo "正在下载: $filename"
  
  # 使用curl下载所有图片
  curl -L -s "$url" -o "$output" --retry 3 --retry-delay 2
  
  if [ $? -eq 0 ] && [ -f "$output" ] && [ -s "$output" ]; then
    echo "✓ 下载成功: $filename ($(stat -f%z $output) bytes)"
  else
    echo "✗ 下载失败: $filename"
    # 如果失败，尝试删除空文件
    [ -f "$output" ] && rm -f "$output"
  fi
}

# 开始下载图片
echo "开始下载图片..."

# 头像
download_image "https://avatars.githubusercontent.com/u/6887683?v=4" "$AVATARS_DIR/github-avatar.jpg"

# 论文图片
download_image "https://camo.githubusercontent.com/a18cd263d531c2fde6b909b40e85d97fc6db6f81dd0fcd937e870f390c34b058/68747470733a2f2f692e696d6775722e636f6d2f73684937636e342e706e67" "$PAPERS_DIR/iter-deformable-detr.png"

download_image "https://camo.githubusercontent.com/fdcef4d136f7eebdcef8f283f5a9f6b5826fcf8bf9e0fe80ccf57fc5a3075a97/68747470733a2f2f692e696d6775722e636f6d2f4f4f684645785a2e706e67" "$PAPERS_DIR/vlm-eval.png"

download_image "https://github.com/DavidWu0928/OnlineRefer/blob/main/assets/online_refer.png?raw=true" "$PAPERS_DIR/online-refer.png"

download_image "https://github.com/HenryHuYu/DiffPhysDrone/blob/master/gifs/20ms.gif?raw=true" "$PAPERS_DIR/diffphys-drone.gif"

download_image "https://github.com/Megvii-BaseDetection/MOTRv3/blob/main/assets/architecture.png?raw=true" "$PAPERS_DIR/motrv3-architecture.png"

download_image "https://github.com/Mikachu233/Consistent-Video-Colorization/blob/main/docs/overview.png?raw=true" "$PAPERS_DIR/video-colorization.png"

download_image "https://github.com/Tencent/ShoulderShot/blob/main/assets/poster.png?raw=true" "$PAPERS_DIR/shouldshot-poster.png"

download_image "https://github.com/megvii-research/MOTR/raw/main/figs/motr.png" "$PAPERS_DIR/motr-framework.png"

download_image "https://github.com/yuanz27/VPD/blob/master/images/total_result.png?raw=true" "$PAPERS_DIR/variational-pedestrian.png"

download_image "https://github.com/yuanz27/vpof/blob/master/images/method_overview.jpg?raw=true" "$PAPERS_DIR/optical-flow-obstacle.jpg"

download_image "https://raw.githubusercontent.com/zyayoung/oss/main/motrv2_main.jpg" "$PAPERS_DIR/motrv2-demo.jpg"

# 项目图片
download_image "https://tencent.github.io/MimicMotion/favicon.svg" "$PROJECTS_DIR/mimicmotion-icon.svg"

echo "完成! 图片保存在:"
echo "  - 论文图片: $PAPERS_DIR"
echo "  - 项目图标: $PROJECTS_DIR"
echo "  - 头像: $AVATARS_DIR"