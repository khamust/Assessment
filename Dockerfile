# Stage 1: build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: run
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
USER node
EXPOSE 3000
CMD ["node", "node.js"]
