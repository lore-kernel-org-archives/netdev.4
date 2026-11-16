Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870439;
	b=G4XnAXkcih2pVHZGQohxQMeXNnzPfy6E8bAnntORfa5XVvpQD4TD/xZ3ikKJvIquo5lE
	 b0Q+sCeR62Trxebcj+SpFbaKtkLtiK1IsVIB6PyXPV+PfoEMSjLe0I7/JkiH1WBNcsCfB
	 NFWyoc15lD77PCMCTZCrt7KkayEK+hD/O7MWTHffGP4HN8kJgg1M4Ou/8KK1IC1SDr3lx
	 7OFGWvaYItboqJCmePN87kdnWi1Rz8gOEUrd66eyWLtoxdM8iCVGlFDG3Jnlz2mx1Fa5q
	 iLtLpgve7j9mpKanRg51E9iFfcu7AIBBIKB98ScnHvgOmdA9D3n9+9GWlsZaExtj+WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870439;
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
	bh=zK3yfV2Q32q7z1JbyGUSceQl1X4q1GN2hGYNpEZKxUg=;
	b=ZSMoKHvjlBLkVel1+g7ffp0FF1eqX33IE7Yr+++Uy4yi2uaNJToY5v4tTnheyuWz2mG5
	 e96nsIO0+DXFI9CYaiiS7id+qDXs+YCDfmhAKURJ2LJNxV3zF6IFlMkSirx/ML0NnOwBH
	 5j3zTgC9jhb+hSfdZ5zBIGTju0MmgPSCfr2Pf1LTgywMl0BLKNSztURezCVTo5S15i9dd
	 nn6sa/LrpCSat7jLOlnL99+GS3TefPt+cOHzISdPGXPDjrOv/AtJg6iwi6W2LrFkMHdog
	 O+BRHQtcnKSH3HyC9fYihd7GuBMQJOqKJNX8rBhz6JwK9yg39/msydODmtOmZQ1sOtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqHd0W2w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.35
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE623606A893
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE623606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqHd0W2w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rezMNIRdQnq2ESdR/SNFZ6Gd/V9oFgFS/ljr4XUFh+9u2IfVDltVVxCu7mmMD+gY7O3bB+HKKgw33aqxtxG2FIOBOhsoLIOfsWwJmkjUj3TalpXhXVRnJ+WEdwZB5abx7xzi3xPGQe06jKOLCmo87L8tTz0kIdROu2GXLmfCgdAjeoN/F7nPKIQTitszaxy16FwPv4IiuX9c6E0GRNWhaTfxQtv56uM59ns1QLPGnu2NaTRpTVSKEJrfCQhzsNrw2werapg7r7bcJIhJ4Qeq92OqRh/rx+vwrVwsyUQTy18Io3O0ylbw1+hE1hnXX9ljQaBvgWNm/9ztqknpRHkvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK3yfV2Q32q7z1JbyGUSceQl1X4q1GN2hGYNpEZKxUg=;
 b=lxmiU/XIoXjPAKyRx3ECFOCmVxcMUztoROIe4Zuk+Vp4BXj/dMMzHBHCmpQeaNVVRMO6fwcwmy2tuMT0G5595fgp6YtcrVO8tMU2dG30sVvumS+zgXcDK30s7oATlBKRYSifqAwjhVnC5Op7oTg9vX1cQgU4utQ6yvN+AimBJBQbuWpW1AGmtd1hEpjGrBrWsVRYmq2HbDSOkR4Q/99GxpKUeOHPeeVXABLmikgt7zD7JD7JqrtTBtiHI9cp7aT9NDiavPXhUHmISA4w3ZIqiIXvBeJNnr+imWSRJ5L3G/1tJlboHHz8Vd69jwollNnKeeHF+nV7ZBHZcxZ9Vs3QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zK3yfV2Q32q7z1JbyGUSceQl1X4q1GN2hGYNpEZKxUg=;
 b=WqHd0W2wvhbfNHW5yLd+BpFtfQpY2Jb+ac8uyZ16N1tmdfo4mICvD0HihJKA3YOZ3YZro4S3PBwabRHVMaqp5mBqUOpd0IXAgPhYDFz0HW5P/iSUcoxlWfDSKRY5QzxtQFLAqIpbj1eul6irCprCwYqYPgRkRCc7GJwykOvSJnE=
