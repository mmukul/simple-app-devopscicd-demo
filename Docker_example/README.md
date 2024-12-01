## Build the image

docker build -t <new_image_name> .

docker images

## Build and deploy the container

docker run -d --name <name-container> -p 8081:80 <new_image_name>

## Check if the container was successfully created

docker ps -a

## Verify that the container is running

<public_ip>:8080