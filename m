Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399058;
	b=J9t0GTyJXW3LR6L3tKJcIwQF/pt/SbPdikyZmzwVzEgyQClgsyYF04HjFJZsDYRsBCN+
	 FAoKrUJBjnJFWqNeNqphzfoiF7yf2wRuTSfFr2KL1OYpw1bUpb+38sIPzhYwnDuU+R608
	 mJddQwb2qESl+NP5mEo4NrUEy7Ld2s1AsQQgEx1rNQYw9vvM9RWS3QqjtVkjjfBGaajFW
	 YF/OJjnKP5TmFDcdP2vBWLvK8uM9r4OUqQl0Cg3FkL312z0m47SI8nKtxnQa5T7AHgwlR
	 aUq7o+F8NSHb1uL97OYR0Wc42BarNzPL1BRmBMmSqhNXuou0STlkqUVP2RwB49Yp6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nl4w1xEyLUDW41U/BJXGR/AzIuR6Vo4G7cXU/w1TxNM=;
	b=CDh6Y4nLqPLkX5+ltcyKd5XO0ZgfaOlyb5YSCo3lLH8LFjpOjH7pGrmqabEL4FH61P6G
	 WOaCEIVAPvOe+mIlZ1zTeQqimiOa/esrim3MvFANJPRFmCDRAJh5trp4uv3xRTyibAsuA
	 D4VZ4zG92SINI4d84f9fE2CHZ8Lx/+zlW8+bbadPADfupB7Ns4/+v08tAd59qBj3enU/L
	 Jijfz8bwRrr8M1CUYwgl0MdMFyBXZ9taBZqZEZJDMyfr0H1/5vorve8Zn2m5MpUcksJmz
	 si/OHeqMe9KqMQZakqdNutanaskvs+P7p9IxXUiumbsvI4t5zKFHbe9flj98GSFgWCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDIwsUkd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BC606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDIwsUkd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6143115eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399057; x=1796003857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nl4w1xEyLUDW41U/BJXGR/AzIuR6Vo4G7cXU/w1TxNM=;
        b=RDIwsUkdet0i59zNH5ZjQnFEV2R1jyK9WxCnzlyj7QB4PWAhOiW7eCbXCE16HIlkah
         eo/inwgiMFrxhi67yvanxiBHM7CjFmWcIRsg39QYcbrYeViR/xq8dXIh3s7mq9OBqR+V
         DzSHbUa7zj4B9FQG7GiMLyTTXfamABspOuFBtdFMBjBrq3LrPohuvwwFkTv6ESWoX16C
         DucXHbVg+Uh7bomsJaH+f37Hqha22EyqYvxuCmX7jN4P27OoL6jhYpZbP58tPhYEB3q5
         +t8qZ07nrVgfAGX9jX7z7JbyPb42DTAVydXTJ9tpVeKq0SIpAah/ipjy9uCDtRn4/8RO
         eTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399057; x=1796003857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nl4w1xEyLUDW41U/BJXGR/AzIuR6Vo4G7cXU/w1TxNM=;
        b=ZIlllrU8eNv+mael86jzv7kmsI/3OksQfNpsjNkuErUUWRVjWLMQ/13usPxXEIED2n
         tbhT2mYgmsH7LaxtyzZbOhSxPjaZWsG0MbHhMUACJFiRuDsEi+jnWapdtJVv5b1CNBy6
         QyRP9HCyY2gMQDfgw9/0Pyt9atfwCD8wWFyPUYItHbKLJXcdfE9kJr27zmDTQL2v2zXu
         3cmaI8ErRiBeAd7KPloRazTPVVML3tVRs61T5G3TZSfY618/ab1sd3sQ3GbqNzVmSNxb
         eR4tDVRypCTNf9N3ofD7ebHHn/5H2c2GECpxiaO20Hx9bJKlLRlxMsOBIKPnWnQ6UCh0
         91ow==
X-Gm-Message-State: APuU4Z/VbA1HUafskgyFZ8PVKMx5enG57/hns7nLpcj3XBUN3WQcVtYQ
	qsPCNTmdQq99pVA7ou3/2OZH6Jor3MdwZEbYXC9ag7SN5lJDgRRR+K2zOCYcZ6V+
X-Gm-Gg: AZFdTZeNA6/ZBlVedGx0hrQWu93Z7KPMG3kZ2IWQKPKxRe9227VFXRIFD8CvVB3nNqu
	NJTUaieW8/VnCyLbObZU1uLcs1Ia35gT+Yzf3M4/7uVpDJBx7Kgf8dtzbjbdAstDwG9xdF+RyCT
	sW0BnBBSLJnImP8CEObtivD6AckIE1sK5sWycCWHmIAZSwFTfnzJL5NGwClzB2EuYGLdPW1Xl5b
	YwarEKHtvb6e3Ubm4t9ExuWpMtSE6nu0z5emzMuE2+Iu2lhXTuWqlJEl6kowDLWmH6JU+OAsHll
	kRD5oM6KBTnpxmr9YtSTBjNgtGM/NQqYCil750+pOQtACnUA7nZ193pjozXiGds+YnPl743xSdt
	1Ka/Wavyeo9LR4W7v73Je7YdMyeF3DKYMnZDLeWraeS0n5uAoDF+hzo41TfYgCO7Ix020UVLAco
	qCjKQS+MusQkyx31tiUitDXMudgQlP24iJMdXsCQ3JzfYjm6+9zWEn/txkV+1jOmi1904m8xOAm
	2r+lW/G+4HbJTyBROWPLlvZk4KReAlB2PYBoNoLKoVRgdhu/5X5zeyeFX0ejuoUXUwlB+qYQfdW
	akvLYbP+4ZUNIruI/lw7ttoybl3sGABij3de/208uM7bL8PVtCxJEubAb+QRBRrHivp7gIVwF+E
	FLicw+PaAFA9pBm5e/wqemJx3J1m2gc5cs002REvgmD2lnzAlCuYEgmtUTsBJ5ZUppbz/9Jy1
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr17230480eec.38.1795399057116;
        Sun, 22 Nov 2026 17:57:37 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm32289948eec.28.2026.11.22.17.57.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:36 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v4 1/5] ptp: disable all timestamp channels after removing the user interfaces
