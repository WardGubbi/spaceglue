FROM abernix/spaceglue:node-4.6.2
MAINTAINER Jesse Rosenberger


ENV ANDROID_SDK_URL https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_PATH /android
ENV ANDROID_SDK_FILTER platform-tool,android-23,build-tools-24.0.2

USER root



ENV java_version 1.8.121
ENV filename jdk-8u121-linux-x64.tar.gz
ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/8u121-b13/$filename -O /tmp/$filename

#Download java
RUN wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" 'http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm' -O /tmp/$filename

RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/

#additional config
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000

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
  


# Download and extract the Android SDK

RUN mkdir -p $ANDROID_SDK_PATH

WORKDIR $ANDROID_SDK_PATH

RUN wget $ANDROID_SDK_URL -O android-sdk.tar.gz
RUN tar xvfz android-sdk.tar.gz
RUN rm -fr android-sdk.tar.gz

# Install the Android SDK

WORKDIR $ANDROID_SDK_PATH/android-sdk-linux

RUN echo "y" | tools/android update sdk --no-ui --filter $ANDROID_SDK_FILTER

# Update Android SDK environment variables

ENV ANDROID_HOME $ANDROID_SDK_PATH/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

RUN ["npm", "install", "--global", "node-gyp"]

USER node
