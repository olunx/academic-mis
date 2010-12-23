package cn.gdpu.action;

import cn.gdpu.service.PostService;
import cn.gdpu.vo.Post;

public class PostAction extends BaseAction {
	
	private PostService<Post, Integer> postService;
	private Post post;
	private int id;
	private int pid;

	@Override
	public String add() {
		// TODO Auto-generated method stub
		return super.add();
	}

	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return super.delete();
	}

	@Override
	public String deleteMany() {
		// TODO Auto-generated method stub
		return super.deleteMany();
	}

	@Override
	public String goAdd() {
		// TODO Auto-generated method stub
		return super.goAdd();
	}

	@Override
	public String goModify() {
		// TODO Auto-generated method stub
		return super.goModify();
	}

	@Override
	public String list() {
		// TODO Auto-generated method stub
		return super.list();
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
	public PostService<Post, Integer> getPostService() {
		return postService;
	}

	public void setPostService(PostService<Post, Integer> postService) {
		this.postService = postService;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getId() {
		return id;
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
