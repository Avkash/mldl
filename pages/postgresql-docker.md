# Creating PostgreSQL instance in Docker #

## What you need ##
1. Docker DeskTop
```
$  docker -v
Docker version 19.03.8, build afacb8b
$ docker-compose -v
docker-compose version 1.25.5, build 8a1c60f6

2. pgadmin4 
Install from here > https://www.pgadmin.org/download/
```

## Getting started ##
1. Create a new folder and create a new file name > docker-compose.yml
```
version: '3.1' # specify docker-compose version
services:
  dockerpgdb:
    image: postgres
    ports:
      - "5432:5432"
    restart: always
    environment:
      POSTGRES_PASSWORD: Password
      POSTGRES_DB: dockerpgdb
      POSTGRES_USER: abcUser
    volumes:
      - ./data:/var/lib/postgresql%
```
2. Run the following in the same folder where  
- $ docker-compose up
- Note: You will see some activity on command prompt and then in the Docker desktop application, your container will be running

3. Test with pgadmin4
- Run pgadmin4
- In the Web Browser please setup a new server as below:
```
host: localhost
port: 5432
maintenance database: postgres
username: abcUser
password: Password
```

4. Connect and test


