# Notes

## Setup MySQL docker image
```bash
docker run --name test-mysql \
  -p 3306:3306 \
  -e MYSQL_ROOT_HOST=172.17.0.1 \
  -e MYSQL_ROOT_PASSWORD=test \
  -d mysql/mysql-server:latest
```
