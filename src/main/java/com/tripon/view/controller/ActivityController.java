package com.tripon.view.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tripon.biz.activity.ActivityService;
import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.activity.PagingVO;
import com.tripon.biz.category.CategoryService;
import com.tripon.biz.category.CategoryVO;

@Controller
@SessionAttributes("activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;
		
	@Autowired
	private CategoryService categoryService;
	
	//*User Details page 이동
	@RequestMapping(value="getUser_detailsPage")
	public String getUserdetailsPage(ActivityVO vo, Model model) {
		System.out.println("activity_controller ==> user_activityListPage 글 목록 검색 처리");
			
		model.addAttribute("activity", activityService.getUserdetailsPage(vo));
		System.out.println(vo.getAct_num());
		System.out.println("User_detailsPage=" + (model.asMap().get("activity")));
		return "user_detailsPage";
		
	}
	
	
	// *글 목록 검색
	@RequestMapping(value="user_activityListPage")
	public String getUserActivityList(ActivityVO vo,CategoryVO cvo, Model model) {
		System.out.println("activity_controller ==> user_activityListPage 글 목록 검색 처리");
			
		model.addAttribute("activityList", activityService.getUserActivityList(vo));
		model.addAttribute("category", categoryService.getCategory(cvo));
		System.out.println(vo.getCategory_num());
		System.out.println("activityList=" + (model.asMap().get("activityList")));
		System.out.println("user_activityListPage =" + (model.asMap().get("category")));
		return "user_activityListPage";
		
	}
	
	
	// *글 등록
//	@RequestMapping(value = "/admin/admin_insertActivity")
	public String insertActivity(ActivityVO vo) throws IOException {
		System.out.println("글 등록 처리");
		
		activityService.insertActivity(vo);
		return "/admin/admin_insertActivity";
	}
	
	//*글 삭제
	@RequestMapping(value = "/admin/admin_deleteActivity")
	public String deleteActivity(ActivityVO vo) {
		System.out.println("글 삭제 처리");
		activityService.deleteActivity(vo);
		return "redirect:/admin/admin_getActivityList";
	}
	
	// *글 상세 조회
	@RequestMapping(value = "/admin/admin_getActivity")
	public String getActivity(ActivityVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		model.addAttribute("activity", activityService.getActivity(vo));
		return "/admin/admin_activity";
	}
	
	// 글 목록 검색
		@RequestMapping(value = "/admin/admin_getActivityList")
		public String getActivityList(PagingVO pv, ActivityVO vo, Model model, HttpServletRequest request) {
			System.out.println("글 목록 검색 처리");
			String cntPerPage = "10";
			
			int total = activityService.countActivity(vo);
			if (pv.getNowPage() == 0)  pv.setNowPage(1);
			
			pv = new PagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
			vo.setStart(pv.getStart());
			vo.setListcnt(Integer.parseInt(cntPerPage));
			
			if (vo.getSearchcondition() != null) vo.setSearchcondition(vo.getSearchcondition());
			else vo.setSearchcondition("ACT_MAINTITLE");
			
			if (vo.getSearchkeyword() != null) vo.setSearchkeyword(vo.getSearchkeyword());
			else vo.setSearchkeyword("");
			
			System.out.println(vo.getSearchcondition());
			System.out.println(vo.getSearchkeyword());
			
			model.addAttribute("searchkeyword", vo.getSearchkeyword());
			model.addAttribute("searchcondition", vo.getSearchcondition());
			model.addAttribute("paging", pv);
			model.addAttribute("activityList", activityService.getActivityList(vo));
			return "/admin/admin_activityList";
		}
	
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("상품명", "ACT_MAINTITLE");
			conditionMap.put("작성자", "ACT_WRITER");
			return conditionMap;
		}
//	// 글 등록
//	@RequestMapping(value="/insertActivity")
//	public String insertActivity(ActivityVO vo) throws IOException {
//		System.out.println("글 등록 처리");
//		// 파일 업로드 처리
////		MultipartFile uploadFile = vo.getUploadFile();
////		System.out.println(uploadFile.getOriginalFilename());
////		if(!uploadFile.isEmpty()) {
////			String fileName = uploadFile.getOriginalFilename();
////			uploadFile.transferTo(new File("C:/user/swork/SpringFileUpload/src/main/webapp/img/" + fileName));
////			vo.setFileName(fileName);
////		} else {
////			vo.setFileName("파일 없음");
////		}
//		
////		boardDAO.insertBoard(vo);
//		activityService.insertActivity(vo);
//		return "activity";
//	}
//	
//	// 글 수정
//	@RequestMapping(value="/updateActivity")
//	public String updateActivity(@ModelAttribute("activity") ActivityVO vo) {
////		boardDAO.updateBoard(vo);
//		activityService.updateActivity(vo);
//		return "activity";
//	}
//	
//	// 글 삭제
//	@RequestMapping(value="/deleteActivity.do")
//	public String deleteActivity(ActivityVO vo) {
//		System.out.println("글 삭제 처리");
////		boardDAO.deleteBoard(vo);
//		activityService.deleteActivity(vo);
//		return "activity";
//	}
//	
//	// 글 상세 조회
//	@RequestMapping(value="/getActivity.do")
//	public String getActivity(ActivityVO vo, Model model) {
//		System.out.println("글 상세 조회 처리");
////		BoardVO vo1 = boardService.getBoard(vo);
////		vo1.setCnt(vo1.getCnt() + 1);
////		boardService.updateBoard(vo1);
//		
////		model.addAttribute("board", boardDAO.getBoard(vo));
//		model.addAttribute("activity", activityService.getActivity(vo));
//		return "getActivity.jsp";
//	}
//	
	

}
