package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.ColumnInfo;
import com.studynotes.manager.dao.ColumnDao;


@Service
@Transactional
public class ColumnService {
	@Autowired
	private ColumnDao columnDao;

	public List<ColumnInfo> selectFatherColumnInfo(){
		List<ColumnInfo> list = columnDao.selectFatherColumnInfo();
		return list;
	}
	public boolean insertColumn(ColumnInfo columnInfo) {
		return columnDao.insertColumn(columnInfo);
	}
	public List<ColumnInfo> selectAllColumnInfo(){
		return columnDao.selectAllColumnInfo();
	}
	public List<ColumnInfo> selectAllColumnInfoByPage(int page, int record){
		return columnDao.selectAllColumnInfoByPage(page,record);	
	}
	public boolean deleteColumn(int  column_id) {
		return columnDao.deleteColumn(column_id);
	}
	public ColumnInfo selectColumnById(int  column_id,int type) {
		return columnDao.selectColumnById(column_id,type);
	}
	public List<ColumnInfo>  selectColumnByColumn_father_node(int  column_father_node) {
		return columnDao.selectColumnByColumn_father_node(column_father_node);
	}
	public boolean deleteColumnByColumn_father_node(int column_father_node,int resultNum) {
		return columnDao.deleteColumnByColumn_father_node(column_father_node, resultNum);
	}
	public boolean updateColumn(ColumnInfo columnInfo) {
		return columnDao.updateColumn(columnInfo);
	}
	
}
