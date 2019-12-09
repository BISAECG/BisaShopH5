package com.bisa.health.shop.component;

import javax.xml.ws.WebServiceException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessagePostProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value="mqttKit")
public class MqttComponent {

	private final static Logger log = LogManager.getLogger(MqttComponent.class);
	@Autowired
	private AmqpTemplate delayMsgTemplate;
	
	public static String push_key="order_queue_key";
	
	public void delayMsg(String key, Object msg, int delay) {
		try {
			final int xdelay = delay * 1000;
			
			
			delayMsgTemplate.convertAndSend(key, msg, new MessagePostProcessor() {

				@Override
				public Message postProcessMessage(Message message) throws AmqpException {
					message.getMessageProperties().setDelay(xdelay);
					return message;
				}
			});
		} catch (Exception e) {
			log.error(e.getMessage());
		}

	}

	public void pushMsg(String key, Object msg) {
		try {
			delayMsgTemplate.convertAndSend(key, msg);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

	}

}
