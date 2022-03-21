FROM node:17-alpine3.14 as builder

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx:1.21.6
COPY --from=builder /usr/app/build /usr/share/nginx/html


