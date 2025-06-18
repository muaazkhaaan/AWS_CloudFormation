#!/bin/bash

# List of spoke names
SPOKES=("Trust1" "Trust2")

# Base CIDR to increment per spoke
BASE_VPC_PREFIX="10"
REGION="eu-west-2"

for i in "${!SPOKES[@]}"; do
  SPOKE_NAME="${SPOKES[$i]}"
  OFFSET=$((20 + i))  # creates 10.20.x.x, 10.21.x.x, etc.

  VPC_CIDR="${BASE_VPC_PREFIX}.${OFFSET}.0.0/20"
  SUBNET1_CIDR="${BASE_VPC_PREFIX}.${OFFSET}.0.0/24"
  SUBNET2_CIDR="${BASE_VPC_PREFIX}.${OFFSET}.1.0/24"

  echo "Deploying spoke: ${SPOKE_NAME} with CIDRs:"
  echo "  VPC_CIDR: $VPC_CIDR"
  echo "  Subnet1: $SUBNET1_CIDR"
  echo "  Subnet2: $SUBNET2_CIDR"

  aws cloudformation deploy \
  --template-file spoke.yaml \
  --stack-name "${SPOKE_NAME}-Spoke" \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "$REGION" \
  --parameter-overrides \
    SpokeName=$SPOKE_NAME

  echo "✅ Finished deploying: $SPOKE_NAME"
  echo "----------------------------------------"
done
