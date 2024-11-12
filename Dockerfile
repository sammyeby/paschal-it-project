# Use an official nginx image as the base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the current directory contents into the container at /usr/share/nginx/html
COPY . .

# Copy nginx configuration file with routing fallback
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 4300 to the outside world
EXPOSE 4300

# Start nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]