Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530885;
	b=SJgwmC1+X1HJ31rNQ2kerMxr91EHOciQSobgAwUyuuw4Ofj6T85zY8L7Kg3jgaObQHwv
	 bWrAZqxK6dwD1bY41IaOSoVMyTo1RtKq0l+66HRNVEZ/Ui5kWdJCyCwryKovHQkZ2VVOp
	 0R4MU8jD+jMubRIXvLB8tWfonUVOeWJwHwpEVTv7JwDiSSXvxW1ym0XJFWaQU6dWWkwW6
	 l/R553KecqTRc5ZRdakjdhZUp2Gp1/UIDOdLHPiqJE45MliBawlr5XAIrzbiFzOE9a45M
	 CR1WU8Y45Y2sgJnvnUKrYUdTr1gdnzrionHUXNY/KquszlRc3eEuqaSkZ9Qr6us544w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530885;
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
	bh=r8IXiFqBz2Zfa336WIVsiraH4aXPt2PJh8JmO/MZ3MM=;
	b=FjeUPyz6FkBYVx+cynu0S0iXTDnVHwAYWDh2to8KSY2iNA/p4Fzrnt6pKJy88Vi8lhUD
	 p9HKXla+BVWiq7IbyQTl0/kRmWKj6JqLCnCTJ4N+4h2gcniq5IUUX+L1/AxHUldBHILnm
	 TgC2ckkoDsktGDIsDVn2QDJZ6QIUCX/ZPLUy2KLZ7hNp3Z1TBHu1XDFtbXT98Wn0vahgg
	 X+VTKezEQ1IbARsVr1hbhoF25azMhtdveUsFKXHITfRzd0k35O9XbyYzQndRA5AvqueLj
	 Na+4oEowPSCeF2cNsaupicEZmh2u42rStMhgpmSDGbJPjG/8Ly96uCL+vpPAGRqyDpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="F04w1m/c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.8
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54885606A68E;
	Tue, 24 Nov 2026 14:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54885606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F04w1m/c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/iX13skWaIBtIPuthnIllSzaRiCaeiBbiRW6UtBfa7IZhkuiz0fRruDkQBgeu551+ouWmKVWzQzvIcjWMKfPrKfredVxb+DqWKIQRuGNmMFd7UdbE2DBwybYsCBkeoHWQmSkAgqkfZavlgCXjo7+Yody9cN3wwqGiES+ggbqqF+sxBdBsEq/L2Ei8fBABwyPSVs5zLoe76salSxVVTl51l4F/oeb4RgsgapOP/bQhvbJ3OMNcBn7aMBcmjyEi2BD6p0u2CbtNA9Xf8Iay2mZXAfy1P7zaFvocTtQ26Zl+r448Dfw8GKVmgE0acTbM8/iIlUcqD2rQqlWjBbdBmq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8IXiFqBz2Zfa336WIVsiraH4aXPt2PJh8JmO/MZ3MM=;
 b=pRYd03A/qaS9qYrN39RpLgfJB0fNq1i/pxf+bpivqABAZtqiL6TGRJii/6ZK4PmVEzGYTfzV2Ss92DjFneN0N8JJOjpITPVHWWJuSqQuCUzbZ+7jN2C9LuoAzpKzZPchrqNI9hWKCL6ZJybMYIDEYycqgNmgsht66xG9pOb4UuqfLjnQvpDSP86xCl2dMEkqMqotB1DOlQKO5ToykfCvcsYyTiiiqydayrsyQPtjP2aX6wJBliULomyzXFpQTq6SY0XAvtivy/v7ts+A3K0+lVgk7NzM+LRkL6Y0r4GXcGJj4tZjFSUTIDBqq4g5MUMZQXEGqymaXfQEto0WvWhVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8IXiFqBz2Zfa336WIVsiraH4aXPt2PJh8JmO/MZ3MM=;
 b=F04w1m/cD4ZDp3FEUTq5rLIH6rSNcYMJFeaB2QEQ24BhnfB+b6DW6PNrYshbWN3dpr+NmSOqYIRyVeXP37a+TmQMbLpxEvI6966jnB8jArBRkvQrbRc1IG+YtAwnxFicXOKOrxAe3VEUl75IHvuTLq3+y4U1deBJhR4f/LWME58yTj8jGoAqzgfXUYJL6CCQg5GCB7kBEpN2u1+IVZhH1yLxmzVkvGF5foIJGZtamMH3+xqdDEfosVkdz3qsv4dWxo6IH0qY4Owt6thhX2GjD+YnL8VZdurmdowWuHBbDlEcaF9hQ006ndo6sU2/08+BYzhENw23FNPeuZqlavHRmA==
