# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR ./

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of your application code to the working directory
COPY nodeapp.js ./

# Expose a port for the Node.js application (if your app uses one)
EXPOSE 3000

# Define the command to start your Node.js application
CMD ["node", "nodeapp.js"]
