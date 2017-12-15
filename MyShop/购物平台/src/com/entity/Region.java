package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="region")
public class Region {
	
	private double PARENT_ID;
	private String REGION_CODE;
	@Id
	private double REGION_ID;
	private double REGION_LEVEL;
	private String REGION_NAME;
	private String REGION_NAME_EN;
	private double REGION_ORDER;
	private String REGION_SHORTNAME_EN;
	public double getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(double pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}
	public String getREGION_CODE() {
		return REGION_CODE;
	}
	public void setREGION_CODE(String rEGION_CODE) {
		REGION_CODE = rEGION_CODE;
	}
	public double getREGION_ID() {
		return REGION_ID;
	}
	public void setREGION_ID(double rEGION_ID) {
		REGION_ID = rEGION_ID;
	}
	public double getREGION_LEVEL() {
		return REGION_LEVEL;
	}
	public void setREGION_LEVEL(double rEGION_LEVEL) {
		REGION_LEVEL = rEGION_LEVEL;
	}
	public String getREGION_NAME() {
		return REGION_NAME;
	}
	public void setREGION_NAME(String rEGION_NAME) {
		REGION_NAME = rEGION_NAME;
	}
	public String getREGION_NAME_EN() {
		return REGION_NAME_EN;
	}
	public void setREGION_NAME_EN(String rEGION_NAME_EN) {
		REGION_NAME_EN = rEGION_NAME_EN;
	}
	public double getREGION_ORDER() {
		return REGION_ORDER;
	}
	public void setREGION_ORDER(double rEGION_ORDER) {
		REGION_ORDER = rEGION_ORDER;
	}
	public String getREGION_SHORTNAME_EN() {
		return REGION_SHORTNAME_EN;
	}
	public void setREGION_SHORTNAME_EN(String rEGION_SHORTNAME_EN) {
		REGION_SHORTNAME_EN = rEGION_SHORTNAME_EN;
	}
	
	
	
}
