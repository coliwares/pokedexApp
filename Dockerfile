FROM node:17-alpine AS my-app-build
WORKDIR /app
COPY . .
RUN npm run build --prod

# stage 2

FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=my-app-build /app/dist/frontend /usr/share/nginx/html
EXPOSE 80