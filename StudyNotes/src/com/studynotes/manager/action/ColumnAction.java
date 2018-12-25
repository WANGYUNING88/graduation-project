package com.studynotes.manager.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.alibaba.fastjson.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.bean.ColumnInfo;
import com.common.util.CommonUtil;
import com.studynotes.manager.service.ColumnService;



@Controller
@RequestMapping("/manager")
public class ColumnAction {
	@Autowired
	private ColumnService columnService;
	/*
	 * ��ѯ���ڵ�
	 */
	@RequestMapping("/selectFatherColumn")
	@ResponseBody 
	public void selectFatherColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		List<ColumnInfo> list = new ArrayList<>();
		list = columnService.selectFatherColumnInfo();
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
	 * ������Ŀ
	 */
	
	@RequestMapping("/insertColumn")
	@ResponseBody 
	public void insertColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ColumnInfo columnInfo = new ColumnInfo();
		//��ȡ����
		String column_name = request.getParameter("name");
		String column_byname = request.getParameter("alias");
		String column_father_node1 = request.getParameter("fid");
		String column_keyword = request.getParameter("keywords");
		String column_describe = request.getParameter("describe");
		System.out.println(column_name+" "+column_name+" "+column_father_node1+" "+column_keyword+" "+column_describe);
		boolean result =false;
		if(column_father_node1!=""&&column_father_node1!=null) {
			int column_father_node = Integer.valueOf(column_father_node1);
			columnInfo.setColumn_name(column_name);
			columnInfo.setColumn_byname(column_byname);
			columnInfo.setColumn_father_node(column_father_node);
			columnInfo.setColumn_keyword(column_keyword);
			columnInfo.setColumn_describe(column_describe);
			 result = columnService.insertColumn(columnInfo);
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
	
	/*
	 * �޸���Ŀ
	 */
	
	@RequestMapping("/updateColumn")
	@ResponseBody 
	public void updateColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		ColumnInfo columnInfo = new ColumnInfo();
		//��ȡ����
		String column_id1 = request.getParameter("id1");
		String column_name = request.getParameter("name1");
		String column_byname = request.getParameter("alias1");
		String column_father_node1 = request.getParameter("fid1");
		String column_keyword = request.getParameter("keywords1");
		String column_describe = request.getParameter("describe1");
		System.out.println("��ȡ���޸ĵĲ���:"+column_id1+" "+column_name+" "+column_name+" "+column_father_node1+" "+column_keyword+" "+column_describe);
		boolean result =false;
		if(column_father_node1!=""&&column_id1!="") {
			int column_father_node = Integer.valueOf(column_father_node1);
			int column_id = Integer.valueOf(column_id1);
			columnInfo.setColumn_id(column_id);
			columnInfo.setColumn_name(column_name);
			columnInfo.setColumn_byname(column_byname);
			columnInfo.setColumn_father_node(column_father_node);
			columnInfo.setColumn_keyword(column_keyword);
			columnInfo.setColumn_describe(column_describe);
			 result = columnService.updateColumn(columnInfo);
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
/*
 * ��ѯȫ��
 */
	@RequestMapping("/selectAllColumnByPage")
	@ResponseBody 
	public void selectAllColumnByPage(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		List<ColumnInfo> list = new ArrayList<>();
		String pageStr = request.getParameter("page");
		int page = Integer.parseInt(pageStr);
		list = columnService.selectAllColumnInfoByPage(page, CommonUtil.RECORD);
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
		@RequestMapping("/selectAllColumn")
		@ResponseBody 
		public void selectAllColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
			response.setCharacterEncoding("UTF-8");
			List<ColumnInfo> list = new ArrayList<>();		
			list = columnService.selectAllColumnInfo();
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
			json.put("columnNum", list.size());
			try {
				PrintWriter pw = response.getWriter();
				pw.write(json.toJSONString());
				System.out.println(json.toJSONString());
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}
		/*
		 * ɾ����Ŀ
		 */
			@RequestMapping("/deleteColumn")
			@ResponseBody 
			public void deleteColumn(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
				response.setCharacterEncoding("UTF-8");
				boolean result = false;
				String column_id = request.getParameter("column_id");
				if(column_id!=null) {
					int id = Integer.parseInt(column_id);
					
					ColumnInfo columnInfo = columnService.selectColumnById(id,1);
					if(columnInfo!=null) {
						List<ColumnInfo> list = 
								columnService.selectColumnByColumn_father_node(columnInfo.getColumn_father_node());
						System.out.println("ִ��ɾ����Ŀ��ȡ������ĸ��ڵ��ǣ�"+columnInfo.getColumn_father_node());
						System.out.println("ִ��ɾ����Ŀ��ȡ������������ǣ�"+list.size());
						result = 
								columnService.deleteColumnByColumn_father_node(columnInfo.getColumn_father_node(), list.size());
						System.out.println("ִ��ɾ����Ŀ��ȡ������Ľ���ǣ�"+result);
						if(result==true) {
							result = columnService.deleteColumn(id);
							System.out.println("ɾ������Ŀ��"+result);
						}
					}else {
						result = columnService.deleteColumn(id);
						System.out.println("ɾ������Ŀ��"+result);
					}
					
				}
				System.out.println("ִ��ɾ����Ŀ��ȡ��ID�ǣ�"+column_id);
				JSONObject json = new JSONObject();
				json.put("result", result);
				try {
					PrintWriter pw = response.getWriter();
					pw.write(json.toJSONString());
					System.out.println(json.toJSONString());
				} catch (IOException e) {	
					e.printStackTrace();
				}
			}
			/*
			 * 
			 * 	��ȡ��Ŀ����id��		 
			 * 
			 */
				@RequestMapping("/selectColumnById")
				@ResponseBody 
				public void selectColumnById(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
					response.setCharacterEncoding("UTF-8");
					boolean result = false;
					String column_id = request.getParameter("column_id");
					ColumnInfo columnInfo = new ColumnInfo();
					if(column_id!=null) {
						int id = Integer.parseInt(column_id);
						
						columnInfo = columnService.selectColumnById(id,2);//1:��ѯ�Ƿ��Ǹ���2:������
						
						
						
					}
					System.out.println("�޸���Ŀ��ȡ��ID�ǣ�"+column_id);
					JSONObject json = new JSONObject();
					json.put("result", columnInfo);
					try {
						PrintWriter pw = response.getWriter();
						pw.write(json.toJSONString());
						System.out.println(json.toJSONString());
					} catch (IOException e) {	
						e.printStackTrace();
					}
					
				}
			

}
