package com.recommendfood.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.Food;
import com.recommendfood.service.FoodService;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchUtil;

//首页信息加载类
public class IndexAction extends CommonAction<Object> {
	private String foodInfo;
	
	public String getFoodInfo() {
		return foodInfo;
	}

	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
	}

	public String selectFood() {
		//setDataList(dataList);
		FoodService fs = DatabaseFactory.getFoodService(ServletActionContext.getServletContext());
		List<SearchObject> params = new ArrayList<SearchObject>();
		params.add(SearchUtil.add(false, "name", foodInfo, true));
		params.add(SearchUtil.add(true, "stuff", foodInfo, true));
		List<Food> foods = fs.findFoodListByParams(params);
		for(Food f: foods) {
			System.out.println(f.getId());
		}
		
		return "success";
	}
}
