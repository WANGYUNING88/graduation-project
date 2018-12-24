package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.Book;
import com.common.bean.BookType;
import com.studynotes.manager.dao.BookDao;

@Service
@Transactional
public class BookService {
	@Autowired
	private BookDao bookDao;
/*
 * bookType
 */
	public BookType selectTypeById(Integer type_id){
		return (BookType)bookDao.selectTypeById(type_id);
	}
	public List<BookType> selectAllType(){
		return bookDao.selectAllType();
	}
	public BookType insertType(BookType bookType) {
		return bookDao.insertType(bookType);
	}
	public boolean deleteType(Integer type_id) {
		return bookDao.deleteType(type_id);
	}
	public boolean updateType(BookType bookType) {
		return bookDao.updateType(bookType);
	}
	public BookType selectTypeByName(String type_name){
		return bookDao.selectTypeByName(type_name);
	}
/*
 * book
 */
	public Book selectBookById(Integer book_id){
		return bookDao.selectBookById(book_id);
	}
	public List<Book> selectAllBook(){
		return bookDao.selectAllBook();
	}
	public Integer insertBook(Book book) {
		return bookDao.insertBook(book);
	}
	public boolean deleteBook(Integer book_id) {
		return bookDao.deleteBook(book_id);
	}
	public boolean updateBook(Book book) {
		return bookDao.updateBook(book);
	}
}
