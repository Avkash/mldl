# Accessing S3 source from H2O for data ingest #

What you need?
 - AWS KEY
 - AWS SECRET

Please add your AWS credentials to a file as below:
```
$ cat ~/.ec2/aws_credentials.properties
accessKey=$$$$$$
secretKey=$$$$
```
Note: You can keep these credentials file to any location.

And then pass that credential file with as below when you are starting H2O: 
```
$ java -jar h2o.jar -aws_credentials .ec2/aws_credentials.properties
```

Test OK and it does work with s3://* 

Suggestion:
 - Please use S3 for data ingest
 - Please use S3N and S3A for data upload mostly when your models are done.
 
