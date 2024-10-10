FROM debian:12
ARG NOVNC_VERSION="v1.2.0"
ARG NOVNC_PASSWORD="password"
COPY scripts/run.sh /run.sh
RUN apt update && \
DEBIAN_FRONTEND=noninteractive \
apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor \
git xfce4 xfce4-terminal tightvncserver wget -y && \
wget https://github.com/novnc/noVNC/archive/refs/tags/${NOVNC_VERSION}.tar.gz && \
tar -xvf ${NOVNC_VERSION}.tar.gz && \
rm -f ${NOVNC_VERSION}.tar.gz && \
mkdir $HOME/.vnc && \
echo ${NOVNC_PASSWORD} | vncpasswd -f > $HOME/.vnc/passwd && \
chmod 600 $HOME/.vnc/passwd && \
chmod 755 /run.sh && \
curl -LO https://proot.gitlab.io/proot/bin/proot && \
mv proot /bin && \
chmod 755 /bin/proot && \
EXPOSE 8900
CMD  /run.sh
