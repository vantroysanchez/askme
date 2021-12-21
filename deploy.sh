#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'Deployment App'
git push -f git@github.com:vantroysanchez/askme.git master:gh-pages

cd -
