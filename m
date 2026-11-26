Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675595;
	b=eoo3FOYGfTJEnQNCfN9VN0PrkZRIHquFFFNvUqEM85pyAevv8sP9iVUXL4j70kvjZAI8
	 nav3iGIdd5E9xxlGQZ70BYXg3VmWgiEdSDxd3+0k9h6KH0rLn1/F/YsMfWqZZQUcVMxma
	 VOUr5cBsyeHizEuC1meSRzB6aEcZF1+E0nNmfL9ROXYZIsEoEzqmsM5hA+pgiu65dvwXW
	 lXruK1rB2BdotpvFSOQDgqDZz9rnKsZDp/ii0vta5JkMmD91enP/rJ/clYvmzuBbmOZl/
	 USVG2Z6cxEXOtBW44Yjb0jJtsKx07ae7JMcRm28Un+Sj76XUXgN7KG/XELvEYKNdWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675595;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yEnbomXSJ9BxsdyG+dAwkPx82pndbfCQql68LsbAq1M=;
	b=33QOYJ4sApbrzlHKb0gs8pct/rgWEmrHWTqWRxjrd6YCxT4i7Pvjz7QJoytHMhZlhFa6
	 /FmG7p5vSdas+fMgODi3JJ6qb998G/fqb7iZxbmF3AQIztnZJbislss5EAP2AFKS6xvL5
	 I2AlZFsJBBH4wVk2a44WCQPwNfjyweSSwpJbn9P1Z+M/pO8mEL2M+x3IM6Etr1idnTkEh
	 RrqpC0My5X/COSEQWrbXnga3NfT8X1DgYrZW1hbTQYNl5jwl4yNtPWdUFD3FZ7Z5lDfNU
	 7rWtutoJvpGv3BM9dWeQMxu5Xc9tOP8wIDxTeltMGd3N7lBIak5dlSplNt2j2CyPvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=motor-comm.com;
	spf=pass smtp.mailfrom=motor-comm.com;
	arc=none smtp.remote-ip=115.124.28.122
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FB606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motor-comm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motor-comm.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1474531|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0544402-0.0445491-0.901011;FP=16750328268831886801|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045038069;MF=frank.sae@motor-comm.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.kAQLT-w_1795675582;
Received: from motor-comm.com(mailfrom:frank.sae@motor-comm.com fp:SMTPD_---.kAQLT-w_1795675582 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:46:23 +0800
From: "Frank.sae" <frank.sae@motor-comm.com>
To: andrew@lunn.ch
Cc: hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com,
	jie.han@motor-comm.com
Subject: [PATCH net-next v5 0/1] net: phy: motorcomm: add YT8831 2.5G PHY basic support
Date: Thu, 26 Nov 2026 06:46:21 +0000
Message-ID: <20261126064622.2757584-1-frank.sae@motor-comm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5781d5a7-68e8-4837-8eb2-c47ec2f75507@lunn.ch>
References: <5781d5a7-68e8-4837-8eb2-c47ec2f75507@lunn.ch>
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

This is v5 series adding Motorcomm YT8831 2.5G PHY basic support.

The series only includes basic PHY driver now.
WoL and downshift features will be submitted as separate follow-up patches later, as Andrew suggested.

Patch 1: net: phy: motorcomm: add YT8831 2.5G PHY basic support

Changes v5:
- As suggested by Andrew, when in AUTO_BX2500_SGMII mode, modify phy->interface
  in .read_status to trigger host to handle media side correctly.
- Add YT8831_RSSR_TOP_SPACE definition for read/write_page access.

Tested on BPI-R3 with MediaTek SoC.

Thanks,
Frank.sae


Frank.sae (1):
  net: phy: motorcomm: add YT8831 2.5G PHY basic support

 drivers/net/phy/motorcomm.c | 370 +++++++++++++++++++++++++++++++++++-
 1 file changed, 368 insertions(+), 2 deletions(-)

-- 
2.43.0

