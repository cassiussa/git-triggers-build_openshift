#!/bin/bash

# Gets the repo with ".git" at the end
REPO_WITH_DO_GIT=${GIT_REPO_URL##*/}

# Gets the repo without .git at the end
REPO_NAME="${REPO_WITH_DO_GIT/\.git/}"

# Check if it exists already
if [ ! -d "/repositories/${REPO_NAME}/.hist" ]; then
    # Make the directory
    mkdir -p /repositories/${REPO_NAME}/.hist
fi

