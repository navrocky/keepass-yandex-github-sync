#!/bin/sh

set -e
# set -x

log() {
    echo "== $1"
}

log "Configure GIT"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global user.name "${GIT_USER_NAME}"

sync() {
    if [ ! -d "${LOCAL_REPO_DIR}" ]; then
        log "Clone repository"
        git clone "${GIT_REPO}" "${LOCAL_REPO_DIR}"
        cd "${LOCAL_REPO_DIR}"
    else
        log "Pull repository"
        cd "${LOCAL_REPO_DIR}"
        git pull
    fi

    log "Get fresh keepass db file"
    FILE_NAME=$(basename ${YD_KEEPASS_FILE})
    curl -L -u "${YD_USER}:${YD_PASSWORD}" "https://webdav.yandex.ru/${YD_KEEPASS_FILE}" -o ${FILE_NAME}

    if [ ! -z "$(git status -s)" ]; then
        log "File changed. Commit and push"
        git add .
        git commit -m "Update"
        git push
    fi
    cd ..
}

while true; do
    sync
    log "Sleep for ${DELAY}"
    sleep ${DELAY}
done
