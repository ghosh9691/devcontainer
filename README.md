# Docker for Development

Use a docker container for development. Similar to DevContainers, but hosted locally. Based on Ubuntu, it supports C/C++ with GCC, Assembly with NASM, C# with .NET Core 8 SDK.

## Build Instructions

In order to build this container, you should have Docker installed on your machine. Once you have that, follow the process laid out below:

1. Clone this repository using `git clone git@github.com:ghosh9691/devcontainer.git`
2. Change to the folder where you cloned the repo
3. Remove the 2 lines shown below
    ```
    # NOTE - If builds are in  GTC Jenkins, use the RUN instruction to change file permission as BuildKit is disabled
    ADD --chmod=0755 https://artifactory.prodwest.citrixsaassbe.net/repository/releases/goto-cert/goto-cert-setup/LATEST/goto-cert-setup-LATEST.sh /goto-cert-setup.sh
    RUN /goto-cert-setup.sh

    ```
4. Download the cross-compiling tool to your folder from https://github.com/lordmilko/i686-elf-tools/releases if the included version is old (v13.2.0)
5. Make any other changes to the `Dockerfile` as necessary
6. Build using the following Docker command
    `docker build . -t <your_tag>`
7. If you want, you can push to your Docker repo (make sure you are logged in to Docker Hub first) by using
    `docker push <your_tag>`

## Running Instructions

This container is used to help make development easy. In many cases, it allows you to write code on your machine, but build it in the container. This prevents your laptop/desktop from being "polluted" with different software needed for building. You are essentially just left with your repo + IDE on your local machine.

If this is attractive to you (as it is to me), then follow the process below:

1. Switch to the root of your repository locally. Let's say it is `C:\source\<my_app>` or `~/source/<my_app>`
2. Run the Docker container:
    2a. On Mac OS/Linux: `docker run -it -v $(pwd):/root/source <your_tag>` or `docker run -it -v $(pwd):/root/source ghosh9691/devcontainer:latest`
    2b. On Windows: `docker run -it -v %cd%:/root/source <your_tag>` or `docker run -it -v %cd%:/root/source ghosh9691/devcontainer:latest`


