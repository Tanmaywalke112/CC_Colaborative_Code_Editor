# Use Node.js 20 Alpine as the base image
FROM node:20-alpine

# Set the working directory
WORKDIR /code-sunc

# Copy the package.json and package-lock.json for both client and server
COPY client/package*.json ./client/
COPY server/package*.json ./server/

# Install dependencies for both client and server
RUN npm install --prefix ./client
RUN npm install --prefix ./server

# Copy the rest of the client and server files
COPY client ./client
COPY server ./server

# Build the client application (optional, if you're using a build step)
RUN npm run build --prefix ./client

RUN touch ./script.sh

COPY script.sh ./script.sh

RUN chmod +x ./script.sh

# Expose the port for the server (change if needed)
EXPOSE 5173

ENTRYPOINT ["./script.sh"]

# # Use concurrently to run both server and client
# CMD ["npx", "concurrently", "npm run dev --prefix ./server", "npm run dev --prefix ./client"]