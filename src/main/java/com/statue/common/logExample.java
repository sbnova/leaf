package com.statue.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class logExample {
	private static final Logger LOG = LoggerFactory.getLogger(logExample.class);
	
	@RequestMapping("/log")
	@ResponseBody
	public String logExam() {
		LOG.debug("#ex1 - debug log");
		LOG.info("#ex1 - info log");
		LOG.warn("#ex1 - warn log");
		LOG.error("#ex1 - error log");
		
		return "console And filelog !";
	}
}
