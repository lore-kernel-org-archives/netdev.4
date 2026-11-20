Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139767;
	b=Smm/cibDZgBIDvrtQw925eUPxpIh1J0t6odvYjf0Xo9kEu7Qv9+/TtiAnzztVDGLf5bF
	 sOQ/Ig5ur7ATqHM3BD9EAcy5tf5oHmEu4HczuYSGeGYzMQ59uouMyUTvl8F45ZpCrLGJE
	 YHhhY+oqnFdFbwnzkUNK56hRDyg2bzCY8M6fHlm2VHkX8wuaeeenm4Lf4SlK3VTyuBMra
	 lKZU9utuWBDa8C6eMzFzCefcRXGWRtUDWpnYbo8IMK1c+1Ceu/qg7qXcvdUSRTtSV8RMh
	 Sw8P12ggTEP48ta8DhhJox+kCbyC8pnxdfZCigt+WTiiARE30dDMhVozGTmu5h4M9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
	b=CvF6CB6EPg4q2+BcxqYbgmH7yOlCo8qz0LxSqoApsXgZqvZlC4KWeKc/pB/SUIUEj6HE
	 uunG+D2fRdercvCdTKbpOHLJ0yi0ImQzMeRaSyyuOzvKXrZ3mH+15weHGTKJCwmSsUYag
	 GC/YN73ltqZVKBSTRtV6EWurmvANglz/MpSPfqMCmj8DD+0ggrrNM+zjvmVLybUfrV7cE
	 5HIkbWhnjMMvKhELG/uUiur5jeA1DTeMNXlWAoIe0vnnEkLPvc9UPnJKzhTtUpp2yagb2
	 0U/BVXGy2Xs9F4CvjBartrFZQ4luN4PY/kSJPAXqUnoaSmtZg0hJA4aNyOTZVXXPcDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfDteQ9m;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE6606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1EE6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfDteQ9m
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso224599a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139766; x=1795744566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
        b=NfDteQ9mRoQOrVaEw6xG5NFS2S+VMbFp6z5vKMlojmwMkljHofsFySihNNjII/zd2L
         75uRbI7Nk/HAuFlW6kiCEZ5LgSLKX/aqfMoX0n4buoee3cccgUHBy0CS46YgnA8o0fwT
         ityPVvO2iXs4kznNNKqlbW+/B2ijcb28J6H6AVnwsPNMsO4bwLGhD6Dt5wGjBkWxEJcw
         /zHVdVSxTH/Iny8tLNL0bXnQNk/3snWscZIYIP0J+L+oeYU46d4kYX8EPkAvG7oyiJ2b
         r45MsS0EwXZYJVyB+5rYLBcGMWJBZQdpJN2CSL+hOBx2VAtJorTdBh0LUK0ulsJZXnhY
         e6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139766; x=1795744566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
        b=OHel8Ibh/zdLYucWK6b6wdi24o/CUXjhdQH0zrhvBZf8n/lW7i3XxvjcoiCt31Aq50
         96HJRSw8MiWEsji2zwUMeUb2YZX8VbDWxfSyHsZauLCFp4Sv0WfBUyUHUqOG+iFUXAAP
         3d1SAc0uq0pggZWM3/LlxrUdSOTEQMVSyIazfGlPCiZhMmle95M73so6JNIfkl7HUbkW
         QaBNuWUOJA2y+FHruKg7GXKTDwCFvNzR6AThj7Iik2b4CV0QMzhP9S3im/t22UfFb53Y
         dPu1NvK3DjGeD4UqQsGDPh68+zuc07tSw0LCk2nsUL9/3CwXmxtJWcY2At6SgTy9Lndw
         T4cA==
X-Gm-Message-State: APuU4Z+WLW60M6azHErfD9OeyrQDyzzB8avq8DiLX97s1uLGog8gwG7u
	xVAEMx1011iLsqwPlUSwwrAjPD+vBA5PCL+lfk4IEUBnOehOhsMrx80Wi3v/PuB5
