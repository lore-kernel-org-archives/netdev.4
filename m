Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717537;
	b=ljPgE14qnGm3Nc7C/5YyfYDYTynJUCi1aHPaIijrD/H66EYIXEiWid0VUdVKB4MsCv7z
	 HpIAymObdb5hxf8kKo+/+2Fr8Y/o7BRaWorqMTsFwMVI4kC8B//y2w0twhz26FLYSIVvO
	 lehrMb6AauSrRuEEhoNLdwaLAM2WOJLYbeJehIFjVoL5/y2qLM3hSD2gADALqyhOmJyKN
	 GVcbMQEUPOYTWJ5V7GoBBuERxUdu1ugac3/4c5Z7V8QhZ+0Ho+95qFTEA+i+xJqUwYqUR
	 qI7IehyxtSnWnl0TGywoqdPLxIJlmXJi9XtK2vcEY8MTWrYTfwqoPJsz2jKlaqd//dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717537;
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
	bh=acsplPKq+mkVkoIk97QVSb7djx2SNiFixJtoGwejfmg=;
	b=vPLuIoPqxlDWc3wBGYQDGV4U4spyxPc8JRnpq1y6rffB7E4mHph3uM0jSRCAWYo8yh8m
	 fiVfVaHiTvwE4yFuQSvdS+tbxnCYLstq4tjgGIRNut3bGFOuG6/eT6J2HRrryXIxhocmW
	 EIUMZSIg9XNj4ZKrLEPCDLqT2XEpmodcxtuQEdVHSjiumhzUZiRZni5EPy9+quDtPK6al
	 qhuusnrFNL4jLyP1zG3NgS82yIJWwhQ6+sSmt1gQZubjo4DDJGWgSwOkvPa5EwCbZBYP4
	 R1mRecjOcwyIWDZDt8Y6PV+NQIlIo0Jcasd9Nib6L1ei37lz8rCgcWg7AbA/EndItOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D0TBMmCV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7202606A31E;
	Thu, 26 Nov 2026 18:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7202606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D0TBMmCV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkv9Wv6dKcBVvPCKuVuAi0C0B09YgpcXEqZvjm/w/tFaPcpJ6QITcycKg+w7nxPZdPsKi8F3pPIibBl1QkiB37UUNG5QTL9NjCx8koXCyLa5DWPSiS9+/At134/Dua1HO3vEP2SGQDQi5WlB/dprkxjwLCq+2ozI4nl8zxry7bL322TNK/suM09F0v0gfBOwTrtePkgynBLdqg76qztLpt0c/2810LMkRwIVEL+InsS08yT7VDEa+qDGQsmOZimx0ElQgUnJp8DOAL7AVpxPWOK+5bMhwaA48SARDneIhqEZklcgXC2vStt61n09kqsbs5u/beLCZ0IAsCS6tU3rOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acsplPKq+mkVkoIk97QVSb7djx2SNiFixJtoGwejfmg=;
 b=fkvDv1DzqdKG4r/xCFYh5GOAgdcRUELo9NiB6cYJPnA5TYjKvJT2npIswwpxmVM+Em2jDEoVeoeCeoT4IYqAFrU7Jv0TLrYBkFa71t5++/fwEdNsbbNMJr/jwdd8tqTDtbUpQOVm+Mmcl+A08NhAvot/Y5kxALokP2eY0qQaE+nZzOnes7rQH9rvhzEevA6XtnDBUuIa34R1HUnCd4V8nMpBEO18F73SA2dqUoy72W0zbmZiS/JbocHuhkRkULOJGoAFJXIXxsXX38XAgY6CTWNFYjfd8UzocDKCEr8fPuICQhsxeCDEv4e6hnV7UYl05DoSrbUhYWK9yEj/WSJPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acsplPKq+mkVkoIk97QVSb7djx2SNiFixJtoGwejfmg=;
 b=D0TBMmCVcwb2+pIB63htF8s43xvyjAaM7Gvd9PZDbEH1nVz9GilwYGCib4OdK/0rnLFo7idwe3+0p7l8nmQzU88gXMyQ2giKrEDckw4qPqUTh1SO+kVixtET5OSRluX4aa0ZT4Q/SOELacRmatjy0X2yi295uqEShlowqomVNkEew0iWSlGFhlu3XOy4bRM5YfSPWpaaGln9k+VUhU3j13/wnWxxxICWVYy1TK8rjpENAe1RQl+rxwV6rDoI0ACsLFfFJYlCOLALHelK+xvVi8gy0FQvrowDYUnVoY9ycxIWqpMgL95tF/AszrJ568V69Fiz1PxjI7tw46tBRRB1vQ==
Received: from DSSP221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::18) by
 MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 18:25:29 +0000
