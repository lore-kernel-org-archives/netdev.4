Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067998;
	b=ZO/xfF3qaEvndNPvwCnEQY4mqP9d1AGWM94Tbp1i7yX6w+V61+MhwLuR7+0UKbsSVKxX
	 T3w4iLwZp3nnvaxJ9B5oX6JmWbvs3/q4PNDPrMZBB+Q1LjzXrtm5bjPGSHjQomxlmtJTb
	 tGCctlHf51d37RIPenJCF0CkdahbHOJCLlAPAAOmQ9zrWFg/xDIEseoiy8S8LRHUaT7IE
	 A69DNxWCuLiC8OyIrxg8yHHZqU+inMKOaxs7Hv0d3wMvk+bg2WGQAdE5NzIeHxLO44+07
	 VyRMu1cuFIZR03kLOYDJDwDyPSmFu0mJL1V7fkuV8Qh6/LHAxNoDf3kAaTeIWi80InA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067998;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dRaSS/oJTqhKCs3Rynzpoee8Q2MJKYtV0BSFSheD4u4=;
	b=mNb7fJ6Ub/4cOaJeHD99Xb+yP4AI+zx2pVu6M1gEY2g9WNJh4c9OA+612OxXZnQhwRbB
	 xcntT/izg4cvxCVqMIjkde1525P/HaCOdd4xLWHQ405bQfFFCdhKyjqoDGANCT+LEfTwL
	 RkJeiaVNBMlearHSJ3hwlh86HbsFCaT0OO0LspNE0ZxhwRfPpkqfwlOPLRIM2IsqQ6Sq6
	 Jfi8cxae2L6nusJ2hEmIyul40YiAtk0hoxpWcZJ01Oe6KhWfWBTJBUHrqO5d97wAZAPcy
	 gydDE/0quk1NiEmQvu1/A/7uFeg3p21kDNanrfkQM9CAnYTtvOZxmv1uYIhINVASPsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=motor-comm.com;
	spf=pass smtp.mailfrom=motor-comm.com;
	arc=none smtp.remote-ip=115.124.28.217
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519A606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1519A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motor-comm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motor-comm.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.237165|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.120113-0.0315384-0.848349;FP=8102288609625296279|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=frank.sae@motor-comm.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k5P.6H8_1795067987;
Received: from motor-comm.com(mailfrom:frank.sae@motor-comm.com fp:SMTPD_---.k5P.6H8_1795067987 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 13:59:48 +0800
From: "Frank.sae" <frank.sae@motor-comm.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	davem@davemloft.net
Cc: netdev@vger.kernel.org,
	lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com,
	jie.han@motor-comm.com
Subject: [PATCH net-next v4 0/1] Add basic support for Motorcomm YT8831 2.5G
Date: Thu, 19 Nov 2026 05:59:46 +0000
Message-ID: <20261119055947.653568-1-frank.sae@motor-comm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes from v3:
- Split out WoL support; WoL needs wakeup framework fixes and will be sent as a follow-up separate patch
- Downshift is not implemented for YT8831 at this moment

AUTO_BX2500_SGMII explanation:
When operating in AUTO_BX2500_SGMII mode, the YT8831 adjusts the PHY media side to 2500-BaseX or SGMII based on the connection speed on the PHY UTP side.
1. Media: 2500BX – UTP: 2.5G
2. Media: SGMII – UTP: 1000M/100M/10M
Differnece from SGMII is it also includes the 2500-BaseX mode, which is switched automatically.

Frank.sae (1):
  net: phy: motorcomm: add YT8831 2.5G PHY basic support

 drivers/net/phy/motorcomm.c | 395 +++++++++++++++++++++++++++++++++++-
 1 file changed, 393 insertions(+), 2 deletions(-)

-- 
2.43.0

