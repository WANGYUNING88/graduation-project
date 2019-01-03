package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.Article;
import com.common.bean.CaRelation;
import com.studynotes.manager.dao.ArticleDao;



@Service
@Transactional
public class ArticleSerivce {
	@Autowired
	private ArticleDao articleDao;
	

	public Article selectArticleById(Integer article_id){
		
		return articleDao.selectArticleById(article_id);
	}
	public List<Article> selectAllArticle(){
		
		return articleDao.selectAllArticle();
	}
	public List<String[]> selectArticleByPage(int page, int record,int id){
		
		return articleDao.selectArticleByPage(page, record,id);
	}
	public int  insertArticle(Article article) {		
			return articleDao.insertArticle(article);	
	}
	public boolean deleteArticle(Integer Article_id) {
	
		return articleDao.deleteArticle(Article_id);
	}
	public boolean  insertCaRelation(CaRelation c) {
		return articleDao.insertCaRelation(c);
	}
}
