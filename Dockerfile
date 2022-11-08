FROM node:16-alpine AS builder

WORKDIR /home/app

COPY . .

RUN npm install

RUN npm run build


FROM nginx:1.23.2-alpine AS runner

WORKDIR /usr/share/nginx/html

COPY --from=builder --chown=nginx:nginx /home/app/dist .

EXPOSE 80