Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206280;
	b=ENvg/3gkKgG4Xoh8nEzV//RzqesZz/HfT8WwH2/M/DjC8b2XCp8s43TBE/C1rdm94Ymr
	 51lHqeDB33t+Oq+wNoWTxylGniiRp+UWokb16/Vb7YvBwkYqfjHQoj0nE4xYY3NEIZP8v
	 LmKSnVDsOCgGCg+/p1PtZ9Sdqkck2Q0L9p8i8Mj4AfzfkcyFWKJgQlmX4CTm2jAjRvVhh
	 /NfnT109WgTFI3S4CUQ6nG6CHVxYEtBDC+lm2S1jk9IQiVREjIiVceKNg0VqZgIng6Llg
	 /zP+C2aZGQnrGLf55okJupe+H5BDJKXkvdpzxJLUoFarwPopsQklSTyHZu07qwbD9nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206280;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=+OQlO/rragLCNOXxskl27qyKpMoYP3Zw8d23r0cHjec=;
	b=bG/3xrJ+0XmCBNuNtLjVxkw9BcR9tXP1uJQ54PbOkW22n2UjT2Jzw6oFg1KtJVclfmHQ
	 HxkMnCmKpj+/MOw1by6lZ0sgxbEagl/mE+A8GV+sScLzceUB7YXY6sWamzDgOsS/r6yTu
	 XO6CaX+7dfTECoObW0+vxpzfFouFKG2jCcgtmRwO6en4SDJJP7l1Uyl3abqRt10O8drEP
	 miSHns0DJUvDDw9cplAjbfmYBa5quwTf7THuLhnae6ftbexkYTUDtzb3sddRgBPKSpQug
	 HSexKFace/WVirLu3l2uDF43jron7OkciebpOib2y+0NWtPmm3oHT5oH1YW7HaoESaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QY1Vqez2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.45
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB06606A6D2;
	Fri, 20 Nov 2026 20:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB06606A6D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QY1Vqez2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDGmy1Lb3qi8XwYFHBu5A/Nyc40EnypC9IQXCmZmfJSYpScO1mVGW4Fn+kN9pkduKR5hzD6wBAzzxX15dP8HzmDaapqK2uGL2A5IhcIsbh+MVbOhjhQ9K2KHBOQYpoMNdFuZ99Ad1aNZdIEfreSsK/jIquIDERCsA1JsGmL2HM1K4KrEo7RTOgFeDbpLemqsH6uxLiXZDnDTEHcpXDo9sq6SYLVJWiEdVkvIfmZr5Ty2GbHpIy5+PHnS7YQ6BeEQoT9Zi5W/pfvDXhieAIGpnKzQGqM5k6UXKZYGUIgbYqCvmj7rpGEuKqL1IHoSaKYtdIs+WAAzLMD1Tz5hGUSdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OQlO/rragLCNOXxskl27qyKpMoYP3Zw8d23r0cHjec=;
 b=i7rcqWXeYRupORJz+6q2KVNvAQHUbQzpK9JoZClWUNE8ym/H8oODqA8Eo3+JHEe+C/9k+ft1y/6T/7ugYVpd+CsxYZwybfuu2tU6KyxUkr7QNw70vWEyblNW5rj9W/AopjTQDZrQyv8JCgWVmjS/rzZ2TscT+VpJY4nmoLIZ25rRUWrn2qF1wONe5oQ278VxSU8Y+rZwBWm84U2nbIgeq/QsLqVI3iMc3g135NuIbtgRSs8pEBEt1YtXi31xh88ETx40z3s/Ne1I0A90eqOie3XZ3UMo5M5D0Hvi07D/GzWjAg9GqP3/ipgYTqSJwIuNyiHogRSbq2oVHoVP97/xVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OQlO/rragLCNOXxskl27qyKpMoYP3Zw8d23r0cHjec=;
 b=QY1Vqez2Gu9A3Ta8FGLXbfkJyWi17YP7X+Vpo3+u5XBC8sA9IjoTKDzyZqduTbuAqqa2GbCAtUre38fAdiSluLezqTI8cpqz6X2It3qoB2He6B4msQXGpdrstJs0No1ZZOcJYaFZ7YFy8ta1Jy2jqNL+R1P4VmeWdvbfskjWjkF1BioqtFXvJcPJ/qZSzHOfDiyZB2aEvYWG5eoffx7m5ti4ZCjQJyR48IzHt8AMAgpxHtYaL6YJ5i/FMcnseZtIY4liZsCK+WX4vK08MvletPmAOFsRZJA01PexMx82jMY0SL7n2Gr8ln4iLGQg8XqqEkdEzRwkx1BnEtVtOrSRkA==
