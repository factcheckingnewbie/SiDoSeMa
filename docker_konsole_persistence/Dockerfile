FROM fedora:41

    
RUN dnf -y install glibc-langpack-en mc konsole docker sudo criu xorg-x11-server-common procps-ng tini vim  dbus-x11 \
 && dnf clean all
 
# Optional: test if CRIU is available
# RUN dnf install -y criu
 
# Set up a normal user (optional, or run as root for PoC)
RUN useradd -m konsoleuser
USER konsoleuser
WORKDIR /home/konsoleuser
 
CMD ["konsole", "--nofork", "-e", "bash"]
