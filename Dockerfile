# Basis-Image mit Node.js
FROM node:22

# Setze das Arbeitsverzeichnis
WORKDIR /app

# Kopiere package.json und package-lock.json
COPY package*.json ./

# Installiere Abhängigkeiten
RUN npm install -g pm2 ts-node && npm ci --omit=dev

# Kopiere den restlichen Code ins Container-Image
COPY . .

# Exponiere den Port (Falls dein Server auf z. B. 3000 läuft)
EXPOSE 3888

# Starte die App mit PM2
CMD ["pm2-runtime", "ts-node", "src/index.ts"]