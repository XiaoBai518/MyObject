package com.util;

import java.util.List;

import com.entity.Product;


public class Page {
	private int currentpagenum;//当前的页数
	private List<Product> list;//存放该页的商品集合
	private int pageSize;//每一页的商品数
	private int totalPageNum;//页面总数
	private long totalCount;//商品总数
	
	
	public Page() {
		this.currentpagenum=1;
		this.pageSize = 9;
	}
	public Page(int currentpagenum) {
		this.currentpagenum=currentpagenum;
		this.pageSize=9;
	}
	public Page(int currentpagenum,int pagesize) {
		this.currentpagenum=currentpagenum;
		this.pageSize=pagesize;
	}
	
	public int getCurrentpagenum() {
		return currentpagenum;
	}
	public void setCurrentpagenum(int currentpagenum) {
		if(currentpagenum==0) {
			this.currentpagenum=1;
		}else if(currentpagenum>totalPageNum){
			this.currentpagenum=totalPageNum;
		}else {
			this.currentpagenum = currentpagenum;
		}
	
		
	}	
	public List<Product> getList() {
		return list;
	}
	public void setList(List<Product> list) {
		this.list = list;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
		
		if(totalCount%pageSize==0) {
			totalPageNum = (int)totalCount/pageSize;
		}else {
			totalPageNum = (int)totalCount/pageSize+1;
		}
	}
	
}
