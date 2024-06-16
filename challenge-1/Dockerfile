FROM python:3.9-alpine

WORKDIR /app

COPY main.py .

RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
USER appuser

ENTRYPOINT ["python", "main.py"]

EXPOSE 8000