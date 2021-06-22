package co.mini.soyg.study.vo;

import java.util.Date;

public class StudyVO {
	private int class_Code;
	private String loc_Code;
	private String class_Name;
	private Date start_Date; // to_char해서 가져올것
	private String class_Image;
	private String class_Info;
	private char class_Active;
	private char class_StartChk;
	private int class_Personnel;
	private String field_Code;
	private String field_Name;
	private char weekdays_Chk;
	private String class_Time;
	private String city;
	private String captain;
	private String cDate;

	public int getClass_Code() {
		return class_Code;
	}

	public void setClass_Code(int class_Code) {
		this.class_Code = class_Code;
	}

	public String getLoc_Code() {
		return loc_Code;
	}

	public void setLoc_Code(String loc_Code) {
		this.loc_Code = loc_Code;
	}

	public String getClass_Name() {
		return class_Name;
	}

	public void setClass_Name(String class_Name) {
		this.class_Name = class_Name;
	}

	public Date getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}

	public String getClass_Image() {
		return class_Image;
	}

	public void setClass_Image(String class_Image) {
		this.class_Image = class_Image;
	}

	public String getClass_Info() {
		return class_Info;
	}

	public void setClass_Info(String class_Info) {
		this.class_Info = class_Info;
	}

	public char getClass_Active() {
		return class_Active;
	}

	public void setClass_Active(char class_Active) {
		this.class_Active = class_Active;
	}

	public char getClass_StartChk() {
		return class_StartChk;
	}

	public void setClass_StartChk(char class_StartChk) {
		this.class_StartChk = class_StartChk;
	}

	public int getClass_Personnel() {
		return class_Personnel;
	}

	public void setClass_Personnel(int class_Personnel) {
		this.class_Personnel = class_Personnel;
	}

	public String getField_Code() {
		return field_Code;
	}

	public void setField_Code(String field_Code) {
		this.field_Code = field_Code;
	}

	public String getField_Name() {
		return field_Name;
	}

	public void setField_Name(String field_Name) {
		this.field_Name = field_Name;
	}

	public char getWeekdays_Chk() {
		return weekdays_Chk;
	}

	public void setWeekdays_Chk(char weekdays_Chk) {
		this.weekdays_Chk = weekdays_Chk;
	}

	public String getClass_Time() {
		return class_Time;
	}

	public void setClass_Time(String class_Time) {
		this.class_Time = class_Time;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCaptain() {
		return captain;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public void setCaptain(String captain) {
		this.captain = captain;
	}

}