X-Gm-Gg: AZFdTZd/Cs7F21FCtV0jUF8JUNWaYrXkgo1ozyCuuYIg9OlKiDaBFD1QSzCQLZGIivG
	IK+7CwR7L+N3+1JA197VzEZeqfTM+IfArHOh9fFqdHiqDGOT9LBbmy5votmW7tapO2ShhXywXim
	KqPAFRjrKVbF4W0qcmqVGHpK7uvVtKGYQtBE6GDAL3kzvLSmPhWnnKdEWo2tCoGI49JVUFvo/ql
	SEFmoGYOytgYtDGPI1WDMJIj4oVDXUPtZMkP+TfSpPOn5PJ36thy52PF6L3+ttipJry6QitD9Is
	QU04HcGHWFX9O04qddG4B1SEikXqQl4ka63tr6PeeGlKZ56k6ho51S3lQHazS3oaSC3CMdufrsJ
	Lr1RE+PeEFJiOgTwuFqlWku3nVKjTn0YavMdMdKhbiQDhxbHmDWmo83waBe0YYQEESsSOXSzPEa
	lHO8UiRp493yavgqrMiDinXSamLw42PCEl80DpuUeoZr/h7Lznl6eZNzLFlhC6gXqBcCdFNF2ct
	+bh3hHP1liH75fg7F7GExx9oP9vR7UCJN3T8hg+DHFnLXoPIn88wWOzF7YKG9CiQbJbIMYtBFWE
	p0DVIF9W5JIzamkBYx29w/pAPeZO3OBJBoZbgkMBWrZKApeEMfE=
X-Received: by 2002:a17:90b:2701:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b41c7abfc0mr1202961a91.7.1795139765759;
        Thu, 19 Nov 2026 17:56:05 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:05 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 0/6] net: wwan: t7xx: fix TX push kthread soft lockup on suspend and RX stop issues
Date: Fri, 20 Nov 2026 09:55:50 +0800
Message-ID: <20261120015556.131547-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
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

net: wwan: t7xx: fix NAPI completion and rx_stop ordering

Two fixes in t7xx_hif_dpmaif_rx.c.

Patch 1 completes the NAPI on the not-started early return in
t7xx_dpmaif_napi_rx_poll().

Patch 2 fixes the memory ordering between t7xx_dpmaif_rx_stop() and
t7xx_dpmaif_napi_rx_poll().

v7:
 - Drop v6 patches 1-3. They need rework based on the review and will be
   sent separately.
 - Patch 1 (v6 4/4): change Fixes: to 5545b7b9f294; remove the code
   comment.
 - Patch 2: new.

v6: https://lore.kernel.org/netdev/20261002014638.47981-1-tim770802@gmail.com/

