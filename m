Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203824;
	b=trO/101LBMHq/bpP3w/IDiY/QMDYeDriEFyG5ZwVXyE/IVP8bMehpK3NaY7XrjKOUSYA
	 VSHupkwlQlBA2Rn+5HyBE8ZhiaJjDc2o998Fb8p5Q9j3tM7/mex7LjJ9hmLGtV56Pf/6W
	 SRhbybQJ6tR6kar0tDHAa5y3RuFVbTx45KAhb0AMmpPbhzJG77WlgBW8G7Dj+zGGmUOWE
	 iKzEDtxk7z1PI6GN5Mm/LeMmr7umZbUSq1n9MaWUFh+qOibFt3NK8GVoM6k91auY91ltP
	 lvUZ1TbPlQFil1UjZIMxHvouLMnznSaWwD04RZ7pQ8ChFCaDivZP1vwstmKq4myxq5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=3S9TK5hfowNquZZk2AH6BrFZzPri1kSQiAQK5Va8kqA78ca5AXRKKScENSbjZh2vuv/S
	 SUEWKQlEaoviKNK9Z92AvHgTHbdi4adLyeVW5xpGewwS6uKxjGZN1sdqXN7S84gvmSDnT
	 OD5eAtJOM1xtzTjdiXG9EdGne+JCq7kOtSO9R21Ij8zyeYkdwHg5D5IPNIrQbXNZweYYF
	 85X/qTNJF8Xm4HMoXf2hdot9OEmH5pdZbU3/hNDw2ZqZxgj9FaVuyQciQHDYV6z8cJ86G
	 RmhydPP2od94EXs7uQ3kPTjrf2jjllmr8uBWvbqduYamZY+jf832XHQzI8mtkz9T6zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hiG4EAHO;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BB60A2608
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7BB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hiG4EAHO
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb684859cbso768010a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203815; x=1795808615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=DBK6tABSHLS6PnnqCNZTiewkZ2LpBq7An3KPFOdQyAnUJI6XuN2A0K4q7J4Nzv1dqg
         yKLx6KPTIeuOZ9U4omOso52qap5rtZFIAyjreR+J1kz3UeawA1x8te6RyniOy3AwA0Xb
         kEp7LX7Nao9UaJMmPsQ/KgaFTgadxyF8ZuURXSGLX2jcQTUuEmF7IWuZXEucqpOl6fkh
         rXoTSI+LTFkTt0P/OODJ4FzPXR8AbQA2gF3HCcBUnmPKpg4ECQYHf9Efi0uGU3n6LJgI
         ZOzenHOJPOEgk5eA9xvq4LHtYbzhsU7pXn5okBhp4gwnI32d/SEvlQXDVB10vMxAP0Q+
         LEsw==
X-Gm-Message-State: APuU4Z+RXhXiR8UVVpDtgTLJFm3IWZScKaG8xi1tGXC0IlUgwSPDvt2H
	0v2MNcSKNtGCMTCYBkGuzSRyWtGdJ6RwZ52lR7r0PRTlX+91WlwNjFU7Di+LDvFp6vphdNACMTO
	56Ow6uzbMwklbeN9cyGvL6yHZhIHGAnMx6d73o6ooeuvmHIvyuGrN2jVK2mmwUOu5oqFrVyp4wf
	fLnhUsxir4OMqWNMyLG2GwhtFkF7jNCpUWRJEyeTEDn2/IeGzzuy/JeU5Ecv8ixUEQjPq0GaE6t
	fAme0FnOciFL1HH
X-Gm-Gg: AZFdTZdkY/6LgpfQQTsmLc+R5mNnMX+0LVvFQPiLLt1ctp3qeEDtimCYTaDy/+h4GrC
	sCo2nbx+80Pm7sWQsxsx0vH0J+xeWq6HJrGu/FgCrQlQoVW2iLBGvk+3fcJoLm71zcAf+fAkvOa
	AHejXZZqQERmex8ClmLwq11WyBD49nEDk0PvkAmkAEJyGmYz3iIP1FY0XQzNGZrU3FfJ1EY71t1
	nYpde+iaT0ZHzpi4W9FDsM7yQqYT2ciyFYiu/NVzZSC0EIq+akmT+kprayU6MuOgYj2mNMM+fk1
	v9sDt5yku2Bnka0BeYYDQGYEspUVq27tgweT77mt1QtQtXz2OyV1bB4LajmWuR38eoZ8zubk60+
	xG8sS7jYSPOvcjJZiUniqEIWPfDiOVGl5d35XEjjXpPNk94PcZDWoBe8y1EDio6Ks0LMBDb18zo
	LmDBhMWbTsfQbyxdGa/ZiRA2jHyQXzztfb8INXPkCF
X-Received: by 2002:a17:90b:3f10:b0:3b4:1982:45b4 with SMTP id 98e67ed59e1d1-3b41cb212d5mr3639844a91.57.1795203815231;
        Fri, 20 Nov 2026 11:43:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm3666522a91.4.2026.11.20.11.43.34
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dd37so30433926d6.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203813; x=1795808613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=hiG4EAHO9WU1L4guBLhCOyi9rdq3TkzdEW3I1MPc0x+tmjZR/H4WauLDhcD9+xZ+H2
         9xmEF2ekcavRbyc98dbuvxa+9bdYeVEf8Xxpp9ZEBmCQRbsTrv4zvwtvUiOP+3LGORow
         cu31objLdzp98nCrzng/sjplvv7H6y6wo1hdI=
X-Received: by 2002:a05:6214:27e3:b0:91e:747c:f82b with SMTP id 6a1803df08f44-92134bac696mr64470396d6.52.1795203813424;
        Fri, 20 Nov 2026 11:43:33 -0800 (PST)
X-Received: by 2002:a05:6214:27e3:b0:91e:747c:f82b with SMTP id 6a1803df08f44-92134bac696mr64469936d6.52.1795203812928;
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
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
Subject: [PATCH net-next v5 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Fri, 20 Nov 2026 11:43:17 -0800
Message-Id: <20261120194318.3952487-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
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

