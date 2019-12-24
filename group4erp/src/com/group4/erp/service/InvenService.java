package com.group4.erp.service;
import com.group4.erp.InvenSearchDTO;
import java.util.*;

public interface InvenService {


	List<Map<String, String>> getPublisher(InvenSearchDTO invenSearchDTO);
	
	List<Map<String, String>> getInvenLoc(InvenSearchDTO invenSearchDTO);
	
	int getBookListCnt(InvenSearchDTO invenSearchDTO);
	
	List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO);


}
