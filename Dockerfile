# ベースとなるDockerイメージを指定
FROM node:16-alpine

# 作業ディレクトリを設定
WORKDIR /app

# プロジェクトの依存関係をインストール
COPY package*.json ./
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# アプリケーションをビルド
RUN npm run build

# 本番環境用のWebサーバを起動
CMD ["npx", "serve", "-s", "build"]
