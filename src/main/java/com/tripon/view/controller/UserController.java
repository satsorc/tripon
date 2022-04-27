package com.tripon.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripon.biz.user.PagingVO;
import com.tripon.biz.user.UserService;
import com.tripon.biz.user.UserVO;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "MEM_ID");
		conditionMap.put("이름", "MEM_USERNAME");
		conditionMap.put("닉네임", "MEM_NICKNAME");
		return conditionMap;
	}
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		System.out.println("/ 컨트롤러");
		return "/index";
	}
	
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String indexView() {
		System.out.println("/index 컨트롤러");
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping(value="/loginIndex", method=RequestMethod.POST)
	public String loginIndex(HttpServletResponse response, UserVO vo, Model model, HttpSession session) {
		
		System.out.println("/loginIndex 컨트롤러");
		
		UserVO uv = userService.getMemLogin(vo);
		
		/* ● null 을 가지고 출력을 하면 오류가 나죠~ 그러니 주석!
		 *   System.out.println(uv.getMem_id()); System.out.println(uv.getMem_pw());
		 *   System.out.println(uv.getMem_is_super());
		 */
		
		if(uv == null) {
			System.out.println("일치하는 회원이 아님 - 로그인실패");
			model.addAttribute("error", "1");
			session.invalidate();
			return "/login";
			
		} else {
			if(uv.getMem_is_super().equals("N")) { // ▶▶ 사용자
	
				System.out.println("사용자 입니다.");
				// model.addAttribute("user", uv);
				
				
				// ▶ 회원정보 세션 설정
				session.setAttribute("userId", uv.getMem_id());       
				session.setAttribute("userName", uv.getMem_username());  
				
				// ▶ 세션 유지시간 설정
				// session.setMaxInactiveInterval(1800); // 1800 = 60s*30 (30분)
				
				return "redirect:/index";
			
			}  else if(uv.getMem_is_super().equals("Y")) { // ▶▶ 관리자
				
				System.out.println("관리자 입니다.");
				// model.addAttribute("admin", uv);
				

				// ▶ 회원정보 세션 설정
				session.setAttribute("userId", uv.getMem_id());       
				session.setAttribute("userName", uv.getMem_username());  
				System.out.println("uv.getMem_username(): "+ uv.getMem_username());
				
				// ▶ 세션 유지시간 설정
				// session.setMaxInactiveInterval(1800); // 1800 = 60s*30 (30분)
				
				return "redirect:/admin/manager_index";
			 } 
		}
		
		return null;
	}
	
	
	@RequestMapping(value="/admin/manager_index", method=RequestMethod.GET)
	public String manager_index(){
		System.out.println("관리자페이지");
		return "/admin/manager_index";
	}
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		
		System.out.println("로그아웃");
		
		session.invalidate();
		session = null;
		
		return "redirect:/logoutEnd";
	}
	

	@RequestMapping(value="/logoutEnd")
	public String logoutEnd() {
			
			System.out.println("로그아웃End");
			
			return "/login";
			// return "redirect:index.jsp";
	}
	
	
	@RequestMapping(value="/kakaoLogin")
	public String kakaoLogin(UserVO vo, HttpSession session) {
		
		System.out.println("카카오 로그인 컨트롤러");
		
		System.out.println("아이디 : " + vo.getKakao_mem_id());       // 2211134235
		System.out.println("비밀번호 : " + vo.getKakao_mem_pw());      // 2211134235
		System.out.println("닉네임 : " + vo.getKakao_mem_nickname()); // 쫄리✨
		System.out.println("이메일 : " + vo.getKakao_mem_email());    // undefined
		
		
		// 카카오로그인 있는 회원인지 조회 
		// SELECT * FROM MEMBER WHERE MEM_ID=#{kakao_mem_id}
		UserVO uv = userService.getKakaoMemId(vo);
		
		// 없으면 데이터베이스에 인서트
		if(uv==null) { 
			// ▶ 이메일이 없는 경우  → 아이디, 비번, 닉네임 , 플래그
		    if(vo.getKakao_mem_email().equals("undefined") || vo.getKakao_mem_email() == null || vo.getKakao_mem_email() == "") { 
				
		    	// 닉네임이 없을 경우 → 랜덤수 인서트 시킴
		    	// 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 X)
		    	if(vo.getKakao_mem_nickname().equals("undefined") || vo.getKakao_mem_nickname() == null || vo.getKakao_mem_nickname() == "") { 
		    		System.out.println("▶ 이메일이 없는 경우  → 닉네임이 없을 경우 → 랜덤수 인서트 시킴");
					// insert into member (MEM_ID, MEM_PW, MEM_NICKNAME, MEM_FLAG) values (#{kakao_mem_id}, #{kakao_mem_pw}, UNIX_TIMESTAMP(), 'kakao')
		    	
		    		userService.insertKakaoMem_ex_nx(vo);
		    		
					session.setAttribute("userId", vo.getKakao_mem_id());       
					session.setAttribute("userName", vo.getKakao_mem_nickname());  
		    		
					return "redirect:/index";
		    		
				} else { // 닉네임이 있을 경우 
					// 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 O)
					System.out.println("▶ 이메일이 없는 경우  → 닉네임이 있을 경우");
					// insert into member (MEM_ID, MEM_PW, MEM_NICKNAME, MEM_FLAG) values (#{kakao_mem_id}, #{kakao_mem_pw}, #{kakao_mem_nickname}, 'kakao')
					
					userService.insertKakaoMem_ex_no(vo);
					
					session.setAttribute("userId", vo.getKakao_mem_id());       
					session.setAttribute("userName", vo.getKakao_mem_nickname());  

					
					return "redirect:/index";
				}
		    	
		    	
		    	
			} else { // ▶ 이메일이 있는 경우  → 아이디, 비번, 닉네임, 이메일 , 플래그
				
		    	// 닉네임이 없을 경우 → 랜덤수 인서트 시킴
				// 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 X)
		    	if(vo.getKakao_mem_nickname().equals("undefined") || vo.getKakao_mem_nickname() == null || vo.getKakao_mem_nickname() == "") { 
		    		System.out.println("▶ 이메일이 있는 경우  → 닉네임이 없을 경우 → 랜덤수 인서트 시킴");
					// insert into member (MEM_ID, MEM_PW, MEM_NICKNAME, MEM_EMAIL, MEM_FLAG) values (#{kakao_mem_id}, #{kakao_mem_pw}, UNIX_TIMESTAMP(), #{kakao_mem_email}, 'kakao')
		    		
		    		userService.insertKakaoMem_eo_nx(vo);
		    		
					session.setAttribute("userId", vo.getKakao_mem_id());       
					session.setAttribute("userName", vo.getKakao_mem_nickname());  

		    		
		    		return "redirect:/index";
					
				} else { // 닉네임이 있을 경우
					// 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 O)
					System.out.println("▶ 이메일이 있는 경우  → 닉네임이 있을 경우");
					// insert into member (MEM_ID, MEM_PW, MEM_NICKNAME, MEM_EMAIL, MEM_FLAG) values (#{kakao_mem_id}, #{kakao_mem_pw}, #{kakao_mem_nickname}, #{kakao_mem_email}, 'kakao')
					
					userService.insertKakaoMem_eo_no(vo);
					
					session.setAttribute("userId", vo.getKakao_mem_id());       
					session.setAttribute("userName", vo.getKakao_mem_nickname());  
					
					return "redirect:/index";
					
				}
				
			} 
		    
		} else { // 계정이 있는 회원이면
			
			// ▶ 회원정보 세션 설정
			System.out.println("아이디" + vo.getKakao_mem_id());
			System.out.println("닉네임"+ vo.getKakao_mem_nickname());
			session.setAttribute("userId", vo.getKakao_mem_id());       
			session.setAttribute("userName", vo.getKakao_mem_nickname());  
			
			return "redirect:/index";
		}
		
	}
	
	
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVO vo, Model model) {
		System.out.println("/join 회원가입 2단계 컨트롤러");
		
		userService.insertMem(vo);
		
		model.addAttribute("user", vo);
		
		return "/sign3";
	}
	
	
	
	@RequestMapping(value="/idCheckServlet", method=RequestMethod.POST)
	@ResponseBody
	public int idCheckServlet(UserVO vo) {
		System.out.println("/아이디중복체크 컨트롤러");
	
		System.out.println(vo.getMem_id());
		
		int idcheck = userService.idCheck(vo);
		
		System.out.println(idcheck);
		
		return idcheck;
	}
	
	
	
	@RequestMapping(value="/findID2", method=RequestMethod.POST)
	public String findID(HttpServletResponse response, UserVO vo, Model model) {
		
		System.out.println("이름 : " + vo.getMem_username());
		System.out.println("번호01 : " + vo.getMem_phone_01());
		System.out.println("번호02 : " + vo.getMem_phone_02());
		System.out.println("번호03 : " + vo.getMem_phone_03());
		
		UserVO uv = userService.getMemId(vo);
		System.out.println("===============================");
		System.out.println(vo.toString());
		System.out.println("===============================");
		
		if (uv != null){
			System.out.println("null 아니면");
			model.addAttribute("user", uv);
			return "/findID2";
			
		} else {
			System.out.println("null");
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out;
			try {
				out = response.getWriter();
		        out.println("<script>alert('일치하는 회원정보가 없습니다.'); history.go(-1);</script>");
		        out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	@RequestMapping(value="/findPW2", method=RequestMethod.POST)
	public String findPW(HttpServletResponse response, UserVO vo, Model model) {
		
		UserVO uv = userService.getMemPw(vo);
		
		if (uv != null){
			System.out.println("null 아니면");
			model.addAttribute("user", uv);
			return "/findPW2";
			
		} else {
			System.out.println("null");
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out;
			try {
				out = response.getWriter();
		        out.println("<script>alert('일치하는 회원정보가 없습니다.'); history.go(-1);</script>");
		        out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	// 일반 회원 목록
		@RequestMapping(value="/admin/userList")
		public String userList(PagingVO pv, UserVO vo, Model model) {
			
			// 페이징 처리
			String cntPerPage = "10";
			int total = userService.countUser(vo);
			if (pv.getNowPage() == 0)  pv.setNowPage(1);

			pv = new PagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart()); //vo.setStart(0);
			vo.setListcnt(Integer.parseInt(cntPerPage)); //vo.setListcnt(5);
			
			// 검색 기능
			if (vo.getSearchCondition() != null) vo.setSearchCondition(vo.getSearchCondition());
			else vo.setSearchCondition("MEM_ID");
			
			if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
			else vo.setSearchKeyword("");
			
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			
			
			
			model.addAttribute("userList", userService.getUserList(vo));
			return "/admin/userList";
			
		}
		
		// 일반 회원 조회
		@RequestMapping(value="/admin/userUpdate", method=RequestMethod.GET)
		public String userUpdateView(UserVO vo, Model model) {
			System.out.println("/userUpdate");
			
			model.addAttribute("userOne", userService.getUserOne(vo));
			
			return "/admin/userUpdate";
		}
		
		// 일반 회원 수정
		@RequestMapping(value="/admin/userUpdate", method=RequestMethod.POST)
		public String userUpdate(UserVO vo, Model model) {
			
			userService.userUpdate(vo);
			
			return "redirect:/admin/userList";
		}
		
		// 일반 회원 삭제
		@RequestMapping(value="/admin/deleteUser", method=RequestMethod.GET)
		public String userDelete(UserVO vo, Model model) {
			
			userService.userDelete(vo);
			
			return "redirect:/admin/userList";
		}
		
		// 관리자 목록
		@RequestMapping(value="/admin/adminList")
		public String adminList(PagingVO pv, UserVO vo, Model model) {
			
			// 페이징 처리
			String cntPerPage = "10";
			int total = userService.countAdmin(vo);
			if (pv.getNowPage() == 0)  pv.setNowPage(1);

			pv = new PagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart()); //vo.setStart(0);
			vo.setListcnt(Integer.parseInt(cntPerPage)); //vo.setListcnt(5);
			
			// 검색 기능
			if (vo.getSearchCondition() != null) vo.setSearchCondition(vo.getSearchCondition());
			else vo.setSearchCondition("MEM_ID");
			
			if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
			else vo.setSearchKeyword("");
			
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			
			model.addAttribute("adminList", userService.getAdminList(vo));
			
			
			return "/admin/adminList";
			
		}
		
		
		// 관리자 조회
		@RequestMapping(value="/admin/adminUpdate", method=RequestMethod.GET)
		public String adminUpdateView(UserVO vo, Model model) {
			
			model.addAttribute("adminOne", userService.getAdminOne(vo));
			
			return "/admin/adminUpdate";
		}
		
		// 관리자 수정
		@RequestMapping(value="/admin/adminUpdate", method=RequestMethod.POST)
		public String adminUpdate(UserVO vo, Model model) {
			
			userService.adminUpdate(vo);
			
			return "redirect:/admin/adminList";
		}
		
		
		// 관리자 등록
		@RequestMapping(value="/admin/adminInsert", method=RequestMethod.POST)
		public String adminInsert(UserVO vo, Model model) {
			
			userService.adminInsert(vo);
			
			return "redirect:/admin/adminList";
		}
		
		// 관리자 삭제
		@RequestMapping(value="/admin/deleteAdmin", method=RequestMethod.GET)
		public String adminDelete(UserVO vo, Model model) {
			
			userService.adminDelete(vo);
			
			return "redirect:/admin/adminList";
		}
	
	
	
	
	@RequestMapping(value="/*", method=RequestMethod.GET)
	public String path(HttpServletRequest request) {
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
