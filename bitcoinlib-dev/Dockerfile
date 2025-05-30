# Use official Python 3.11 slim image (more stable for numpy/bitcoinlib)
FROM python:3.11-slim

# Install build essentials (for any native deps)
RUN apt-get update && apt-get install -y build-essential

# Upgrade pip, setuptools, wheel
RUN python -m pip install --upgrade pip setuptools wheel

# Install bitcoinlib
RUN python -m pip install bitcoinlib

# Set workdir
WORKDIR /workspace

# Default command: bash shell for interactive dev
CMD [ "bash" ]