
#!/bin/bash
echo "satishh"
AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-051bd3051b24472e6"
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalog" "user" "cart" "shipping" "payment" "dispatch" "frontend")
ZONE_ID="Z06595273AQ0EA2LJG30D"
DOMAIN_NAME="satishdevops.shop"


for instance in ${INSTANCES[@]}
do 