v6 -> v7:
  - Patch 1 (was 3/4): drop the explicit quiesce added to
    t7xx_dpmaif_suspend() in v6 (interrupt mask reorder,
    cancel_work_sync() of the TX-done workers and of bat_release_work,
    hardware stop moved last). The review found it incomplete without
    synchronize_irq(), losing the UL-DONE unmask and able to deadlock
    runtime suspend. Also drop the freezer: the kthread now skips the
    push and waits on tx_wq when it finds the TX queue stopped after
    the runtime PM resume, which also covers a resume that does not
    restart the queues (modem exception, shutdown), where the freezer
    does not apply. Commit message rewritten around the mechanism
    visible in the captured soft lockup; subject changed accordingly.
  - Patch 2 (was 1/4): use pm_runtime_get_noresume() +
    pm_runtime_resume() at every site instead of per-site flags, which
    also covers t7xx_dpmaif_irq_rx_done()/t7xx_dpmaif_napi_rx_poll().
    State when -EACCES is reachable.
  - Patch 3 (new): t7xx_cldma_send_skb() returned -EACCES for a
    successful send, so the caller freed an skb that was already on
    the ring; same reference handling as patch 2.
  - Patch 4 (was 2/4): retry every second with the first failure of a
    streak logged, instead of every 20 ms; Reported-by/Closes for the
    field report on the v6 thread.
  - Patch 5 (was 4/4): Fixes: changed to 5545b7b9f294 ("net: wwan:
    t7xx: Add NAPI support"); code comment removed; user-visible
    impact added to the commit message.
  - Patch 6 (new): fix the memory ordering between
    t7xx_dpmaif_rx_stop() and t7xx_dpmaif_napi_rx_poll(), found by the
    v6 review, and keep the pending PIT release count of a poll that
    is in flight when the queue is stopped.
  - v6: https://lore.kernel.org/netdev/20261002014638.47981-1-tim770802@gmail.com/
v5 -> v6:
  - Drop the "freezer as a global quiesce" direction: remove every
    WQ_FREEZABLE annotation added in v4/v5. Marking the data-plane
    workqueues freezable can deadlock the suspend, because a
    flush_work()/cancel_work_sync() issued from a context the freezer
    does not freeze (the FSM kthread, or an unbind holding device_lock)
    blocks until thaw_workqueues(). (Reported on v5 review.)
  - Instead quiesce the DPMAIF data plane explicitly in the system
    suspend callback: mask interrupts, cancel_work_sync() the TX-done
    workers, call t7xx_dpmaif_rx_stop() to drain the in-flight NAPI RX
    poll (the freezer cannot park a softirq), then cancel
    bat_release_work and stop the hardware last.
  - Keep the PM freezer only for the lone TX push kthread, and use
    kthread_freezable_should_stop() instead of try_to_freeze().
  - Fold in the pre-existing fixes previously deferred to a separate
    series: the -EACCES runtime PM usage-count underflow (patch 1), the
    TX push kthread self-exit use-after-free (patch 2), and a NAPI that
    is never completed on the not-started RX poll early return (patch
    4). This revision is therefore a 4-patch series.
  - Do not touch t7xx_hif_cldma.c. Restrict the commit messages to the
    DPMAIF data path; the CLDMA control path uses a different mechanism
    and is called out as out of scope.
v4 -> v5:
  - Fix freeze deadlock in t7xx_do_tx_hw_push(): when the TX-done
    workqueue (WQ_FREEZABLE) is frozen first it stops draining the DRB
    ring; the kthread then loops indefinitely in the ring-full retry
    branch and never reaches try_to_freeze(), causing a freezer timeout
    and suspend abort. (Simon Horman)
  - Extend WQ_FREEZABLE to the BAT-release and CLDMA TX/RX workqueues.
    (Simon Horman) [reverted in v6, see above]
  - Note the -EACCES underflow and the stale kthread pointer as
    pre-existing issues to be addressed separately. [done in v6, patches 1-2]
v3 -> v4:
  - Drop the tx_pm_lock / state-snapshot approach entirely and use the PM
    freezer instead. The previous approach deadlocked through the runtime
    PM wait queue and opened ISR windows by writing dpmaif_ctrl->state in
    suspend/resume.
v2 -> v3: process fixes (Fixes tag, changelog placement).
v1 -> v2: save/restore pre-suspend state; wrap pm_runtime with a mutex.

Tim JH Chen (6):
  net: wwan: t7xx: fix TX push kthread soft lockup on system suspend
  net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES
  net: wwan: t7xx: fix skb double free when CLDMA send sees -EACCES
  net: wwan: t7xx: do not exit the TX push kthread on resume failure
  net: wwan: t7xx: complete NAPI on the not-started RX poll early return
  net: wwan: t7xx: fix memory ordering in t7xx_dpmaif_rx_stop()

 drivers/net/wwan/t7xx/t7xx_hif_cldma.c     | 12 +++++-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 35 ++++++++++-----
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 50 ++++++++++++++++++----
 3 files changed, 75 insertions(+), 22 deletions(-)

-- 
2.43.0

