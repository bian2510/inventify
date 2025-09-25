# =================================================================
# ETAPA 1: Builder - Compila la aplicación TypeScript a JavaScript
# =================================================================
FROM node:20-alpine AS builder

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de manifiesto de dependencias
COPY package.json pnpm-lock.yaml ./

# Instala pnpm y luego las dependencias del proyecto
# Se incluyen las devDependencies para poder compilar TypeScript
RUN npm install -g pnpm
RUN pnpm install

# Copia el resto del código fuente de la aplicación
COPY . .

# Compila el proyecto de TypeScript a JavaScript.
# El resultado se guardará en la carpeta /app/dist
RUN pnpm run build

# =================================================================
# ETAPA 2: Production - Crea la imagen final de producción
# =================================================================
FROM node:20-alpine

WORKDIR /app

# Copia los archivos de manifiesto de dependencias
COPY package.json pnpm-lock.yaml ./

# Instala pnpm y luego SOLO las dependencias de producción
RUN npm install -g pnpm
RUN pnpm install --prod

# Copia el código JavaScript compilado desde la etapa 'builder'
COPY --from=builder /app/dist ./dist

# Expone el puerto en el que se ejecutará tu aplicación
# ¡Asegúrate de cambiar 3000 si tu aplicación usa un puerto diferente!
EXPOSE 3000

# El comando para iniciar tu aplicación
# Ajusta "dist/server.js" si tu archivo de entrada principal es diferente
CMD [ "node", "dist/main.js" ]
