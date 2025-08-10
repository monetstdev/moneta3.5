# ベースイメージ
FROM ruby:3.2.2

# 必要なLinuxパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libsqlite3-dev \
      nodejs \
      npm \
      curl \
      git && \
    npm install --global yarn && \
    rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /app

# Gemfile と Gemfile.lock を先にコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --without development test

# アプリケーション全体をコピー
COPY . .

# SECRET_KEY_BASE を一時生成してプリコンパイル
RUN SECRET_KEY_BASE=dummy RAILS_ENV=production \
    bundle exec rails assets:precompile

# 環境変数
ENV RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true

# Puma をデフォルトサーバーとして起動
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
