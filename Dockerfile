FROM eclipse-temurin:25-jdk

#Create a directory for the server
WORKDIR /app

# Copy the server jar from your local assets folder
COPY assets/server.jar /app/server.jar

# Copy the entrypoint script and make it executable
COPY scripts/entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

#Environment variables defaults (True values come from .env)
ENV MEMORY=2G \
    PORT=8888 \
    WHITELIST=false \
    VIEW_DISTANCE=10 \
    MAX_PLAYERS=20 \
    MOTD="Don't Look Behind You Minecraft Server"

EXPOSE 25565

#Checks if the server.properties file exists and then applies our default variables
ENTRYPOINT ["/app/entrypoint.sh"]
