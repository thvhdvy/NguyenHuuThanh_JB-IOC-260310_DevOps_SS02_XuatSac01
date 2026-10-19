dockrer rm -f quickbite-user 2>/dev/null
docker run -d \
	--name quickbite-user \
	-p 8081:8081 \
	-v /mnt/d/Projects/DevOps/user-service/build/libs:/app \
	-w /app \
	--add-host=host.docker.internal:host-gateway \
	-e SERVER_PORT=8081 \
	-e SPRING_DATASOURCE_URL=jdbc:postgresql://host.docker.internal:5432/postgres \
	-e SPRING_DATASOURCE_USERNAME=postgres \
	-e SPRING_DATASOURCE_PASSWORD=12345678 \
	eclipse-temurin:17-jre-alpine \
	java -jar user-service-0.0.1-SNAPSHOT.jar
