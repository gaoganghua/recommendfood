package com.recommendfood.test;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.recommendfood.action.LoginAction;
import com.recommendfood.factory.DatabaseFactory;
import com.recommendfood.model.AdminCheck;
import com.recommendfood.model.Food;
import com.recommendfood.model.FoodCategory;
import com.recommendfood.model.Note;
import com.recommendfood.model.NoteReply;
import com.recommendfood.model.User;
import com.recommendfood.model.UserCategory;
import com.recommendfood.model.UserComment;
import com.recommendfood.model.UserFavorites;
import com.recommendfood.model.UserFoodThumbsup;
import com.recommendfood.model.UserRecommend;
import com.recommendfood.service.AdminCheckService;
import com.recommendfood.service.AdminLogService;
import com.recommendfood.service.CommonService;
import com.recommendfood.service.FoodCategoryService;
import com.recommendfood.service.FoodService;
import com.recommendfood.service.NoteReplyService;
import com.recommendfood.service.NoteService;
import com.recommendfood.service.UserCategoryService;
import com.recommendfood.service.UserCommentService;
import com.recommendfood.service.UserFavoritesService;
import com.recommendfood.service.UserFoodThumbsupService;
import com.recommendfood.service.UserRecommendService;
import com.recommendfood.service.UserService;
import com.recommendfood.util.PatternUtil;
import com.recommendfood.util.QueryTypeEnum;
import com.recommendfood.util.SearchObject;
import com.recommendfood.util.SearchRelation;
import com.recommendfood.util.SearchUtil;
import com.recommendfood.util.StringUtil;
import com.sun.jmx.snmp.Timestamp;

