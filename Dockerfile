# use a lightweight Node.js image 
FROM node:18-alpine

# set working directory
WORKDIR /app


# Copy the rest of the code
COPY . .

# Expose Port 3000
EXPOSE 80
