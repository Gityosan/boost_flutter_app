const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "boostgeoint": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://qcuwn24qz5crxjjtdhoa67pqau.appsync-api.ap-northeast-1.amazonaws.com/graphql",
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
                            "PoolId": "ap-northeast-1:d55ef54e-38b3-4715-8771-58984c8a28f1",
                            "Region": "ap-northeast-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-northeast-1_GjEuZY0k0",
                        "AppClientId": "4jm341nln9k11sn42t0eu5p48q",
                        "Region": "ap-northeast-1"
                    }
                },
                "GoogleSignIn": {
                    "Permissions": "email,profile,openid",
                    "ClientId-WebApp": "208457558693-34so783ibhnr4gftqvobo9df1lmsfv3o.apps.googleusercontent.com"
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "boostgeoint2a1390dc-2a1390dc-dev.auth.ap-northeast-1.amazoncognito.com",
                            "AppClientId": "4jm341nln9k11sn42t0eu5p48q",
                            "SignInRedirectURI": "http://localhost:3000/",
                            "SignOutRedirectURI": "http://localhost:3000/login/",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://qcuwn24qz5crxjjtdhoa67pqau.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "boostgeoint_AMAZON_COGNITO_USER_POOLS"
                    },
                    "boostgeoint_AWS_IAM": {
                        "ApiUrl": "https://qcuwn24qz5crxjjtdhoa67pqau.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "boostgeoint_AWS_IAM"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "boostgeointd7664d3f108b455b87daa1d3ccfc2106145108-dev",
                        "Region": "ap-northeast-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "boostgeointd7664d3f108b455b87daa1d3ccfc2106145108-dev",
                "region": "ap-northeast-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';