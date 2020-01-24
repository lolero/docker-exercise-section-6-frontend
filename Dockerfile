FROM node:alpine as builder
WORKDIR '/app'
COPY . .
RUN yarn install
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html