Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067818;
	b=2kj1QDYZHVJcVvGKNzoADnwZOSvCRSz6LMNqNxWpX1jWFARjE0UUn+D0mtH+dY6EMepD
	 x0wIUCOrF1tyjzUg0YunS7X2H6IUIgT6QjZF5kRxMbn+PIb7trAftSDCzaxYxlQNlKeWl
	 N1rpkdk2iMWStVGP6B6mWsLrrJ9SeElOmmxGePI8LUiFzmB61ae9ova/jUkxP8RXePMM5
	 ibray1GxELIcpgbhzG3L2falKAzVf/lpRmJRUeuDK3jXu+U4KUlhzuYBU8B+oA/snT/KZ
	 Itv9k6TVf5JAwOn8/atPaZJJSIOXT3hJ7pGCQHpPA4SokPt6rHWmVgM0SjUVInoPLDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067818;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z4MaBHLABjCqpazSVIunmD9c7XUfYpWzptuAIYXu0U8=;
	b=ByktfcYx5mMmKFpPuiND9KioqHkJ64P9k6Egx1m704zTbjS4x/EyfhREEzooL/p3D+Fd
	 +qUselfqUR9iro61Lf4W3oPjYUzbvMEAhfL8dCxG8uksv4XwNo4ehWrIoA5ABVIz8xa9l
	 Cr+nDKU1JPRSQ1HXPsuDAs33aVuYEUXugI183j3Bxbta1/e6y8Cz+Wy49g+bRKYsyB1GM
	 Ap28XTzz++RFcGYabnIIbYy0C5rgbnhsQCZbxHmAdbe5VbhsWm/MY+7w78/wKEr+PRFZD
	 OTeS/Eag/q0YK0hcyhvODAO459LU+UmuZCPNuBSSKF4riwLNlZ5NZazwVXEZ0CQDFRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=motor-comm.com;
	spf=pass smtp.mailfrom=motor-comm.com;
	arc=none smtp.remote-ip=115.124.28.97
Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26386606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26386606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motor-comm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motor-comm.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1100451|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0194592-0.00526744-0.975273;FP=5796991001126557591|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=frank.sae@motor-comm.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k5WUhIa_1795067805;
Received: from motor-comm.com(mailfrom:frank.sae@motor-comm.com fp:SMTPD_---.k5WUhIa_1795067805 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 13:56:45 +0800
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
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY support
Date: Thu, 19 Nov 2026 05:56:45 +0000
Message-ID: <20261119055645.653216-1-frank.sae@motor-comm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118033539.36633-1-frank.sae@motor-comm.com>
References: <20261118033539.36633-1-frank.sae@motor-comm.com>
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

> Please break the patch up. Add basic support as a patch, then
> downshift and WoL as additional patches.
>
> The WoL code looks wrong, i don't see any calls to
> device_may_wakeup(), device_set_wakeup_capable() etc.
>
> What exactly is AUTO_BX2500_SGMII and how does it differ from SGMII?

Hi Andrew,

Thanks for your review.

I have split the submission:
This v4 only contains basic YT8831 PHY support.
Downshift is not implemented for YT8831 at this time.
WoL support is removed from this series; I will fix the wakeup API handling
(device_set_wakeup_capable() / device_may_wakeup()) and send WoL as a separate follow-up patch later.

AUTO_BX2500_SGMII is YT8831 chip-specific mode:
When operating in AUTO_BX2500_SGMII mode, the YT8831 adjusts the PHY media side to 2500-BaseX or SGMII based on the connection speed on the PHY UTP side.
1. Media: 2500BX – UTP: 2.5G
2. Media: SGMII – UTP: 1000M/100M/10M
Differnece from SGMII is it also includes the 2500-BaseX mode, which is switched automatically.

The v4 basic support patch will follow shortly.

Frank

