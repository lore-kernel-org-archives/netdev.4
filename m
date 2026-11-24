Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530869;
	b=3LBtFMo5LtNdo7mo4xDg/ro0lsjrIsfFyv3aygaLbQM/05zAgLvdrwYVJ1SqQ9v3uROc
	 nV0wv8vg6qzqkkCfmUrCGtzBkZL8Zw4LwujDCeOuTRq19kQg4H45aeSK98S36rPCDlCnC
	 EFqCdM+dvdjNK6/QqdO9C+2U0ymjZKnwIsouGlCCHF2IXaLkBaJA88H1lLDHpplxZjWRU
	 9rPh5OgRSpjRBNPziXL7lfzmhTATSyDsiaOnktBE9a7w9ohXmkr0+4GQYiIZ4f0qUsFpD
	 +W53rF+iDGnJW9JNEwkzNZV21Tj0wWaQEStluaCMzEYGaDnk2fCqlJTNy4F9WnAZkTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530869;
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
	bh=aEKfVGxzjeI4yZyoRw6riuGRzhwqu3PEI0QNmd1q4Pw=;
	b=B+NVXtCndPD1mfjFfxPYc1sEdMc5zKfmjYDu0lhrtvzc/o2g0J6o9HWtWX7V/QcoYQNT
	 5oC82gHNrC4+ZtEuWWRHkP1sTFZ3TN/zHIt2gqMOeCGbMX6UkQAtTgTiLkPibPIjYcwNn
	 LIjw0N7+ULs2CjX1XqW9MezqfJfyAxvSErTIZmxvw/oY6ZF0ed2nx3QQX2N+l8Q/mWKCS
	 5ahGvgp5M3x4/wPs7bEejZ+v+/Wlbolqjj3l44Lvdz7p/krXnl+s00tpQUaE6wFE1Te2S
	 8Pq9GQ2UAmD9ANNqk6xAseU9f4PZ742qocwFaUkgYpdzBqimztBnD+mGHG/ygzgBaXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cg601hfa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163EA606A327;
	Tue, 24 Nov 2026 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163EA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cg601hfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdW/l2oiL4wHdjoac8mLdDL0JoaoprHlCjEbfU8Zk2wKlFLfiBmh3N90CrhRRA0dd37QuMKuMKbnBOOhSf87pLw1tFpMGxJfu7/Jtm00pldlck+MnKihVAjuVaZqXOkZsKYuxrwes64FJNwvGRApqav7gAXElvhevsEefGW3aAXD7qIYYTFVRSgvV2SvUOorw0UbUJPvULfFQ0bCQb7TO+f+E1abWtZV7bcUJ07qY0xPRH5KtO6Wn6+u0/BPNleQ7eFoSj6LWbDm/UYS8P7PLKudubq/uqCHHJ3+cf9L9701ilNXFZzalENABs+o1sxvP64pLVqBtp6lFw1+PI8pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEKfVGxzjeI4yZyoRw6riuGRzhwqu3PEI0QNmd1q4Pw=;
 b=aCrKCPpR3FEJTtvKG6oxUr3LcNeWNeC8XuKyfE3N2cmpOltjXVU3Z5jmO/ZCw+yk1fAEFr7QlOJBSJ8iNCD4cOPi6q7uPdpL9epSbIe/zi100N5c3wlBkPBjlLg9ZUZnGp15pXzmqoDAiWii3TPVGlHx/CjMShjXyTVwPK3biBs0XWZH9Y4IiXWFxUA3xsmySeqb28hpZuD4tVSAg/pAtJUDxqChOaq9Zwh+pEkD0UWMpQIqdFDrrxR29+zCGrT3fiCZnIyp+HwJkNqCFScY+Stk86FaV3vLfuuOBiruT+lqvTZ7JI0CbVndTKs7nhtl2I45YPvjpkvhPJeUNvO+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEKfVGxzjeI4yZyoRw6riuGRzhwqu3PEI0QNmd1q4Pw=;
 b=cg601hfayUZsg4OroA3kvIVc8SDDgjbB8UHhTPw9Ivz3R4HRKC/mR7FKYCQs9PDWEMGgxBjsyH9H+5k7Ss3PPKmT35FsAQmPFPE0gczZeYkC+9yWmg+ngTKu0FeY9yd9clpmfv2Lv3TcW0fcj88zjKkhQkBulAn7wPAq5wQGBhITdWocTjAZvIqyF+Qwd00vrhdtLckaBUNbk0nf40vSBREoIn03kNCCMu7OIiS4LAAlM2X4deL4yYyuCL7wM+QCUd7FG5As9UH+kd/C9nAlpwlK7dIukiSfxBXJZfNYTPj5ozxjtuDhKczuSLvzHEwjP0d9KE1rKXgi5SREoRm9ug==
