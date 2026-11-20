Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151857;
	b=LJywcEqg5SpHHi/CI45BV5x8Xv+wZRccdQUfzDpevwFNI49ohTxZGKM2O4r53XOl76Vd
	 9tBs6g9ghG+38wpCPwHfG6Hzdzb9GvYZE/38BumuB5XEp4ZKeTFMk4IkdjrmOld9DVnly
	 hd462h1dwD4z7CFDfhOrde98MwthlpMYo+v1vPHoCzX5pn+X8Ri1W53UqqZLTt5phrGjq
	 WzBW6hOL/jGoCh8azqsl8yCGWaVrR9zEyVqnXIPuZM5I4F5C1WA0yneuT2cfP2UOHRREI
	 9mvV4VzrIlgdljCaSudF8uuj0yU6eGBpIWL/lX//DhckJ6q5Ra40h7aurLKpqjGr11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151857;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=LuY3jHOqM8bGwoDhCR5MvAvzmKD/G/dNxlknWApLeNOdsyFLScPNI+YhKr6MGtTtId1s
	 JmFjb23CVHvTMP9Avp/NGiU9/C92o577F8r2yLWPxUzF177KONhMI3jy68AJRKEY74CtO
	 J12pccFej1etEriUcuWMo/CU4FqO3srfGJmKLc8vb0D25p6If1PQiWe3SdJcMqmYiZWKd
	 T1lg5KVN6B73yx9FVHsuf7mUP+L3FSBKf5Us78iUkV75LW+HqoAMCsLcAo2SDoeDY/ivc
	 NYQsIi5a9NUv2nJT6n0A3wSl1+0AP1/5HVJtwWdO9iMKCXRXUQNkcgyj3uv97KDAjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ARktmKcF;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F2D606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F2D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ARktmKcF
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb684859cbso310573a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151856; x=1795756656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=L1VLKk+qTyuhM+v5Z1ti4Rii8xl99R9VIOckiBQRDMUn+pIGIla548/PbAW7AkOL5X
         x7pFQQbYqpumu/oc2ZaFB/1UpHSgz2MrZtXECuOf2UMnwka/nFTFKHwxDkkjB9hTA3I/
         +mBn3Iup+rSjM16TLRerz4gBRu4uzRCbVfshfcZrXOuEdQq8UCaK12pXatbJEwo/aD9p
         WbU/KjVV7n20+Q4E1XXB7TRodRNS+czwREd1ap8DevZSwDHkf3LN5n7I/zhAByLjcvNv
         Nqb1Kgk5dFZCbPm4nPFj4Vqj3U2ncJ2ACtt5Gn8YBgqOHLAkZgmzRTvL5QE6tC/WobT5
         lQTw==
X-Gm-Message-State: APuU4Z8hIuN+sy37HHy/ayG8Se8crMGuztrKuqaZJBwVOFv4UXFR5M9s
	TcL6SEBYquS6+Cp+ZkpoHYcAQKqFfDH72NNBvhkzRzR/NY6AQ7VlPP2fdqjvfb4IhgFoKj2Mq1m
	xxuQoep/TGiExOxcH4cRQqaYzV2KhwGu8HYgp1LQqywEwLRgcZquYY4++AePigrLccV/KJEAQkI
	fXZkaqisbY+YO4F8UH8LGwyivJlMgtQ+eVzOGyRJkoBytBeNJd8Mqerw1kBjO3ev1sgCKjSDB2g
	P5T9VZKTcMtk6Rr
X-Gm-Gg: AZFdTZckJs2EuKPfUGJN4OKTmwbCK9XWtId+b/0EDu8LbL2xlG33fdM11jPqbu7eKI6
	Y1dRK/eefF8B6dn33tRRLDF7rH9WGFHp60+vGLWLaxp5oFnMVjvNZnPx1NaVVyC1j9pBaJTMxol
	8zZtJkqr0YrgUF1FNVKfzAph/rjTNTykW8nYxwVJJSCNlRg6OngMfw5qXdwYWJsZUZuMHhZ9wv6
	LVPGJkAoa+xYunOgHdHYBParN5c+grC82meVLp/rujlpGQhVOREQFHuibceFOMR3fe949gPvRUE
	TKCdSIUkuSOvRj4Lb48idW1AxPHnRHsHWzPJeYuquOTTpK7nW6pNirNQVz4qKYFTBmqivO7YTT2
	LNphkSdHxUuGbZtjmR2DHRV9BKHlMmc4I+9Db9yPS8qhk7QkQTyPc6ObW5Is1GZPoxB08Tdb4ty
	Oxcd3NH+beyCmGCfqac+8jJdyYyGkxTHEmaIga2XQNvlk=
X-Received: by 2002:a17:90b:57cc:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b41c9b2d2emr1723309a91.10.1795151856465;
        Thu, 19 Nov 2026 21:17:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm1211094a91.8.2026.11.19.21.17.36
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so143405485a.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151855; x=1795756655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=ARktmKcFjywSuCyl1xWBwkFPjwTg3eahE6eUXnGnPS04zLzaxwD8+TqpSDcDsuUHad
         9o01Zjg4f12WVQia9r9MAvC2z6354eemSkAgS8c7+hNemv8uWmqnfjvmmLbL7//mzfyY
         GhhZ+v6TvkpnZQkGcvsyxVJEIgAvrRXCaJH3c=
X-Received: by 2002:a05:620a:1d05:b0:949:744e:12f2 with SMTP id af79cd13be357-949ba99cd87mr329955785a.22.1795151855096;
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
X-Received: by 2002:a05:620a:1d05:b0:949:744e:12f2 with SMTP id af79cd13be357-949ba99cd87mr329953385a.22.1795151854681;
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v4 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Thu, 19 Nov 2026 21:16:51 -0800
Message-Id: <20261120051653.1433677-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 80fb3b5b52ab..5f79f31220f2 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

