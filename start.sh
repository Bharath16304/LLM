#!/usr/bin/env bash
# Start Gunicorn with Uvicorn workers, pointing to app:app
# Use 4 workers for stability, binding to the port environment variable
gunicorn -w 4 -k uvicorn.workers.UvicornWorker app:app -b 0.0.0.0:${PORT:-8000}