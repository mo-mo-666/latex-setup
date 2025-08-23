FROM ghcr.io/mo-mo-666/latex-ubuntu:latest

ARG USERNAME="dev"
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# change mirror server
RUN sed -i.bak -r 's@http://(jp\.)?archive\.ubuntu\.com/ubuntu/?@https://ftp.udx.icscoe.jp/Linux/ubuntu/@g' /etc/apt/sources.list.d/ubuntu.sources
RUN apt-get update && apt-get install -y \
    ssh-agent \
    && rm -rf /var/lib/apt/lists/*
# sshd_config AllowAgentForwarding yes
RUN sed -i 's/^#\s*\(AllowAgentForwarding\s\+yes\)/\1/' /etc/ssh/sshd_config

# Create the user if not exists
RUN getent group $USER_GID || groupadd --gid $USER_GID $USERNAME \
    && id -u $USER_UID >/dev/null 2>&1 || useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

COPY .latexmkrc /home/$USERNAME
COPY .chktexrc /home/$USERNAME
COPY .latexindentrc.yaml /home/$USERNAME
COPY .indentconfig.yaml /home/$USERNAME

CMD ["bash"]
