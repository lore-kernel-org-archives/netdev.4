Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209697;
	b=nMVyqzQ2gdlggW/+vND8WwaY0M44H/APjY0SSY9sOo1ETglI5voHbHnezG26aE6nXeB/
	 IEGnW4V8F1wuKYEote2ObC2ipoNjktvkKw2EFjQErmTSjNuFISX7lbyG9nIeiFS+5Q0lG
	 sDXQQtKuFSj4hmsPmF8iVROZSP0BnWwpbMfSAGvUPwJ5NoEvdCAn/KNcg6SVWl6VNfXI8
	 4TqnkKUkDFaOfha5h7PNXvuA4rtc9bzyK8fNIGZY93tGFFLDMnw8wkxTzlnOlTlDXLz/j
	 Y5q5O/jLkLaBiTeGFunXpusPUo4UzGwDLjajsEkV0GzFBTlxD9wyQ5/KneCVh6ww0Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jAq00GctsPFv4SfUVxAkSM2z5GipUonrSsY/trIt1yE=;
	b=hl6NUWzYKXt1ykoWIr67LIDwmVbYgovPte0TdFVNTBkTQh1kdVxf6V74AstX6NnnWOkH
	 UF1sKSzO0jHIKXsGb1JHj68IwHOEYF8qejLSirPtfNtP8SMX7P142KaNuSLaoJKBAHD2O
	 IeoCckHolpb09HapN777fJ1HUAUNo1ukljFWy7Ord6N4G7H2XzRrMG0dCU7uPt9tGLfs5
	 AJMnis2N0A8Ce+44B6xJjuTRKaANVm363rMSNYu2y0FVAjybBJBZSVnxvZnn0WPBx/lQa
	 kgA32Pq65KTkGaoS/XQZ1jQFVUxUru5nOOoZA7iKeQ/URo6w9dpPgJeR3M2eP3K84tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1FDRfig;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4E606A6AB
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F4E606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1FDRfig
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so1347981eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209694; x=1795814494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAq00GctsPFv4SfUVxAkSM2z5GipUonrSsY/trIt1yE=;
        b=W1FDRfigq59kP7wGXxTuu1JR0XX88z2O++/iuvEGNh+1dC5SAqGdnYikGL6ALTCi2j
         t9xIVKHwBdLVO12died2QfD36KZi9lTu9dCMsJeP7TEfBMhF194x4BtcDExu9rreQE2m
         WDk6fYTR80wCxxGLWZnQr7c+HN0LMvxLv35tEE7FA2Oge/1I7xD1hV9xvhnpsSFHyUHA
         Ct4RiZ7u5turGpq0qDwX+zfvTuY90F00SSVQzQB0nQkO3z1TE/u4JsD4BldAmLDp/yIp
         +4i9xnPeofeK3zPM3lewILlUqbIfgeK5tgp5aONjxkuc8T+wULe7TaHuj5jxCaEeqPWH
         f+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209694; x=1795814494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jAq00GctsPFv4SfUVxAkSM2z5GipUonrSsY/trIt1yE=;
        b=Ozo9MQqx0nsPErrIq6ZxH2X9ydmNv5awdED79MRlO0HxlkCybvtXXEnyARWLusjHSN
         fyfUNg4dAeFsbWr6O2wfgLmrwZJo/lL15Be6sysnhg62o9ibenFNYMDsYzkeNAUfrWLA
         g39E3R5CWzWKjF0EGCN/5lpDe/BQB1YE896TqvSemKOxjSUDsTvAtcbw9xacDVh/G1hD
         kPODg7Qep0J5lfRNyU6AnnasqbNNZKKTF43OAth9riz/zXeZEQxorvgWW6qyGX9VgDxr
         PsD2aF0Bivbk6WgSEE968Uam1fN+L7h4ctdt3PFd3BYKVf0zjolWdrNqqYP3Pl7Wp3S0
         Hxqg==
