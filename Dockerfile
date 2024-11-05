# Use the Python slim image
FROM python:3.9.20-slim-bullseye

# Set the working directory
WORKDIR /app

# Copy the requirements file to the container
COPY ./src/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's code into the container
COPY ./src .

ENV FLAG "flag{fake_flag}"
RUN echo $FLAG > /flag-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32).txt

# Expose the port that the app will run on
EXPOSE 8000

# Command to run gunicorn with 4 worker processes, binding to port 8000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
