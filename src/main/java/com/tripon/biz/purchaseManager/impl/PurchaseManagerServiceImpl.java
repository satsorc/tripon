package com.tripon.biz.purchaseManager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.purchaseManager.PurchaseManagerService;
import com.tripon.biz.purchaseManager.PurchaseManagerVO;

@Service("PurchaseManagerService")
public class PurchaseManagerServiceImpl implements PurchaseManagerService{
	// PurchaseManagerService를 사용하는 Impl
	
	@Autowired
	PurchaseManagerDAOMybatis purchasemanagerDAO;

	@Override
	public List<PurchaseManagerVO> getPurchaseManagerList(PurchaseManagerVO vo) {
		return purchasemanagerDAO.getPurchaseManagerList(vo);
	}
}
