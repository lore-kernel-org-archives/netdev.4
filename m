Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231942;
	b=3vm1Jo930GYXH5n72nVCxTVwfOu7+uDIZ7j2DZOElfLfE8cG0bptJoGCSI8bQPv2afQc
	 dwp8eioKqN4NT3ve4lYJxecm9Jm0N7KoJJVrOlJAZcYMxQXvr6aclQvcaeOWYYvYUE1lA
	 5Z30n6hTXZzEpswwa+O9hjveLaUKY9CEd2n5M4mu65xVCMall9XIMPzgH8XK6Gd4OdFJH
	 BZI6gy+T9LoL1HGT1u5wzWqr2AU8roEthaF8q6NGDeNy2hJhiLUhcA/CdnYcA4g/AtQXV
	 JULyPYEKeD7LCvQI5EPesYEHJK+6AZuVMf7ySI733xmqrIMRMBaOy9wE9+bKFEyoPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AdiV1IN31qOPxt/4wouWs/62I2WZ71OUdDYOuEkt/gE=;
	b=Jf/xUDzvMvbgBzBwMlxUIyLjzjLXqnpZ/4eXek/KUQ5fWki4+uPwusJnNuFEjqFVrD8V
	 fS6LyzxDQjyejKs25C/kwSGyCMEFFI1O2r3JIpfd2Nq81fLeh8WMjXRSsWZPQM6y30nlI
	 026+pQBJIj1jnQBiveqqkxZQ7fMegVU0K0OmUMRvlZIReXuYueQKQMfOv49NMxz/2F8XB
	 /oGT9KHoMicHkBg7Fwab9Qur9Air+Ec+05uW6M7Rkyl+LqwDmp6Y5D/fQUjXDnvXP/EVz
	 8fckLts+AyomChgzGmcmw/lvLPDlxfhdiY70jjeiKQSIipyk1LCjLe73/Fft2FQS9uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyvczunm;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55C606A69B
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A55C606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyvczunm
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso892069a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231939; x=1795836739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdiV1IN31qOPxt/4wouWs/62I2WZ71OUdDYOuEkt/gE=;
        b=zyvczunmNE1cZbXq/Dg4cBzxEKbCWfqQDd8zGwkL+6uHamnhCA3FybpTqdhu3Mn4mW
         k58KOlQnMz2hwW6wB/69dAf0wOO2u5ayCg3eWUe0JgspznkxT0laqFvSZkiYqRj5+jCu
         0oZi4xQFJLgqAMgIroo0jC1ahr+22Wz0xnfSaeHwGanW3istIDM/AF/6yxvIbJpDC05U
         +hYMgH3gN+AszihszOe7YPz0KUgjTwPfcxbq5FJznBfnprArY2BK+YaI3xxqZazYo2Au
         Roy9AZ4dVTM7Dd1IxUvXvVGUdq+UHGtHE08ebO9efA06X6pA2ulixK+XZDPt7U2OiuZB
         2bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231939; x=1795836739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdiV1IN31qOPxt/4wouWs/62I2WZ71OUdDYOuEkt/gE=;
        b=XPFOuhNkz/IJrGonkRridU0J7VLEcoXF83CmuyXAPFVfht2rlpTgE+LrxT4X1+OmQA
         WWuLpfSs9MrXYo83lqRlhS6IIZzMauZ7ZnbwokHy0AkC5hlHFS65C2eBvzcmc7BI1h2D
         sCU1b/DhYIrKT2uyl5XGzr9EBKw/LN54HKwE5SCXAMMGTQ3D2oXIa1bxYb37ynpu3Qor
         JE3L0DCsjXeWJvK/q+wdo9X3tlzHW16o4doLYTXR0IsGzgwmx9Bjf3QwhQXC8B7p/XuC
         gYPJl2GgZ3B1uC/9HKreLNAxH5U8ydifdz6/gutN5PvGIqdzP8qwfh4bxerJU1rfFVgI
         +xHQ==
X-Forwarded-Encrypted: i=1; AL+hErHUXI8nIpiMUl8vROrFGhX2jn8Pkjfv5akRswGIV3g1YC/aGctj3OYajTIIpU/99t+boxOw4rE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n8Cy3JgeiO4bOiAmKtdUBjoLGmKPFfFuP74f+aJuWWY/iNAeK
	60xippJ+MAUMuO/B3BXdvpuui8sfilN+K4YoLkhp4VdzTKmOyPtdeOK1
X-Gm-Gg: AZFdTZepUsYENvNqOcNJ5Xkrd1t+f5/DCJliRsxi3OIOshtOM43oDTD36egOzwv3weH
	6BUlv2fP4WFJLbaO9TQ9KN/umPbryx5HyCRT+eKB6JLUvxrBwa7IuIdPoaGyjnzNWSt9W22LLTe
	5yX1xsFWCiO3v2rBFT4212e/ePE3ZQf7izm7W2JOJbNJxzE7RZLtYltYyXQHhQ0waxd+WiZOEmf
	t0X03Dw7MkcXf4W0FLhozSvkzxrQurvhNGNctlrRroHA/1VAhMSIuEVo8bVdZVNtbStxEE1DVU7
	7XnQhU/1r0HV8NwIBXjwB/nCIHzbZWBZeT87RUCeRlq25mqBJm1s+QCXflnTHKRV7q2auEEBhFg
	AXlLxDGWPADTDNv3Xt0P6V2kshN5UzG4lCx0NFoIfY7qTFAPOqOa/fRpSUnm/RXq3bGIAhJTw7r
	zTmFotEzI3bsy8EicYVLMzFo0PF2bDl2tJHL//MGg3W1epHxjnSJPS6SC6VlFNsyDSAJ1fObj8K
	YVNLLcgOk+wZAQpUHS7y0jozHPWNtTsA7TC/KlncLWs40oowzux2OuL5zURr5On+DNY/Sv6SeXm
	KAl58T46isAj6ow+/8h3FDl2JqDqSR3MPiTBvFY3R4m+lYZyKY4dru2Zrw==
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr4078528a91.18.1795231939418;
        Fri, 20 Nov 2026 19:32:19 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm6634000a91.13.2026.11.20.19.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:19 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 1/4] eth: fbnic: restart queues in place when fbnic_queue_stop() fails
