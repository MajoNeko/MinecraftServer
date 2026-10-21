FROM eclipse-temurin:25-jdk

#Create a directory for the server
WORKDIR /app

# Copy the server jar from your local assets folder
COPY assets/server.jar /app/server.jar

#Accept the EULA
RUN echo "eula=true" > eula.txt

#Environment variables
ENV MEMORY=4G

EXPOSE $APP_PORT

#Startup command
CMD ["sh", "-c", "java -Xmx${MEMORY} -Xms${MEMORY} -jar server.jar nogui"]