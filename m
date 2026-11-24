Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530875;
	b=x94G2PDZvM7C8+qvXg/1kJjVm4e8vzHPeDcW/6+5BOvPrJHLk8jtWun0zdnkqedg3coW
	 Q60gwcBLPw4YnEwDikjD7CfMUvw47Hi43dbwtJ6/FVA4UZeuLcNdJ/XfqqvV+0PVQk4m2
	 uv3oPh0isEDmiwfbcIP4olvJ/dvWMGDMztaa4xlstE1zcvgT2KWDAaXEvrWLSaZbT73LO
	 I3X0fXz2/trv9aePjDGQiy1Pg95vFjs4luQliQuueiFDpHRXgm7fBWnlGGnbdMwov3SxL
	 hXSS3uLn3kZdqiHMmiuDbrH7pAU0LAb5qLTGK4+vCYkkc3kLGw4JOi8ZsJBAW+5Hw/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530875;
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
	bh=dgqul2VKncwwt/1CjATiv/sYOCYzXbNsYCFjiCQvWds=;
	b=UqLXB5traPBBCzeqzNSpRzf9bKr9IXgIhzoGqZDFAAAu1jDVWn6jz2sM28E4l+bJqyLf
	 8JPJyjJxiptyHCF/Qo38e5Lm2wJj/qOUQKyxXJF4rWMZ6hScQtXydZle8j4VNF/7PQOe5
	 niQsybn/f9F2Hz5Jz5hTucUStXLeoy1aQO+6+SKSW5hAkDuw2EP+hajWKPkEvcDBT3T4O
	 Cmcgm2rFw2+FNvyhdZ3/hDC6KOxi3RH03RJ7VGf8RV5iawwaRXE1VlejZpRmb0ivrPyJr
	 R5xgxp5wqpdb35Bm436mWIVqM1xmDGaZdA8hbG3qydMcl2KrX8LGg+NQnzSuXCkKj/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P0DhtRYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.42
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71871606A31E;
	Tue, 24 Nov 2026 14:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71871606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P0DhtRYv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkYl8zDETjtLqJtzI2yzNNI5+gr8tGM903UWplIYhWHv78IbKoGcu5u4s/GlqJ8v16pO70e2aOSEQOG01+X6zAZ/2hnev/3hzcM/IDEotA/aCT6ErmJkat9D6OFiLVRpdOqrmtogQJ0zechV6ZTOJBxBKZBovjM+Iv1uqBbHXLO77CtWPmALMaBXyh19/263RVDxLl8vB+1h9zP8SZwB3OI5hOIjwvkJh1lORJQHy3SUpU19wPSSJeXuIkRvUvBie8QKdUZRCYhskmwxrF7Ub8yFmx6Wv6VMBsHACqcg9+Xz/c1HJ3TYfWTLgvSyf3xrQzh9LndswCOBcrlavfS+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgqul2VKncwwt/1CjATiv/sYOCYzXbNsYCFjiCQvWds=;
 b=ZdWejejq8ZdKL2npU0EsF/jEmePhxwSbCsJPnR4hFfqABRWadqpRbPSN1GnO9Jz0Oq3KdPI3xjK/xpxQAfhZhNuNmGV4mn0v4BVbDy0VYSWKGDn/qzhOq7FFsnkdq1HbLhBulBv8WWheQbqop7s1rjqyHIH6s2sfdZLraB0PXJz5VcLaVnfI4GLUcxYaSwGU+huoPTxQZs8q2Ie/m7i1KOiX/YEbDRFRZDWAZdHme8Tkb4rzAwOc4iviXC+BP+dmHGqZWqbwfJBe3n4i/H2uUUHcCoK5DccexjULeJy6zoVdGSi1h8EZPuAUBoprHvqkGqiSSYw2X5NLqrRumzUHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgqul2VKncwwt/1CjATiv/sYOCYzXbNsYCFjiCQvWds=;
 b=P0DhtRYvkVX55M1j8bSu+/a72+nz5mOJUU7Gm4P16EBfG4Vh+B6+dTaaUGMPq7StjoEURHSx9UX18nJxyIqIakzgdqBv4Sadj2msjO619EfUMmUvV2Y94OuIt2x7NBUfkVahJ8HjKgWSFRIi6b7ol07Lm1IRENs6Td4q7vu0aDPw6smfAAeN8RiPvun1lxPdY6fqeImJJUc0UNxQR9Pf7ee32AL2FD71cTQ0LAUI3NJiJZLUpTzm8NZvpCxdzPq3hbpFFjJnsrERM4Td8O7XMmfif/prRfWw6iykIhQ+KbLwhZexYt3WVuHCxD3PE1QWtGKzMWTqBkW/7O7FuyB+Og==
Received: from DS1PR04CA0001.namprd04.prod.outlook.com (2603:10b6:8:44f::8) by
 MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:34:25 +0000
Received: from DS2PEPF00007107.namprd05.prod.outlook.com
 (2603:10b6:8:44f:cafe::5d) by DS1PR04CA0001.outlook.office365.com
 (2603:10b6:8:44f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007107.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:04 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:01 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 2/7] net: lan743x: quiesce TX before freeing the rings
