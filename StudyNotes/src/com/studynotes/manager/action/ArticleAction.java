package com.studynotes.manager.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.alibaba.fastjson.*;
import com.common.bean.Article;
import com.common.util.CommonUtil;
import com.studynotes.manager.service.ArticleSerivce;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




@Controller
@RequestMapping("/manager")
public class ArticleAction {
	@Autowired
	private ArticleSerivce articleService;
	
//	/*
//	 * ������Ŀ
//	 */
//	
//	@RequestMapping("/insertColumn")
//	@ResponseBody 
//	public void insertColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
//		ColumnInfo columnInfo = new ColumnInfo();
//		//��ȡ����
//		String column_name = request.getParameter("name");
//		String column_byname = request.getParameter("alias");
//		String column_father_node1 = request.getParameter("fid");
//		String column_keyword = request.getParameter("keywords");
//		String column_describe = request.getParameter("describe");
//		System.out.println(column_name+" "+column_name+" "+column_father_node1+" "+column_keyword+" "+column_describe);
//		boolean result =false;
//		if(column_father_node1!=""&&column_father_node1!=null) {
//			int column_father_node = Integer.valueOf(column_father_node1);
//			columnInfo.setColumn_name(column_name);
//			columnInfo.setColumn_byname(column_byname);
//			columnInfo.setColumn_father_node(column_father_node);
//			columnInfo.setColumn_keyword(column_keyword);
//			columnInfo.setColumn_describe(column_describe);
//			 result = columnService.insertColumn(columnInfo);
//		}
//		JSONObject json = new JSONObject();
//		json.put("result", result);
//			try {
//				PrintWriter pw = response.getWriter();
//				pw.write(json.toJSONString());
//			} catch (IOException e) {	
//				e.printStackTrace();
//			}
//		}
//	
//	/*
//	 * �޸���Ŀ
//	 */
//	
//	@RequestMapping("/updateColumn")
//	@ResponseBody 
//	public void updateColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
//		ColumnInfo columnInfo = new ColumnInfo();
//		//��ȡ����
//		String column_id1 = request.getParameter("id1");
//		String column_name = request.getParameter("name1");
//		String column_byname = request.getParameter("alias1");
//		String column_father_node1 = request.getParameter("fid1");
//		String column_keyword = request.getParameter("keywords1");
//		String column_describe = request.getParameter("describe1");
//		System.out.println("��ȡ���޸ĵĲ���:"+column_id1+" "+column_name+" "+column_name+" "+column_father_node1+" "+column_keyword+" "+column_describe);
//		boolean result =false;
//		if(column_father_node1!=""&&column_id1!="") {
//			int column_father_node = Integer.valueOf(column_father_node1);
//			int column_id = Integer.valueOf(column_id1);
//			columnInfo.setColumn_id(column_id);
//			columnInfo.setColumn_name(column_name);
//			columnInfo.setColumn_byname(column_byname);
//			columnInfo.setColumn_father_node(column_father_node);
//			columnInfo.setColumn_keyword(column_keyword);
//			columnInfo.setColumn_describe(column_describe);
//			 result = columnService.updateColumn(columnInfo);
//		}
//		JSONObject json = new JSONObject();
//		json.put("result", result);
//			try {
//				PrintWriter pw = response.getWriter();
//				pw.write(json.toJSONString());
//			} catch (IOException e) {	
//				e.printStackTrace();
//			}
//		}
/*
 * ��ѯȫ��
 */
	@RequestMapping("/selectAllArticleByPage")
	@ResponseBody 
	public void selectAllArticleByPage(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		List list = new ArrayList<>();
		String pageStr = request.getParameter("page");
		int page = Integer.parseInt(pageStr);
		list = articleService.selectArticleByPage(page, CommonUtil.RECORD,0);
		System.out.println(list.size());
		JSONObject json = new JSONObject();
		json.put("result", list);
		try {
			PrintWriter pw = response.getWriter();
			pw.write(json.toJSONString());
			System.out.println(json.toJSONString());
		} catch (IOException e) {	
			e.printStackTrace();
		}
	}
	
