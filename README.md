# Prerequisities
Docker

# Run 
docker build -t vncimage .
docker run -p 5900:5900 -e DISPLAY=55 --name vnc_container vncimage 

# Stop
docker stop $(docker ps -aq) stops all running containers
docker rm $(docker ps -aq) removes all containers

ffmpeg -f x11grab -r 25 -s 1366x768 -i :1 -pix_fmt yuv420p -vcodec libx264 movie.mp4 -qscale 0 out.mp4

ffmpeg -re -threads 0 -f alsa -ac 1 -i hw:2,0 -f v4l2 -vcodec mjpeg -s 1280x720 -r 25 -i /dev/video0 \
-s 416x234 -ac 2 -f flv -vcodec libx264 -profile:v baseline -maxrate 200000 -bufsize 200000 -r 25 -ar 44100 -c:a libfaac -b:a 128k "rtmp://publish.live.streamshark.io/2050C7/juidbonc/ffmpeg_200?trebor&adbe-live-event=ffmpeg" \
-s 640x360 -ac 2 -f flv -vcodec libx264 -profile:v baseline -maxrate 600000 -bufsize 600000 -r 25 -ar 44100 -c:a libfaac -b:a 128k "rtmp://publish.live.streamshark.io/2050C7/juidbonc/ffmpeg_600?trebor&adbe-live-event=ffmpeg" \
-s 640x360 -ac 2 -f flv -vcodec libx264 -profile:v baseline -maxrate 1200000 -bufsize 1200000 -r 25 -ar 44100 -c:a libfaac -b:a 128k "rtmp://publish.live.streamshark.io/2050C7/juidbonc/ffmpeg_1200?trebor&adbe-live-event=ffmpeg"



ffmpeg -re -threads 0 -f alsa -ac 1 -i hw:2,0 -f v4l2 -vcodec mjpeg -s 1366x768 -r 25 -i /dev/video0 \
-s 1366x768 -ac 2 -f flv -vcodec libx264 -profile:v baseline -maxrate 200000 -bufsize 200000 -r 25 -ar 44100 -c:a libfaac -b:a 128k "rtmp://165.227.18.83/live" 

# Running nginx
docker run -d -p 1935:1935 --name nginx-rtmp tiangolo/nginx-rtmp