Received: from CH5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:1f4::21)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 14:34:22 +0000
Received: from DS2PEPF00007105.namprd05.prod.outlook.com
 (2603:10b6:610:1f4:cafe::50) by CH5PR04CA0020.outlook.office365.com
 (2603:10b6:610:1f4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007105.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:02 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:33:59 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 1/7] net: lan743x: check DMA channel stop and reset results
Date: Tue, 24 Nov 2026 09:33:16 -0500
Message-ID: <b1dc6a8037ab596053cc60c065a9b447982118df.1795027003.git.cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00007105:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc61928-016c-494f-90c6-08df4a3807c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|10067099003|56012099006|11063799006|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4StK78S4wigNkR/vQyj9VhNizFhsNoTDz8ODIpGmF+LTgQy4mW+qTkqO1SCWELTdIF56i5QFqoPvru3ZtmRzTIoTaiaH6G1G9Su8LHzv2bTDbZBV2K1pfZzyXBt2FxHDNIqUcXZfQ14SDMrPED3UlzFBsiJaDJWFaJ9zpnUANnNZGePiIT5UphwtWf1UC5lpSWOebKKz87rBCS5f/4o0BKdF0WZJ7/LARZltZbfmQDibxG6QfPvzo1yYQVpo27PTrEqiZt2xCEcm8/NdznlKfz+QknY+ZK+F/jiwtUPQOADSF/zPFIgoNssnkO6S0WXuKfLWQJKZmQGKFwHnfnnscbJwCWwZzeBIrNjpK39ncVJLwdeCmz8pmQ/k6RT1QOZbZ/USU4MuwC6ACttHs6oJi3vbo6GDVppK5aO+kAV+SwU90yGUzQtb7faI5xRUbl/+WrZ2yOrXV49r81lHHqCXFzfmfUnkb/H5VZ45TtYv0yqbnXTnRgbnGje1xhniZurvgpClUtlQDsFgu9E8D/lJTH1FOdXgi6iPRsdzHD0sGg8+9q6fx8liXpdJRIvl2kv7HgwPjDQv5dOWjdPa0Y8uPiwWPns9z8OqOMvmqAAQIRbZBDpNDIb7+QeJH6Q3MfvdW9VhIwNMG03Hu+WwQ2wS0E76rH2mDiHAQhFoJxiPSNwkS9RvRLfkq7Bre/JaY4N0a292knmSZwMuWImOg8U7kw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kcl2DlReZhnbFn1a3PY7fzSfgl23UEsJXzFcCycDWjTfMUNBAo9E2XJEP2xFP7OW91OWIFKL9H1CJw4QY3F9H1gqb0HWJhBiCnoqcTA/5o5eYkIFNm1xBKgR0CzZiDz+EVzlSX+KjEf/6AcJR/NIDxke48eeJ7MiPdywGXjPt6h8vwbjJ/7m3y3xYJY9VsOq8pVbO4qVGwDkGNhb62jwovCSn2veXQfqTi8XtZqH4/cq0x7sQExkBsPWJHju2dEC7QQ9D1dGF5SVK7bbJhSjV+RlUxJc/yAgIEgb/a/suBIIF3k1NOzj3nn/pPhfQG41mtgXGzxXzof6hAi7T/+Or6O4YxT/Fp9tfxwI/yjWSWRmrK1yKMxM5zEdY1m37oftCcw4S4SIKA5WtJZi0CJS5DPx2jKcn5xXX8wzHV+idS1Gy69V7GPpwAQ+55ZNn8Zt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:21.7606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc61928-016c-494f-90c6-08df4a3807c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822

lan743x_tx_close() and lan743x_rx_close() ask the DMA controller to stop
the channel and wait for it, but ignore the result. If the channel is
still stop-pending when the wait gives up, the descriptor ring, the head
write-back buffer and the packet buffers are unmapped and freed while
the channel may still be fetching from or writing to them.

A TX channel has been seen to stop making progress, with its head index
no longer advancing while DMAC_CMD still reports it as started. A
channel in that state may not honour the stop request either, and
closing the interface would then free memory the engine can still
access.

If a channel is still stop-pending after the wait, or still reads as
started, issue a channel soft reset and wait for it before anything is
freed, and log when that happens. For RX the FIFO is already disabled at
that point. For TX the reset is issued after the TX FIFO has been
disabled, since the TX channel should only be reset once its FIFO is
stopped.

Use the same helpers for the channel resets that lan743x_tx_open() and
lan743x_rx_open() already open-code. If the channel or TX FIFO reset
times out there, log it and fail the open instead of starting a channel
that never came out of reset.

