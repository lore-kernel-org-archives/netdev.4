Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766092;
	b=uY4LZ2vl7PimZOqXz8F3jXoQr1IZs8nymZhzy6X0rKXrw9HJUqtOppBY1VBtylGWGZGl
	 arhgO/P6sXbgXTDDxQrCTdTAWDN4DEMP6ZaEYFWcq5GbzwJ+21sWWUrDWLIpLbXwIfSUq
	 InzQu3g2p27QwPuYiFJc7WdRChgIZY3aBXEVmjF/xhO6Db54/llFolKRe93pj3h36Znpr
	 UHhQ9iSLqskK398O/PBZm5tnP+eZwfOrN1ugj4hp6LGgMG+o2njdO1Cojphxlxkype1pK
	 bOK5ziF4QtqzjXMRNHTm/dDpuc0g8wm+bIA4hiExYS6BlzXjSjzf/heDrts6/d58AvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
	b=rYP08kr682R3neAs821dfvDDP+cAXKSz95GmIy8QF6htFO3FKpyNLTLGHbhOQo+g657V
	 NwAgx67H64EH4bFztSHLB6K7gFaY/I6qLBArDRVjDZbcocw4NqPZgmFT3X3NewjUORYqZ
	 lCvvCQLyUWD1vibf8cow/s9hnRxlOZhLZzDAa5qfW2Khxqtu0AjKVuxWRvRmdR1NU79Q6
	 qkS5NchzJETrofZsXsvWFQh//nLpq0vIXshgQmSH5AC00NdPHy0q3PeaT5wT2wDA9Ou4G
	 Bct37ZzPhlJ1VytlXA2iSutDHkNPYSwf86AOgpF7OmdI3wdDd7pCoUnp8z/IBLkVo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1Iv7pYL;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D644606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D644606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1Iv7pYL
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acef9307c7so24803391fa.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794766090; x=1795370890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
        b=l1Iv7pYLM7Udcm6uUHKM8AjbbrJVp57EBUL3g/5ZXETlYC/1BRfawLE3cP7fy7tclT
         Yr0pqtAGM2ya5rkH0BFOKC1vQovnDHDtN0z6KEm98rsHCCVrZQ6CnC11ybLI0VRP1Uw1
         bGsl67qowtYJg5lCGQtGz1U8BzRL96A6wH4PRkcl4cMbXSc+hiHplAdtS47vRQpBN3NE
         agsz38YCRhkOzMCMO2iN6XEqwEXUmO0Lci1D6eAU4nCVTQqPvTp1cOpcR3hxG4R+k2lj
         JzNNt9xcbe7N6I4ZSjNHsxnimVbYsGZ469za3NSSyn8O+/BYBkkpxZsX6veZNiODgWaP
         WN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766090; x=1795370890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+MYmssx9IoMkRO50t83+55Sx1DhBtS5aFsLYSJ3GmY=;
        b=NMcRcgwsVoXjM+0hcwqGVWkAsbQRia/xRSiuZYzD8Q43i5QmajMGq0m+cs2gxWUddO
         wNl5HQ+rU17MgzPG+tCyoxZYtQhl1Pr8jJN8Ys6Ojv4y/5yjdWW6QYgQFpj6RnUdd35K
         8GdE9grkcAkBltfAVbsXmFKOC9aH4ZO3w36Q9GeMGGfVzpBLpPGEzH8TyR6CVrM9X5kv
         yKQzAuxkqW+NjIqQ1UCfnea6zw6y9POoJZjogds6bPh3wjWNeVctMoOzrEZEa2EBBri1
         x031EF61PqB9DlGxt5YR1UAyRPvFNeYUaNtF7LpqfQL56irOIsZXV4sKDw7fK0AXgW8l
         sKAw==
