Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958345;
	b=x1xj3S0Xc+3VqIm0bzg+oSNKsVeurLmGesDr7+JtZ0KyZuOR05qsVmcLxZz11HeqzdFZ
	 QSv+F5BAYS23c/T0nl4B1p22bIEbCl1ODFhArXbGhXHdTM0ZQp5XcQmOW2SyZS6u14MQs
	 RVRHLAOdqk0Aa9FOg+9yrf/yIlcQ+LCb6Ty82GzTWbkGufIdMGiG4JNjeSbEWXm+koZBx
	 HAvGzs/9EXgJjc8/k2cnFwAvBlCuskFesm48OZ5G3HiWZIyGCcYdBNxDOVP+ZA2TMtOVY
	 lVvvYa67UlszlhJiX+0QvPZp3kmTqSXqcNhC8zIdMmYw/hvbnMo5Q2WJ5yR/+aU705w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958345;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
	b=4iTnysWGS+eIZ+roZ7GMvl4LEWDBFK1hssDcCW1t24Y+TaOKICL3/Ur51edGUA8frLOh
	 A0xzwz5sjeT+WIO4X6PnnDXsxztRTde1F4NWS4OJ6gUAfrcVW/YVtBZmZZI09KOKhbGiI
	 ciR7h/90yWtHKoMaIPS5ViARBxNe33GfGTR52lES8/UtxcnaO9B5FIwIuT+lUF/vcZSyM
	 mynDlWxSNVJrB8541EGKcncm7VsN5xEPvPzf5NAyptKzGhiPbqFmA7JcWU12RuSW17082
	 dbBlIT6j4/V6swLf3VLqT4tAUbhf0e1wOjhfH5T3V6hGN8/N7dRNGMK1e+bMR8UIhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hxa0y2jA;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33E606A889
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B33E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hxa0y2jA
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso261603a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958344; x=1795563144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=G1cHjVQOqaMCf+dOAuu1bphutFWBKdd3I4+MqiUXjawl8TETIQ8W9Idi3sudo+/ZOg
         41aTJpha53q70hSLFTWi1hJ1nRi0t1urI+CPR01G8kyXv8VXwzR4G3erGR0qVztU/BF4
         zl2L2gm2xypJXYLzsLiNGxVPcgkDdUZL+/l40bdvI4+TJ7FirIjR7gqHWOc3jsAqPSWl
         fyK3MBCeTNdsoxiBfWkW2nNsLCoNI9B/PZhYvCclw8ZxWMNMlp2VG29HEuQNtAyQreR9
         WGidVVr55LNV4iwBB2Oobjx6T3UUVTbRreV21zIRX4Pt8qCyhPuSFrNRZOvKYSDFMGBG
         ooNg==
X-Gm-Message-State: APuU4Z8hkFj9vaLxD9QH2zFaydGcsILTNuNHv58nRNMlL9kMc69Cx44w
	m5eKSc3ba/5TqPPwWz4nq7sB/lovMsZasJnifEGAnDrjlxr+N+5GimXV4jPfPyKPEg7X7Tysv73
	wA3suM1gZsbW2cyUiQYRacXROwtjqVvBFrq1KGUDBMXdEcBsusvI7npiCxni6hEk/ubwh6gOFbV
	hEPTAlepHz3FYZojRHNXM9Hhjoxy9iYa4aLAUglEVTV7miki6TKrUoVD88MFQBVp5/GWCZw6o7h
	5jPLiljUjIATq++
X-Gm-Gg: AZFdTZeWM55HsbER9dt4TM8iLV1g6ruQSzskB/GhSrXciDyepThj7U2B8CAIftFDpv/
	dW9jz/VeNa0XjZFYo/ciBNGrE9MhBCb8RDtO68m0wvRVELwTidbIOefc9Tlkw/S8sV5/vC1Y5qZ
	dLuJJN8CP8VcUVP3lzbeUK0q4JWZua0CNwb61K5RLT2mnJKsgBkYZfKG7p+lz4BmbMSpjy94iTT
	7ZoUIpDljjxgEXnObGwVBNqkF27UNc/eZCJnnQpwtV5PWlB5kJUp/G9WVf/K5nt+dgkRqizWwkT
	KbjWt1K/x59Rh8oOrgsTAnDk22hBDaBf72epUMuS8Fk+VOiOn974seBgziO8lsKJ4ETeUkflymI
	EXW74w+KHlhRCoN1N/I1V1ZQHgnsiNPPGcNdu4l1XN72zGrMq/cOm6lZLPbZmZvvKqcsvvwuUii
	mPItTdYs5fykkcMj+kxIz+dvtGuEBvOX4Z4dPrY5/QJy8=
X-Received: by 2002:a17:90a:f94f:b0:3a8:211b:6c8c with SMTP id 98e67ed59e1d1-3b3d07a26d1mr859162a91.22.1794958343880;
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abf029a5sm2952325a91.5.2026.11.17.15.32.23
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so628956c88.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958342; x=1795563142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=hxa0y2jAh4TJ64ZhERp6igPkgTN2Skl7jPtgcTZBL3wWCHANTkU/CSBNCIB65GmVRA
         yZRWEx6B5re1RHGc8lMT+CybBI2v48UsR+Gntk7iDtgAOeB2ethANzi4cyZ7MDFjIX9Q
         fZdas2kz6I90xEXWAgyNpG6rTd7/GtmiIoLI4=
X-Received: by 2002:a05:7022:7f02:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b543c38731mr1072376c88.1.1794958342048;
        Tue, 17 Nov 2026 15:32:22 -0800 (PST)
X-Received: by 2002:a05:7022:7f02:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b543c38731mr1072340c88.1.1794958341271;
        Tue, 17 Nov 2026 15:32:21 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:20 -0800 (PST)
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
Subject: [PATCH net-next v3 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Tue, 17 Nov 2026 15:31:48 -0800
Message-Id: <20261117233149.1693881-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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

