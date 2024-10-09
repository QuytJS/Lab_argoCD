# Use Ubuntu as the base image
FROM ubuntu:22.04

# Update the package list and install NGINX
RUN apt-get update && apt-get install -y nginx

# Remove default nginx page
RUN rm -rf /var/www/html/*

# Copy the custom HTML file from local machine to container's NGINX directory
COPY index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX in the foreground (keep it running)
CMD ["nginx", "-g", "daemon off;"]
