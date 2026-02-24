# Use a lightweight Python 3.11 image
FROM python:3.11-slim

# Set the project directory inside the container
WORKDIR /app

# Copy only requirements first to leverage Docker's build cache
COPY requirements.txt .

# Install dependencies without saving the cache to keep the image small
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Run your application
CMD ["python", "app.py"]
