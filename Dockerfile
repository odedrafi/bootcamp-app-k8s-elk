FROM node:14-alpine

#create app directory
WORKDIR /home/adminuser/myagent/_work/1/s/

#install all dependencies
COPY . .

RUN npm install &&\
    npm init -y &&\
    npm run initdb


# Running the application (Entrypoint?=)
ENTRYPOINT [ "npm", "run", "dev" ]
