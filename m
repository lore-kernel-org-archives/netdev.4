Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220100;
	b=UP1Vd0Tro6nrEI/dcOhoME8eDDzNlYkU5OLr8ZlRqxLBcg/6Q0MbL+aWBCy4rCWaGyml
	 Gs1DJxXPJTZkBb3WdZr95S3PfVv3L1aKk0MivXba2KuQbxQdabQ7K6X+PIGQpj757csRS
	 1zN8WzxBigr+lwc8yJqfPv+qvnZ7sXc2is+ivSk/bgFlVms1r9jh3dIYHbiZC3cWsGZel
	 E1cbu7JBoIcNDK6jiCOcxY32zoMJ3SN3EjReoBlwf0T/Kxg2LSnjnjR/QcbAazKK8URfy
	 mSlyVUz7oH3z0Fb5CcMKTVo8D6kyRC1NKwsAO02tkqHRxIuJZaMVA7JyDb+uoPnIDlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FHpCwmILGqqPyV1XeD0mfH97293hDloRW/sMB3Yx/KE=;
	b=vfETqHQKp7URYdVOxvVRKFxnr4wlpOzP4yi2pl/3ppzMWBD8ECctfFjJGB1E4CRpxy1d
	 rA3w/j6IK7GCbd/YXk15byyspe/iMkW230PMuP3Av4DbwPuFGN4KDHwiTnzJD3ir1gTC7
	 AHvG/eYotjBRUNQLw4k9v3yonX9HaLtYBrnO9Yx8+pFNXmQkxqV2Kl+tcx1N5oB3mTlTk
	 XylM4K5GPskr7O3NOVHrVBwtQFgOWw+g/oal4rSktTjTiIrstjzK8DoS4SqUEk5J27Y1i
	 yMPRslvdQwNS2qg9HRy+uss3XHNMv6aMcni8Fj1IOPlLS4QthjxmGVOZVVIx9seG4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfJ3NaQY;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89BA606A6BB
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89BA606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfJ3NaQY
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso699718f8f.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220088; x=1795824888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHpCwmILGqqPyV1XeD0mfH97293hDloRW/sMB3Yx/KE=;
        b=wfJ3NaQY6oy86fNQ3jqgi+Rx7AV8rcTxM/aw9mB69BxdU5TIXZI0qOvVwQ982BD78x
         U5RTlLCJB3Y9by3OaVxhaXxS5DB+Vo6GukLDUr3qnB25iwoTw/ciE8iugPPxvjzSDvlV
         Hd9cBK30dXzkSpG8HD/OV14Oqg+Ra5pwSTEY1ZcAX/s4exktQ5dY5uYUn9UgHnflglh5
         2i2Ud6nSTlCeFuC8EjU4mqzgoqH+kwe1AwyXtQsHGT+UxyNd1+Qgt3trw8Yuwb99m059
         UWHaH5nGUoAIpNOcB2d2/yZwgMFeNuV2mMdJecUJs/ySbwEGNu0j2rKu2c395IoTSRRw
         hI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220088; x=1795824888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHpCwmILGqqPyV1XeD0mfH97293hDloRW/sMB3Yx/KE=;
        b=Rbt1Ezgxd5KdC8R1DyYPbCsuKvjNnjfgIf1agvRlPq4gNdyha+dmBUfN7y4Jq3EcdJ
         BJmnokALEeKHFg9Tf6oy91rHSr1xb6kI9KIKo3Wip/ykJgka5hTFJA/Q/89EeA4PMP0g
         FM5veYr8XBzA3KizaO2lqaYBkeV+uaNbkkDOwpqwRh0Z5sXk9p79yInlq2N9krdvcXk3
         lSJs6KaTYi78wQ/95+m+gLAmYQWpzR7H0M8HZlhtlmfg3tVdbYOA/87ZUkT1/t9DCiv8
         2n2Vujm5K1krNYMU44JlGfuOvDjldyleEEHTQ+tP/ecs3T/nd7nSR9KoXdvwUWz5vTR9
         RrPA==
X-Gm-Message-State: APuU4Z/FeKytCATdq137lZk92FPQ9T3cjCbZKYhLGGhT2DrdM6sseEpq
	NwauFQsPuNlzjUyFp+B7zWG5KA8lGbA/QqBMnpf8PFLBdGyjfcD1MOX8TThXhvFl
