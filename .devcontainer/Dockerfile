FROM ghcr.io/mo-mo-666/latex-ubuntu:2022

ARG USERNAME="dev"
ARG USER_UID=1000
ARG USER_GID=$USER_UID

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