Date: Tue, 24 Nov 2026 09:33:17 -0500
Message-ID: <ed26c8911890c12bdcb76e153ba44e882bc5ff9e.1795027003.git.cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00007107:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb37ad6-cc23-4e6a-622a-08df4a380967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ePojEcRJpzdN8937pXtEfueRox+p0Ntsh2ec20abKwm7njMBi6x/KIE2bCMxpuXx26xh0SBkXOEDTZhF1fpcUwclOnYA8nMhYRMNvTOst1f9a+tcNtuXFVHAGxAOTY4vnsrBrleQA73kTiYryOlqGz8PJMPCY8jCI7llXev8PO4DZ2VGiA3IwSLcKi7SBIl2kLzlsggszeMeT3pt+YpDfUdKlcFUZc+7qJG5k1IgxSBLA08ZUXclf7OFFnUfM45c44Ao7L68la02h4TZQUie+gkH/nOPJogsXTRScFQS/Fv7UTYT8tNVmKtp859W3sA+Unjm440CSOmeOVD1NIQoMVT14fIB4ZvS9bxY7bqB22aEOtCNZQ0D+xdavKFqMIsNDSJ83bExN+xmt1OJIvPrrIxALmAoYKhPYN03KodvWPMLwhhdUSkCSIrfpKyJr6En9AC0iRb3e7M4afEeJK36EB0cjfLbmRZR1VorKQjAjmXbUmS2j17VkWKYj6gl4G7WcmO/9ekMwizG8W5lxfasPLOleKZHQwc00I7ExGkLVQTD0lGbcpHVOqZpDILdA/dopmLy9vAyKINZDxkk2wRjofEjU8Q4ZQvf4ylzOHevJd+cY/lokOBwxYi0Z40K1NXxw5SSVkWVa130txIi8raFbSavlIHmBIqwWsE0evymZJAC7OrQre6XuZ7OP4bqY58gdQpoWa/IwjIKQjA8l/QzIQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F0peJbWRp4748K2zr2V3KMiwQEjfEvktBpyemOEUBbr9z31N0zIUTN/uro1A0zAA6abZIZ4OYW1LBtHO1GFxXYvdefkJJbb+FRL5lzNi0eBfQjRhcGFws/7IDRKSWNPbuN03u1Nl4Hn4iIpokRc1AhTMPjcOsxFBA+QC/B6xZmIPfdWq0dFRkqlXBvd+BkU30soiMYbyeZnKfP7PlCccKHzhrQGw4I95+6/gll1hB/w7biZ4pk3DtdFxq/q4fYyBf4S9C0fpvoXB1+cRqM43t18hDjIdZfZkcD3OY5w6G1ewOR+4Q1nYsT3pdhlGd+WlaQZdsKmfFQiHCeXILr3cbjxVFgY8EoCjbHmpBwR3bjvxWWTIM19NC9BQ5uM0zcfmy25JGqYF+0Vg0UcaRNwzGnTsJjQsNOaGsWELgOzUq3ZBcyr0AZyauHrNqgDLWXna
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:24.4918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb37ad6-cc23-4e6a-622a-08df4a380967
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777

lan743x_pcidev_shutdown(), which suspend also uses, calls
netif_device_detach() and then lan743x_netdev_close() with the qdisc
still attached. Detaching only sets the queue stop bits. It does not wait
for an ndo_start_xmit() that is already running, and the TX NAPI poll
still wakes a stopped queue as soon as it has reclaimed descriptors. The
TX NAPI of a channel that has not been closed yet can therefore restart
its queue, and the stack then transmits on a ring that
lan743x_tx_close() is freeing.

Only wake a queue from TX NAPI while the device is present. In
lan743x_netdev_close(), wait for any NAPI poll that may have missed the
detach with synchronize_net(), then stop all queues with
netif_tx_disable(), which also waits for transmits in progress, before
closing the channels. For ndo_stop the qdisc is already deactivated, so
this only adds a grace period there.

Fixes: 23f0703c125b ("lan743x: Add main source files for new lan743x driver")
Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 92cdc13495fe..57d52930f89b 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2137,7 +2137,8 @@ static int lan743x_tx_napi_poll(struct napi_struct *napi, int weight)
 	/* clean up tx ring */
 	lan743x_tx_release_completed_descriptors(tx);
 	txq = netdev_get_tx_queue(adapter->netdev, tx->channel_number);
-	if (netif_tx_queue_stopped(txq)) {
+	if (netif_tx_queue_stopped(txq) &&
+	    netif_device_present(adapter->netdev)) {
 		if (tx->rqd_descriptors) {
 			if (tx->rqd_descriptors <=
 			    lan743x_tx_get_avail_desc(tx)) {
@@ -3374,6 +3375,9 @@ static int lan743x_netdev_close(struct net_device *netdev)
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 	int index;
 
+	synchronize_net();
+	netif_tx_disable(netdev);
+
 	for (index = 0; index < adapter->used_tx_channels; index++)
 		lan743x_tx_close(&adapter->tx[index]);
 
-- 
2.34.1

