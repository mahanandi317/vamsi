sudo apt-get update
sudo apt install docker.io -y
sudo systemctl start docker 
sudo docker pull nginx
sudo docker images
sudo docker run --name docker-nginx-23 -p 80:80 -d nginx
sudo docker ps -a
          
