#!/bin/bash

GIT_CLONE_URL=$(aws cloudformation describe-stacks --stack-name helloworld --query 'Stacks[].Outputs[?OutputKey==`CodeCommitRepositoryCloneURL`].OutputValue' --output text)

git clone $GIT_CLONE_URL helloworld
