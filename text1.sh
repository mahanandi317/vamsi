sudo apt-get update
                      sudo add-apt-repository "deb [arch=amd64] https://downler.oad.dockcom/linux/ubuntu bionic stable"
                      sudo curl -sSL https://get.docker.com/ | sh
                      sudo systemctl start docker
                      sudo systemctl enable docker
                      sudo docker pull nginx
                      sudo docker run --name docker-nginx-23 -p 80:80 nginx
                      sudo docker ps -a