public class TestOne {
	ClassPathXmlApplicationContext context = null;
	@Before
	public void before(){
		String[] paths = {"conf/spring/common.xml","conf/spring/dao.xml", "conf/spring/service.xml","conf/spring/action.xml"};
		context = new ClassPathXmlApplicationContext(paths);
	}
	@Test
	public void test9(){
		System.out.println(com.recommendfood.test.Test.getStr().get(1));
	}
	public void test8(){
//		String sql=" select max(floorNumber) from NoteReply n where 1=1 and n.noteId=5L and n.parentId=1L";
//		sql = "select max(id) from NoteReply n where 1=1 and n.noteId=1L and n.parentId=1L";
//		SessionFactory sf = context.getBean(SessionFactory.class);
//		Session s = sf.openSession();
//		Query q = s.createQuery(sql);
//		for(Object o:q.list()){
//			System.out.println(o);
//		}
		NoteReplyService nrs = context.getBean(NoteReplyService.class);
		NoteReply nr = new NoteReply();
		nr.setUserId(1);
		nr.setNoteId(1);
		nr.setReplyMsg("<p>fasdfasdfasd</p>");
		nr.setReplyTime(new Date());
		nr.setParentId(1);
		nr.setFloorNumber(4);
		nr.setRead(false);
		nrs.save(nr);
//		List<SearchObject> params = new LinkedList<SearchObject>();
//		params.add(SearchUtil.add(false, "noteId", 1L));
//		params.add(SearchUtil.add(false, "parentId", 1L));
//		Object maxnumber = nrs.findReportRecord(params, QueryTypeEnum.MAX_RECORD, new String[]{"id"});
//		List<Object> objs = null;
//		List<Object> all = cs.executeHql(sql);
//		System.out.println(all);
//		String s = StringUtil.getSafeCode();
//		System.out.println(s);
//		Interpreter inter = new Interpreter();
//		System.out.println(inter.);
//		UserService urs = (UserService)context.getBean("userService");
//		User u = urs.get(1L);
//		u.setLoginName("gasdfas");
//		urs.update(u);
//		List all = urs.findBooks();
//		System.out.println(all.size());
//		String[] ids = PatternUtil.extractStr("2,3,4", ",");
//		for(String s:ids){
//			System.out.println(s);
//		}
//		System.out.println(ids);
//		byte b = new Byte(String.valueOf("1"));
//		UserFoodThumbsup uft = new UserFoodThumbsup();
//		uft.setUserId(1L);
//		uft.setFoodId(3L);
//		uft.setType(b);
//		uft.setThumbsupTime(new Date());
//		UserFoodThumbsupService ufts = (UserFoodThumbsupService) context.getBean("userFoodThumbsupService");
//		ufts.save(uft);
//		CommonService css = (CommonService) context.getBean("commonService");
//		Object[] values = {1L, 3L, 1};
//		String sql4 = "select count(*) from user_food_thumbsup where user_id=? and food_id=? and type=?";
//		List<Object> isthumbsup = css.executeSqlWithReport(sql4, values);
//		BigInteger bi = new BigInteger(String.valueOf(isthumbsup.get(0)));
//		System.out.println(bi.intValue());
//		Object[] values2 = {1, 1L, 3L};
//		CommonService cs = (CommonService) context.getBean("commonService");
//		String sql="update user_food_thumbsup set type=? where user_id=? and food_id=?";
//		System.out.println(cs.updateSql(sql, values2));
//		List<Object> all = cs.updateSql(sql, values2);
//		BigInteger bi = new BigInteger(String.valueOf(all.get(0)));
//		System.out.println(bi.intValue());
//		String s = "1,30";
//		for(String ss:s.split(",")){
//			System.out.println(ss);
//		}
	}
	public void test7(){
//		UserRecommendService urs = (UserRecommendService)context.getBean("userRecommendService");
		FoodService fs = (FoodService) context.getBean("foodService");
		UserRecommendService urs = (UserRecommendService)context.getBean("userRecommendService");
		UserService uss = (UserService) context.getBean("userService");
		AdminCheckService acs = (AdminCheckService) context.getBean("adminCheckService");
		CommonService css = (CommonService) context.getBean("commonService");
		
		List<SearchObject> all = new ArrayList<SearchObject>();
		all.add(SearchUtil.add(false, "userId", 1L, "="));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("recommendTime", "desc");
		
		List<SearchObject> searchList = new ArrayList<SearchObject>();
		searchList.add(SearchUtil.add(false, "checkInfo", 1, "="));
		List<SearchRelation> relations = new ArrayList<SearchRelation>();
		relations.add(SearchUtil.addRelation("AdminCheck", "recommendId", "ac", false, searchList, "UserRecommend", "id"));
		List<UserRecommend> allur = urs.getListByParamsWithPage(all, relations, orderColumns, 0, 3);
//		System.out.println(allur.size());
		
		for(UserRecommend ur:allur){
			System.out.println(ur.getFoodId());
			Food f = fs.get(ur.getFoodId());
			ur.setFoodName(f.getName());
			ur.setFoodPictures(f.getPictures());
			ur.setFoodTypes(f.getFoodType());
			ur.setFoodIntroduce(f.getIntroduction());
			String sql="select count(*) from user_comment where food_id=?";
			List<Object> values1 = new ArrayList<Object>();
			values1.add(f.getId());
			List<Object> commentTotal = css.executeSqlWithReport(sql, values1);
			BigInteger bi = new BigInteger(String.valueOf(commentTotal.get(0)));
//			System.out.println(bi.intValue());
			ur.setCommentTotal(bi.intValue());
			
			String sql2="select count(*) from user_favorites where food_id=?";
			List<Object> values2 = new ArrayList<Object>();
			values2.add(f.getId());
			List<Object> favoritesTotal = css.executeSqlWithReport(sql2, values2);
			bi = new BigInteger(String.valueOf(favoritesTotal.get(0)));
//			System.out.println(bi.intValue());
			ur.setFavoritesTotal(bi.intValue());
//			System.out.println(ur.get);
		}
	}
	public void test6(){
		String sql="select id,comment_time,score from user_comment where user_id=? union all select id, reply_time, note_id from note_reply where user_id=? order by 2";
		CommonService us = (CommonService) context.getBean("commonService");
		int pageSize = 5; //每次查询得到的记录数
		List<Object> lists = new ArrayList<Object>();
		lists.add(1);
		lists.add(1);
		List<Object[]> alls = us.executeSqlWithPage(sql, lists, 0, 8);
		UserCommentService ucs = (UserCommentService) context.getBean("userCommentService");
		NoteReplyService nrs = (NoteReplyService) context.getBean("noteReplyService");
		FoodService fs = (FoodService) context.getBean("foodService");
		UserRecommendService urs = (UserRecommendService)context.getBean("userRecommendService");
		UserService uss = (UserService) context.getBean("userService");
		NoteService nss = (NoteService) context.getBean("noteService");
		
		String sqll = "";
//		List<E>
		for(Object[] objs:alls){
//			System.out.println(objs[1]+ ":" + objs[2]);
//			List<SearchObject> seas = new ArrayList<SearchObject>();
//			seas.add(SearchUtil.add(false, "id", objs[0], "="));
//			seas.add(SearchUtil.add(false, "score", Double.parseDouble(String.valueOf(objs[2])),"="));
			sqll = "select count(*) from user_comment where id=? and score=?";
			List<Object> oos = new ArrayList<Object>();
			oos.add(objs[0]);
			oos.add(Double.parseDouble(String.valueOf(objs[2])));
			List<Object> o = us.executeSqlWithReport(sqll, oos);
//			System.out.println(o.get(0).getClass());
			BigInteger bi = new BigInteger(String.valueOf(o.get(0)));
			if(bi.intValue()>0){
				UserComment uc = ucs.get(Long.parseLong(String.valueOf(objs[0])));
//				System.out.println(uc.getFoodId());
				List<SearchObject> seass = new ArrayList<SearchObject>();
				seass.add(SearchUtil.add(false, "id", uc.getFoodId()));
				List<SearchRelation> srs = new ArrayList<SearchRelation>();
				srs.add(SearchUtil.addRelation("UserRecommend", "foodId", "ur", true, new ArrayList<SearchObject>(), "Food", "id"));
				List<Object[]> oss = fs.getListByParams(seass, srs);
				if(oss!=null && oss.size()>0){
//					Food f = (Food) oss.get(0)[0];
//					UserRecommend ur = (UserRecommend) oss.get(0)[1];
//					uc.setFoodName(f.getName());
//					uc.setUserName(f.getPictures());
//					uc.setFoodType(f.getFoodType());
//					uc.setFoodIntroduction(f.getIntroduction());
//					uc.setRecommendTime(ur.getRecommendTime());
//					uc.setRecommendUserName(uss.get(ur.getUserId()).getLoginName());
//					System.out.println(uc.getFoodName()+ ":" + uc.getRecommendUserName());
//					uc.setFoodName();
				}
//				System.out.println("size"+  oss.size());
//				System.out.println(oss.get(0));
//				System.out.println(fs == null);
//				System.out.println(uc.getComment());
				//System.out.println("ssss");
			}else{
				NoteReply nr = nrs.get(Long.parseLong(String.valueOf(objs[0])));
				nr.setIndexNote(nss.get(nr.getNoteId()));//查找主贴
				nr.getIndexNote().setUserName(uss.get(nr.getIndexNote().getId()).getLoginName());
				nr.setUserName(uss.get(nr.getUserId()).getLoginName());
				
				List<SearchObject> nrseas = new ArrayList<SearchObject>();//查找评论的回复
				nrseas.add(SearchUtil.add(false, "noteId", nr.getNoteId(), "="));
				nrseas.add(SearchUtil.add(false, "parentId", nr.getId(), "="));
				List<NoteReply> notereplys = nrs.findFoodListByParams(nrseas);
//				System.out.println(notereplys.size());
//				for(NoteReply n:notereplys){
					for(NoteReply n:notereplys){
						n.setUserName(uss.get(n.getUserId()).getLoginName());
					}
					nr.setReplys(notereplys);
//				}
//				for(NoteReply n:)
				System.out.println(nr.getId() + ":" + nr.getUserName() + ":" + nr.getIndexNote().getId() + ":" + nr.getIndexNote().getUserName() + ":" + nr.getIndexNote().getTitle());
				for(NoteReply n:nr.getReplys()){
					System.out.println(n.getId() + ":" + n.getUserName());
				}
//				System.out.println(nr.getId());
//				System.out.println(nr.getReplyMsg());
			}
//			System.out.println(o.get(0));
//			ucs.findReportRecord(seas, QueryTypeEnum.TOTAL_RECORD, null);
//			System.out.println(all);
//			System.out.println(all.get(0)[0]);
//			System.out.println(objs[2].getClass()==Double.class);
		}
//		for()
	}
	public void test5(){
		CommonService us = (CommonService) context.getBean("commonService");
		int pageSize = 5; //每次查询得到的记录数
//		int firstResult  = (getPageIndex()-1)*pageSize;//查询起始页
		
//		user.setId(1L);
		NoteService ns = (NoteService) context.getBean("noteService");
		List<SearchObject> params = new ArrayList<SearchObject>();
		params.add(SearchUtil.add(false, "userId", 1L));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("noteTime", "desc");
		List<Note> lists = ns.findNoteListByParamsWithOrderAndPage(params, orderColumns, 0, pageSize);
		
		NoteReplyService brs = (NoteReplyService) context.getBean("noteReplyService");
		String[] columns = {};
		for(Note n:lists){
			List<SearchObject> param = new ArrayList<SearchObject>();
			param.add(SearchUtil.add(false, "noteId", n.getId()));
			Object o = brs.findReportRecord(param, QueryTypeEnum.TOTAL_RECORD, null);
//			System.out.println(o.getClass());
			n.setReplyRecord((Long)o);//评论数
			System.out.println(o);
			param.add(SearchUtil.add(false, "read", false));
			Object o2 = brs.findReportRecord(param, QueryTypeEnum.TOTAL_RECORD, null);
			System.out.println(o2);
			boolean isRead = (Long)o2>0?true:false;
			n.setRead(isRead);
			System.out.println(n.getId() + ":" + n.getTitle());
		}
		for(Note n:lists){
			System.out.println(n.getId() + ":" + n.getReplyRecord());
		}
	}
	public void test4(){
		UserFavoritesService ufs = (UserFavoritesService)context.getBean("userFavoritesService");
//		List<SearchObject> all = new ArrayList<SearchObject>();
//		all.add(SearchUtil.add(false, "loginName", "liuzhiqi"));
//		all.add(SearchUtil.add(false, "loginPassword", "19980521"));
//		us.modifyUser(6L, all);
//		user.setId(1);
//		UserFavoritesService ufs = DatabaseFactory.getUserFavoritesService(ServletActionContext.getServletContext());
		int pageIndex = 1;
		int pageSize = 2; //每次查询得到的记录数
		int firstResult  = (pageIndex-1)*pageSize;//查询起始页
		if(firstResult<1){
			firstResult=1;
		}
		
//		user.setId(1L);
//		UserFavoritesService ufs = DatabaseFactory.getUserFavoritesService(ServletActionContext.getServletContext());
		List<SearchObject> params = new ArrayList<SearchObject>();
		params.add(SearchUtil.add(false, "userId", 1L));
		List<SearchObject> relationParams = new ArrayList<SearchObject>();
		relationParams.add(SearchUtil.add(false, "status", 1));
		
		List<SearchRelation> searchList = new ArrayList<SearchRelation>();
		searchList.add(SearchUtil.addRelation("Food", "id", "f", true, relationParams, "UserFavorites", "foodId"));
		Map<String, String> orderColumns = new HashMap<String, String>();
		orderColumns.put("collectTime", "desc");
		List<Object[]> lists = ufs.getListByParamsWithPage(params, searchList, orderColumns, 2, 2);
		List<UserFavorites> favorites = new ArrayList<UserFavorites>();
		for(Object[] objs:lists){
			UserFavorites uf = (UserFavorites) objs[0];
			System.out.println(uf.getId());
			Food f = (Food) objs[1];
			uf.setFoodName(f.getName());
			uf.setFoodPictures(f.getPictures());
			uf.setFoodTypes(f.getFoodType());
			uf.setIntroduce(f.getIntroduction());
			favorites.add(uf);
		}
		for(UserFavorites uf:favorites){
			System.out.println(uf.getId()+":" + uf.getCollectTime());
		}
	}
	public void test3(){
//		UserCommentService ucs = (UserCommentService)context.getBean("userCommentService");
//		UserFavoritesService ufs = (UserFavoritesService)context.getBean("userFavoritesService");
//		List<UserFavorites> lists = ufs.find
//		System.out.println(ufs.get(1L).getCollectTime());
//		UserComment uc = new UserComment();
//		uc.setUserId(1);
//		uc.setFoodId(1);
//		uc.setScore(1.0);
//		uc.setComment("this is delicious food");
//		uc.setCommentTime(new Date());
//		ucs.save(uc);
		UserService us = (UserService)context.getBean("userService");
		User u = new User();
//		u.setLoginName("高港华");
//		u.setPhone("15754335612");
		u.setEmail("1657150887@qq.com");
		u.setLoginPassword("19970911");
//		LoginAction l = (LoginAction) context.getBean("login");
//		l.loginIn(u);
		List<SearchObject> searchLists = new ArrayList<SearchObject>();
		searchLists.add(SearchUtil.add(false, "phone", u.getPhone(), "="));
		searchLists.add(SearchUtil.add(true, "email", u.getEmail(), "="));
		List<SearchObject> seaLists = new ArrayList<SearchObject>();
		seaLists.add(SearchUtil.add(false, searchLists));
		seaLists.add(SearchUtil.add(false, "loginPassword",u.getLoginPassword(), "="));
		List<User> users = us.findUserListByParams(seaLists);
		for(User uu:users){
			System.out.println(uu.getId());
		}
//		System.out.println(us.check(u));
//		uc = ucs.get(1L);
//		AdminLogService urs = (AdminLogService)context.getBean("adminLogService");
//		System.out.println(urs.get(1L).getLogMsg());//有问题
		
	}
	public void test2(){
		FoodService fs = (FoodService)context.getBean("foodService");
		FoodCategoryService fcs = (FoodCategoryService)context.getBean("foodCategoryService");
		List<SearchObject> all = new ArrayList<SearchObject>();
		
		all.add(SearchUtil.add(false, "id", 30, ">"));
		all.add(SearchUtil.add(false, "id", 45, "<"));
//		all.add(SearchUtil.add(false, "id", 45, "="));
//		List<UserCategory> f = ucs.findBookListByParams(all);
		
		List<SearchObject> searchList = new ArrayList<SearchObject>();
		Integer[] ints={1, 4};
		searchList.add(SearchUtil.add(false, "id", ints));
		List<SearchRelation> relations = new ArrayList<SearchRelation>();
		relations.add(SearchUtil.addRelation("SystemCategory", "id", "sc", false, searchList,"FoodCategory", "systemCategory"));
		
		List<FoodCategory> lists = fcs.getListByParams(all, relations);
//		for(FoodCategory fc:lists){
//			System.out.println(fc.getId());
//		}
		List<SearchObject> objs = new ArrayList<SearchObject>();
//		for(FoodCategory fss:lists){
//			objs.add(SearchUtil.add(false, "foodType", 30, true));
			objs.add(SearchUtil.add(false, "foodType", 50, true));
			objs.add(SearchUtil.add(false, "foodType", 1, true));
//		}
		List<Food> foods = fs.findFoodListByParams(objs);
//		List<Food> foods = fs.findBooks();
		for(Food f:foods){
			System.out.println(f.getName());
		}
//	
		
		
//		for(UserCategory u:f){
//			System.out.println(u.getName());
//		}
	}
	public void test(){
//		String[] paths = {"conf/spring/common.xml","conf/spring/dao.xml", "conf/spring/service.xml"};
//		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(paths);
		
		FoodService fs = (FoodService)context.getBean("foodService");
		List<SearchObject> all = new ArrayList<SearchObject>();
		all.add(SearchUtil.add(false, "id", 4L, "<"));
//		List<Food> f = fs.findBookListByParams(all);
		
		
//		String[] processes = f.get(0).getManufacturingProcess().split("%");
//		for(String process:processes){
////			System.out.println(process);
//			String[] ss = process.split("=");
////			System.out.println(ss.length);
////			System.out.println(PatternUtil.testMatch(process, "^"));
//			System.out.println(ss[0] + ":" + ss[1]);
//		}
	}
}
