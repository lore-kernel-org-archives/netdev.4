Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691049;
	b=XlgNSyCHkjnnPqTTliSBEcic+c+mIx76C1eolb1Pl2JqrXLaG3NYdx2paxwAm7Ka+pc5
	 TdN9d1yV6euqmrgs2i43iAMnJaaRWYtoiq7ryFB4xQZ0YuRMWhehwu4UaouT/aHiL4GYd
	 +X58NnJXSsxiUGUdwg5cEEHPqcRiyPDltWpSnGOmdNZLgLQtte6wJs1PEWuWYjjOPKa9g
	 Zqu81swJQ9USos/UDmOyDF8DTFkKyhVS4M3IflKkE1/+vNj6q/B7c/rtGiehx/xEZ9MoV
	 kzhxoTUFB5lVWuZY7jnNAmmv1gJQakaeCnm3sIK430qRtp25iMFhcMZD27Duhn+DUgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qn849zzPgTAwyQ69q9KhyExm+4T0Avr7azZ84MM4JnM=;
	b=mb85RtP3mFmiJZ7njT/7um/c+3ebjWxZ59I96Ar3QmDPVDaEMtyM4vo85zB8HQKXB7ue
	 gt62rsQ+EJshC1PB4tM2B4ZpMRydhNUdFrElGU1OpyW5lboWOkvTR0UTe6+CjsAehP39B
	 RoKDE6U515k2xWA6XS8X2ckH8R5t+T4Sq/OpWya+TcNPeQqxwUVw/LA3NvCMMLo2H0+ke
	 WxhAjkdCUXQfclps0V1umKQXwEmpoVb2BDSy+xhq56AbXMHCjyKR+H+XvgDwxN9+hYsmZ
	 JMd3hXXv5VjYt+G6rBiX5bxqyXfLyAvcLsId6N5IiEh0TC6qhMoJfeFe0Q6HCgc1uAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sw2NQekF;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1F606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sw2NQekF
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0a0d1a1e5so21665035ad.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691048; x=1796295848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qn849zzPgTAwyQ69q9KhyExm+4T0Avr7azZ84MM4JnM=;
        b=Sw2NQekFMt7Q71cHpA4w6dsgaHPJkD2/4NCoW+KTUT+iZESTOZqaNT8Zw9wBPZAWNi
         bbb9Qn7JT3+6TjK4DHjUf4YLKx5Y/9Q2AZB0gcNx8DNnD7Qk3ugB6zByJ6NDxDG3P6ch
         e76OG2MDdSctaJpJadH7VlGnZgG32rkkNkMtMzka5z7nmo2ew71ySWCVUybmVRZd6JXs
         P3VKekix8UJStsfQRSloG8jBX6BcxDVGM9N/e8NZkBUICq8THw/U7A1UYkq/qjmmWlpe
         OSDgiySVoVqczrhCafiS6jYaWStN6XFo1TN/tGUZMxn/u9N8Hha2BFIymJcxbHMrPi2Z
         deNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691048; x=1796295848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qn849zzPgTAwyQ69q9KhyExm+4T0Avr7azZ84MM4JnM=;
        b=GzPH5SJsFwZKCj083+ONxCUYwdWmWDHOiMGuGROiwn20P52hA1GHIW92NSH7MnbUss
         4rZKnKYabO70929JeePq5RvHKy7kPGHFkJi5sfjSwqGJLPESoahglewMWUyr0fH79ceD
         +9SVKIblb+Y0/esCPMWjan8of2mzd3amQbsW/kQkJU9Fqu4z1RWDieaXLKnClcJGLS5t
         Zd8MQTQTChsMQtv3DVQIY0cb/yoDxtqSBtv+OxgOeDgGcOXcHuCSCnB0dsJefpBD2msm
         2CdoXiaeVAiCae9/wbbeyEgDnbQVxdSIocBW8VRAzG4GQvY4vX/x8oIGFRZhhbQiovmt
         hEuA==
X-Gm-Message-State: APuU4Z+Sp50SAJMaBABJZT6VI+vYs+ZanpDSzcU0Gqt00Xy/skwzQDAq
	JcmScCSIUvaEDEhNNy9NGzPVPNWQkmA88qXdprxUuXNIu95v1/VjAZzowNFSCA==
X-Gm-Gg: AZFdTZdlS5OetTbPisfZFH1IwuaRWxCiz7bp5jGUoEpmkSvTlT489jiM76XLwyTTCu7
	MquUN6AMv8kXqak/UiM05rs8ZCKGOgJKl8bS4LBP5JbfGvdVMSDpKz305RyZSmLkngWOIFDwCDj
	xRh+iYIFu3LGyBtFiuHT5v5W4k8B0Lyq72nd5NBjTyySYd0JsQa7aw/dywTt1jgtvvaNMothnI+
	F0NhrZZdXP/nXw74Cr8aLJWaU8mW/qs8mjCtro6LwPq2JrVLerMBFwnqMopVAey/QKEIWGXg9SV
	LAb7GmYrNuN1V/HfTGEDIHPMjBY5HNXWy3q0X+s5MITOk/CMc1qT1XWfZjwy1Jgm2EI/NzHuvIg
	qk0d7GHWmvL7/PrC/ULFq7TyWKCcMHwcRPilWoXWyRE4JmAYyWBOErSXHO0IzmoNyF1go43x7zo
	HzgdXCQC9E7RbgGWhA6jvhrDxut5wYPTtVXys4lFy2BEA92U/pGM6i2tOLzKylXVJgaTZf4oCGY
	Rbhswl3dS6kphSs98aREVBiG4AM11FTDnQSSwAKdG/9iVtCYXKVLP5zglz5D2skl1pJ8Cf5jFdw
	cYzkY9fqpNeXcJ5t+CaANACyQGoGFepOK+0rfqk16+lFQLIpaLV9bnT8Iw==
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr213436565ad.38.1795691048095;
        Thu, 26 Nov 2026 03:04:08 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm104525725ad.12.2026.11.26.03.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:04:07 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Dongpo Li <lidongpo@hisilicon.com>
Subject: [PATCH net 0/3] net: hix5hd2_gmac: fix memory corruption across interface reopen
Date: Thu, 26 Nov 2026 19:03:02 +0800
Message-ID: <20261126110310.344521-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Found and verified on a Hi3716cv200 board, where received frames came up
as slab garbage after reopening interface.

The SG path problem is discovered and fixed by LLM but not hardware
verified - TX SG feature is only available on hisi-gmac-v2 while
Hi3716cv200 has v1.

David Yang (3):
  net: hix5hd2_gmac: unmap input TX buffers, not returned ones
  net: hix5hd2_gmac: release TX SG buffers if using SG
  net: hix5hd2_gmac: keep TX/RX queues alive across a close

 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.53.0

