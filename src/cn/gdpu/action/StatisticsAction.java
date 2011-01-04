package cn.gdpu.action;

import cn.gdpu.service.StudentService;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Student;

public class StatisticsAction extends BaseAction {
	private StudentService<Student, Integer> studentService;
	private PageBean pageBean;
	private int page;

	public String activist(){
		pageBean = studentService.queryForPage("from Student s order by s.credit desc", 20, page);
		if (pageBean.getList().isEmpty())
			pageBean.setList(null);
		return "activist";
	}
	
	//getter and setter

	public StudentService<Student, Integer> getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService<Student, Integer> studentService) {
		this.studentService = studentService;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
