package com.perfume.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.Paging;

public interface QService {

	public int insertContent(BoardDTO dto);
	
	public List<BoardDTO> getAllList(Paging pa, BoardDTO dto);
	
	public int getAllCount(BoardDTO dto);
	
	public int readCountUp(int b_number);
	
	public BoardDTO getContent(int b_number);
	
	public int updateContent(BoardDTO dto);
	
	public int deleteContent(int b_number);
	
	public List<BoardDTO> getSearchList(Paging pa, String category, String input);
	
	public int getSearchCount(String category, String input);
	
	public int insertAn(BoardDTO dto);
}
