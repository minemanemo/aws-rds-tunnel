#! /bin/bash

# root 권한 체크

WHOAMI=`whoami`

if [ "$WHOAMI" != "root" ];
then
	echo "is not root"
	echo "please execute by root(sudo)"
	exit 1
fi

# aws cli 설치
IS_INSTALL_AWS=`which aws`
if [ "$IS_INSTALL_AWS" == "" ];
then
	curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
	sudo installer -pkg AWSCLIV2.pkg -target /
else
	echo "aws cli is already installed..."
	echo ""
fi

# 스크립트 배포
rm -rf /usr/local/bin/aws-rds-tunnel 2> /dev/null
cp aws-rds-tunnel /usr/local/bin


# echo example

echo "[ Example Command ]"
echo "(1) connect shell to instance (required EC2 Instance ID)"
echo " $ aws ssm start-session --target {ec2 instance id}"
echo ""
echo "(2) tunnel to AWS RDS"
echo "[a] execute Script"
echo " $ aws-rds-tunnel {ec2 instance id} {az} {local port} {RDS DNS address} {RDS Port}"
echo ""
echo "[b] open another terminal"
echo ""
echo "[c] execute mysql client"
echo " $ /usr/local/opt/mysql-client/bin/mysql -h127.0.0.1 -uUserID -pPassword"
echo ""
