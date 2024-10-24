FROM --platform=linux/amd64 ubuntu:latest

# NOTE - If builds are in  GTC Jenkins, use the RUN instruction to change file permission as BuildKit is disabled
ADD --chmod=0755 https://artifactory.prodwest.citrixsaassbe.net/repository/releases/goto-cert/goto-cert-setup/LATEST/goto-cert-setup-LATEST.sh /goto-cert-setup.sh
RUN /goto-cert-setup.sh

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install -y openssh-client
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y gcc
RUN apt-get install -y nasm
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y dotnet-sdk-8.0
RUN apt-get install -y xorriso
RUN apt-get install -y grub-pc-bin
RUN apt-get install -y grub-common
RUN apt-get install -y unzip

COPY x86_64-elf-tools-linux.zip /root/x86_64-elf-tools-linux.zip
RUN mkdir -p /usr/local/cross/i686

RUN unzip /root/x86_64-elf-tools-linux.zip -d /usr/local/cross/i686


RUN touch /root/.bashrc
RUN echo "export PATH=/usr/local/cross/i686/bin:$PATH" > /root/.bashrc
ENV PATH=/usr/local/cross/i686/bin:$PATH

VOLUME /root/source
WORKDIR /root/source
CMD ["/bin/bash"]







