FROM abernix/spaceglue:node-4.6.2
MAINTAINER Jesse Rosenberger


ENV ANDROID_SDK_URL https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_PATH /android
ENV ANDROID_SDK_FILTER platform-tool,android-23,build-tools-24.0.2

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    fontconfig \
    libfreetype6-dev \
    libssl-dev \
    openjdk-8-jdk \
    wget \
    curl \
    chrpath \
    libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev \
    python \
    software-properties-common \
    python-software-properties \
    && add-apt-repository ppa:webupd8team/java \
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
