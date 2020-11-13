FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json ./

RUN apk add --no-cache python3 alpine-sdk && \
  npm install --only=dev --ignore-scripts --verbose && \
  npm rebuild --verbose --no-color sharp

EXPOSE 8080

CMD ["npm", "run", "start"]
