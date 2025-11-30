FROM ubuntu:24.04
RUN apt update -y
RUN apt upgrade -y
RUN apt install git gcc g++ cmake libjsoncpp-dev uuid-dev zlib1g-dev openssl libssl-dev curl build-essential nlohmann-json3-dev -y
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN echo >> /root/.bashrc
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
RUN brew update && brew upgrade
RUN brew install nlohmann-json
RUN cd $HOME && git clone https://github.com/drogonframework/drogon
RUN cd $HOME/drogon && git submodule update --init
RUN mkdir $HOME/drogon/build
RUN cd $HOME/drogon/build && cmake ..
RUN cd $HOME/drogon/build && make && make install
RUN cd $HOME/drogon/build && cmake -DCMAKE_BUILD_TYPE=Release ..
WORKDIR /project
