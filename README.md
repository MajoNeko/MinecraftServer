# MinecraftServer
This projects explain how to host a Minecraft server running inside a Docker Container using Docker Compose. It provides a reliable, portable and reproducible server environment to be run on a cloud VM.

## Table of Contents

## Quickstart

1. If you don't already have it installed, it is recommended to install Docker Desktop (on windows) to use Docker and Docker Compose. You can download and follow installation instructions here: <https://docs.docker.com/desktop/setup/install/windows-install/>

2. Copy the example.env and configure required application variables
    - `cp example.env .env`

## Project Structure

- ".docs" : Contains any relevant documents (Project checklist).
- "gitignore" : Prevents irrelevant files from being commited.
- "docker-compose-yaml" : A configuration file for Docker to define the necessary services such as mc-server service, port mapping, volumes, etc.
- "Dockerfile" : Instructions for Docker to create a custom image with OpenJDK and the Minecraft server .jar.
- "example.env" : Contains example environment variables to setup the project.
- "README.md" : This document. Contains insructions on how to setup and deploy the server.
