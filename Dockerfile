FROM python:3.9-slim

RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock

RUN pip install --no-cache-dir poetry
RUN poetry install --no-dev

COPY . .

ENV FLASK_APP=app
ENV FLASK_ENV=production

EXPOSE 10000

CMD ["poetry", "run", "flask", "run", "--host=0.0.0.0", "--port=10000"]
