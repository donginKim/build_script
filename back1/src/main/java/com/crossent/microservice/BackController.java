package com.crossent.microservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/search")
@RefreshScope
public class BackController {

	private static final Logger logger = LoggerFactory.getLogger(BackController.class);


	@RequestMapping(value="/get", method = RequestMethod.POST)
	public List<Data> search(Map model) {
		System.out.println("request /serarc/get");

		Data data = new Data();
		data.setId("1");
		data.setName("name");

		List<Data> list = new ArrayList<Data>();
		list.add(data);

		return list;
	}

	@RequestMapping(value="/getTwo", method = RequestMethod.POST)
	public List<Data> searchTwo(Map model) {
		System.out.println("request /serarc/getTwo");

		Data data = new Data();
		data.setId("1");
		data.setName("name");

		List<Data> list = new ArrayList<Data>();
		list.add(data);

		data = new Data();
		data.setId("2");
		data.setName("name");

		list.add(data);

		return list;
	}

	@RequestMapping(value="/getThree", method = RequestMethod.POST)
	public List<Data> searchThree(Map model) {
		System.out.println("request /serarc/getThree");

		Data data = new Data();
		data.setId("1");
		data.setName("name");

		List<Data> list = new ArrayList<Data>();
		list.add(data);

		data = new Data();
		data.setId("2");
		data.setName("name");

		list.add(data);

		data = new Data();
		data.setId("3");
		data.setName("name");

		list.add(data);

		return list;
	}


}

