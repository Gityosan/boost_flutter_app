const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "boostfluttergeoint": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://4saj4jxcmfdgnkue3elkoq4eqq.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                    "region": "ap-northeast-1",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-northeast-1:ad9c7c83-8f1f-4ecc-8c6f-2cfa53ef2666",
                            "Region": "ap-northeast-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-northeast-1_ZBwVQkx5U",
                        "AppClientId": "46p9nlj8s0svjrq7jq3j070c7s",
                        "Region": "ap-northeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://4saj4jxcmfdgnkue3elkoq4eqq.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "boostfluttergeoint_AMAZON_COGNITO_USER_POOLS"
                    },
                    "boostfluttergeoint_AWS_IAM": {
                        "ApiUrl": "https://4saj4jxcmfdgnkue3elkoq4eqq.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "boostfluttergeoint_AWS_IAM"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "boostfluttergeoint54e7eb6cc7fd47d99ff08069a2290145415-dev",
                        "Region": "ap-northeast-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "boostfluttergeoint54e7eb6cc7fd47d99ff08069a2290145415-dev",
                "region": "ap-northeast-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';