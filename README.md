Here's the updated README file with the added challenge description:

---

# Web CTF Boot to Root

Welcome to the Web CTF Boot to Root challenge hosted on Docker. This repository contains a simple CTF challenge designed to test basic web security skills. The challenge includes a website hosted on port 80 with various tasks to complete.

## Quick Start

### Prerequisites

Make sure you have Docker installed on your system. If you don't have Docker installed, follow the steps below to install it.

### Install Docker

#### For Ubuntu:

1. Update your existing list of packages:

    ```sh
    sudo apt-get update
    ```

2. Install Docker:

    ```sh
    sudo apt-get install docker.io
    ```

3. Verify that Docker is installed correctly by running:

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
docker run -d -p 8080:80 hacksudoctfv1
```

### Access the Challenge

Open your web browser and navigate to `http://localhost:8080` to access the CTF challenge.

## Challenge Description

This CTF challenge is designed to be beginner-friendly, providing a good starting point for those new to web security. The challenge consists of the following tasks:

1. **Compromise Web Admin:**
   - Your first task is to compromise the web admin account. This might involve finding and exploiting vulnerabilities in the website.

2. **Get Shell Access:**
   - After compromising the web admin, escalate your access to gain a shell as the `www-data` user. This will likely involve exploiting an OWASP Top 10 vulnerability, such as Remote Code Execution (RCE).

3. **Get Root Access:**
   - With shell access as `www-data`, further escalate your privileges to gain root access. 

4. **Capture the Flag:**
   - Locate the file `/root/root.txt` and read its contents to capture the flag.

## Support

If you encounter any issues or have any questions, feel free to open an issue on this repository.

---

Happy hacking!
