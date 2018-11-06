package com.statue.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.statue.domain.ReplyVO;
import com.statue.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyDAOTest {
	private static Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	ReplyDAO dao;
	
	@Test
	public void insertReplyTest() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBno(28);
		reply.setReplyer("user00");
		reply.setReplytext("우히히히히히");
		dao.create(reply);		
	}
	
	@Test
	public void getListTest() throws Exception {
		List<ReplyVO> list = dao.list(24586);
		for(ReplyVO vo : list) {
			logger.info(vo.toString());
		}
	}
	
	@Test
	public void updateReplyTest() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setRno(2);
		reply.setBno(24586);
		reply.setReplyer("user00");
		reply.setReplytext("우헤헤헤헤");
		dao.update(reply);
	}

}
