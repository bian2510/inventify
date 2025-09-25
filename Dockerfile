# ==============================================================================
# --- Etapa de Desarrollo (dev-stage) ---
# Esta etapa instala TODAS las dependencias (incluyendo devDependencies)
# y está optimizada para el desarrollo con hot-reloading.
# ==============================================================================
FROM node:20-alpine AS dev-stage

# Instala pnpm globalmente
RUN npm install -g pnpm

WORKDIR /app

# El comando por defecto para esta etapa (será sobreescrito por docker-compose.override.yml)
# Este comando ahora solo asegura que el contenedor se mantenga vivo.
# El comando real se definirá en docker-compose.override.yml.
CMD ["tail", "-f", "/dev/null"]

# ==============================================================================
# --- Etapa de construcción (Builder) ---
# Usa las dependencias de la etapa anterior para construir la aplicación.
# ==============================================================================
FROM node:20-alpine AS builder

# Instala pnpm globalmente
RUN npm install -g pnpm

WORKDIR /app

# Copia las dependencias preinstaladas de la etapa 'deps'
COPY --from=dev-stage /app/node_modules ./node_modules
# Copia el resto del código fuente
COPY . .

# Construye la aplicación para producción
RUN pnpm run build

# ==============================================================================
# --- Etapa final (Producción) ---
# Crea la imagen final y ligera para producción.
# ==============================================================================
FROM node:20-alpine AS final

# Instala pnpm globalmente
RUN npm install -g pnpm

WORKDIR /app

# Copia la aplicación construida y las dependencias de producción
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./

# El comando por defecto para producción (se puede sobreescribir con docker-compose)
CMD [ "pnpm", "run", "start:prod" ]