X-Gm-Message-State: APuU4Z+zwbGLYMxFWrdmdwU9dxydeYSfXev/jQIoUqMCOicwf2e/9FQ3
	UPGc4u+HSr4wwYnQDLXrcJiUZYLd7TQkTEzSKZqxCS9rLgkbVikUwT2ctEdkpTO7
X-Gm-Gg: AYBFou1tUu7htllSHjC1tibmsiaZ4Y+kD/EUYjajOWZFGhx9AbeKWHzKZOWz0ePIrZQ
	CbqFcC0mlLHxjlkbSRx7Ryml7r/0La1fUqsv9BLZkD/NosStWXLCwevtuU4m2YxSWI6r/vnjw8J
	E0jFYZzkrAcbifNYVEbXXMM3A2PDe8c1CpLg3lNoxrn3/Ovzl2mh0W+nhxHfRg8gteR0OrUgDEY
	wAwPuoPHda+wMt2b3WsWAgR/T5K9ptj20ZVcIJBlqBTZRAobuTrR7Xe5sHJiN6l5jS4RI8qYHH1
	0T2/FcUcLEFvRUFxOCBZjOtnoTKEafW0X66l3L2lQp+HaNzHXJ/XSNBw23W5+VqVUka41R4s63T
	5FhV0BHy9EmSULBi+2g+rbxzP7gXYQUljMfI4TSqx2lsXMqbrF3RYwODhnNoNBEctD3FAE313k4
	G1n15Gz1QQ/ib0b/oD51Fn/HonadA7tE0tiXHzWiwAUSoW1bVro+Aj0C+R8vaXUgp+QvboEk+yE
	AcHBTYM/QC8g9opbY6Uht+Nrg84ux5qgEm38LFnMdt2HMSeTZaeliSFhJSZSzyu/VFxt/RVeDn+
	19UFDaECWofZ3QAjDnTB15vbRZbVEhIc7y/c00meUz4wxSKgfoXMy9fa6q5xIPWFlli53xwZZNR
	6uzLHEVU=
X-Received: by 2002:a2e:a104:0:b0:3a9:f130:6ede with SMTP id 38308e7fff4ca-3ae2b4da76fmr24776831fa.13.1794766090334;
        Sun, 15 Nov 2026 10:08:10 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm2567818e87.36.2026.11.15.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:08:09 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev@vger.kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: phy: et1011c: don't write an error code to the config register
Date: Sun, 15 Nov 2026 20:07:35 +0200
Message-ID: <20261115180735.649299-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
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

phy_read() can return a negative error code. Use an int and check
both reads before using their results.

Found with LLM help; fake-MDIO KUnit error-injection tests passed
(6/6, KASAN). No hardware testing.
Signed-off-by: Elias Pukari <elias.pukari@gmail.com>
---
v2: Drop Fixes and shorten the commit message; no code changes.
v1: https://lore.kernel.org/netdev/20261113221917.3542509-1-elias.pukari@gmail.com/

 drivers/net/phy/et1011c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
index 6cd8d7758..603fe5a1e 100644
--- a/drivers/net/phy/et1011c.c
+++ b/drivers/net/phy/et1011c.c
@@ -62,16 +62,22 @@ static int et1011c_read_status(struct phy_device *phydev)
 {
 	static int speed;
 	int ret;
-	u32 val;
+	int val;
 
 	ret = genphy_read_status(phydev);
 
 	if (speed != phydev->speed) {
 		speed = phydev->speed;
 		val = phy_read(phydev, ET1011C_STATUS_REG);
+		if (val < 0)
+			return val;
+
 		if ((val & ET1011C_SPEED_MASK) ==
 					ET1011C_GIGABIT_SPEED) {
 			val = phy_read(phydev, ET1011C_CONFIG_REG);
+			if (val < 0)
+				return val;
+
 			val &= ~ET1011C_TX_FIFO_MASK;
 			phy_write(phydev, ET1011C_CONFIG_REG, val |
 					  ET1011C_GMII_INTERFACE |

base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
