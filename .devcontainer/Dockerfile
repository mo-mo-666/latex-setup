FROM ghcr.io/mo-mo-666/latex-ubuntu:latest

ARG USERNAME="dev"
ARG USER_UID=1000
ARG USER_GID=1000

# ENV に再宣言して RUN 時にも使えるように
ENV USERNAME=${USERNAME} \
    USER_UID=${USER_UID} \
    USER_GID=${USER_GID}

# ミラー変更（古い http → 新しい https）: 通常は /etc/apt/sources.list を編集
RUN sed -i.bak -r 's@http://(jp\.)?archive\.ubuntu\.com/ubuntu/?@https://ftp.udx.icscoe.jp/Linux/ubuntu/@g' /etc/apt/sources.list

# パッケージ更新と ssh のインストール
RUN apt-get update \
    && apt-get install -y openssh-server sudo \
    && rm -rf /var/lib/apt/lists/*

# sshd_config の AllowAgentForwarding を有効化
RUN sed -i 's/^#\s*\(AllowAgentForwarding\s\+yes\)/\1/' /etc/ssh/sshd_config

# ユーザーとグループの作成
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# デフォルトユーザーに切り替え
USER $USERNAME

# ユーザーのホームに設定ファイルをコピー
COPY .latexmkrc /home/$USERNAME/
COPY .chktexrc /home/$USERNAME/
COPY .latexindentrc.yaml /home/$USERNAME/
COPY .indentconfig.yaml /home/$USERNAME/

# 権限修正（必要なら）
RUN chown $USERNAME:$USERNAME /home/$USERNAME/.*rc /home/$USERNAME/*.yaml || true

CMD ["bash"]
