# ベースイメージ（LaTeX環境）
FROM ghcr.io/mo-mo-666/latex-ubuntu:latest

# ユーザー情報の定義
ARG USERNAME="dev"
ARG USER_UID=1001
ARG USER_GID=1001

# 環境変数にも設定（RUN 時に使えるように）
ENV USERNAME=${USERNAME} \
    USER_UID=${USER_UID} \
    USER_GID=${USER_GID}

# sshd_config の AllowAgentForwarding を有効化
RUN sed -i 's/^#\s*\(AllowAgentForwarding\s\+yes\)/\1/' /etc/ssh/sshd_config

# sudoが入っていない可能性があるのでインストール
RUN apt-get update && apt-get install -y sudo

# グループ作成（既に存在しなければ）
RUN if ! getent group ${USER_GID}; then groupadd --gid ${USER_GID} ${USERNAME}; fi

# ユーザー作成（既に存在しなければ）
RUN if ! id -u ${USERNAME} > /dev/null 2>&1; then useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}; fi

# sudoers設定（ディレクトリが存在しない場合も考慮）
RUN mkdir -p /etc/sudoers.d \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# デフォルトユーザーに切り替え
USER ${USERNAME}

# 設定ファイルのコピー（ファイルが存在しない場合はビルドが失敗するので注意）
COPY .latexmkrc /home/${USERNAME}/
COPY .chktexrc /home/${USERNAME}/
COPY .latexindentrc.yaml /home/${USERNAME}/
COPY .indentconfig.yaml /home/${USERNAME}/

# 所有権の修正
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.*rc /home/${USERNAME}/*.yaml || true

# コンテナ起動時のデフォルトコマンド
CMD ["bash"]
