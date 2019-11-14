#!/bin/bash

./create-stack.sh

./clone-repo.sh
tar xvfz helloworld.tgz
cd helloworld
git add . && git commit -a -m "initial" && git push
cd ..

echo Test with: ./curl-service.sh
echo Teardown with: ./delete-stack.sh
