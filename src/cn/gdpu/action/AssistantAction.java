package cn.gdpu.action;



import cn.gdpu.dto.AssistantDto;
import cn.gdpu.service.AssistantService;
import cn.gdpu.util.Md5;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Admin;
import cn.gdpu.vo.Assistant;
import cn.gdpu.vo.Manager;


@SuppressWarnings("serial")
public class AssistantAction extends BaseAction{
	
	private AssistantService<Assistant, Integer> assistantService;
	private Assistant assistant;
	private AssistantDto asDto;
	private int id;
	private PageBean pageBean;
	private int page;
	
	
	
	
	public String goLogin(){
		return "gologin";
	}
	
	@Override
	public String add() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			if(asDto.getUsername() != null && !asDto.getUsername().trim().equals("") && asDto.getPassword() != null && !asDto.getPassword().trim().equals("") 
					&& asDto.getRpassword() != null && !asDto.getRpassword().trim().equals("") && asDto.getRealName() != null && !asDto.getRealName().trim().equals("")){
				if(assistantService.getAssistantByUsername(asDto.getUsername()) == null){
					if(asDto.getPassword().trim().equals(asDto.getRpassword().trim())){
						Assistant ass = new Assistant();
						ass.setUsername(asDto.getUsername());
						ass.setPassword(Md5.getMD5(asDto.getPassword().getBytes()));
						ass.setRealName(asDto.getRealName());
						ass.setRemark("管理员助理");
						assistantService.addEntity(ass);
						return super.add();
					}
				}
			}
		}
		return ERROR;
	}

	@Override
	public String delete() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			assistantService.deleteEntity(Assistant.class, id);
			return super.delete();
		}
		return ERROR;
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			assistant = assistantService.getEntity(Assistant.class, id);
			return super.goModify();
		}
		return ERROR;
	}

	@Override
	public String list() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			this.pageBean = this.assistantService.queryForPage(Assistant.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return super.list();
		}
		return ERROR;
	
	}

	@Override
	public String modify() {
		Manager manager = (Manager) getSession().get("manager");
		Admin admin = manager instanceof Admin ? (Admin)manager : null;
		if(admin != null){
			if(asDto.getPassword() != null && !asDto.getPassword().trim().equals("") 
					&& asDto.getRpassword() != null && !asDto.getRpassword().trim().equals("") && asDto.getRealName() != null && !asDto.getRealName().trim().equals("")){
				if(asDto.getPassword().trim().equals(asDto.getRpassword().trim())){
					assistant = assistantService.getEntity(Assistant.class, id);
					assistant.setPassword(Md5.getMD5(asDto.getPassword().getBytes()));
					assistant.setRealName(asDto.getRealName());
					assistantService.updateEntity(assistant);
					return super.modify();
				}
			}
		}
		return MODIFY_PAGE;
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}
	
	//setter and getter
	
	public AssistantService<Assistant, Integer> getAssistantService() {
		return assistantService;
	}

	public void setAssistantService(
			AssistantService<Assistant, Integer> assistantService) {
		this.assistantService = assistantService;
	}


	public Assistant getAssistant() {
		return assistant;
	}

	public void setAssistant(Assistant assistant) {
		this.assistant = assistant;
	}

	public AssistantDto getAsDto() {
		return asDto;
	}

	public void setAsDto(AssistantDto asDto) {
		this.asDto = asDto;
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

}
