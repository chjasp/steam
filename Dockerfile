FROM node:14-alpine as build
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:14-alpine
RUN npm install -g serve
WORKDIR /app
COPY --from=build /app/build .
CMD ["serve", "-p", "8080", "-s", "."]