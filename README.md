# <font color=#728FCE>Kubernates pipeline for nodejs app</font>




# <font color=#728FCE>Description</font>

Weight-tracker webapp deployied in azure devops.
a simple nodejs app with kubernates azure devops implimentation


> Kubernates pipeline ( <span style="color:red"> "azure-k8s-pippeline.yaml"</span>)

<font color=#728FCE></font>
For the infrastracture we will use the repo from [k8s terrafom infrastructure repo](https://github.com/odedrafi/K8sInfrastructure-week9-10-). apply the ifrastructure and start the process.


# <font color=#728FCE>Pipeline Agent  initialization</font>

### After applying the environment we will need to configure our pipeline agent either maually, or by creating a script to run the following init commands:
<span style="color:red">(red section is were to edit to your variables)</span>

- update the server:
> sudo apt-get update

- Install docker with:
> sudo apt-get install -y docker.io

- Open acces to dockr run
>sudo chmod 666 /var/run/docker.

- Install kubectl with:

>sudo snap install kubectl --classic

- Install az  

>curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

- Connect to your subscripyion by 

> az login

- Make sure to connect to your cluster by :

> az aks get-credentials --resource-group <span style="color:red">{your resource group name}</span> --name <span style="color:red">{your azure kubernates cluster name}</span> --overwrite-existing

- Connect your azure container repository to your aks 

> az aks update -n <span style="color:red">{your azure kubernates cluster name}</span>  -g RG --attach-acr <span style="color:red">{your azure container registery name}</span> 

- Run this script to connect your agent to azure devops pipline:

mkdir azagent
cd azagent
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.202.1/vsts-agent-linux-x64-2.202.1.tar.gz
tar -zxvf vstsagent.tar.gz
if [ -x "$(command -v systemctl)" ]; then
    ./config.sh --pool <span style="color:red"> {your pool name}</span>  --acceptteeeula --agent $HOSTNAME --url <span style="color:red"> {your azure devops project url}</span> --work _work --projectname <span style="color:red"> {'your azure devops project name'}</span> --auth PAT --token <span style="color:red"> {your azure devops pat token}</span> --runasservice
    sudo ./svc.sh install
    sudo ./svc.sh start
else
    ./config.sh --pool <span style="color:red"> {your pool name}</span> --acceptteeeula --agent $HOSTNAME --url <span style="color:red"> {your azure devops project url}</span> --work _work --projectname <span style="color:red"> {'your azure devops project name'}</span> --auth PAT --token <span style="color:red"> {your azure devops pat token}</span>
    ./run.sh
fi

---

this project is part of bottcamp in sela[Sela DevOps Bootcamp Page](https://rhinops.io/bootcamp).


<font color=#728FCE>ci\cd illustration</font>

![This is an image](images/k8s-cicd.png)

## <font color=#728FCE>running the pipeline:</font>

- This pipline uses files to deploy the k8s cluster with kubectl commmands using the .yaml file in the repo
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


##### <font color=#728FCE>deployment of k8s Pipeline:</font>


>for this you will need to create a library in the azure dev ops project and with the vlues a secret inthe cluster will be created as part of the pipeline code.
according to env format

<span style="color:red"></span>

---

### <font color=#728FCE>Demo</font>


![Demo](docs/build-weight-tracker-app-demo.gif)

---

### <font color=#728FCE>expected resultes</font>

<span style="color:red">k8s pipeline.</span>
![expected_results image](images/results.png)



---

### <font color=#728FCE>Links for tips and intructions</font>

... readme not completed