Received: from DS1PEPF00053453.namprd04.prod.outlook.com
 (2603:10b6:8:3d5:cafe::25) by DSSP221CA0007.outlook.office365.com
 (2603:10b6:8:3d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 18:25:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00053453.mail.protection.outlook.com (10.167.23.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 18:25:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:13 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:25:12 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport; Thu, 26
 Nov 2026 10:25:09 -0800
From: Tariq Toukan <tariqt@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, "open
 list" <linux-kernel@vger.kernel.org>, Shahar Shitrit <shshitrit@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH net-next V3 4/5] net/mlx5: nodnic: Add ethtool driver info
Date: Thu, 26 Nov 2026 20:24:47 +0200
Message-ID: <20261126182448.707782-5-tariqt@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00053453:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: a2eed5d3-6049-4b6f-1cc6-08df4beaa582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|10067099003|261021121427099003|261021135927099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	KqtWEQShIFUptFvBX/j8TbpLET1X9y/hFh0DphR+e6D7SIuiOFBEggGJ+4+Zsc6NjrmRZv0Ao9l8ib9J4+U9Eo2sL37Q+FQF0+E8Sx6JDNdxKPj5X3+SJxxpHKf+nTemGq39vrGa/+adUP6JTZcC7FAgdnQC2zUNiCNVHmcN+5DiUa5YpBWK5ujtiedS3qkptbSOhrqCADlYMFBDVeC9q0lT1RN5r9ek5mrcFWaGEfC/NoKHLjrttPiaZ1Vw+Bam+Bj0wSUVGjehQNmQgFLqbumd+2s4OXjrNSpiALAnjnC0xEFNry0Er4OXm/76tNpJc1N7eivkW0KbW7MFd2Q0OizRShydRhdSS3eDRoYJXreqoIx9nI+xpX0lA2ImB0Q9L1Ipg6r/lejf3mL1p9NSwNkalbW2hMcb0F2WD5BaK+wzoyuki05IVnCZMcq8C9JFi7AJlFkKDWeIHWQ+HUyslJMWcMFvQSQuCgzSrEGKN8S4vJwDD0/pJ7zxPHejOg9aOVHekKtZXJ1TupXU/wlwwqs6vlx149vG+Vn+oCLPySWPl8SgJWzMpumyHyguPOEdnGwFJGPjYMkOjrjuP0f5Rw08SHkEDSEvPcNPnVWtOhsa+fKzOQncf13b8q9njQLpcfljUywGpEhfo5Y4tw8IjmzzHhxmWysNK0QKj3BVkOApUZVYGuFCcXzqcFw5EM+8iyb3HnHvB2IzyHOKRkpkXQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(261021121427099003)(261021135927099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u3X++bJDfBEvKyRMgWUiyaZtoJOhx8tMJtG9CLb4DII0j6p94/EhkZv9ML0KZ5eOYvWB6A7Pf9brUCY59nm4Wu/GU1mFyO7aisbOPteuJgNBZZDtfIH3wn+1Jb/7sTKZabKTTS/ObRdDqBZpSF8pLCpJ7TSmKxgDYWPhoAfVmqo2AYDhbJnjCtbAM6ixZVPS2rHFvFEica7zCmyPpm3BakqhV47tTtEnDlNJgwQ377jEpxvPgDzIHHYfMAZfjE0M6ADTzkReotgfzErRrBRmB63qPAeYSKAKblflBKuXYqHuXu+tH+Ouj96+v3BK2iNidMG+W7/jlIp9eIy6Ru/BCA5zgTIg3Qt0R2hubSN+szfU1l2QxgR6s8kdRtvKbMdZC1Hgm8xvYr91z+spQ0zyhH/nNRcnVA3ePLALCIRep8OnfpvC6SCCftLnjg8/eXtw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:25:27.9846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eed5d3-6049-4b6f-1cc6-08df4beaa582
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053453.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

From: Shahar Shitrit <shshitrit@nvidia.com>

Implement the get_drvinfo ethtool operation to report the driver name,
firmware version, and PCI bus information.
Read the firmware revision from the initialization segment and expose
it together with the driver information through ethtool.

Signed-off-by: Shahar Shitrit <shshitrit@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
---
 .../ethernet/mellanox/mlx5/nodnic/en_cfg.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
index 9ab996a6ebaf..bdbe76b8dbcb 100644
--- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
+++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
@@ -1029,6 +1029,39 @@ static void mlx5_nodnic_get_stats64(struct net_device *netdev,
 	mlx5_nodnic_update_rq_stats(&priv->rq_stats, stats);
 }
 
+static u16 mlx5_nodnic_fw_rev_maj(struct mlx5_nodnic_core_dev *dev)
+{
+	return ioread32be(&dev->iseg->fw_rev) & 0xffff;
+}
+
+static u16 mlx5_nodnic_fw_rev_min(struct mlx5_nodnic_core_dev *dev)
+{
+	return ioread32be(&dev->iseg->fw_rev) >> 16;
+}
+
+static u16 mlx5_nodnic_fw_rev_sub(struct mlx5_nodnic_core_dev *dev)
+{
+	return ioread32be(&dev->iseg->cmdif_rev_fw_sub) & 0xffff;
+}
+
+static void mlx5_nodnic_get_drvinfo(struct net_device *netdev,
+				    struct ethtool_drvinfo *drvinfo)
+{
+	struct mlx5_nodnic_priv *priv = netdev_priv(netdev);
+	struct mlx5_nodnic_core_dev *mdev = priv->core_dev;
+
+	strscpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
+	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
+		 "%d.%d.%04d", mlx5_nodnic_fw_rev_maj(mdev),
+		 mlx5_nodnic_fw_rev_min(mdev), mlx5_nodnic_fw_rev_sub(mdev));
+	strscpy(drvinfo->bus_info, dev_name(mdev->device),
+		sizeof(drvinfo->bus_info));
+}
+
+static const struct ethtool_ops mlx5_nodnic_ethtool_ops = {
+	.get_drvinfo	= mlx5_nodnic_get_drvinfo,
+};
+
 static const struct net_device_ops mlx5_nodnic_netdev_ops = {
 	.ndo_open		= mlx5_nodnic_open,
 	.ndo_stop		= mlx5_nodnic_close,
@@ -1047,6 +1080,7 @@ void mlx5_nodnic_build_netdev(struct net_device *netdev)
 	SET_NETDEV_DEV(netdev, core_dev->device);
 
 	netdev->netdev_ops = &mlx5_nodnic_netdev_ops;
+	netdev->ethtool_ops = &mlx5_nodnic_ethtool_ops;
 	netdev->request_ops_lock = true;
 
 	netdev->hw_features = NETIF_F_HW_CSUM | NETIF_F_RXCSUM;
-- 
2.44.0