Date: Sun, 22 Nov 2026 17:57:34 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-1-ahmadexp@gmail.com>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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

PTP_EXTTS_REQUEST and extts_enable can enable channels without assigning
a PTP_PF_EXTTS pin. ptp_disable_all_events() only visits assigned pins,
so those channels can still generate events after the clock is released.
ptp_ocp exposes six timestamp channels but only four SMA pin descriptors;
the internal GNSS and PHC timestamp sources do not need an SMA assignment.

Disable each advertised external timestamp channel, followed by the
existing PPS disable, after posix_clock_unregister() has removed sysfs
and drained active ioctls. Keep the pin configuration unchanged.

Remove ptp_ocp's preliminary timestamp-disable loop. It runs before the
user interfaces are removed and can race with an enable: the enable sets
pps_req_map, detach clears it and disables the source, then the enable
rearms the source. Both later subscription disables can consequently see
an empty map and skip the hardware shutdown. With shutdown delegated to
the core, requests finish before the final disables and IRQ drains.
Keep the existing resource cleanup for probe failures without a clock.

Do not skip the shared PPS source's register disable when the final
subscription map is empty. An overlapping extts_enable sysfs request and
ioctl can leave an empty map with the source enabled. Once both interfaces
are drained, the core's final disables must still mask and drain the IRQ.
Preserve the shortcut while another PPS or EXTTS subscription remains.

Issue PTP_CLK_REQ_EXTTS requests directly for timestamp channel indices.
Do not use the pin-function helper or require a pin assignment. Keep the
pin-function helper for changes to actual pin configuration.

Source-derived tests with stubbed MMIO and IRQ operations reproduce the
early-disable/map race and pass with this fix. Core unregister tests also
pass in QEMU with KASAN and lockdep. No physical card was tested.

The issue was reported by the Sashiko review. Codex assisted with the
code, tests and changelog in response to that report and Vadim's review.

Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
Link: https://lore.kernel.org/r/08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v4:
 - Issue timestamp disable requests directly, as requested by Vadim;
   leave ptp_disable_pinfunc() for pin configuration.
 - Move review-only testing details out of the commit message.

Testing: 100 ASan/UBSan teardown/shared-PPS suite runs, including late and
in-flight enables, concurrent sysfs/ioctl requests, all six channels,
zero/unassigned pins, absent channels and active IRQ draining. Seven
deliberate cleanup regressions were rejected. Five core register/unregister
KUnit cases ran in QEMU with KASAN and lockdep. No physical card was used.

 drivers/ptp/ptp_chardev.c | 14 +++++++++-----
 drivers/ptp/ptp_ocp.c     | 17 ++---------------
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..5835c01cddb4 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -53,11 +53,15 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
 	unsigned int i;
 
 	mutex_lock(&ptp->pincfg_mux);
-	/* Disable any pins that may raise EXTTS events */
-	for (i = 0; i < info->n_pins; i++)
-		if (info->pin_config[i].func == PTP_PF_EXTTS)
-			ptp_disable_pinfunc(info, info->pin_config[i].func,
-					    info->pin_config[i].chan);
+	/* EXTTS requests do not require a pin assignment. */
+	for (i = 0; i < info->n_ext_ts; i++) {
+		struct ptp_clock_request req = {
+			.type = PTP_CLK_REQ_EXTTS,
+			.extts.index = i,
+		};
+
+		info->enable(info, &req, 0);
+	}
 
 	/* Disable the PPS event if the driver has PPS support */
 	if (info->pps) {
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 625a85b2dc7e..b16d36c3305f 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2559,8 +2559,8 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
 		else
 			bp->pps_req_map &= ~req;
 
-		/* if no state change, just return */
-		if ((!!old_map ^ !!bp->pps_req_map) == 0)
+		/* Skip the register update while a subscription remains. */
+		if (old_map && bp->pps_req_map)
 			return 0;
 	}
 
@@ -5755,19 +5755,6 @@ ptp_ocp_detach(struct ptp_ocp *bp)
 	ptp_ocp_detach_sysfs(bp);
 	ptp_ocp_attr_group_del(bp);
 	timer_delete_sync(&bp->watchdog);
-	/* Disable interrupts on all timestampers */
-	if (bp->ts0)
-		ptp_ocp_ts_enable(bp->ts0, 0, false);
-	if (bp->ts1)
-		ptp_ocp_ts_enable(bp->ts1, 0, false);
-	if (bp->ts2)
-		ptp_ocp_ts_enable(bp->ts2, 0, false);
-	if (bp->ts3)
-		ptp_ocp_ts_enable(bp->ts3, 0, false);
-	if (bp->ts4)
-		ptp_ocp_ts_enable(bp->ts4, 0, false);
-	if (bp->pps)
-		ptp_ocp_ts_enable(bp->pps, ~0, false);
 	if (bp->ptp)
 		ptp_clock_unregister(bp->ptp);
 	kfree(bp->ptp_info.pin_config);
