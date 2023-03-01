FROM python:3.9-slim-buster

# Instalar OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/*

# Instalar las dependencias necesarias
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar los archivos de la aplicación
RUN mkdir /app
COPY main.py /app
COPY datasets/* /app/datasets

# Iniciar la aplicación
CMD ["python", "/app/main.py"]
