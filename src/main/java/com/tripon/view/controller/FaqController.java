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
import org.springframework.web.bind.annotation.SessionAttributes;
import com.tripon.biz.faq.FaqService;
import com.tripon.biz.faq.FaqVO;

@Controller
@SessionAttributes("faq")
public class FaqController {
	@Autowired
	private FaqService faqService;
	
//	String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	String realPath = "C:/user/swork/SpringFileUpload/src/main/webapp/img/";
	
	// 글 등록
	@RequestMapping(value="/insertFaq")
	public String insertFaq(FaqVO vo) throws IOException {
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
		faqService.insertFaq(vo);
		return "faq";
	}
	
	// 글 수정
	@RequestMapping(value="/updateFaq.do")
	public String updateFaq(@ModelAttribute("faq") FaqVO vo) {
//		boardDAO.updateBoard(vo);
		faqService.updateFaq(vo);
		return "faq";
	}
	
	// 글 삭제
	@RequestMapping(value="/deleteFaq.do")
	public String deleteFaq(FaqVO vo) {
		System.out.println("글 삭제 처리");
//		boardDAO.deleteBoard(vo);
		faqService.deleteFaq(vo);
		return "faq";
	}
	
	// 글 상세 조회
	@RequestMapping(value="/getFaq.do")
	public String getFaq(FaqVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
//		BoardVO vo1 = boardService.getBoard(vo);
//		vo1.setCnt(vo1.getCnt() + 1);
//		boardService.updateBoard(vo1);
		
//		model.addAttribute("board", boardDAO.getBoard(vo));
		model.addAttribute("faq", faqService.getFaq(vo));
		return "getfaq.jsp";
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
	@RequestMapping(value="/faq")
	public String getFaqList(FaqVO vo, Model model, HttpServletRequest request) {
		System.out.println("글 목록 검색 처리");
		
//		System.out.println("검색 조건 : " + condition);
//		System.out.println("검색 단어 : " + keyword);
		
//		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
//		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
//		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//		if(pageNum < 1) {
//			pageNum = 1;
//		} else if(pageNum )
		
//		model.addAttribute("boardList", boardDAO.getBoardList(vo));
//		model.addAttribute("searchCondition", vo.getSearchCondition());
//		model.addAttribute("searchKeyword", vo.getSearchKeyword());
//		model.addAttribute("pageNum", request.getParameter("pageNum"));
//		model.addAttribute("faqTotal", faqService.getFaqTotal(vo));
		model.addAttribute("faqList", faqService.getFaqList(vo));
		return "faqPage";
		
	}
	
	// 관리자 페이지 접속 테스트용 임시 컨트롤러 - 1차 통합 과정에서만 사용될 컨트롤러임.
	@RequestMapping(value="/admin/*", method=RequestMethod.GET)
	public String path01(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);
		
		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	@RequestMapping(value="/admin/*", method=RequestMethod.POST)
	public String path02(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);
		
		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	// POST 방식 테스트용 임시 컨트롤러 - 1차 통합 과정에서만 사용될 컨트롤러임.
	@RequestMapping(value="/*", method=RequestMethod.POST)
	public String path03(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);

		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	
}
