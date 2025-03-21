#!/bin/bash

aws cloudformation create-stack \
  --stack-name shibaEventBridgeScheduler \
  --template-body file://eventBridgeSchduler.yaml \
  --capabilities CAPABILITY_NAMED_IAM
