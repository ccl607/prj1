package com.group4.erp;

public class InvenSearchDTO {
	private String[] category_name;
	private String[] size_cd;
	private String[] search_inventory_loc;
	private String searchPublisher;
	private String is_print;
	private String book_keyword;
	private String orAnd;
	private String[] date;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String keyword1;
	
	//DB연동으로 검색조건 가져오는 변수
	private String[] publisher;
	private String[] inventory_loc;
	
	//headerSort 변수
	private String sort;
	
	private String searchToday;
	private String dateFrom;
	private String dateTill;
	
	
	public String getSearchToday() {
		return searchToday;
	}
	public void setSearchToday(String searchToday) {
		this.searchToday = searchToday;
	}
	public String getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}
	public String getDateTill() {
		return dateTill;
	}
	public void setDateTill(String dateTill) {
		this.dateTill = dateTill;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String[] getSearch_inventory_loc() {
		return search_inventory_loc;
	}

	public void setSearch_inventory_loc(String[] search_inventory_loc) {
		this.search_inventory_loc = search_inventory_loc;
	}
	public String getKeyword1() {
		return keyword1;
	}
	
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	
	public String[] getCategory_name() {
		return category_name;
	}
	
	public void setCategory_name(String[] category_name) {
		this.category_name = category_name;
	}
	
	public String[] getSize_cd() {
		return size_cd;
	}
	
	public void setSize_cd(String[] size_cd) {
		this.size_cd = size_cd;
	}
	
	public String[] getInventory_loc() {
		return inventory_loc;
	}
	
	public void setInventory_loc(String[] inventory_loc) {
		this.inventory_loc = inventory_loc;
	}
	
	public String getSearchPublisher() {
		return searchPublisher;
	}
	
	public void setSearchPublisher(String searchPublisher) {
		this.searchPublisher = searchPublisher;
	}
	
	public String getIs_print() {
		return is_print;
	}
	
	public void setIs_print(String is_print) {
		this.is_print = is_print;
	}
	
	public String getBook_keyword() {
		return book_keyword;
	}
	
	public void setBook_keyword(String book_keyword) {
		this.book_keyword = book_keyword;
	}
	
	public String[] getDate() {
		return date;
	}
	
	public void setDate(String[] date) {
		this.date = date;
	}
	
	public int getSelectPageNo() {
		return selectPageNo;
	}
	
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	
	public String[] getPublisher() {
		return publisher;
	}
	
	public void setPublisher(String[] publisher) {
		this.publisher = publisher;
	}
	
	public String getOrAnd() {
		return orAnd;
	}
	public void setOrAnd(String orAnd) {
		this.orAnd = orAnd;
	}
	
	
	
	
	
	
	
	
	
	
	
	


}
