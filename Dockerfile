# Use the official Python image as the base image
FROM python:3.12 as public_backend

RUN pip3 install fastapi uvicorn poetry
# Set the working directory inside the container
WORKDIR /app

# copy the project requirements files
COPY pyproject.toml poetry.lock* ./


# set poetry to not create a virtual environment
RUN poetry config virtualenvs.create false --local
# install project dependencies
RUN poetry install

# Copy the contents of the current directory (including commonLib folder) into the container's working directory
COPY ./public_backend/ ./public_backend/
# COPY ./alembic.ini .
# COPY ./alembic/ ./alembic/
COPY ./commonLib/ ./commonLib/

# give executable permissions to the entrypoint file
RUN chmod u+x ./public_backend/entrypoint.sh

# run the entrypoint
ENTRYPOINT [ "/app/public_backend/entrypoint.sh" ]


# Use the official Python image as the base image
FROM python:3.12 as admin_backend

RUN pip3 install fastapi uvicorn poetry
# Set the working directory inside the container
WORKDIR /app

# copy the project requirements files
COPY pyproject.toml poetry.lock* ./


# set poetry to not create a virtual environment
RUN poetry config virtualenvs.create false --local
# install project dependencies
RUN poetry install

# Copy the contents of the current directory (including commonLib folder) into the container's working directory
COPY ./admin_backend/ ./admin_backend
# COPY ./alembic.ini .
# COPY ./alembic/ ./alembic/
COPY ./commonLib/ ./commonLib/

# give executable permissions to the entrypoint file
RUN chmod u+x ./admin_backend/entrypoint.sh

# run the entrypoint
ENTRYPOINT [ "/app/admin_backend/entrypoint.sh" ]