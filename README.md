# Sync Keepass DB from Yandex Drive to Github

This script periodically syncs your Keepass database from yandexdisk to github when changes are made. It allows you to have a history of file changes and avoid accidental file loss or corruption.

Create `.env` file with the following settings:

```
YD_USER="<Your Yandex user>"
YD_PASSWORD="<Your Yandex user password>"
YD_KEEPASS_FILE="<The path where your Keepass database is located on the Yandex disk>"
GIT_REPO="https://<github user>:<github password or key>@github.com/<github user>/<db repo>.git"
GIT_USER_NAME="<User name for commit>"
GIT_USER_EMAIL="<Email for commit>"
DELAY=1m
```

Run script:

```
docker compose up -d
```
