Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050002;
	b=dEUAtqtQP+lw71oUjxvTelxpzyeesEib9RIFkTmfxBQhMQ/ag29tXt/f+AVaQhpQNMfK
	 8KgUL1glJNKWT7+Ev8HuA406zxntkhPx0EpVIIHqYj/sJ5jqISPHCa6Z76OllP8V2ZWEA
	 u7NVh5wUPMfTAQaZPcGaHs69uOEQDTdxl0YazpcnNme6MtYLYKONvGiiEP8o7yKg2IGIZ
	 0gQJAzeBctxD7H+g7jAG1PL4ZvXvrOqySDu8zlU+rMmJ4xpbRfe17mWyh5TsYW8ObLsY5
	 nlmoWtDC4tYgpb5ZX3DDGTbVdmb3h3N4VKo76c14nB1ZICiLFJDP72HNQ/gwqoz6qfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=TKTr7ZPJvzsGeX5i0HyCtaAboJcKWeaEInswj/nr8AmXo4L59DaCyI2f/g9862+IiQQV
	 erpQEscfagMtrL2mNxC393T61gGM/J16FR+n0R/iGMOSOMaozZSrA/Xeo35krUHxCSgIS
	 QVOWvKC87vt91sqGqmmzUhup3E/hqVu8h+JmLGqY7Hd/Vo5N427r3ASUpHFGuqc3KAVzE
	 Bpmp6jcrZB1ivMs9IopSyummzf/xIdeyHlSvOgc1GeLkh5IPjFVazElpMNvlU4j6hqJ2V
	 bafIPWjjNWvyXEER1tBTO4BFICa53rseYWq8xqH/50B5mOLhjHcKvlYgxqht3PHwFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XpPGTWL4;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D060A2620
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42D060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XpPGTWL4
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2eff722a480so2209615ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050001; x=1795654801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=xyUa24IzaKch2296DJ+VuYnWaKnfxtOaM3KWQL/HTWYbozW4MbjaBKPCDIAfTqTeP5
         64/tuQUBQ/ZMu4gXpgUOd7j+I3C+SlUOL0T+FWh9yHnt4OJvExBXYOOYPxASUw27tRYH
         jWBQpbvj3GI3p+9fq1UMOnMqFoZTvCR8VQbUfyd2XAQvMBgQ5QkyR2ZnVExPbeskQGL9
         HXA5qPZmhPRG5snUblk6ShvDHW6qC6V+DUKggD7cNB7Vz4popMI/mMQcn8OZVnwNW2l3
         I+uay20Nc0WZOZY9/OV1He+EXdNPyOpo5B0weE1h2ol6cthyJTSfoC5asiOTHEAl5mHj
         e0YQ==
X-Gm-Message-State: APuU4Z/xP0fI5zBZTnfEaxIEdSyydiNPHu7thIfHj8M8xrNxwOT/WRX0
	U58oponCzV5sfrVk8Deuadh0ZGvkojw2uIy7eBTAB0eXTJWSkXxNlcB1jVQkKjrT+tVDeR73HHu
	5iauuj1Z1U3ILUwYeewIRI1bNUlUroiC3NtuFMQEnTx99AXTkccBR1bBg4Czvy6Byp+0ithULD2
	r7QcTZtH+BX4w/UCFDbfZwHLISe+NklksGArJbiN1wK5+5jLP8QDYu8WCrw+AKIQdLvHUP6V9Fw
	/DPqGOwARtTG71k
X-Gm-Gg: AZFdTZdmNA1ulB3Z5qKZ90FWGJirlN/IcyeRhXYSKleLDf5XTgTNEyVxBVvlssAsoVM
	9dA9jGzLJKyCs47oCTBNPAVNY3jV28LsgW78YrjPBL5hQHsF+jestEpedgzHVjzFN3kX4rL/jaE
	Ls5L015aAlTEpceP4mrzOg8/7aoGP1+MWQODbwczxYM5Frdq5ZX10pWMMH9/7koKiMUR0kcXeyC
	YuX8sX71RL4bQImErWH96U75rnYO3NgMk+gzz1Pba308F+MPOQPGnhnl88mYpGXAYvBi9AAdCLv
	vxPPCQ7VuDHISJtTaZGTWOhZwvDxHS28xeNBrPTwyIOAE7+VtYxw4s3rqSbQMhtf5qW9NramRCu
	otNm8nXTdTQPWwUwdkuNKr/t1QLmTHev1J2FPNbmaHGWpC/X0JzqQoF7LG0/J43u5qJVTSJ1mpa
	aWe/9ZUucqIwd5jJf4VBDZBgqU7EqjvaBp6yRaTFVy
X-Received: by 2002:a17:90b:3d90:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3b3ffa2f228mr175210a91.22.1795050000676;
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40298f89csm47534a91.4.2026.11.18.16.59.59
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921161ab1a2so6783516d6.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049999; x=1795654799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=XpPGTWL4EUv66qGdgWCHdakIdiOL65GskTKAQNxQAtczh7AoqgCAs0R4fRe1FjFgIL
         2CPnoX5WnckfkdSedDEFthZUBorFCg5L3s0FSUECYam+KDrbwHoClc+hSZu/GZpYqOVl
         0OIw1exrXqC+0xd3EpqyGWGBqWGBmXoCiVMO8=
X-Received: by 2002:a05:6214:1c42:b0:921:11bf:51c1 with SMTP id 6a1803df08f44-9212a287872mr2987316d6.27.1795049998695;
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
X-Received: by 2002:a05:6214:1c42:b0:921:11bf:51c1 with SMTP id 6a1803df08f44-9212a287872mr2986916d6.27.1795049998116;
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:57 -0800 (PST)
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
Date: Wed, 18 Nov 2026 16:59:41 -0800
Message-Id: <20261119005943.999981-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119005943.999981-1-florian.fainelli@broadcom.com>
References: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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

