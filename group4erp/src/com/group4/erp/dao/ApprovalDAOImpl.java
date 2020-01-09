package com.group4.erp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String mapper_namespace = "com.group4.erp.dao.ApprovalDAO.";

	@Override
	public int insertApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		
		System.out.println("DAO insertApproval() 메소드 실행");
		
		int approvalCnt = this.sqlSession.insert(mapper_namespace+"insertApproval", approvalDTO);
		
		return approvalCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalReqList = this.sqlSession.selectList(mapper_namespace+"getApprovalReqList", approvalSearchDTO);
		
		return approvalReqList;
	}

	@Override
	public int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalReqCnt = this.sqlSession.selectOne(mapper_namespace+"getApprovalReqCnt", approvalSearchDTO);
		
		return approvalReqCnt;
	}

	@Override
	public int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalToCnt = this.sqlSession.selectOne(mapper_namespace+"getApprovalResCnt", approvalSearchDTO);
		
		return approvalToCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.sqlSession.selectList(mapper_namespace+"getApprovalResList", approvalSearchDTO);
		
		return approvalResList;
	}

}
