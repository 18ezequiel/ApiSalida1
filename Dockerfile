FROM python:3.9-slim-buster

# Instalar OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/*

# Instalar las dependencias necesarias
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar los archivos de la aplicación
COPY main.py .
COPY datasets .

# Iniciar la aplicación
CMD ["python", "main.py"]
