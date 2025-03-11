#!/bin/bash

TODAY=$(date +"%Y-%m-%d")

IMAGE_NAME="nginx:$TODAY"

# 检查是否存在该镜像
if docker images --format "{{.Repository}}:{{.Tag}}" | grep -q "$IMAGE_NAME"; then
    echo "镜像 $IMAGE_NAME 已存在，正在删除..."
    docker rmi "$IMAGE_NAME"
fi

echo "正在构建镜像 $IMAGE_NAME..."
docker build -t "$IMAGE_NAME" /root/nico_dockerfile

TAR_FILE="/root/nico_dockerfile/nginx_nico_$TODAY.tar"
echo "正在保存镜像到 $TAR_FILE..."
docker save -o "$TAR_FILE" "$IMAGE_NAME"

echo "保存的文件："
ls -l /root/nico_dockerfile | grep "nginx_nico_$TODAY.tar"

echo "当前镜像："
docker images | grep "$TODAY"