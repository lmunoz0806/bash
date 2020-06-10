#! /bin/bash
echo Setting up CloudWatch!;
#Update Ubuntu
sudo apt-get update && apt-get upgrade -y;
sudo apt-get install unzip libwww-perl libdatetime-perl -y;
cd /tmp/;
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O;
unzip CloudWatchMonitoringScripts-1.2.2.zip && \
rm CloudWatchMonitoringScripts-1.2.2.zip && \
mkdir /home/ubuntu/cloudWatch;
mv aws-scripts-mon/* /home/ubuntu/cloudWatch/;
cd /cloudWatch && rm -rf NOTICE.txt awscreds.template;
echo done;
echo Please attach CloudWatchAgentServerRole to Ec2 instance;
