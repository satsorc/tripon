package com.tripon.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tripon.biz.purchaseManager.PurchaseManagerPagingVO;
import com.tripon.biz.purchaseManager.PurchaseManagerService;
import com.tripon.biz.purchaseManager.PurchaseManagerVO;

@Controller
public class PurchaseManagerController {
	// Service를 이용하는 Controller
	
	@Autowired
	PurchaseManagerService purchasemanagerservice;
		
	//Purchase 관리자 list
	@RequestMapping(value="/admin/purchase_manager")
	//해당 경로로 이동, 실행문
	public String getPurchaseManagerList(PurchaseManagerPagingVO pv, PurchaseManagerVO vo, Model model) {
		System.out.println("PurchaseMAnagerController의 출력문 : 관리자 페이지 list");
		
		// 페이징 처리
					String cntPerPage = "10"; 
					
					int total = purchasemanagerservice.getPurchaseManagerList(vo).size();
					//System.out.println("total: "+total);
					if (pv.getNowPage() == 0)  pv.setNowPage(1);

					pv = new PurchaseManagerPagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
					model.addAttribute("paging", pv);
					vo.setStart(pv.getStart()); //vo.setStart(0);
					vo.setListcnt(Integer.parseInt(cntPerPage)); //vo.setListcnt(5);
		
		model.addAttribute("puchaselist", purchasemanagerservice.getPurchaseManagerList(vo));
		return "/admin/purchase_manager";	
		}
}
