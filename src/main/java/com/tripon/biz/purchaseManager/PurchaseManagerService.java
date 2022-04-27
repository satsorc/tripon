package com.tripon.biz.purchaseManager;

import java.util.List;

public interface PurchaseManagerService {

	//Purchase 관리자 페이지 리스트
		List<PurchaseManagerVO> getPurchaseManagerList(PurchaseManagerVO vo);
}
