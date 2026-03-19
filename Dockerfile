# https://docs.astral.sh/uv/guides/integration/docker/
FROM ghcr.io/astral-sh/uv:python3.10-alpine

WORKDIR /code

COPY ./setup.py /code/setup.py

COPY ./pyproject.toml /code/pyproject.toml

COPY ./uv.lock /code/uv.lock

COPY ./README.md /code/README.md

COPY ./src /code/src

RUN uv sync

COPY ./controller /code/controller

CMD ["uv", "run", "uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]
