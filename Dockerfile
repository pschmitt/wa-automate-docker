FROM node:current-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Uncomment the next line to use this Dockerfile on your own app
# RUN npm install
RUN apk add --no-cache python3 alpine-sdk && \
  npm install --only=dev --ignore-scripts --no-color && \
  npm rebuild --verbose sharp --no-color

# Copy the session data over to the container
# Bundle app source
COPY . .

EXPOSE 8080

CMD ["npm", "run", "start"]
