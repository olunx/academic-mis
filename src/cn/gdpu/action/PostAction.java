package cn.gdpu.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.gdpu.service.NoticeService;
import cn.gdpu.service.PostService;
import cn.gdpu.util.Log;
import cn.gdpu.vo.Manager;
import cn.gdpu.vo.Notice;
import cn.gdpu.vo.People;
import cn.gdpu.vo.Post;

public class PostAction extends BaseAction {
	
	private PostService<Post, Integer> postService;
	private NoticeService<Notice, Integer> noticeService;
	private Post post;
	private Post postDto;
	/**
	 * 父级Notice的id
	 */
	private int id;
	/**
	 * post id
	 */
	private int pid;

	
	public void prepare() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		String action=  httpRequest.getServletPath().split("/")[1];
		String[] uri=action.split("\\.");
		if(uri[0].equals("add")){
			Notice notice = noticeService.getEntity(Notice.class, id);
			getRequest().put("notice", notice);
		}
		if(uri[0].equals("modify")){
			Notice notice = noticeService.getEntity(Notice.class, id);
			getRequest().put("notice", notice);
		}
	}
	
	@Override
	public String add() {
		People author = (People) getSession().get("user");
		if(author != null){
			if(id <=0 ) return ERROR;
			Notice notice = noticeService.getEntity(Notice.class, id);
			if(notice == null) return ERROR;
			post = new Post();
			post.setContent(postDto.getContent());
			post.setAuthor(author);
			post.setParent(notice);
			post.setTime(new Date());
			postService.addEntity(post);
			Log.init(getClass()).info(author.getRealName() + " 评论了通知 " + notice.getTitle() + " : " + post);
			return "notice";
		}
		return ERROR;
	}

	@Override
	public String delete() {
		People author = (People) getSession().get("user");
		if(author != null){
			if(pid <=0 || id <= 0) return ERROR;
			post = postService.getEntity(Post.class, pid);
			if(post == null) return ERROR;
			if(author instanceof Manager){
				postService.deleteEntity(Post.class, pid);
				Log.init(getClass()).info(author.getRealName() + "管理员删除此贴 " + post);
				return "notice";
			}
			if(post.getAuthor().getId() == author.getId()){
				postService.deleteEntity(Post.class, pid);
				Log.init(getClass()).info(author.getRealName() + "删除此贴 " + post);
				return "notice";
			}
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
		return super.goAdd();
	}

	@Override
	public String goModify() {
		People author = (People) getSession().get("user");
		if(author != null){
			if(pid <=0) return ERROR;
			post = postService.getEntity(Post.class, pid);
			if(post.getAuthor().getId() == author.getId() || author instanceof Manager){
				return super.goModify();
			}
			else{
				return ERROR;
			}
		}
		return ERROR;
	}

	@Override
	public String list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	public String modify() {
		People author = (People) getSession().get("user");
		if(author != null){
			if(pid <=0 || id <= 0) return ERROR;
			post = postService.getEntity(Post.class, pid);
			if(post == null) return ERROR;
			post.setContent(postDto.getContent());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(author instanceof Manager){
				post.setContent(post.getContent() + "<br/><br/>" + sdf.format(new Date()) + ":此贴由管理员 " + author.getRealName() + "修改");
				Log.init(getClass()).info(author.getRealName() + "管理员修改此贴 " + post);
			}else if(post.getAuthor().getId() == author.getId()){
				post.setContent(post.getContent() + "<br/><br/>" + sdf.format(new Date()) + ": " + author.getRealName() + "修改此贴");
				Log.init(getClass()).info(author.getRealName() + "修改此贴 " + post);
			}else{
				return ERROR;//该用户没有修改贴子权限
			}
			postService.updateEntity(post);
			return "notice";
		}
		return ERROR;
	}

	@Override
	public String view() {
		// TODO Auto-generated method stub
		return super.view();
	}

	
	//getter and setter
	public PostService<Post, Integer> getPostService() {
		return postService;
	}

	public void setPostService(PostService<Post, Integer> postService) {
		this.postService = postService;
	}

	public Post getPost() {
		return post;
	}

	public NoticeService<Notice, Integer> getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(NoticeService<Notice, Integer> noticeService) {
		this.noticeService = noticeService;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getId() {
		return id;
	}

	public Post getPostDto() {
		return postDto;
	}

	public void setPostDto(Post postDto) {
		this.postDto = postDto;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

}
