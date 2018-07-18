package com.recommendfood.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.recommendfood.util.FileUtil;
import com.recommendfood.util.FormatUtil;

//多文件上传
public class UploadAction extends CommonAction{
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;
	private String downloadContentType;
	private String downloadFileName;
	
//	public File getFile() {
//		return file;
//	}
//	public void setFile(File file) {
//		this.file = file;
//	}
//	public String getFileFileName() {
//		return fileFileName;
//	}
//	public void setFileFileName(String fileFileName) {
//		this.fileFileName = fileFileName;
//	}
//	public String getFileContentType() {
//		return fileContentType;
//	}
//	public void setFileContentType(String fileContentType) {
//		this.fileContentType = fileContentType;
//	}
	
	public List<File> getFile() {
		return file;
	}
	public String getDownloadContentType() {
		return downloadContentType;
	}
	public void setDownloadContentType(String downloadContentType) {
		this.downloadContentType = downloadContentType;
	}
	public String getDownloadFileName() {
		return downloadFileName;
	}
	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
//	@Override
	public String execute() throws Exception {
//		System.out.println(fileFileName);
//		System.out.println(file.getAbsolutePath());
		Date d = new Date();
		String format = "yyyyMMdd";
		for(int i=0;i<file.size();i++){
			File f = file.get(i);
			String singleFileName = fileFileName.get(i);
			singleFileName = "foodprocess" + FormatUtil.formatDate(d, format) + i + FileUtil.getType(singleFileName);
//			System.out.println(f.lastModified());
			String contextPath = ServletActionContext.getServletContext().getRealPath("");
			String savePath="resource/pic";
			savePath = contextPath + File.separator +savePath;
			File newf = new File(savePath, singleFileName);
			try {
				FileUtils.copyFile(f, newf);
			} catch (Exception e) {
				
			}
		}
		
		return SUCCESS;
	}
	public String download(){
		String contextPath = ServletActionContext.getServletContext().getRealPath("/resource/pic");
		File f = new File(contextPath , "1.jpg");
		setDownloadContentType("image/jpeg");
		try {
			setDownloadFileName(new String(f.getName().getBytes(), "ISO8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String create(){
		System.out.println("ffff");
		System.out.println(fileFileName);
//		System.out.println(file.getAbsolutePath());
//		FileUtils.copyFile(file, file);
		return SUCCESS;
	}
	
//	public String getContentPath(){
//		return ServletActionContext.getServletContext().getRealPath("");
//	}
}
