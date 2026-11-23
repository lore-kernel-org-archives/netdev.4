Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452533;
	b=BsCB3hj+TowEOqkBEEtxPaVl/Rt3jd94uN/m9+PMa5baYXmqrOdZlogavWMabw5mdDVV
	 Z1+2f6FnapUUMSaHrOzd0DJowBknff+6eNhbNP4LQEVtP34SxQ9ofzc5drr86Uy+RL3/p
	 JEDtWDJYjuNWcUzSZJ5Hyk3pta+0sOiCQzF0scFtrV4kqFM2QOA6dUSV5COT5CAaOxk/h
	 f56eRnDZb9Nec1bp5LYxl5JihBUknnMdy8F6Pd0EvW2P2KadiEzEd1wjlroxvGHsyxA2Z
	 j+LhIA05zlmukTCSWWb0HzJr4txP0ARLYl2/k/1LvFzvg/CbP84trOgC2AqzzieeZMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452533;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=4XysmRlYtjkTVW1lGBukrP/Ulju6kW1Y8c/QXFhNCF16SWlH1ZhcORJWm1N4cg3hUtzY
	 aKgXyv0t9sZiSRUjwmuix+LmxRISKaXwBVoTSCRGyX1am8KfWw/4Vc889vsW4e+/wsbzt
	 3JgS7GBHqKqqv44s/Vc4F2x8eRY3/6RYIQst6OOHbnbQ9aZ7lGrTPIwIrdX5idapCaW3W
	 pa5WCfuTYCmQzOMxxfQs/y0taqQ0WtFl+Tpe5d0jJVj9ZFinhCSwM2KziYhE6QsAiWWW6
	 oG6dpaWzxQrOLbhwDgWEWsAon6mbTzehytfCvdDzoy5Eiskf++Ws2fmco1igIME46AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LPLMKhE4;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0091606A689
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0091606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LPLMKhE4
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-382f4710a17so6007193eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452532; x=1796057332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=Dbv76CP6Os1R8LcUg/drpR7aBxGXXD3pd6+gzb4C0bW2Nz+nikQuPjOSR2EgZVH36N
         oy9Q+pvcAd3t9zG2+ZrvGioMH4FyHUxL1VQrefP7ZHdKngtqQPOWg8auj+GrJkQnkehg
         GOGcsoBry8w8rYxU5w1/a7u7gV+dA616JoCC56nhUuRkB1qpCgNREY2/QznbSchnONec
         27hOg/YxpsNeSJ9Dq0n9PE7O1ZNdlCzLbz/XBJIBQC4je9BSECA12qFxoxvIwviGfIIL
         dUblfTgAurwxRFIkc3/gKzl+8SMVotdb3jeb+1S9avi8VWnfJfDjWm9TNwdgSTy+O1VO
         M4Mw==
X-Gm-Message-State: APuU4Z+ByMP9SKOJSKC0dMCQWRIkA9OFg7tAAQ7Rso4d4AxC6B5fONsN
	xZvVWhR7UdTP5h+QLu9poP9kHMSrt4vthkt9hLaMd9oO6NeqLh/NM8zqyQd47zVTnUn9Kod/PkG
	cLwftspyIKDtl+x/34Ue/bDJdPxrnDTQYgBoHF2uXT5u199cjaK3BTLn7qYLWkBqrslrmgA0vd4
	gHHBK9B7tNWULAL/IrtF5RGlowvgce7k0SPIaCcMvXJnWMrysNscYakKdcZYkuOGOn0mvii397z
	iOu4X4UiSYf17HJ
X-Gm-Gg: AZFdTZcMtOqmYdgSICrGHI/7qaSq2tlePk8BF+0WjK9el8S08jTWwUlyeRhmXCpZuu7
	IPm8JL2WGPT4GEWt+I05Nfauu/0uzbtlRxXTOrdGJdksqQiUqg+C4lFzrRhvorehCMHm0V8J9iz
	XSWzYVWd1rjp4hK0g8efjZQo9dhfRhOzlz4XWrVnpnoomp7yPdPTdk0+d7f123w2AC6EPYOKNnB
	WKEayTm/FHSQJWPLC7hTd1s1wVqH64YgJBf+abfXeF6tGJTNkNm93OOVjGlqRcknwJIrBByofuo
	ocAPreGU5Jq/CAx2v6RGtJDmS+4Rd9QNiJNbnptvSwi9gDAN9uPReF9tE8Aozu6j2DEd8Tim4ke
	6mO8ZMFk1pwXCXdSDkjh/D7JjDUIqo/M8TUNkrXHiI6X7nJEp972X/PAB1b74xbEdVVk5xV3Mk4
	67BMXKDfv6qoFXNPNqkty/tuIChju1zlNZOsc15Kvrf4I=
X-Received: by 2002:a05:7300:bf11:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-3856fe59b16mr12414055eec.10.1795452531423;
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385673c6e98sm1506291eec.16.2026.11.23.08.48.50
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so574401685a.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452530; x=1796057330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=LPLMKhE42YlrVnDLAImInWbebd52o02M+8FS0ljzbHcHYm0RlMQ25XnMOHPuqTekzg
         Q6J9c12W/5ozF0vXqAznst43/zUqsEEt3BYWcaY4zFhGUYzaYKHl2R6H6iUyhRuaxNzL
         JA2EFiCZHDPK6sX85M1t7Uq7B1X9QTC3Obj3g=
X-Received: by 2002:a05:620a:2a05:b0:93e:942f:b8b1 with SMTP id af79cd13be357-949bab0eb61mr2148252885a.64.1795452530104;
        Mon, 23 Nov 2026 08:48:50 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:93e:942f:b8b1 with SMTP id af79cd13be357-949bab0eb61mr2148247285a.64.1795452529527;
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:48 -0800 (PST)
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
Subject: [PATCH net-next v6 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Mon, 23 Nov 2026 08:48:34 -0800
Message-Id: <20261123164835.1733304-4-florian.fainelli@broadcom.com>
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

