#!/bin/bash

aws cloudformation update-stack --stack-name helloworld --template-body file://./cloudformation/scm-pipe-runtime.yaml \
    --capabilities CAPABILITY_IAM \
    --parameters    ParameterKey=Subnets,UsePreviousValue=true \
                    ParameterKey=VPC,UsePreviousValue=true \
                    ParameterKey=DockerImage,UsePreviousValue=true \
                    ParameterKey=DesiredCount,UsePreviousValue=true

aws cloudformation wait stack-update-complete --stack-name helloworld
