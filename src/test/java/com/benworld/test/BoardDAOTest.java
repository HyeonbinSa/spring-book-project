package com.benworld.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.benworld.domain.BoardVO;
import com.benworld.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("Title1");
		board.setContent("Content1");
		board.setWriter("Writer1");
		dao.create(board);
		
	}

	@Test
	public void testRead() throws Exception {
		logger.info("read TEST Start -------------------------");
		logger.info(dao.read(10).toString());
		logger.info("read TEST End -------------------------");
	}
	@Test
	public void testUpdate()throws Exception{
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setTitle("새로운타이틀");
		vo.setContent("새로운 내용");
		dao.update(vo);
		
		
	}
	@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
	@Test
	public void testListPage()throws Exception{
		int page = 3;
		List<BoardVO>  list = dao.listPage(page);
		
		for(BoardVO vo : list) {
			logger.info(vo.getBno() + ":" + vo.getTitle());
		}
	}
}
