FROM node:8

RUN mkdir -p /srv
	
COPY package*.json /srv/

WORKDIR /srv

RUN npm install

COPY . /srv/

EXPOSE 4200
CMD ["npm", "start", "--", "--host", "0.0.0.0", "--poll"]