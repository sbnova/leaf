package com.statue.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component //기타 bean
@Aspect		//AOP bean:AOP 어노테이션
public class LoggerAspect {
	protected Logger log = LoggerFactory.getLogger(LoggerAspect.class);
	static String name="";
	static String type="";
	
	@Around("execution(* com.statue..*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable{
		
		//핵심업무실행전
		Object result = null;
				type=joinPoint.getSignature().getDeclaringTypeName();
			//핵심업무 실행
			long start = System.currentTimeMillis();
			result = joinPoint.proceed();
			long end = System.currentTimeMillis();
			//핵심업무 실행후
			System.out.println("수행시간: "+(end - start));
			//핵심업무 로그보기
			log.info("실행AOP");
			return result;
	}
}
