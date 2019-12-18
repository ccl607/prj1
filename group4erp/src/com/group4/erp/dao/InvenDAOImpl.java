package com.group4.erp.dao;

import com.group4.erp.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvenDAOImpl implements InvenDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO){
		
		System.out.println("4444444");
		List<Map<String,String>> getBookList = this.sqlSession.selectList(
					"com.group4.erp.dao.invenSearchDAO.getBookList"
					,invenSearchDTO
				);
		
		System.out.println("5555555");
		return getBookList;
		
	}
}
