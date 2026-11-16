Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870441;
	b=34eS0U/uhjtRzaDTXd48/iJOmONVa7fMA3UMbsXBRx87QmwysCZXDyxYMk4td5nXItR9
	 iSKF4d/6exwYZZt28O8JYKq8yc12+v4c1NxixXo0EprpwKPzEXw0QbA99RCsywILHxEcY
	 mY6l0R75+zDCIkuTh/+2X6B0kuFFeAw9JM+Pi5cmrd9hNwNp5MOe4yuHIIR0b+9SAi/7I
	 IT44gd7VFTMeX1ykC5yzfTHdI3eJ7giy64sYGO6K02HCfoKUdUeIGi1e5Kv2LHiYxkYQc
	 TwPKFsqVSpVzsTCpHGWM3ubhZCC3HQKndCKIZPj0ppgITf+bl96xPH/7Qp+JZaf2Ifg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870441;
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
	bh=XZTicPgMNCpXqHVNfk3dhhL8/sBBbFs+HWEfrckIc2U=;
	b=RHEqffRuurwGa1pWjmO771b7s7he0M5qXsEaqVsidJrhHQWz7obH4CQs0SqESu6lI6/3
	 WKy8XXypMG4KKcsddsKPO89esV7B9PwziYNYA5+PC7tHyOPCh4ieoGWsRQ+gMJU6c+n2C
	 q4DleOatcw/mEN/Jwb0PlYrqCBCuOcQXz+tOCwEg5d+Ubup1IiRP6OB8BGa6xkfY9fvPR
	 zpraSmVHPCxM717Mu3aDhmUR6dSu5vHTIBIjwLDFn2a8HtDx9PVokv1uCR5y7Ki9AnCH0
	 cNyNbj1iMgOGyq2n8mlbNw8M/SCUCYlb/xJt7oxpalBgdEfzeoqWJ9zP6H1E1iuMlrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zx7vzqgG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.25
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956360A2628
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C956360A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zx7vzqgG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piPLEB1z16XPG3irUm3y6z8mhmk7VbIkinAiPfxp1uuzmnTINewNVEtw/uPsQXwzZL3OXvFmXWviRAoT0BG91G6AG2X1Pj/zyZrGh0NOkn1nBWsslk3VUZx1plMkDx6xm5VICLArVFmE3EXwyYU5D2Z+A9g/dXgmfugYBoKxCcVZfq+F1zp49uNRYwysawuB4X78eGL1s40Umj0ow/yptIt+ACR6sE+CwBhpqCk+tJ8cU92o1QCREi1C3QLTjnD6WBDFPpABWw1rFTQEcAR0mwbYCCkWMZf4V5+ki9A0OosPCoLdvH4mMFntoDmprWPIfc0cmoU9XktQS9PrQTjOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZTicPgMNCpXqHVNfk3dhhL8/sBBbFs+HWEfrckIc2U=;
 b=g+O0TZKuYcPV7a63mccjKH4DPaFv0gYqa+HWow8TibZXWyVmu9u9xryJcqGGtal5QFB2f6kkzKG4AAu17OMx3mNwmhVjf8+wGfWeYqXWUjku0YGjS2KQ4FG+RzBZ6rsIdEj5JIRai9NOhn2YTPF0BtWnn2dOPYK4J3FoOKpyisVSvfrfM9AdSF9mZgh3kGk254e6zq3iY/te5BpDKecJttCwZMaFm5kumzGoYiLmolSH7edkgYXKOgJcMc1t+1h7HbQ0sJz9ZQF+8KhhsY7d/deSIowJv/iW0YDc78d21qMyBDyd+MqZiWXBAgjHYVQzwqxWp7LYkamZW+E++Uti1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZTicPgMNCpXqHVNfk3dhhL8/sBBbFs+HWEfrckIc2U=;
 b=Zx7vzqgGa5yB79Xao14Iu2dBgGyMmXlCnFPeXf0NdlAnT6hPDKuKnGAs/gR4xx2pzpKN/zbAsSP5JRitne6s+o+a6GpLea+gQdnTuxMBbnvDu2N/NpK3FH3AeoQ5aFL6c4LmJChpX5ZVKH99mHO1brfz0ooSFyNUqtyqE3XEP3c=
