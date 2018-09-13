package com.crossent.microservice;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.util.Base64Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.annotation.PostConstruct;
import java.net.URI;

@Controller
@RefreshScope
public class FrontController {

	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);

	@Autowired
	private RestTemplate searchClient;

	@Value("${gateway.basic.user:}")
	String user;

	@Value("${gateway.basic.password:}")
	String password;

	private HttpHeaders getHeaders(){
		String basicAuth = String.format("%s:%s", user, password);
		String base64Auth = Base64Utils.encodeToString(basicAuth.getBytes());

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", String.format("Basic %s", base64Auth));
//		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return headers;
	}

	@HystrixCommand
	@RequestMapping("/api/search")
	@ResponseBody
	public Data[] search(Model model) {
		System.out.println("request /api/search");

		HttpEntity<String> request = new HttpEntity<String>(getHeaders());
		URI uri = URI.create("http://apigateway/back/search/get");
		Data[] obj = searchClient.postForObject(uri, request, Data[].class);

		model.addAttribute("datas", obj);

		return obj;
	}

	@HystrixCommand(fallbackMethod = "getDefaultSearch")
	@RequestMapping("/api/searchTwo")
	@ResponseBody
	public Data[] searchTwo(Model model) {
		System.out.println("request /api/searchTwo");

		HttpEntity<String> request = new HttpEntity<String>(getHeaders());
		URI uri = URI.create("http://apigateway/back/search/getTwo");
		Data[] obj = searchClient.postForObject(uri, request, Data[].class);

		model.addAttribute("datas", obj);

		return obj;
	}

	@HystrixCommand(fallbackMethod = "getDefaultSearch")
	@RequestMapping("/api/searchThree")
	@ResponseBody
	public Data[] searchThree(Model model) {
		System.out.println("request /api/searchThree");

		HttpEntity<String> request = new HttpEntity<String>(getHeaders());
		URI uri = URI.create("http://apigateway/back/search/getThree");
		Data[] obj = searchClient.postForObject(uri, request, Data[].class);

		model.addAttribute("datas", obj);

		return obj;
	}

	public Data[] getDefaultSearch(Model model) {
		return new Data[]{};
	}

	@PostConstruct
	private void postConstruct() {
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> user/password: " + name + "/" + password);
	}

}

