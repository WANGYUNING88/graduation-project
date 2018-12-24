package com.studynotes.manager.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.common.bean.ColumnInfo;


@Repository
public class ColumnDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/*
	 * 查询全部父栏目
	 */
	
	public List<ColumnInfo> selectFatherColumnInfo(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ColumnInfo a where a.column_father_node = '0'";
		Query query = session.createQuery(hql);
		List<ColumnInfo> list = query.list();
		return list;
	}
	/*
	 * 添加
	 */
	public boolean insertColumn(ColumnInfo columnInfo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(columnInfo);
			return true;
		}catch(Exception e){
			return false;
		}
		
		
	}
	/*
	 * 修改
	 */
	public boolean updateColumn(ColumnInfo columnInfo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		ColumnInfo newColumn = 
				session.get(ColumnInfo.class, columnInfo.getColumn_id());
		newColumn.setColumn_byname(columnInfo.getColumn_byname());
		newColumn.setColumn_name(columnInfo.getColumn_name());
		newColumn.setColumn_father_node(columnInfo.getColumn_father_node());
		newColumn.setColumn_keyword(columnInfo.getColumn_keyword());
		newColumn.setColumn_describe(columnInfo.getColumn_describe());
		
		
		try {
			session.save(newColumn);
			return true;
		}catch(Exception e){
			return false;
		}
		
//		Session session = sessionFactory.getCurrentSession();
//		String hql ="update ColumnInfo set column_byname =? ,column_name=?,"
//				+ "column_father_node=?,column_keyword=? ,column_describe=?"
//				+ "where column_id = ?";
//		Query query = session.createQuery(hql);
//		query.setParameter(0,columnInfo.getColumn_byname());
//		query.setParameter(1,columnInfo.getColumn_name());
//		query.setParameter(2,columnInfo.getColumn_father_node());
//		query.setParameter(3,columnInfo.getColumn_keyword());
//		query.setParameter(4,columnInfo.getColumn_describe());
//		query.setParameter(5,columnInfo.getColumn_id());
//		int r = query.executeUpdate();
//		if(r>0)
//			return true;
//		else {
//			return false;
//		}
		
	}
	/*
	 * 查询全部
	 */
	public List<ColumnInfo> selectAllColumnInfo(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ColumnInfo ";
		Query query = session.createQuery(hql);
		List<ColumnInfo> list = query.list();
		return list;
	}
	
	/*
	 * 查询全部
	 */
	public List<ColumnInfo> selectAllColumnInfoByPage(int page, int record){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ColumnInfo order by column_id";
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*record);
		query.setMaxResults( record);
		List<ColumnInfo> list = query.list();
		return list;
	}
	/*
	 * 删除栏目
	 */
	public boolean deleteColumn(int  column_id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		 String hql="delete ColumnInfo as p where p.column_id=?";
		 Query query=session.createQuery(hql);

		 query.setParameter(0, column_id);

		 int result = query.executeUpdate();
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}
	/*
	 * 
	 * 查询栏目根据id
	 */
	public ColumnInfo selectColumnById(int  column_id,int type) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from ColumnInfo where column_id=? ";
		if(type==1) 
		sql+="and column_father_node=0 ";
		Query query = session.createQuery(sql);
		query.setParameter(0, column_id);
		ColumnInfo columnInfo = (com.common.bean.ColumnInfo) query.uniqueResult();
		
		
		return columnInfo;
	}
	/*
	 * 
	 * 查询栏目根据column_father_node
	 */
	public List<ColumnInfo> selectColumnByColumn_father_node(int  column_father_node) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "from ColumnInfo where  column_father_node=? ";
		List<ColumnInfo> list = new ArrayList<>();
		Query query = session.createQuery(sql);
		query.setParameter(0, column_father_node);
		list =  query.list();
		
		
		return list;
	}

	/*
	 * 级联删除栏目
	 */
	public boolean deleteColumnByColumn_father_node(int column_father_node,int resultNum) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		 String hql="delete from ColumnInfo  where column_father_node=?";
		 Query query=session.createQuery(hql);

		 query.setParameter(0, column_father_node);

		 int result = query.executeUpdate();
		
		if(result==resultNum) {
			return true;
		}else {
			return false;
		}
		
	}
}
