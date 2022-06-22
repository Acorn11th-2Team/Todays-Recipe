package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("DashBoardDTO")
public class DashBoardDTO {

	private String gCategory;
	private String TotalPrice;

	public DashBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashBoardDTO(String gCategory, String totalPrice) {
		super();
		this.gCategory = gCategory;
		TotalPrice = totalPrice;
	}

	public String getgCategory() {
		String kCategory = "";
		if (gCategory.equals("Seafood")) {
			kCategory = "수산·해산·건어물";
		} else if (gCategory.equals("Vegetable")) {
			kCategory = "채소";
		} else if (gCategory.equals("Fruit")) {
			kCategory = "과일·견과·쌀";
		} else if (gCategory.equals("Noodle")) {
			kCategory = "면·양념·오일";
		} else if (gCategory.equals("Meat")) {
			kCategory = "정육·계란";
		};
		
		return kCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	public String getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "DashBoardDTO [gCategory=" + gCategory + ", TotalPrice=" + TotalPrice + "]";
	}
}
