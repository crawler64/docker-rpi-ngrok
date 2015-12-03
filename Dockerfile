FROM resin/rpi-raspbian:wheezy
MAINTAINER zaporylie

RUN apt-get update && apt-get install -y \
    unzip \
    net-tools \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD https://dl.ngrok.com/ngrok_2.0.19_linux_arm.zip  ngrok.zip

RUN unzip ngrok.zip -d /bin \
 && rm -f ngrok.zip \
 && touch .ngrok

CMD /bin/ngrok http -config=.ngrok -log stdout --authtoken=$AUTHTOKEN $(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'):$HTTP_PORT
