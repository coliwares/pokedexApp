FROM node:alpine AS my-app-build
WORKDIR /app
COPY . .
RUN run npm build
RUN ls -la /app/dist/pokedex-app

# stage 2

FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm /usr/share/nginx/html/index.html
COPY --from=my-app-build /app/dist/pokedex-app /usr/share/nginx/html
EXPOSE 80