# Sticker Post 
## AWS Cognito
- Pool id: us-west-2_GM4HyWb3W
- Pool ARN:  arn:aws:cognito-idp:us-west-2:058373926451:userpool/us-west-2_GM4HyWb3W
- App client id: 56ln8c8lbb41vls15guij1sv1f
- User: jasper, Wdc3347

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

## Lambda
