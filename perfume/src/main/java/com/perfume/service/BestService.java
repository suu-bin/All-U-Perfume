package com.perfume.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.CommentDTO;
import com.perfume.beans.Paging;

public interface BestService {

	public int insertContent(BoardDTO dto);
	
	public List<BoardDTO> getAllList(Paging pa);
	
	public int getAllCount();
	
	public int readCountUp(int b_number);
	
	public BoardDTO getContent(int b_number);
	
	public int updateContent(BoardDTO dto);
	
	public int deleteContent(int b_number);
	
	public List<BoardDTO> getSearchList(Paging pa, String category, String input);
	
	public int getSearchCount(String category, String input);
	
	public int maxNumber();
	
	public int maxReNumber(int ref);
	
	public int insertComment(CommentDTO dto);
	
	public List<CommentDTO> getComment(CommentDTO dto);
	
	public int getCommentCount(CommentDTO dto);
	
	public int updateComment(CommentDTO dto);
	
	public int deleteComment(int cno);
}
