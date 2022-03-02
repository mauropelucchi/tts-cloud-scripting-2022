mkdir /tmp/mylog
curl https://raw.githubusercontent.com/mauropelucchi/tts-cloud-scripting-2022/main/data/data100k.csv.zip -o /tmp/mylog/data.zip >> /tmp/mylog/myapplog.out

export S3_BUCKET="tts-2022-l03-mauro"
echo $S3_BUCKET

aws s3 ls $S3_BUCKET

unzip /tmp/mylog/data.zip >> /tmp/mylog/myapplog.out
cat data100k.csv | wc -l >> /tmp/mylog/myapplog.out

aws s3 ls s3://$S3_BUCKET >> /tmp/mylog/myapplog.out

aws s3 cp /tmp/mylog/data.zip s3://$S3_BUCKET/data.zip >> /tmp/mylog/myapplog.out
aws s3 cp data100k.csv s3://$S3_BUCKET/data100k.csv >> /tmp/mylog/myapplog.out


cat /tmp/mylog/myapplog.out
