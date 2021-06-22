package co.mini.soyg.study.vo;

public class CourseVO {
	private int class_code;
	private String big_course;
	private String mid_course;
	private String small_course;

	public int getClass_code() {
		return class_code;
	}

	public void setClass_code(int class_code) {
		this.class_code = class_code;
	}

	public String getBig_course() {
		return big_course;
	}

	public void setBig_course(String big_course) {
		this.big_course = big_course;
	}

	public String getMid_course() {
		return mid_course;
	}

	public void setMid_course(String mid_course) {
		this.mid_course = mid_course;
	}

	public String getSmall_course() {
		return small_course;
	}

	public void setSmall_course(String small_course1) {
		this.small_course = small_course1;
	}

	@Override
	public String toString() {
		return "CourseVO [class_code=" + class_code + ", big_course=" + big_course + ", mid_course=" + mid_course
				+ ", small_course=" + small_course + "]";
	}

}
