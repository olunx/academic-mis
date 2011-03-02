package cn.gdpu.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import cn.gdpu.service.AdminService;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Manager;


@SuppressWarnings("serial")
public class AdminAction extends BaseAction implements ServletRequestAware{
	
	private AdminService<Admin, Integer> adminService;
	private Admin admin;
	private String username;
	private String password;
	private String repassword;
	private String oldpassword;
	private int id;
	private String name;
	private PageBean pageBean;
	private int page;
	private HttpServletRequest hsrequest;
	
	
	
	
	public String goLogin(){
		return "gologin";
	}
	
	public String login(){
		String kaptchaExpected = (String)hsrequest.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String kaptchaReceived = hsrequest.getParameter("kaptcha");
		if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected)){
			this.addFieldError("kaptcha", "验证码错误");
			if (hasFieldErrors()) {
				return "gologin";
			}
		}
		if(username != null && password != null){
			Admin admin = adminService.getAdminByUsernameAndPassword(username, password);
			if(admin != null){
				getSession().put("user", admin);
				return "indexPage";
			}else{
				return "gologin";
			}
		}else{
			return "gologin";
		}
	}
	public String logout(){
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			getSession().remove("user");
			return "logout";
		}
		return "gologin";
	}

	@Override
	public String add() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			if(username != null && !username.trim().equals("") && password != null && !password.trim().equals("") 
					&& repassword != null && !repassword.trim().equals("") && name != null && !name.trim().equals("")){
				if(adminService.getAdminByUsername(username) == null){
					if(password.trim().equals(repassword.trim())){
						Admin newAdmin = new Admin();
						newAdmin.setUsername(username);
						newAdmin.setPassword(password);
						newAdmin.setRealName(name);
						adminService.addEntity(newAdmin);
						return super.add();
					}
				}
			}
		}
		return super.goAdd();
	}

	@Override
	public String delete() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			adminService.deleteEntity(Admin.class, id);
			return super.delete();
		}
		return "list";
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			this.pageBean = this.adminService.queryForPage(Admin.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
	
			return super.list();
		}
		return ERROR;
	
	}

	@Override
	public String modify() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			if(password != null && !password.trim().equals("") 
					&& repassword != null && !repassword.trim().equals("") && name != null && !name.trim().equals("")){
				if(password.trim().equals(repassword.trim())){
					admin = adminService.getEntity(Admin.class, id);
					admin.setPassword(password);
					admin.setRealName(name);
					adminService.updateEntity(admin);
					return super.modify();
				}
			}
		}
		admin = adminService.getEntity(Admin.class, id);
		return MODIFY_PAGE;
	}

	@Override
	public String view() {
		Admin admin = getSession().get("user") instanceof Admin ? (Admin)getSession().get("user") : null;
		if(admin != null){
			adminService.getEntity(Admin.class, id);
			return super.view();
		}
		return ERROR;
	}
	
	//setter and getter
	
	public AdminService<Admin, Integer> getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService<Admin, Integer> adminService) {
		this.adminService = adminService;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	@Override
	public void setServletRequest(HttpServletRequest hsrequest) {
		this.hsrequest = hsrequest;		
	}

}