Date: Fri, 20 Nov 2026 19:32:12 -0800
Message-ID: <20261121033215.1020506-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

If the idle wait in fbnic_queue_stop() times out, the vector is
restarted, which resets head/tail to 0. NAPI then re-walks stale
completions and dereferences Tx buffers that were already freed.

We could flush the rings before restarting, but that risks in-flight DMA
and completions landing in rings if the HW truly does not stop.

Instead, set the enable bits back without resetting anything, so the HW
resumes from where it stopped.

This bug was found by AI and reproduced on HW.

This is not something we expect to hit in production, but we injected
idle failures with a test patch to verify the behavior if it ever
happened. Devmem was bound to rxq 5 under traffic, with a strict IOMMU:
  HW is idled, but waiting for queues to idle fails:
    before: BUG: kernel NULL pointer dereference, address: 000000000000002e
            RIP: 0010:fbnic_clean_twq0+0xa8/0x290
    after:  bind fails with ETIMEDOUT, rxq 5 keeps receiving (5/5)
  HW never stops (rings left enabled, and wait skipped):
    flush:  AMD-Vi: Event logged [IO_PAGE_FAULT ... flags=0x0020] (4/4)
    after:  no IOMMU faults, rxq 5 keeps receiving (10/10)
25/25 injected runs clean after, across Rx and Tx traffic and
non-combined channels.

Fixes: da43127a8edc ("eth: fbnic: support queue ops / zero-copy Rx")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 50 ++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 381831b7e108..c0fe89425430 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2326,6 +2326,50 @@ fbnic_nv_disable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)
 	fbnic_wrfl(fbn->fbd);
 }
 
+static void fbnic_reenable_twq(struct fbnic_ring *twq, u32 csr)
+{
+	u32 twq_ctl;
+
+	if (!twq->size_mask)
+		return;
+
+	twq_ctl = fbnic_ring_rd32(twq, csr);
+	fbnic_ring_wr32(twq, csr, twq_ctl | FBNIC_QUEUE_TWQ_CTL_ENABLE);
+}
+
+static void
+fbnic_nv_reenable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)
+{
+	int j, t;
+
+	for (t = 0; t < nv->txt_count; t++) {
+		struct fbnic_q_triad *qt = &nv->qt[t];
+
+		if (qt->cmpl.size_mask) {
+			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TIM_MASK, 0);
+			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TCQ_CTL,
+					FBNIC_QUEUE_TCQ_CTL_ENABLE);
+		}
+		fbnic_reenable_twq(&qt->sub1, FBNIC_QUEUE_TWQ1_CTL);
+		fbnic_reenable_twq(&qt->sub0, FBNIC_QUEUE_TWQ0_CTL);
+	}
+
+	for (j = 0; j < nv->rxt_count; j++, t++) {
+		struct fbnic_q_triad *qt = &nv->qt[t];
+		u32 bdq_ctl;
+
+		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RIM_MASK, 0);
+		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RCQ_CTL,
+				FBNIC_QUEUE_RCQ_CTL_ENABLE);
+
+		bdq_ctl = fbnic_ring_rd32(&qt->sub0, FBNIC_QUEUE_BDQ_CTL);
+		fbnic_ring_wr32(&qt->sub0, FBNIC_QUEUE_BDQ_CTL,
+				bdq_ctl | FBNIC_QUEUE_BDQ_CTL_ENABLE);
+	}
+
+	fbnic_wrfl(fbn->fbd);
+}
+
 void fbnic_dbg_down(struct fbnic_net *fbn)
 {
 	int i;
@@ -3092,9 +3136,6 @@ static void __fbnic_nv_restart(struct fbnic_net *fbn,
 	struct fbnic_dev *fbd = fbn->fbd;
 	int i;
 
-	fbnic_nv_enable(fbn, nv);
-	fbnic_nv_fill(nv);
-
 	napi_enable_locked(&nv->napi);
 	fbnic_nv_irq_enable(nv);
 	fbnic_wr32(fbd, FBNIC_INTR_SET(nv->v_idx / 32), BIT(nv->v_idx % 32));
@@ -3125,6 +3166,8 @@ static int fbnic_queue_start(struct net_device *dev,
 
 	memcpy(real, qmem, sizeof(*real));
 
+	fbnic_nv_enable(fbn, nv);
+	fbnic_nv_fill(nv);
 	__fbnic_nv_restart(fbn, nv);
 
 	return 0;
@@ -3170,6 +3213,7 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
 	return 0;
 
 err_restart:
+	fbnic_nv_reenable(fbn, nv);
 	__fbnic_nv_restart(fbn, nv);
 	return err;
 }
-- 
2.52.1

