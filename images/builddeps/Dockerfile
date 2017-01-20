FROM beevelop/android-nodejs:v4
MAINTAINER Jesse Rosenberger


RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    fontconfig \
    libfreetype6-dev \
    libssl-dev \
    wget \
    curl \
    chrpath \
    libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev \
    python \
    && rm -rf /var/lib/apt/lists/*
  
RUN ["npm", "install", "--global", "node-gyp"]

USER node
