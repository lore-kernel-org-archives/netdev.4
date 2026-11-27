Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773024;
	b=cU4psO/0jQ8Hr5cGSdDHLnPjQPhIlwt6+re/2+BdV47OELR/oaaFgAg7Qp95WBVeRr2k
	 w3L5pRxBLrwRLsaJt1nR4xBWIYeALx802lXtnGkh0h27CGfuAzAa/dZwjR5UN7XpM9SEf
	 lf6Y17JbH2Z2UNfaJAU5S73aaLJjbZ7UcMPpkn/3x3fx03nrCjCl8Ra/Yj/dA3/iob7T2
	 sUf8t5VA/eDabFHrhWgHA+e793m/WPexUasR3VHD5Ma5ezb4S9xH07heBIZeAnGa90sWG
	 E1vn5uCkNxB7JVrgYYTfNMMgK4+XHjFB2drJXdeIfGujpWgRqb5BskIHWtvSA8vDKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iE+BtpD2Vk7NohC+R7UntpBA8H9L2Pd22WQoXYUbwA4=;
	b=1Kd+UkF506LNUgrxXzBFnbWkAlYackqVdfeTzfK2ZlAbKRmI8tasCbnuyPS2H2n0L2jv
	 +q6q0QVg0CPINj3+s51ta9jOBL6BRHHUwnpzq0aOSp5KJhJBaxrk8YonP7m26EXfWNIAP
	 1k+lc29ivWVmJRWP2u62dfUR3R3UqPFH18TsHcv7X9ePKGZfxZiBTtssOOQ6ve5ytIxwQ
	 cG9Rr7Vc1U4yTsvXNBGxuZfnM0LwGyTvAjJXRYICbzrOcodrY1LObpLNSPfjTKPT1QoyN
	 cbY96SVybtmgsCSZQP0DZYRgusKSX0WmjM7dW1dzMfDZPR6Gsa4bEylOnHy3QFtKw0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J5eEt152;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79F60A2610
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D79F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J5eEt152
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso6899646a91.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795773023; x=1796377823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE+BtpD2Vk7NohC+R7UntpBA8H9L2Pd22WQoXYUbwA4=;
        b=J5eEt152Hztx3o4WN8bl8kzksiapnXbDmIuImfxCKoXnEKQGIlWWpfA7CTegYZtt4j
         h51vtWoDHDqsbe0ymQz4dGDYi6VIPL0VDFbQp//eqZv+AqjYsJERPme5cHgjUS6VjtOB
         ZKn6sfO+5GnD38MN+Wnx+BMHjvosDYb2oTO1V5gQrTk62IsQjaMr5ZjLCWl2Go0gh99c
         JjwQJa7eObk4WWgLWetx8p2zWUdUTvCgvOnAdv2OJRwrbDrKtCtOOoHFW8tYPVr3QBaM
         loNWV7QpqwmURFd+jHtT2XLW16aXLqxyPc6OqSBSFTINkN0KUlfGKEATQmV22in9fEqL
         w4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773023; x=1796377823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE+BtpD2Vk7NohC+R7UntpBA8H9L2Pd22WQoXYUbwA4=;
        b=wgUHNLYuuU9h5vImXcxMtwmoItRxG6IqN49B57beLZRp+2HJ41AgIV2VCTVKVAugJo
         pJybQjveSFW9cxmbD0PCv5Z+yRIwKb1pkNGoIEF7nvMEBG+l++EceCdet6Whxg4N1Lyu
         pWACtYiJHngMwcDcz52gfCtOQM3uzF/euwP4CB1ylfR1ZSfUkYO1sgqaFn3phs/IJUfu
         qI5OO1br0lDN9qD1gtXuEpeKnLZHl+yzb15er+FD8AkxccTIK0qhBcSLZ3IMYSEfPATU
         ftZqYIWLHMCtumMwPVksakNIjB7fZ9fkXqoVD+p2NjKQvQEVvssObOyAJyE7PlOVoPCJ
         YzIw==
