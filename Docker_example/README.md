## Build the image

docker build -t <new_image_name> .

## Build and deploy the container

docker run -d --name <name-container> -p 8081:80 <new_image_name>

## Check if the container was successfully created

docker ps -a

## Verify that the container is running

<public_ip>:8080

## Login to your docker account

docker login --username username

## Tag your image

docker tag IMAGE USERNAME/NAME[:TAG]

## Docker push using same tag

docker push USERNAME/NAME[:TAG]