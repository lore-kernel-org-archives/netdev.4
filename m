Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139803;
	b=vmdBWtm51qeyMEqJRDl674mz8hZmVm9obzzWrTzTQyWao5d4ExsEVYV6LtBqwTqTh2do
	 wdm+nhVueZHPVlGmnU//geqNySxSkHzzYuvIcELHb61dumq26H8aY2by6K+uAYxAc3Yq6
	 Os21nVBqJMNuX0AUlNN9wRogRTYVQrBSLfZEOka9Kxo8DaBWPOuqXgIcOCv6PcMTyj8/v
	 YvC9lZNSO4pYn2jSUFx8QV0Kaqn77hoIiuUligYz4Kc5t3orfm50tdl96+talDo56jtxT
	 uIJK6w7i72hxUZtOrHhcVIYZL0Tl5jF4+1eUsvyGfipzGErcMNx970GaJABChdcrkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
	b=qQw6dxGoo3ZM9UptzVsuMGLsb040fdt3axGM+zyBN2/ryVWOar8AY+nweh0vxV2ZI037
	 +djCh60vVysHYTof7m+GpU/IE93xlOuaGrhYZUAEDgujROEqzq2d1cQrhoaOfjEKhWlbX
	 aim1jWYeMKh1Rg3okq4lvmvUOOXj65w7HFvS153hLF4HQxDdOs8qt4poVyuR8AdYlbNOT
	 M4kGqdyUMG5UHyzY+rbwID6x+lPjkNlnx7PRsN/8+qTXNFHVdKNirKkBX9BQuEF/8tO2w
	 HTOruNHVVpKmRNKfjk3Ejly9Nzyg1L7o1XZYrdxf2/6/WSi+rzDnXqBnw6/WF3j/KGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwMRdYeq;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D1606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwMRdYeq
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so276178a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139802; x=1795744602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
        b=JwMRdYeqg4g+oaIIij7D+9eeI8UsfeB8XrsqYWn/lpYVs6dFxvCKKiBUqsSKv09qu0
         zDUYGeOoEynr7CSzJg0Q2M6SK4rcdV2ylx79mCwkRjmETbPZnkM6tfPYjZ+HeFXUONQo
         mHbcpttNUaBJUGa1P/4tyDVS/QfJQkoVnLu0EkqdVDTf2x6GqtI5h/HGN+ErQUPMp/pS
         xQm6ykT3RisuBi//q6huBXbiCN0rfzW5vCsQJVh9h4prT+J5D0DxSvH24VlMJUsX2Y1c
         7i5nsYletYcQ6Byf282j7HbBE4VdgMO9T5an6TTTC1WQ/hTl2JBsMSH/T2upYZYMPhWZ
         sjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139802; x=1795744602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
        b=sixay1kRKcv8w6AyWWhmJIigPeb4Dk/qc9+2j5d0RpI8GZYvzoi3XnSvlTkeS9BO6x
         OWcbCOS6Tj4OwuXKQb933d//X26sbGbC+xNbTv3z/AXosugn3faaiE8jTwVyjO5Ydtyy
         wWrGr800F5tRYH9cHGcd26I1TdK+qGrgvd53wLVk1PX03dNkdRr95SOFj+VI3GY62Szd
         VCgaGiKhPXy7418jEeCzzJrM3pa0YWfZ/09ghyV5jbz5ctzR7u6Xz2rogJO/wTw0U9HD
         /hAk+/1jYi/OJkd2ZYL9vwzPjk0mHI2aHdPRHBhQeMWiM1cI4pfcAZCpMQ3o3PZhiQcw
         DlNw==
X-Gm-Message-State: APuU4Z9rzwGVDUoOsFKUWSoQUTSF0Vh4f1hpTRxCtD4QjHXncS/slg4Y
	CFh+DdMCqzec9sH+VYM88VXyqCmA8ZWCt1smGN2GwacyYkX8+U1ddhv+kJCMWWkG
X-Gm-Gg: AZFdTZdCXep4S69WxuOsNilkPBGVnAi0QgddpNm55WYy9kewZXxjcJBjKRYUxTinTEG
	Nl0Wf1lSnOS1fpDGrNpb8dz7gGGJnBIGWmo0KsrIynWyQcpmwhdU0B1TyRGUcbFd4JjzkVVtEcH
	fOZ9AoxoyqnEwL/NeobWIqliLSItklA7mjitighAMbAZ+N23ubo8bGHawZB7lDy1MIHnQl0Cl5x
	mo3lZ2Xii5u8YbwlPr0l641M2TTNwffHolIEs8QzlRdKrTvfoOj+mESS9g9Byeb/l/XgNcqt0px
	rReSJktp6xddFGAXHw2pnN24DO87IaGgf8Un68gytnX2Xb4KVecna7ev4dZmswSEF6l6TuDXSkR
	SwiBGK2C6LuuwB518IxV4Ieqmwf+Kbu5BViu3COtcoRt0QjtEbABJL6ho65ZKwCbYrlejPlSwsq
	c416D0z5E4X/JYlESjoAk16LEc1QkEZ3f2KeQmcKop5VlmYEZuk64MJ0tNushYJ4baAH1Fy5ZX1
	I0Ej2YoO3c/qewgkQRvah5HqQWi5RKRPLgJW42V5JDSZsjAY/Et3ZyJ/L4ygAZtlX+GKzN7olxz
	x+YIKniulPNKvznAQry9fuAbhr94+QxgQ6fvYbpYgUuw/YfaNvU=
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr1237682a91.22.1795139802471;
        Thu, 19 Nov 2026 17:56:42 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:42 -0800 (PST)
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
Subject: [PATCH net v7 6/6] net: wwan: t7xx: fix memory ordering in t7xx_dpmaif_rx_stop()
Date: Fri, 20 Nov 2026 09:55:56 +0800
Message-ID: <20261120015556.131547-7-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

