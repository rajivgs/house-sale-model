# Base image for your ML model
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the ML model files to the working directory
COPY data/ ./data/
COPY images/ ./images/
COPY data.zip .
COPY house-prices-kale.ipynb .
COPY house-prices-kfp.ipynb .
COPY house-prices-orig.ipynb .
COPY my_submission.csv .
COPY README.md .
COPY requirements.txt .

# Install any dependencies required for your ML model
RUN pip install --no-cache-dir numpy==1.19.1
RUN pip install --no-cache-dir -r requirements.txt

# Expose the necessary ports
EXPOSE 8080

# Set the command to run when the container starts
CMD [ "python", "house-prices-kfp.ipynb" ]

