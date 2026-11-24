Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495364;
	b=SXW17c9AGBdiz8owmmploq8MUoaNb3UawkCtDFfVC64t0xBpwQar5eim0uXMgehgWHuM
	 b7CylsmTD6eTO231bEjs/jPk2yJ2sqEmerGtl5hYpYJGwZMcyjEQzPfKGpxAPLv/GmZq0
	 gsFiy0YHGKEBdB+PLLg9JCqxg5Mo9H2pcZ9QPB7W/PRUV4k4OQpl6/3i5iynRew2ZyGbb
	 GF3drBBSiljYSClB8wUn8hR4PuLsbgkEtQn0JhhpIGnjsTyYkJOWLgrPvq4352WTNbdzm
	 8C3sl5+Xndqu4aiao7D6rH8tFNp/gF7RGmlMuL2MrivG8QiqGrTor1yWJIfLS0at+MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fWOnOBEQw3Mc5eS9Nnm/2nFl0bvr0BQf6G+Wl52nhnc=;
	b=oMBe4FhNvQkST3rl2sAN3ET0FyQQ/Rki1kMma3qsmG/L4hqrM7NnP2t4ObxjfkSxHBON
	 /P52LdI3GrNGApoFIyZh/R8AdSmsgkD71RMeLzdGOy92hNjNQ5QH5ajf8TD+RfeDRItFe
	 idAA6H/ezOr5GVIYZgk4B7KP1K7V6NKOmgGuXg9fjXNRcPjkTXvgPVmq1tJIl0IW53EMC
	 96b8nev/2/YaOZwmWbKYWXQYDfvzqr4jN9I1Fn97bvTq5U4YDlQCAK+HyizVsr2aO+kkO
	 7XyQzW3iFMCnWFRffAUsrdsFtiYDNvsz3MsXGCz9lJwuFfWlcLIubtZSyDZrwTkkp3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6Z7yLPw;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF1606A338
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DF1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6Z7yLPw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38587f3de36so4947949eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495363; x=1796100163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWOnOBEQw3Mc5eS9Nnm/2nFl0bvr0BQf6G+Wl52nhnc=;
        b=k6Z7yLPw9Ol9IGIW7w6aFHsPAokjVyWORBR5Ld9qK2NVSXJE3jtpaz5umF4afPkrFH
         E79yef5PnfYbhTgzpxIJtA2UcK6efHvbqX4a+WGujDQAO0hd6VcexWnrrobyvSSSFvvq
         MbTco1HQH378bx6z1b/32F9Yhghx85X1qckxpDqYW3HfT0fSwKg4Kx6RZQ3fBImJhyMQ
         hKLJkgc9rnZBxPesCgkh8NXX6eyU9VLASL0v1uJ0VCHTksxK/b97NHPRmLbSLwoM2k9q
         CycsV982sGLD8pCjHm6b1JXy7lATfnFQJtS8ADWTI/M2P/nijuw4KkyS1OGHbyxSf1f7
         toQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495363; x=1796100163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fWOnOBEQw3Mc5eS9Nnm/2nFl0bvr0BQf6G+Wl52nhnc=;
        b=OvtGrRdjAwRRaOpayopXQLUkN8D+GpjBsNEf1AiGPMJoov++Tx3OuT1UHmhhNL2DbY
         PXGnF1rK3AOXzTka1qrwlaf0XVgBew3SLIv7Za3kQChPchUBC5gbok2LXf8CNbmmC/gx
         YWo5MYb/4rO6z5pGWT+5n9y658+8pTgYWW1pYEe+5xEchKEuamQAn9gBS3NbCwTS1Jdh
         xEZ/S06SW++oVUINVzJJYijzkOqOGyzMf5Kk01O6vLQHpGWxvOjorpraHT50nfeEunVD
         YZHAOG9tGCafV7gODG0Q1mJoRaAgDQC8gYUL83AhCjOPH+V+lknIFZmSXEmXPw4C4DJD
         EwtA==
X-Gm-Message-State: APuU4Z9g02W2lfCWZxNkywjLjU7oZuNj1i48IbxuBlJooEMExw99sip3
	CGjkA0hiIo1JvcnH+JZJ/hguqD9uVewkShAMw5XUpgCHfBS7SAf0t+GOYxj5fpIb
