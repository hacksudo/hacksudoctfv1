# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 php libcap2-bin libapache2-mod-php
RUN apt-get install python3 -y

# Clean up Apache default web directory and set permissions
RUN rm /var/www/html/* && \
    chmod 775 -R /var/log/apache2/
# Copy your local website files to the Apache default directory
COPY . /var/www/html/
#Set Apache2 server Permission
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html/
#Privileged Setup
RUN cp /var/www/html/py /usr/bin/
RUN chmod 777 /usr/bin/py
RUN py
#write your name in /root/root.txt file
RUN touch /root/root.txt
# Expose port 80
EXPOSE 80

# Start  Apache services
CMD ["sh", "-c", "service apache2 start && tail -f /dev/null"]
