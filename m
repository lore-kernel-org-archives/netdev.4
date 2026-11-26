Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711343;
	b=fvNmo7u45if5OVQkw7QPe/29kRUzkl4wupDHN3z+503vB6ZB3zMIXAHggFHgnvxr+vXq
	 X85EDodls6Ik+OegUL4U6pJ0X3Ca0c1bcO9pqezo4/2KHFA9is20tWyeaAOUAtSLrdeCT
	 NztSREMx32YHuQgPMnUN5lheiJI+ULwTiHkPSyp6fKAxDJAMMGDuSp00wLhTeFwR00bOR
	 ac8qyNH9hEus0gMkavWSYlS5LepkoVdz8GwHSYxRGjouEzxG4wCE3nbfjZwC7Yg6OLUM2
	 flZBtsjuKZ1ZpPGLYOta7WuoudNdM7rfqj2KjTKEg5DfZn7Av2TKDCxnBncgbpN3aNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
	b=MfHhg97ex/gDNatQ+DWfxLYrZ5XwZVrS6MPIkLam8eI7qDF5cknqq29EqNl+iYHfLQZi
	 MCYQElsYQegABUF9ZRzuzOqGkhyWXFmntF8k8vjtf70elQ7ejjvjQ8AnY1go6/niZSsxP
	 eOPOJOFC6DI+m5rJFMi9PN2H7JEW9We07hFcPRebAcq0QioB6gk3iB+JpCCPK4d97GS+g
	 jg3/cYd+30EJXmb7GGvtDNE3iwYtFq6toRMCBKRaxro+xRjeCMwLO/ltDnSqxAjYZLGif
	 +VLWvtLXcipp8jqPYb/tg9RbSa1rYvPUnTejJ9+HAIMF0YO5ds9I0Obk8sdhoWA5FNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2ppBKMv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250FD60A5BC5
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 250FD60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2ppBKMv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4964796eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711342; x=1796316142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
        b=E2ppBKMvKXns7KliJOY9mZ9i0Lckwm5RgeBku6Cg3H0LxdaUG4AC1ayyJWhcPWJRKv
         F8GKBPMlIdOf3C8aFEqMN1vJwit1zLt766/6XLEKutJabSM7YfS5WvdzEKZ/EnqNsv5V
         XEZk4wAElQWFUqGipq1rXG2/PToZQeq+qDs/SawZRRELddNdTSIElrQ//Ks9CaRYg9qw
         KCqEEPgt5QchSyz6YttEReI6ts5KHL+BC3PKtj0AIeefGT5QaN22Yr+3mqfKuodrCy9R
         UuhrjKDegOcoOSCkXIl7PBUQQY2bGDn9+UzvFe0JAy4cw7/mhab3gAeL83vDq4l/1t0K
         JejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711342; x=1796316142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmNk+KHn0GoILmDiqUcbB6z2KhRGGNwX4wwEJY+9EIc=;
        b=qOwUVaKp6GN6TAHyAbXRD98fbT7Ernk5DziEY3mDqZ5iukXNq3oG9hlFk824s9dTu+
         7xb5cfLYBhTRMdGql5+B9ySr3QYwRePO5Jk+L2LfkMKA2Rf+lRoaHwzHucw9lzIlF8f7
         FabeFEheHKbh/Yl+lKfVmVgt9LNz5oXoqH66b3vFaV8qzeK0gPBVqgZL95hBtvhQRlXn
         3vACXY907rGNvrnYe7+5U75ivJOaSZNm+jUh/3jFdrkj4CXzJCu9wsgiXJd1PYiK0CSU
         vrOg0prHcPQT3h5fmXPgeOprzPjFsBEgSsmAePCmVIv+0qovo8FYyasEKKqgWPVgypi9
         VUPA==
X-Gm-Message-State: APuU4Z9tjqzQS5SqaKldaPRQi4wDd+DxZDlO3Jv4WWiiC+avOSnmlZEi
	DWHUdrimBOwF2wTczhN3h97TJllUOGNueNgoLXW+qBVGGJtnsvhidqOsTfaqgK1g
X-Gm-Gg: AZFdTZeY0sW1Ehy/K9NLzRzfT/KCU33MS9oex26NptUwp1jEXvL8jOtMqd2ROIuJCjo
	Bvfog+FcUdtFIOYKlrw893KgTcZIna6+oVHkttdeqITU9QHGqK3izFNRNdcnz5QGFQtrzJxSLmE
	4RAQk5I8hiZlUbvDGmI9d+kxnvLj0WEb5WXzDxe5SY/98HPtcIsFqS6JUMkiBVQSdxSqKjusEHN
	uE3Dstc0uwMThNzuWV8R9rJcLkMM6wqNXJwVzNTO4XmyOHCphFUi+lv7PqsDCVdiBdfITxN4lSb
	26UNeVO8JqEKmCDtrIUq9wqZD3lGBAUjaUC2Dl96DPqEiG6A43fNe4LoESJ0K8UbsJ/IuHhRpOv
	FXZ0p6H17pBqTg4xMBYCo/L8QH/JTFHDsiccq8berQE3b2iK830pJ6fMfj8yVZrtNPyW+AMZ+hj
	WRU2EEtsCweU1ehIYjWmnVbLnJeaL2TuG6DFPPCs4eun++SVapm3B6IDopd157oq/dwM5wxgRLb
	NwcvuyOmPtWHvaigSM2RdeVnORj1Ea6A8U++6AkzdxBdW5KSBYki5iIinbnQoSuu5KpfaYL+HKn
	+dCzFF3WlDbahIyEnrP/4/khT63PHVseMKCUgRGH94lco1ZyPvVbr7EVc8ssniHYAgMHgMCvvPm
	EgQ9VlFICn22hlthpYWjEkpTLROfrv/VnbmRsdStngeKOIXX0NYzrnZ8nSOYgnsKevfd07/KhbQ
	==
X-Received: by 2002:a05:693c:69c7:b0:386:b745:ac60 with SMTP id 5a478bee46e88-386b745b019mr10372025eec.18.1795711342204;
        Thu, 26 Nov 2026 08:42:22 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 8/8] ptp: ocp: defer timestamp shutdown to clock unregister
Date: Thu, 26 Nov 2026 08:42:09 -0800
Message-ID: <20261126-timecard-driver-v6-8-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

ptp_ocp_detach() disables timestamp sources before ptp_clock_unregister() removes the user interfaces. An in-flight request can rearm a source after that early disable.

Rely on the PTP core unregister cleanup to disable timestamp channels after userspace operations have been removed and drained. Keep the shared PPS subscription-map shortcut unchanged. This driver patch depends on the separate PTP core teardown series.

A coding assistant helped trace the detach race, prepare this driver-side change and develop the combined teardown regression test. The test uses the actual callback and cleanup functions with register and IRQ operations stubbed.

Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 040518895176..27cf3ab3327c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5768,19 +5768,6 @@ ptp_ocp_detach(struct ptp_ocp *bp)
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
-- 
2.54.0 (Apple Git-157)

