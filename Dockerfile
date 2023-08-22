FROM jrottenberg/ffmpeg:latest

# Update and install Python 3 and pip3
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the files
COPY . .

# Make the start.sh script executable
RUN chmod +x start.sh

# Command to run the application
CMD ["bash", "start.sh"]
