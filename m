Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824301;
	b=rGFGRjiYfcvnKeuAvNXhrcp4fd24YYnL5B1uwfCL23ye1XGE57WmS3YclUVoOB3N6uDD
	 tc9dk8deAtXj7VCR3RxoSiXtHHsY5rEdfVC5Mxgl2szWsB8SQE+d5iCCtEn15eAZZZoeV
	 sE1i0c7BOz7WpZxJqVD0yZRKz1DrzZZTONetGoFRhBaQqkdCzWqQM+B435vuuy18RJgJK
	 ONNoTqNKlQ+ElsIHIxwWNnoHlvNi10piesGQaMO+sYL8hKkDbGUo9tCx1jwwASWYtNRJp
	 59urWgCGiSlryblWAQ3Q1M08g0e8pSyifySXbPtbXSaZDYBl0THykl/nunMx3BQ4vQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824301;
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
	bh=/CTRFKF/iN82f1I0H4xLiEh5cDsbepLuPr8qY2Eo4rY=;
	b=LhFtJlxWsnLksbgE5QqLkdh/nEezfEL/7cWpZYT8uWD0ULzy4t4J3jIgbXi+pFCX464+
	 QPQT59UVViVEJDZQVXA7hyUNsnDlNEJxjKjVyaqwSsOmN+ix6JAwFEc6PlBemlVjMfDmj
	 YKgqZ1v+P8NFeLx5U9mn+oKUUL1YME4LT4LKzmr3HBtEfhD08zzxvLVwuQeXPWqu15TNp
	 l0LZvBrD/wpSGLPyoIx8qrY2FGKMBB7B7ryiwXFdE24xmUqDbzbZKgmO/gvLZ+30jjPpU
	 qW6BuEZb06RsC4bZ3NR2SVNpmhvyGJOfx7newL5k+MDoJwHWQyI+XFBtQvoQD7HQcGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uY7MmEmp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14813606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14813606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uY7MmEmp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8lRXBEhwAnzHJAw27JjA6Ra/9psoQdk3Eh91vfto8bQBJ6VhXuZKZVXdmJwKjVAy6lhu/kqF6q6X/8JNEHBTcq/rl86969NwZWP+aWuNyQ3RP0Z+zPdMUTr9wHd4LJSgHllo6dwk7OVZLtdISdf3Ow6GeVJvae3xz/8C7uyzLlAe/NUc/5hEJU9N+rLnPSTng+Cq72aaMdA6M3qES0fhIle23stTgenM/MQZGPXgKG73axKabtJBKYGEQQKPjILlZENtl82Z8KjlkMFaxy6EiGSl/xBaM69bCX4BZj2HaKJ+lZB9eBNAYfpLtJ3iR66VTORQjw+WCQ7Mm4F1uPoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CTRFKF/iN82f1I0H4xLiEh5cDsbepLuPr8qY2Eo4rY=;
 b=gSp9E8hR0BI56wi9DNBNVmsmKJnOiUahgl6zHWIj7BmK7Ep5SRWbtdx4faSbyL/OJhAozVmQi5xenQIROYYDIQRy4eI4KIMnN75RmM0p7f1Y8/cWcDzkENYdBNGogLss9M17VDWaBrDTRbbe+FYKA7cKBOBf3t6dTOIGE4AciOQPtpG+5X8kD3imsHHX3xD+N4HyAG251IcLXqfTWXtvOY1BbQ/eJm+y8R+mBfadM64oVQ/IWb4C6SyT127KKLSWgW8nqEIBEJlNHBIUbgGSWBwwC2v2Xm3WJZW0vM7i7msO6+HslmvjyOMDYAa1hrriPhjHlW5tyIqfMl/zEtKLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CTRFKF/iN82f1I0H4xLiEh5cDsbepLuPr8qY2Eo4rY=;
 b=uY7MmEmpepqvBRh/SCVVtZBJUHZ36iAcLpK6Q52aXfV3DpGrG507Zc3AfN1VIXBBTDLzo9XZKfWKDyZSbOg3UQiF1BdR45Jkrv7nCML+TN/IkJ/voXpfyjLaTKnXwOZF2XveYZm2tAzaFgFD207YAW5e7L01ygnfYyNzsup5nYREnQ7L+DtGGpc92ar/KcX/Ma2nDaOGm3bQCtwcKG+OLR5orF3C80TabniEZsAVyFI/5B6SaAxxNPux+/J2+lBy/gy7nEKuUip0nJmm5WUtppARqzwrlj0IbJqfgqeJYWFJeeKJAb0jQHCIYAioRyu1DmCIG79U0PAXZoJXRcKVMA==
