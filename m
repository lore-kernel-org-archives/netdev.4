Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151860;
	b=4yJO/UCev2SEpvAWTrrSTXR4TB3kUcON7xz2/GVpPwBrzEYqgBhuQnTVo69oBVgkxghe
	 SB9yNTr7Xje7VeDPfTKGgcJQmuBZD3eXhyZS6IOKUc1NycW7NqKDAIqfQ2Q5Xf+Zrv3if
	 A4yhBknWUTx6XibtAs6+V08ze9l01bTrJMiUwN/LWcndxK4vzzFtMwn6Q3DbrnePFt2oO
	 n+CXFxze6BOtFFuMCQsKMo4KUxOlbByhOFlcCoTSOaXB4/A2rmjZ3Jq15plDsyUPTVnGe
	 OjSZfjL+WHfapLy9Q+0wYwCdKqka7vMIXI3eupOOfwrPXomyAAF/jYZt7RzDdpnzx9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151860;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=YwrSuAKnLetI5kpBubmyLfmR6doDgpdAiarjh9pQOnXJLlZ4z2nHLe1wKxwPnEs5WsXg
	 4MQyw1aremIUAShsbreIp8U/d3+etvnaZof8LXSRZU4TXUCPMPl9rRuiTcMioW3RmLBYu
	 VWDeFGAaxnfz14wiC5Arw9UVVCpLvs7OfojPAOuPSccbzYBQ5t0VCNfjMm0OU6WUN9cY3
	 ncHLSldO+dPL2VFndID+IZsbJe/YCyWRA8L7CytdZg3eIEaWhngpjKNP06+hNYrd44LSn
	 IxeQQpsDtr6MXuPxTa4zxW2GSqybgUv2lXZUTa4H4tX7tEo3ZBzUULmmFHD7twkA2Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCRTtW5S;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB5E60A2620
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB5E60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCRTtW5S
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso365129a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151859; x=1795756659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=OsiqkMFLv67KhJY8+F+yRylqyJQf3wHW2UxeR/kYI/hcQvRQ7QKid4LVPt54Kcwomc
         XK8u1fP4DFi66sYvv5XnQwNJMMsz9BnMZ16vmVmkSVSrXM/M7DEGfcewW9QxH9hp+Rtd
         5oFOibK54KSvRuOpzoob1DrGuRj6THdlNZg9hBWssfu6axqcXcfVu+JUvklewBx2hfao
         QrBED1Yo6x+/tu4UzsV40YgtlDJiQDv4XtcXEw5w9UhEwjEOhtLFwcc/970WNqi8hdHJ
         +/6Hr2XXDsRJ5LFLu+S5O79yWrG8IOh3+1jjSN0N/hoiPR8Y+lh6dZoN9eBGK0J9tU3E
         aZZA==
X-Gm-Message-State: APuU4Z8UbMYCgFujD+13536NEF3/7tfn8SmFdntUrDzX45QYbFs7N2Vm
	CL9hghh0dJyd1w3a/RduG7pzkoErU2LXo2f+OsRbG+tEcWERpl/3s59umhxkI4Nd3U9cdFNHsGs
	SKDUNKOx4PRAdKRLBgKOg5T7/nRPkjPPlrUITBLZS80o96T9QMSlXQFWBg6/LVpSFGNQa8ebj9A
	EF1dNyZEEDci7DuDKm/Teiq+5PK5qdvCnvhiavad/5haheCTngw7bYwn/X++AeTIp7TiCjwT+4h
	rFakFD01ePGQpN/