Fixes: 23f0703c125b ("lan743x: Add main source files for new lan743x driver")
Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 134 ++++++++++++++----
 1 file changed, 107 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 82d3ec20ba25..92cdc13495fe 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -1584,6 +1584,21 @@ static int lan743x_dmac_tx_wait_till_stopped(struct lan743x_adapter *adapter,
 	return result;
 }
 
+static int lan743x_dmac_tx_reset(struct lan743x_adapter *adapter,
+				 int tx_channel)
+{
+	int ret;
+
+	lan743x_csr_write(adapter, DMAC_CMD, DMAC_CMD_TX_SWR_(tx_channel));
+	ret = lan743x_csr_wait_for_bit(adapter, DMAC_CMD,
+				       DMAC_CMD_TX_SWR_(tx_channel),
+				       0, 1000, 20000, 100);
+	if (ret)
+		netdev_err(adapter->netdev,
+			   "TX channel %d reset timed out\n", tx_channel);
+	return ret;
+}
+
 static int lan743x_dmac_rx_get_state(struct lan743x_adapter *adapter,
 				     int rx_channel)
 {
@@ -1613,6 +1628,21 @@ static int lan743x_dmac_rx_wait_till_stopped(struct lan743x_adapter *adapter,
 	return result;
 }
 
+static int lan743x_dmac_rx_reset(struct lan743x_adapter *adapter,
+				 int rx_channel)
+{
+	int ret;
+
+	lan743x_csr_write(adapter, DMAC_CMD, DMAC_CMD_RX_SWR_(rx_channel));
+	ret = lan743x_csr_wait_for_bit(adapter, DMAC_CMD,
+				       DMAC_CMD_RX_SWR_(rx_channel),
+				       0, 1000, 20000, 100);
+	if (ret)
+		netdev_err(adapter->netdev,
+			   "RX channel %d reset timed out\n", rx_channel);
+	return ret;
+}
+
 static void lan743x_tx_release_desc(struct lan743x_tx *tx,
 				    int descriptor_index, bool cleanup)
 {
@@ -2218,14 +2248,63 @@ static int lan743x_tx_ring_init(struct lan743x_tx *tx)
 	return ret;
 }
 
+static int lan743x_tx_fifo_enable(struct lan743x_tx *tx)
+{
+	struct lan743x_adapter *adapter = tx->adapter;
+	int ret;
+
+	/* initialize fifo */
+	lan743x_csr_write(adapter, FCT_TX_CTL,
+			  FCT_TX_CTL_RESET_(tx->channel_number));
+	ret = lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
+				       FCT_TX_CTL_RESET_(tx->channel_number),
+				       0, 1000, 20000, 100);
+	if (ret) {
+		netdev_err(adapter->netdev,
+			   "TX channel %d FIFO reset timed out\n",
+			   tx->channel_number);
+		return ret;
+	}
+
+	/* enable fifo */
+	lan743x_csr_write(adapter, FCT_TX_CTL,
+			  FCT_TX_CTL_EN_(tx->channel_number));
+	return 0;
+}
+
+static int lan743x_tx_fifo_disable(struct lan743x_tx *tx)
+{
+	struct lan743x_adapter *adapter = tx->adapter;
+	int ret;
+
+	lan743x_csr_write(adapter, FCT_TX_CTL,
+			  FCT_TX_CTL_DIS_(tx->channel_number));
+	ret = lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
+				       FCT_TX_CTL_EN_(tx->channel_number),
+				       0, 1000, 20000, 100);
+	if (ret)
+		netdev_err(adapter->netdev,
+			   "TX channel %d FIFO disable timed out\n",
+			   tx->channel_number);
+	return ret;
+}
+
 static void lan743x_tx_close(struct lan743x_tx *tx)
 {
 	struct lan743x_adapter *adapter = tx->adapter;
+	bool stop_failed = false;
+	int ret;
 
 	lan743x_csr_write(adapter,
 			  DMAC_CMD,
 			  DMAC_CMD_STOP_T_(tx->channel_number));
-	lan743x_dmac_tx_wait_till_stopped(adapter, tx->channel_number);
+	ret = lan743x_dmac_tx_wait_till_stopped(adapter, tx->channel_number);
+	if (ret < 0 || ret == DMAC_CHANNEL_STATE_STARTED) {
+		stop_failed = true;
+		netdev_warn(adapter->netdev,
+			    "TX channel %d failed to stop, resetting it\n",
+			    tx->channel_number);
+	}
 
 	lan743x_csr_write(adapter,
 			  DMAC_INT_EN_CLR,
@@ -2235,11 +2314,9 @@ static void lan743x_tx_close(struct lan743x_tx *tx)
 	napi_disable(&tx->napi);
 	netif_napi_del(&tx->napi);
 
-	lan743x_csr_write(adapter, FCT_TX_CTL,
-			  FCT_TX_CTL_DIS_(tx->channel_number));
-	lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
-				 FCT_TX_CTL_EN_(tx->channel_number),
-				 0, 1000, 20000, 100);
+	lan743x_tx_fifo_disable(tx);
+	if (stop_failed)
+		lan743x_dmac_tx_reset(adapter, tx->channel_number);
 
 	lan743x_tx_release_all_descriptors(tx);
 
@@ -2259,23 +2336,14 @@ static int lan743x_tx_open(struct lan743x_tx *tx)
 	if (ret)
 		return ret;
 
-	/* initialize fifo */
-	lan743x_csr_write(adapter, FCT_TX_CTL,
-			  FCT_TX_CTL_RESET_(tx->channel_number));
-	lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
-				 FCT_TX_CTL_RESET_(tx->channel_number),
-				 0, 1000, 20000, 100);
-
-	/* enable fifo */
-	lan743x_csr_write(adapter, FCT_TX_CTL,
-			  FCT_TX_CTL_EN_(tx->channel_number));
+	ret = lan743x_tx_fifo_enable(tx);
+	if (ret)
+		goto ring_cleanup;
 
 	/* reset tx channel */
