package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.dao.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	ApprovalDAO approvalDAO;

	@Override
	public int insertApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		System.out.println("Service insertApproval() 메소드 실행");
		int insertCnt = this.approvalDAO.insertApproval(approvalDTO);
		
		return insertCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalReqList = this.approvalDAO.getApprovalReqList(approvalSearchDTO);
		
		return approvalReqList;
	}

	@Override
	public int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalReqCnt = this.approvalDAO.getApprovalReqCnt(approvalSearchDTO);
		
		return approvalReqCnt;
	}

	@Override
	public int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalToCnt = this.approvalDAO.getApprovalResCnt(approvalSearchDTO);
		
		return approvalToCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.approvalDAO.getApprovalResList(approvalSearchDTO);
		
		return approvalResList;
	}

}
