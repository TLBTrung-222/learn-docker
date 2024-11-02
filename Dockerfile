FROM node:18-alpine3.19 as builder
WORKDIR /app
COPY package.json package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html