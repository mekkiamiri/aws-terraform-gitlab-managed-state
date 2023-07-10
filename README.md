# About
- This project aims to demonstrate how to use gitlab terraform managed state.
- We will create 2 folders. Each folder will have its proper state.
- first folder will create AWS ec2 and second folder s3 using terraform

# Prerequisites
- have a gitlab account with roles maintainer or owner
- has a AWS account

# How to test this code
- fork the project
- check settings on gitlab to enable terraform on left side bar
- on gitlab create access token and save its value and name (see [References](#references))
- go to settings of the project -> CI/CD -> variables and add the following variables:
```
AWS_ACCESS_KEY_ID: value = your AWS access key
AWS_SECRET_ACCESS_KEY: value = your AWS secret key
TF_PASSWORD: value = the generated value of Gitlab access token
TF_USERNAME: value = the name of the generated Gitlab access token
```
- for every push on main branch, pipeline will run automatically
- it contains:
  - 6 automatic stages(validate, plan and apply for ec2 and s3)
  - 2 manual stages (destroy ec2 and s3)
- when pipeline is finish, you can check resources at AWS
- and the 2 state files (tf_state_modules_ec2_prod and tf_state_modules_storage_prod in our case)
- N.B: to check state files, go to operate on left side bar of the project then terraform states
- you can now, trigger the manual destroys and  check that AWS resources are deleted


# References
- https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html
- https://blog.ruanbekker.com/blog/2023/03/05/persisting-terraform-remote-state-in-gitlab/