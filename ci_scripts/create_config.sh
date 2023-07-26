#!/bin/sh

# create Config.xcconfig file with the client id for Xcode Cloud builds
if [[ ! -z "${ANILIST_CLIENT_ID}" ]]; then
    cd AniHyou
    touch Config.xcconfig
    echo "ANILIST_CLIENT_ID=${ANILIST_CLIENT_ID}" > Config.xcconfig
fi
