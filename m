Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032317;
	b=mtizW1fNTqqdIwHeOWWr7osObKsYmIrAdokJihA2WweDzIn0piWE4jbq8TMj9LUhZur8
	 1Lshr7oaqiKIJBVFfGzrgOy537/nRCZHFGqrAy5jtwzSeZlhMIvsjIOOmKdNaEHv9ldS2
	 SJbu5+hbR72vBZmme4fp3sAcUXlBUpcMRww9GlxczHpXDVEsGoIWk+EGO+2dOFfDPYU7O
	 jmw2kPmkbrLckaCceCIcqX95XcYNr3fQl9I74KkGl5QruoEQl+T9rfHEEzTpyGubw+Nwx
	 dMzTioPbceio5YmJwTPHaxK3g2X+TjMMOb+ukuJtxnW0MvSqYjr4hbA3DMfURWr+jHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s+yQtVzCr5ks3JsuMZN3DsU82U2zbbfL6IDAjaawqSk=;
	b=clGGtAxIaClsK2WdI5zGMJe1tC6QpbkcrMkmNPV4sKsI2md7r/CiO3awcsa6wD1yMSMj
	 U5DpCaN/8g8F2klFGI9vwOLLPlSxQClfZTTpqHcq9NRMkbwEzF6Qke+ZOHEJwCrDFlIM3
	 w18FhAOo301/5cKCzm/ZQ68sPr6pPWot3+uPLxz2stfNCoRESNPL8845pes+Gy+59BgBi
	 Y8x7qC2GT1ocK+Cq4epMI31UZDxtyFPdSuDtvnRTi1MFLHPoI8sRbq4rjsqAV2vVkWrM4
	 3PRXwFXSlTWBrTGnzcymXoRGfTUBSx55YeCLQqG17CkvIcddG+EzaUP7K55xNCaQGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahkZnl5g;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C93606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahkZnl5g
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2082005eec.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032315; x=1795637115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+yQtVzCr5ks3JsuMZN3DsU82U2zbbfL6IDAjaawqSk=;
        b=ahkZnl5g6jdgTnj0K+Zm4RNJd2r6f8SFsrifZlX8hBAuBLM3R6kYBVolwpMcQcW4fH
         RH90zuiKNZ5LlUohfJW9NeO9YWOyFUNlDdZv+gYJa9VcoV942WIWyVyU9kJovq5lTEq+
         XTYnM+pH8v2/GPpYIhtfLaYZZNs2IIJa1j+DNwmPSngKFjR1TncqnKn+VU1Wg7tnU/ii
         /hG9rZepibe/MPT6dIbTqMhCmmAvN4ZmEeSmKc76TQtoilX2dBSTRKLRMgKJy2nnR4ik
         4wdZZoGHMH1NHx/dA++9cQdUEWfI0lRvrTz33ZQorPxE37mA60k7KizLhFYgUrA6gtvA
         6Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032315; x=1795637115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+yQtVzCr5ks3JsuMZN3DsU82U2zbbfL6IDAjaawqSk=;
        b=Xyyo2HVzZSoqT7PmYQ57zG8AVMaGuVVbbKG+nzQ4XV6igtPW6hJ5CtXrHP3Tb0ihG4
         gO4juOQEVK9uwX6SUE24S2hZjsOJmXIWT3quILuGTZSdvToO5ZS3niBkOlG3FIvwfN4R
         a9CK0zyu7Z8YafDhHdoufKdYA1386U/ARIW2BfoyJnk1uFzlFQYBeVrBZMrU6MHpSYdH
         YV3xZ5jyfdksFT3Jta09JUWHVNNVK8D9xKJ+YEbgR/qG3rmCcFhSDWXzjJ/Mh64+oB0K
         e8r8XFPyByfIBwZYN2LqSgOhSd21zTKbxf7DNCh+M1B1mPFnpLUghKMBMIUkr3/4XVjy
         xp/Q==
X-Gm-Message-State: APuU4Z/TngseysU6mJplCvdc3H6XV1u9lztTHPCFmc0USo72hwF2oM6W
	oa2VUMm4EdzwnNmRwIo+2t/p+nKXmV5H6vmlXUxysigHYgjc7tKn1vtTH3dkqOP7
