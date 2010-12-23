package cn.gdpu.action;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class EditorUploadAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private static Long maxSize = 0l;
	private File filedata;
	private String fileName;
	private String savePath;
	private String imgUrl;
    private static String fileExt = "jpg,jpeg,bmp,gif,png";
	

	public String execute() throws Exception {
		HttpServletRequest httpRequest = (HttpServletRequest) ServletActionContext.getRequest();
		ServletContext context = ServletActionContext.getServletContext();
		
		if ("application/octet-stream".equals(httpRequest.getContentType())) { //HTML 5 上传
            try {
                String dispoString = httpRequest.getHeader("Content-Disposition");
                int iFindStart = dispoString.indexOf("name=\"")+6;
                int iFindEnd = dispoString.indexOf("\"", iFindStart);
 
                iFindStart = dispoString.indexOf("filename=\"")+10;
                iFindEnd = dispoString.indexOf("\"", iFindStart);
                String sFileName = dispoString.substring(iFindStart, iFindEnd);
 
                int i = httpRequest.getContentLength();
                byte buffer[] = new byte[i];
                int j = 0;
                while(j < i) { //获取表单的上传文件
                    int k = httpRequest.getInputStream().read(buffer, j, i-j);
                    j += k;
                }
 
                if (buffer.length == 0) { //文件是否为空
                    getRequest().put("err", "上传文件不能为空");
                    return ERROR;
                }
                if (maxSize > 0 && buffer.length > maxSize) { //检查文件大小
                	getRequest().put("err", "上传文件的大小超出限制");
                    return ERROR;
                }
                System.out.println("sFileName : " + sFileName);
                if (checkFileType(sFileName)){ 
                	getRequest().put("err", "不允许上传此类型的文件");
                	return ERROR; //检查文件类型
                }
                
                String filepathString = generateFileName(sFileName);
                System.out.println("output : " + context.getRealPath("") +  savePath + "/" + filepathString);
                OutputStream out=new BufferedOutputStream(new FileOutputStream(context.getRealPath("") +  savePath + "/" + filepathString,true));
                out.write(buffer);
                out.close();
                
                imgUrl = context.getContextPath() + savePath + "/" + filepathString;
            } catch (Exception ex) {
                System.out.println("ex : " + ex.getMessage());
                getRequest().put("err", ex.getMessage());
                return ERROR;
            }
            System.out.println("imgUrl : " + imgUrl);
            getRequest().put("imgUrl", imgUrl);
            return SUCCESS;
		}else{
			if(filedata == null){
				getRequest().put("err", "filedata == null");
				return ERROR;
			}
			
			// 获取在服务器中的目录
			String targetDirectory = context.getRealPath(savePath);
			
			File target = null;
			String targetFileName = null;
			targetFileName = generateFileName(fileName);
			target = new File(targetDirectory, targetFileName);
			
			try {
				FileUtils.copyFile(filedata, target);
			} catch (IOException e) {
				e.printStackTrace();
			}
			imgUrl = context.getContextPath() + savePath + "/" + targetFileName;
			 System.out.println("imgUrl : " + imgUrl);
			getRequest().put("imgUrl", imgUrl);
			return SUCCESS;
		}
	}

	//产生唯一的文件名  
    private synchronized String generateFileName(String filename)  
    {  
        int position=filename.lastIndexOf(".");  
        String ext=filename.substring(position);  
          
        return System.nanoTime()+ext;  
    }
    
    public boolean checkFileType(String sFileName) {
        String extensionName = sFileName.substring(sFileName.lastIndexOf(".") + 1); //获取文件扩展名
 
        if (("," + fileExt.toLowerCase() + ",").indexOf("," + extensionName.toLowerCase() + ",") < 0) { //检查文件类型
        	return true;
        }else return false;
    }
    
	//Getter and Setter
    public File getFiledata() {
		return filedata;
	}

	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}
	
	public void setFiledataFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
