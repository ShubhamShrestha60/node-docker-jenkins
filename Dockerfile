#Base image
FROM node:18-alpine

#Creating the directory
WORKDIR /node-app


#Copying the dependencies: reason explained in assignment doc
COPY package*.json ./

#Dependencies install
RUN npm install

#Copying the server.js and other files
COPY . .

#Exposing the app to port 300
EXPOSE 3000

#Command to run the app
CMD ["npm" , "start"]
