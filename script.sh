#!/bin/bash

# Navigate to the server directory
cd server

# Build the server if needed (transpile TypeScript to JavaScript)
npm run build

# Start the backend server (using 'start' script from package.json)
npm run start &  # Running in the background

# Wait for 5 seconds to ensure the server starts
sleep 5

# Navigate to the client folder
cd ../client

# Build the frontend for production (or run dev server)
npm run build

# Optionally, start the Vite preview to serve the built files
npm run preview
