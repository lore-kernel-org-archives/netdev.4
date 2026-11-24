Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503039;
	b=n2Fk8SBpIsp3+Ed+LWcU7lHJIevoiCmeZzWlzMVOlvdUWjbXH3wHSihqF4oXolGdfWDE
	 pCSlPdVrQhiYLlOxcjXRVEeBjnyWmhoqmgNS60s1xGHYREOIcfAlSCPA+3vFNzDQlKj8p
	 oSk/5LE3yK+YA7lTN2Onpt8813EYYyUH8P9cpE9my7aVJS0xiArHQlEKX8DByB6UBaKgT
	 A9JRe6cYNEfFkB1icppP4egyIJlkQ1gPDk7lAhywUYsfCnjcxK1EhXQdJsHehwMgWCUr2
	 6VE592V3chKZeOlT7h750u1mW0ELF6vWcw4azHwDdLmKkOv+IO91hznLdSAz1D82pqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503039;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=GIvRsEhrFPMppFy4C588lx5uDuX9Ly+cJp5pXzfJrig=;
	b=pmyUgkMGBzRNVKBndXvNHrr+eiqwQlb5pECuAmGa9QKFIpaktblPBliw4TIs5oM1IChz
	 CcYH/C3rOxB/ohrI5mI7OTW3Ih1RdFnZYmXB5R5bw9CeZEEExbiZ8Q8HslrzAP3P7oyTc
	 HFHyPKkFGcKKzyKIr18gsi5Plhf/7mpxNOnY0kri1gSsGFKkpgiqfuY51ECNq1XepHO/e
	 rC0zdKUaAWoOwV8htH/Oy9rBKIDyQ2Za6ko3MLWV+4frApZXliky+fsyVw4eURLAOc1/O
	 PErARNZlQY3DWylvTdveN4gXgsrm4Ib6hcO6rix6/hfC1QLLKiutPf2Gz60Gn0aXa0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA6606A337;
	Tue, 24 Nov 2026 06:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DA6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:930:2345:9761:971e:1363])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55c724d85;
	Tue, 24 Nov 2026 14:50:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: andrew@lunn.ch
Cc: Frank.Sae@motor-comm.com,
	amadeus@jmu.edu.cn,
	davem@davemloft.net,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2 1/2] net: phy: motorcomm: add led_brightness_set for YT8521
Date: Tue, 24 Nov 2026 14:50:20 +0800
Message-Id: <20261124065020.2235540-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b8c387c7-f201-40d3-8f1b-3f8113ef6622@lunn.ch>
References: <b8c387c7-f201-40d3-8f1b-3f8113ef6622@lunn.ch>
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
X-HM-Tid: 0aa20c51f1b403a2kunm8db666f02ca51c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB5OVkpPSU4ZSUtPTU0eHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQUJIS0FJSE9OQUJMTUpBQkxKHkFKSE
	1IWVdZFhoPEhUdFFlBWU9LSFVCQklOS1VKS0tVSkJLQlkG

Hi,

> Did you test enabling a mode which uses the hardware to blink?

I've tested that the rx and tx in netdev trigger work correctly.

> Sometimes you need to take it out of forced mode. It could be that any
> value other than 0 in YT8521_LED0_CFG_REG does that, but there is
> nothing i can see here which suggests that.

Inside yt8521_led_hw_control_set(), I have already exited
Forced Mode using yt8521_hw_led_on_set().

Forced Mode is controlled solely by LED_GENERAL_CFG_REG and
is independent of LED0_CFG_REG.

Sorry, but did I explain that clearly?

Thanks,
Chukun