X-Gm-Gg: AZFdTZenPqBmLbpDj5w1bcrK8lrpHrH+GnwghuHSBPXWYvdFgGIGu4SF2lMWzGE6JF/
	LwcIv+81uocw3N9UTGKdRmtLMCVnehcJ0IJpe3Us2fvTs010xE/OqjK7E3794uUFIagJqJ06rmP
	W3GSCY1AJCmB9i4ufkuEsO53PMqiNZn3mPQWbY7KyjGOWWxr8x1Vk+3OcV0vyncxqNVkzK4zXBn
	LZ/C7MxxyVS2db1P6285xDbOd2GyKrQ5zwQor+1YKMx8Oz47d3dD9MC245kEqxZfmD86mBCq5Vk
	LK/i36lwvw4dUYME/CtxvT/ZD8Fm2ofAWC/svQFzx+MNY9hB1fvw7YYujHKWuwPb/MsVhkkH9Ua
	T2oHCeML/Y/8zv6VaPgkiJNe8/ze0TnKp+imrMBrwIPdZ8XlqjL5utsUCdak7CmFl1Jy7lKnyOR
	sZVYNsucXZ7Z9vO//hLRJcSYEk9XhA/JqPCe98P1dQalQngLdslYF234EbS2YAmZSS8H/cowuGe
	oiIjSBuix7C+XDpexMc4DXX8MLGcXFbmVf4Gwg0RJLHaVeGshB0FGOXRAJwZo9NkHJpzQGi/eUK
	Q33kgicKn0XrHjG6QNDH9lfVxN78/0+ucW91IIy1XnUPCJvvAZnSmOyYw/oPWY/1mvUrRT1+Had
	YWyffSU+EjzJTpH4PveYQGYfDRvrBU9FLQoh0xlmW71dP06jbU6AxpwC/mwfz/mnEj3vsBY8G6w
	==
X-Received: by 2002:a05:7300:8807:b0:369:5583:bf4c with SMTP id 5a478bee46e88-3856ff5bb62mr14355293eec.28.1795495362923;
        Mon, 23 Nov 2026 20:42:42 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm34172134eec.25.2026.11.23.20.42.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:42 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 3/8] ptp: disable all timestamp channels after removing the user interfaces
Date: Mon, 23 Nov 2026 20:42:40 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-3-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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
and drained active ioctls. Issue PTP_CLK_REQ_EXTTS requests directly for
timestamp channel indices. Do not use the pin-function helper or require
a pin assignment. Keep that helper for changes to actual pin configuration.

Remove ptp_ocp's preliminary timestamp-disable loop. It runs before the
user interfaces are removed and can race with an enable: the enable sets
pps_req_map, detach clears it and disables the source, then the enable
rearms the source. With shutdown delegated to the core, requests finish
before the final disables and IRQ drains. Keep the existing resource
cleanup for probe failures without a clock.

Do not skip the shared PPS source's register disable when the final
subscription map is empty. The map tracks software subscriptions, not
the hardware's initial state: ptp_ocp_register_ext() requests the IRQ
without resetting the source. An already active source must also be
masked and drained before releasing the clock. Preserve the shortcut
while another PPS or EXTTS subscription remains. The preceding sysfs
serialization fix prevents runtime enables from overlapping disables;
the SJA1105 prerequisite prevents an EXTTS disable from changing its pin.

Source-derived tests with stubbed MMIO and IRQ operations reproduce the
early-disable/map race and exercise an empty-map prearmed source. Core
unregister tests pass in QEMU with KASAN and lockdep. These are software
tests, not observations of a prearmed physical card.

The issue was reported by the Sashiko review. Codex assisted with the
code, tests and changelog in response to that report and Vadim's review.

Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
Link: https://lore.kernel.org/r/08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev
Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Keep the v4 code and Vadim's direct channel-disable approach unchanged.
 - Add sysfs serialization and SJA1105 prerequisites before this patch.
 - Explain the empty-map shutdown independently of the now-fixed runtime
   race, and distinguish modeled prearmed hardware from a physical test.

Testing: 100 removal/shared-PPS suite runs and all eight local PTP KUnit
cases passed. Seven cleanup mutations fail at runtime. No physical card
was used; the review-only fixture is not part of this patch.

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
