Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629635;
	b=TxoA3zhWVuXzO9ILGfy3WVJ4SC60HOZeWltcGP0cqiRGBQV67nV1P2ux9LpCR1VszPC9
	 NFTxV/HsbZ1aSdi0pTU+z5BeRoFgcAyis/bw68sSE4xhP7BKM2b1he1zz2mdJ8HUalK9+
	 T17MfBhOL1anGyXmf6iILnTKfbBjyRHE6I+9mO26J8memfuSHwjb3HvkcrfFc2EtY0YHu
	 aNs032bymJhbLyQx5GVsbVFgnXDzLb8/b+oCq0iDA4LY3bwsW4D2ul90HqYkf1DUvsONt
	 wt1tjf0EewL3ycOTmtovEiAiNQPkr4TIBgW8mKZDUIHkf4iPq2PcQwvNnTZlsryfURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
	b=jdrsONEUD8IC2LSF1EHd52U8n1Kx04BM9nRZbxEI4OLUR9PxDj5taEN/mm9EEBtfstwV
	 yHMtk1Jr3UPF2K8NXETxxxsLbBikCWvcahQOqnuyEOcvygq1tLe6JBHnnkagga1ToJjif
	 JpJQhxV/rmSt/OsKR3L194KtNHtG3DFgWjctbHH+OvTRC8EMO6HzqTkkBY+8lToortiFo
	 OjJyz+pfzjSbgsXZ4dcgIrqk2QhNEP9gDqu99jc/1k3Q0r2ivH06YBg3iH0R4kAp1oLEn
	 inuWx6Gd44NFpyhoE9zmqBqnTJN255TA36wGonuYYc6uN51cwr73/fwomwY/XSD1XKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SfVmCV9F;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EAF606A683
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EAF606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SfVmCV9F
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso42148895ad.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629634; x=1796234434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
        b=SfVmCV9F0rl7r2j3HbGnH7/OjiYUzQJOKc+XKB/n6k3FykPthLZncNln1T3OY6xoyd
         ff9PyEj6Fu3UOntn16gDjK8SVAgP/fD7WQHr7wSRdFjDj8VvkW2BRcvOX8c56MiCD5N8
         9P9+TwqS/+qmttPFLq0Vh9EHELG1iiH3EIdgKauYbuIAGdp/RoxwWJshzFm2xynNKJS9
         hXvW43gcWQLAKIfWYb/b2beSRPJwr0GHfPs9rKFXRWTVPZdidmA8ygqRJxxTZdVMXpDp
         G1RDJDxHHtWPMiOZS5q3BxaFYyVke05aB3Vtk5z5Uiar5rHt+/0js66z0NbCSH0HCrjN
         zmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629634; x=1796234434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRmLynzK4ejOioysRL27Skg0kFnrLFhNOhmGT0Ouyxc=;
        b=HNdI6M6b+wRLegPWpnet2lRbMz6rpjJy+ikcRnHzkVG3gnSsAZLVUGexxlsNgXX3N4
         r76tC/rx5Gh/M4Ndm4RWRN34asxCCSkwFaYWJbN+B7dJnWKpNPyR4LoQm01SunruKr8Z
         axSms4/T5VKPVIrQFropMQD8kvqLVizMX55ra37PYtFNno5EglDUCQFxUwjTKbPpEAvC
         CGYiN+TSl0+DZx9xGjHZHa4pM4NLF807BuWnRWo0dWN8EFkQzYdBpyfyzsuT5YJ/ertb
         ItjJzTuztR2g+AGBzFKt2LAVa/6rXiqQ1e2LO7fsC8gWhzcwZ+gjQ6AGEVbeRNvqPqWa
         fUgg==
X-Gm-Message-State: APuU4Z8oEt0mMZXyo8LMba9flnZbu6mgLEoePS2+QVum5vNEm/OxD3cS
	aKY5MJfYZ3J9Aap4DGR21D5CO5S/4Z/POwfAdDE3KnWfSr3II/u4Fyb+HbiaNC4269Ur8UHcIpx
	WlK9h
