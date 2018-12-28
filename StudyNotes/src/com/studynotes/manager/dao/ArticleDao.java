package com.studynotes.manager.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.bean.Article;


@Repository
public class ArticleDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Article selectArticleById(Integer article_id){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Article where article_id=?");
		query.setParameter(0, article_id);
		Article book = (Article) query.uniqueResult();
		return book;
	}
	public List<Article> selectAllArticle(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Article";
		Query query = session.createQuery(hql);
		List<Article> list = query.list();
		return list;
	}
	public List<Article> selectArticleByPage(int page, int record){
		Session session = sessionFactory.getCurrentSession();
		String hql = "select a.* ,column_name  from Article a order by article_id asc";
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*record);
		query.setMaxResults( record);
		List<Article> list = query.list();
		return list;
	}
	public boolean insertArticle(Article article) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(article);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
		
	}
	public boolean deleteArticle(Integer Article_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Article where article_id=?");
		query.setParameter(0, Article_id);
		int r = query.executeUpdate();
		if(r>0) {
			return true;
		}else {
			return false;
		}
	}
//	public boolean updateBook(Article book) {
//		Session session = sessionFactory.getCurrentSession();
//		Book booked = session.get(Book.class, book.getBook_id());
//		booked.setBook_name(book.getBook_name());
//		booked.setBook_writer(book.getBook_writer());
//		booked.setBook_publisher(book.getBook_publisher());
//		booked.setBook_publish_data(book.getBook_publish_data());
//		booked.setBook_price(book.getBook_price());
//		booked.setBook_img(book.getBook_img());
//		BookType bookType = session.get(BookType.class, book.getBookType().getType_id());
//		booked.setBookType(bookType);
//		session.save(booked);
//		return true;
//		
//	}
}
