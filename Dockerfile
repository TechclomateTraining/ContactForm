FROM ubuntu
RUN apt update
RUN apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7 -y
RUN echo "alias python=python3.7" >> ~/.bashrc
RUN export PATH=${PATH}:/usr/bin/python3.7
RUN /bin/bash -c "source ~/.bashrc"
RUN apt install python3-pip -y
COPY . /src
WORKDIR /src
EXPOSE 8000
ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]