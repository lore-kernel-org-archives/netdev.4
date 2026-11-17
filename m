Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930845;
	b=2J3T/Gb2PQGjY9MegOo7+nG4szI6oswwETylQCrLL3EsDFXuRC1eusIJaTk+//WXwNUI
	 i1ZXfi2vyig7FeNsTYItNImlM7mzd8UoaQm69f3vIiqcAzyggZqlFaZ2zWRAwq/V/rRKz
	 gCeuBotl33Ch9P4AncE3rUlBKb9vIewUC+2hE2IUqQSbId5UTKRgwdISDnSIzDGa/y9cJ
	 89LwapBFRSnt0kInZM1OtTO7kBuzdLsA4wwTsDO6n2ZsR7zwFcXUbBNtoHFkKXMKiOw+R
	 0YXB97Sy8C4MmVLp+g9l24QerDHPDjJJPmdweLkpn4lwngMWZseq+4DPwI+Cf62nr4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
	b=MpsLqaZP5eN7As0S8EjsYMZal+bdXdilpwKvM5WEZfZKMMOTM1a86++3vrzumayd/68c
	 KeT1NbNOncacb8yu1/TUvFvUSk2q/HVrsZPFIh+jdxjGE8nXb934P/x3+W/eb0QVJWxmh
	 AqiT0dZHBHZY98cgdwTrlEI0RDQVgG8ZUbfLMHKiKQ3LoIllh4BGfSAYoFUhzuiZnlLRz
	 96V1ekS8CxSZwV3KsjnVb/64H5nSYuwcg2Pfb2XnQ1apU+wPKhlbohB1JLH+R9oM1x1et
	 XIYuw1UiqpUosnsOASezM+3R/NV7jdvzxWdhz1g69a8eQNj8+6Uln6KAS8zZUe93WSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZ7o7KUj;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE842606A335
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE842606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZ7o7KUj
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2180381b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930843; x=1795535643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
        b=RZ7o7KUjf0yZpJ26n1S6UQZJEgftOanDPlT8nMSKzF09QIbtPjcMxRV63WfoVWz6Sm
         4Va89bbhECf5i1H65fSRdPOcJ5HX3R1EGCtSHwddDziA6cpuaAJEFOyL06pwfP/AfZM8
         HFKoaT4IJDCvQ3zL1TDnIWLFPhTQNiiaH9iUAKonzlz12lSBawZRA5+iaSZWUg8znSz5
         7uiXJPtkWP+psEspwuR7f737YQ+jQDUOW+1WdJCequIqAx8kQc9zKQxmeBAyOXLK1NKQ
         VgOwaitK3jDrbpkQx+NN1NlVgA+kC+eX30uO7PfmdkdeSfSX3ypc82AKyZNO0miPFZjl
         10xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930843; x=1795535643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
        b=pRHEMHMPoEKESd+vQoiR/VToU4z4CKUQAIra/L1OrkOuWXBQNYR3DTg37QTJquYMqB
         lz8ebBe2eRF+jvtvEVpwgEhlL5gflpIpb98nw3IEUpd5Zp0pTWakp3prIZYoXKGMQWWi
         17i0dsI+WvIIjBCuD/+/xkYWBbgNlgD6w35qsb3zMymMghCNAUYbdhUEhtPs5h9EQ7YQ
         VUfklGq1TIoO59jGMQZuq0e837nyT3qpbBrqf25KryTYz1cJRgX35Dt5saApZ9+2aYai
         Tc1B3I/SuFKggLOoDawYyr+SaqS0T1VTD/iG7Ybi+zxsMfqgngYVWFhCvu+7thzLHSy4
         ky6A==
X-Gm-Message-State: APuU4Z/5TvbdTDBuYUxdXJf/gQAz9dxRPgtTbPsb5nAo59cy6eN0VI0g
	XiBDN5IfbK5L9RGDdhpP//7SO6nqz2KplMVJFvgTgrcyaKfatkU0GqhB6BYEKnbEoulxA3fI5hX
	n/cXz
X-Gm-Gg: AYBFou1lCipvz86attr4OZh4hNnuFWAD2LF6ytBgnsd16hapkL+aJuc5Vs54/mPxJPL
	ZjzdfOumIOZcmP2bow2eNk7BbwXLzBkyc+HkzBJcvRgvpt+z48cYFc1ILI8+XWEc7Annn3G633S
	yUbyOo+VyQwzue2kBLfxXHNfaOU8qetmK1Y1ywIBCZz2N5nfdeB7pHiLf7MTSMkd74AXU5k/jbW
	fa2pK2oDYA6QIY0ZbfSTSO9uouOYuVECgt2nkm3PxwcDzGhqoZDL4xgz4dcjP5/His2LztMco1/
	aGplYL173eTL8p7l1Sh2obSNoPBOftbATS8AWowBKezvunT/0YSnmCcykhF/538ik50d8TMjOBo
	zY5rquhJP+7zeXuoRbG13fGC9Y6VRfusOFbBxpvg/5Iu5TJnJ86op8QhKv5GjQruu8wzyQL9raT
	NNZvo6sKv7XjzpPixWc0jaYiqsiwhwMPDdzER1C99HBKFF8W/7bE8tZyqObISkWrZwyZh186I75
	BVAOYmEumyoo7hMTgPvzn0qzQ5FNOdlkiVGfFiKq3myTSvd5UYbllWkRbZH1flkFAP/SJm8P0Yi
	Q/P93t2wSXPRSEckQ0n5S0XBoy7XnDhAh2lwRHEmI8A=
X-Received: by 2002:a05:6a00:420c:b0:8b6:400d:7cc8 with SMTP id d2e1a72fcca58-8beb6298a6cmr11857476b3a.30.1794930843313;
        Tue, 17 Nov 2026 07:54:03 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8114sm5476595b3a.12.2026.11.17.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:02 -0800 (PST)
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
Subject: [PATCH net-next v2 1/5] net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
Date: Tue, 17 Nov 2026 07:53:46 -0800
Message-ID: <20261117155353.2250540-2-joe@dama.to>
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

Extract the code which converts an skb VLAN tag into WQE fields into a
small helper. This helper will be used by a follow-up series implementing
software USO, to avoid code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index c5d564e5a581..00210dbae1c3 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -861,6 +861,26 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
+			      union mlx4_wqe_qpn_vlan *qpn_vlan)
+{
+	u16 vlan_proto;
+
+	if (!skb_vlan_tag_present(skb))
+		return false;
+
+	qpn_vlan->vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
+	vlan_proto = be16_to_cpu(skb->vlan_proto);
+	if (vlan_proto == ETH_P_8021AD)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
+	else if (vlan_proto == ETH_P_8021Q)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
+	else
+		qpn_vlan->ins_vlan = 0;
+
+	return true;
+}
+
 netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
@@ -902,19 +922,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	nr_txbb = desc_size >> LOG_TXBB_SIZE;
 
 	bf_ok = ring->bf_enabled;
-	if (skb_vlan_tag_present(skb)) {
-		u16 vlan_proto;
-
-		qpn_vlan.vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
-		vlan_proto = be16_to_cpu(skb->vlan_proto);
-		if (vlan_proto == ETH_P_8021AD)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
-		else if (vlan_proto == ETH_P_8021Q)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
-		else
-			qpn_vlan.ins_vlan = 0;
+	if (mlx4_en_prep_vlan(skb, &qpn_vlan))
 		bf_ok = false;
-	}
 
 	netdev_txq_bql_enqueue_prefetchw(ring->tx_queue);
 
-- 
2.53.1-Meta

