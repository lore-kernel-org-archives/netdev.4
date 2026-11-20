Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143312;
	b=cZIsVxlfB0iaDrrMqjnfyz1x+464zYaPaogyzF871doDE7Ybb6LwRLOUYYCEa4ZqsoD8
	 eIeev4z1+gYhqBnLybgEsHTpGIy+iX5MbeEGLWK7fUQICF3do58tT/0RWfrRBY2hvQBWe
	 7Jgbe7dCOSCpnuS/uwuqKZB56fp995Ad3Q9xEYQFexU888tZzRgtzm5uGNW75hImWDYVu
	 fMtffuYNDIJSvTZE3B2r+4Q7DFc7Xo2qXXMzRVJ0wIobyoKmBv7f+zb7dZU/7Of0Pqs5s
	 Zx6B6sxyfL0aaAAEz0uQiV0EZuzHCm1t1qmBHDnlFGmvdtebi6I/qidFj71Kv+BeEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
	b=BoARIKRJxcwfzeKss9MGZi97ZKQ+TT0GHMdpT7SnAsV7YQ81PwJ6Sw2JPNFdLAkj9WwQ
	 CTDvAzAm2pP6UXwJrke8a2oRRq6oRei7UoZjc72xACYuA8xP0ZOLY5Ei0Nk3kDgvNf1X9
	 Nf2HxscXiPZq1R4p/QFbtmEaLnnMyaCVsHlnXgLolliAJdifkgVOmAfTfZ8wQDJ6IDfrx
	 KSMaVIgP5/LXZTXO92/2HZI1RkndgUWeF8bhPJ+wzCC5CsHPQ4MoH4KFWS8TM7oitHHbU
	 buABYWEq/+FKCXqkMPga+F64VhyhD8mRv5Dcb0f77zn+vwHErcOyC7Vo+sYijsROnjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuorWREu;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED7606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67ED7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuorWREu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d03bfd477so4904771cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795143311; x=1795748111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
        b=JuorWREuLl5FNO3te+6cIjPitDzDBIbPtyfeVNd8KLBi51kMuC3ztk7OY44XqKV2I+
         VLYGQfX+Nbj7E3ZcoRVB13yC8yjGxM4UVrLXoqkwVnpahRjK4ppu0/wC/9AWwDpmmGIK
         66KxBcnLuF4VJDVPHtA3N+h2H8HKBWIvMMyNKFxWm/2ETCPKQmr/gMNrjqlHaqq2LnQz
         PHuH0PKKyqndCP9ITzjafVc+u70bvGCQp1T6GixnL4MIndq9alftttlwMWsO8H3nFrJE
         zw6R5JU1hV1k1re17nA/Tcl1Y6O3IsidZtgNFLHqSodAXQqihZqIdcWgVTRGxohHo/TE
         uHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143311; x=1795748111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rjhg0kwaD/wTpUnBxoXJn8jVRPigfkaeSmbsFggc+7k=;
        b=NmamQ+OJzf/g26nL7ByGaZ6Xjae9PZz8lJWmkz3woZFQh/6fCrOh8EHXG7iwpVqabf
         rStJJPya7xykksXYP6QdEi8AgqExqBXB+ED1CAwCUujysFCd3O6MowHA27lGCvzT5A0u
         R+dkCbTTHryyy0GqnxX3TZWuosuiwzrSXNkGi00mBqfJkxP8Z4OFBXODxGmhB90vrRFU
         pneFEYXXqzsbfrem14cgSCw+sbZxuq64Xkr0TFizGhNckSuBOJN9YIqIGP1dzYUrX/v8
         JtftzGzPSLIHBGF7SloE0rblTnFm2V+qN/qsab2av5AZf8kAr09jWFQfteb872YDsce9
         YJWw==
X-Forwarded-Encrypted: i=1; AL+hErGz0VGG5myStY5TwxGG0sEExfEYMcjOnDVxsFz/+6pO/kdeAFwSXJXOjp3HBxMl7EI/u1Jonjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ycur9hNi3svu/0LmOpMVNwLNbxln072zH40SR7Ylw3sAy3tl7
	mQPPG7l7WgzlFoSxXvx3W9uW4c0ehNXnbK2AeW53ZyZQXrWd65HUGhb4FF94UCTX
