Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495359;
	b=z8jDzcBejtqEhfoG9Pxrj5+EripzWfl8zV1CjFMDX6ZzgyBGtqiZwD057myzjpRpFlA/
	 mAFLsbrJkzEJwV/SqDrzM0Yt8hqWMS9HGaXoCqA0Ve1ew0+pDYvo7S1nSFcURfWmmjqh+
	 1TFbM1nmBHEESSK95a3Rbc5PgRhAirNGb7y67hFAaiHxD5CryuQGdSebmv29q19Gjatrd
	 aaJ08f2tMVO3wHvNpES5FQOJjRDjhsHz74YcbutSW1Ant0GS9cFok7d/OLp0oa1MIRuen
	 xanS1+SSWtMIosF9RPAh105JGUQhgkUt1d7Ssci9gtUAikRF2by4TZytjvwZ4LpVfoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
	b=g6ZnCtLNybCIZOj5F5kSHUxVCyp6o9tid3a59Z2Otsqgf5xrN9VawOyIDoNVRDifkzE6
	 nW8NI+HreNwGf1hZ0zGLtoV7UjXZ+Y7E3eIldDV3E+rxNGqBHBaB2W2eYgPmlYmxkBS0h
	 /pWR2QaLK2ld2e3RI9HSI3xEJYLE53Jj71HRzsSew5yrk2dQjRkk3sDnqoDKXhSAXq5FF
	 cjBeRuCCKxTf8+RluLLfdbXhEC+G43aBlNeW4inmDHK5cXKBZkdUhfyJmDUDY6WCgSXGc
	 w6E247ncauUTRbeDAEGuqrs7tcCBQzsckBzaBAnKTEICbMvl5w0NgiDq8Ljvk09ZkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUNWD6GP;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36560606A333
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36560606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUNWD6GP
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so5781449c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495358; x=1796100158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
        b=xUNWD6GPmcjKjtaVeqbbPUL4rhsI3ZPkzj8vw1Bv8K4oR2xcifghha1g3L4ksckrHN
         jXjtI4p4vTfly0APrpY8hpdaWNC2Jb6o6U5PbhfjcrWKaSr8G6Uhd/p9xUf2K/O3L1A6
         ST44sLOxbr2tglyn9HHlZZ5RcbNkVZUlVzN6RyHDaHmjAD62fB4v6pD6TOry51LoAtVw
         SIx6npuwVkWoV+l20JlgeEgfVn0tMx3zvudZbFOlIzAW0QwkwPBkOiWMc36kQpTiBc/P
         9efZDBdLH9iKSqA2rChiENNCaZk4P5VKDJ1Zgh96F4JhKy55ITo9zfG+RdL7m0kv0+GZ
         y8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495358; x=1796100158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LR2pXBU1UF0saUliIwhq7NUmfXvWt7NIINFzWDFrag=;
        b=0bKnDwBUyoeZZtkzb0E+77a9/X9fX0HFCWip+v6ppgdvWpvovSLjBnQfssPoadleuH
         eeVAqVE3JHKaxfr1epinMeOMuvo04EPZpRkQkglCGInb3Ixu9fNnL1cwhSiYddPT9NzC
         JoCRpPjcoaAhQtUOitjNQKoiXwJErfmzAtxSRnjmISMY1yatgZj3QT7UtMdwpTf7oFwI
         MIkYUqBGBgtrT7u9mKd0CY1/1xUQnx74QEIhowh3X2A9RpVNLVc7koJPEnY7Gb3IQu9f
         yNSy6bhz+GnFLp2PdkfkKjbP4ENsgROhDT8Xf9IBgkI4vilkdYjRiTAsGTKGEKQDAsSG
         epXA==
X-Gm-Message-State: APuU4Z9olXkKh900B8d8I7SzWdjMV8YttXdAlKOwR079irGoYIz8dagN
	6kU/u16yN4k1Ks+clAIuZCIDrH9yQpDPcPPGNi2b5DB7t/j0r/efYlnkx24zRTKC
