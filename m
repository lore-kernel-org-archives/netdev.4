Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717531;
	b=frkGs+wWQ7QDURJnW8Fm5JjGjyCykXAmB497Zhw9TS4AeuEDsfazlsrVb8blsqxZbFLw
	 Odpvt12unLl8o30yJmxD5dYaZDI7aMbaqAhRcQeGgXoDI61AY2OY/UPUPvesOYwnjZbrb
	 Sv3vFENHia8zaYlg5EV/ZHEsek3BP87ObfIfgFINGKK8eQ7kwoPCSTTAn3WiWkKTdxqZp
	 C1zuN9DtpvmCPrqVCH0ZGK2fWX/wREHb1bWlDRMDloGBDdM2Oogez4kt5oApiKZY8lWYu
	 V9OdckL96ZWhqlnTTv/Pt8bQJIYFNgoSHridnZm3+TBXo42pbkFwuuxlckj3luAxKhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717531;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8tUG+IolnEdGLtETh+nBLpQXt1oYmDsjEndttR/Fxo8=;
	b=B7FUMKqnVv6sX4UrtYimMLk12GI7IUCS+DsV3RPqbh0EmMYSuWu0YLK+q8o7AVeFkups
	 Q+Lrxt1q+OvPJbsvKCy8uM6dcF+6h5GGYm8Rf55Q/9UzB9fRm4gP53dn0VgpGQFk0lmJB
	 5Gxt9yBZJWlVGOvUjHk08HoNs2Ix4hbKMQXWg8qFp19D+6eVIQ8vcCP1SMQu3SV8PuMrz
	 HdD+9pQeeAHIBQ5tVZMla8TDT8kazVqQ0zI02ie1EAiUDnglSEGmUiQwQwBVPCFNo2d/c
	 rwPlPFy2twKsTvaiHGOCrXNaCYH8ZBbsdNf/qcoWYYcbMVk+LvqTlKsMaafDC3kooTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ONuiJDEm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.13
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C4606A333;
	Thu, 26 Nov 2026 18:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ONuiJDEm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqiyY9IJKaavBcAG83170b0LR6F1A4c/OawZ2fD9bmIoY8pt49RizGC9onMWbjS5gO6kt2+JRhZF6J+zITOCFkZtid/O1/ufy7KYRlERsQj80Z19mvio/R5DAgZsGP5Vk7B467npbUG8tB+457VxyOqFBMT3gm2OQabSqVBQ6ur5eBZAGBqiG3gC0PqXRaiT02b+ikA79DtNoyH7RigFPQ5dX7S8g97ZxmabHIFiR68dGAHWme87AF67yBZxp+ZVbOULtpebEpbA+Zydp1X8qHd1va0G33JiHbgvQkmCdx7s/17et/gX7VzJJhZS7LOo0DIO5gkYa4IsoAUnU7y3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tUG+IolnEdGLtETh+nBLpQXt1oYmDsjEndttR/Fxo8=;
 b=ewg1t+xl7iQOtWHbFIFXzLVoW349w4C84Eyt7zG6f92YuRINjJU1azv2hmpYbBpbQ9a9rh8E3mdxApm0fLaTKa8A14XgjlD5qdmF3BOGNznogaC35NoyXLtQJqNrkoz9XJhHHh7W7mHqBY7NoSrNsB1DNfKLS8ZIOrqAmTs9HYSyPwEwIMQq5urmk3eN6P1gd3F3eHICxEotuCHul1mHXwk+U41cGS72EQgqKmZHbYvuqAf8f86CMZo1V6EfGh8sKATevvcfH9W6U505aQbmXPHOBwKNPFcAaFkCce9Q2+M/aykonTZLVdFpoHwcNEDf0o5fqowygl1FgU3ZgtZSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tUG+IolnEdGLtETh+nBLpQXt1oYmDsjEndttR/Fxo8=;
 b=ONuiJDEmcLMwLvIC/9wmSOfG0jacIH5wIcKmvp9nMEpMyg9PpvCsEsqE3KEO/Ui5dx7dgtcGzYW1bg0W7ayXsRd4i3weU7gYsIRPh6ZwDcuaHViH9smaOZSDtdFp9goFSowsk5iNk/SbbI/kbkkUhGzx+AJek85xbabxMeQ5BKxzGxpYyxls08JxO5yMhzKV3e+hYpn1Peq0nN1uQiB/yTQICF2Jxtf0pRElxt0pB5hPekWpRSdng/KlRZGPNZ+GH0kIWToLYL5CPBfq9SziEwJYg1fv/BYMvX5b5fhnHMP3a3F3p/bnroOX37CZDoEg2s5AM3emnYMHl69yAtuGvw==
