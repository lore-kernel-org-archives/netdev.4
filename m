Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353547;
	b=2u7Somyljq345tOfXTy8M2QDRwxNjCgl+ccmLddYg5bfyD8i5DfWYayY+KaH9mjAqdNa
	 +j1W9F0Vy4X3UVRjCcmkJl38lctV1ZbDTw98KnHPrhdcp5fZ1LLsDEF55xJloknKcxVpi
	 AoLkxG/knkn1TtQRrFtAUunK9FpcYUsTmXBKiwlJ93djQAKwcHiPsDYywBYfQooV5jPYG
	 JoUC9XEsoYqu/0L+xqCVzbA/Eq+nOkz98xBEbFTKtMqEXEKcidXH1NdWlGtGYpH77692m
	 U6O5tpgpmKv/8nvsEYpMmTI98jo8qfN/ALqyOqArSGg2ZMnyOlYkg89iOG+QS8Nn9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=xQJKkEFy65By+1W07VMonkjmIiNgagBE2DMhengHe9VlF0b8nkaN0nHI9I6unRHTVbbg
	 2rf3ZDtki/2RftKD6sAX7/Jz4VoTrvUQSeXC7xqaAA/LxOaEGB8nBi7jRiMe3P07pF2Gv
	 oPqVbQJfoxGC6/JuTTZeoqy6jiaSQ/qdp5NsjZYCVNvy3Hy/IiS8AlmTa1QriuHEVLva1
	 EBvYFeS1YNmxbVOTvm8utOUh/gbAyjo7ijShdrOK/eYL+tY9bEeugKVgg6BMDCgpuWkCc
	 SThSpM6sndvKwZEiKVjJmSQoHWYU3dk8elBRStkjt/oHRzCH8CfoWkCD0pLJpcmYEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E649606A683
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E649606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae25c846edso16407881fa.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 05:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353545; x=1795958345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=zNnfJDZXicFiVo9E1HRD6Wgn97zHNLVg7Nrj2zO2yQK/+VeOM6+DTQoDas/laCrJAW
         khmwgB5guiv3XpWuY+JI2VHXZ2p46zCjMzWGu39MngWb2BqmLBcb/Nw0Tu9hTp0iG2CV
         MTH9BLuAMRV4+NwHNYp1j8bxaFtKoTbme/8i6vg8KOi46LFO++5AEdG3+ckRipbiHRDS
         Th8COKQwDZaerOq96OwJwdUR5kyN2+9sR3G3K2onV2dNJrmSCG4htbBssMuwhP5Lzk6u
         iJHzpYcf6xxzRD1ubSpYD4iS7R0+Zu7ACkYALBN9zDMR4lLFWlMqLcgx29nUwHCIHCAJ
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353545; x=1795958345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=KtWX2pKnfEui6oelgl4cKtidb3bKJHa8UdMQWiNCCCU4mZRtLzmwskQajpfeHRkBCm
         8XlrtBQABuKBgRwDLJqilXiVQ3IOFFSx5zpG3s+jI1dRAaJbs1VXkplC7+Tkh+SecVVu
         72tQqotpvCBtO0l6u+/cDTXeikXXY8vLUazNlk+WKb3ei71nh3+pqEqSGJxCUY4TnBIw
         9Q2rU+FYMepaeZw5G3LsF4Q2wS2nqrj7CtdSadfEL3pql+BJFRTtvJ+9JH3fSNFto8UR
         NVNI3UNy8Le8Grh3r0DLo2rssiqp7xf4dQB++Plckhs1XJRRPTwq5mn9hSDRd5XTm2XW
         1mTA==
X-Forwarded-Encrypted: i=1; AL+hErGgn6H02bf2RPtez+CxGBDacAIKagd9DpfZxujwPn5fagPtAgLmF8408g5pYGIJLyTEQzBQeG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DUz1j2LoPZxmyJqHr5d5G76T6S1iNXGTaxu3zojmdKaYlKVVy
	52+/eU7zZkoMMtzxNLq7wqGRXcqNP2kJ/PtUF5R2nQVhcm4U63csb3Ob
X-Gm-Gg: AZFdTZe4oaFHa5bTkbAtltUCNUv1mYwhDnOjpvqqZ67/sZIWSgAtMvUa9TCUJl64zu7
	iCYZhN2Hf5XN41+AWYjcnXLBOjfzFnF2TXtZeyRSpVoxBwXn0dYCiZfMf6uPUQ/51RTplyCkk0K
	D90gYvr/7axX2zvfIaRaHaYC/07S5LY7hGpacD7SqoXl7Z8wnhk20BjJSTz7/yYQcT84Z80qJU2
	OmMI1HmSVc6OqMoFbFEewnmqkcUHd5Zq8BqVhKv+g0RVZ8GALMbQ7AbWpDAtF+IUWwyyr9wWss0
	ruXYNVsNCk3KsLFCjmQCoB6xNiPkMxgb7IxlJ+d5sPwXLOoUF5+mZknu6OXPgpXwVDAuu6hXjCQ
	fr8pS1DWeak/Gfogxlgfvar/4THqY+re3YdENu5Gr+y9O1/H1Ihe5LJod5nkwg7dX924R4UbD/j
	YBi1EeaWeadrk4TrEJcIlbjVJJMrlMDNcfq2bmW3oEfO2QEddXZ1aV0t0r6xmHgth4awv6JMlp/
	P0IOePPEZHWbQTET0DoS/6cOFS9H0MiDAC4IsBwPEfm1bPA4OkNQf1IFvUSOO8PFo41HCb/0oA7
	Z6EaDi6fLDfKwjPYi4AMmnhtyWTZzg==
X-Received: by 2002:a2e:a10d:0:b0:3ab:f43:a3ca with SMTP id 38308e7fff4ca-3ae7fa19f85mr20640791fa.16.1795353545402;
        Sun, 22 Nov 2026 05:19:05 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:04 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Sun, 22 Nov 2026 16:18:54 +0300
Message-ID: <20261122131900.2951586-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

