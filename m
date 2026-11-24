Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546713;
	b=qn4czMlQM7j7g7d31mZ+5Ed36SswdFLrRfq4INMaHd18zsmU5UfdNPtmAfux8AnjSJdu
	 +IVjw0zIMHjHA7ihrcowh6CnKDSU2Jo8TdpuWHo0KP8f6yX68LesORETTdWVf7smZIvg1
	 zfk59ZGqtveqQd8B6Q2jeL/gbDL9EObKiyuVqO6bhN+s4CH0FrFVxUnH6FgxZLHEB+1yL
	 xKG0vSSqWsBCiAhgQx5YEU/6LSXJHcmav0LLGl7kCsf5bMFinRgqIBKf5sKpCp2b7hnKw
	 +qQHUE1IYYilQOYnX+fmjZfWF0r44r7QI1hwn9yPVKZwXQg2oMybYGbL+xKL84oFv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546713;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=fXB4d1nMhkaKhT3tSJoNvgpZAwa0yG0NATKsQNzyjwcW0GgBQOKXsGRVoG8oueAUPh6J
	 iX9AHJZL413ONNiY1KTZK6CSTdPRO7QP+yIZiAch9oeckNks4+VYwFDe6PI8WJxCeaY1u
	 hm6MjGhhTwWPPWpa+M4rrcuUNwzLIXMMi11yZCWb1B24aAUlO2i67JAFbynnJ6Q5UI4N2
	 GuuPCRrDDt0P9zwUQIGgA58lq+eJ5mqXvIILIjO1Thc1y32eHLmZPobIvhnWGb7hseKgJ
	 834+YBSOzbENG5Jm3mX9E0EX9x9OWL7O47YsE3grJGS5aKS7fayxJipdF4wN8eBwnKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Li/aPYHG";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136B606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C136B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Li/aPYHG
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so1272816a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546712; x=1796151512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Vdh14ngIH+T+rHon1AGv4dSwKTLRhmnyALKwH7j2g1SQoY6pssPSfibw9+AiHCC/94
         62yCQvIdQY2CZTlQCBKP16JA7YIYCPhctZuNd5itDDkXc5sO8pgP1Gp855gQEOGrSmgz
         yy+53PijEOlx+510w+i8K8R4rnmduoKCgMo8HEI+nsg38/27x6DcWUlLb7VHBrSntRRE
         LAyEk6k9h+RYEUbbsDhCtO4TEcqF+MZN0dng/Jgq7FhrjTrKc1XmTpmaM8GvD1BAYu0i
         vyIKt1u69l1jgKEAX+2602SVC5tVTRuCWUhL05BTCCaILfJ6CpU88YCah7HytwGVQhe6
         u7ig==
X-Gm-Message-State: APuU4Z+/ktf2otgM4OEnU4ED++rxn/x3LckruXCvf7Bzkis6kd6afT3e
	R434pNWeCoXqjux93/yq4QRcQRTUppfwnRgE1oAwD7DzJWX9+SpHArNnjV7a0lc37yVYS9iSt2D
	cz+yUm13cbES9Z/+5vMH3JXJOaCQkd/648A91ExwcL/51Q+UehaLPNFmJFEvNvWDMCIF6nCzq1T
	SIXla8aenQrkPDqIfkHFDPdSzBpS7o7BlGLBHdkDMUIV3oYXGrnImPTGICcmPGKenj4Z3R5J1hp
	0T+MY7kj2C2SgFH
X-Gm-Gg: AZFdTZduae7eW99p2v1PNdEEyc9mdeo1J0HczrAg4UjAchRmVatO4mMplZdiaFgWudr
	AemDLQ3obZVzLZG7Ic0Jvq2fV1wj2S07RdKK/IlYv6YFVRgpylvkAQKC7Y1eKuJtrttWAGJvDte
	8c8fPvGIWcj2A3+ESSS5Q23Xw0O+5RQKgBZzZOjZCJwk/cfAsiIm5ocNQh2yrqe8887zUaz4JU/
	q6fiQ7ISqo4Ij4POAtLIRTKfc26uhjOnJsoCu6UWfOG7x/E1tOrh1SblY6RHpZENabcBs70e4YF
	w4m8GJYh05W3Dt4wzEVZ0V3bTuKJyqorPAS3AgXIDkSv/c1J34UxzDotjYooIafXHyTOnEZ2zH2
	VSu/RmfNZLc16Nh8rAAWh2jxYI/cIbhTcxHqur1C5zJnKa8WgemQ+QH49f1eCkxG8VqlkO6gGSd
	1kVfPR5X18D4vJzrev7JFtbRlLx4bFq/XcSJLUSjzslJk=
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr13728553a91.25.1795546712027;
        Tue, 24 Nov 2026 10:58:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm11267572a91.6.2026.11.24.10.58.31
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so12687570eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546710; x=1796151510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Li/aPYHG1qJpLvZzvgu1M7uWfKUx3TzzYrjZb2Ww99epOyAoy0FNixxCbuzapFLFTi
         Ph93+rRLxbrHob3XJLoZ/+qGUahBvs7ONiblzwSLq1FuaQOVYmW2d40TGO17blDyhmhF
         UvXUQTp6TW5gb9IbTCXRN7cKEahQX17IUDxSg=
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr18198111c88.31.1795546710121;
        Tue, 24 Nov 2026 10:58:30 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b55690919bmr18198061c88.31.1795546709359;
        Tue, 24 Nov 2026 10:58:29 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:28 -0800 (PST)
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
Subject: [PATCH net-next v7 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Tue, 24 Nov 2026 10:58:18 -0800
Message-Id: <20261124185820.3954716-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
References: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

