# Node.js Weight Tracker

![This is an image](ci_cd-pipeline.png)

# Description

hi!! have you ever wanted to integrate your nodejs app on a CI\CD with azure devops?. this is the place for you !
in here we will try to explain the steps to take inorder to make it work!

this project is part of bottcamp in sela

# ci\cd illustration

![This is an image](project-cicd.png)

## Deployment

<span style="color:red">**This project dosn't yet containe a ci\cd pipeline for infrastructureso it will have to be deployd manually.**</span>

### Create an azure devops project:

In the azure devops UI we can intigrate everything we need for the project .

> here are the steps demonstrated in this pproject

- import your app repo to Azure Repo
  > for the purpose of this exersize will need to add
  > a playbook.yaml for cd deployment with ansible
- Go to Azure Pipelines tab and start a new pipeline using a multi staged yaml file
- Will run a simple dependacies installation and archive our solution as an artifact and Publish it(save it) to Azure artifacts

---

![Demo](docs/build-weight-tracker-app-demo.gif)

---

https://gitlab.com/ansible-workshop/labs/lab06



# This readme to be continued!!