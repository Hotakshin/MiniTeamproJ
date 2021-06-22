package co.mini.soyg.calendar.service;

import java.util.List;

import co.mini.soyg.calendar.vo.CalendarVO;

public interface CalendarService {
	List<CalendarVO> todoSelectList();

	CalendarVO todoSelect(CalendarVO vo);

	int insertTodo(CalendarVO vo);

	int updateTodo(CalendarVO vo);

	int deleteTodo(CalendarVO vo);

}
