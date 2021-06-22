package co.mini.soyg.studyclass.vo;

import java.util.Date;

public class StudyClassVO {

	private int class_code;
	private String loc_code;
	private String class_name;
	private Date start_date;
	private String class_image;
	private String class_info;
	private String class_active;
	private String class_startchk;
	private int class_personnel;
	private String field_code;
	private String weekdays_chk;
	private String class_time;
	private String captain;
	private String city;
	private String userId;

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getClass_code() {
		return class_code;
	}

	public void setClass_code(int class_code) {
		this.class_code = class_code;
	}

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public String getClass_image() {
		return class_image;
	}

	public void setClass_image(String class_image) {
		this.class_image = class_image;
	}

	public String getClass_info() {
		return class_info;
	}

	public void setClass_info(String class_info) {
		this.class_info = class_info;
	}

	public String getClass_active() {
		return class_active;
	}

	public void setClass_active(String class_active) {
		this.class_active = class_active;
	}

	public String getClass_startchk() {
		return class_startchk;
	}

	public void setClass_startchk(String class_startchk) {
		this.class_startchk = class_startchk;
	}

	public int getClass_personnel() {
		return class_personnel;
	}

	public void setClass_personnel(int class_personnel) {
		this.class_personnel = class_personnel;
	}

	public String getField_code() {
		return field_code;
	}

	public void setField_code(String field_code) {
		this.field_code = field_code;
	}

	public String getWeekdays_chk() {
		return weekdays_chk;
	}

	public void setWeekdays_chk(String weekdays_chk) {
		this.weekdays_chk = weekdays_chk;
	}

	public String getClass_time() {
		return class_time;
	}

	public void setClass_time(String class_time) {
		this.class_time = class_time;
	}

	public String getCaptain() {
		return captain;
	}

	public void setCaptain(String captain) {
		this.captain = captain;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
