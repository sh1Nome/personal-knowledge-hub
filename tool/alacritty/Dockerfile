# このDockerfileは以下を参考にしています
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md
# https://rust-lang.github.io/rustup/installation/other.html
FROM debian:12

# 必要最小限のパッケージのインストール（公式INSTALL.md準拠）
RUN apt-get update && \
	apt-get install -y \
    cmake \
    g++ \
    pkg-config \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev \
    python3

# その他必要なパッケージのインストール
RUN apt-get install -y \
    curl \
    git

# Rustのインストール
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --profile minimal
ENV PATH="${HOME}/.cargo/bin:${PATH}"

# Alacrittyのビルドとインストール
RUN git clone https://github.com/alacritty/alacritty.git && \
    cd alacritty \
    cargo build --release

RUN git clone https://github.com/alacritty/alacritty.git /opt/alacritty && \
	cd /opt/alacritty && \
	cargo build --release && \
	cp target/release/alacritty /usr/local/bin/

# デフォルトのコマンド
CMD ["alacritty", "--help"]
