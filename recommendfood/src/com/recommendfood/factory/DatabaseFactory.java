package com.recommendfood.factory;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.recommendfood.service.AdminCheckService;
import com.recommendfood.service.AdminLogService;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.NoteReplyService;
import com.recommendfood.service.NoteService;
import com.recommendfood.service.SystemCategoryService;
import com.recommendfood.service.UserCategoryService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserFavoritesService;
import com.recommendfood.service.UserFoodThumbsupService;
import com.recommendfood.service.UserRecommendService;
import com.recommendfood.service.UserService;

public class DatabaseFactory {
	private static ApplicationContext context = null;
	
	public static void initSpringConfig(ServletContext sc){
		if(context==null)
			context = WebApplicationContextUtils.getWebApplicationContext(sc);
	}
	public static CommonService getCommonService(ServletContext sc){
		initSpringConfig(sc);
		return (CommonService) context.getBean("commonService");
	}
	public static FoodService getFoodService(ServletContext sc){
//		if(context==null)
//			initSpringConfig(sc);
		initSpringConfig(sc);
		return (FoodService) context.getBean("foodService");
	}
	public static FoodCategoryService getFoodCategoryService(ServletContext sc){
		initSpringConfig(sc);
		return (FoodCategoryService) context.getBean("foodCategoryService");
	}
	public static SystemCategoryService getSystemCategoryService(ServletContext sc){
		initSpringConfig(sc);
		return (SystemCategoryService) context.getBean("systemCategoryService");
	}
	public static NoteService getNoteService(ServletContext sc){
		initSpringConfig(sc);
		return (NoteService) context.getBean("noteService");
	}
	public static NoteReplyService getNoteReplyService(ServletContext sc){
		initSpringConfig(sc);
		return (NoteReplyService) context.getBean("noteReplyService");
	}
	public static UserService getUserService(ServletContext sc){
		initSpringConfig(sc);
		return (UserService) context.getBean("userService");
	}
	public static UserCategoryService getUserCategoryService(ServletContext sc){
		initSpringConfig(sc);
		return (UserCategoryService) context.getBean("userCategoryService");
	}
	public static UserFavoritesService getUserFavoritesService(ServletContext sc){
		initSpringConfig(sc);
		return (UserFavoritesService) context.getBean("userFavoritesService");
	}
	public static UserCommentService getUserCommentService(ServletContext sc){
		initSpringConfig(sc);
		return (UserCommentService) context.getBean("userCommentService");
	}
	public static UserRecommendService getUserRecommendService(ServletContext sc){
		initSpringConfig(sc);
		return (UserRecommendService) context.getBean("userRecommendService");
	}
	public static AdminCheckService getAdminCheckService(ServletContext sc){
		initSpringConfig(sc);
		return (AdminCheckService) context.getBean("adminCheckService");
	}
	public static AdminLogService getAdminLogService(ServletContext sc){
		initSpringConfig(sc);
		return (AdminLogService) context.getBean("adminLogService");
	}
	public static UserFoodThumbsupService getUserFoodThumbsupService(ServletContext sc){
		initSpringConfig(sc);
		return (UserFoodThumbsupService) context.getBean("userFoodThumbsupService");
	}
}
