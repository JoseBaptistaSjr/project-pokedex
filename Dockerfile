# Use the official Node.js image as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Copy wait-for-it.sh to the working directory
COPY wait-for-it.sh /app/wait-for-it.sh

# Install netcat for wait-for-it.sh script
RUN apt-get update && apt-get install -y netcat

# Make wait-for-it.sh executable
RUN chmod +x /app/wait-for-it.sh

# Build the application
RUN npm run build

# Specify the command to run the application
CMD ["npm", "start"]

