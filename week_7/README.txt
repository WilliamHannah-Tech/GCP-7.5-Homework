# GCP Terraform VPC Assignment

## Project Description

This project uses Terraform to create a Google Cloud VPC network and a local text file. The text file contains my favorite food. The project also outputs the name of the VPC after Terraform runs.

## Tools Used

- Terraform
- Google Cloud Platform
- Google Terraform Provider
- Local Terraform Provider
- GitHub
- VS Code / terminal

## Folder Structure

WEEK_7/
INFRASTRUCTURE/
 > .terraform
 v data_source
    =chicken-pizza.txt
     main.tf
 > Deliverables
    = GCloud Init.txt
      Terraform apply.png
      Terraform plan.png
  0-provider.tf
  1-VPC.tf
  2-outputs.tf
  3-variables.tf
  .gitignore



Steps:
1. Created a local repo
2. Created the infrastructure folder within week_7
3. Ran the Google Cloud SDK Shell gcloud init
4. Added the GCP provider, VPC.
5. Went back and looked at GCP Terraform Section 3:21 and follow along to do the local_file correct. (I remember this in Armageddon)
6. Added the outputs, and the variables. 
7. Ran terraform init
8. Terraform plan
9. Terraform apply  yes
10. Took screenshots of my successful deployments and made a txt file for my gcloud commands. Added a deliverables folder to add my screenshots to it. 
11. Made my README.txt
12. Push it to the limit. 
