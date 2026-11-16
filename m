Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864908;
	b=fkYa95PxRgWr9pqjx/a6quqAqyU61OqyH8kh9v5MhooZ6mfQhHfPRoMvnfnxtXyfmQut
	 bJF3iQ5ns4AIgRnTvko3oBJc2e1ZgixWpu4gNj4QgxVawl665WvRT4AZC6DdCFh+2fdkr
	 8kRkSDjtsTn5Lt4E8voVMCs7GJh/Yte4DJCH94rh1oyHV/R152wzXHHzzpGeWBMGxDF7/
	 wAZ1I4VJwj4P5sewauNRaMTjNa1M1fPcRyt/botnOhVkGUp+TP+XHH3n720OvNeoJMssN
	 zY27DRDq552q0yP5BBNdT7fmRWDHw12mZFmsc7ZEH+39MCnQ4oob2GVteR6WPL02M2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864908;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
	b=IyPxBvtnxRHG0XK1Eal3RfZbRftooqdDqnVFnFeKDmrwVZc6vVr84B6v5PwH1admlKIH
	 Pm+V8MP/zRy8Xg1/00Fh76iCl75FwUnzPt0gbLD2q5PLkyZHfLZZjLrt0h07SoDOWuVB1
	 ByhqitUbE2BaSah/as5kPFAHm9OaMQtaI5FE93XtWsQ3D/ENhgLvlhIuMVsAB9ahTFp7V
	 uzK2QX79tu0ISBRHsbTpE1TlD5VRgG4G2D4K/Pw+R57CjIvlSPA+smBQGxZeuzd0qISoq
	 EdgiR+J1+rAgN/Eemsb2c3jybFpPmOlaIBs7wWX65zeRrmGdk6I9nO6li2KB1wjgxAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MPgdHzXP;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DA606A33B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7DA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MPgdHzXP
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1907189a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864907; x=1795469707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=vdawKVnPhj1hZP0ZuOndwVq28dqYPs2XwLlxEA0NZFO2a/RgiOXGhodXvTFqzifg2y
         zV0dzxJAGz4ak0Tas6nrQOrDvJKhxNQWe6DoN9sEXjswJVJfWrHGQWkk4h7u//lveqWY
         4+/4/XwB+6URUcz2+9cq//TJvvQ6fcTxacuYEIsIIfPXf+FKoJ5NtHRD0K9SINZPIEzr
         cMcioPeWLE9iNJ86VpnK9ULAxrAAeFEGnIIr5WOPAuQDQhcWW5Dnbb0Ait55++FSZbpE
         n537RKUQEOoS/VEX9HjLQTGJUm8EYXyASY6kWc5XE2nA0vaol+FRA056FX3SYCWo+Ikn
         qbSw==
X-Gm-Message-State: APuU4Z9BO+JSSaT+UycUAQtq0vgu7FIMdSIbuT/5BsGpdtVVi/ncpn23
	YQneJPF9EjJm+iazsKriBYfocFDJrLG9DI1kEM0g0KZC8aoeVk7dRO+IYLTuCmLPOUuDZPeqHYj
	hk2YOTNGBpg7yAQp18SYj83pWiRtfYxp2egvKprIAwhLNVfD6cS0hJyomvJmtlnOmMT59Hbbm0+
	ESj5OGZvwcF41ElZWQSnzljdXDfD9R4IvSxJCM+dra+l5W5peU+rLM6/jspHeqaKW6hKd0uZ+lF
	VTz2iA6g7f/BoS0
X-Gm-Gg: AZFdTZdV6b7xH6jGBcDJW3XeZtBq42q7hN9i8VRgZwP+s5r6x4NxE4NQqUEBgLG3lZv
	YZ2pkELTmqxpA2DMX4zFymwK7iS9kqvW4AvE2utL2WrR3bblfyKJ+Fcoo8pKu8j5xlQvXgcFJoH
	sTh7zJQzjORrIZdB94629D1xLpA2WLsek9Bgn5y44pqnqD33UFgLOLxQByNVY27yGi2sTPtdT4r
	98L9eWo2IT7oaahvfmGndeaJLtqRag9RMYrEGU1ns5zNXwlUEcegehFelRZEdGRRv0F4i2sPx2Q
	MPlQDSI4oe5rPnDpWdWtB7TL+kGtReGXOS/+KeLhKD4zzs6ATa42IEYP9YkHZjYNAJ5izzDSws5
	HZyYmSiRcF8J3xD0a3/K76TiG0kR53ct57gEkEMBOIawibKYLtcQGcAS9bIL0Hw7Rkue3AHYY8P
	AERSig22bXqrxQzOEiVazuRb/y0eyNIcTFunMOVx1/Z28=
X-Received: by 2002:a17:90b:2246:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b1b0a0e792mr11686463a91.17.1794864907400;
        Mon, 16 Nov 2026 13:35:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3a2d07d60sm494142a91.2.2026.11.16.13.35.06
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c5caceee8so46376281cf.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864906; x=1795469706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=MPgdHzXPSH4Rlvp+TcnOObqGjdGqrAamrexVUMXv0S+68/Ls4HEidRERhx5l1HCJ/p
         ugjlahj+fh/iTQUe1rXtLMJtAxK0zrg1TQRy+oga5eKOJvVTDdum3x3kHeg+C4GyviUO
         QdyLuUWF88JX8ebydjRf0QHhywcdswbljO2Fk=
X-Received: by 2002:a05:622a:ea18:10b0:55c:2c73:ba86 with SMTP id d75a77b69052e-55c2c73be22mr105400631cf.28.1794864905731;
        Mon, 16 Nov 2026 13:35:05 -0800 (PST)
X-Received: by 2002:a05:622a:ea18:10b0:55c:2c73:ba86 with SMTP id d75a77b69052e-55c2c73be22mr105400291cf.28.1794864905236;
        Mon, 16 Nov 2026 13:35:05 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:04 -0800 (PST)
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
Subject: [PATCH net-next v2 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Mon, 16 Nov 2026 13:34:48 -0800
Message-Id: <20261116213449.1682731-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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
 drivers/net/mdio/mdio-bcm-unimac.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5f79f31220f2..df267bb82696 100644
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
+ * clock the driver can program from a 250MHz reference clock. A C45 access is
+ * two frames, so a 1ms timeout leaves a wide margin.
+ */
+#define MDIO_POLL_DELAY_US	1
+#define MDIO_POLL_TIMEOUT_US	1000
+
 struct unimac_mdio_priv {
 	struct mii_bus		*mii_bus;
 	void __iomem		*base;
@@ -79,14 +86,14 @@ static int unimac_mdio_poll(void *wait_func_data)
 	struct unimac_mdio_priv *priv = wait_func_data;
 	u32 val;
 
-	/*
-	 * C22 transactions should take ~25 usec, will need to adjust
-	 * if C45 support is added.
+	/* C22 transactions should take ~25 usec, C45 transactions take about
+	 * twice as long since they need an address and a data cycle.
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

