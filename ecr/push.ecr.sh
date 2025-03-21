#!/bin/bash

# AWSの設定
AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID
REGION=$REGION

# ECRにログイン（1回だけ実施すればOK）
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

# 各ディレクトリについてループ
for dir in grafana prometheus nginx nginx-exporter; do
    echo "============================="
    echo "Processing directory: $dir"
    echo "============================="

    # ディレクトリ内のDockerfileを使ってイメージをビルド
    docker build -t $dir --platform linux/x86_64 $dir

    # イメージにECR用のタグを付与
    docker tag ${dir}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/shiba-metrics-${dir}-ecr-repo:latest

    # イメージをECRにプッシュ
    docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/shiba-metrics-${dir}-ecr-repo:latest
done