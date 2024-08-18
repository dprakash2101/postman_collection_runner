# Use the latest Node.js image
FROM node:16

# Create a directory for the action
WORKDIR /action

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install Node.js dependencies (including @actions/core and @actions/exec)
RUN npm install

# Install Newman (Postman CLI) globally
RUN npm install -g newman

# Copy the rest of the action's code
COPY . .

# Define the entrypoint
ENTRYPOINT ["node", "/action/index.js"]
