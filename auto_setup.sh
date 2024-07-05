#!/bin/bash

# Function to display usage
usage() {
  echo "Usage: $0 [-v]"
  echo "  -v   Enable verbose mode"
  exit 1
}

# Check for arguments
VERBOSE=0
while getopts "v" opt; do
  case ${opt} in
    v )
      VERBOSE=1
      ;;
    \? )
      usage
      ;;
  esac
done

# Function to show progress bar
show_progress() {
  echo "
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                                    +
+                            Vishal Waghmare                         +
+                                                                    +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  "
  for i in {1..100}; do
    echo -ne "Progress: $i%\r"
    sleep 0.05
  done
  echo -ne '\n'
}

# Function to show banner
show_banner() {
  echo "
 __    __       ___      .__   __.  __    __       _______. _______  __       _______ .___________.
|  |  |  |     /   \\     |  \\ |  | |  |  |  |     /       ||   ____||  |     |   ____||           |
|  |__|  |    /  ^  \\    |   \\|  | |  |  |  |    |   (----`|  |__   |  |     |  |__   \`---|  |----\`
|   __   |   /  /_\\  \\   |  . \`  | |  |  |  |     \\   \\    |   __|  |  |     |   __|      |  |     
|  |  |  |  /  _____  \\  |  |\\   | |  \`--'  | .----)   |   |  |____ |  \`----.|  |____     |  |     
|__|  |__| /__/     \\__\\ |__| \\__|  \\______/  |_______/    |_______||_______||_______|    |__|     
  "
}

# Run commands with or without verbosity
run_command() {
  show_progress &
  PROGRESS_PID=$!
  
  if [ $VERBOSE -eq 1 ]; then
    echo "Running: $@"
    $@
  else
    $@ > /dev/null 2>&1
  fi
  
  kill $PROGRESS_PID
}

# Show banner
show_banner

# Update package list
run_command sudo apt-get update

# Install Docker
run_command sudo apt-get install -y docker.io

# Pull the Docker image
run_command docker pull hacksudov1/hacksudoctfv1

# Run the Docker container
run_command docker run -d -p 8080:80 hacksudov1/hacksudoctfv1

# Get the container ID
container_id=$(docker ps -q --filter ancestor=hacksudov1/hacksudoctfv1)

# Get the IP address of the running container
target_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container_id)

# Display the target IP address
echo "This is your target IP address: $target_ip"
