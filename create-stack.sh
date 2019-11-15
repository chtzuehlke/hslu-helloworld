#!/bin/bash

DEFAULT_VPC_ID=$(aws ec2 describe-vpcs --query 'Vpcs[?IsDefault==`true`].VpcId' --output text)
SUBNET_IDS=$(aws ec2 describe-subnets --query "Subnets[?VpcId==\`$DEFAULT_VPC_ID\`].SubnetId" --output text | sed 's/[[:space:]]/,/g')

aws cloudformation create-stack --stack-name helloworld --template-body file://./cloudformation/scm-pipe-runtime.yaml \
    --capabilities CAPABILITY_IAM \
    --parameters    ParameterKey=Subnets,ParameterValue=\"$SUBNET_IDS\" \
                    ParameterKey=VPC,ParameterValue=$DEFAULT_VPC_ID \
                    ParameterKey=DockerImageTag,ParameterValue=none \
                    ParameterKey=DesiredCount,ParameterValue=0 \
                    ParameterKey=ServiceName,ParameterValue=helloworld

aws cloudformation wait stack-create-complete --stack-name helloworld