Received: from CH2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:610:60::22)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 18:25:25 +0000
Received: from CH1PEPF0005BD5B.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::4d) by CH2PR14CA0012.outlook.office365.com
 (2603:10b6:610:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Thu, 26
 Nov 2026 18:25:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0005BD5B.mail.protection.outlook.com (10.167.244.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 18:25:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:09 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:09 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport; Thu, 26
 Nov 2026 10:25:06 -0800
From: Tariq Toukan <tariqt@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, "open
 list" <linux-kernel@vger.kernel.org>, Shahar Shitrit <shshitrit@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH net-next V3 3/5] net/mlx5: nodnic: Add TX/RX statistics
Date: Thu, 26 Nov 2026 20:24:46 +0200
Message-ID: <20261126182448.707782-4-tariqt@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20261126182448.707782-1-tariqt@nvidia.com>
References: <20261126182448.707782-1-tariqt@nvidia.com>
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
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5B:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaf56f7-81e9-4c5a-adcc-08df4beaa36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261021123027099003|10067099003|56012099006|11063799006|261021135927099003|261022105027099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1+iRykw+0DqyhPyMEPzDdEK/cchJ0OMWV6D8lPTBogj0iyiEyF6mT8nsD6bxEeoY2FsEPECDi99tJoOqi1kfg9FAZ5PO1QVW0gWGxUDqeMKiT3t2H5cqMHt46vuxU3oDRTmasBVBbzuD6zRioJHTgcWkTSd04pvOnzNVW/ZXh+z0349B/eDHMGDU56EbDdeeDvXaDyUnkKyW4yq5Ex/kD6yoaWegcHQjaKkrYHlKePWzWYaGmpNasrr5wWx3Sa62Vu3fgnycGg+1TbpcnTHtFTv7vVLLteqwT4Xdkrb/iLISNBQe70Def5ljidyp+sqTFEtW+mSwhxGKKv6X4iK5QnCjSnPvyIAxBxhFYVAdW1mfIsy5IPpFu3LMZUhZGFEThQ71VC7eE5i/WFITylc6KNmFHTtosPhZUh51GaagFz4E9lliFx0DQZVYapMz6mzkoW7szFUuuN7gMLwgD/ywyFPXlO//RBifD1QOrx3GswR2FcWNg9ufO4V4zuBUvE7ScORs/x47lB8ItOl+IEfGWBzwrhvy2J1asjXyyb0PLuUeFg6M+5l4rpY7Eb7yWueKA31BGKS50hOi0KqajLQKuUhC1cweELhXComOPyqfkrPZcDb6yneWUHupT7+VgLDeWkWM5c3C8q+P5hfHInrROQnv0UCcB1DXImNI5xQ9qDU5HkgdEDM36//2VjSMsX91LrZ97kkgNCMZZN0tZU2LCw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261021123027099003)(10067099003)(56012099006)(11063799006)(261021135927099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IhM0Vnknn4HlCmXJKb38G4UOwhl96aYn6YAz91QHLwbLSXQSbLqZBygpXj0nKHl4bH+iL83eqhtYB3Tf8xkk5QxV9IDKzgSgIgs609xIcD4ora+tdZv+0babdWtvfOi25/DH02b+NAuf62jXfBp5mRK0BixtFCaKrSj8EEG4/5H9ZwnQ9b+jiDjcPAIPWKulqO9VFOqm/GFkqFBHyynI0czO6k4MkF8ZZx2oSDQv15+aiy1ZK0sabeLo8yYVmhHQy8HYvtuqWoZ709utgt5xAwO9+OvQDao2ExMv9nEmUAyhfYMfXNDliIBV9D0VyDFJlKQBdG9HuyKSR98B/rb/FIoS1/jVL5/h+1WI+wnf0738rUqQV0NasJ2Os0EIYstxWLhjYVzgkLtZufBTvCuDyY9Zaf74hyNwb6zg5HjHvwFMT1KI7nCn5MDQUu8sVX8w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:25:24.4802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaf56f7-81e9-4c5a-adcc-08df4beaa36e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD5B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

From: Shahar Shitrit <shshitrit@nvidia.com>

Add TX and RX packet and byte statistics, as well as TX drop
accounting.
Update the counters from the data path and expose them through
ndo_get_stats64.

Signed-off-by: Shahar Shitrit <shshitrit@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
---
 .../net/ethernet/mellanox/mlx5/nodnic/en.c    | 11 +++--
 .../net/ethernet/mellanox/mlx5/nodnic/en.h    | 18 ++++++++
 .../ethernet/mellanox/mlx5/nodnic/en_cfg.c    | 42 +++++++++++++++++++
 .../net/ethernet/mellanox/mlx5/nodnic/rx.c    |  5 +++
 .../net/ethernet/mellanox/mlx5/nodnic/tx.c    | 13 ++++++
 .../net/ethernet/mellanox/mlx5/nodnic/tx.h    |  3 ++
 6 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
index 6400e100bcb1..38dd7498568e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
@@ -85,10 +85,15 @@ static void mlx5_nodnic_handle_err_cqe(struct mlx5_nodnic_cq *cq,
 
 	if (opcode == OPCODE_CQ_SEND_ERR) {
 		struct mlx5_nodnic_sq *sq = &priv->sq;
-		u16 sq_pi = mlx5_nodnic_sq_get_pi(sq, wqe_counter);
+		struct mlx5_nodnic_tx_wqe_info *wi;
+		u16 sq_pi;
 
-		mlx5_nodnic_complete_send_wqe(sq, &sq->wqe_info[sq_pi],
-					      napi_budget);
+		sq_pi = mlx5_nodnic_sq_get_pi(sq, wqe_counter);
+		wi = &sq->wqe_info[sq_pi];
+
+		mlx5_nodnic_sq_stats_inc(&priv->sq_stats, wi);
+
+		mlx5_nodnic_complete_send_wqe(sq, wi, napi_budget);
 	} else {
 		struct mlx5_nodnic_rq *rq = &priv->rq;
 		u16 ci = wqe_counter & (rq->ring.num_entries - 1);
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
index f2d52cfe91c0..a5812a2205d6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
@@ -12,6 +12,7 @@
 #include <linux/skbuff.h>
 #include <linux/timer.h>
 #include <linux/types.h>
+#include <linux/u64_stats_sync.h>
 
 #define MLX5_NODNIC_RING_ENTRIES	1024
 #define MLX5_NODNIC_CQE_SIZE_B		64
@@ -44,6 +45,20 @@ enum mlx5_nodnic_cqe_opcode {
 	OPCODE_CQ_INVALID,
 };
 
+struct mlx5_nodnic_sq_stats {
+	struct u64_stats_sync syncp; /* NAPI */
+	u64_stats_t packets;
+	u64_stats_t bytes;
+	struct u64_stats_sync xmit_syncp; /* ndo_start_xmit */
+	u64_stats_t dropped;
+};
+
+struct mlx5_nodnic_rq_stats {
+	struct u64_stats_sync syncp;
+	u64_stats_t packets;
+	u64_stats_t bytes;
+};
+
 struct mlx5_nodnic_ring {
 	void *wq;
 	dma_addr_t dma_handle;
@@ -115,6 +130,9 @@ struct mlx5_nodnic_priv {
 	struct mutex state_lock; /* protects Interface state */
 	unsigned long state;
 
+	struct mlx5_nodnic_sq_stats sq_stats;
+	struct mlx5_nodnic_rq_stats rq_stats;
+
 	struct mlx5_nodnic_sq	sq;
 	struct mlx5_nodnic_rq	rq;
 	struct mlx5_nodnic_dbr	dbr; /* one shared dbr for TX and RX */
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
index 243c720b73b6..9ab996a6ebaf 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
@@ -991,10 +991,49 @@ int mlx5_nodnic_close(struct net_device *netdev)
 	return err;
 }
 
+static void mlx5_nodnic_update_sq_stats(const struct mlx5_nodnic_sq_stats *sq,
+					struct rtnl_link_stats64 *s)
+{
+	unsigned int start;
+
+	do {
+		start = u64_stats_fetch_begin(&sq->syncp);
+		s->tx_packets = u64_stats_read(&sq->packets);
+		s->tx_bytes = u64_stats_read(&sq->bytes);
+	} while (u64_stats_fetch_retry(&sq->syncp, start));
+
+	do {
+		start = u64_stats_fetch_begin(&sq->xmit_syncp);
+		s->tx_dropped = u64_stats_read(&sq->dropped);
+	} while (u64_stats_fetch_retry(&sq->xmit_syncp, start));
+}
+
+static void mlx5_nodnic_update_rq_stats(const struct mlx5_nodnic_rq_stats *rq,
+					struct rtnl_link_stats64 *s)
+{
+	unsigned int start;
+
+	do {
+		start = u64_stats_fetch_begin(&rq->syncp);
+		s->rx_packets = u64_stats_read(&rq->packets);
+		s->rx_bytes = u64_stats_read(&rq->bytes);
+	} while (u64_stats_fetch_retry(&rq->syncp, start));
+}
+
+static void mlx5_nodnic_get_stats64(struct net_device *netdev,
+				    struct rtnl_link_stats64 *stats)
+{
+	struct mlx5_nodnic_priv *priv = netdev_priv(netdev);
+
+	mlx5_nodnic_update_sq_stats(&priv->sq_stats, stats);
+	mlx5_nodnic_update_rq_stats(&priv->rq_stats, stats);
+}
+
 static const struct net_device_ops mlx5_nodnic_netdev_ops = {
 	.ndo_open		= mlx5_nodnic_open,
 	.ndo_stop		= mlx5_nodnic_close,
 	.ndo_start_xmit		= mlx5_nodnic_xmit,
+	.ndo_get_stats64	= mlx5_nodnic_get_stats64,
 	.ndo_features_check	= mlx5_nodnic_check_features,
 };
 
@@ -1023,6 +1062,9 @@ static void mlx5_nodnic_init_priv(struct mlx5_nodnic_priv *priv,
 	priv->netdev = netdev;
 	priv->core_dev = core_dev;
 	mutex_init(&priv->state_lock);
+	u64_stats_init(&priv->sq_stats.syncp);
+	u64_stats_init(&priv->sq_stats.xmit_syncp);
+	u64_stats_init(&priv->rq_stats.syncp);
 }
 
 static void mlx5_nodnic_cleanup_priv(struct mlx5_nodnic_priv *priv)
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c
index 7736a1f24ea5..58d6b033f5f6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c
@@ -140,6 +140,11 @@ void mlx5_nodnic_handle_recv_cqe(struct mlx5_nodnic_cq *cq,
 
 	page_pool_dma_sync_for_cpu(rq->page_pool, page, 0, byte_count);
 
+	u64_stats_update_begin(&priv->rq_stats.syncp);
+	u64_stats_inc(&priv->rq_stats.packets);
+	u64_stats_add(&priv->rq_stats.bytes, byte_count);
+	u64_stats_update_end(&priv->rq_stats.syncp);
+
 	skb = napi_build_skb(page_address(page), PAGE_SIZE);
 	if (unlikely(!skb))
 		goto err_recycle;
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c
index c0dba88b49e0..c7910998f53e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c
@@ -151,6 +151,9 @@ netdev_tx_t mlx5_nodnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 
 	err = mlx5_nodnic_tx_write_wqe(sq, skb, wqe);
 	if (err) {
+		u64_stats_update_begin(&priv->sq_stats.xmit_syncp);
+		u64_stats_inc(&priv->sq_stats.dropped);
+		u64_stats_update_end(&priv->sq_stats.xmit_syncp);
 		dev_kfree_skb_any(skb);
 
 		return NETDEV_TX_OK;
@@ -174,6 +177,15 @@ u16 mlx5_nodnic_sq_get_pi(struct mlx5_nodnic_sq *sq, u16 pc)
 	return pc & (sq->ring.num_entries - 1);
 }
 
+void mlx5_nodnic_sq_stats_inc(struct mlx5_nodnic_sq_stats *stats,
+			      const struct mlx5_nodnic_tx_wqe_info *wi)
+{
+	u64_stats_update_begin(&stats->syncp);
+	u64_stats_inc(&stats->packets);
+	u64_stats_add(&stats->bytes, wi->num_bytes);
+	u64_stats_update_end(&stats->syncp);
+}
+
 void mlx5_nodnic_handle_send_cqe(struct mlx5_nodnic_cq *cq,
 				 struct mlx5_cqe64 *cqe, int napi_budget)
 {
@@ -187,6 +199,7 @@ void mlx5_nodnic_handle_send_cqe(struct mlx5_nodnic_cq *cq,
 	pi = mlx5_nodnic_sq_get_pi(sq, be16_to_cpu(cqe->wqe_counter));
 	wi = &sq->wqe_info[pi];
 
+	mlx5_nodnic_sq_stats_inc(&priv->sq_stats, wi);
 	mlx5_nodnic_complete_send_wqe(sq, wi, napi_budget);
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h b/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h
index baffa6f2b92b..a072654c1ba5 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/skbuff.h>
 
+struct mlx5_nodnic_sq_stats;
 struct mlx5_nodnic_sq;
 struct mlx5_nodnic_cq;
 struct mlx5_cqe64;
@@ -51,6 +52,8 @@ struct mlx5_nodnic_tx_wqe {
 
 netdev_tx_t mlx5_nodnic_xmit(struct sk_buff *skb, struct net_device *dev);
 u16 mlx5_nodnic_sq_get_pi(struct mlx5_nodnic_sq *sq, u16 pc);
+void mlx5_nodnic_sq_stats_inc(struct mlx5_nodnic_sq_stats *stats,
+			      const struct mlx5_nodnic_tx_wqe_info *wi);
 void mlx5_nodnic_handle_send_cqe(struct mlx5_nodnic_cq *cq,
 				 struct mlx5_cqe64 *cqe, int napi_budget);
 void mlx5_nodnic_complete_send_wqe(struct mlx5_nodnic_sq *sq,
-- 
2.44.0

