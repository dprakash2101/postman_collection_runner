# Use the latest Node.js image
FROM node:latest

# Create a directory for the action
WORKDIR /action

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install Node.js dependencies (including @actions/core and @actions/exec)
# ... other Dockerfile lines ...

# Copy the pre-built node_modules archive
COPY node_modules.tar.gz /action/node_modules

# Extract the archive
RUN tar -xzvf /action/node_modules.tar.gz -C /action/node_modules

# ... other Dockerfile lines ...


# Install Newman (Postman CLI) globally
RUN npm install -g newman

# Copy the rest of the action's code
COPY . .

# Define the entrypoint
ENTRYPOINT ["node", "/action/index.js"]
