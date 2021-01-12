package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		List<BoardVO> list = mapper.getList();
		
//		assertEquals(list.size(), 5);
		assertNotEquals(list.size(), 0);
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 제목");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		int before = mapper.getList().size();
		
		mapper.insert(board);
		
		int after = mapper.getList().size();
		
		assertEquals(before + 1, after);
		
	}
	
	@Test
	public void testInsertSeletKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 제목");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		int before = mapper.getList().size();
		
		mapper.insertSelectKey(board);
		
		int after = mapper.getList().size();
		
		assertEquals(before + 1, after);
		
		assertNotEquals(board.getBno(),new Long(0L));
		
	}
	
	
}






