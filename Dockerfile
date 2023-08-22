FROM jrottenberg/ffmpeg:latest

#  directory in the container
WORKDIR /app

# Copy the requirements
COPY requirements.txt .

# Install dependencies
RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Copy
COPY . .


RUN chmod +x start.sh

# Command to run the application
CMD ["bash", "start.sh"]
