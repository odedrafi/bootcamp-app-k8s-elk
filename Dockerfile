FROM node:14-alpine

#create app directory
WORKDIR /bootcamp-app

#install all dependencies
COPY package*.json ./
RUN npm install

# adding source code into the image
COPY . .
ENV PORT=8080
EXPOSE 8080

RUN  npm run initdb

# Running the application (Entrypoint?=)
ENTRYPOINT [ "npm", "run", "dev" ]