Received: from MW3PR06CA0024.namprd06.prod.outlook.com (2603:10b6:303:2a::29)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:15 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::6e) by MW3PR06CA0024.outlook.office365.com
 (2603:10b6:303:2a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 23:07:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:14 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:13 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:56 -0800
Subject: [PATCH net-next v4 3/6] ionic: report the configured FEC mode in
 ethtool_fecparam.fec
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
Message-ID: <20261116-ionic-get-fec-stats-v4-3-d25cae9f1e87@amd.com>
References: <20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com>
In-Reply-To: <20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com>
To: <netdev@vger.kernel.org>
CC: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "Nikhil P.
 Rao" <nikhil.rao@amd.com>, Eric Joyner <eric.joyner@amd.com>, Eric Dumazet
	<edumazet@kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: a39aba71-3367-40c4-1f88-08df44365a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261026121527099003|261022105027099003|261021135927099003|261026140227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3VCvhKbeX9XumGQdkAFRPWhDNDH5HDer/ULVdNMfSs5/cyVBR5qO5eCbUga7qfnJFSDygb54/X8ZBNCLV+0sKfuffX83JkXwXoDeQulNfs5K0zhVu6g+0hYQteKvucIscASaBc8M8KcfKjf7NrBc/qXVjFtMXJTuiabmFyekGySZ9IuhpeEQr6xDRlCBUE/Qvj2BmmbV5JUq3LoA8GODL4inWBsZugfXiPY2wkCbof3tLlS3hsl5KKhTFCdlohqayJ2hfkuDpZUE6aqYujigr7xMYBSG1Oe9VDTTlBXM8nhD3IDzhQLbNbG2rbMklhIHKkCcaL57+qTt6foFUlBPjBG/pHO3Ljz29AH2y757RUu1DWbFVQl8pGstwnejMpgMGuRKGDYxirKdQ1UdxX2PTS6bpzkaK8SXWvY/Kcz69siKLWOq1emBEKa+u1Bv3Tc2tn5UT5/HvEPF4JMB1EEIUqRaDcH+FL+v9oHY1PMi8EShBSP7elR03fE2B3OvWcMrs624pKziCFb/w4Sdk/2v1r4nKDO2tfl6dI3Fh+22O0uS1S5+azNj4wonnsgJEL4wmCe24BeCbRAv4lJzLLDinUVzpXpBGcsnoSty82TV++rIz6yrS7iLLTXaA7xZO9VfZx6gfhMhdZGEqxi8VyI358LayRJUFVbmHEJAMjdcdbZvOPKUUqIFjByNaiYIwbGZHgZ/Rb0bG0Qp95k+hweH3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261021135927099003)(261026140227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9D914uOOR7KvKDrdO+dOd1SsJawVZfYXO7S8AbY2QcGo6pGo2iizu63B61iSDPeiY9zUoghajhKjxQMihpkaGdrnvq7EPDM56YpiYWFn8Vm1C+6nTgB5H4bIGJPOaA9CE+VjFZvwa65F9YkTzI9XWk7Rcw7xd7lN3UYIp2PJU/vylR3SlVOr++nJBFkgDG/bQbuMi3h+/5phg+nlLYJKRI4ivft5Dsl029qc+Wt6ea1TegHUySLcfIpnoM0DcByfvlNDvwIB/iIB0gGcStM2vfFIAgrBHVQUBbh1p0QofaMLl3d643RSo1lRHodoAtKftLFqXjTNCtJUj3pwijqJ/+zMkdUASSZ8PZPe5xxse9u4TpzBojn4y6Fg/rNTUpXaJ7aznvJWMlzSB3HAeAJj08ijTUzFpcO4yjugij2zauoAG0Poylg0a9qr+arbwitk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:14.6053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39aba71-3367-40c4-1f88-08df44365a83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_get_fecparam() fills fec->fec with the constant
ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER.  The uAPI defines
fec as the configured FEC modes, so a port configured for RS reports
all three:

  Supported/Configured FEC encodings: Off RS BaseR

where it should report RS alone.  Take fec->fec from config.fec_type.
Supported modes belong in ETHTOOL_GLINKSETTINGS, which
ionic_get_link_ksettings() already fills.

fec->active_fec still reads config.fec_type; reporting the operational
mode is a separate change.

Fixes: e95f922f4c2f ("ionic: implement ethtool set-fec")
Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 84378bef9fb8..13b5874fe5ad 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -434,17 +434,18 @@ static int ionic_get_fecparam(struct net_device *netdev,
 	switch (lif->ionic->idev.port_info->config.fec_type) {
 	case IONIC_PORT_FEC_TYPE_NONE:
 		fec->active_fec = ETHTOOL_FEC_OFF;
+		fec->fec = ETHTOOL_FEC_OFF;
 		break;
 	case IONIC_PORT_FEC_TYPE_RS:
 		fec->active_fec = ETHTOOL_FEC_RS;
+		fec->fec = ETHTOOL_FEC_RS;
 		break;
 	case IONIC_PORT_FEC_TYPE_FC:
 		fec->active_fec = ETHTOOL_FEC_BASER;
+		fec->fec = ETHTOOL_FEC_BASER;
 		break;
 	}
 
-	fec->fec = ETHTOOL_FEC_OFF | ETHTOOL_FEC_RS | ETHTOOL_FEC_BASER;
-
 	return 0;
 }
 

-- 
2.53.0

