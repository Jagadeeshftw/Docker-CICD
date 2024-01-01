FROM node:alpine as app
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx
COPY --from=app /app/build /usr/share/nginx/html 