X-Gm-Gg: AZFdTZdmWplaOhR6oLYUO5gL7JgyfdPu10KeCQ8miAVMBf3D7j8I9ti2Y4fdmlQqtxe
	Nkx/bqUDnby+m2MpIaDXxNbRlsG2npJZtAyZ8Xe4iaeXuXt5mNRLZgcadYmjj2/S0AFet+k8wUL
	qDhHmCSt25C9pkhJEfFnL+rTgvFvIfMCLsPNn3wD5N8uPVu6AcSUlAz7R184dIo4yhCzQSWiwek
	1lbGGaUA4fPV5h64VsPCKnGU3D6ibrj23Mk5kGj1sZnLAmKZ7VGHpYen/egiGhiDnJiBztydxmz
	aC7ZbRISX7Gl0sEVwuJiM7NER3ZHJ3bjRGmlN/T5s+Z1oAegCMQtzCL68Oerk1B3rEXg0aLQ5L+
	HxUzmhrf1jDoYG8A6gZUrvfhxQmtuc4yEoPzi2TP6idp98WDytVx7FRgUZISx7Ln+fHXP88N03s
	/afUApXszNFPvicI/6lhhdZ5dngE4kjqOl+OejTkje3EF0kWEew6DoIIzR6FrR1HVN+Cyoaa08Q
	PZLuGUk0PWBmWRH6kN4CEA9S8J9M5KWuzgiX6oBFebJax6kGooJpg4eR+JkM+0FR7yb3eIGqHKt
	dDBXutJDY5wNCpGKWT9E5iz3EQZv+Geb8xZZXJVb/lJhgce21cJOnDMj1+UtRz+SQD/QUZrTK/w
	BlFOvgR/v1W4YEri5KwaOOiR9NvTfKirpOh+GYcH4lUhUiBx46/AW13YF1yyLKqaH3o/Hdcxm
X-Received: by 2002:a05:7300:c00f:10b0:386:c3ad:dc25 with SMTP id 5a478bee46e88-386c3adde30mr548401eec.34.1795495358333;
        Mon, 23 Nov 2026 20:42:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm43092880eec.6.2026.11.23.20.42.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:37 -0800 (PST)
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
Subject: [PATCH net v5 1/8] ptp: serialize sysfs requests with the ioctl paths
Date: Mon, 23 Nov 2026 20:42:36 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-1-ahmadexp@gmail.com>
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

The extts_enable, pps_enable and period sysfs stores call the driver's
enable callback without taking pincfg_mux. The corresponding ioctls and
pin configuration changes take that mutex, so sysfs requests can race
with them and with requests through the other sysfs attributes.

On ptp_ocp, PPS and EXTTS channel 5 share pps_req_map and a hardware
source. Concurrent read-modify-write updates can lose a subscription,
and an enable can overlap the register writes and IRQ drain of a
disable. The software subscription state can then disagree with the
hardware state even though both requests succeeded.

Take pincfg_mux around all three sysfs enable callbacks, just as the
ioctl paths do. Keep permission checks and request validation outside
the critical section, propagate callback errors, and return -ERESTARTSYS
if acquiring the mutex is interrupted. A mutex permits callbacks that
sleep, including ptp_ocp's synchronize_irq() on disable.

The Sashiko review identified the EXTTS/sysfs race while reviewing the
timestamp teardown fix. Inspection found the same missing serialization
in pps_enable and period. Codex assisted with the correction, tests and
changelog. Source-derived tests with controlled scheduling reproduce the
reported shared-PPS failure on the previous series and pass with this
fix. Local KUnit tests call the real sysfs stores under mutex contention
in QEMU with KASAN and lockdep. No physical hardware was tested.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - New prerequisite from the runtime-race review of v4 patch 1.
 - Serialize EXTTS, PPS and PEROUT sysfs stores, not only EXTTS.

Testing: 100 controlled runtime suites with four interleavings each;
real-store mutex-contention KUnit cases under QEMU KASAN/lockdep; permission,
error and interrupted-lock model cases. Removing each lock independently
causes a runtime assertion failure. No physical hardware was used.

 drivers/ptp/ptp_sysfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 8e0e0aa09981..90fdddc1e6a7 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -60,7 +60,10 @@ static ssize_t extts_enable_store(struct device *dev,
 	if (req.extts.index >= ops->n_ext_ts)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -130,7 +133,10 @@ static ssize_t period_store(struct device *dev,
 		goto out;
 
 	enable = req.perout.period.sec || req.perout.period.nsec;
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
@@ -157,7 +163,10 @@ static ssize_t pps_enable_store(struct device *dev,
 	if (cnt != 1)
 		goto out;
 
+	if (mutex_lock_interruptible(&ptp->pincfg_mux))
+		return -ERESTARTSYS;
 	err = ops->enable(ops, &req, enable ? 1 : 0);
+	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
 
