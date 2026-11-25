Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648962;
	b=OCtx7Al5yUa+bUXwHNeawmWnIzAmfPCDUc+8qMiW3++CH1SYje1OJulbqevqvs8vPhVf
	 vMqD4JvzlkO1oV8cvmzU9t1e/ddnluKFjC8Vo5uUwhfOvdTYchCwZD9hNdDEzblFkkBlh
	 NIsCCTJpIM0jnDVwJ3HKK2YtRxaNuYk7I2oKqQr27dgn4ljaOMXt8uvFaIMer8+rBEJY0
	 pODXqOT+LdB8QNPATFJD4DIsD8PYOMpe5d91w+GGUX2bQK0cZMvN4zpcEBqux1R9JtafH
	 yHwyX+QWwwroiC1yfZwhDr1Gqt3Ezl4r+aJ6Bf7foDktTxHssk611Ppn0vgvbGL4Qsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648962;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VTmFnadV8uTfkMNFhfXk3jTD7dykg2K3x/+i/oEthTo=;
	b=m5Ja6Ju8mK3adftuuQLYquD36tPcwYJfgSk4Hsz2Q698oySlBicDs1dviQUMEWtrgVe1
	 ioOfvqlLTUOIs6kurmq6sBt1iTemGvHdU9IrP/60bcFuVscC2zRu5PPD1mnzOac2QBEpN
	 ulguOiCjZFlHhnfS0ySfZ2aIOpbF2SxZc1K3gVeLlQ3Vb+JbvOb5tT/fjT2sbRuPls/BB
	 DTVTcqAZGvwOqlbPnF+8Tb6/YhcJtvpazpg8jiA8t+rT8/c4Cueo01lEc5em6XRCInV5f
	 +ENIbZFhYjQiSQ7h1JT4kvm/UTR1m9hvXCB4OuJbId+bgkHabqU7YISbQrUuO4ppR5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4LImy517;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5AC606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4LImy517
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLo1GKnWN0JsLLrDL4T3nmJbdln0FHLhZw0qP+FIKJ1F/6gi6PPQotJVOx+xqkHui8HWcELC+F5OcvMIHIfi6lTqcbdDu10l+xP+Qfme51qTfo5FtnTo7kADqUokdHR4EhNtMEgz8+zMpNJco+jsWZsAE2hHCNOcLYdXvZ2tebKHquI4Eba/1AWL1wiC9OiHjWD09dTqH6YfTyxFy4kGPKfqMx2/hxe0h6yp1t6oUulwjDG/1DtGu9C8Ucmxqc/uGCHfTDstiMcXlDH9w0mj7fHM/8rGXkjskgktxqS4BugO+W9pZgcqGd1mf1567Y25TseB6Cu5akhj8caFOtt2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTmFnadV8uTfkMNFhfXk3jTD7dykg2K3x/+i/oEthTo=;
 b=eIqVodrwIk+WGLYDHtVGtMgvkv+wMW/VNYVKv/K0cgVrcaMfnLm1dDM6IWAbgabNDSJOUL3g02qaKC0UUZWiAFC9YemC/3w7JBdg4isScdF20/WUP/KZMIqvEQOonWQ0HuP+rSDlljjjBhDKp6bI6IV76ThaT6yiHEsBPvU8Ud/03+bL8rMweBGnUgu21maVH7feELt7CBJrt4wUCdhq3aCQ1Do2FF4JJzpng/bd16Vsc+0IvwHIn5T+TC0SDu4zW84qtog1Ztt9P+06Jbbc1VMByA8672mYxqw8vM186ou9L7FTRINeNFLs5PW9K69M2a07by4D18WAzqt/ZDD4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTmFnadV8uTfkMNFhfXk3jTD7dykg2K3x/+i/oEthTo=;
 b=4LImy5178BiDtNbCL7jLOGqUM2oCX9BwDstwoaM46wXufZJaJ7+jK/wHnlnMpl7Q+hwf+rkTLOddUmjGkhcAqwZlUeaDSDr5jKfa9hBL+Kh5Lb8fbK3yHchw8tbdLnD+u/WBE0h3ISYW1HKftSwa1zrf2yolFqgrJw19+NhRTZg=
