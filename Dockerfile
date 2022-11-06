FROM cm2network/steamcmd

ARG SERVER_NAME="TestServer"
ARG SERVER_PASSWORD="pass"

ENV SERVER_NAME=${SERVER_NAME}
ENV SERVER_PASSWORD=${SERVER_PASSWORD}

WORKDIR /home/steam/steamcmd

RUN printf "force_install_dir ./PZServer\nlogin anonymous\napp_update 380870 validate\nquit" | ./steamcmd.sh

WORKDIR /home/steam/steamcmd/PZServer

COPY ./server.sh .

CMD ./server.sh -p ${SERVER_PASSWORD} -n ${SERVER_NAME}