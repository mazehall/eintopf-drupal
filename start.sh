#!/usr/bin/env sh

. ./project.sh

DRUPAL_TAG="7.40"

if ! [ -d "$PROJECT_PATH/.git" ]; then
  echo "cloning drupal sources..."
  if ! xgit clone https://github.com/drupal/drupal "$PROJECT_PATH"; then
    echo "git clone failed"
    exit 1
  fi
fi

cd "$PROJECT_PATH"
if [ "`git name-rev --tags --name-only $(git rev-parse HEAD)`" != "$DRUPAL_TAG" ]; then
  echo "Checkout drupal version $DRUPAL_TAG..."
  if ! git fetch || ! git checkout $DRUPAL_TAG; then
    echo "Failed to change to drupal version $DRUPAL_TAG"
    exit
  fi
fi

xcompose "up -d"
echo "done"