X-Forwarded-Encrypted: i=1; AL+hErG3OKnqH+7PuAkXIm6m/a4gQiIy7ZxBLGJcORnVK+ORS/1pqqGnwu0x8J+3aWlYh4vxubaTtKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FWKcT/4D7NV2/Ypw7+8oWZ6/FrYClUCfEXOBIGfay5+9MWzQY
	X4/SebN27aZS6YIUK3zad6SDqGp+k4p4ykZy2Mj2dqWiW/0d+HOCkTEe7TsiOXLaHg==
X-Gm-Gg: AZFdTZfv887f1E5SNdyoXg3+nbR6Fo39hKazI1eCdWNnBhR3H2XkDOgSO2Pwcvb2QwR
	TQehaPxASURdODZUtOOnckHMoV36eNqt7UsBMZVxx6NDwOQvZNoWC5iklQ8+YiK10RR4V2bSkT1
	LGS+ojXxtzKHcMY0m8pA5bz4qdLYbQKn/fDvqh19/rZxFlRIwiGAh/JqQGAE788USeXj4CfCoDC
	uSUc/FDviR7Yr8OXfpJCVCyjj00pQ4j8GAxifWK1TCVuNCSVBHIf+fUFAUeOAQDes8phrFENl6L
	iEg+K29GNdd5573I34raluHiYdcp2yeccqdgGECuxZLBQ2ulwGYjqd5IEAJHtxEQSIKqu/PTTy/
	022ZCcn2XwP5S7bFPz6wj80KdlYYHdZlt0iUP4s23T3SoSPmF5KznsuAYuSVir6jVL7CuLGdBBF
	PVHBGImJ+YHxg3jLdzzp1n/ZDB7VT9+5eK683H9E/aoKkCRRe9eNEAbICuXW4YGHSNA9W4UImV+
	TiEzcj0f3U2dLWLi+H7kcjkkQFkPQ015K6PeRdLXTX7zrNTWR2UzMQpWl9Ix9ABnVuv0O7gbVzc
	Tq51MNX6sfi4Ao0ogbbsN6h4mAtB1VKUKa4uhPSuIpV9hmZGqPFjiCryqOt461xAWR6YYN7Oloe
	+8H2AACtpMUbaPX9MLA==
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b41c907eb4mr13867750a91.20.1795773022786;
        Fri, 27 Nov 2026 01:50:22 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm27539126a91.9.2026.11.27.01.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:50:22 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net 1/2] net: phy: broadcom: fix two-step P2P timestamping
Date: Fri, 27 Nov 2026 16:50:11 +0700
Message-ID: <5cefa3ba7e356bd2d3fa05cef28e875f4fa6266b.1795772837.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795772837.git.jjc@jclark.com>
References: <cover.1795772837.git.jjc@jclark.com>
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

On a Raspberry Pi CM4 and CM5, with two-step P2P, the BCM54210PE PHY
sends an incorrect Pdelay_Resp: its requestReceiptTimestamp is the time
the Pdelay_Resp was sent, not the time the Pdelay_Req was received.
This is because the driver puts every PTP event message in TX mode 3,
in which the PHY writes the TX timestamp into the message. The peer
then measures a path delay that is tens of microseconds too large.

Use mode 0 for Pdelay_Resp, in which the PHY leaves the message
unchanged and still captures the TX timestamp.

With this patch, on the CM4, the path delay measured with P2P is the
same as with E2E.

Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some Broadcom PHYs.")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/net/phy/bcm-phy-ptp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 443917c9d1bc..4b24ba7115d7 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -826,8 +826,7 @@ static int bcm_ptp_hwtstamp_set(struct mii_timestamper *mii_ts,
 
 	mode = TX_MODE_SEL(PORT, SYNC, REPLACE_TS) |
 	       TX_MODE_SEL(PORT, DELAY_REQ, REPLACE_TS) |
-	       TX_MODE_SEL(PORT, PDELAY_REQ, REPLACE_TS) |
-	       TX_MODE_SEL(PORT, PDELAY_RESP, REPLACE_TS);
+	       TX_MODE_SEL(PORT, PDELAY_REQ, REPLACE_TS);
 
 	bcm_phy_write_exp(priv->phydev, TX_EVENT_MODE, mode);
 
-- 
2.56.1

