# Use an official nginx image as the base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the current directory contents into the container at /usr/share/nginx/html
COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]