FROM alpine:latest


WORKDIR /app


RUN apk add --no-cache curl tar


RUN curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz | tar Jxf - -C /usr/local/bin --strip-components=1 --wildcards */ffmpeg */ffprobe


COPY requirements.txt .

RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r requirements.txt


COPY . .


RUN chmod +x start.sh


CMD ["bash", "start.sh"]
