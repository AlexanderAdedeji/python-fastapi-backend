#!/bin/bash

cd /app
# alembic upgrade head
uvicorn public_backend.app.main:app --host 0.0.0.0 --port 15400 --reload
