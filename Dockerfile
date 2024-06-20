FROM node:18.19.0

WORKDIR /app

COPY . /app

COPY package*.json ./

RUN npm install

EXPOSE 3000

CMD ["sh", "-c", "npm run migration:run && npm run start"]