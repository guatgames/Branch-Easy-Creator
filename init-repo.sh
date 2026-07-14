#!/bin/bash

USER_NAME=aalfaro-2025457
USER_EMAIL=aalfaro-2025457@kinal.edu.gt
MAIN_BRANCH=develop
SEC_BRANCH=aalfaro-2025457

usage() {
    echo "Use: $0 -u <user> -e <email> -m <main_branch> -s <secondary_branch>"
    echo "Example: $0 -u \"guatgames\" -e \"guatgames@example.com\" -m develop -s guatgames"
    exit 1
}

# Read all the available flags
while getopts "u:e:m:s:" opt; do
    case $opt in
        u) USER_NAME="$OPTARG" ;;
        e) USER_EMAIL="$OPTARG" ;;
        m) MAIN_BRANCH="$OPTARG" ;;
        s) SEC_BRANCH="$OPTARG" ;;
        *) usage ;;
    esac
done

#if [ -z "$USER_NAME" ] || [ -z "$USER_EMAIL" ] || [ -z "$MAIN_BRANCH" ] || [ -z "$SEC_BRANCH" ]; then
#    echo "Error: Required flags are missing.."
#    usage
#fi

echo "initializing Git repository"
git init

echo "Configuring credentials"
git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

echo "Creating main branch ($MAIN_BRANCH)..."
git checkout -b "$MAIN_BRANCH"
git push -u origin $MAIN_BRANCH

echo "Creating secondary branch ($SEC_BRANCH)..."
git checkout -b "$SEC_BRANCH"
git push -u origin $SEC_BRANCH

echo ""
echo "Repository succesfully configurated"
echo "----------------------------------------"
echo "Current user: $(git config user.name)"
echo "Current mail : $(git config user.email)"
echo "Current branch: $(git branch --show-current)"