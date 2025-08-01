#############################################################################################
### RAPIDOC-OGMIOS ###

FROM node:20 AS rapidoc-ogmios

WORKDIR /usr/src/app

COPY rapidoc-ogmios .
RUN yarn install

EXPOSE 2500/tcp
CMD [ "node", "index.js" ]
