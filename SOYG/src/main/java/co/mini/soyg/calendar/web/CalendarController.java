package co.mini.soyg.calendar.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.mini.soyg.calendar.service.CalendarService;

@Controller
public class CalendarController {
	@Autowired
	private CalendarService dao;
	
	@RequestMapping("/calendar.do")
	public String calendar(Model model) {
		
		model.addAttribute("list", dao.todoSelectList());
		
		return "calendar/calendarList";
	}
}