Received: from DS1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::16) by
 DS6PR12MB777192.namprd12.prod.outlook.com (2603:10b6:8:411::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 14:34:38 +0000
Received: from DS2PEPF00007108.namprd05.prod.outlook.com
 (2603:10b6:8:455:cafe::8b) by DS1P220CA0010.outlook.office365.com
 (2603:10b6:8:455::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007108.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:14 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:12 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 7/7] net: lan743x: add byte queue limits support
Date: Tue, 24 Nov 2026 09:33:22 -0500
Message-ID: <1f1e4196f572d898a97ec231da6640b99889e3a3.1795027003.git.cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795027003.git.cbabroski@nvidia.com>
References: <cover.1795027003.git.cbabroski@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00007108:EE_|DS6PR12MB777192:EE_
X-MS-Office365-Filtering-Correlation-Id: abb16d84-eda0-4a08-1a45-08df4a3811b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|22082099003|18002099003|261026140227099003|56012099006|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261026121527099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	k+aVdNZs7cqxgJJy6fqPwGhTj5n5IHyTxrnbzl4b7ItisRPsnjQfKKl75CAbADEbjwQdhiukjKJUg4SDWkuyjDwyT3fWSHzRArLZXlAEXxlXlDKHRnfvW6t2E2+h7jDchqk/2H6x7Rotax/ios37ZTrlpJKmJAEWDr1VCKrvtS7MaKbo60nPa2zs/uWwLhSh+Z+UCufEqX5sJPjpXUsYayAMyKm9ZIDfiJEfoe6HN7WFTMj7tMpRlrDWQMvSCoNzAWna8sXlR7mTQxLZqheSLOasUk/0VyxqXvQeqmu2cmxoZCnFDuj+jPTa4qyIPjnXSXNAGJP//59F6yRd4uxVPT/awAR/SOUgZqgL3VnLRiA7MwQW436sClQHAMxFJqOdcM7v+0UIIkBEZxzZyLH7oYTyfAN1j1i1HbXBUxCc3/CaIUNcdZ97AnF2Z3Uu3N0kO1tJBwTpISpQmBXTczMhuGlVC/FSMpHjpCPSIcKTAxEEAhnL7GjZbRaNnVW+s5KXA2UwwbEMrE4FF/97ryRAEXJ3cx6v/kn3R2lhfh2mRkj7O7R4XWK5sPIBF1oX3pdJHhdCjMgUD3j/g90O9bDKMwEKU/70db+Qn0i8pOftNvtL2FowLm8HEIcXzjlWhypfxCWKeaB892wd9D2Uvqs6MnZQmaCvweYuXG71Cy0PsGNeGiCtOwPvc22N50RT0V6c73bBB96HdSGJLr5EGzkKWA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(261026140227099003)(56012099006)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BtQEMTAMAsx/O3uHp1efCoj18TPXt6qTvuRqhvu9OmaNMtbn+WylRld4HEUJKp0WN/oQWM9OkfbDR4UE3V/ak/cKVHEMpm04dXTv6yR778FKIbkHpopz2Om1kU/Wew0LSiYDdApmmVm43JpmAAslZqPEre40HJDfUgdegPdrvrHIlrm2Y7CCZGM/GCkdP83Yq1nqbmciPCSj5zV1PFM7NR+5O7MaDsg4JEQRh/6/42H3nH3hzCKUVwsiy5/9WLTevn7iqHFIFBPC7jHQJBL7gbO+QsrzT6RcqtQayFYXRyhe5q1Onxw/7HzjitKC693jve++LKZ6q+fjsJf/uTExRtnRlZBt8Z0yq86f/xbJWbavaSLrTEkqSV42K2EY3oeSEQImFDOyQkOYN/znli3UVgk7nB9UL3L1pZE9HE7Roto+v4faIC31zdMF/xmSxsDw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:38.4166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb16d84-eda0-4a08-1a45-08df4a3811b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB777192

Report the bytes queued to and completed by each TX ring to BQL.

Besides limiting how much data sits in the TX ring, this lets the stack
stop a queue once the bytes in flight exceed the BQL limit. Without it,
a queue is only stopped when its 128 entry ring is full, and the TX
watchdog only looks at stopped queues. With light traffic it can take
tens of seconds after a TX hang to fill the ring, before the watchdog
timeout even starts counting.

lan743x_tx_close() frees pending descriptors without completing them,
so reset the BQL state there.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 3f129a22921e..29c868263d2f 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -1720,10 +1720,23 @@ static int lan743x_tx_next_index(struct lan743x_tx *tx, int index)
 
 static void lan743x_tx_release_completed_descriptors(struct lan743x_tx *tx)
 {
+	struct lan743x_tx_buffer_info *buffer_info;
+	unsigned int bytes = 0;
+	unsigned int pkts = 0;
+
 	while (le32_to_cpu(*tx->head_cpu_ptr) != (tx->last_head)) {
+		buffer_info = &tx->buffer_info[tx->last_head];
+		if (buffer_info->skb) {
+			bytes += buffer_info->skb->len;
+			pkts++;
+		}
 		lan743x_tx_release_desc(tx, tx->last_head, false);
 		tx->last_head = lan743x_tx_next_index(tx, tx->last_head);
 	}
+
+	netdev_tx_completed_queue(netdev_get_tx_queue(tx->adapter->netdev,
+						      tx->channel_number),
+				  pkts, bytes);
 }
 
 static void lan743x_tx_release_all_descriptors(struct lan743x_tx *tx)
@@ -2015,6 +2028,10 @@ static void lan743x_tx_frame_end(struct lan743x_tx *tx,
 	if (ignore_sync)
 		buffer_info->flags |= TX_BUFFER_INFO_FLAG_IGNORE_SYNC;
 
+	netdev_tx_sent_queue(netdev_get_tx_queue(adapter->netdev,
+						 tx->channel_number),
+			     skb->len);
+
 	tx_descriptor = &tx->ring_cpu_ptr[tx->frame_tail];
 	tx_descriptor->data0 = cpu_to_le32(tx->frame_data0);
 	tx->frame_tail = lan743x_tx_next_index(tx, tx->frame_tail);
@@ -2324,6 +2341,8 @@ static void lan743x_tx_close(struct lan743x_tx *tx)
 		lan743x_dmac_tx_reset(adapter, tx->channel_number);
 
 	lan743x_tx_release_all_descriptors(tx);
+	netdev_tx_reset_queue(netdev_get_tx_queue(adapter->netdev,
+						  tx->channel_number));
 
 	tx->rqd_descriptors = 0;
 
-- 
2.34.1

