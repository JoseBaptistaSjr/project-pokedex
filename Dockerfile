# Use the official Node.js 14 image as a base
FROM node:16

# Create and change to the app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

EXPOSE 3000

# Start the NestJS application
CMD ["npm", "run", "start:prod"]