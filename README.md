# tf-gcp-challenge_carandang-axel
## Initialization
Before doing anything you have to setup a project in Google Cloud and configure permissions in IAM.
Also dont forget to enable some APIs used in the project : 
- Billing
- Cloud Storage
- BigQuery

## Terraform
Before running any command you have to update the "project_id" value in all the variables.tf files

Then you can run the next command to init terraform:
```
terraform init
```

and then the next command
```
terraform apply
```
*** Waring: you may have to do it multiple times and commenting some lines in the "cloud" directory.

## Destroy
At the end if you want to destroy just write the folowing command in the terminal :  

```
terraform destroy
```