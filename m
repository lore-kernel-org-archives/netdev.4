Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930848;
	b=zNc3p++YsT5sF/LQElY5hV22NagyJYj1v8nnd3rfC7BoKwYNkvI32bdpg/FzL0KAvUJr
	 yBl2qNHSqlyZ9FDGB+YaXOZyAEghJUfqv8YWB7PzFvAIyJcvPuxHnP25jtJHT/Ej8Y/2K
	 wabotY8sObjwxciigHAEyiFQ1dKNS9OnKn0wl/0auDRs/dLym/gcMMG0Dr9cnpGydCh7W
	 ConPebOqWC0wEVXYUeyNAZE92rtuH81Daaa5eHoM1KJzfZhHsLA+vYSQ7BtqHnLgcgGrB
	 eF1D8ZFQiBLm2ZpOTjOpM3bP87aMfjBq0CBbjEj5o8QsrxAlHiDUQGg9VYvTxWVgo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
	b=r6thiC4efeQ1+fXBMxXGkgYxcIV0UUruYF8ym6mlsPMX+5wWwBB0aT6gew1xnOVVrAkm
	 KHucImD1GYrFo2KC/JOVNEhwqoB/OhSbCr5+3zrl4sYkqhfEXplSfBn570/vtDaHumNec
	 R7EZcSlH7M6J/B7QMGhUmo73YabxNn3UBmX2wbx9r0vfAjMOp71ratIYdC6vNhsocwU46
	 wsONi1yKy0mKmcDwJnz2pGL2yawjhV+OrgvkQvgGuDK40NycZITVR6I91K8S+HtiEtdRV
	 r3wAigK6HwfIuPrTIXJQLvA0c8+ItVLq205fBkHJrPWEZFk2kXLEboFrv4QI8AiOSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NRWBHVqx;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815D606A333
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B815D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NRWBHVqx
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd824d492so6690805ad.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930847; x=1795535647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
        b=NRWBHVqxDtrZjDj810zSeDDkUYy70Fy2OixwQJx4w288utTEJ2lhTiDKh07xvr/vYH
         yLV+zf1kh5q1IU3c4fIARPakpLRFUzh2iQd3rORcU6P5ve41M64GrOuSBFnlvh3IFEps
         6gFDQtoVKzUGsm8jlQNb09VLw/T4v9qt2f/ZLa0sUFXnOtpTmoNrenLOep2ZDmF9rDqG
         lcZXqAjsuHWujLYdr9AeOIesJONIaXGLf4i7BPnL/bxAb0liHoWrPGM2CzH/41uqUF1j
         FO7xelRfvhlmqllATZKtUfxmq+/cLf3FGwj+8rvO2cv4UKUYzKPLRFzqvP3JZYZCL8MJ
         wu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930847; x=1795535647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
        b=yiaHAST9K1AlevVXRSQDkyZV4yr+jyeXSB+mBn2H5/B2YDkWrtb/QPyAWOfzsBRPMi
         8AOJOdo/d1hzEfXosYXjc7Hec3o0qVAbWqJ76/1BGeZ03iRBqBFa9Jau4XgZyjmKQ/rK
         98WdOfgdPDAdOK3lnRDWD2RmORzZIR4Omf/GOBbnso+gOrjV/ZN7nShQW5XyjzkfQXXn
         rri2ifrlEKrYc7ADO+Hlb/CPItgjo3ArrR4nJ2VEURuQnIT9Ip9qofeMqB2XB59R6Yh6
         Q3awRbRCkgAlbr4FygZfwMJ//8xIFV53TJHCuo8H6Z/DzEUzj+/bizOoU33R8U8dYaP5
         OhJg==
X-Gm-Message-State: APuU4Z+g5wrencgT1x5Oqs1mqSWOxJA6aoCPlDGPgwHNke+8q94QQbvn
	7hhw56m3re6Ob2tBLFiDQSzJvQF+eD/Nlt4zA87mDB0bBWyytOlxmU1orLgu7bN9KdHX8qyEeWf
	LlB2x
X-Gm-Gg: AZFdTZemUELAHtRb8Dq5oG9xpn6135swySBXzFvHesSqeVceMkteo4sDCOsgCJlbc3R
	iyTztfzBBivGV2GjYjyLZbPVJjnm2F+zFODhdQQEryWAv1QKuDslKzDup4RfuQ9vi6qJ3zX0yXH
	nduNOJUSqPAKZGhbZzADyyXD4r8QMvAt+elxfA4Zf9lJHlysbRmStSxjI+7xg4DmeffIABHgzGc
	YEUZKFIITqaboZcKXsJpgO/vUyV/aXrA6aziVsmcWwGhsz1BRHf1HCJtd5yUo6U4CYQqjCOKHZg
	kM4D1NQSMCYtDhuCCsoQH1f9FeLcReO5POR7vBC1Jt5EeCJr4bIWhgCdjhX3yZXTvlmyBxtaPUV
	4spvCmRDhYH1a5JkSCOZ/KOVjKmIB0l1q0dP3ft4Hegvd4XPbJzJCdu8WG3pKiJulAfi7aXFysN
	+rT500XSP6zi/lQbjGTrToDtbxRLW5NXuc3eUaBOkyT2vEb4vjwL/SO81c9qiFdhCLeRdoSFWRz
	7wdeADyC5GKAcnWL7EF37QEpPe8k6liwzwnP0zPDcM0Xua6Vu2/KfrCoFr2z5yVyktNyqDuxX0D
	lSZFEPS/hNcnNM7ERYTfPvKGRdcy0t3/7b13Vh57Kg==
X-Received: by 2002:a17:902:c406:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2ee0da7af82mr132965015ad.13.1794930847005;
        Tue, 17 Nov 2026 07:54:07 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a54576sm18946785ad.40.2026.11.17.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:06 -0800 (PST)
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
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v2 2/5] net/mlx4: factor csum flags into mlx4_en_csum_flags()
Date: Tue, 17 Nov 2026 07:53:47 -0800
Message-ID: <20261117155353.2250540-3-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261117155353.2250540-1-joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
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

Extract the code which converts skb csum fields to WQE fields into a
helper. This helper will be used by a follow-up series implementing
software USO, to reduce code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 00210dbae1c3..f6059b533eac 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -861,6 +861,16 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
+{
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+	if (skb->encapsulation)
+		return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -891,12 +901,12 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct mlx4_wqe_data_seg *data;
 	struct mlx4_en_tx_info *tx_info;
 	u32 __maybe_unused ring_cons;
+	__be32 op_own, csum_flags;
 	int tx_ind;
 	int nr_txbb;
 	int desc_size;
 	int real_size;
 	u32 index, bf_index;
-	__be32 op_own;
 	int lso_header_size;
 	void *fragptr = NULL;
 	bool bounce = false;
@@ -991,12 +1001,10 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Prepare ctrl segment apart opcode+ownership, which depends on
 	 * whether LSO is used */
 	tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
-	if (likely(skb->ip_summed == CHECKSUM_PARTIAL)) {
-		if (!skb->encapsulation)
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
-								 MLX4_WQE_CTRL_TCP_UDP_CSUM);
-		else
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	csum_flags = mlx4_en_csum_flags(skb);
+	if (csum_flags) {
+		tx_desc->ctrl.srcrb_flags |= csum_flags;
 		ring->tx_csum++;
 	}
 
-- 
2.53.1-Meta

