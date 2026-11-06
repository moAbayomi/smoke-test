# Use a modern Node.js runtime
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy your source code and tsconfig
COPY tsconfig.json ./
COPY src/ ./src

# Compile TypeScript to JavaScript
RUN npm run build

# Expose the internal TCP port
EXPOSE 6969

# Start the application using your production start script
CMD ["npm", "start"]
