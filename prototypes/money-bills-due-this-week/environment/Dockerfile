# Agent sandbox ("main" service). Deliberately empty of Nora's data:
# everything about her lives in the world sidecar and is reachable only via tools.
FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
WORKDIR /app
