# Sticker Post 
## IAM
- Policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:PutItem",
                "dynamodb:Query",
                "dynamodb:UpdateItem",
                "dynamodb:DescribeTable",
                "polly:SynthesizeSpeech",
                "dynamodb:DeleteItem",
                "s3:PutObject",
                "s3:GetObject",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvent"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

## S3
### Static web hosting
* Upon enabled, we can see the endpoints from AWS console -> S3 -> Bucket -> Properties -> Static website hosting
* StickerPost: http://sticker-post-web-hosting.s3-website-us-west-2.amazonaws.com/#/login

### Download
* To download all the files from a S3 bucket, use `aws s3 sync s3://bucket-name .` 

## Lambda

## API Gateway
* To invoke a REST API, the URI would be `https://{restapi_id}.execute-api.{region}.amazonaws.com/{stage_name}/`, all of which values can be found in AWS console. 
* e.g. `https://foaswicnbf.execute-api.us-west-2.amazonaws.com/prod/stickers`. However, this would fail authorization as we use AWS Cognito for authorization

## AWS Cognito
- Pool id: us-west-2_GM4HyWb3W
- Pool ARN:  arn:aws:cognito-idp:us-west-2:058373926451:userpool/us-west-2_GM4HyWb3W
- App client id: 56ln8c8lbb41vls15guij1sv1f
- After creating test users, we can update the status to 'confirmed' by changing the password: `aws cognito-idp admin-set-user-password --user-pool-id <your user pool id> --username user1 --password password --permanent`

## Free tiers
### S3
12 months free for 5 GB, then $0.023 per GB per month

### Lambda
Always free for 1 million requests

### DynamoDb
Always free for less than 25 GB

### API Gateway
12 months free for 1 million requests, then $1 ~ $3 / million requests per month

### AWS Cognito
Always free if under 50,000 MAU (Monthly active users)

