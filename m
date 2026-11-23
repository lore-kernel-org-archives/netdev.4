Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452536;
	b=FizSLa27ZEaE+qbN0ow5pUHijbgmY0jHvyynLO45bXZb7RXMSRTbG6mtIl9/7uOZYlN/
	 g73023PjwGZrmGL9wgaaYzb9qJrppKDwMPYP+Y6GJ/Prh/AHC6ZLvfKBeltlLMJMPXfjz
	 sPvAD6HK0R/kzPZVJ2MrKRE9sEYDt2sshlV56LqZGoyLV4ozj5N8TAbVVuUSTE5cHnHLB
	 sLjoB9PtV687dx94CtmuoWpKtJ/0gHn9k9GVmQs9MG6VtfXzEP96T13ZR6CnicmFN8uls
	 TlRS1FeHipcB7+u4ApXJA7jL6xT+kiuU5fVukYnBzoRcaVwvfbOHlqdGo+pk5oZX8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452536;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=LWIk1IYUV/H/cNtXkw5Qo0pzLAPuTclONHqTFK3n418ReOR4zEfg0zgpTux3l1emgt3z
	 m/ehO0IOGuvtxx68wnQmMt5/ijB2bTRGfP6nx3Ohy52u1WLoohDxoZ3GYQGF+hJhCMb+t
	 442KNMHpsb1IzIKnbMM6rvfO+EyiFyv73h0Hf1nAHqow2XDpeoR1xWIGtNjle0uMGN/YC
	 nrr6GiokxtalPF8A3R2ypCOgEw3Hvidg4SQWPfxHNgCWG3znwmxHw0DfX0qWUPlmBm8P8
	 6B9c88lUaCLyz2ZF+s29ChVn67i1scgOKrSFJ7ayev3wwHtPAEG1YGQbV5Uuv9JXD8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=efmFVNQy;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C4606A6AE
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201C4606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=efmFVNQy
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1340520a12.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452529; x=1796057329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=mtTODv3/WdLJ3rAlJz6kyDrgiHQuU0r0kOJ0aGRG0Chj0dim9BzdGzis3qLPyuSli/
         ksLiavz3Unsypd3j0mjJYHdxUxofPo8xGp6WuBWtxlkuwL1gsP1/MNQHDNReQ+iX75Q4
         mqgWMx3AQbmvTt7M6CCuE4MqIc+h7vjdoI597JniaWms+NOMU5fEd1is9vBm9x5dnRFI
         FYEhLgPQaVq32VD/uM+A1cjSm7FzpRRxFs0KplytMb3wuo9RzYrCmLU31uNF9yoU4Y06
         HIjP6vIWuIOiSQ81XqhMekDAGWdYUBad39wO50Q7myBynYM8v8fbNdACmEJmhu+bu8qD
         wecA==
X-Gm-Message-State: APuU4Z8V5cGLKWYfd53BuECKl2eXTxPsrJKoK4nrrZPF2j2sFimG66l9
	ZJT2uGDTT7H4Q6csw3yMJJHa7N9tNRobs8DM99gzcCKY/xnNpiiGaKeijw6KVqn+yvLEAO/ZdSt
	sKJh8kdsoLPjwrl4rZ6+0QVAhHsemC/ayc9Y0SHcEhlwhLncOz1d/vgbRwWK6iHlacfD/I78boM
	u0zn6BeVcmhQ2zJyiyhUA50lFY6yLEW8XkPjYlGdXYuDx/LRi6hSRRkqD8p8sldIVRt3cvuEgx8
	dWTvOFLbJ1cPwSZ
X-Gm-Gg: AZFdTZfkSa0tbVzQBTaWazitvj1fl2GzonUrei0XQx2MfG1qrkC9YI0AjbD7CGAfCG2
	m/jYJs/Kdh6EXN5LP6OnNB7lxjwBbC8I4ALCvVUKyFpxTXK69fEkX3ZgE5SWhDZxxSQsS843SYS
	rpc0Cl6fRxXl6/X4FpIfZANQEnccFMtc8fmdHDgVb5blAYLZ+xd9uw+l1e1tHDud6WpvZc/Zxjj
	S3yvZ+bAJOqtAcUtAQwe+oTUJ46khk00BUiDtfpFaQcNavqUL3P2Ug5MSV0P44K8T3zNQND+lts
	oAhOCPp4GytGO1BflotqfLfsFfULkVVFq/XcWEQoufYXERuGI6QVzCAUqME80ITnsDZ4uDWU3pK
	fd8RHPSMdYGPFNKkzoSKgQ4fML8wyrnznibEqGeMlGUEOCG5ddxdsDuYA4V20Y+hpOilGMUH3Qe
	U3BSa0Z+LWJEsqoHSyk9YepzUlFKeR5t0+EeHfX5DXgF4=
X-Received: by 2002:a17:90b:2d8a:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3b41c953639mr10454285a91.48.1795452529208;
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add89d3sm8729510a91.4.2026.11.23.08.48.48
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92125ff2d08so5299696d6.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452528; x=1796057328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=efmFVNQyuaXx7st7qoOjIl5ImWhj87JkZZpexxAup4OjvVq3JzqJbA4R6MxuKxa+v2
         OGyfdQbtctzsmaE+c7kbxvS1REH4Bw43vwiUDP66+yzEoPRGS794JYnVnj62BoreyfxR
         cA8tIGtt7kEneFXZg9WzXvC2Dpmv/6s9eYjzw=
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1794772685a.68.1795452527819;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:947:b201:fad6 with SMTP id af79cd13be357-949bab48436mr1794766785a.68.1795452527266;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:46 -0800 (PST)
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
Subject: [PATCH net-next v6 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Mon, 23 Nov 2026 08:48:33 -0800
Message-Id: <20261123164835.1733304-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

