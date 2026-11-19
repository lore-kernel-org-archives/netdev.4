Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050004;
	b=flHh4KD2kSUi3BPIlEbzIHfmNWzgYRBQHSjS+K1IvyryQUHkqzUbmx9Q714tC5RuyiIy
	 E+2/FYSNjaDvqpp+x3cD/qD+HMgWr0FN550gLwK+naaCB728EULquUpQPTLZfrwlP2GKC
	 j1ps91BskPEqDeyJpeVD+TXkA4oYm34GKf78FCTSw5BRz3MVwU/3+dIo41qkYJF8/ZXED
	 NKiElPhQrzBKlo0Bueb1IecBI/ahZ5nyPRkj8Mv2G0AY+RjI0TC5N01aVdSv5e5W73rev
	 5KjBBA6I6WL3uQ7vOBZWb+SPPTXoORxEFKJ07AY23i/9ayl5mx4K20tQ9hkd1lsaLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050004;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=vswZ3n1sUnQVAtpA/7AamY+TpAXXPJ9PneM4qvDfeZJXbFcGWgbCZD5FKhrtb4x9Lprx
	 tPOu1CYK7MPCIJLhE6afBX0eBzESWLx1OzExItC93BrThJhuF1zCbLfaNZnTsxQYyhYjr
	 /1lfgxXoiiZK//vmwcAEJf8CoL1A7ca3YkP264zP8W3KHsvD3FoW8Izooq1HThDBpSv48
	 i0TgGbUnqMUtisa+2LZJuEyMa6KHy4NK6wgm9ehXzJpGz//n/wnURGVD/Cn3DY4VOWILm
	 cw6we2qv/ZLMT9745HuH7ekEZhgiWnlrzPE6e0M/vnIR4q7IKDBqR3NOKvoZ1pyTeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YVBgw8y3;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483260A262E
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C483260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YVBgw8y3
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso319867a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050003; x=1795654803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=oE5e9WJtQZSajxUF76iQQVfQp+TBShzGVmNe9eKhB7nSJM20AWYMTPhn62BiQwRDNw
         ayZkibHshsjmqmd2IUplOqO6dn3L3kueVlU304djlzIjZbnJ6YmNuy/uoZCCKDaWKSJL
         m2LY3dm3Xd861cgFLCNdCdLzJBOug/ilsfrsLHdFrKTO8qrMwjw9RAw2XYbyDoD2vtKi
         60lLBR8PYKrrtDTsflDoUerjMlKN5Epm5uz7ssW05xojlZsh/15bGQKYSLReHMP8sOBt
         pahtDjgvBrnpUGT0HyWpiLiUwEjY9/njCIZBgBVfJqIojR4aQEljLJDTVmTpSN7fRXqy
         GNUw==
X-Gm-Message-State: APuU4Z/9R9ZT7vUM9MDMieilRyV9MToXVuZXbypl9Ln8tI9ApspW/p8E
	f+491W55VjSV6iP8yZhC2S8FLbhye7gR1cT+L1064gUdTxKLClSGuH3KSdTZucTMYa3yYfOI/D2
	AgC8k+MmihUZHTJi6ovvfBUVYGvzbiN+S0rRyZsEmf1vmq5X3B2Wfsl0KAN2EBCvhtdmhTuO6vh
	fny9n5ANw27e5ZiBX+gytzS07wl0SuAJ8hBQm3b2TkbZZptLihx5/HUWQrsKZZA3Jqx2UxOmGN7
	6dM63UhN5lWn6g/
X-Gm-Gg: AZFdTZdSlqOS6A9rlL9lA7fgOEawX/+H8XfDL3ipqngGJSoJ/yf3vXvvcbE/ptfJ1JX
	XivNBWqU3PB60a51IP4dzODP2sr8H7e9r/o55LS6Tp/MAVv3IfgIXM/xJtKoOW+KO7CTLD6Gs48
	b0BWYIcSCPVZqfCoGdnABV1wZWwnm2Z/upoyGIl6jwFtE7EXmWUxnSPoOYukIwCIxHGtRzC8ONF
	0t0ekVZqmVkXGF2ta05MV4jHTfq2HMuTuXxfgUYEe50B67AhzEbUUkhT5SwasUHx1pK2Xo9SQw5
	avBOxtlGS3amg5I5S/f5Dw4v/yVGGtbrPofPBTTWllMYg++2agMnf+s15HJJF5uuQgBimivp9eI
	FoqnXEON/Cde+3jlqnf0Dev1o9RIlEfCMtLQEqlcf58J7RADRndS5lSKhwKY6jbukkxOe8OFyXH
	XG98oLVdGjXK0Lrnl/LzIadZeHYCR4MyETt8vJOpRO
X-Received: by 2002:a17:90b:224c:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b3ffa69b06mr181229a91.34.1795050002907;
        Wed, 18 Nov 2026 17:00:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b401f75ed9sm68469a91.0.2026.11.18.17.00.02
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:00:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-921161ab1a2so6783906d6.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795050001; x=1795654801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=YVBgw8y3R4iU4YbOIqrRky0tN6DM2G+JbDehq9AXARRKcOooRnZ3g7Xzz8t/qNay01
         aN7NZOz4C8m6JzhAUtxgRAUEXqYtXeTXRSNFq/CGUJl3Jq3keRH0wnbByvwveP/RhP4N
         6YzNtebcknvn+JK2M8mJfMi0ByKU+upfoDG/8=
X-Received: by 2002:a05:6214:418d:b0:91e:883b:cb2c with SMTP id 6a1803df08f44-9212a276df8mr2620506d6.26.1795050001088;
        Wed, 18 Nov 2026 17:00:01 -0800 (PST)
X-Received: by 2002:a05:6214:418d:b0:91e:883b:cb2c with SMTP id 6a1803df08f44-9212a276df8mr2620186d6.26.1795050000529;
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:59 -0800 (PST)
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
Date: Wed, 18 Nov 2026 16:59:42 -0800
Message-Id: <20261119005943.999981-4-florian.fainelli@broadcom.com>
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

