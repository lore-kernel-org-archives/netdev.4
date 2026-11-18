Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989699;
	b=VzIGwqDvxqaLFN1gmjw1OPzXTBgz8/mf+H0nfWX+urbkzR6/c2fRrLsZV2aZikhyHHGX
	 qUbB6IDkseUx4f8kfI83d1lHo4TNstuJQbrVivf2V+Vwx8pkGpOoGaYil/PfJh7i909BM
	 Ud52pTUF3LD82/JrC2xNsZP/CsK15QOAAkLhLDyxzLM1Exzr8SwFGTX0FtZvRNkForV93
	 Tn9HoMc4196THfzIcrm9TZ6bFMC81wmL9sYQHabUiyZ26DzQOMphZuj+s9J/VrQaogy1L
	 OIk4slKbWblsddfBwPtmkQFojankbSuXlbhc6i6AbEatbDN8bgYKdW10anI3qHSCycw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989699;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dOM/DNQphiAYm6I3sUrpFEyKdxf588aOPTeJC3QXirE=;
	b=c6KT4cJx7qin3mX1arA1qH32X2E5TCoRHO8Obs3ALBXXHzd2dD49wyHFvIQevpghXDGF
	 GdklVStw1rRfMJRmBaN7VMpEzJqz8pcq+imC+RT18dkhrDumfJXxp+8yGcvyXLL4thsYt
	 xLtf8xkfqpjxK2gnHDW4Al1Xsibq33uKxuweAD7cRcgIO5pJXqH3bAjSLusc2LQwkZL0U
	 sSsvEioIo9WzU9NRiLIyPd5ne357VwbCLy8qAJJMEqnFPN1Q2Uf2N7SACrzSxyTbDfKKh
	 3lCTYsZZxZgw+3YYSX+YOJrPv8TTQEJz0YlnzFoNYmitq/G4fDRCTX6nF7xwtmf8uig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B3606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317B3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: esmtpsz10t1794989623t41dcda9d
X-QQ-Originating-IP: S3wR3iMpbUW2KlIp6pBcbW4JCuGfJhT0qX1Nch0pi6M=
Received: from localhost.localdomain ( [115.204.248.161])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 16:13:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5507898589919388373
EX-QQ-RecipientCnt: 13
From: Mengyuan Lou <mengyuanlou@net-swift.com>
To: netdev@vger.kernel.org
Cc: jiawenwu@trustnetic.com,
	duanqiangwen@net-swift.com,
	linglingzhang@net-swift.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	hramamurthy@google.com,
	jacob.e.keller@intel.com,
	przemyslaw.kitszel@intel.com,
	Mengyuan Lou <mengyuanlou@net-swift.com>
