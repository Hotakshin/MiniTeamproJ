package co.mini.soyg.study.vo;

public class StudyInsertVO {
	private int class_code;
	private String loc_code;
	private String class_name;
	private String start_date;
	private String class_image;
	private String class_info;
	private char class_active;
	private char class_startchk;
	private String class_personnel;
	private String field_code;
	private char weekdays_chk;
	private String class_time;
	private String captain;
	private String city;
	private String main_image2;
	private String main_image3;
	private String main_image4;
	private String main_image5;

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

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
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

	public char getClass_active() {
		return class_active;
	}

	public void setClass_active(char class_active) {
		this.class_active = class_active;
	}

	public char getClass_startchk() {
		return class_startchk;
	}

	public void setClass_startchk(char class_startchk) {
		this.class_startchk = class_startchk;
	}

	public String getClass_personnel() {
		return class_personnel;
	}

	public void setClass_personnel(String class_personnel) {
		this.class_personnel = class_personnel;
	}

	public String getField_code() {
		return field_code;
	}

	public void setField_code(String field_code) {
		this.field_code = field_code;
	}

	public char getWeekdays_chk() {
		return weekdays_chk;
	}

	public void setWeekdays_chk(char weekdays_chk) {
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

	public String getMain_image2() {
		return main_image2;
	}

	public void setMain_image2(String main_image2) {
		this.main_image2 = main_image2;
	}

	public String getMain_image3() {
		return main_image3;
	}

	public void setMain_image3(String main_image3) {
		this.main_image3 = main_image3;
	}

	public String getMain_image4() {
		return main_image4;
	}

	public void setMain_image4(String main_image4) {
		this.main_image4 = main_image4;
	}

	public String getMain_image5() {
		return main_image5;
	}

	public void setMain_image5(String main_image5) {
		this.main_image5 = main_image5;
	}

	@Override
	public String toString() {
		return "StudyInsertVO [loc_code=" + loc_code + ", class_name=" + class_name + ", start_date=" + start_date
				+ ", class_image=" + class_image + ", class_info=" + class_info + ", class_active=" + class_active
				+ ", class_startchk=" + class_startchk + ", class_personnel=" + class_personnel + ", field_code="
				+ field_code + ", weekdays_chk=" + weekdays_chk + ", class_time=" + class_time + ", captain=" + captain
				+ ", city=" + city + ", main_image2=" + main_image2 + ", main_image3=" + main_image3 + ", main_image4="
				+ main_image4 + ", main_image5=" + main_image5 + "]";
	}

}
