package co.mini.soyg.calendar.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.mini.soyg.calendar.service.CalendarService;
import co.mini.soyg.calendar.vo.CalendarVO;

@Repository
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CalendarVO> todoSelectList() {
		
		return sqlSession.selectList("todoList");
	}

	@Override
	public CalendarVO todoSelect(CalendarVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTodo(CalendarVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTodo(CalendarVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTodo(CalendarVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
