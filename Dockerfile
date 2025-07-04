FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./
COPY packages/app/package.json ./packages/app/
COPY packages/backend/package.json ./packages/backend/

# Install dependencies
RUN yarn install --frozen-lockfile --production=false

# Copy source code
COPY . .

# Build the application
RUN yarn build:backend --config app-config.yaml --config app-config.production.yaml

# Expose port
EXPOSE 7007

# Start the backend
CMD ["node", "packages/backend/dist/index.js"]