Received: from CH0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::18)
 by SN7PR12MB7106.namprd12.prod.outlook.com (2603:10b6:806:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 23:22:35 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::18) by CH0P221CA0016.outlook.office365.com
 (2603:10b6:610:11c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:22:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:34 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:32 -0600
From: Brett Creeley <brett.creeley@amd.com>
Date: Wed, 25 Nov 2026 15:22:23 -0800
Subject: [PATCH net-next v6 2/6] ionic: report FEC off as a supported link
 mode
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261125-ionic-get-fec-stats-v6-2-1ab49c729c00@amd.com>
References: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
In-Reply-To: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
To: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Shannon Nelson <sln@onemain.com>
CC: <netdev@vger.kernel.org>, Simon Horman <horms@kernel.org>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, "Nikhil P. Rao" <nikhil.rao@amd.com>, "Eric
 Joyner" <eric.joyner@amd.com>, Breno Leitao <leitao@debian.org>, "Arun Kumar
 Prakash" <ArunKumar.Prakash@amd.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SN7PR12MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a50b04-2fed-47d0-d460-08df4b4afc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021135927099003|261009223027099003|261021123027099003|10067099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	E7pnRKxDNCT8QRObr3XMruNv8sqFYwC5BVnL3BGUkaV2m6GMeNZS9QBaOZz+7M4FUpB4BmG7wUFWXxHf0IdCOGXg4bBWOThcIMJkYlScXkaIykEBVY2zfRxH2ebhwScIg0Ugtd8z0e5vB2h0zMBol3/cwZvG8p75CmW3+FMn9s2WW1qXprvWjevjknO9O6FRxZFvj5aGBtyatV4krLTPcxaBHK+7qc7Tv+21tMWzqmMPha13g49sZ/g7YoqB7GZTT4cukvMiq31zg3tuUC7rkrR7FozOz2ilG4SetjgBnTiQEq+jZfzvP9QE+CnORHAx0rLFGKysXV3JfC/ZklUwb50GPzCQukGJAm+PiWgXdmCBAAokp4FxZ8V5mCaHLxoIwDaOSnhD6oyqCTkigqLSm5iz+4sFda4cii0AHY1WGjzWS9Pg27foeEcl/f6MywBwmupP+auabNbbfwPO+feaaiXYa9B+E5bY/AJPS9tZnKYRkFaCAU7suuY57rCuY8sqRA8lu4v1/xy8xWYl/5zsKssgQtAU5GmHN8BvlrgMgsrx6tc/Y4XSPmTgJJlxneJ8g83TpsbrjjOYr/zf5rDU+qRzxg4RBWBl3wzmKjqYMHJLnHI2KzYLkwKLMwaRs9jiOO8cF8OcJA4eUQC5TBfKUXZ7siOKJLO2E3OvyJaTEwindMziANivGDzAlMj/6c98StEBrzlFFyA2NRlreZJtoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021135927099003)(261009223027099003)(261021123027099003)(10067099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hhOyPgcgovI3yK/MyViZ3FOtR/bPdsi3m+K10Xee5hNE+tOvjT7ZSrQ51bhdHtg9FWfFSxIS5p1IpGeMa3c0xgU2v/2FEkKQJVZ2HtoGYj1uY+wd1PZA+ePbqyydoAn9BD4/2nQZAKkUSzt/lesgD6vlA8t1h8PzJpLsToIIkPKwneylLaOmtipV6pSlqy5VUw42g5n1iSernMs43ls5qkX7fTnwi8nkgW1z/WGdaTlzNHI0/oR3ue1reCdU8fFV8q/K6q2YaHCbgRlGSTz0Q8ynsSc1wEVFFYuOrXELVwMKzAl2+k+CdyeJong6Vf0kBJ+/eJBkwyeGn12ht5/wzo8fQFEWFjx4jSMSjcdYgyr2ek3smNwDT1Y9tA6rs4oxnizWLGe116plgTzn25Pgtp01fj/do2cedSNvO4jeHQ1vAoD0o8xT2no8UfZPB5sg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:34.1626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a50b04-2fed-47d0-d460-08df4b4afc48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106

From: Eric Joyner <eric.joyner@amd.com>

ionic_get_link_ksettings() lists BaseR and RS as supported FEC modes but
never lists FEC off, although ionic_set_fecparam() accepts it.  Add
FEC_NONE to the supported modes, and to the advertised modes when the
port is configured with FEC off.  Read config.fec_type once for that
chain: firmware updates it by DMA, and with a read per comparison a
change between them could leave no FEC mode advertised.

Firmware does not report which FEC modes a port supports: the port
identity has a field for them, but firmware leaves it unset.  So the
list holds every mode an ionic device can use, and firmware rejects a
request for a mode the port cannot run.  BaseR and RS are already
listed on every port this way.  Off follows the same rule: some
devices' firmware rejects it, others accept it.

Fixes: 4d03e00a2140 ("ionic: Add initial ethtool support")
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
Signed-off-by: Brett Creeley <brett.creeley@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 29b9a8502b8e..16c6e4c9852e 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -149,6 +149,7 @@ static int ionic_get_link_ksettings(struct net_device *netdev,
 	struct ionic_lif *lif = netdev_priv(netdev);
 	struct ionic_dev *idev = &lif->ionic->idev;
 	int copper_seen = 0;
+	u8 fec_type;
 
 	ethtool_link_ksettings_zero_link_mode(ks, supported);
 
@@ -298,11 +299,15 @@ static int ionic_get_link_ksettings(struct net_device *netdev,
 
 	linkmode_copy(ks->link_modes.advertising, ks->link_modes.supported);
 
+	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_NONE);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_BASER);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_RS);
-	if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_FC)
+	fec_type = READ_ONCE(idev->port_info->config.fec_type);
+	if (fec_type == IONIC_PORT_FEC_TYPE_NONE)
+		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_NONE);
+	else if (fec_type == IONIC_PORT_FEC_TYPE_FC)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_BASER);
-	else if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_RS)
+	else if (fec_type == IONIC_PORT_FEC_TYPE_RS)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_RS);
 
 	ethtool_link_ksettings_add_link_mode(ks, supported, FIBRE);

-- 
2.43.0

