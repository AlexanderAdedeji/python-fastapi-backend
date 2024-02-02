# Use the official Python image as the base image
FROM python:3.12

RUN pip3 install fastapi uvicorn poetry
# Set the working directory inside the container
WORKDIR /public_backend

# copy the project requirements files
COPY pyproject.toml poetry.lock* /public_backend/


# set poetry to not create a virtual environment
RUN poetry config virtualenvs.create false --local
# install project dependencies
RUN poetry install

# Copy the contents of the current directory (including commonLib folder) into the container's working directory
COPY ./public_backend/ /public_backend/public_backend
# COPY ./alembic.ini /public_backend
# COPY ./alembic/ /public_backend/alembic/
COPY ./commonLib/ /public_backend/commonLib/

# give executable permissions to the entrypoint file
RUN chmod u+x /public_backend/public_backend/entrypoint.sh

# run the entrypoint
ENTRYPOINT [ "/public_backend/public_backend/entrypoint.sh" ]
