# Prerequisities
Docker

# Run 
docker build -t vncimage .
docker run -p 5900:5900 -e DISPLAY=55 --name vnc_container vncimage x11vnc -forever -usepw -create

# Stop
docker stop $(docker ps -aq) stops all running containers
docker rm $(docker ps -aq) removes all containers

