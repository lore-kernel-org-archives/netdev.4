Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123192;
	b=RbZi7dRZDJmWpPZQ7tWWj9ZBkaMgv7lvBCBjtc2j7pzPn8Gg4XpYOPdvJaiWxep3Jcq9
	 1xqiieOeZ5dMPwbPwwqkFRQvF3Wlt7YHeK6beRhSv0m3q85yxzf+AYM7KsOO9bw14KwO+
	 0cX0hAGsIawDr27QZ6nOux8a+a1ITSXVJO8FBQp9Ogd/RLeSx1tkoF9J749qbpDLjbMNO
	 UyRIiIwRRMhGZxwCss9NexgDQUdF/auaQa1Nb4Bp9BLYITztk9yKSqij1qR+jjrn7nZpM
	 8eJzTJajOGbTuA/iXx2L0jdZ5Mtz6uj/yD6amIIJqlfZaJzD93j9DMNay5vByBLgYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HBC6HlJKIn7rjaWVOHB1mVQTcV2RM+X6YRKIoH45Ui4=;
	b=FZY1axDgLL6qS6t8x8AuFZ88AzvUNtrv2SPHtuxR+fiYAmx4AZ4ugvpg/Yq45e4zWUI9
	 F5YHo+E3zsZyPeYAlsiXOlmXzA7jg12wmVg01yOk5v08fIyFWFGg1wYOqCVng3cVHHW4P
	 mdvrHM4P9+HV16EXouggkd7Sf/Os0MEbCQcd9ecew+OwVSzorodXj2KoCP2/0UA1mXVBb
	 CgElF3DrcCyk4QX9F9TfR4kjzJ2JNAm6O7URCMWOLkz8VG10l9Hh8lYHLchZVm/iwH4i0
	 3z3vyzIbdx4cj+RYiYhiOG31OuvkfnxUt5f3jc3qtneIfJwXj/tcHLAU6NbCqfEzqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPN7g0aD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCA606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFCA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPN7g0aD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so408489eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123191; x=1795727991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBC6HlJKIn7rjaWVOHB1mVQTcV2RM+X6YRKIoH45Ui4=;
        b=QPN7g0aDmYEw9HLMLdSQe2XlpfFcnIPPSwHKa+jLfSXAKA52Lt9Qs6RjCZjyU/vMb1
         D44ZyVqDgBPejNGwj+kHMIbqYopb7yaHpxEEHtEWo+/XKcPgOWCn56dn3gbDM2NokPaw
         /AFP6S8EwOFqSRBklUEX2QwafqR3ButxjrPf6O8VignwTIcZ9jHcVc81soPrWDYxBqTV
         XCQpLJUHN2TjtrXjbhsKm3KmYseuAlS9OytRm5bbTQMf5YZDFr9h8afGSgdzZFG2Kx6n
         ngarma0DRb+iUoBO71vbQ0RXY4KTlbtWsp/crZ9nPMfcDQnUId4NN0+Vmj6RLr92F5f2
         bYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123191; x=1795727991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBC6HlJKIn7rjaWVOHB1mVQTcV2RM+X6YRKIoH45Ui4=;
        b=xmqQQnV6oxvlvJz5rvrM2f5Xu8uVci5Soq42GwJ0SAoLoFxOfaZCyq0VPtyMgYHqS3
         3DTaqycSlk5BUYOOSzhoC0hofc3NUylx5z+znENxdyyfmBap5C3eKrqG+B3gS5rjB82F
         a+BDbzWJEDTuBfJKqQB0sT1O0zXsbcCQ/daiGStC6iUEYCv+EEPmwtIH31poZuifqMRx
         DEZk3NZVFTi3uLb0IpgLvJ/R+mYL1vZAyuu1itzrhRbmPhopYzpge0yOnt8NIltILbEo
         m9Wtz/j7KcrtfToyCkfcW8WOtBm4sH5OoY4p7tJKTALo4pnajnijRS6UXXfx86HlWnOc
         bpUg==
X-Gm-Message-State: APuU4Z9Gx6lPZRbiqkclWv6Oj5G52I74I8fGDRjxrM6VwUCiw41OzrVn
	SjiUtoGtqoleU/NOlW4fb4cvge+fJb7y7SPCDppSFnz+TvqFOZs5pG6Iwstw5Z47
X-Gm-Gg: AZFdTZdgIfnHdpDxTgHdc7fbh4mD5ksfVF5hxebzgVQ6LDHqPGcs7JiL6TeHVoCgTDN
	Rk4r0ewSe4uE926kvncQBA4ztTot+SZuTa6BxdhpOikhN5ucd5fhGZmmariuG+7FKm20/1rYsgS
	1y6rgONJdexHf6dT1SSsazqJQIHVGVDLfjibziFQLeYi8dKU8cBvgzKTlsDCZBm01/Fz9MyMCsa
	5I00x8G2OIpo2cb8eGSBALibmu9uISyMpSUWdBFv0K79aj7AkWxmisb6omN7EmmfYduYh0DfESw
	7seBpWkKmk8du9qmEFibLW9htHqoLItRQe79qE1yCRpJqUpid5OkV2tZqFCVhdOr7tCRbBogbmg
	sx+GSoaKbJh+RE0/Gayt4KZhBGJu6g/5kws2gMUMpSpZkzwtchzhXhvH/grCtd4nrq1nAipxKsP
	Ny3HuXiGK0sWzISmWELLKyhjGYCHW/s8fJrot7K6KgdxUgcvQxMNVs8hjCAkjRW60mNYfNcW8KA
	z6ifR6O7cSslYcuxa+HOO4hgXmBI9fGCYLVxDslxC5BlLyCnyw8NZem4mrIGlePmn6Wil2qdLVt
	XesvoiF53SUstBeMrZxLe265BiTeuQRw6pU6zZ/U2wYrQDMFJJ5Y+EarVULanZDwRrd8+XQ+hyY
	lYuELMK9553Q1LB6+yfBn7r+1vaMOQe69T2aS2nFFKZP+pihs1U1WB63E3XkxNgSXKBCLarS6
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr667366eec.32.1795123190815;
        Thu, 19 Nov 2026 13:19:50 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm887624eec.17.2026.11.19.13.19.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:50 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net v2 1/4] ptp: ocp: prevent timestamp rearming during detach
