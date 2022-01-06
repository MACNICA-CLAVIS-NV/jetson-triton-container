# jetson-triton-container
Docker Container Image Build Script of Triton Inference Server for Jetson 

## Installation

1. Clone this repository in your Jetson
    ```
    git clone https://github.com/MACNICA-CLAVIS-NV/jetson-triton-container
    ```

1. Change the directory to the repository directory.
    ```
    cd jetson-triton-container
    ```

1. Install the docker-compose command.
    ```
    ./scripts/install_docker_compose.sh
    ```

1. Build the Triton Inference Sever container image. **Please note that this process takes nearly two hours (on Jetson Nano)!**
    ```
    ./scripts/docker_build.sh
    ```

## Usage (Run Triton Inference Server Only)

```
./scripts/docker_run.sh
```

## Usage (Run Triton Inference Server with FTP Service)

1. Start the Triton Inference Server and the gists/pure-ftpd FTP server.
    ```
    ./scripts/compose_up.sh
    ```

1. Set your user ID and your password for the FTP server. **Please note that this is needed at the first run only. Your user ID and your password will be recorded in ./pureftpd directory.**
    ```
    ./scripts/set_ftp_pw.sh
    ```
    The first prompt you will see may be for the sudo password. The second and third prompt will be for the FTP password.<br>
    ```
    [sudo] password for xxx: (Input the sudo password)
    Password: (Input your FTP Password)
    Enter it again: (Input your FTP Password again)
    ```

1. To stop the servers, execute the following command from another terminal.
    ```
    ./scripts/compose_down.sh
    ```