X-Gm-Gg: AZFdTZdi7kvuYznftoEVtFnw8bbeXyp1OYswIjp/t2U4duYKNnVeD3ByGgvvllw8k1G
	KUZNXEbI8LmOZ1+K2ZHA+hmRWR1NW1JCRLd7iSMwMkSG9pR9ENufvsJn7xJWoO18r8AR8WRLBsa
	p5QvR4yABCvvhSntLKBpxkgTt9rCEA+SmP/D1ZatFZFWhYsdmBq7WLWxi3aF3yCXzqYOt+JKg3D
	QpV2U8nw4PiC1CQVn0L/chLJTd9YxGfg43sbmkeBLd6RNCM/TQ8c1aH8UZnbko5t8vluqfx6bMj
	qiYkmdnR6dOthP+vC+7hAlCUllu7IWR5fKIqrEaxXhJeeGMqzbxGgmyUvtK5O8Ks4c3x5B7+M5S
	1EJR+8Ze9EeWG2RivxZTRbmp3oeg2vRnYYtrT6Q8CPWYmHd4pp7JeStLWRp3Lo7FCDkO8yqGqZX
	wtKoDO3OSlGV6BoHqU6Tvg9Odwir+L67FJl8ETUAN73o4=
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr1666072a91.60.1795151858802;
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42001764esm304185a91.4.2026.11.19.21.17.38
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so106830685a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151857; x=1795756657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=aCRTtW5S+y9cwBX8eq6f0CCSFv9N2Ugx5X88osdwWuc9G94Pn4zc8bZlBiKZn+MeRF
         R2EzQJf3yFtuBoP49Kx876M4bg75cP+jKFxveluqTSOis+cuXmzaKwnAJtjTM9kV7DIL
         nQ0rS2ox81k6gE+QJRgdJdnOfpYVOK7ub6bt8=
X-Received: by 2002:a05:620a:469e:b0:949:71fa:5b10 with SMTP id af79cd13be357-949bab20d4bmr335159185a.45.1795151857563;
        Thu, 19 Nov 2026 21:17:37 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:949:71fa:5b10 with SMTP id af79cd13be357-949bab20d4bmr335156185a.45.1795151857146;
        Thu, 19 Nov 2026 21:17:37 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:36 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Carlos Soto <carlos.soto@broadcom.com>,
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
Subject: [PATCH net-next v4 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Thu, 19 Nov 2026 21:16:52 -0800
Message-Id: <20261120051653.1433677-4-florian.fainelli@broadcom.com>
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

The current polling code unconditionally waits 30us, which was sized for
a ~25us Clause 22 transaction, and then polls MDIO_CMD with a sleep of up
to 2ms between samples.

Adding Clause 45 support means that every access becomes two back to back
transactions (an ADDR cycle followed by a READ/WRITE cycle), so a fixed
delay sized for a single C22 transaction is no longer meaningful, and a
sleep of up to 2ms between samples can add significant latency to each
access when the transaction has not completed at the first sample.

Instead, poll the MDIO_START_BUSY bit every microsecond so that the
completion is noticed as soon as it happens, regardless of the type of
transaction. This turns the wait into a busy wait, which is bounded by a
timeout reduced from 100ms to 1ms: a 64 bit MDIO frame takes about 33us at
the lowest MDIO clock the driver can program from a 250MHz reference clock,
so even a two frame C45 access completes well within that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5f79f31220f2..f8e5c1811d96 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -6,8 +6,8 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -36,6 +36,13 @@
 #define  MDIO_CLK_DIV_MASK	0x3F
 #define  MDIO_SUPP_PREAMBLE	(1 << 12)
 
+/* A 64 bit MDIO frame takes ~25us at 2.5MHz and ~33us at the lowest MDIO
+ * clock the driver can program from a 250MHz reference clock. The timeout
+ * applies to the wait for one frame, so a 1ms timeout leaves a wide margin.
+ */
+#define MDIO_POLL_DELAY_US	1
+#define MDIO_POLL_TIMEOUT_US	1000
+
 struct unimac_mdio_priv {
 	struct mii_bus		*mii_bus;
 	void __iomem		*base;
@@ -79,14 +86,15 @@ static int unimac_mdio_poll(void *wait_func_data)
 	struct unimac_mdio_priv *priv = wait_func_data;
 	u32 val;
 
-	/*
-	 * C22 transactions should take ~25 usec, will need to adjust
-	 * if C45 support is added.
+	/* A frame should take ~25 usec. A C22 transaction is a single frame,
+	 * a C45 transaction is an address frame followed by a data frame and
+	 * each of them is waited for separately.
 	 */
-	udelay(30);
-
-	return read_poll_timeout(unimac_mdio_readl, val, !(val & MDIO_START_BUSY),
-				 2000, 100000, false, priv, MDIO_CMD);
+	return read_poll_timeout_atomic(unimac_mdio_readl, val,
+					!(val & MDIO_START_BUSY),
+					MDIO_POLL_DELAY_US,
+					MDIO_POLL_TIMEOUT_US, false, priv,
+					MDIO_CMD);
 }
 
 static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
-- 
2.34.1

