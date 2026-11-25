Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629632;
	b=YnFSWHzqf78q1qqjzaXIRangqk2QmcbexoX6LkrFYNww5amVkSuwfA1s8lYxD8ecL3ve
	 4TPfsZSjcznnInlWHkuQR1oN6fMAIL8sEwR7AiLi8a/+Rt7J6Y/jvlMctnq/+jQSNfgCp
	 WiJZ3vrSrT/aaGMVjxMvfarP4qV2vRaaswAVnSMZpw1thTLG6Lr1nalCMjJGMaji9ZByR
	 Zd+dsa3J5s7Z2EoOQqbzWuM73N0AOtXXHYkvi5bpvSR5S8pXc4bTKsrGa2ArNvlV1QB7q
	 Xf9drorQ7IY3Kqc7v1kV+E9QkDuet0Q+olQhINxsfggnjarpg3pIUJIbBdpvu5CzIPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
	b=ZYA8YBFpEpvgq+REFBSyBbuwUVYnd0Bmx8u8meFeLQlDV2tJu7Wyt6PrqNCtrut2U/th
	 yKS87W0NHsdiw+nVi64eBcKyvT5nQ2UG21aNl21CVrrc62BnlB8bK9sdL7x6rJPRRfI0P
	 gZhsuSi345m71uiJ4w1vfTCAXOcG5TZF5lcfGDtAT1FIHhTpcQ2H9t+R0Tn4/K2dPjzGW
	 jb+s+E1XaY7WBWM5zonrcn4JiNKoJRzPwIGahKOL47QMnl8HvqZxZVSSIWuIQkarFpsZA
	 4hrNdV9TmJj8UkE40gccprPoc2pBVTGpdKn7gvkRG4kDw3XQDM/T3L2A3/hsv+/BSEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hi9CsyCU;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830D606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9830D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hi9CsyCU
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2609375a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629632; x=1796234432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
        b=hi9CsyCUf/b/0VqLamSne6wspz7YbpnBm8Y1GiHDoxoAKD+Q+n68UBacSdCO/w40Lz
         QKAJPb7pNp57A4kkRCkKzFkyZ6DYXM06miTxqwk5MlAeNooOB9ZmH1D6lva6j3+XYsCI
         F1kWKTf/iOFRDShDnOINWpnaxlJh2ReLcgI7EqxyuR4W4cr/vzpIjibqysMZ04yz9Yw2
         SAPY0jcsa8SR0bJKRoNuvrUr/dSscDoCupnTwbuDO30RnopBYjgsmpSFdhYtsAEF7Y86
         lP8pxE/M9llm6kp9OOuA/TCba8nvEBxOZSSHQJSrmzxOGFhXSdC3tLsJGjW6nk5yS/KD
         NKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629632; x=1796234432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04zPH8pKbZgStm3VZ5cSIvhJbVCbZaL1fubS+I8F7Z8=;
        b=Dw3YPY8uyuLHmLDXwlEJ+HCmNx+8K+VwDOBqInt0zZ9jwhQwcziz6619Fu61MSRH4I
         LRA1NpzdHzXu5UZuuQvga2aXQ2SvRayTocZDqXkYrLA/qEJjg2yXqytZBJ04Lln9+tIj
         sZn0gkHpbhKQDuq237gS31dyAvtZIj1FqBzTSwjEHU0ppmlBDWs1QjIUOGn9srMfr6gF
         KEkiyxvX5c4i6+a13n8JUFq89JAEhr8qW2zRvWcXVjKsBiK8Tl6Cy/38kfs558RdFhVJ
         ghPPLR5ojyANlJzLMD7tdPkkcoiRar10QS6hJguSMQGdFuJGVVD1SM57BItPt8U2hyq5
         Tp9A==
X-Gm-Message-State: APuU4Z/wW3jYZxYkob7N392CgDkY/k717yQlN9+9gINFyJ95UjHGDaIR
	gAP+MjsJCw+9gQfODDVXUIdqWvQSOelQqcORBPHUwKSeMth/KeAUeWsWBNggpJ15/n2OmTuVuGs
	hlrZJ
X-Gm-Gg: AZFdTZe3Kn8nhKLQTmCvH5JCDv7vM9ItiCQi4cDnWww9lvHTlKbIn8tqkaOU2qSoezS
	VtLMIHD4UbHjM1SwFJrqIZ5uD/RRnmSmdfcoQoJkTkRZwFxhopO8jIZ+ZNhTGGgLOCizPbM638I
	YNSL9kqXfBtsawdP5bkep1zLy5axEJB3WpWmbFTINE3exWMBFr/Mrq6b5UGDBc7D3/OjjS9PlAM
	CuCCvf8UKaKhRPvNpLKIlxh4Rpr7dL+CTCgXXICOeX0IcG+CaW/nbv/OQaIzNGHL0+ybcoTojq9
	C8HyPf4OJqxsAeiVT1uIBUuEnhZ/3xoHNL2rfaPxOnFnhymhUBq7OFOfFZ4W2eihJrk+tW15JlO
	SbHjUYQMUheBJjrnqVaTjdsPvHGyBs7AH3Y31fdwtb1rkm5D0e4yGIxwj5HuprxSbMqLNwCaKjr
	69gsadNi26UttIED9vpjbG4WFMako8ZLpMrM/TdXMnRqBH83ol4tsuK87iBHUxPrmCoberRM3vC
	YqpISsqwCMAqS7jmiqpjM2CHXPgPLcdVE5QCdfnUmo58HMMJiJe18SvIT4nAouK0Ter5iZvBEen
	Ro1ztPXqjtn2CGZOSnzlNCw3sJo3CKg4hrMcYTo5j3o=
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr17223800a91.54.1795629631705;
        Wed, 25 Nov 2026 10:00:31 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm13401830a91.3.2026.11.25.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:31 -0800 (PST)
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
Subject: [PATCH net-next v3 3/5] net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
Date: Wed, 25 Nov 2026 10:00:16 -0800
Message-ID: <20261125180021.1804204-4-joe@dama.to>
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

Extract the code which copies the destination MAC into the WQE for
eSwitch loopback into a helper. This helper will be used by a follow-up
series implementing software USO, so USO packets between functions on
the same port are looped back too.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 1fb265a30a30..40dc4f6a7329 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -870,6 +870,23 @@ static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
 	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
 }
 
+static void mlx4_en_set_loopback_dmac(const struct mlx4_en_priv *priv,
+				      struct mlx4_en_tx_desc *tx_desc,
+				      const struct sk_buff *skb)
+{
+	struct ethhdr *ethh;
+
+	if (!(priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK))
+		return;
+
+	/* Copy dst mac address to wqe. This allows loopback in eSwitch,
+	 * so that VFs and PF can communicate with each other
+	 */
+	ethh = (struct ethhdr *)skb->data;
+	tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
+	tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -1007,16 +1024,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 		ring->tx_csum++;
 	}
 
-	if (priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK) {
-		struct ethhdr *ethh;
-
-		/* Copy dst mac address to wqe. This allows loopback in eSwitch,
-		 * so that VFs and PF can communicate with each other
-		 */
-		ethh = (struct ethhdr *)skb->data;
-		tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
-		tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
-	}
+	mlx4_en_set_loopback_dmac(priv, tx_desc, skb);
 
 	/* Handle LSO (TSO) packets */
 	if (lso_header_size) {
-- 
2.53.1-Meta