Subject: [PATCH net v8 0/2] net: wangxun: protect ring accesses with RCU
Date: Wed, 18 Nov 2026 16:13:27 +0800
Message-Id: <20261118081329.39551-1-mengyuanlou@net-swift.com>
X-Mailer: git-send-email 2.30.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OZoK8I5s/zCBeppDec0U6sHwbr07FJhIG1gIPtBF7ar7rT0iojFNa9+4
	ynYDUURVwHG3y7wjf6h153qEQd1sZyDMETv+Z5DYID6BM1coopVSWIC5Xn7YhGI2bfBKq9o
	Qk2kQ51XE8ZV9Y2iEggG9CVsqB2EViUmFiqurpuE5bw82Ejt1tDaG0gIwKFMNQlpJO7w8De
	3wUO1XqbbRsorzJcNqhyCEsXwEkPmtAYyJtqdtkP/HGm9tqlrNu0n9hsGHAn3Q9a4USIfLr
	z22zrMrZqLxQI3R6UITVDTlWru112Bb47sLFBAOtj5go2n3V80YTNc6nLhtzkZEHox2Olh3
	VqMGS3K8xP+Whu4QdWbdyVCtDpDe1IJ2RjmVdxDp4AnIcxtKdP1q60uSR4NavUxEgXhURGn
	1Wsb1o5ieJlqtWXE/GZk+hhmFkJ16jqsGe8VRWnCZrdn24kYuonTRZ9+Pv3mQBmTqHyj/Wr
	2ksFw06iQXYOExEWHwI5JINRygXrsFudEWPUcInKvVRJIQJvlzhxEuTljYwWLko5x7RWLKt
	NJvfUTi3pUGoltI2XnOz+hkwI2IvZLUVZ53pTOjMk/ezXJm/LgIBXcUxAwnfhLamLCKzb0L
	MvoRfmA5ek602u3ObGqsrWfBQ5x7diGyEj2GWa/8et23XLmbQTxvuhNYKNegUIFuuhFZizi
	AtSPGrBcWvV8q/NjnhScc8LBEJa4Hgcqt1XCOMqG+JT775bwk1WSwPsIN5raLwql9YsceU/
	eW6sd8LhWbEWsLckLZ7Njun3BX9zWdqxLypHeW0Hbhe7e/DCKdswSmn3pCsBxohKzyIDfds
	eArW/bzm6x8qXrbKDPJEOERcMUVghFskCFoI+bio2V9B9Ta/xqlRQWKMObw73Ls5WCXjjiq
	BMEOPuuiJS2Gvl+YHbT8zhS4LplYZlEeIOqxKtm6JDIVXWGOFKZrVb7YNyWvM3mJPvRINxz
	PlvYLA4oinAXXiLrtDXvIRHXz0vwIOL+CYrz8AHOOQOpvbnsLV+G7HzRE20nW15rESeYO3O
	4B7CSHR23Ibv55IHbkyfHb4Fdl2uRcy525PDiQd2947xXidL5RpRo1EdO42pg9Y2Nb5lDwN
	mdJj2KS1wFC7cZl/OKmfxSDSGEe17DhpLRgSLLFqeiDWwo7l3nyTkK7vQdpBpUxMjBs5Ngy
	IvubFk75GHVVx2I=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

This series protects Wangxun ring-array accesses during interrupt-scheme
reconfiguration.

Patch 1 converts ring-pointer access to RCU and initializes reg_idx before
publishing each ring. Patch 2 pairs lockless queue-count reads and writes
so readers remain safe while queue vectors are torn down or rebuilt.

Changelog:
v8:
  - Split queue-count access updates into a separate patch.
  - Initialize reg_idx before ring publication while preserving RSS/VMDQ
    queue-to-register mapping.
  - Pair lockless queue-count reads and writes across setup, teardown,
    allocation-error handling, and VF queue setup.

v7: https://lore.kernel.org/all/20260928085443.14595-1-mengyuanlou@net-swift.com/

Mengyuan Lou (2):
  net: wangxun: protect ring accesses with RCU
  net: wangxun: access queue counts consistently

 drivers/net/ethernet/wangxun/libwx/wx_err.c   |  25 ++-
 .../net/ethernet/wangxun/libwx/wx_ethtool.c   |  10 +-
 drivers/net/ethernet/wangxun/libwx/wx_hw.c    |  90 +++++++---
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   | 164 ++++++++----------
 drivers/net/ethernet/wangxun/libwx/wx_ptp.c   |  11 +-
 drivers/net/ethernet/wangxun/libwx/wx_type.h  |  12 +-
 .../net/ethernet/wangxun/libwx/wx_vf_common.c |   2 +-
 .../net/ethernet/wangxun/libwx/wx_vf_lib.c    |   7 +-
 .../net/ethernet/wangxun/ngbe/ngbe_ethtool.c  |   4 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c |  11 +-
 .../net/ethernet/wangxun/ngbevf/ngbevf_main.c |   4 +-
 .../ethernet/wangxun/txgbe/txgbe_ethtool.c    |   6 +-
 .../net/ethernet/wangxun/txgbe/txgbe_fdir.c   |   2 +-
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |   4 +-
 .../ethernet/wangxun/txgbevf/txgbevf_main.c   |  10 +-
 15 files changed, 215 insertions(+), 147 deletions(-)

-- 
2.30.1