X-Gm-Gg: AZFdTZcRZAv80c/noqEYwmZige3k0FG063NhEI/9M3AL+qiw/MqiISyqpxk+rbgZjKf
	fI+l8cETCPDlYVZg8OVpfKmneXuUjZNduHmVmWQWVDIlPrLST2IYa/Iby2+HWsY1tBOo/fARcnD
	qSGtC1DTB5nUIIPVDkqZmauk0d/KtthNz6kPhKLFraGxmHaE8GleAt7WDpXVw4JD78QeYffJPEj
	oablKVXFvZEJDTKdGqo+Xi406EWxNAkWDr1otCkvZYp11XHejssFUSmqS7qBQ4UjIApEjZc39EE
	pOMiz3jAmlPHDKhely57RNQdhouo0mNRpcraPph3yJsXZdqzQ44BgiyQa6D6ex9MRvtJxwywxWm
	HJkw600Vf+kop14NSDNbGBO8JH4El/dvI2k7DxWaasT068Zgx543Yfnt4X2Tklpqr3fzcFIlx/I
	oSZ5zTDcN4niGkn71Ss05YmXVvKLwfTt6+00gJhKe4oYRGs54e+I4uG4BiB1TFzbE2LDM51J1kR
	YM9zdVt8pRy3TFNCCRaLe8PNmzriDAO41kyOn62+SNQva2BUzZyJgqBrzpDi56m5Il+hNVTDHdm
	jooY0W/yvl8tySrOQAKrLcr4vT5xMIzQJ4OhUC4v6Ekevq5wng2unQSXGGJeqInXDUgpIOTax5p
	3moY2pVrPchZaLo2L+ia3PKxhMK6aTaYsRsPfnFtwhqy+LplADR9gaWzSjps=
X-Received: by 2002:a05:6000:4812:b0:4a7:b8ab:df86 with SMTP id ffacd0b85a97d-4abb5db73bcmr8979385f8f.38.1795220087822;
        Fri, 20 Nov 2026 16:14:47 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm7138696f8f.18.2026.11.20.16.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:14:47 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: netdev@vger.kernel.org
Cc: Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net] net: mlx4_en: report the actual RX classification rule count
Date: Sat, 21 Nov 2026 03:14:14 +0300
Message-ID: <20261121001414.724236-1-ralerrdirsardx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

mlx4_en_get_rxnfc() treats the input rule_cnt as the number of
rules it needs to find for ETHTOOL_GRXCLSRLALL.

With room for four locations and only one rule installed, the
ioctl succeeds with rule_cnt still set to four and three extra
zero entries. When the buffer has too few slots, the ioctl
succeeds with an incomplete list.

Bound the scan by the rule table size, skip empty slots and
propagate unexpected lookup errors. Return -EMSGSIZE when the next
rule cannot fit and set rule_cnt to the number of copied locations
on success.

The source-extracted ASan/UBSan regression tests passed.

Fixes: 820672812f82 ("net/mlx4_en: Manage flow steering rules with ethtool")
Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_ethtool.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
index 4ba1947..463c1a4 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
@@ -1739,8 +1739,9 @@ static int mlx4_en_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 {
 	struct mlx4_en_priv *priv = netdev_priv(dev);
 	struct mlx4_en_dev *mdev = priv->mdev;
+	u32 count = 0;
 	int err = 0;
-	int i = 0, priority = 0;
+	int i;
 
 	if ((cmd->cmd == ETHTOOL_GRXCLSRLCNT ||
 	     cmd->cmd == ETHTOOL_GRXCLSRULE ||
@@ -1758,12 +1759,17 @@ static int mlx4_en_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 		break;
 	case ETHTOOL_GRXCLSRLALL:
 		cmd->data = MAX_NUM_OF_FS_RULES;
-		while ((!err || err == -ENOENT) && priority < cmd->rule_cnt) {
+		for (i = 0; i < MAX_NUM_OF_FS_RULES; i++) {
 			err = mlx4_en_get_flow(dev, cmd, i);
-			if (!err)
-				rule_locs[priority++] = i;
-			i++;
+			if (err == -ENOENT)
+				continue;
+			if (err)
+				return err;
+			if (count == cmd->rule_cnt)
+				return -EMSGSIZE;
+			rule_locs[count++] = i;
 		}
+		cmd->rule_cnt = count;
 		err = 0;
 		break;
 	default:
-- 
2.56.0

