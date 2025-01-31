FROM python:3.9-slim

WORKDIR /app

COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock

RUN curl -sSL https://install.python-poetry.org | python3 -
RUN poetry install --no-dev

COPY . .

ENV FLASK_APP=app
ENV FLASK_ENV=production

EXPOSE 10000

CMD ["flask", "run", "--host=0.0.0.0", "--port=10000"]
