Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597440;
	b=brhJpeynA8BrLAPs5BWDd5MphgIptjEYQai//7ROP3zPy06sq4Sl6/T4UTWMkT+uycZ3
	 /1UhF91mRuH0dl1LRXLX6DS/ON+xmLlSwL/0yYhJ6LecOL9m/Wyu9i/3H2g5tkW5Agtbc
	 0TY5VjMbJNH0E0FQGaBJQloWD7Vnx2xil8SsOHb2OLiOtnF3+Z19s820SMHbnQmzs7pAD
	 1RWYlnTImidtvyn5rkT3rlXZh1mZ7AaCLCZ3ldMBkF2vTpxhDnFuP0H9Z2nD/pHC2D3yI
	 Rq9yIfYeGFCdhCWdYayRiyo1LBBIXJGVrSseQTHeaDr+DalGa6ASEUeR/IZzhOvDyhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597440;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=MVBydwRcG6MGXgYOnie0k6yGtkab2A/hQX2IXRDfl+w=;
	b=unyyN7Sm+sVcMY9k4z8GoaRDeF5xYIW8R3JmwtQPJgK6SmxsZOr632d0UZtmaei89sl+
	 O2nFmBNdufzRodrtaxRX+JKHECNv4Yg1wrYCgnJbj/MDDayUO3Kpf6jR2lgsQdzrDbWJE
	 eM0/UMLgoImVmg6OtyTYLeOvpQ/Le7XWvRbxU2nABZhmuTf9bS9kRUQ5G6qiLq4KPrAbX
	 BRxxC5PaJZto1f09P7kfP/nc9aL26dsjNB34GeLsNlBw9PrvhtCEUWdAFqRPTUi6CtNpe
	 fXe6yxE/+d6YPrOSpKBQaM8hdh4mDjHifMRxI4Bg0zmoUEi2jUl5FqV6Y9LH1+KY//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=pv5jtlwf;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FE2606A32C;
	Wed, 25 Nov 2026 09:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=pv5jtlwf
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP92IvxC3330654, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1795597338;
	bh=MVBydwRcG6MGXgYOnie0k6yGtkab2A/hQX2IXRDfl+w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=pv5jtlwfQNYNRDrXCbPMUHNxF5DrDJRAV9y4Mj37Zd/KZODnTb6Aj4li3dEaQKjIx
	 qkPee0dJK0pDHs7Atgk7qqelJbGSTHoqk7knrws4pAXH4ZpjNvkB6Rtry/dFTWS6qw
	 UmMpIi72PJ9Pa470N4FtRu8fzzGjH6VgzWPU3FJeP4EKgwKSBbK09Zp1/oDqzbtRav
	 lT4ZJbt01MwmWw2Fp2zEQOcMmEyiCZgd5F9lE5p3rZ/7MQUt94/x+eVctDOsd/+TO5
	 0+aYn1phpjGddkTFn4zirXrEcqXBvbN0hzkgF1uJ4a81Y1q0dirIf1X1W6MwTxARqP
	 m9XT8TKazWvPg==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP92IvxC3330654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 17:02:18 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 17:02:18 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Wed, 25 Nov 2026 17:02:18 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v4 0/3] net: phy: realtek: add PTP support for RTL8127a
Date: Wed, 25 Nov 2026 17:02:13 +0800
Message-ID: <20261125090217.1198-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
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
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

The PTP block of the RTL8127A resides in its internal PHY (RTL8261C).
Therefore, this series adds PTP support to the Realtek PHY driver
instead of the r8169 MAC driver.

Javen Xu (3):
  r8169: hold MDIO bus lock while loading firmware
  net: phy: realtek: add PTP clock support for RTL8127a
  net: phy: realtek: add hardware timestamping for RTL8127a

 drivers/net/ethernet/realtek/r8169_main.c |   5 +
 drivers/net/phy/realtek/Kconfig           |  13 +
 drivers/net/phy/realtek/Makefile          |   1 +
 drivers/net/phy/realtek/realtek.h         |  25 +
 drivers/net/phy/realtek/realtek_main.c    |  25 +-
 drivers/net/phy/realtek/realtek_ptp.c     | 829 ++++++++++++++++++++++
 6 files changed, 897 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/realtek/realtek_ptp.c

-- 
2.43.0

