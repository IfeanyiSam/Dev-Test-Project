# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Install app dependencies
RUN npm install

# Copy the application code to the working directory
COPY nodeapp.js .

# Expose a port for the Node.js application 
EXPOSE 3000

# Define the command to start your Node.js application
CMD ["node", "nodeapp"]
