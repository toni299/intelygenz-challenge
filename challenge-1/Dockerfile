FROM python:3.9-alpine

# RUN adduser -D -u 1000 -G users http-server-challenge

# USER http-server-challenge

WORKDIR /app

COPY --chown=http-server-challenge:http-server-challenge main.py .

EXPOSE 8000

ENTRYPOINT ["python", "main.py"]