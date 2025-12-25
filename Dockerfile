# Use the official Python image.
FROM python:3.10-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the requirements file into the container.
COPY requirements.txt .

# Install the dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container.
COPY monitor.py .

# IMPORTANT: The Docker container will not have access to the .env file.
# You must pass environment variables to the container at runtime.
# Example: docker run -e BINANCE_API_KEY="key" -e BINANCE_API_SECRET="secret" -e DISCORD_WEBHOOK_URL="url" <image_name>

# Command to run the application.
CMD ["python", "monitor.py"]
