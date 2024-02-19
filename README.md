# Provisioning a Heroku App with a Logging add-on - Terraform files
This Repository contains a set of Terraform files to create automatically an application that is built and deployed to Heroku. It includes the [Papertrail](https://elements.heroku.com/addons/papertrail) logging add-on.

# Prerequisites
- A Heroku Account
- A Heroku API Key (see [here](https://devcenter.heroku.com/articles/platform-api-quickstart#authentication) to create one)
- A Heroku Enterprise Team
- The [Terraform CLI](https://www.terraform.io/downloads.html)

# How to create the application
1) Fill in the **vars.template.tf_** variables file and rename it to **vars.tf** `$ mv vars.template.tf_ vars.tf`
2) Execute `$ terraform init` to initialize the Terraform environment
3) Execute `$ terraform plan` and check which actions are expected to be executed by Terraform
4) Execute `$ terraform apply` and type "yes" when prompted "Do you want to perform these actions?" to proceed with the infrastructure creation - the whole process will take about **40 seconds** to complete
4) When the Terraform execution ends correctly, the application URL is shown (e.g. example_app_url = "https://\<your app name>-\<random id>.herokuapp.com/") or you can retrieve it later using `$ terraform show | grep web_url` - open the URL with a browser to see your application running


## Resources created
When the `$ terraform apply` has been executed succesfully, the following resources are created:

| Resource                    | Notes         |
| --------------------------- | ------------- |
| Heroku App                  |               |
| Heroku Standard-1X dyno     | web dyno              |
| Heroku Papertrail           |               |

# How to destroy the environment
1) Execute `$ terraform destroy` and type "yes" when prompted "Do you want to perform these actions?" to proceed with the infrastructure desctruction - the whole process will take about **2 seconds** to complete

# Repository files

| File  | Notes |
| ------------- | ------------- |
| providers.tf  | Includes all the Terraform Providers in use |
| main.tf  | Defines all the Heroku resources to be created |
| vars.template.tf_  | Template file for the Terraform variables to be defined. Once defined, it must be renamed as vars.tf file |
| graph.svg  | Terraform graph image, generated using `$ terraform graph \| dot -Tsvg > graph.svg` - it requires [graphviz](https://formulae.brew.sh/formula/graphviz#default) to be generated|
| README.md  | This README file  |

# Tested on
This package has been tested using the following OS/tools:

| OS/Tool                    | Version         |
| --------------------------- | ------------- |
| macOS                  |  Sonoma 14.3             |
| Terraform CLI             | 1.7.3 | 
| Heroku Terraform Provider             | 5.2.8 | 

# Debugging
- In case of issues executing Terraform, enabling the [log trace](https://www.terraform.io/docs/internals/debugging.html) (e.g. `$ export TF_LOG=TRACE`) can help with understanding the problems

