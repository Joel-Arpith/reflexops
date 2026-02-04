#!/bin/bash

# ReflexOps Bootstrap Script
# Pulls base models and creates agent roles in the running Ollama container.

CONTAINER_NAME="reflexops-ollama"
BASE_MODEL="llama3"

echo "Waiting for Ollama to be ready..."
sleep 5

echo "Pulling base model ($BASE_MODEL)... This may take a while."
docker exec $CONTAINER_NAME ollama pull $BASE_MODEL

echo "Creating Agent Models..."

# Core Fast
echo "Creating core-fast..."
docker exec $CONTAINER_NAME ollama create core-fast -f /root/.ollama/Modelfile.core-fast

# Core Reason
echo "Creating core-reason..."
docker exec $CONTAINER_NAME ollama create core-reason -f /root/.ollama/Modelfile.core-reason

# Core Planner
echo "Creating core-planner..."
docker exec $CONTAINER_NAME ollama create core-planner -f /root/.ollama/Modelfile.core-planner

# Core Deep
echo "Creating core-deep..."
docker exec $CONTAINER_NAME ollama create core-deep -f /root/.ollama/Modelfile.core-deep

echo "All agents initialized successfully."
