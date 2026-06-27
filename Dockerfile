FROM python:3.12-slim

RUN groupadd -r appgroup && useradd -r -g appgroup appuser

WORKDIR /app

COPY app ./app

EXPOSE 8000

# 2. Set the ownership of your application files to the new user
COPY --chown=appuser:appgroup app ./app

# RUN chown -R appuser:appgroup /app


# 3. Switch to the non-root user
USER appuser

CMD ["python", "app/app.py"]
