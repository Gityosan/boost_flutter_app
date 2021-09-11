const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "boostgeoint": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://fcrtjst6wfhdnpsgfjfchtgthe.appsync-api.ap-northeast-1.amazonaws.com/graphql",
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
                            "PoolId": "ap-northeast-1:536f20ae-6a7d-467e-a445-23dd3531d7c9",
                            "Region": "ap-northeast-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-northeast-1_6fTEdOZC1",
                        "AppClientId": "50allnucdh22k3kffinjltpjvn",
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
                            "WebDomain": "boostgeoint73562835-73562835-dev.auth.ap-northeast-1.amazoncognito.com",
                            "AppClientId": "50allnucdh22k3kffinjltpjvn",
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
                        "ApiUrl": "https://fcrtjst6wfhdnpsgfjfchtgthe.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "boostgeoint_AMAZON_COGNITO_USER_POOLS"
                    },
                    "boostgeoint_AWS_IAM": {
                        "ApiUrl": "https://fcrtjst6wfhdnpsgfjfchtgthe.appsync-api.ap-northeast-1.amazonaws.com/graphql",
                        "Region": "ap-northeast-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "boostgeoint_AWS_IAM"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "boostgeointc9e95e78e03f411db5e27813d9ecf634152254-dev",
                        "Region": "ap-northeast-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "boostgeointc9e95e78e03f411db5e27813d9ecf634152254-dev",
                "region": "ap-northeast-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';