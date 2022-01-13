package mul.camp.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.a.dao.boardDao;
import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;

@Service
public class boardServiceImple implements boardService {

	@Autowired
	boardDao dao;
	
	@Override
	public int boardInsert(boardDto dto) {
		int cnt = dao.boardInsert(dto);
		return cnt;
	}

	@Override
	public boardDto detail(int idx) {
		boardDto dto = dao.detail(idx);
		return dto;
	}

	@Override
	public int del(int idx) {
		int cnt = dao.del(idx);
		return cnt;
	}

	@Override
	public int update(boardDto dto) {
		int cnt = dao.update(dto);
		return cnt;
	}

	@Override
	public List<boardDto> bbslist(BbsParam param) {
		return dao.bbslist(param);
	}

	@Override
	public int commentWrite(commentDto dto) {
		return dao.commentWrite(dto);
	}

	@Override
	public List<commentDto> commentlist(int idx) {
		return dao.commentlist(idx);
	}

	@Override
	public int commentDel(commentDto dto) {
		return dao.commentDel(dto);
	}

}
