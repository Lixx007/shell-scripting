<<comment

1. Dummy EC2 configuration
Parameter	Dummy value
Region	ap-south-1 (Mumbai)
AMI ID	ami-xxxxxxxxxxxxxxxxx
Instance type	t2.micro
Key pair	my-key
Security Group	sg-xxxxxxxx
Subnet ID	subnet-xxxxxxxx
Number of instances	5

2. Create Bash script
Create a file:
vim create_ec2.sh


Write this code:

#!/bin/bash

# EC2 Configuration
REGION="ap-south-1"
AMI_ID="ami-xxxxxxxxxxxxxxxxx"
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-key"
SECURITY_GROUP="sg-xxxxxxxx"
SUBNET_ID="subnet-xxxxxxxx"
COUNT=5

echo "Starting EC2 instance creation..."

aws ec2 run-instances \
    --region "$REGION" \
    --image-id "$AMI_ID" \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --subnet-id "$SUBNET_ID" \
    --min-count "$COUNT" \
    --max-count "$COUNT" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux-Lab}]'

echo "EC2 instance creation request completed!"



3. Execute the script
Save and exit Vim using Esc, then :wq.

Run:
chmod +x create_ec2.sh
./create_ec2.sh


4. Verify all EC2 instances
aws ec2 describe-instances \
--region ap-south-1 \
--filters "Name=tag:Name,Values=Linux-Lab" \
--query "Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name]" \
--output table

comment
