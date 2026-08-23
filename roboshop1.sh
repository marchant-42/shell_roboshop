
#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-051bd3051b24472e6"
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalog" "user" "cart" "shipping" "payment" "dispatch" "frontend")
ZONE_ID="Z06595273AQ0EA2LJG30D"
DOMAIN_NAME="satishdevops.shop"


for instance in ${INSTANCES[@]} # for test aws ec2 run-instances --image-id ami-0220d79f3f480ecf5 --instance-type t2.micro --security-group-ids sg-051bd3051b24472e6 --tag-specifications "ResourceType=instance,Tags=[{Key=Name, Value=test}]"
do 

    INSTANCE_ID=$(aws ec2 run-instances --image-id ami-0220d79f3f480ecf5 --instance-type t2.micro --security-group-ids sg-051bd3051b24472e6 --tag-specifications "ResourceType=instance,Tags=[{Key=Name, Value=$instance}]" --query "Instances[0].InstanceId" --output text)
    if [ $instance != "frontend" ]
    then 
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)
    else
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)
    fi 
    echo "$instance IP address : $IP" #marchant


done
