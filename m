Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711286;
	b=l+dASko/ie5t7fFB75tTCWE3/XCZS6i2W+/rLQCODxR9dwo68bCkan+jTh3L+o3cqzQN
	 368STAx6NClHwP0S+YyRl8sXLBnL8ZtodX34xmQX0kGmRwki05iLuJgl17LeD4RlnGUss
	 3t4lHHHa+0xvt0xwOPlazygQW95dmKZ3wPu4QpekJokzVkTofXJIJUVhkSo8zYqwC3gdg
	 sWHfOJzHo8TCJaoq5iDkFI8TJM5eYG97lIo9oFZ0Tvt1GEXIPym3aGhqzGwGKmADjY8GV
	 sEn8UujeM6TuDoPRiv15MgjqJdkAkeoRUedx5Ilojrzz+8uquPt8wZ1tFLRz1/qE0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H4thd8/o0XU9y1Nr8i2wrJ+01ueASy7DZKlmGehOHYo=;
	b=33OZpst5aeZY+vdckIFKUxF0JgwTDNrnT5JIdcGlgKnGEukT9B4lr5x/Hp+R5+WJhPxy
	 2CZmShtafqC4Fdm5OvwVIF583/WMttlciQEiFrDj7JpQiY/+mOGdg/hc40POfctVAvazI
	 OkZg+S4GTHIuUygppe1cDHWD27Wn9wTejY7tbG102z2+kom0YEgmA2jZzEymSiNc7lkCf
	 RlGczsw3iCkc3FWHj2txjdO5Y/XBD3eye/ZSzl2+B2skYpjJa1eOPTRs3TV3fiS/CZPmY
	 C4sD/IEs7b67YmisV3sJalHu2BNiYk/PHQfHb7yze4jOjDSyiFjsNgmifmmC+L6JlLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEeZ2T5e;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679A6606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEeZ2T5e
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386d1859e1cso1663990eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711286; x=1796316086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4thd8/o0XU9y1Nr8i2wrJ+01ueASy7DZKlmGehOHYo=;
        b=aEeZ2T5e0u3MNcjlySnsvBty+KHbjHtYJgtn9ATZ7MdtSw1PlDklXAi9ragq1imF2X
         +zdyGZ8tPGkX+tVVXRSWBEA4u8aZ6JrOkedXoEUyGcgK/HjD0AfBJW+YctF7rLz1u9Jq
         9nnbpmLTPzKkrPtC0LB5u1ktaYOoTqQjqJ/nBG9wjxwU7u65XvXwVydJc/C2OQ6gCEAK
         pZp9Yn9eAclM+ZT8O4uvL3P5tqe/cjj24nqx61qwiEcTK2KsM1x34YhKZGseqNWAj49c
         wbt+Q/CxsCn5gWHGrHA3gcz66xh3e717MfkZnQVuUgH9RrqMG0io459LTj74RxKcb2il
         D94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711286; x=1796316086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4thd8/o0XU9y1Nr8i2wrJ+01ueASy7DZKlmGehOHYo=;
        b=GYUFil59piIV/XXHVRr84mZb7IA06VUztY60nOnCg33W8o44TCxIPvSafwoT7JlI34
         RdGpoDFvJVcqAhlTXvy8b8gIg8tHcALNuYx6+FYn2PfxkkHHRGT4//OoDa678W9HlocM
         sDixSB3i8MTGkM1aMB7IvceRHWMnj3f4cxrOwAKbdOEyGLVU+NMWSstH8ig/UHz4zdsz
         dMWxNt81jFsdCHtPiVCqCmr9Kc/kavNvmXRriMH/auoZnie4Ite+LhCeM3fJ2XgVkK+b
         7v8ETjMlvl4iczMkM6vvsyGZMkte5qTOgbn3SKLDoqiIOFFCUKUc1mKeak2PqkIf1RSI
         JBJA==
X-Gm-Message-State: APuU4Z/WtzdspqlmWE+UVsVkNuqPfV8kd27BJSE95/ajAC+hT03SDdIQ
	CyLELFXtrw/HLfaO3Vbkjjuz6dBSkPelGO8alnVjOLj6yogO+KbuF33lB1RLp78Q
X-Gm-Gg: AZFdTZe5m+KMPNlcsIZ6WaeYHrl9cH31hd8KnF/hqsOpVcVoLkYbM5XmlEJSdypuA8X
	YcSjFPzpgGKGCjcOotNo+dJ9YZkf8++dpyHx6GiiECmiqObwuCiN/ulcVgYeM9atIIuii7YGJJu
	TuH/LDFB5aJUVxpTuAl2uAtvHrt4KAprlLMJpFsk3h2FHUdK0X8X3PkGHQS21lRuHKn25Qsry8Q
	QjeBjZpEky5iXLy7tGTM/8KPaL5RXbm6EinkWmSMU86I7jjyGOL7ai0ENTejOj6NOnGt6mWCuSH
	OlNhs9HKcGCRCGxXo5rBRg6ZgMc1mLwInVZj3cnR0XdXCyOCjOxCI6FuKFYIjBWi8aBZ3NjbW7p
	Ewx/pqZNRM/tHkxY+Xx48e2TUzF71QRz0A2AVhy9ondc66MzQymkP2gb73e5xrzKEMk6N+4aK+9
	GKFt60UbhgcyZmZm0w8YjUwfDuZRUNV0wrhiGW/oKxpK33H1htJT5rKZJ4/wM1adA5raQ41XU5u
	1k7F+GJg1xkwaDTZkDrzh+u0hh1t81EoSKboaCg4Bu9yNzlw0SpBSmyPixFjQjlY69g9AD36OHP
	saGrFLSCfYhxw5gf9tsscoIBgrn0o4C/xJgEiRN3QL/GTRlbjfByd37c60QlRMwmUcXbWSkEM53
	IQWo/vetnG/LMbuWw39hB35UYtAUG0DtTh3kHBlm2wgd5w2WvJtRr41j14FLBAQTxJNkeKpGk2A
	==
X-Received: by 2002:a05:693c:884d:b0:386:d9ab:5cf4 with SMTP id 5a478bee46e88-386d9ab6c21mr3062391eec.3.1795711285570;
        Thu, 26 Nov 2026 08:41:25 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm55903706eec.19.2026.11.26.08.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:41:25 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew+netdev@lunn.ch,
	arnd@arndb.de,
	john.stultz@linaro.org,
	rmk+kernel@armlinux.org.uk
Subject: [PATCH net v6 1/2] ptp: serialize sysfs enable requests with ioctl paths
Date: Thu, 26 Nov 2026 08:41:21 -0800
Message-ID: <20261126-timecard-core-v6-1-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-core-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-core-v6-0-ahmadexp@gmail.com>
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

EXTTS, PPS and period sysfs stores invoke the clock driver callback without the pincfg_mux mutex. The ioctl paths and pin configuration changes use that mutex, so sysfs can race with those operations and with other sysfs requests.

Take pincfg_mux around each enable callback. Keep validation and permission checks outside the critical section, propagate callback failures, and return -ERESTARTSYS when mutex acquisition is interrupted. The mutex is required because disable callbacks may sleep while draining an IRQ.

A coding assistant helped identify the missing serialization, develop the fix and regression tests, and prepare this changelog. The source-derived tests exercise the actual callbacks with controlled scheduling; KUnit coverage uses the actual stores under lock contention.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
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
 
-- 
2.54.0 (Apple Git-157)

