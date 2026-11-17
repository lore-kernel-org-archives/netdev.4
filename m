Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930851;
	b=PMboImtfsTXS7HB71vi1+EBh4yu/1S9MG14cPkSyW1eN7ZAn+PnedARdk2Z/bwR78w+I
	 3Q692eA5ElEyxmeBwz6tXfmKSjepEQ8b923efJ+csdxcrci89+uqi9OnZrLvk6nY+GgZU
	 Dca27W4/BPI0hqKs2/Jk5/1gT4ySQfLu2c47hvTmcn0X8DIUerhO16vZ0tHAV2PFNLpf1
	 cavDSNU40YHUfysLAw+V71wdP/r4MJqyBSDojBer5/NrIQgN1bP8zarVdaDg1sY3B3fFn
	 PvjpVgihXdoRZqiU7ICwFlzTX/gHrVWud+ykwBfIf07x+X6QQupw85urR8lB0lZOGOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
	b=PDbqKMezlgY9gH2yOFUsoTF5cglfFGx0KQAG67PFsFd9iPNKaNPOWjejmiQFbYOwZ6CK
	 5qHV7jWf/lstKO9vPnJL/D2p62p9xmhJyHnWWyYTZBFDUXEs26k+GP6V8sSegBTjHBmg8
	 0VYWXb2W9MZd5WxDLvEo+xxaTQXMVY/HpZDNVDFhYWtm470VkoTyMVOj2Py/QSpi7dRtn
	 OAM/9vqTb42h9nK8zaetrsq1CLihP2kQy7shuv4O8KNNBB6DKB17xkYKoQE2Qpdl6SOI9
	 g0/nDz2DILakxKE8KaFMCxuMvL8CbskncKsbio1Xft/+lqz70zH8i0lIHTPkVlx3IjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DfAihYYr;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE216606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE216606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DfAihYYr
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so4006706a91.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930850; x=1795535650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
        b=DfAihYYr1Hx/FqwMJ++uuMbrUTmpfc6KPCxYCi5wOzpVdspIXPzcsosvZhU0XxEMIw
         B6vrhiqXTMvQJGlj6nOouEJ/kGGHkeA5MQlWJgcfkEuYmjzzU1uWP5+bY0IV3UeS47Oe
         vWgkcTtP/nZv6teke8OAAhraDps/KlgCFXg3qdQ6S+Zj8RIc12tfM7MKwg3BjeiDInsW
         18kYOWONHh4XfPq1KLoueRY+UjKz3S8Z9En81+9Ah95ePbG8OTZCC4ZkwQZlwsz4YLbS
         9a3mkMmXCAyrR3ieqEQ+A5K3hf5DHfRoOuEOf9bzYOQupWXTtEu9u1m0hT1cnkuiIHol
         Tnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930850; x=1795535650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
        b=DU0wCaJ3lJHI8MZnyk+AbARdco/TW+QArxshk9j9w2PQpM4r4cEZuAyffQxSiCb1km
         gyfS2+VtStjB676KmnUCOWchSBG8F+VExU+FHJiubSu80OQZ64tz/AYcBo5P6w8mE+mr
         wVpjY5cdZ7UTmlbB+aEzQDq6Kzn2o8b1QLF/msMQTEL0URa2syXBYcblEiSyHXarM7gx
         voLav2QJYbRb6PtdhYl5RJOiCzvtRFgzxp8fOpzdtH8Pa8RUGoeDadrPGn/pEJMhKAOR
         h7FKr3+5+8wzOTCgwxIVLmdQn8FwoWU4RmGOhHgC+5N2Ri14V5FdOunTmaXGdkg3BLWf
         nGRg==
X-Gm-Message-State: APuU4Z8Nwm3y4WKnVxhpg5OAVmKuGj/ZW8EgnUwt3f264HHjWQ4SU8/H
	A+ph/TLcIx/VXY2Zi6iFMhjYRqpw2PKN9JbvYcDVLDtEpakZd7aYwYgLmZJEjWrV4A0Lu3omVCs
	VlzC4
X-Gm-Gg: AZFdTZckG4b4vLMnClU+C2iG5GnWxOHlIO+xWqxoOD5Oznn6uJDWQYQBTj7bZ1mzIBy
	ZmTaUqYwhOuuj8ZhbMIFuDlUqgNcgj5RyAi6lo0XGIXTdQMc7rH4fBdp0Ywc63BUeZqU5H0DR+A
	GvDExI9k06Da8O6aLT8FFtEqvtYO70XP363l6UiIjBOkAP4wa3TsEPVSGBSXuA46FIOvEujCiGZ
	+0pEFED8f5+2O4tpgDtyx8sBKZQuaHr5oNGcRS0WjtGpAnHeRtAbGxk2k9fIDF7crmCbLF8kVVs
	4bdPCP1aTcdPP15zm3qAX1yePTIjfoDl9abBdXnAQCP8g/DFzAUai0ud1ukUfzN3ye7RjeN1sL9
	Ek/0A8wn6hw6GqqBJ8+UqZjtSKlw/xS3dUngEBKORqy0nwF10NcxGy5wm+MZi16uWNxE38/iIch
	Rs98Ys6XlMSuc4xpyskw1mU+ukryzrqBioJrSS92BEDZL42o6PJXz5N7L+Jgfxk9LqLKl/5Zr9B
	X+Cctpj2uphYkiXkuYGBUcBs+2xrufDDBpW84eic7QUJKhfKFbIZJJ7nk7+w/3Js8qvYFZO/zwV
	4iTA12Ja2KFdyRFr2TxRQnltJmJT2fAORDrf7d0uVtLF
X-Received: by 2002:a17:90b:3c4e:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b1b0b6672bmr13618434a91.21.1794930849960;
        Tue, 17 Nov 2026 07:54:09 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd063e8sm4624009a91.8.2026.11.17.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:09 -0800 (PST)
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
Subject: [PATCH net-next v2 3/5] net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
Date: Tue, 17 Nov 2026 07:53:48 -0800
Message-ID: <20261117155353.2250540-4-joe@dama.to>
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
index f6059b533eac..97f27e005810 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -871,6 +871,23 @@ static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
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
@@ -1008,16 +1025,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
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

