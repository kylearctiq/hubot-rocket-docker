FROM google/nodejs

RUN mkdir /opt/hubot
WORKDIR /opt/hubot

RUN npm install -g npm
RUN npm install -g hubot coffee-script yo generator-hubot

RUN useradd -ms /bin/bash node
RUN chown -R node /opt/hubot
USER node

RUN yo hubot --owner="Kyle Bassett" --name="PolarBot" --description="I Help Arctiq" --adapter=slack --defaults --allow-root
# RUN yo hubot --owner="Kyle Bassett" --name="PolarBot" --description="I Help Arctiq" --adapter="rocketchat@0.1" --allow-root

RUN npm install hubot-slack
RUN npm install hubot-urban
RUN npm install hubot-youtube
RUN npm install hubot-ttc-alerts
RUN npm install hubot-devops-reactions
RUN npm install hubot-victory
RUN npm install hubot-jenkins
RUN npm install hubot-rocketchat@1
Run npm install hubot-baronbogo

#ADD external-scripts.json /opt/hubot/external-scripts.json

# override to set proper hubot slack integration token (see slack integrations)
ENV HUBOT_SLACK_TOKEN=xxxxxxxxxxxxxxxxxxxx

CMD ["./bin/hubot", "--adapter", "slack"]
#CMD ["./bin/hubot", "--adapter", "rocketchat"]


#ROCKET CHAT OPTIONS
#https://www.npmjs.com/package/hubot-rocketchat