	/*
	 * ��ѯȫ��
	 */
		@RequestMapping("/selectUserArticleByPage")
		@ResponseBody 
		public void selectUserArticleByPage(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
			response.setCharacterEncoding("UTF-8");
			List<String[]> list = new ArrayList<>();
			String pageStr = request.getParameter("page");
			int page = Integer.parseInt(pageStr);
			String user_id = request.getParameter("user_id");
			int id = Integer.parseInt(pageStr);
			list = articleService.selectArticleByPage(page, CommonUtil.RECORD,id);
			System.out.println(list.size());
			JSONObject json = new JSONObject();
			json.put("result", list);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
				System.out.println(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
		
	/*
	 * ��ѯȫ��
	 */
		@RequestMapping("/selectAllArticle")
		@ResponseBody 
		public void selectAllColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
			response.setCharacterEncoding("UTF-8");
			List<Article> list = new ArrayList<>();		
			list = articleService.selectAllArticle();
			System.out.println(list.size());
			int pageNum = list.size()/CommonUtil.RECORD;
			
			if(list.size()%CommonUtil.RECORD!=0) {
				pageNum+=1;
			}
			if(pageNum==0) {
				pageNum=1;
			}
			JSONObject json = new JSONObject();
			json.put("result", pageNum);
			json.put("articleNum", list.size());
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
				System.out.println(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
		/*
		 * �ϴ�
		 */
		@RequestMapping(value="/upload", method=RequestMethod.POST) 
		public void upload( @RequestParam MultipartFile pic, HttpServletRequest request,HttpSession session,HttpServletResponse response) {
			try {
				ServletContext context = request.getServletContext();
				
				String filename = pic.getOriginalFilename();
				System.out.println("��ȡ���ļ��ǣ�"+filename);
				
				// �ļ���ʹ�õ�ǰʱ��
				String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				// ��ȡ�ϴ�ͼƬ����չ��(jpg/png/...)
				String extension = FilenameUtils.getExtension(filename);
				String newImgName = name+"."+extension;	
				File file = new File(CommonUtil.REALUPLOADPATH+newImgName);
				System.out.println("���������ļ��ǣ�"+name+extension);
				
				byte[] bytes = pic.getBytes();
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(bytes);
				fos.flush();
				fos.close();
				// �����·��д�أ�json��ʽ��
				JSONObject jsonObject = new JSONObject();
				// ��ͼƬ�ϴ�������
				jsonObject.put("path", newImgName);
				
				// д��
				response.getWriter().write(jsonObject.toString());
	 
			} catch (Exception e) {
				throw new RuntimeException("��������æ���ϴ�ͼƬʧ��"+e);
			}
		}
		/*
		 *��ȡͼƬ
		 */
			@RequestMapping("/showPhoto")
			@ResponseBody 
			public void showPhoto(HttpServletRequest request,HttpServletResponse response) {
				try {
					String fileName = request.getParameter("url");//ͼƬ����
					String path=CommonUtil.REALUPLOADPATH+fileName;
					// ��byte���ķ�ʽ���ļ� d:\1.gif
					FileInputStream hFile;
					hFile = new FileInputStream(path);
					//�õ��ļ���С
					int i=hFile.available();
					byte data[]=new byte[i];
					//������
					hFile.read(data);
					response.setHeader("Content-Type","image/jpeg");
					//�õ���ͻ���������������ݵĶ���
					OutputStream toClient=response.getOutputStream();
					//�������
//					// �����·��д�أ�json��ʽ��
//					JSONObject jsonObject = new JSONObject();
//					// ��ͼƬ�ϴ�������
//					jsonObject.put("path",toClient );
//					
//					// д��
//					response.getWriter().write(jsonObject.toString());
					toClient.write(data);
					toClient.flush();
					toClient.close();
					hFile.close();
					
		 
				} catch (Exception e) {
					throw new RuntimeException("ͼƬ��ȡʧ�ܣ�"+e);
				}
			}

//			/*
//			 * 
//			 * 	��ȡ��Ŀ����id��		 
//			 * 
//			 */
//				@RequestMapping("/selectColumnById")
//				@ResponseBody 
//				public void selectColumnById(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
//					response.setCharacterEncoding("UTF-8");
//					boolean result = false;
//					String column_id = request.getParameter("column_id");
//					ColumnInfo columnInfo = new ColumnInfo();
//					if(column_id!=null) {
//						int id = Integer.parseInt(column_id);
//						
//						columnInfo = columnService.selectColumnById(id,2);//1:��ѯ�Ƿ��Ǹ���2:������
//						
//						
//						
//					}
//					System.out.println("�޸���Ŀ��ȡ��ID�ǣ�"+column_id);
//					JSONObject json = new JSONObject();
//					json.put("result", columnInfo);
//					try {
//						PrintWriter pw = response.getWriter();
//						pw.write(json.toJSONString());
//						System.out.println(json.toJSONString());
//					} catch (IOException e) {	
//						e.printStackTrace();
//					}
//					
//				}
//			

}
