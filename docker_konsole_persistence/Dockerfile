FROM fedora:41
#xorg-x11-server-common
    
RUN dnf -y install glibc-langpack-en mc konsole docker sudo criu procps-ng tini vim  dbus-x11 \
 && dnf clean all
 
# Optional: test if CRIU is available
# RUN dnf install -y criu
 
# Set up a normal user (optional, or run as root for PoC)
RUN useradd -m konsoleuser
USER konsoleuser
WORKDIR /home/konsoleuser
 
CMD ["konsole", "--nofork", "-e", "bash"]
