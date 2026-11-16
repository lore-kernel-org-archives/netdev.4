Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824390;
	b=LUY+nrpcsBuyM5up0sl9Qa3z52XXsMd94i/cfr6ByhgpxOMrd8MrCu5HWE5Iwh89Fgg+
	 EpCxdZm2qctpGoxmmog9xQqvp5e4879keBrIa3tLNT9XpFuBlVhRDu9BrBvSZdXLbuxSN
	 pXS6d2YcYEP6+HnWCtPxO31N1gw3/etzSoAxel2YyEZGwFkivmN90v63O40iNgYT6BU4i
	 M0ziXSp5CmrfcUhvt+2WI7azOhnp8D5L1KsmHQQvYpGJxm61H2OOVvANTJReegCCyy/ZB
	 AfJD2b5FPoaTsdhMr730IIcCu69wTC6IPWW7zTJvAM3GcM6ZNDWK3GJjrHtwl6CtBHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824390;
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
	bh=8NGfHLX2iJUfkYudYzg8NfsnYfWRgwYmGCT5GLEO60I=;
	b=Jb5KQgQ82tpdF34WL4T7CKUjyLSyeJB4Ug7K7YnsS0fIrpAsd6Up6Bf/oVoxuhB40Rx2
	 IKkmEdyBE1CZ7XIY9jiGVHg2tPGtfuUOaPkGHc57QrHDC6CQevU2QS6npYZT/dVj7U2xR
	 UkNxdXl46nDtbidL1AWr5NUXhDPG+Ek70mFY8JSK3GLDpc1jHZ3VmL52XRFBIbz0yiAUI
	 U+65E7zdtMimqKFpDGqM6wBflw4Nhx/V3Q0JalMaUvkHm/9FfymS+Z/S+ZlmpznciSPQg
	 YoMbB8PgVPOQGmzD/WMApwe/ap08anBTZD8AVWkIpy3Tq1OuiCqxo028NAgKvYE2phQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZsJuvnql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.23
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097BE606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZsJuvnql
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj55COCoQ9Yj/c1qxkt4OmX1EDvt9bTIoaK5DBa9rmWItV+SInTBqVJoMp8wI8iTVEQFI4Jp7tGOcKCMCbWpmrROj3MiL9Q35OgsGMpuy8OeVGAiL46xHcmQAfopPQ8fJcsmuE6GE06Aoir05jMc4BVYnS3kMe25RSHIKgnPj5Riq8R9mhi77xMdl5aXH946xxoPYHdRFeKPn22AZdY/b6M5xE0QDqJOdSQBA75E0gaXLFjTLh/H4ObStFIFUYyXEmXKgD9Kjlq2IZpccQ/CjrXqNithrmdGJw64yQTMEYhdzfDCf+EAgBiT6XRQOj/Td+3vLMkvjRgS0xJvTVnYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NGfHLX2iJUfkYudYzg8NfsnYfWRgwYmGCT5GLEO60I=;
 b=EBHkf0tbFzHA6JErAkI8UAeljl3v/2tVGpaLzfQs1ONvtFO1XHrcNe/ECpPARV909jOjMuKuEF50lD4Q4kITeOJuBQzo/jnZJjo8d3PeRdtGNIwdIIdujHM4MjvKn5/NodBCZk8iAugqLImtDgLLotr/cCv1Be6iRQyIERQou/+Bc8ptmNs1sytH2Gl7K4V2Guwc0TVSHgkF4HwkUKU69xfoN5m6wdq2as6bIAF4dFkKr47ivqwlRmN24mi3Ti8DKgBXkHYObPVNBq1i2rUMaM9PHBnqahxLXD2oUXYKzxdxsj4tJ5wFKfdmjnJuG2eAcRbxmAbq0YQ2otUwEhiwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NGfHLX2iJUfkYudYzg8NfsnYfWRgwYmGCT5GLEO60I=;
 b=ZsJuvnqltstwCfNULmmK5PvV2oEIu/LqhXqWLFpcARODOi4jrTqka4rcCHKjJHPFW5LzkC+cbbgtWsMV2YBDGA8RNfzfBaSIFwaP3/h2MbXCOVRIA42a5PhuTiKfp7dfGxRQ3G1cs0ve67z5X9e8Y9lBcEEbmbNJFjGPrdIpYjPh/PTS3tKroliaM2FjwJo1MZV3J+ialGLkg9wu5IlhmprDxOd4QkX3qW9auwDhnrgExMA+2jqb96gf1qMol3xyTKDmu1U0V95GxIUoGrLdY6rgkZQKXp0VPXIp+28isgHncFm9ZH/myKqWFpscgS4hsy1ASrdEg4zWoq0Kq/wDKw==
