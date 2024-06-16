# Usa una imagen base de Alpine que es más ligera
FROM python:3.9-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia el script del servidor al contenedor
COPY main.py .

# Define el punto de entrada del contenedor
ENTRYPOINT ["python", "main.py"]

# Exponer el puerto por defecto 8000
EXPOSE 8000