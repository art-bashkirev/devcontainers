FROM debian:latest

RUN apt update && apt install -y openssh-server g++ git
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -m -s /bin/bash user
RUN echo "user:insecure_password" | chpasswd

EXPOSE 22
EXPOSE 7878
EXPOSE 8080
EXPOSE 8000
EXPOSE 5000

ENTRYPOINT service ssh start && bash