X-Gm-Gg: AYBFou0sVWJD59tHLG7gypCc7UETI5Es65UvMp1fkKKIB+BAODQTFbqJH3g4Caj/Cs0
	IhLnlO00+H/25KiDkx+IDlx9PMyE/hN9B0DX5QhPjb+sC+Nsm6k6majPrFR9lEhNBUa3xH2xiIO
	U1XnaaxDKA5f2ZVoCvE1n59ptyPLcUN8UBScodxvwoPfM01PxMgS2MT7+6zAGoWqIsjeIEL++i9
	DuqrjNME0wCDB5YI4QC9+WmVyLTW40M2ASd4gp6Eu77bxVrWNqm8OFggRSsyAUJtZgfFpIXGY9k
	0KglYGb926jPScJDrZSqRlsKL1yZMj39Ttkv9gq37FmxaksvWEXwMRfCz7pw6tG2Gd08dSG8Qfl
	TQZoD6VvweKpd6SRhXbR+zUeHfvv+KW6RqRqd2q0F4lTWOD7QR8SVPyWNzM6tHF+HVBrXb3OXgD
	vtaQRlD1Q8lJIzzP5E16WUj257EqpuJsbyXXWu0sWJyDBivab/qZXrgmk1aA0grywZRVrF74C7c
	lcI4DbwOt1FKEZtap4vIEu+vK7zLtAtuATWVrBnYEVgyiIbZseI2869FDQgfpv2HPoSeBNtWj8h
	db4ro8iYG7/h8Z4sJak7nxix3mgGK8H2AbixgyjsuzU7b2SwyqCtCib+xGkcNdRV+rpX4Mk1TmI
	=
X-Received: by 2002:a05:622a:58b:b0:533:3192:7a8e with SMTP id d75a77b69052e-55d76a76454mr34189001cf.43.1795143311326;
        Thu, 19 Nov 2026 18:55:11 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b456csm14398686d6.13.2026.11.19.18.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:55:10 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Boris Pismenny <borisp@nvidia.com>,
	Jianbo Liu <jianbol@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net v2] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a rule fails
Date: Thu, 19 Nov 2026 21:55:01 -0500
Message-ID: <20261120025501.1675212-1-lcy8047@gmail.com>
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

In switchdev mode, rx_add_rule() calls
mlx5_esw_ipsec_rx_setup_modify_header(), which allocates a mapped ID for
the SA in ipsec->ipsec_obj_id_map. If a later step fails, the error path
frees the modify header but leaves the ID in the XArray, and
mlx5e_xfrm_add_state() then frees the SA entry. Each failed inbound
packet offload SA leaks one of the 2047 IDs. Once they are used up, no
new inbound SA can be offloaded until the IPsec context is cleaned up.

Release the ID on the error path under the same condition that maps it.
This label is reached only after the mapping succeeded and stored the
new ID in rx_mapped_id, so the copy that mlx5e_accel_ipsec_fs_modify()
passes in never loses the ID of the original SA.

Fixes: 91bafc638ed4 ("net/mlx5e: Handle IPsec offload for RX datapath in switchdev mode")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
 - Release the ID under the same condition that maps it, as suggested
   by Jianbo.

v1: https://lore.kernel.org/all/20261118051247.3885308-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Jianbo tested the same change on ConnectX-7 in switchdev mode with fault
injection on one RX SA add: 46 of the 2047 IDs were lost without the
fix, none with it:
https://lore.kernel.org/all/96a5ce67-89c8-4010-bfc4-4553e1aefe87@nvidia.com/

On our side it is compile-tested only, with x86_64_defconfig plus
MLX5_CORE_EN, MLX5_ESWITCH, MLX5_EN_IPSEC and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
index 5c69e89b13a7..1f0ed8ab75d5 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
@@ -2163,6 +2163,8 @@ static int rx_add_rule(struct mlx5e_ipsec_sa_entry *sa_entry)
 err_pkt_reformat:
 	if (flow_act.modify_hdr)
 		mlx5_modify_header_dealloc(mdev, flow_act.modify_hdr);
+	if (!attrs->drop && rx == ipsec->rx_esw)
+		mlx5_esw_ipsec_rx_id_mapping_remove(sa_entry);
 err_mod_header:
 	kvfree(spec);
 err_alloc:

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

