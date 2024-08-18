# Use the latest Node.js image
FROM node:latest

# Install Newman (Postman CLI)
RUN npm install -g newman

# Create a directory for the action
WORKDIR /action

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the action's code
COPY . .

# Define the entrypoint
ENTRYPOINT ["node", "/action/index.js"]
