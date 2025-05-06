FROM fedora:41
RUN echo -e '\
if [ -n "$SESSION_NAME" ]; then\n\
  case "$PS1" in\n\
    *\$SESSION_NAME*) ;;\n\
    *) export PS1="[\$SESSION_NAME] $PS1";;\n\
  esac\n\
fi\n\
' >> /etc/bashrc


ARG USERNAME=konsoleuser
ARG USER_UID=1000
ARG USER_GID=1000

# Install required packages and create user/group
RUN dnf -y update && \
    dnf -y install  konsole glibc-langpack-en docker  procps-ng tini  && \
    dnf clean all && \
    groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Copy chroot-launch.sh into the container and make it executable
COPY chroot-launch.sh /usr/local/bin/chroot-launch.sh
# RUN chmod +x /usr/local/bin/chroot-launch.sh

USER ${USERNAME}
ENV HOME=/home/${USERNAME}
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV SHELL=/bin/bash
WORKDIR /home/${USERNAME}


# Start Konsole with the custom shell
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["konsole", "--nofork" , "-e", "/usr/local/bin/chroot-launch.sh"]
