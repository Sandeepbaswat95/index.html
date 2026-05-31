FROM alpine AS builder

WORKDIR /app
COPY . .

FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

