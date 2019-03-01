FROM ubuntu:17.10

# Add Supervisor
RUN apt-get update && apt-get install -y supervisor wget
COPY supervisord.conf /etc

# Download AirConnect
RUN wget --output-document=/bin/airupnp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-aarch64 && chmod +x /bin/airupnp
RUN wget --output-document=/bin/aircast https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-aarch64 && chmod +x /bin/aircast

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