t7xx_dpmaif_napi_rx_poll() sets rx_processing, issues smp_mb(), then
reads que_started. t7xx_dpmaif_rx_stop() reads rx_processing first and
clears que_started afterwards. With this order the stop can read
rx_processing == 0 while a new poll reads que_started == true, and the
poll runs after t7xx_dpmaif_rx_stop() returns.

Clear que_started before waiting for rx_processing, so the two sides use
the same store, smp_mb(), load order. Use WRITE_ONCE()/READ_ONCE() on
the two accesses that form this handshake; the other accesses of
que_started are on the same side of the barrier or on paths that
t7xx_dpmaif_rx_stop() serialises through rx_processing.

With the new order a poll that is already past its que_started check
when the queue is stopped finishes its pass with que_started == false,
which used to be rare (only after the stop timed out). In that state
t7xx_dpmaifq_release_pit_entry() returned 0 without touching the
hardware and the caller zeroed pit_remain_release_cnt, so the entries
consumed by that pass would never be released to the hardware. Move
the check to t7xx_dpmaif_pit_release_and_add() and keep the pending
count, so the entries are released by the first poll after the queue
is restarted. The hardware is still up during that pass because
t7xx_dpmaif_rx_stop() waits for it before the hardware is stopped.

Fixes: d642b012df70 ("net: wwan: t7xx: Add data path interface")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index a7d6289415b1..d70ef315f5f5 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -240,9 +240,6 @@ static int t7xx_dpmaifq_release_pit_entry(struct dpmaif_rx_queue *rxq,
 	unsigned int old_rel_idx, new_rel_idx, hw_wr_idx;
 	int ret;
 
-	if (!rxq->que_started)
-		return 0;
-
 	if (rel_entry_num >= rxq->pit_size_cnt) {
 		dev_err(rxq->dpmaif_ctrl->dev, "Invalid PIT release index\n");
 		return -EINVAL;
@@ -565,6 +562,14 @@ static int t7xx_dpmaif_pit_release_and_add(struct dpmaif_rx_queue *rxq)
 	if (rxq->pit_remain_release_cnt < DPMAIF_PIT_CNT_THRESHOLD)
 		return 0;
 
+	/* The queue is stopped: keep the count, the entries are released by
+	 * the first poll after the queue has been restarted.
+	 * t7xx_dpmaif_rx_stop() waits for this poll before the hardware is
+	 * stopped.
+	 */
+	if (!READ_ONCE(rxq->que_started))
+		return 0;
+
 	ret = t7xx_dpmaifq_release_pit_entry(rxq, rxq->pit_remain_release_cnt);
 	if (ret)
 		return ret;
@@ -844,7 +849,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 	/* Ensure rx_processing is changed to 1 before actually begin RX flow */
 	smp_mb();
 
-	if (!rxq->que_started) {
+	if (!READ_ONCE(rxq->que_started)) {
 		atomic_set(&rxq->rx_processing, 0);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		dev_err(rxq->dpmaif_ctrl->dev, "Work RXQ: %d has not been started\n", rxq->index);
@@ -1127,14 +1132,16 @@ void t7xx_dpmaif_rx_stop(struct dpmaif_ctrl *dpmaif_ctrl)
 		struct dpmaif_rx_queue *rxq = &dpmaif_ctrl->rxq[i];
 		int timeout, value;
 
+		WRITE_ONCE(rxq->que_started, false);
+		/* Order the que_started store before the rx_processing load.
+		 * Pairs with the smp_mb() in t7xx_dpmaif_napi_rx_poll().
+		 */
+		smp_mb();
+
 		timeout = readx_poll_timeout_atomic(atomic_read, &rxq->rx_processing, value,
 						    !value, 0, DPMAIF_CHECK_INIT_TIMEOUT_US);
 		if (timeout)
 			dev_err(dpmaif_ctrl->dev, "Stop RX SW failed\n");
-
-		/* Ensure RX processing has stopped before we set rxq->que_started to false */
-		smp_mb();
-		rxq->que_started = false;
 	}
 }
 
-- 
2.43.0

