# Use the official Python image as the base image
FROM python:3.12

RUN pip3 install fastapi uvicorn poetry
# Set the working directory inside the container
WORKDIR /admin_backend

# copy the project requirements files
COPY pyproject.toml poetry.lock* /admin_backend/


# set poetry to not create a virtual environment
RUN poetry config virtualenvs.create false --local
# install project dependencies
RUN poetry install

# Copy the contents of the current directory (including commonLib folder) into the container's working directory
COPY ./admin_backend/ /admin_backend/admin_backend
# COPY ./alembic.ini /admin_backend
# COPY ./alembic/ /admin_backend/alembic/
COPY ./commonLib/ /admin_backend/commonLib/

# give executable permissions to the entrypoint file
RUN chmod u+x /admin_backend/admin_backend/entrypoint.sh

# run the entrypoint
ENTRYPOINT [ "/admin_backend/admin_backend/entrypoint.sh" ]