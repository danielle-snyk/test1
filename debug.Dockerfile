FROM node:15.5-slim

COPY package*.json ./

RUN npm ci --only=production

RUN apt-get update && apt-get install -y \
    sqlite3 \
 && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
