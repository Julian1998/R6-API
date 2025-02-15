FROM node:22 AS builder
WORKDIR /build
COPY . .
RUN npm install
RUN npx tsc

FROM node:22 AS app
WORKDIR /app
COPY --from=builder /build /app
RUN npm install -g pm2
CMD ["pm2-runtime", "start", "ecosystem.config.js"]