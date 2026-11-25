Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594719;
	b=PWsmbFL3wIIX6EMlwMwRelzGO5QpDKpHhLm27GP5EflQw4QLONzAPy5FUMUACTXTvURk
	 XNcdg2SMInIr/xH7fivjrgleopzTnnN85UCWXHhYfNOxF0W6+U85Jtgui65WHZ4H0jbxr
	 /psZLXvaCyTcbo1Zq6CUjNmy5zr/oMnzcHhl0kO817lc4L3M0rlo5qJ7YsW347UWgIp9D
	 xN1GC4GKXzuutoQxmWt+O/uqL46U5ozNOKxZzsjNwfy2ZvjPD6hXbB2wJaJJW1XGL788+
	 nTwT+lBkMzbKJe55dNTio3XFdjGf1/dLHy9TwCRaO4MTMGcvQUFxAoAcCkWDCvfFg8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
	b=k+uvD418SaHboM2kPRfqgq78znfK7T2+n8hMFkfZXg03osBRpVDZeZzqvkYiQmnOJVqJ
	 C+LO1bagjZputTEipJiwiW2xwiGEMoz6GCd+n0ZtV6fXFSqRh3fziCTvnLkvIZdEER6Gc
	 2k7aNtM6HA0UQCaV4CLvFB44Vf0PFGt3e6Qi4VG0VzzuV5GSGCZrnTmqIbujw6axd9oz6
	 TRUoCh0OvUDa9WdKMNX+poH8lUJ3StyfIwqueRddr9Wa4s93lihdioV7ZLihuc+gUuSWy
	 NEcPmKdhhV+7pF2VM2v6yhDMYgYcR2zu007eN554G5pthiM9/xvAWVOyNOayGijSj3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06ggNOhp;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58320606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58320606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06ggNOhp
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48e94879f02so1769045fac.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594718; x=1796199518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=06ggNOhp68cEw9FF2QjoKGoMmNphOyAMWNTL+o3dFOwl+svkr4vFW/wTcBSzftzymb
         qDFwjmoRQ0nBsEV+7bhaa52+syiAiymobYC5yetEeo4zlc5PjioRDvZyTBpu6QVs0txA
         Ts3GXJBehpbQCzarJ/hCGAHotg0c1fkp7EWgwFDI5WZLXtWmUrS1kL22nYOcrPAGhUXa
         aZfLgtsJIgch685fq/Eji49j76c3ZduAKi5MBXkyC8NX1vpk46vYhVhIH1G40YXhPzEu
         dqB4LMH+8t2tkvU1TBrYm6sT5qQlgd7Vk/xA2g+xPvH5OVV6nTdHWzUnA13DxGOTgqZp
         DMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594718; x=1796199518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=e805LfR6yfpDGeM+DFAYfJimVAQVVnA+ZTQV9MdJp6iZCWNer6gICj58qr2ZkZhWPN
         d+1EBIjZ9EZqtWarpXOIsD2N52Hwg5DKAvB5uqcwzku9b+SKptdaBUK4vqArAO0TGkad
         ZPz12JXLw+Oop3EF+5L17Y7RicrYyoXmwFflddT/BCPLi8q5kUxCme9Fu5uBisEzPC5C
         M+25GVz8+ErXp0z05rSGcBWoc3lXa1sr+ZgBrfk+NmJDRSBryrrHb815KIw03Jp8559X
         +QmFyzZtsFR7BhWTYrqp47PY97YAIVqgDFI66nJfh3dMmuMS1RZlYanm71MdpESosI9a
         Lf+A==
X-Gm-Message-State: APuU4Z/VDL2uKHJCayIxsTvye1jdKLQc8NH3HoS8pfhb/lS2mZ0JMxiz
	h8LG7EnSsPmyzpBykcd9d+BQHE25mSvPK7j+MRKxRg5IwJrdDD5xcr6/
X-Gm-Gg: AZFdTZe74FzBt9RvuXK8FGzeYXlmhB6rMEotgbHx5BWJe0lh4p5K9zyPQq8ZN5hhuGH
	PMsJPh1V7HuzHoFiJYaqwjNmdmhJJ/ddrd/x1quDrKEYn2nAOuiUP0h209XwrjoOOJ+6koQbCb5
	+Z04q+tOUreADiCJQxeuJ4aRyL/KtYSopye6Znq8pc6ePe+zDQwMMwEoNPMbJBJCyzwTeg1OXOe
	8k3XLjsmUZV0u27tX2LErzuwgAvA0W3A2QMcm5SDi2Ck1UqHM6s1r0re9vypxMgXXnUil1jzIeK
	fJXFqePTnv8YVROp9tFUp8PgzMFUG/R5B7S5asoWzDOMBWZbt2ag+dtEN1H1E+9lBHHg0kc+Dci
	qaAIXsMin5XjXC2SyhbAS7MuI7rw/R4m6bzgqusQM9j9P1zHiTtrUyFcBh5pFbYEBniPFTFl5TX
	FXV6WWe3QHRxqtWHMGTB6bCFIdvAnxE/1TE8qu74jJpvN0IqNFgAfsjJep9ZXVZXcxRegzd3HG6
	z1hfzbwBwniHLImTtFrOMBXYkD6zcnePUPKmrwaCiEBDs6WMwCEpgDqOmmi5lUJIk1tNWpA5hkU
	jyhJkqpjVM6yhB0cAYSSKSFUkKbxdBkLnhaIuA9VKpu8ftxw0F+ILLbri1vkQfJj+sQy6y1pnL/
	QcDFoAv1ffA86HUur6WMkOvyovGNoGqk5nS/BGnacwDViFOnSMDXCwqNlYJxsTm/MV3eREfq6fF
	5BlxkN27n61SC75Yk5yCxNcVEFUM3BTc3+jQS1WxGe0DObqtswqPo=
X-Received: by 2002:a05:6871:7a5:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-4bc7d94f9ffmr14000992fac.6.1795594718208;
        Wed, 25 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:30 -0700
Subject: [PATCH net-next v2 1/3] net: stmmac: dwmac-sun8i: align EMAC_RX_MD
 with tabs
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-1-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Use tabs to align the receive mode bit with the receive error and
threshold definitions in the same register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..379108e3da32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -197,7 +197,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 #define EMAC_FRM_FLT_MULTICAST          BIT(16)
 
 /* Used in RX_CTL1*/
-#define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_MD		BIT(1)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0

-- 
2.53.0