X-Gm-Gg: AZFdTZe/TkcprikXKGQ3dQgde9HHC6G/ocBD3yWCY7mJLysT/L7+UvV9R3p3uVL0NS5
	x0zrbuDz54zDRdVmL3+M8JDXgwwEMY9T7lbqFzsAKuB7g0VI8ZAg8ZE8Xy9KDpFOnDW229jZV8y
	dVHUZg6YviAGUXcX2MpwX/cgSai9iNM9rh8mnGy4MJkiSrlxoU82XDLa5u0ZuT3mxrl9OrEk8Nq
	lBj0l/WSV/2/xhrqwWw2AkD40C5k1Owu7P4aqXA3SrZ2IDw90D4svyUjxtU+n9fPCty6bMbEdYJ
	00Qz2+gPW3XR0v3ZHFQ6CPx5kKrTVlySX05uVmhaR6QDM10ZaslwjS2iMI4rpv2g9YUAj+6wSKt
	D6ClWxoYOs3ThNUOLZo9IU6D94Z3debISYrmxPd/BvA6ejiDQWeQmluVY6ksG51bXVdR0Hk7G9C
	ShllvJ27pKQVgJu12e+vXIwz3YYNcCN3Ru+pzY1FlTlBsf6zgzAd/HiXHfWo8cZGWQX5iQ9/Nqj
	ffS3vhlwrcef2YSbKlabiTEe3DxKEBT2XxolDbFDu/x60YNwTeBHXE5uGhJf/iTLMOQ1KeOZWum
	QdzZuvcxwa/qwRqbmw/tVOdL/kVYSXTF69P7m784qks=
X-Received: by 2002:a17:902:e948:b0:2df:b510:cebb with SMTP id d9443c01a7336-2f03efa4028mr134937665ad.6.1795629633923;
        Wed, 25 Nov 2026 10:00:33 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b7be3347sm35552975ad.15.2026.11.25.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:33 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	mbloch@nvidia.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v3 4/5] net/mlx4: track whether a TX doorbell is pending
Date: Wed, 25 Nov 2026 10:00:17 -0800
Message-ID: <20261125180021.1804204-5-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125180021.1804204-1-joe@dama.to>
References: <20261125180021.1804204-1-joe@dama.to>
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

When the stack sets xmit_more, mlx4_en_xmit() skips the doorbell and
relies on a later call in the same batch to write it. Nothing records
that a doorbell is owed, so a path that ends the batch without writing
the doorbell leaves the WQEs posted before it unannounced to HW.

Add ring->doorbell_pending, set in mlx4_en_xmit() when the doorbell is
deferred, so such a path can flush the deferred doorbell.

Place the flag in the cache line dirtied by mlx4_en_xmit(), next to
prod. That line has no room left, so move tx_dropped, which is only
written when an skb is dropped, to the end of the struct among the
fields not used in the fast path.

Suggested-by: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
v3:
  - Set doorbell_pending once in mlx4_en_xmit from !send_doorbell so XDP_TX
    doesn't write it (Mark).
  - Dropped Daniel's Reviewed-by

v2:
  - doorbell_pending moved to the area of the struct marked as cache line
    used and dirtied in mlx4_en_xmit. In exchange, tx_dropped is moved
    among fields not written in the fast path. It is only written for
    drops and is read for stats.
  - Update the commit message.

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 2 ++
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 40dc4f6a7329..8a43c86f815c 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -193,6 +193,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
 	ring->prod = 0;
 	ring->cons = 0xffffffff;
 	ring->last_nr_txbb = 1;
+	ring->doorbell_pending = false;
 	memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
 	memset(ring->buf, 0, ring->buf_size);
 	ring->free_tx_desc = mlx4_en_free_tx_desc;
@@ -1098,6 +1099,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	send_doorbell = __netdev_tx_sent_queue(ring->tx_queue,
 					       tx_info->nr_bytes,
 					       netdev_xmit_more());
+	ring->doorbell_pending = !send_doorbell;
 
 	real_size = (real_size / 16) & 0x3f;
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
index aab97694f86b..c28d5213cccd 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -274,7 +274,7 @@ struct mlx4_en_tx_ring {
 
 	/* cache line used and dirtied in mlx4_en_xmit() */
 	u32			prod ____cacheline_aligned_in_smp;
-	unsigned int		tx_dropped;
+	bool			doorbell_pending;
 	unsigned long		bytes;
 	unsigned long		packets;
 	unsigned long		tx_csum;
@@ -311,6 +311,7 @@ struct mlx4_en_tx_ring {
 	enum mlx4_qp_state	sp_qp_state;
 	u16			sp_stride;
 	u16			sp_cqn;	/* index of port CQ associated with this ring */
+	unsigned int		tx_dropped;
 } ____cacheline_aligned_in_smp;
 
 struct mlx4_en_rx_desc {
-- 
2.53.1-Meta

