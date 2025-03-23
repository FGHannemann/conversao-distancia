FROM python:3.10.12
WORKDIR /app 
COPY requirements.txt .
RUN useradd -ms /bin/bash desafidocker
RUN pip install --upgrade pip
USER root
RUN python -m pip install -r requirements.txt
USER desafidocker
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app" ]