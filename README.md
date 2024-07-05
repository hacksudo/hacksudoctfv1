---

# Web CTF Boot to Root

Welcome to the Web CTF Boot to Root challenge hosted on Docker. This repository contains a simple CTF challenge that is designed to test basic web security skills. The challenge includes a website hosted on port 80 with a very easy task to get you started.Created By me @Vishal Waghmare instagram@realvilu

## Quick Start

### Prerequisites

Make sure you have Docker installed on your system. If you don't have Docker installed, follow the steps below to install it.

### Install Docker
#### For Ubuntu:

1. Automatic Setup whole HacksudoCTFv1 using auto_setup.sh file ,you dont need to do all below steps if incase any issue you can go with manual setup methods.
    run auto script with execute permission
   ```sh
    chmod 777 auto_setup.sh && bash auto_setup.sh
    ```
3. In case any issue not work then find proccess id of current docker and and stop it and do them again.

   a) check procces of container
   ```sh
    docker ps
    ```
   b) and then stop current container, docker stop and container
   ```sh
    docker stop (containerID here)
    ```
   c) Again Run auto_setup.sh this is auto setup script   
    ```sh
    bash auto_setup.sh
    ```
5. Now do manual by Update your existing list of packages:

    ```sh
    sudo apt-get update
    ```

6. Install Docker:

    ```sh
    sudo apt-get install docker.io
    ```

7. Verify that Docker is installed correctly by running:

    ```sh
    sudo docker --version
    ```

### Pull the Docker Image

To download the CTF Docker image, use the following command:

```sh
docker pull hacksudov1/hacksudoctfv1
```

### Run the Docker Container

Once the image is downloaded, run the Docker container with the following command:

```sh
docker run -d -p 8080:80 hacksudov1/hacksudoctfv1
```

Find container_id run following command:

```sh
docker ps
```

To find the IP address of the running Docker container, you can use the following command:

```sh
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

Replace `<container_id>` with the actual container ID.

### Access the Challenge

Open your web browser and navigate to `http://localhost:8080` to access the CTF challenge.

## Challenge Description

This CTF challenge is designed to be very easy, providing a good starting point for beginners in web security. The challenge consists of the following steps:

1. **Compromise Web Admin**: Gain access to the web admin by exploiting any vulnerability in the website.
2. **Get Shell Access**: Achieve shell access with `www-data` privileges by exploiting an OWASP Top 10 vulnerability such as Remote Code Execution (RCE).
3. **Get Root Access**: Escalate your privileges to root. Find and read the contents of the `/root/root.txt` file.

### Steps to Complete the Challenge

1. **Find the IP Address of the Docker Container**:
   
   ```sh
   docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
   ```

2. **Access the Web Admin Interface**:
   
   Navigate to `http://localhost:8080` or use the container's IP address if accessing from a different machine.

3. **Exploit an OWASP Top 10 Vulnerability**:
   
   Identify and exploit a vulnerability in the web application to gain shell access as `www-data`.

4. **Privilege Escalation**:
   
   Escalate your privileges to root and find the `/root/root.txt` file. Read the file to complete the challenge.

## Support

If you encounter any issues or have any questions, feel free to open an issue on this repository.

---

Happy hacking!
