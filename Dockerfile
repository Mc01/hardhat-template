FROM node:16-alpine

# install unix deps
RUN apk add --no-cache git

# create app dir
WORKDIR /app

# install deps
COPY package.json package.json
RUN yarn install

# copy project files
COPY ./ ./
