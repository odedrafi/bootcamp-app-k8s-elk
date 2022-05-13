FROM node:14-alpine

#create app directory
WORKDIR /home/adminuser/src

#install all dependencies
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 80

CMD [ "npm", "run", "initdb" ]

ENTRYPOINT [ "npm", "run", "dev" ]
