chmod 777 mp3.sh
chmod 777 mp4.sh
chmod 777 karaoke.sh

gnome-terminal -x sh -c './mp3.sh; exec bash'
gnome-terminal -x sh -c './mp4.sh; exec bash'
gnome-terminal -x sh -c './karaoke.sh; exec bash'