-	lan743x_csr_write(adapter, DMAC_CMD,
-			  DMAC_CMD_TX_SWR_(tx->channel_number));
-	lan743x_csr_wait_for_bit(adapter, DMAC_CMD,
-				 DMAC_CMD_TX_SWR_(tx->channel_number),
-				 0, 1000, 20000, 100);
+	ret = lan743x_dmac_tx_reset(adapter, tx->channel_number);
+	if (ret)
+		goto fifo_disable;
 
 	/* Write TX_BASE_ADDR */
 	lan743x_csr_write(adapter,
@@ -2347,6 +2415,13 @@ static int lan743x_tx_open(struct lan743x_tx *tx)
 	lan743x_csr_write(adapter, DMAC_CMD,
 			  DMAC_CMD_START_T_(tx->channel_number));
 	return 0;
+
+fifo_disable:
+	lan743x_tx_fifo_disable(tx);
+
+ring_cleanup:
+	lan743x_tx_ring_cleanup(tx);
+	return ret;
 }
 
 static int lan743x_rx_next_index(struct lan743x_rx *rx, int index)
@@ -2775,6 +2850,7 @@ static int lan743x_rx_ring_init(struct lan743x_rx *rx)
 static void lan743x_rx_close(struct lan743x_rx *rx)
 {
 	struct lan743x_adapter *adapter = rx->adapter;
+	int ret;
 
 	lan743x_csr_write(adapter, FCT_RX_CTL,
 			  FCT_RX_CTL_DIS_(rx->channel_number));
@@ -2784,7 +2860,13 @@ static void lan743x_rx_close(struct lan743x_rx *rx)
 
 	lan743x_csr_write(adapter, DMAC_CMD,
 			  DMAC_CMD_STOP_R_(rx->channel_number));
-	lan743x_dmac_rx_wait_till_stopped(adapter, rx->channel_number);
+	ret = lan743x_dmac_rx_wait_till_stopped(adapter, rx->channel_number);
+	if (ret < 0 || ret == DMAC_CHANNEL_STATE_STARTED) {
+		netdev_warn(adapter->netdev,
+			    "RX channel %d failed to stop, resetting it\n",
+			    rx->channel_number);
+		lan743x_dmac_rx_reset(adapter, rx->channel_number);
+	}
 
 	lan743x_csr_write(adapter, DMAC_INT_EN_CLR,
 			  DMAC_INT_BIT_RXFRM_(rx->channel_number));
@@ -2810,11 +2892,9 @@ static int lan743x_rx_open(struct lan743x_rx *rx)
 
 	netif_napi_add(adapter->netdev, &rx->napi, lan743x_rx_napi_poll);
 
-	lan743x_csr_write(adapter, DMAC_CMD,
-			  DMAC_CMD_RX_SWR_(rx->channel_number));
-	lan743x_csr_wait_for_bit(adapter, DMAC_CMD,
-				 DMAC_CMD_RX_SWR_(rx->channel_number),
-				 0, 1000, 20000, 100);
+	ret = lan743x_dmac_rx_reset(adapter, rx->channel_number);
+	if (ret)
+		goto napi_delete;
 
 	/* set ring base address */
 	lan743x_csr_write(adapter,
-- 
2.34.1

