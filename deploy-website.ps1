$token = aws ssm get-parameters `
    --name "/DoujinDB/GitHub/OAuthToken" `
    --with-decryption --query "Parameters[0].Value"
	
$repositoryName = aws ssm get-parameters `
    --name "/DoujinDB/GitHub/DoujinDbRepository" `
    --with-decryption --query "Parameters[0].Value"
	
aws cloudformation deploy `
  --template-file .\application.yaml `
  --capabilities CAPABILITY_IAM `
  --parameter-overrides `
      OAuthToken=$token `
      Repository=$repositoryName `
  --stack-name doujin-db-vue-app