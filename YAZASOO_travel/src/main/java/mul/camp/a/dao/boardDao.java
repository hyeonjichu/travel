package mul.camp.a.dao;

import java.util.List;

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;

public interface boardDao {
	int boardInsert(boardDto dto);

	boardDto detail(int idx);
	
	int del(int idx);
	
	int update(boardDto dto);
	
	List<boardDto> bbslist(BbsParam param);
	
	int commentWrite(commentDto dto);
	
	List<commentDto> commentlist(int idx);
	
	int commentDel(commentDto dto);
}
