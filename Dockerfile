FROM ghcr.io/astral-sh/uv:python-3.14-bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY pyproject.toml uv.lock ./

RUN --mount=type=cache,target=/root/.cache/uv & uv sync --locked --no-dev

CMD ["sh", "-c", "uv run python manage.py migrate && uv run python manage.py collectstatic --no-input && uv run python manage.py runserver 0.0.0.0:8000"]
