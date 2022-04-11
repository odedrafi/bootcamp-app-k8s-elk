# CI/CD Pipeline

![This is an image](images/ci_cd-pipeline.png)

[![Build Status](https://dev.azure.com/odedrafi35/bootcamp-app/_apis/build/status/bootcamp-app?branchName=master)](https://dev.azure.com/odedrafi35/bootcamp-app/_build/latest?definitionId=7&branchName=master) [![arti315 package in Feed_Good@Local feed in Azure Artifacts](https://feeds.dev.azure.com/odedrafi35/4a4ba2b7-9d9a-4fd5-b166-f4ed9948c80b/_apis/public/Packaging/Feeds/Feed_Good@Local/Packages/77bc383b-cc35-4f74-a078-9b893b7e4f86/Badge)](https://dev.azure.com/odedrafi35/bootcamp-app/_artifacts/feed/Feed_Good@Local/UPack/arti315/0.0.1)

# Description

hi!! have you ever wanted to integrate your nodejs app on a CI\CD with azure devops?. this is the place for you !
in here we will try to explain the steps to take inorder to make it work!

this project is part of bottcamp in sela

# ci\cd illustration

![This is an image](images/project-cicd.png)

## Deployment

<span style="color:red">**This project dosn't yet containe a ci\cd pipeline for infrastructureso it will have to be deployd manually.**</span>

### Create an azure devops project:

In the azure devops UI we can intigrate everything we need for the project .

> here are the steps demonstrated in this pproject

- import your app repo to Azure Repo
  > for the purpose of this exersize will need to add
  > a playbook.yaml for cd deployment with ansible
- Go to Azure Pipelines tab and start a new pipeline using a multi staged yaml(not classic) file
- We will run a simple dependacies installation and archive our solution as an artifact and Publish it(save it) to Azure artifacts
  for that purpose we can use the command which is suited for ci testing :

  > $ [npm ci](https://docs.npmjs.com/cli/v8/commands/npm-ci)

- Using the show assistant on the top right of your piprline in edit mode, you can saerch for the action you want to preform. this will give us a blook of the command in yaml.
- CD deployment default in the yaml pipeline version is auto (continues deployment) to change that will need to add an Enviroment <span style="color:red">and add an encapsulaion of the stage we want to control the deployment of, to our yaml pipeline code.</span>
- thats it know on every commit your pipeline will start the ci\cd procces.

---

![Demo](docs/build-weight-tracker-app-demo.gif)

---

## Links for tips and intructions

- [how to install Ansible](https://gitlab.com/ansible-workshop/labs/lab06)
- infrastructure Used in this project deployed by terraform[Terraform repo](https://github.com/odedrafi/SelaBootcampWeek5Terraform.git)
- [Multi-stage yaml syntax example](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml)
