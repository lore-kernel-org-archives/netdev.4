Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509652;
	b=awbBUYl1WjZSFNc2EFRAa0lKsMmkLLBDW0jR3ZJLWxNR9DPKeHCnGMXv3jAiXnmaFHIq
	 ZYcaV9NNhaOPgemXY15ujUpnQ8B3HsjdC5UUdVHYdZfpAvQpCV5kfHILYcy4nqAZ250Xr
	 n+Nixa2XwaSoW2Ief1bTwY2HqTnjR2966kVt+frV4GBzUj6SghjtFyx8Lzta5dfG8mJhm
	 cqIznfjZZ7BUYcrNSCUr6zujJ4D+k6b1o0ZneSHWfS5B9MWKyvapYlICd4Szw9r5/DVmP
	 oVYYl1xnFomMVq72/VowCZ/aFFomH6X5r6I7UAV4VNPRvhZ2JL1o7Nd8db2mdEQbEAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509652;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yBAvRyWbL7QUO9pLfGWUQb/VkfBPAgOVLK0jSI/x4B0=;
	b=TwnnrdYDcPYm8tSaW3o4yoYe4QVBGEcv5lGFC3fkepIYkvhHRD4nBL9we0XJ3EM8TqYs
	 53A3mcRi4CNn4hO8cBGrty53O57w8fl9pirVz6/o8vtwmEc/tT5mxOTTPhBK3yfEk1JZj
	 ZV5flpKScWUdLOV0vO4MO09QtLvD+vw9xF4m6M4DuAOBva+re3/7q0gbbIJs4SH61qUAF
	 pmMAOFco/NWzhQfGIIqsZaNPsNDIBFrC/5Nu2pVJxHdUmW9ZxHhKllr7NWAdAKuavp0HX
	 BdzZG7u36frHCVL4sHv9vKrncyitiVXUWO3tHyHv19jjeWDVPwRMc/HpBZw//f5GbvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=mlAKOURw;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E480606A334;
	Tue, 24 Nov 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E480606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=mlAKOURw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yB
	AvRyWbL7QUO9pLfGWUQb/VkfBPAgOVLK0jSI/x4B0=; b=mlAKOURwjdkYdHmb4C
	V5KSIpAysT9gwBPfcYINCZOLAIuVoU1bbiwtB7WLp/cxNYauEIxkJJTCq9UPD5Ca
	yfmZzXaEpmto3g8T2IxGXznnnhFeAoLS50dkfNccFhb0SdmVZWhJxJZLHsSzj2WD
	So9rYMF0Ky+6v6if7UspVbO6M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz8ZaTQVrdmcGEA--.40280S2;
	Tue, 24 Nov 2026 16:39:55 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	rosenp@gmail.com,
	jacob.e.keller@intel.com,
	daniel.machon@microchip.com,
	chunkeey@gmail.com,
	kees+treewide@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v2 2/2] net: ibm: emac: read the fixed-link status before adjusting the link
Date: Tue, 24 Nov 2026 16:39:52 +0800
Message-Id: <20261124083952.2480442-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e20245d2-f771-4708-89f3-46c9de1d2d81@lunn.ch>
References: <20261123093201.770552-1-xiaolinkui@126.com> <20261123093201.770552-3-xiaolinkui@126.com> <e20245d2-f771-4708-89f3-46c9de1d2d81@lunn.ch>
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
X-CM-TRANSID:PykvCgDnz8ZaTQVrdmcGEA--.40280S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU05rcDUUUU
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlRuFXGsFTVthlgAA3Y

Hi Andrew,

Thanks for the review. Both of your mails arrived after v2 went out, so
2/2 still carried the phy_read_status() that the other one rules out.

> As i said in the comments to the previous version, this is wrong.

2/2 is dropped in v3 and the series is one patch again, keeping the
phy_disconnect() / of_phy_deregister_fixed_link() teardown from v2 1/2.
The link status is now read by the phylib state machine rather than by
the driver.

Answered in more detail in my reply to your other mail.

Thanks,
Linkui