Date: Thu, 19 Nov 2026 13:19:48 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
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
the channel: EXTTS requests do not require a PTP_PF_EXTTS pin assignment.

Use the existing device spinlock to serialize the stopping check, PPS
subscription updates and timestamp MMIO. Set ts_stopping under that lock
before detach disables the channels, so an enable already in progress
finishes first and later enables fail with -ENODEV. Keep disables
available for PTP core cleanup.

Flush the interrupt mask writes under the lock, then drop the lock and
restore IRQ flags before pci_irq_vector(), which takes the MSI descriptor
mutex, and synchronize_irq(), which may sleep. During teardown, bypass
the PPS no-state-change shortcut: a concurrent disable
may have cleared pps_req_map and dropped the lock without yet draining
its IRQ. Detach must still disable and drain that channel before
ptp_clock_unregister().

Reported by the netdev Sashiko AI review, then checked against the PTP
and POSIX-clock paths. The source-derived userspace harness reproduces
rearming with the old source. With this fix it rejects late enables,
serializes in-flight enables, drains a mocked active IRQ and covers a
disable paused after unlock but before IRQ synchronization. It checks
that MMIO is locked and vector lookup and IRQ synchronization run unlocked
with IRQ flags restored. Shared PPS/EXTTS subscriptions and all six
channels pass with ASan/UBSan. This is not an in-kernel UAF, lockdep or
physical-card test.

Codex revised the code, tests and changelog from Vadim's review, at the
request to check the spinlock approach and rerun the removal-race tests.

Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
Suggested-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 625a85b2dc..4c98558e96 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -367,6 +367,8 @@ struct ptp_ocp {
 	struct pci_dev		*pdev;
 	struct device		dev;
 	spinlock_t		lock;
+	/* Protected by lock; blocks timestamp arming during teardown. */
+	bool			ts_stopping;
 	struct ocp_reg __iomem	*reg;
 	struct tod_reg __iomem	*tod;
 	struct pps_reg __iomem	*pps_to_ext;
@@ -2550,6 +2552,15 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 	struct ptp_ocp_ext_src *ext = priv;
 	struct ts_reg __iomem *reg = ext->mem;
 	struct ptp_ocp *bp = ext->bp;
+	unsigned long flags;
+	bool need_sync = false;
+	int err = 0;
+
+	spin_lock_irqsave(&bp->lock, flags);
+	if (enable && bp->ts_stopping) {
+		err = -ENODEV;
+		goto out;
+	}
 
 	if (ext == bp->pps) {
 		u32 old_map = bp->pps_req_map;
@@ -2559,9 +2570,9 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 		else
 			bp->pps_req_map &= ~req;
 
-		/* if no state change, just return */
-		if ((!!old_map ^ !!bp->pps_req_map) == 0)
-			return 0;
+		/* Teardown must drain IRQs even if another disable cleared the map. */
+		if ((!!old_map ^ !!bp->pps_req_map) == 0 && !bp->ts_stopping)
+			goto out;
 	}
 
 	if (enable) {
@@ -2569,16 +2580,21 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 		iowrite32(1, &reg->intr_mask);
 		iowrite32(1, &reg->intr);
 	} else {
-		int irq_vec = pci_irq_vector(bp->pdev, ext->irq_vec);
-
 		iowrite32(0, &reg->intr_mask);
 		iowrite32(0, &reg->enable);
 		ioread32(&reg->intr_mask);
+		need_sync = true;
+	}
+
+out:
+	spin_unlock_irqrestore(&bp->lock, flags);
+	if (need_sync) {
+		int irq_vec = pci_irq_vector(bp->pdev, ext->irq_vec);
+
 		if (irq_vec > 0)
 			synchronize_irq(irq_vec);
 	}
-
-	return 0;
+	return err;
 }
 
 static void
@@ -5749,12 +5765,17 @@ ptp_ocp_detach_sysfs(struct ptp_ocp *bp)
 static void
 ptp_ocp_detach(struct ptp_ocp *bp)
 {
+	unsigned long flags;
 	int i;
 
 	ptp_ocp_debugfs_remove_device(bp);
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
 	timer_delete_sync(&bp->watchdog);
+	/* Drain in-flight enables and prevent rearming before unregister. */
+	spin_lock_irqsave(&bp->lock, flags);
+	bp->ts_stopping = true;
+	spin_unlock_irqrestore(&bp->lock, flags);
 	/* Disable interrupts on all timestampers */
 	if (bp->ts0)
 		ptp_ocp_ts_enable(bp->ts0, 0, false);