Received: from PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::14)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:17:39 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::6f) by PH5P220CA0009.outlook.office365.com
 (2603:10b6:510:34a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:17:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:17:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 02:17:24 -0800
Received: from tuxedo.docsis.vodafone.cz (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 02:17:20 -0800
From: Petr Machata <petrm@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: [PATCH net-next 1/2] mlxsw: pci: Process EQ in the IRQ handler instead of a tasklet
Date: Mon, 16 Nov 2026 11:16:46 +0100
Message-ID: <fbd58ae69e81451bbbee01c663c03d2ef72cdbb9.1794823524.git.petrm@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: dac3532a-edde-4578-541e-08df43cad7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|7136999003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TAKkoFWhHrJcDgvpSsUIrafE4rFaIlQDqa8Smmm0prCTv7fuoa16xaHhoSGS9ilfxl613YLU7QRIrUpFvjxRkhBKLLFJ6n8ML0C0OxkOwzdYfXJ1oM7gOJd4GgUxCj4AjR29aYcXzJyRFRu1OKLU34tanTGyGZduWH/AbJ25eL+2KmdYdNc/YpDOSZyw49shkUPAO2tsMhejHEZEdDYMTwqfe+z5m62U/kwsDwL8c4RspBtSciC/uFbcjeoGY8vn/rwAEtlOO/SwOWxBJNC7HSC96SxnhJFVqcEjtKPlFYujWjH5BpQAS2ULtGr2BzANHNWhO/gnU4ehB7f0ipR7BS4987hVB3BC2Jc3xbNlEnNswh8nCSP9qbMkGZVGc9Kq3lypaqXZ74XD4VG9kG+G1hMdnG4COaJtt/RtM6bK84K4DMdch5uZJO0vYISr+GiWLxjnDOecd9S6nQEWqhw9gUxt37tM9crumj2w86E6o96FM2jUJFvq2veVOPxV5YtTvPyQyFKavoQMv85CpvYhKMdG1+L1CuqHVWrbYJYe5K/3DF6NYPtSkG/bQQ257xbprtqGcHIGFMXNqMt+q1NAZICZwUwahe9IOe7lijcJzlzIkDHc3zO5h/mlXuhyae+W4jx8YgQMDsMjrBT5xyandUcErZNt3b2orvX7YyLPtmpRu7d/BkDTJFpo83QnyMC81HAjmD91WKgp7VaAGHCXoQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(7136999003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fnNkuPqT9ZnTXTiN+qKYJe75IVc+G9YFAgtv/RXke7ToHMuKIUoJ7z2B6IUK6+H67hCWOgwe5p06YV8w9iUwDocIhGlSM3kZpehCVvyXwct+lzCF8rnvOH+UYJVwkXMICaufO8TiZFDOjvv6Ekn9aXdZ3KnjcvNhYmxtdEhLaY2q/4IGjCMJLJ9QbCm7Ih+N4SxuTvoGOzxrZ7f0tuKKHhSL8ktGO5eQWvBYdzWJ5hRmtuKjsOYvGvNLE0YKRSyZiYvUMUxdDZCXQtkPT8Iw1DXRp5e+8s85MnDFptFzlZMYiNimTO7KAchkRZwxts2aM5DC1/YBGbjVZlsjW6lyKuLXfYkQ2MrplbquRky+cfPvj9ZyTjn2qROlsx26iq3sfETPrIyStIFSr4EhT/jblKX4ohqFm2G7fECaH0KGturgLmXwmQcMQ3NtMIHLPqAo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:17:39.2004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac3532a-edde-4578-541e-08df43cad7c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381

mlxsw_pci_eq_irq_handler() schedules a tasklet, which then reads the EQ and
schedules NAPI instances for the CQs that have pending events. The actual
completion processing itself is done by NAPI.

The EQ processing is bounded by half of the EQ size (see credits in
mlxsw_pci_eq_tasklet()), and all it does is to ring two doorbells and call
napi_schedule(), both of which are safe to do from a hard IRQ context. The
EQ is only re-armed at the end, so the handler cannot be re-entered.

The tasklet therefore does not really serve a useful purpose: neither
structurally, nor with regards to permissible runtime operations, nor with
regards to amount of time spent in IRQ. It is just an extra deferral layer.

Drop the tasklet and do the work directly in the IRQ handler. Change
napi_schedule() to napi_schedule_irqoff() to leverage the fact that
interrupts are already masked.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Petr Machata <petrm@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlxsw/pci.c | 31 ++++++++---------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/pci.c b/drivers/net/ethernet/mellanox/mlxsw/pci.c
index dceb69945d26..b2a7f568c74a 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/pci.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/pci.c
@@ -88,9 +88,6 @@ struct mlxsw_pci_queue {
 			struct napi_struct napi;
 			struct page_pool *page_pool;
 		} cq;
-		struct {
-			struct tasklet_struct tasklet;
-		} eq;
 		struct {
 			struct mlxsw_pci_queue *cq;
 		} rdq;
@@ -1111,16 +1108,19 @@ static char *mlxsw_pci_eq_sw_eqe_get(struct mlxsw_pci_queue *q)
 	return elem;
 }
 
-static void mlxsw_pci_eq_tasklet(struct tasklet_struct *t)
+static irqreturn_t mlxsw_pci_eq_irq_handler(int irq, void *dev_id)
 {
 	unsigned long active_cqns[BITS_TO_LONGS(MLXSW_PCI_CQS_MAX)];
-	struct mlxsw_pci_queue *q = from_tasklet(q, t, u.eq.tasklet);
-	struct mlxsw_pci *mlxsw_pci = q->pci;
-	int credits = q->count >> 1;
+	struct mlxsw_pci *mlxsw_pci = dev_id;
+	struct mlxsw_pci_queue *q;
 	u8 cqn, cq_count;
 	int items = 0;
+	int credits;
 	char *eqe;
 
+	q = mlxsw_pci_eq_get(mlxsw_pci);
+	credits = q->count >> 1;
+
 	memset(&active_cqns, 0, sizeof(active_cqns));
 
 	while ((eqe = mlxsw_pci_eq_sw_eqe_get(q))) {
@@ -1132,7 +1132,7 @@ static void mlxsw_pci_eq_tasklet(struct tasklet_struct *t)
 	}
 
 	if (!items)
-		return;
+		return IRQ_HANDLED;
 
 	mlxsw_pci_queue_doorbell_consumer_ring(mlxsw_pci, q);
 	mlxsw_pci_queue_doorbell_arm_consumer_ring(mlxsw_pci, q);
@@ -1140,8 +1140,10 @@ static void mlxsw_pci_eq_tasklet(struct tasklet_struct *t)
 	cq_count = mlxsw_pci->num_cqs;
 	for_each_set_bit(cqn, active_cqns, cq_count) {
 		q = mlxsw_pci_cq_get(mlxsw_pci, cqn);
-		napi_schedule(&q->u.cq.napi);
+		napi_schedule_irqoff(&q->u.cq.napi);
 	}
+
+	return IRQ_HANDLED;
 }
 
 static int mlxsw_pci_eq_init(struct mlxsw_pci *mlxsw_pci, char *mbox,
@@ -1176,7 +1178,6 @@ static int mlxsw_pci_eq_init(struct mlxsw_pci *mlxsw_pci, char *mbox,
 	err = mlxsw_cmd_sw2hw_eq(mlxsw_pci->core, mbox, q->num);
 	if (err)
 		return err;
-	tasklet_setup(&q->u.eq.tasklet, mlxsw_pci_eq_tasklet);
 	mlxsw_pci_queue_doorbell_consumer_ring(mlxsw_pci, q);
 	mlxsw_pci_queue_doorbell_arm_consumer_ring(mlxsw_pci, q);
 	return 0;
@@ -1730,16 +1731,6 @@ static void mlxsw_pci_fw_area_fini(struct mlxsw_pci *mlxsw_pci)
 	kfree(mlxsw_pci->fw_area.items);
 }
 
-static irqreturn_t mlxsw_pci_eq_irq_handler(int irq, void *dev_id)
-{
-	struct mlxsw_pci *mlxsw_pci = dev_id;
-	struct mlxsw_pci_queue *q;
-
-	q = mlxsw_pci_eq_get(mlxsw_pci);
-	tasklet_schedule(&q->u.eq.tasklet);
-	return IRQ_HANDLED;
-}
-
 static int mlxsw_pci_mbox_alloc(struct mlxsw_pci *mlxsw_pci,
 				struct mlxsw_pci_mem_item *mbox)
 {
-- 
2.56.1

