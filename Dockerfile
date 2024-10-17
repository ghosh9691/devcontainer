FROM ubuntu:latest

# NOTE - If builds are in  GTC Jenkins, use the RUN instruction to change file permission as BuildKit is disabled
ADD --chmod=0755 https://artifactory.prodwest.citrixsaassbe.net/repository/releases/goto-cert/goto-cert-setup/LATEST/goto-cert-setup-LATEST.sh /goto-cert-setup.sh
RUN /goto-cert-setup.sh

RUN apt-get update
RUN apt-get install -y openssh-client
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y gcc
RUN apt-get install -y nasm
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y dotnet-sdk-8.0



