# Prerequisities
Docker

# Run 
docker build -t vncimage .
docker run -p 5900:5900 -e DISPLAY=55 --name vnc_container vncimage 

# Stop
docker stop $(docker ps -aq) stops all running containers
docker rm $(docker ps -aq) removes all containers

ffmpeg -f x11grab -r 25 -s 1366x768 -i :1 -pix_fmt yuv420p -vcodec libx264 movie.mp4 -qscale 0 out.mp4