Received: from BLAPR03CA0046.namprd03.prod.outlook.com (2603:10b6:208:32d::21)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:24:35 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::81) by BLAPR03CA0046.outlook.office365.com
 (2603:10b6:208:32d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri,
 20 Nov 2026 20:24:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 20:24:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:17 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:16 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <davthompson@nvidia.com>,
	<cbabroski@nvidia.com>
Subject: [PATCH net-next v1 1/2] mlxbf_gige: protect against MAC disable during TX
Date: Fri, 20 Nov 2026 15:24:02 -0500
Message-ID: <7742d597c5321d5cb587180c1d29eccffa9d51bc.1795206150.git.cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795206150.git.cbabroski@nvidia.com>
References: <cover.1795206150.git.cbabroski@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 73351434-a068-4155-4366-08df47444af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|261026140227099003|11063799006|56012099006|261009223027099003|261021121427099003|261021135927099003|261102123227099003|261021123027099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fYqzb/Dnu+dMhvWGUeeQ5BxXoTVoA1VaUdYbN58JfHiFQhvp7Nv8EseBWoizclxYgHr2Oh3Q48Q/DSsh0bhXMMut5yOdxVmhQDubDET5sBDRIR+Ofz/XOsgw2hztN877CuedEW+brjIVdN+89i5qaCfoBITkCQ794qtqUZEuU3cyaLXDstgKy52kCK/8HJqf66aoEt4Ms3UQ0qMKqlAZQvNC3Pe4f7HFM3jNnSicBWh+ouAhRFPyDlSgA5k83JO4hxKgr1Ag/dylmkboy+IebDQyfBx2bh98cAYV4+f5yFmXbowA8gBq/JUm2rskAwECqKgZPAA8f8H3CuUt5+TTrfmGFfpy61v+xgmTPZfy0e69GwVD3R2/ZIQEKKkX9fVklW4sO2ETDnKLFHG+HVEeFY9rJudiV7iJTC7iuHh16TGZmNSvG5nDynHtH08ykZ3RuSQU+E0s6o6A8VJDKpEvI8oW5SaieDwzRkjYHN+yjyUKvIM9cPvd442FOzcSl1V8A7oFqsjlz+jDNswBpGyFAe/N6abI1OdebV6jmWdKY3n1OqqevYZAKqAlqFv3vY+BvKKRJw+aKRs/snL2XeGq6/UFDCRtvVnaNiW8kjtkPIJxK1yN3D7vd8J6Wax7yfG8eQgy6OKV1SsYPTrzaDjz/V/hgHkrcB1iWeygpTFFZMB4+7EFVyZLeOYVYFyC9tzJcyaYP2MOIJMtV/AMzc6wNg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(261026140227099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261021123027099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	73w8pLGnSiGIfFrhl8kLPyfN1t+uZbRV038SLAPUVfQxUtiODICfUkBzl6IGHWz7Wg/Dy+SLmb5UAJ+gVAuj46E3ZnwL2O7eoahaHgRlaClObCQypAFR8IKk9C9OpL+qhRDIj9aax7kA5uSi4nXeNU0poUnHKxWrXcKfM9kqdWVTgWjRrQ3Y1kyguDDhWaC4xk6OQo9OJuN9dioNkhM/DzzjGwQ9nI/rlfc5wELDSOK+1UbzmwnPP6vtpkTzbPWqTrWAJVeapd1ZhliCto3hAQrIuxzmRRvquJUA+hiT9s+TzphImyPWk91LPaLMU7Q3+jyLHKJ4tlyTgYvHd39IiDlJvgVcXPtaNWjQpGUebGjOn8AGNx+Fy8iE2SQIK/SXyOVyBSzmQqelum1GmjLipctRKnqOwMS4u8/V+foFnXw6RSmHwgrXWgMVRteOREky
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:24:34.8841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73351434-a068-4155-4366-08df47444af0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA

On BlueField, firmware can disable and reset the OOB MAC when it handles
a fatal error or panic. If Linux is still actively transmitting packets
while the MAC is disabled, then it's possible for the HW consumer index
to be reset while the SW completion index in the driver remains the
same. This can cause the two indices to suddenly become far apart, with
a difference that is potentially larger than the TX queue length itself.

Previously, mlxbf_gige_handle_tx_complete() would continue to loop
around the TX queue, counting packets and freeing their memory, until
the two indices were equal. If entries were already freed the first time
through the queue, then a second attempt could cause a NULL pointer
dereference.

Bound the loop over the length of the TX queue so entries are not
handled more than once, and check that the skb at tx_wqe_index is not
NULL before handling.

After the loop, set the SW completion index to the new HW consumer index
to prevent future polls from walking the queue again. In normal
operation the loop already exits with the two indices equal, so there is
no change in behavior.

TX is not recovered after a sudden MAC disable. If firmware has disabled
the MAC then the system is in a state where it will be rebooting
automatically or needs manual intervention to recover.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 .../mellanox/mlxbf_gige/mlxbf_gige_tx.c       | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c
index 04982e888c63..73c3033591d5 100644
--- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c
+++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c
@@ -130,6 +130,7 @@ bool mlxbf_gige_handle_tx_complete(struct mlxbf_gige *priv)
 	u64 *tx_wqe_addr;
 	u64 tx_status;
 	u16 tx_ci;
+	u16 entry;
 
 	tx_status = readq(priv->base + MLXBF_GIGE_TX_STATUS);
 	if (tx_status & MLXBF_GIGE_TX_STATUS_DATA_FIFO_FULL)
@@ -143,7 +144,8 @@ bool mlxbf_gige_handle_tx_complete(struct mlxbf_gige *priv)
 	 * to be supported, that is TX consumer index wrapped from 0xFFFF
 	 * to 0 while TX completion index is still < 0xFFFF.
 	 */
-	for (; priv->prev_tx_ci != tx_ci; priv->prev_tx_ci++) {
+	for (entry = 0; priv->prev_tx_ci != tx_ci && entry < priv->tx_q_entries;
+	     priv->prev_tx_ci++, entry++) {
 		tx_wqe_index = priv->prev_tx_ci % priv->tx_q_entries;
 		/* Each TX WQE is 16 bytes. The 8 MSB store the 2KB TX
 		 * buffer address and the 8 LSB contain information
@@ -152,18 +154,25 @@ bool mlxbf_gige_handle_tx_complete(struct mlxbf_gige *priv)
 		tx_wqe_addr = priv->tx_wqe_base +
 			       (tx_wqe_index * MLXBF_GIGE_TX_WQE_SZ_QWORDS);
 
-		stats->tx_packets++;
-		stats->tx_bytes += MLXBF_GIGE_TX_WQE_PKT_LEN(tx_wqe_addr);
-
-		dma_unmap_single(priv->dev, *tx_wqe_addr,
-				 priv->tx_skb[tx_wqe_index]->len, DMA_TO_DEVICE);
-		dev_consume_skb_any(priv->tx_skb[tx_wqe_index]);
-		priv->tx_skb[tx_wqe_index] = NULL;
+		if (priv->tx_skb[tx_wqe_index]) {
+			stats->tx_packets++;
+			stats->tx_bytes += MLXBF_GIGE_TX_WQE_PKT_LEN(tx_wqe_addr);
+			dma_unmap_single(priv->dev, *tx_wqe_addr,
+					 priv->tx_skb[tx_wqe_index]->len, DMA_TO_DEVICE);
+			dev_consume_skb_any(priv->tx_skb[tx_wqe_index]);
+			priv->tx_skb[tx_wqe_index] = NULL;
 
-		/* Ensure completion of updates across all cores */
-		mb();
+			/* Ensure completion of updates across all cores */
+			mb();
+		}
 	}
 
+	/* At this point the completion index should be equal to the
+	 * consumer index. If they aren't then the driver is out of sync
+	 * from the HW's state and needs to be adjusted.
+	 */
+	priv->prev_tx_ci = tx_ci;
+
 	/* Since the TX ring was likely just drained, check if TX queue
 	 * had previously been stopped and now that there are TX buffers
 	 * available the TX queue can be awakened.
-- 
2.34.1

