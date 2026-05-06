# Stage 1: Builder
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Runtime
FROM python:3.12-slim

ENV VIRTUAL_ENV=/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Create non-root user
RUN useradd --create-home appuser

WORKDIR /app

# Copy virtual environment and app source
COPY --from=builder /venv /venv
COPY --from=builder /app /app

USER appuser

EXPOSE 5000

ENTRYPOINT ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]