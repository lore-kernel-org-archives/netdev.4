Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629629;
	b=FZp2olmuhsDfzt5IATamjJU+6x3b0VySxD0J7uusfNNYoQU4K+PZPi3VFhWCCg2xrpMM
	 vIA33i307wfQsNMIA+zyN3NLvnkCsG3eZfMqC4gJDH3yxks0cyefLpwaGIMhKp4NgNvsD
	 9qbwDJQQj0SlBkAH7eBnL7mZFnBq9pWUC/XktBIa58mwZOpxdOxSf+4YZOR5ALtyc8Nad
	 O+A9RdsBTGJ6f1UOiyU7/lYnkNiSkLdNOsnDdZdwWI8TXNhlpuTByL/Pd5Slp6INUhq1W
	 HcgFaTd6nFN5mvsvG8SIcCSn+JBp4zwjdJBijBD8Bcj4R2TXLadfVZvwGI7cC9a2miA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
	b=k6+Xio2Z+3YNbysqj9Wo/DK/mOTk2s0Cw6LK9avXkqAWajaRAiS7De38DKACM1DyVGpz
	 qQzjPCA4gLrlbT7iEXrcNzMkP6SDnWN5r8nTUxVGMEjxTB9QQ7tnrjIL/mem+iSKqhYI2
	 ls/89azObQLJdUFQUy0WVhi6kHDm+Ms25CyrlIYV5HhJLnK1MJd4FwoJu15onNRJEnfez
	 185bVwH7Wv62CCm40xH6FSG9K5vG5+S69zZsAMrt6iv0KBgaU7+74gbFZ/vFt2Y+1vGVo
	 B68oxUnxHDDcAsZLB8/XL1WVYNUrVzmtz/LiTwqZ4eh5BiCQ/qjmcw7uwwx93kkmeew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BRdggDeG;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C02606A338
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C02606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BRdggDeG
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2587886a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629628; x=1796234428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
        b=BRdggDeGyPI3UAIylfVeo6IPUlWp5GXsBc9dN7tVIt1+q+QcKd/tXzoK1yOhY4oXUM
         QZe8g21+sEL17dtTwJGcXqTyR7QoruWYRHw76cSONFuZe+4vei8242A3W/hQ9FaEDqdi
         s/50x7AmIe+h/CQZ7Yl6BOhoBzNfbphR2P3en6MEovWrnMtd/aPK7Kx97iVjtfhkqGhE
         abBAvgWOWgyw0xA8ukIa4zKDtpB1B6l+IBt/gSs9hSGV19uuAqkrtlXtbEvC8zwQSViM
         0JSEIAl+7OBl273nXhhkgWtMWSEdvCqky/27/enl4E+lIO2Zpzm2VCnck2+xBiExoMUx
         RaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629628; x=1796234428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKT68XtEZZ8Qs2Socjc73mf40QmJchDPGMQ2JHov2P4=;
        b=L4heO4gF8uu0zzTyuEMgoHTYDv4PLwxIm+0WBSq5wIlN34sNZRSBEXAU4xsct2VTu6
         WhDRDJ67V77QA0YIipqazY+HoluUQIyrdKtohu1I5nI6pevbBoTx61288fJJ05UiH0N4
         eVCYB0ggsQxpFumPoZgfifE9b/7cpoCgyaKBKR8a9CzEP8J5YPgWZ4RrfFDm73mgp4Xq
         cFo2cZJqu8qzWDDQN4I7P02Dt14gNImLWumu/hsMI3Aq/FPygW4BJs3yBXDpvJ67UoCc
         KVz8vzL38YRorkvhniEOL4JfEott2add2tSXEeAR99RAy/ykiHsPLqcXoSabIvpBEQnu
         2sUg==
X-Gm-Message-State: APuU4Z+RNVx2PT6sk8SvoRMk72rbngpX9J0UVisPfkbn2uH9Y8QGAP4/
	jMDAm6vISSGl4C8FtRUOP71r97J43nMet9f6kle4hwwuLOqmK4B0rJFlPFrI5+cg1xXPeM6n11b
	Dz5Om
X-Gm-Gg: AZFdTZeI/AVOP4TgYuhctzFQorBSbk2DAXKA0X8MctZvpsYE6UBojyzBIQcUj9HgdLE
	PfLE3a6KFYjZvNYtBgNYZOQlRsOEJght1LbeJNNsyZPlgZbN9fWnVI3AxeHuIlinOSctBgmzDRv
	PLYXfjIjyFkCVBI8oyEZPpv3lKpNoUTcpKZXOIone7FFc6AHB3O6e3kO7ePK3oDSYb9r/y9ZmO7
	pNACD4tipnKyE4ectVQ/VxS5qP5WqfnR+j1M2861dGjohuDyaqWDevsuVZHlKy79TehMoES5zOt
	jpW+kCP19K/p+wpufA0y9GDWP3vLuRYvBsJDFeOXvSU5wzA67JOfnWiEphmvsixId8Ya5w7tQen
	PAKWruGYibS5ueDf3+q3ZKqVnHkvcOD0t9BqcehzZf0sJ5i2IlvlUlHTPfRy6k/AinbEdgNzjIn
	7IckE5KwMYcTGFQ6gAFPoNNt1bIhBGBBwJSTWS4QJLBNmmvQH4KAax27MxF2UtslzqVOed0vUO2
	nzZMMIbeLRdThMdBahHd+yc0CrT3wd0GXvplvyom/ZaGGV0iH8fyR0SGkuWy21vr4F78LAjKW1f
	WcrArHbH+ajwOW8TeLo7xRsSvN/t
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr18279550a91.49.1795629627796;
        Wed, 25 Nov 2026 10:00:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm31254202a91.16.2026.11.25.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:27 -0800 (PST)
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
Subject: [PATCH net-next v3 1/5] net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
Date: Wed, 25 Nov 2026 10:00:14 -0800
Message-ID: <20261125180021.1804204-2-joe@dama.to>
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

Extract the code which converts an skb VLAN tag into WQE fields into a
small helper. This helper will be used by a follow-up series implementing
software USO, to avoid code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 9865ccd8d6e9..29eda78b9977 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -860,6 +860,26 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
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
@@ -901,19 +921,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
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