Received: from MW3PR06CA0001.namprd06.prod.outlook.com (2603:10b6:303:2a::6)
 by DS2PR12MB101350.namprd12.prod.outlook.com (2603:10b6:8:70c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:16 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:2a:cafe::7a) by MW3PR06CA0001.outlook.office365.com
 (2603:10b6:303:2a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 23:07:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:16 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:14 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:57 -0800
Subject: [PATCH net-next v4 4/6] ionic: map the FEC type through a helper
 in ionic_get_fecparam()
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
Message-ID: <20261116-ionic-get-fec-stats-v4-4-d25cae9f1e87@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DS2PR12MB101350:EE_
X-MS-Office365-Filtering-Correlation-Id: c185c452-2e4a-4a6d-ee94-08df44365b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|261009223027099003|18002099003|22082099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|261021135927099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	wOoIjNO1hwFTBE0MnPcS4JNTLWPtBWy5641DW2N2nqJKeLTmD1r+HQ6EKhvrBw9wppMJ1BmKD6WImfYlSwYTlbh5EIojx8E69TS+sBM9icWlcpYiD7hWZl90ypOGAAA953YTESuW0LV2tKyFjhy4g3Jn81M21l4xliAC5JA/eLm1dH/um8jpQ6r3U5SvLAFk0vrhtlo3EVmUIhVbMwEkZQlA88FmnlGHYAyUDZj0uEuBunc+df92hwvWwHvFlHlptyfSSKaobvDd4m/1w5s3NsBQssGFqQPG3w+ZwcgKVeOi5UD9mUM7DkVv6uk2Zw1vMI++0nNjzR55a1yjy6Qxx8eSAFMbOm7gN9aKiqfiNp450h/h2oO2s8rG3NqAyYbKsddKcmKuGET+l/VKt56e3qrBV68eTQhbh4CV1gnBPqLwvJRnns0ESVczzHd33sjFB86QSTtzoWnrmr80ZO2vFqDW3vqOUNT3QvoXs8QK9vrXafFZq/EI6edi1IfmEi9NsCkA1wm64JmTfd3wccZGxoqJnoYI7IctfXMLpxJsKv6KOJamiqcxUdT12sFgEwGgB0Ud7yAbV2Yc6n4gnyAIdgnqe8CTGP0WdFOqTBH9zLV2s+poIAfrxgR4xF8WpohE3ytCL0YmKJWZ2IZA8/uAz98LUQ8jjbxMx0xn1YSRZE+vUD9Dr6+BOMT4UPoYxdfLTyC++6BZvVKX97Lj/JbM5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1DLOGIHeXqZ9Yx3euQxt/uR0crFIvwCOTfdzsGM9PYa3PwCh0VOKPNXsbGmVhjjEIqf+3Od7MYsUkS51PwRRnKOAFGAlMDnUD063idin6AlXvBcLYesgrEOUvrtXRv0bz+uoI5FPZeUTS42W6cmbQy7H3JBgPkXjyNj1n8L/od1bVMqUE7vsmOM1eG51lJY9BtyLpxL9EhgzAlUE1rk2pE01DW5UDXb9eiq0cjbh0Z1WqY+bf2Cg06lDwpR8L1sFyus15kaOup8xvacOyceY3Ep1pkVQawusKwu9HYHycZTrdp3Ki/XLClKD9j/y7PBGmX7hQUcccpswSMO9fJkNnQcWOnkZ+TGn1Ccxd/JGCWFWmyXEU55K0gGFNPr0xCtPv7gF8uWSB37xQnEqtXPg17d1C7IAYJ6txOc4p+hDks6XBe3l+w/TjUG4jtV+fp+C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:16.2602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c185c452-2e4a-4a6d-ee94-08df44365b7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB101350

From: "Nikhil P. Rao" <nikhil.rao@amd.com>

ionic_get_fecparam() maps config.fec_type onto the ethtool FEC values
with a switch that assigns both fec->active_fec and fec->fec in each
arm.  A later patch gives the two fields distinct sources, which would
mean duplicating the switch.

Move the mapping into ionic_fec_type_to_ethtool() and call it once per
field.

No functional change.

Signed-off-by: Nikhil P. Rao <nikhil.rao@amd.com>
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 13b5874fe5ad..8f0f1585116b 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -426,25 +426,31 @@ static int ionic_set_pauseparam(struct net_device *netdev,
 	return 0;
 }
 
-static int ionic_get_fecparam(struct net_device *netdev,
-			      struct ethtool_fecparam *fec)
+static u32 ionic_fec_type_to_ethtool(u8 fec_type)
 {
-	struct ionic_lif *lif = netdev_priv(netdev);
-
-	switch (lif->ionic->idev.port_info->config.fec_type) {
+	switch (fec_type) {
 	case IONIC_PORT_FEC_TYPE_NONE:
-		fec->active_fec = ETHTOOL_FEC_OFF;
-		fec->fec = ETHTOOL_FEC_OFF;
-		break;
+		return ETHTOOL_FEC_OFF;
 	case IONIC_PORT_FEC_TYPE_RS:
-		fec->active_fec = ETHTOOL_FEC_RS;
-		fec->fec = ETHTOOL_FEC_RS;
-		break;
+		return ETHTOOL_FEC_RS;
 	case IONIC_PORT_FEC_TYPE_FC:
-		fec->active_fec = ETHTOOL_FEC_BASER;
-		fec->fec = ETHTOOL_FEC_BASER;
-		break;
+		return ETHTOOL_FEC_BASER;
+	default:
+		return 0;
 	}
+}
+
+static int ionic_get_fecparam(struct net_device *netdev,
+			      struct ethtool_fecparam *fec)
+{
+	struct ionic_port_info *port_info;
+	struct ionic_lif *lif;
+
+	lif = netdev_priv(netdev);
+	port_info = lif->ionic->idev.port_info;
+
+	fec->active_fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);
+	fec->fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);
 
 	return 0;
 }

-- 
2.53.0

