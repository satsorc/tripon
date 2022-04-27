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
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripon.biz.notice.NoticeService;
import com.tripon.biz.notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
//	String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	String realPath = "C:/user/swork/SpringFileUpload/src/main/webapp/img/";
	
	// 글 등록
	@RequestMapping(value="/admin/insertNotice", method=RequestMethod.POST)
	public String insertNotice(NoticeVO vo) throws IOException {
		System.out.println("글 등록 처리");
		// 파일 업로드 처리
//		MultipartFile uploadFile = vo.getUploadFile();
//		System.out.println(uploadFile.getOriginalFilename());
//		if(!uploadFile.isEmpty()) {
//			String fileName = uploadFile.getOriginalFilename();
//			uploadFile.transferTo(new File("C:/user/swork/SpringFileUpload/src/main/webapp/img/" + fileName));
//			vo.setFileName(fileName);
//		} else {
//			vo.setFileName("파일 없음");
//		}
		
//		boardDAO.insertBoard(vo);
		noticeService.insertNotice(vo);
		return "redirect:/admin/getNoticeList";
	}
	
	// 글 수정
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.POST)
	public String updateNotice(NoticeVO vo) {
//		boardDAO.updateBoard(vo);
		noticeService.updateNotice(vo);
		return "redirect:/admin/getNoticeList";
	}
	
	// 글 삭제
	@RequestMapping(value="/admin/deleteNotice", method=RequestMethod.POST)
	public String deleteNotice(NoticeVO vo) {
		System.out.println("글 삭제 처리");
//		boardDAO.deleteBoard(vo);
		noticeService.deleteNotice(vo);
		return "redirect:/admin/getNoticeList";
	}
	
	// 글 상세 조회
	@RequestMapping(value="/admin/getNotice")
	public String getNotice(NoticeVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
//		BoardVO vo1 = boardService.getBoard(vo);
//		vo1.setCnt(vo1.getCnt() + 1);
//		boardService.updateBoard(vo1);
		
//		model.addAttribute("board", boardDAO.getBoard(vo));
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "admin/admin_noticedetail";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	// 글 목록 검색
	@RequestMapping(value="/admin/getNoticeList")
	public String getadminNoticeList(NoticeVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("NTC_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
//		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//		if(pageNum < 1) {
//			pageNum = 1;
//		} else if(pageNum )
		
//		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
//		model.addAttribute("pageNum", request.getParameter("pageNum"));
		model.addAttribute("noticeTotal", noticeService.getNoticeTotal(vo));
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "admin/admin_noticeList";
	}
	
	@RequestMapping(value="/getNoticeList")
	public String getNoticeList(NoticeVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("NTC_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
//		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//		if(pageNum < 1) {
//			pageNum = 1;
//		} else if(pageNum )
		
//		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
//		model.addAttribute("pageNum", request.getParameter("pageNum"));
		model.addAttribute("noticeTotal", noticeService.getNoticeTotal(vo));
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "noticePage";
	}
}
