# base image
FROM node:12.2.0-alpine

# set working directory
WORKDIR /app
# Install app dependencies

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install

# Bundle app source
COPY . /sa-api/
RUN npm run prepublish

# start app
CMD ["npm", "run", "serve"]

