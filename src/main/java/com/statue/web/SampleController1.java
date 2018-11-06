package com.statue.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController1 {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController1.class);
	
	@RequestMapping("doA")
	public void doA() {
		logger.info("doA called.....................");
	}
	
	@RequestMapping("doB")
	public void doB() {
		logger.info("dob called.....................");
	}
}
