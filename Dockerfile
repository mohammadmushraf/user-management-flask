# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files into container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Initialize SQLite DB (adds users table)
RUN python init_db.py

# Expose port (make sure it matches your Flask app)
EXPOSE 5009

# Start the app
CMD ["python", "app.py"]

