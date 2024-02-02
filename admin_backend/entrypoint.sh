#!/bin/bash

cd /app
uvicorn admin_backend.app.main:app --host 0.0.0.0 --port 15500
