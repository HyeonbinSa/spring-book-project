package com.benworld.service;

import java.util.List;

import com.benworld.domain.BoardVO;
import com.benworld.domain.Criteria;

public interface BoardService {
	public void regist(BoardVO board)throws Exception;
	public BoardVO read(Integer bno)throws Exception;
	public void modify(BoardVO board)throws Exception;
	public void remove(Integer bno)throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;
	public int listcountCriteria(Criteria cri )throws Exception;
}
