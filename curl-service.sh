#!/bin/bash

PUBLIC_DNS=$(aws cloudformation describe-stacks --stack-name helloworld --query 'Stacks[].Outputs[?OutputKey==`LoadBalancer`].OutputValue' --output text)

curl $PUBLIC_DNS
