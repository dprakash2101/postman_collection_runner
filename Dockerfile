# Use the latest Node.js image
FROM node:latest

# Install Newman (Postman CLI)
RUN npm install -g newman

# Create a directory for the action
WORKDIR /action

# Copy the action's code
COPY . /action

# Define the entrypoint
ENTRYPOINT ["node", "/action/index.js"]
