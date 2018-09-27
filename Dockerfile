FROM node:8.9.4

RUN mkdir /usr/app
WORKDIR /usr/app

# set environment variables
ENV NODE_ENV=development

COPY package.json package.json
COPY yarn.lock yarn.lock

# run some terminal command
RUN yarn install

# copy contents
COPY tsconfig.json tsconfig.json
COPY tslint.json tslint.json
COPY .angular-cli.json .angular-cli.json
COPY src src

# expose this port to container (access container)
EXPOSE 4200

# purpose of the image
# In this case: making server ready
ENTRYPOINT [ "yarn", "serve" ]

