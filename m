Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593444;
	b=qxogH08AzxwGCWVLkAW+AwshXYOzg7+H5gI7ddooJNQgPaWGNJ8qp1GnaaPu9wwsmUDT
	 H5We3EatF/FWHdnNRH5R6YhOqI/5/3RePVHDhWexSCCHEj3n3YCFr8hEl6VRbXqa6OP5h
	 EngiuzKlnqllNxH9fDD/Md30c87fAy8+JyDXbzKaa+XaodftacfiRtRAdjIHtTJ3ugkTy
	 9xg4oTbHAogCPYzjpHUJhzrDCkbOGnReCT40+juNUSBYp2E959jPXOmQ3PJXGnzIeTguP
	 i572CHMlbUGKlPA97RX5X02TYnngMNkTi4HrDCHvSswsuzzo4Lffgp+wbjxr8BsuppQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
	b=t1+GYJCrid5hzhm6JU8neLfbyFwyI7asQabmlPDW0ObPcmyNnpvClsEiSlhaLmBWfedq
	 RWzy0OY2ytaxC0iwrbeNsxUMi3yu6JvFOHkNohvBxp5Yj7ALFdDuVtCFgnothQY/Sd4EW
	 RVMJqEhRjw/Uaog9kndc515allEYbfsgsm/5wxpPDcY/HxRKvebWF5dgPnONs8YQ8Kn62
	 5KMruFkc/oaIqVCQg792bUBmi5h74wpnaZ+Q9QguHGRuCdSA1HljsPOOr85WozayDfNkw
	 OW3v0HP3NxQGtdrL6MGoNNwp2Yoo1WIt4AUbMSt+CaeEB/ECdymiDXoSrIRhw1RhDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFK8tmDW;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F116A606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F116A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFK8tmDW
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3272609a91.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593443; x=1796198243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=ZFK8tmDWhCipL0grDwpXjMPOD20gczCLfVmo7aiULDHAvwARWaIiOC8ZX1wNkFuclF
         wMtQq3G/vEWJHMGvgBUYq+stgdivQX5+iNCCJXMnhID8FsC5wrmAB7W2hVd1hFsUK+gp
         r4k3r1kAm27vBm8wEcuL6ZCuchg/lem5eYpZ3B10Cf4AZLIHy4a1nPZlEp3Vh6v5OSjb
         3xSwp/LK01S+cc2sZYyapeFMxruE8P90ELucOc050HgPati2I7WlSlM+xWWz5Cy/LnkH
         1uZBVXf0ZC4iEKS5L0pMAW0vMZcvCzPPpl6/StWZ//FbX70bP1FDgIt9DnSRY7bnH0G2
         pt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593443; x=1796198243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuNfvEy1BgM6+lq/Ggcvuq6XdX7O276tu5lC+EY67b8=;
        b=HuyF7Mo1ILPbcApOHAndPy0o4CxcuAXErmhZDxB6Cl5+4E+NT/na9teLzMPkur5tva
         Tcu+j/76aeVvNi6fvvsQdyuFAn+7PgJcMsZ7U3HHz8+4n7aOWpnDvY3UgIydRFgbLpcl
         /odK49aj86nSgOWyhsq3f6bnHyrEiz6KSHAcBu2MlokFBOUtWYC/qRfN6/UlSqMKInJ1
         6S6/8OPbSXKbSDQntVS4U4s2oCmeTTNeqSVWES5NcHU874+sq7/UhX0774LI/Yx1w2nx
         TtaViaxYeQ/zzBOGr5B2JlIUXi15jOPKsKn2e4nQ7dJ/JcotdsqDzBB1bT5WJKXNWzsA
         bnjA==