Received: from DS7PR03CA0322.namprd03.prod.outlook.com (2603:10b6:8:2b::29) by
 LVUPR12MB999159.namprd12.prod.outlook.com (2603:10b6:408:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:17:43 +0000
Received: from CY5PEPF00000E74.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::8d) by DS7PR03CA0322.outlook.office365.com
 (2603:10b6:8:2b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:17:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY5PEPF00000E74.mail.protection.outlook.com (10.167.247.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 10:17:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 02:17:29 -0800
Received: from tuxedo.docsis.vodafone.cz (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 02:17:24 -0800
From: Petr Machata <petrm@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>, Myeonghun Pak <mhun512@gmail.com>, Ijae Kim
	<ae878000@gmail.com>, Jiale Yao <yaojiale02@163.com>
Subject: [PATCH net-next 2/2] mlxsw: pci: Fix teardown order of CQ NAPI instances
Date: Mon, 16 Nov 2026 11:16:47 +0100
Message-ID: <3a1a078f21028851b04ba4987fae490362b59cd4.1794823524.git.petrm@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794823524.git.petrm@nvidia.com>
References: <cover.1794823524.git.petrm@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E74:EE_|LVUPR12MB999159:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8438d6-e071-4710-e4c9-08df43cada27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|5023799004|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	9SYZWoJIvyKNqOFEO6K23vg7+fpughREzhXAsDeAYQ+UUEXf5z7o7D/HaxJjnOESjgQch8vS3YLbPmi1r7vSL2URcguhGzl2FvONKGnroJzNhJq6Q6LiKVHg2cpOd3cB0KSbp4r0XeEBJrW6OZYij91bGEc/DgQkP9JS6LyTG0kMjAR+zx/DrKyA0smMQJLQNWHhgeVUWQLa4wIL1Ev5Iami+bj35w9YcDRY9Bf6LrMJsQk5OtGeachZbyvp+CwhvDF5YqX79ebf8Ee7ed+X55KaRrUGN8sAeRbKu3RELfilzSdWTMqtOV3U6Fj6DU0V0BnEG0kymXjnijQ+jHt/Apvh7cWsSFY5MObazui0Y6B7U6rxPaPe/uEFgQMCcdUTLLAruKlemYS9MlajUPAIrtRjEXO7RH1Mhdl4QlMt2MHwk2UG9dcQHWtc9NL//htYuwEhxcTvCzJ3C2YB+/2R8LPFKmHsMmrIzgIHD+iVHKw80s+7S4V8WHybWDvaJSTM2GzTKqRDxmX4Vl1T1h2Z0dXnkMHPX6DyXBmoq2SwYA7Q+X+FHDpiYXNaqvbSbDxfi3GZx5Mnrn+j+Dia/zyrlChnird/2IO6nCVTT40gtWWq3W6kxMxWjZLC0DQxzs1rH9F5NxkLW4G9KuZOtBj8eWFzDcWw9utozTtOmCtvUjg/D2fsU9tyLdvFET8v9yCjeu9OX6CNA9ErfVgYyGxFbw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	snzu2bzJsIcwyw9KSedUV8YyWvu9dk5YrGB73mVQzfjNFgIWfsVrbtJ4JPzLJdxvWoKxnAvJTS+0y1yC2KP+nsSzMYjZvVC1wEDjY2u+RgOjAfjDnUBJM/Czk+bZsWMRDqylr52eGVjPCPdyifIfDYKJAmUB9ERMOJONNO8QV+zkNvrG/LHfR+PhC6K+vxWNaazoZtjwG162O6ga3qasn2Kpub6XkUdcevbNtAUU31G9Rt/ksq03EJi0f4yNmbgvmIVVKfWmuO1eiI0o7FO4T+y41AaOoacCypUF4EEi5CqES64zlpGfczYQB/7G32NPVUpwg0rMDUHyEZqybzfcCDs4gFIWn++zrH+n1A7dHC61A3QW5NEX/SJbRbNBh010hgoRh0dNj2odyxAp9JVjd5k1ZDpo+knTxDuxI3+yMl3z7tn4/UrOIsS4uLNTkxDr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:17:43.1446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8438d6-e071-4710-e4c9-08df43cada27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999159

In his report (see the link below), Myeonghun Pak <mhun512@gmail.com>
writes:

> mlxsw_pci_eq_irq_handler() schedules the EQ tasklet. The tasklet reads
> the EQ ring and schedules CQ NAPI instances. The CQ poll callbacks, in
> turn, dereference the RDQ or SDQ associated with the CQ.
>
> mlxsw_pci_fini() unregisters the IRQ and immediately tears down the
> asynchronous queues in RDQ, SDQ, CQ, EQ order. free_irq() waits for IRQ
> handlers, but not for a tasklet already scheduled by one. In addition,
> mlxsw_pci_cq_fini() disables each CQ NAPI only after all RDQs and SDQs
> have been freed. A pending tasklet or NAPI poll can therefore access
> freed queue storage.

The previous patch folded the tasklet into the IRQ handler, which takes
care of the first half of the problem: free_irq() in mlxsw_pci_fini() now
guarantees that nothing schedules CQ NAPI instances anymore. The second
half remains. A NAPI poll that was scheduled right before free_irq(), or
is currently running, can still dereference the RDQ or SDQ of its CQ, which
mlxsw_pci_aqs_fini() frees before the CQ, and where napi_disable() is
currently called.

In this patch, introduce a process-related duals to init / fini per-queue
callbacks: start and stop. Only CQ needs them for now, to manage the NAPI
instances. Invoke them at the end of mlxsw_pci_aqs_init() and at the
beginning of mlxsw_pci_aqs_fini(), respectively, so that NAPI is enabled
only once all queues are set up, and disabled before any of them is
destroyed. This also keeps napi_enable() and napi_disable() paired on error
paths of mlxsw_pci_aqs_init().

In his report, Myeonghun Pak notes that the issue was originally discovered
by static analysis.

Cc: Myeonghun Pak <mhun512@gmail.com>
Cc: Ijae Kim <ae878000@gmail.com>
Cc: Jiale Yao <yaojiale02@163.com>

Reported-by: Myeonghun Pak <mhun512@gmail.com>
Link: https://lore.kernel.org/netdev/20260721125753.35944-1-mhun512@gmail.com/
Reported-by: Jiale Yao <yaojiale02@163.com>
Link: https://lore.kernel.org/netdev/20261018040653.534066-1-yaojiale02@163.com/
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Petr Machata <petrm@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlxsw/pci.c | 46 ++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/pci.c b/drivers/net/ethernet/mellanox/mlxsw/pci.c
index b2a7f568c74a..dc6cad5637d6 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/pci.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/pci.c
@@ -1059,7 +1059,6 @@ static int mlxsw_pci_cq_init(struct mlxsw_pci *mlxsw_pci, char *mbox,
 	if (err)
 		goto err_page_pool_init;
 
-	napi_enable(&q->u.cq.napi);
 	mlxsw_pci_queue_doorbell_consumer_ring(mlxsw_pci, q);
 	mlxsw_pci_queue_doorbell_arm_consumer_ring(mlxsw_pci, q);
 	return 0;
@@ -1074,12 +1073,23 @@ static void mlxsw_pci_cq_fini(struct mlxsw_pci *mlxsw_pci,
 {
 	enum mlxsw_pci_cq_type cq_type = mlxsw_pci_cq_type(mlxsw_pci, q);
 
-	napi_disable(&q->u.cq.napi);
 	mlxsw_pci_cq_page_pool_fini(q, cq_type);
 	mlxsw_pci_cq_napi_teardown(q);
 	mlxsw_cmd_hw2sw_cq(mlxsw_pci->core, q->num);
 }
 
+static void mlxsw_pci_cq_start(struct mlxsw_pci *mlxsw_pci,
+			       struct mlxsw_pci_queue *q)
+{
+	napi_enable(&q->u.cq.napi);
+}
+
+static void mlxsw_pci_cq_stop(struct mlxsw_pci *mlxsw_pci,
+			      struct mlxsw_pci_queue *q)
+{
+	napi_disable(&q->u.cq.napi);
+}
+
 static u16 mlxsw_pci_cq_elem_count(const struct mlxsw_pci_queue *q)
 {
 	return q->u.cq.v == MLXSW_PCI_CQE_V2 ? MLXSW_PCI_CQE2_COUNT :
@@ -1198,6 +1208,10 @@ struct mlxsw_pci_queue_ops {
 		    struct mlxsw_pci_queue *q);
 	void (*fini)(struct mlxsw_pci *mlxsw_pci,
 		     struct mlxsw_pci_queue *q);
+	void (*start)(struct mlxsw_pci *mlxsw_pci,
+		      struct mlxsw_pci_queue *q);
+	void (*stop)(struct mlxsw_pci *mlxsw_pci,
+		     struct mlxsw_pci_queue *q);
 	u16 (*elem_count_f)(const struct mlxsw_pci_queue *q);
 	u8 (*elem_size_f)(const struct mlxsw_pci_queue *q);
 	u16 elem_count;
@@ -1225,6 +1239,8 @@ static const struct mlxsw_pci_queue_ops mlxsw_pci_cq_ops = {
 	.pre_init	= mlxsw_pci_cq_pre_init,
 	.init		= mlxsw_pci_cq_init,
 	.fini		= mlxsw_pci_cq_fini,
+	.start		= mlxsw_pci_cq_start,
+	.stop		= mlxsw_pci_cq_stop,
 	.elem_count_f	= mlxsw_pci_cq_elem_count,
 	.elem_size_f	= mlxsw_pci_cq_elem_size
 };
@@ -1349,6 +1365,28 @@ static void mlxsw_pci_queue_group_fini(struct mlxsw_pci *mlxsw_pci,
 	kfree(queue_group->q);
 }
 
+static void mlxsw_pci_queue_group_start(struct mlxsw_pci *mlxsw_pci,
+					const struct mlxsw_pci_queue_ops *q_ops)
+{
+	struct mlxsw_pci_queue_type_group *queue_group;
+	int i;
+
+	queue_group = mlxsw_pci_queue_type_group_get(mlxsw_pci, q_ops->type);
+	for (i = 0; i < queue_group->count; i++)
+		q_ops->start(mlxsw_pci, &queue_group->q[i]);
+}
+
+static void mlxsw_pci_queue_group_stop(struct mlxsw_pci *mlxsw_pci,
+				       const struct mlxsw_pci_queue_ops *q_ops)
+{
+	struct mlxsw_pci_queue_type_group *queue_group;
+	int i;
+
+	queue_group = mlxsw_pci_queue_type_group_get(mlxsw_pci, q_ops->type);
+	for (i = 0; i < queue_group->count; i++)
+		q_ops->stop(mlxsw_pci, &queue_group->q[i]);
+}
+
 static int mlxsw_pci_aqs_init(struct mlxsw_pci *mlxsw_pci, char *mbox)
 {
 	struct pci_dev *pdev = mlxsw_pci->pdev;
@@ -1426,6 +1464,8 @@ static int mlxsw_pci_aqs_init(struct mlxsw_pci *mlxsw_pci, char *mbox)
 		goto err_rdqs_init;
 	}
 
+	mlxsw_pci_queue_group_start(mlxsw_pci, &mlxsw_pci_cq_ops);
+
 	return 0;
 
 err_rdqs_init:
@@ -1439,6 +1479,8 @@ static int mlxsw_pci_aqs_init(struct mlxsw_pci *mlxsw_pci, char *mbox)
 
 static void mlxsw_pci_aqs_fini(struct mlxsw_pci *mlxsw_pci)
 {
+	mlxsw_pci_queue_group_stop(mlxsw_pci, &mlxsw_pci_cq_ops);
+
 	mlxsw_pci_queue_group_fini(mlxsw_pci, &mlxsw_pci_rdq_ops);
 	mlxsw_pci_queue_group_fini(mlxsw_pci, &mlxsw_pci_sdq_ops);
 	mlxsw_pci_queue_group_fini(mlxsw_pci, &mlxsw_pci_cq_ops);
-- 
2.56.1

