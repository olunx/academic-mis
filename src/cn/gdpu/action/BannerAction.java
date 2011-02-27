package cn.gdpu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import cn.gdpu.service.BannerService;
import cn.gdpu.util.Log;
import cn.gdpu.util.PageBean;
import cn.gdpu.vo.Banner;
import cn.gdpu.vo.Image;
import cn.gdpu.vo.Manager;

public class BannerAction extends BaseAction {
	private BannerService<Banner, Integer> bannerService;
	private Banner banner;
	private Banner banDto;
	private PageBean pageBean;
	private Image image;
	private int page;
	private int id;
	private String result;

	@Override
	public String add() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(image == null) return ERROR;
			List<Banner> banners = bannerService.getEntity(Banner.class, "from Banner b where b.selected != 0");
			for (Banner ban : banners) {
				ban.setSelected(0);
				bannerService.updateEntity(ban);
			}
			banner = new Banner();
			banner.setName(banDto.getName());
			banner.setIntro(banDto.getIntro());
			System.out.println("Dtoselected = " + banDto.getSelected());
			banner.setSelected(banDto.getSelected());
			System.out.println("selected = " + banner.getSelected());
			banner.setImage(image);
			bannerService.addEntity(banner);
			Log.init(getClass()).info(manager.getRealName() + " 添加了新横幅主题 " + banner.getName());
			return super.add();
		}
		return ERROR;
	}

	public String select(){
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			banner = bannerService.getEntity(Banner.class, id);
			if(banner == null) return ERROR;
			List<Banner> banners = bannerService.getEntity(Banner.class, "from Banner b where b.selected != 0");
			for (Banner ban : banners) {
				ban.setSelected(0);
				bannerService.updateEntity(ban);
			}
			banner.setSelected(1);
			bannerService.updateEntity(banner);
			Log.init(getClass()).info(manager.getRealName() + " 修改了当前横幅主题 " + banner.getName());
			return "list";
		}
		return ERROR;
	}
	
	public String unselect(){
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			banner = bannerService.getEntity(Banner.class, id);
			if(banner == null || banner.getSelected() != 1) return ERROR;
			banner.setSelected(0);
			bannerService.updateEntity(banner);
			Log.init(getClass()).info(manager.getRealName() + " 修改了当前横幅主题 " + banner.getName());
			return "list";
		}
		return ERROR;
	}
	
	@Override
	public String delete() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			if(id <= 0) return ERROR;
			banner = bannerService.getEntity(Banner.class, id);
			if(banner == null) return ERROR;
			bannerService.deleteEntity(Banner.class, banner.getId());
			Log.init(getClass()).info(manager.getRealName() + " 删除了横幅主题 " + banner.getName());
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
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			return super.goAdd();
		}
		return ERROR;
	}

	@Override
	public String goModify() {
		// TODO Auto-generated method stub
		return super.goModify();
	}

	@Override
	public String list() {
		Manager manager = getSession().get("user") instanceof Manager ? (Manager) getSession().get("user") : null;
		if(manager != null){
			this.pageBean = bannerService.queryForPage(Banner.class, 10, page);
			if (pageBean.getList().isEmpty())
				pageBean.setList(null);
			return super.list();
		}
		return ERROR;
	}
	
	
	public String getAjax(){
		banner = this.bannerService.getEntity(Banner.class, "from Banner b where b.selected != 0").get(0);
		if(banner == null){
			result = null;
		}
		else{
			Map<String, String> map = new HashMap<String, String>();  
	        map.put("name", banner.getName());  
	        map.put("intro",banner.getIntro());  
	        map.put("background", banner.getImage().getBigFileUrl());
	        JSONObject obj = JSONObject.fromObject(map);  
	        result = obj.toString();
		}
		return "ajax";
	}

	@Override
	public String modify() {
		// TODO Auto-generated method stub
		return super.modify();
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}

	//getter and setter
	public BannerService<Banner, Integer> getBannerService() {
		return bannerService;
	}

	public void setBannerService(BannerService<Banner, Integer> bannerService) {
		this.bannerService = bannerService;
	}

	public Banner getBanner() {
		return banner;
	}

	public void setBanner(Banner banner) {
		this.banner = banner;
	}

	public Banner getBanDto() {
		return banDto;
	}

	public void setBanDto(Banner banDto) {
		this.banDto = banDto;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
