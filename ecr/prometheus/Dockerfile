# prometheus/Dockerfile
FROM prom/prometheus:latest

# ホストのprometheus.ymlをコンテナ内の設定ファイルパスへコピー
# ※Dockerイメージをビルドする際、同じディレクトリにprometheus.ymlが存在する必要があります
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Prometheusが使用するポートを公開
EXPOSE 9090