package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.CommentVO;

public interface CommentService {
	public List<CommentVO> getList();
	
	 public CommentVO get(Long cno);
}
