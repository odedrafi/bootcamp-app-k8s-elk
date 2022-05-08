# <font color=#728FCE>Kubernates pipeline for nodejs app</font>




# <font color=#728FCE>Description</font>

Weight-tracker webapp deployied in azure devops.
a simple nodejs app with kubernates azure devops implimentation


> Kubernates pipeline ( <span style="color:red"> "azure-k8s-pippeline.yaml"</span>)

<font color=#728FCE></font>
For the infrastracture we will use the repo from [k8s terrafom infrastructure repo](https://github.com/odedrafi/K8sInfrastructure-week9-10-). apply the ifrastructure and start the process.


# <font color=#728FCE>Pipeline Agent  initialization</font>

- update the server:
> sudo apt-get update

- Install docker with:
> sudo apt-get install -y docker.io

- Open acces to fockr run
>sudo chmod 666 /var/run/docker.

- Install kubectl with:

>sudo snap install kubectl --classic

- Install az  

>curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

- Connect to your subscripyion by 

> az login

- Make sure to connect to your cluster by :

> az aks get-credentials --resource-group {your resource group name} --name {your azure kubernates cluster name} --overwrite-existing

- Connect your azure container repository to your aks 

> az aks update -n {your azure kubernates cluster name}  -g RG --attach-acr {your azure container registery name} 

- Run this script <span style="color:red">(red section is were to edit to your variables)</span>  to connect your agent to azure devops pipline:

> mkdir azagent
cd azagent
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.202.1/vsts-agent-linux-x64-2.202.1.tar.gz
tar -zxvf vstsagent.tar.gz
if [ -x "$(command -v systemctl)" ]; then
    ./config.sh --pool <span style="color:red"> {your pool name}</span> --acceptteeeula --agent $HOSTNAME --url <span style="color:red"> {your azure devops project url}</span> --work _work --projectname <span style="color:red"> {'your azure devops project name'}</span> --auth PAT --token <span style="color:red"> {your azure devops pat token}</span> --runasservice
    sudo ./svc.sh install
    sudo ./svc.sh start
else
    ./config.sh --pool <span style="color:red"> {your pool name}</span> --acceptteeeula --agent $HOSTNAME --url <span style="color:red"> {your azure devops project url}</span> --work _work --projectname <span style="color:red"> {'your azure devops project name'}</span> --auth PAT --token <span style="color:red"> {your azure devops pat token}</span>
    ./run.sh
fi


this project is part of bottcamp in sela[Sela DevOps Bootcamp Page](https://rhinops.io/bootcamp).


<font color=#728FCE>ci\cd illustration</font>

![This is an image](images/docker-cicd.png)![This is an image](images/project-cicd.png)

## <font color=#728FCE>running the pipeline:</font>

- This pipline uses files to deploy the k8s cluster with kubectl commmands using the .yaml file in the repo

![This is an image](images/expectedresults.jpg)
![This is an image](images/k8syamfiles.png)





  >sudo apt-get update 

  >apt-get upgrade -y

  >curl -fsSL https://get.docker.com/ -o get-docker.sh

  >bash get-docker.sh

  >sudo chmod 666 /var/run/docker.
  
  >sock (to make the container accesible)  
- Node.js 14.x 
- PostgreSQL (can be installed locally using Docker)
- Free Okta developer account for account registration, login
## <font color=#728FCE>Deployment</font>

<span style="color:red">This project dosn't yet containe a ci\cd pipeline for infrastructureso it will have to be deployd manually.us</span>
### <font color=#728FCE>Create an azure devops project:</font>
##### <font color=#728FCE>deployment of universal packadge Pipeline:</font>
In the azure devops UI we can intigrate everything we need for the project .

> here are the steps demonstrated in this pproject

- import your app repo to Azure Repo

- Go to Azure Pipelines tab and start a new pipeline using a multi staged yaml(not classic) file
- We will run a simple dependacies installation and archive our solution as an artifact and Publish it(save it) to Azure artifacts
  for that purpose we can use the command which is suited for ci testing :

  > $ [npm ci](https://docs.npmjs.com/cli/v8/commands/npm-ci)

<span style="color:red"></span>
##### <font color=#0046FF>deployment of the docker pipeline:</font>


ENV file format:
![This is an image](images/ENV_example.jpg)

---

### <font color=#728FCE>Demo</font>


![Demo](docs/build-weight-tracker-app-demo.gif)

---

### <font color=#728FCE>expected resultes</font>

<span style="color:red">Universal packadge pipeline.</span>
![expected_results image](images/expected_results.jpg)

<span style="color:red">Docker pipeline.</span>
![expected_results image](images/Docker_Pipeline_results.jpg)

---

### <font color=#728FCE>Links for tips and intructions</font>

- [how to install Ansible](https://gitlab.com/ansible-workshop/labs/lab06)
- infrastructure Used in this project deployed by terraform[Terraform repo](https://github.com/odedrafi/SelaBootcampWeek5Terraform.git)
- [Multi-stage yaml syntax example](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml)