X-Gm-Gg: AYBFou2rQOmQISMzysI6QgyQUWczYfHMx3lwA2GUCOF+4r0Cx52EASBKXJQ1uR7sN4p
	Q8UqCVPrJBPaVG2skMtEwmKCdUbkzw5H6XrnFbUZmwT5S9DREQm43Xl3SHVJWFAgDggVK2lUVM3
	fAblQ6An1JYXIQZI6I/P6Ya6Y1cg10gwFt0fIZ3CmqhAyQ098HTapkRdL6Xnvc83Vf4TVhjdJqu
	6V7bVwfm5RzBCn3TTXd9s8X+PzS4TGKcZa0IgEIqXO26HQahR3V4lb3mdg9BbwzdNfuq7AVNN02
	5aabVSLAyNf3wT7PNPnZDYWBv8ofmZA+Gg8a7SeXR11X75hY299tKWskdyUVOOeRNiMvsXY4c7V
	e2Nb0Ikz8af+RpecB7XCu7T8Mwg9Rz9NSIjXFe/HSmDV6aP+AqRHSSDoOa2MmR5tIahbjAdr10w
	KZGT3/K294RZv4FSzeH8QIqfXTNKAXQj+odfcO+rR7uXH2mA/WkmJTlDhv8J4qrGqEnloZmLC+d
	uTyePdOZ2lH/JMf73WxqBHCMv3k4BwONNOwRj2I86OI/IAjeDj6uAWiZk53+41I00f4lqZsdRaB
	eufL2/KVyQKoT8KSN1Dk+fzLKwwzRAyoUgAXtFJi7ts5mOUM8pfODQ8Hd0fbA+QPY4V2/9PWRUv
	pcIDF439HWbKuB2Q01qdHc2wX7VHr
X-Received: by 2002:a05:7300:d80b:b0:384:8f9:bc0e with SMTP id 5a478bee46e88-38408f9be20mr259000eec.17.1795032315089;
        Wed, 18 Nov 2026 12:05:15 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10869297eec.2.2026.11.18.12.05.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:09 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Wed, 18 Nov 2026 12:05:07 -0800
Message-ID: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
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

Detach disables timestamp interrupts before unregistering the PTP clock.
Until the POSIX clock is unregistered, an ioctl can rearm a channel
after that disable. The clock can then be released while the timestamp
IRQ is still registered. The core cleanup does not necessarily disable
the channel: EXTTS requests do not require a PTP_PF_EXTTS pin
assignment.

Serialize timestamp enables and disables with a mutex. Mark timestampers
as stopping under that mutex before the detach disable loop, so an
enable already in progress finishes first and later enables fail with
-ENODEV. Keep disables available for the PTP core cleanup. The existing
MMIO readback and synchronize_irq() then drain events before
ptp_clock_unregister() can release the clock.

Reported by the netdev Sashiko AI review, then checked against the
current PTP and POSIX-clock paths. A source-derived userspace harness
forces an enable after detach's disable and reproduces the rearm with
the old source. With this fix it rejects that enable, waits for an
enable already in progress, and waits for a mocked active IRQ. Both
timestamp and combined PPS/EXTTS paths pass with ASan/UBSan. This
validates ordering with stubbed MMIO/IRQ operations, not an in-kernel
use-after-free reproduction. No physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 625a85b2dc..478f7012b2 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -367,6 +367,9 @@ struct ptp_ocp {
 	struct pci_dev		*pdev;
 	struct device		dev;
 	spinlock_t		lock;
+	/* Serializes timestamp arming and teardown. */
+	struct mutex		ts_lock;
+	bool			ts_stopping;
 	struct ocp_reg __iomem	*reg;
 	struct tod_reg __iomem	*tod;
 	struct pps_reg __iomem	*pps_to_ext;
@@ -2550,6 +2553,13 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 	struct ptp_ocp_ext_src *ext = priv;
 	struct ts_reg __iomem *reg = ext->mem;
 	struct ptp_ocp *bp = ext->bp;
+	int err = 0;
+
+	mutex_lock(&bp->ts_lock);
+	if (enable && bp->ts_stopping) {
+		err = -ENODEV;
+		goto out;
+	}
 
 	if (ext == bp->pps) {
 		u32 old_map = bp->pps_req_map;
@@ -2561,7 +2571,7 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 
 		/* if no state change, just return */
 		if ((!!old_map ^ !!bp->pps_req_map) == 0)
-			return 0;
+			goto out;
 	}
 
 	if (enable) {
@@ -2578,7 +2588,9 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 			synchronize_irq(irq_vec);
 	}
 
-	return 0;
+out:
+	mutex_unlock(&bp->ts_lock);
+	return err;
 }
 
 static void
@@ -5613,6 +5625,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
+	mutex_init(&bp->ts_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].uport = NULL;
@@ -5755,6 +5768,10 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
 	timer_delete_sync(&bp->watchdog);
+	/* Drain in-flight enables and prevent rearming before unregister. */
+	mutex_lock(&bp->ts_lock);
+	bp->ts_stopping = true;
+	mutex_unlock(&bp->ts_lock);
 	/* Disable interrupts on all timestampers */
 	if (bp->ts0)
 		ptp_ocp_ts_enable(bp->ts0, 0, false);
@@ -5789,6 +5806,7 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	if (bp->n_irqs)
 		pci_free_irq_vectors(bp->pdev);
 	mutex_destroy(&bp->cpld_lock);
+	mutex_destroy(&bp->ts_lock);
 	device_unregister(&bp->dev);
 }
 
-- 
2.54.0 (Apple Git-157)