X-Forwarded-Encrypted: i=1; AL+hErHvgD7on211KMGCDziZ+uJ4jgmMXQewQtP//PyOffXboFfh0NY8vc/LtuXZxJ8wi2dPEjqca3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QzU7zeEgarqXTGgDSncmTEd0/z9UNBiOOc4HoZOegbnnYD5gy
	bVD/L8L+ZJnMMiLqgBYdWRU6BCEpPCcWan7j7Hf9f1R+iyFVKOtwFoSv
X-Gm-Gg: AZFdTZdrk5tYQsMnlEqahUbo53sTTE5LMGx6MW3ceQroqMzAByLiQCEw1BidnnULG3v
	9hKM3L8f4dU0vAu0UoSI9pba+FCwlhAW6vjcj4Th8j+o8GQ8YpEvT/05pQxTstz4c6VnoF52pl3
	3/hY4ceh7VmLuN85d1jmYg1ISzdCIQEsK20kjFUUNCAwMFlce5ZQcmqyXuIP+v10/18yFn6HuB1
	honHrLPyf6ekcsMKHbf1D3ODnfl5UCUNSCSOxTpGUBz/YFhC/QNDyg430A9eTn4GqkVVBBj3pyq
	lNM0N26joioqq3Pc70BIhE+cMwxIjAPEYW3UoR8L/yLQBtcPjW08FVTMchhFQ9w7+34uVHKXX4u
	lAfWnCcN04rsx2NmRv6bkfQQAXrWavnUJw+P7KJe2ZmZjJoDfkH6WfJWewyaScDeES4+zTFR/Aa
	4Dre1ZGXWPo33CuUa6G7LaAryY2U9FjN+rVpiCF4MojGHtAykTs9tweFRCdYdVfKPEpavlQxkNG
	ME6Ff1mzWttGnHx3WYalvFIccU4FruYzbEyeyulhJk2p57+/GzkGWbPjF/5WMzn08OibBZFZBrA
	HvXN+zvjtRsw0bD1MDtU0HK8ZLEM
X-Received: by 2002:a17:90b:5543:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b41c8dd197mr15969724a91.11.1795593443202;
        Tue, 24 Nov 2026 23:57:23 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28092402a91.3.2026.11.24.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:57:22 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: romain.gantois@bootlin.com,
	cathycai0714@gmail.com,
	avifishman70@gmail.com
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
Date: Wed, 25 Nov 2026 15:57:16 +0800
Message-Id: <20261125075716.2262174-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7732873.EvYhyI6sBW@fw-rgant>
References: <7732873.EvYhyI6sBW@fw-rgant>
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

Hello Romain, Cathy, Avi,

We hit exactly the interrupt-storm scenario you discussed, on a local board
running a PREEMPT_RT kernel, and I'd like to ask whether this series is
still being worked on.

Our setup and trigger:
- stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
  with PREEMPT_RT and panic_on_rcu_stall.
- Trigger: fault-injection of an uncorrectable MAC safety error, which
  makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e. 
  dev_close()/dev_open().

Symptom:
About 30 seconds after the injected error the board panics with an RCU
stall (rcu_preempt detected stalls, rcuc starved).

Root cause (confirmed on-board):
- The main level-triggered IRQ storms at roughly 820k irqs/sec during the
  reset window (irq count jumps from ~220k to ~23M in ~28s).
- stmmac_interrupt() returns IRQ_HANDLED without clearing any status while
  STMMAC_DOWN is set -- exactly the "unconditionally returning without
  clearing any interrupt flags" behaviour you flagged as dangerous.
- The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
  grace period never converges -> panic.

This matches Romain's point: the unconditional early-return in the
STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
watchdog.

Fix we validated:
disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->state)
in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
during the synchronize_net() window.

Results: irq count peaks at ~724 instead of ~23M.

Questions:
1. Is anyone still working on this series, or should we revive Cathy's RFC
   with the evidence above?
2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
   window" be acceptable, or do you prefer the more general approach you
   suggested -- wrapping the STMMAC_DOWN set/clear in a handler that also
   disables all interrupts?

Best regards,
Zxyan Zhu
