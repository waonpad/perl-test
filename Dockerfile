# perlのdockerイメージを取得
FROM perl:5.40

RUN apt-get update && apt-get install locales -y
# localeを日本語に設定
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen
ENV LC_ALL=ja_JP.UTF-8

# ワーキングディレクトリを指定
WORKDIR /workspace

# ローカルのファイルをコンテナにコピー
COPY . /workspace

# cpmをインストールするディレクトリがない場合は作成
RUN mkdir -p cpm
# cpmをインストール
RUN curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm > cpm/cpm
RUN chmod +x cpm/cpm

ENV PERL5LIB=/workspace/local/lib/perl5

# cpmで依存モジュールをインストール
RUN cpm install JSON