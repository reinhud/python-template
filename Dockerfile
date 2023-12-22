# syntax=docker/dockerfile:1

#==============================================================================#
#========= Base Image =========#
#==============================================================================#
# Use slim, up to date, and official LTS version as base.
ARG PYTHON_VERSION=3.11.6
FROM python:${PYTHON_VERSION}-slim-bookworm as base

ENV PYTHONUNBUFFERED=1 \
    # pip
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    # Poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=1.6.1 \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1 \
    # never create virtual environment automaticlly, only use env prepared by us
    POETRY_VIRTUALENVS_CREATE=false \
    \
    # this is where our requirements + virtual environment will live
    VIRTUAL_ENV="/venv" 

# prepend poetry and venv to path
ENV PATH="$POETRY_HOME/bin:$VIRTUAL_ENV/bin:$PATH"

# prepare virtual env
RUN python -m venv $VIRTUAL_ENV

# working directory and Python path
WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y \
    curl

# install poetry - respects $POETRY_VERSION & $POETRY_HOME
# The --mount will mount the buildx cache directory to where
# Poetry and Pip store their cache so that they can re-use it
RUN --mount=type=cache,target=/root/.cache \
    curl -sSL https://install.python-poetry.org | python3 -

ENV PYTHONPATH="/app:$PYTHONPATH"

RUN echo "Base image build successfully"


#==============================================================================#
#========= Dependancy Image =========#
#==============================================================================#
FROM base AS deps

# used to init dependencies
COPY poetry.lock pyproject.toml ./

# install runtime deps to VIRTUAL_ENV
RUN --mount=type=cache,target=/root/.cache \
    poetry install --no-root --only main

RUN echo "Dependancy image build successfully"


#==============================================================================#
#========= Development Image =========#
#==============================================================================#
FROM base as dev 

# Specify environment
ENV ENVIRONMENT="development"

# Installing git 
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# used to init dependencies
COPY poetry.lock pyproject.toml ./

# quicker install as runtime deps are already installed
RUN --mount=type=cache,target=/root/.cache \
    poetry install --no-root


#==============================================================================#
#========= Production Image =========#
#==============================================================================#
FROM base as prod

# Specify environment
ENV ENVIRONMENT="production"

# copy dependencies
COPY --from=deps $VIRTUAL_ENV $VIRTUAL_ENV

# copy project
COPY . .

# Create a non-root user
RUN useradd -m appuser

# Change ownership of the working directory to the non-root user
RUN chown -R appuser:appuser /workspace

# Change to the non-root user
USER appuser

# run on startup
CMD ["python", "src/main.py"]     
