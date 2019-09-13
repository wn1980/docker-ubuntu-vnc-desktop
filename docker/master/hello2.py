#!/usr/bin/env python3

import time

import roslibpy

client = roslibpy.Ros(host='localhost', port=9090)
client.run()

talker = roslibpy.Topic(client, '/DialogflowResult', 'dialogflow_ros/DialogflowResult')

while client.is_connected:
    msg = roslibpy.Message({'query_text': 'Hello World, Dialogflow!'})
    talker.publish(msg)
    print('Sending message...')
    time.sleep(1)

talker.unadvertise()

client.terminate()
