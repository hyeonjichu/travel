package mul.camp.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.boardDto;

@Repository
public class boardDaoImpl implements boardDao {

	@Autowired
	SqlSession session;
	
	String ns = "Board.";

	@Override
	public int boardInsert(boardDto dto) {
		
		return session.insert(ns+"write", dto);
	}

	@Override
	public boardDto detail(int idx) {
		return session.selectOne(ns+"detail", idx);
	}

	@Override
	public int del(int idx) {
		return session.update(ns+"del", idx);
	}

	@Override
	public int update(boardDto dto) {
		return session.update(ns+"update", dto);
	}

	@Override
	public List<boardDto> bbslist(BbsParam param) {
		return session.selectList(ns + "bbslist", param);
	}
}
