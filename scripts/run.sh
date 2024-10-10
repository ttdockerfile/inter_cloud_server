whoami 
cd
su -l -c  'vncserver :2000 -geometry 1280x800'
cd /noVNC-1.2.0
./utils/launch.sh  --vnc localhost:7900 --listen 8900