# How to Run Application using Dockerfile .

1- Go to flask_app folder .
2- change any env variables in .env .
3- build the docker image using 

```bash

docker build -t flask_app .

```

4 - run the app .

```bash
docker run -p 3029:3019 -e key=value flask_app 
```