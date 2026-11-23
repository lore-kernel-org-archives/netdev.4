Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448351;
	b=z1yn5rIg5wutkASHYSCGb8WuwfRPR+FzUJRYlBeen+EdTvdsjGtf5f+bJFHt33a+hP5D
	 kxqARZcXXddlselOTKFfjFXjtGlKR1y5b0efh1kesTUDxt7cuASuAwv9I6TIiFBKXHGHO
	 kUJH2xXd26tkh6TqxgzrdnBQ7xFJLQpW6swBAp9hPYJWVnpEM5bO4KDvunyROeaX5EF34
	 e1wXICTHplh9MGa28JRejCVEkNNp1P8RbhGCRGqTceHDpZc5LVjwFPvEQcH8z+97eZi+V
	 UPz9wamUQJVaBN2nOCbYAdtPtp64bes07XxWrs/oJuNgTKwugO2UqDBNCZcpehB+XEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448351;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=+OQ5w6uo1huBoXVafBe3RIUfkNs9d40Oo9URO4Dv+Hk=;
	b=xUjhQXl4p67kBUCHv0IC3fG/HzEWyjIa+TE+3YohAqIq8irjarHLBqH0cXqjMSh36jIH
	 M2Hp5fqq3DXySU/aY2m3EHesJgReq+lKZckS0YI5kz3VS0TH5x5pSQg7wo/gSr/DJMrSE
	 zN0XTJGEebAei6KYXjBoqt3waBQ5/S5yYYdEr3gfqY4VlKYRlxXzEEuqGw+CcnQSbbHjR
	 Gp4cwAeTrmj85n5k4K1OgxMpbpRuxc+BVtBu62sAjUcoH2Fru+M4s2STsXzHMvYf/08NM
	 J0XKGxdKtPbQVb8vg5A5zZcvPQgxPBV/uDP2J4uFkovvYbqi/ZZBuF64MDuSlEB00ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ZDlv6wM7;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB381606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB381606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ZDlv6wM7
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4042BA08C5;
	Mon, 23 Nov 2026 16:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795448346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+OQ5w6uo1huBoXVafBe3RIUfkNs9d40Oo9URO4Dv+Hk=;
	b=ZDlv6wM7P/CQx3dN4dI4qVlu5QYFZFEzLkIqdR0EHU3Q38R92AGJuiY78lAQWbP+kIttyv
	rtIBtYw/BydNMUGYMbGu6yGpCebLM+l4YAVrKubnFqHVUG9ySqV6tZVwpuMVaV1BmDt2jQ
	XoBYERtGTzNfcggAtvPO2AWbWuigrd9ptEt4M7oyWRlaC0nPRIU/AYVoG5hw/yLdvF89TQ
	8CwvwhSUrTXzG9eq0+8RhbOH95FT2zEcG9Sz0WmDDWvvlEl7GBcSbbnkzbsznCvy42FoJV
	m2QMjSBwzCvPFy7OOnP/nTBd3pvq9e5EdP7AjkOFys9HleKdz8b5MhqOAjzeXw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 16:38:48 +0100
Subject: [PATCH net] net: macb: don't disable an IRQ wake that was never
 enabled
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-nb-macb-irq-wake-net-v1-1-ccdd60a9a1bc@tipi-net.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBREr0Jm7U9oQWO4CnHR1lG/hqItqAnh7
 lZdvsm8tyAzKTO6akHiU7OOsYDZVAgXF88UPRaGre3OGNtI9DK44EXTQ17uRomcZE/bsHW157Z
 FUe+JJ33/sj3KAYf/mGd/ZZi+QazrB2THbqJ9AAAA
X-Change-ID: 20261123-nb-macb-irq-wake-net-8e23e4a0be54
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Sergio Prado <sergio.prado@e-labworks.com>, netdev@vger.kernel.org, 
 Dom Cobley <popcornmix@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

From: Dom Cobley <popcornmix@gmail.com>

If the irqchip has neither an .irq_set_wake callback nor the
IRQCHIP_SKIP_SET_WAKE flag, enable_irq_wake() returns -ENXIO and
macb_resume() later tries to drop a wake reference it never acquired:

  Unbalanced IRQ 108 wake disable
  WARNING: CPU: 0 PID: 1013 at irq_set_irq_wake+0x168/0x238
  ...
   irq_set_irq_wake+0x168/0x238 (P)
   macb_resume+0x23c/0x4b8
   platform_pm_resume+0x30/0x70

Record whether arming the queue 0 IRQ for wake succeeded, warn on
failure, and only disarm it on resume if it was armed.

Fixes: 3e2a5e153906 ("net: macb: add wake-on-lan support via magic packet")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Seen on Raspberry Pi 5, where the RP1 irqchip has no wake support.
Tested on a CM5 with WoL enabled and a suspend/resume cycle.
---
 drivers/net/ethernet/cadence/macb.h      |  1 +
 drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index b7b4b6a38298..bd4f04ac8356 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1221,6 +1221,7 @@ struct macb_ptp_info {
 struct macb_pm_data {
 	u32 scrt2;
 	u32 usrio;
+	bool irq_wake_enabled;
 };
 
 struct macb_usrio_config {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 5ad0e32e2b40..f2d29428fa78 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -6517,6 +6517,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 	unsigned long flags;
 	u32 tmp, ifa_local;
 	unsigned int q;
+	int err;
 
 	if (!device_may_wakeup(&bp->netdev->dev))
 		phy_exit(bp->phy);
@@ -6589,7 +6590,11 @@ static int __maybe_unused macb_suspend(struct device *dev)
 		}
 		spin_unlock_irqrestore(&bp->lock, flags);
 
-		enable_irq_wake(bp->queues[0].irq);
+		err = enable_irq_wake(bp->queues[0].irq);
+		if (err)
+			netdev_warn(netdev, "Unable to enable IRQ %d as a wake source (error %d)\n",
+				    bp->queues[0].irq, err);
+		bp->pm_data.irq_wake_enabled = !err;
 	}
 
 	netif_device_detach(netdev);
@@ -6655,7 +6660,10 @@ static int __maybe_unused macb_resume(struct device *dev)
 		macb_queue_isr_clear(bp, bp->queues, -1);
 		spin_unlock_irqrestore(&bp->lock, flags);
 
-		disable_irq_wake(bp->queues[0].irq);
+		if (bp->pm_data.irq_wake_enabled) {
+			disable_irq_wake(bp->queues[0].irq);
+			bp->pm_data.irq_wake_enabled = false;
+		}
 
 		/* Now make sure we disable phy before moving
 		 * to common restore path

---
base-commit: dd206ec7ed36be3883d08def9eca8faab7a38ee5
change-id: 20261123-nb-macb-irq-wake-net-8e23e4a0be54

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

