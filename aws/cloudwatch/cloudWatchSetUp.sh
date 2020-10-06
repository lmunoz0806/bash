#! /bin/bash
echo Setting up CloudWatch!;
DLDIR="/tmp/"
DESTDIR="/root/scripts/cloudWatch"
#Update Ubuntu
sudo apt-get update && apt-get upgrade -y
sudo apt-get install unzip libwww-perl libdatetime-perl -y
cd $DLDIR
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O;
unzip CloudWatchMonitoringScripts-1.2.2.zip && \
rm CloudWatchMonitoringScripts-1.2.2.zip && \
mkdir $DESTDIR
mv aws-scripts-mon/* $DESTDIR
cd $DESTDIR && rm -rf NOTICE.txt awscreds.template LICENSE.txt
echo done;
echo attach CloudWatchAgentServerRole to Ec2 instance
