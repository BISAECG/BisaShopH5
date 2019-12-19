package com.bisa.health.shop.mqtt;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.ChannelAwareMessageListener;

import com.rabbitmq.client.Channel;

public class DeathReceiverService implements ChannelAwareMessageListener{
	
	private static Logger logger = LogManager.getFormatterLogger(DeathReceiverService.class);

	@Override
	public void onMessage(Message message, Channel channel) throws Exception {
		
		MessageProperties  m=message.getMessageProperties();
		logger.error("死信"+new String(message.getBody()));
	}

}
