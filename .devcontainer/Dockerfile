FROM ghcr.io/mo-mo-666/latex-ubuntu:latest

# ユーザー情報の定義
ARG USERNAME="ubuntu"


# sshd_config の AllowAgentForwarding を有効化
RUN sed -i 's/^#\s*\(AllowAgentForwarding\s\+yes\)/\1/' /etc/ssh/sshd_config


#ユーザーに切り替え
USER ${USERNAME}

# ユーザーのホームに設定ファイルをコピー
COPY .latexmkrc /home/${USERNAME}/
COPY .chktexrc /home/${USERNAME}/
COPY .latexindentrc.yaml /home/${USERNAME}/
COPY .indentconfig.yaml /home/${USERNAME}/

# 権限修正（ファイルが存在しない場合のエラーを無視）
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.*rc /home/${USERNAME}/*.yaml || true

# デフォルトコマンド
CMD ["bash"]
