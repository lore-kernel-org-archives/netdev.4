Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546715;
	b=dtMCgfz2G+WuEJAMr2kSQuiidcHiT0mNE79ZCaQCYHVWbKzuWisChQnHfGJQg7IbZQ0z
	 /i+QD5Ix5CleI5/hG5b70WDBdvgz8pEUW50BKoeuM8IYvMSG/xePLckDJQ5QRyON2hEPH
	 4lw4zorjwGXDiZoiyAp1fhnVDUUh+sbJq9315ZSKuGNQZba7AW8A8QExQPm60QS5Dsele
	 Yyvq5d7HSRF9FI6/FILrswIFStGjgkISLd9qEcSF8sBbv7mUU8fPzjG+f1MetYqjTHsrF
	 NSmDlbYE1EHhkpvNmG45hT8hXU0HA13nufnDCU3OsocyQX1sEgs4rtszNXfwoe94edA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546715;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=MeK1xYzDIB5XbeC9SNuSg23ekskK/hjKTECiUVSZqg9He9bAXiWzjpFXi1h26jECX9hk
	 X3DNVWd183GZfYt5CiRjaaiwKXyQ8oVDWBVCfH7wTIrtqnZALSBH8Z3I3aoRu5xEFbQLH
	 s9agYDd5VOWPff0N3CTt7SVF2Kl0jgaEaLvbhe4iUulBj+VF0MLBdOo/YcBlrPqcvaVc+
	 toxGu1ezMTENANh+8NOT46U8P8vf/k7xiKC1KF67x34/FnBIUEnRFwg7ku4N6p3WZPyky
	 YNhhHEQEeB3/YSsFUhsQWY/B/uZ0NJCuhz8Yq7o9WSZrO1pL0nFllK3uSs9Jo5+r8/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ONq65drB;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAB606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCAB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ONq65drB
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-94961bfe1a0so321579085a.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546714; x=1796151514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=OlGCJnmcURfVOyDWTFCwBVx0Gj5tXIa+QcDG0eOKmaRb9isLf9c6YX85Esl9cv9s5+
         BzJg0n77pmlA9RAh667vuCA/BL1iv0UGHva7HbPOM64VoXjAdHd652hrCHV6zwV985kf
         7+vazrvBc0NXI+WnL8ScunDi3b4HxLRObbw9RruMBwWp3IhZvtRxSRoeHi8AqJq8bTjd
         NdQAQnfIv4YMiimO/XTyne8sSbPOlh+A7uBUIB/n4C87JxrlkzTl1JqidW1z7shZymFk
         iFHHDm+B+h/SaRO+Uz8lQj8EhW0mBixVJQ+/KC7Xv6Hh2MCJRpP64CU0tnXeNJYBhYUl
         lQeA==
X-Gm-Message-State: APuU4Z+NUwMYT8Bm+iFqNJ1n6UHO0kUhQ5KpygNAbDXNZk9xebWhkWuK
	Kp0YaWmcDoJR2ADfk3DWC664JgJnQ3o/Uq0xk2GaEZxJTCh3KY3NfwtwgtCY5kgxcEH7mPxU6+H
	4fopSi4sWQzDgKNfXL9XbPd59D+WNEmZ1SC1LHWycKX0cUdU59ddM331RoobFZRjW/jhvcMui8p
	QcEEAYovvj1Ycfkbs3qoFmmn5RMzFSjPXFCKOpqNI3vWhqc5GziWR1J8URAABswLB70dekq2agm
	P1x/tF7nArQJ4ht
X-Gm-Gg: AZFdTZeuUqO/YJrma5W70DhIgOO8AWX/oa8ug77W1aYofL92y7ny65dJNiM7Mnkiywi
	D2V6jAdlvxeedEVv0/LRjzUXgirZA8yvaiiei3up59Ig2Ii8Uhlyg6AuejSvqb1lZUR+Lq5xVY0
	sNpAqxgtY5/CJVBj6SeGMKA1miLHHyX5zieXw4gTu1k8UXSMrASauEfO5P48k9Hmi4EOkb3/xV9
	3/+9RKbb7a1rVmHPFzwGztxebRqraTwqFtg68Luvb936XbW00HwfTQq980i5Cg0SNhW719roINQ
	N1lT/AO1i9HmyjAP8l7pilQHEkPuUtJcF60CUy1pqlOK0NKSngAtCFO3htvduVIh1fHGiHZ8j3w
	1djQ2ftkJeDvzDl5DOlptvhj4zcvtALgsSTCYnrf3cJOqhs7MBHZ6GPagLR1XTz8auX597JQ+27
	GnsgJdfJmP14cGadochJxc7Tt26/g559genMw60igJk/4=
X-Received: by 2002:a05:620a:460e:b0:93d:f7ac:4706 with SMTP id af79cd13be357-949ba8260cfmr2475728185a.9.1795546713633;
        Tue, 24 Nov 2026 10:58:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949baed3b2asm111593485a.0.2026.11.24.10.58.33
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so2944212eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546712; x=1796151512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=ONq65drBFlW92qG6gvctt2Xq0C7JXeJqHX/4rw2NkPWPnv9KANebEypEXQbHMZjehG
         Tqr+pdgx2AUdlNrO1mIh8Gc3LmLALwWzKL3NHrVKTHxg9x2OrfgDNs00GjXJ3ceLZVPt
         ClfYMhlzedIUXh2g64s9fzWHOPlELXUiVgEZ4=
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr15312932c88.10.1795546712182;
        Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr15312881c88.10.1795546711177;
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:30 -0800 (PST)
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
Subject: [PATCH net-next v7 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Tue, 24 Nov 2026 10:58:19 -0800
Message-Id: <20261124185820.3954716-4-florian.fainelli@broadcom.com>
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

