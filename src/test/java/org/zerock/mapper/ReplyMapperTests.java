package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = {229L, 230L, 231L, 232L, 234L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testDelete() {
		Long rno = 25L;
		mapper.delete(rno);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(37L);
		vo.setReply("수정되었당!~!");
		mapper.update(vo);
		
		vo = mapper.read(37L);
		
		assertEquals("수정되었당!~!", vo.getReply());
	}
	
	@Test
	public void testRead() {
		Long rno = 37L;
		
		ReplyVO vo = mapper.read(rno);
		
		assertEquals("댓글 테스트", vo.getReply());
	}
	
	@Test // 책 383쪽
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			log.info(i + ", " + (i % 5));
			
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
			
	}
	
	@Test
	public void testCreate2() {
		ReplyVO vo = new ReplyVO();
		// vo.setRno(rno);
		vo.setBno(234L); // tbl_board 테이블에 있는 값으로 넣으세요.
		vo.setReply("댓글 테스트");
		vo.setReplyer("user00");
		
		mapper.insert(vo);
		
		try {
			vo.setBno(210L); // tbl_board 테이블에 없는 값
			mapper.insert(vo);
			fail();
		} catch (Exception e) {

		}
	}
}