X-Gm-Message-State: APuU4Z8zSovOR3jXvF6xesWacUW4GHjm3NVaKNLP0+VdedM4gRJdWVkF
	0oTST2yZhUN/1QotAiUMnkp8MDxcqDGmesWsXl4p54Tw/CB64S9V0niOpPtCNqwu
X-Gm-Gg: AZFdTZdiRGwMrzaNLoyTN3mDzc2m1S86O4qL4oLs36flmHiYFpnNoovEyet5g9n3vj0
	t11k8aEiJ87QFEyA3AZVPK5Ov6icQsK3pHPaX9yWEPi9mcyuYjCrU5bboOP9+T3xiE4AO7B7AQM
	FS+cm3FadvHc8reySc1/F1LCYZ3xA+JU+JpmxCw9hsBIW42TVkBtdLXnUNa0ngzqBAm6Nj1TLPW
	Dj5zTvSVOpiUZp5OWQvjhH4AmZ+eAPb/Ulo5SqKUxOwZXx2QOMuVNjToLkTcVY/EdJK3YQ459GV
	Dl3Rpq2kHeuTx4p/NBbbhwJVP49lgtfMNiKLQUgrzZdeZizHFjuzPufJT8MaU/j8aaIzmEs743y
	GMyf1iv1oW2CASGQtSfQbaVgFcGTusafsgPt23v9GijMoJmlQZ0As34ka8G3VO146EGh83VTLK1
	vOQkWGlV9Zlmaxqup3YH0F3BKkx0zSVc18dZzzgy23rbqcEMUow/EcH2iAtyuOmXVp7cBIw2cyb
	yFLi4EjljavY8IXJSUZTWY/KKJ8G2yT7w7PptB+wupvyhfoImsaMCPaaOvlJ/8s/k/BXcbIpla3
	DCUyInkbYAK7cIjxnF4mR42y2od3MukdQCvPzuaLPezdr8+Wnh3YeDP9bG9XzPwSjtKsmn2PhBj
	J0tv/ebBSvzhcqneK1Y87RtGvusBabG78N8GqtanjumafZiyhrw==
X-Received: by 2002:a05:7301:1501:b0:385:1e1c:9ab5 with SMTP id 5a478bee46e88-385701527f3mr3715912eec.20.1795209693906;
        Fri, 20 Nov 2026 13:21:33 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm1160174eec.1.2026.11.20.13.21.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:33 -0800 (PST)
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
Subject: [PATCH net v3 1/4] ptp: disable all timestamp channels after removing the user interfaces
Date: Fri, 20 Nov 2026 13:21:31 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
References: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
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

The source-derived ASan/UBSan tests exercise late and in-flight enables,
the early-disable/map race, concurrent sysfs/ioctl requests, active IRQ
draining and shared PPS users.
KUnit tests exercise real PTP registration and unregistration in QEMU
with KASAN and lockdep, using a test callback without physical hardware.

The original teardown issue was reported by the netdev Sashiko AI review.
Codex revised the code, tests and changelog when asked to test Vadim's
cleanup approach, including unassigned channels and shared PPS behavior.

Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_chardev.c |  8 +++-----
 drivers/ptp/ptp_ocp.c     | 17 ++---------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..193e6baf2b47 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -53,11 +53,9 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
 	unsigned int i;
 
 	mutex_lock(&ptp->pincfg_mux);
-	/* Disable any pins that may raise EXTTS events */
-	for (i = 0; i < info->n_pins; i++)
-		if (info->pin_config[i].func == PTP_PF_EXTTS)
-			ptp_disable_pinfunc(info, info->pin_config[i].func,
-					    info->pin_config[i].chan);
+	/* EXTTS requests do not require a pin assignment. */
+	for (i = 0; i < info->n_ext_ts; i++)
+		ptp_disable_pinfunc(info, PTP_PF_EXTTS, i);
 
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

base-commit: d7f2d9b6c7d0ff0af7d19d889810d35dfe07da90
