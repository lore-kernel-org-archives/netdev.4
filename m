Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057009;
	b=1D/va6NoWtxZ676lnOqu9MNrY+MUmAbD29zjSu2UIHF5A3E3ZVxHnw/M8N7h54T29gmZ
	 9Q1q4DrkiRDfwDndLxT9ZpnkGGcCiAW9EQrSwVdbolhXxW0V5xjgbScgWhjVx8BrWceK2
	 nzXdciaZ4FoAAVlDNIrc2Bpe1HyHk83oq25QfWTj3rn36RCdD4fdrl7uXHyE9gAdYjmyu
	 nDlxG826raIbIsUSL1nzieM6iCP5vIu577GSPWB2X53cmZYSxFYfFE5/Ic1D9lGd6AZgU
	 D16g/f6vE06ha1WXLBDxAhZCafbRHqSCJWLkWyYFC4XX/qpbPvBeNUAoFfjk8Lb0npQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057009;
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
	bh=pC0TMybSRBpyVJDAWhrY34OeDrYAR0yQt10OcJaC4sE=;
	b=TAE8VD4FR3SNGecN34rRheXcEgPFDYpcj3WEfZMSC/zlxWOHCwFi9lsHWcKHSoNsHPH/
	 DI3xY/PtQpOKqG2Dzk2A/587fApv12vkkl0dFbuHYRfLxcHKkVcoS9diT7HkA25/A8G0M
	 XzJmaxZywFfP0wzKobSMa6A6an+lMmvNGaL4cN7RW13Fn75jRliTY8ILtNWMINgSY2nXc
	 SF8cf8TVWoxshFqvtzJqeFMI2KFAdjl+RGA3m6FyQfevYfRY8pXcmlTdK8Vy69jgbSmEx
	 9bkX4+N+oCAhhb6y9ZTNzWEKSAYYm+lp8jI+wpviqzgVzRgMZ+B5mLj1TQVikmqxbXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o5ddvOHJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.23
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C460A2603
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3C460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o5ddvOHJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7jhXxUUKQ0Edl1ElvM7bhJQJQs79shlBpb3eeCHple/zMefNLcQj518Oc2hLcPkkapq9sRFcFS3MTYS6+CUu0omU51fiyqE86Oz+jy9o52CDUNWVZ1P2NhUlOLGykpP2OPJM/qRlszsnnITq5Hlfjrm+8mWUMnEu1zmiCf31FLCTczXnuA5oO+NfxRDMEE5uf4SAunkr1OCY778Q+Ck1sMXWdI/YTS0wEyBY1d0U1dqkzbvCaM6SGgQCWDSZ8/dx+Yu2Okr/7JUbJDXPDemYYR0+A6JP/+NaLUZdWmqLZia8gEGdhwD6BL+9dSIAEfBqFPiUYTVCwHvBV7fvz+aLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC0TMybSRBpyVJDAWhrY34OeDrYAR0yQt10OcJaC4sE=;
 b=x1kcTZNSJEKFaDb0dRR5eZN+KcqtTa8y0ZdUfVctlJVYzEzNoqQMURe3xwFikiZgGTMldhH7rmIbj0CSYNy2N6wSKVXpZ1bl50TQW9frs18O54kzoei6GpspuAPViy+U4qAhJ/ewbZCac51Wux5uasvtXJksfhEDVePIjiIkG2rpnmcFosihWt3zTfwBJDi4ZUKJEIWxrf2NeVWZcvwUyGFxwFm5WOdYanfIgH1jJsSjoVXs1DmstGHPyPT/PX3N0Iom8w3QJowrwMoRdhLMAZUeHLVjqinhx2ZcAZdsxkSNjLQfddnL5WNQmfgfqQSK5Bqp3v1psVvCO6jUn6pR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC0TMybSRBpyVJDAWhrY34OeDrYAR0yQt10OcJaC4sE=;
 b=o5ddvOHJ0t+HwuogQlMM6o2brQdkR1fK4ATSh0isXCvEW8g1FAyamd8iIAekCkcBBd//pCF14omvZ+1Q1uYDS0eI/I5cMefqCz6F8dcHkmUnzdTqRs4N/zwxlzXNZq1PdTtHtd59rBItbj6U5tm98bdC+gKH6AsD06H8x9g7q/4=
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:56:45 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::61) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 02:56:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:44 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:42 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Wed, 18 Nov 2026 18:56:32 -0800
Subject: [PATCH net-next v5 4/6] ionic: map the FEC type through a helper
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
Message-ID: <20261118-ionic-get-fec-stats-v5-4-c9c0ee63df4c@amd.com>
References: <20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com>
In-Reply-To: <20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com>
To: <netdev@vger.kernel.org>
CC: Brett Creeley <brett.creeley@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "Nikhil P.
 Rao" <nikhil.rao@amd.com>, Eric Joyner <eric.joyner@amd.com>, Eric Dumazet
	<edumazet@kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac55bbf-0fb9-4653-3cc3-08df45e8bee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261009223027099003|18002099003|22082099003|261026121527099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261022075727099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	300Cf4gk6eCV7fy8DLx/tV/tb0Bk9QNR960Jvm3sM5iuKl/i2J72yx6OvCWd/nGOCmoVqh188HVa5COzvGrCH+C6kinyAn1IxvrxdJMvUHGMnZtSpXFYVakgiKBxGtafSCjucTB0xJpcgcfKNdfflGU0Sas0mzkgkab3M7rYEF1ygfm/mRK4qRXTCmnFrS9x8PSwwn5vvNdPDszH+BjP2lVZmTTsplGHwQA/FiKGxo+hivAlhGw4XBZ9ZvxZbi+vq1JW2Fw2y3H9guGey0zN6ta+Bwakb06omIF6UXgWyQK1+DU/KVVsr2TSChfV+THMeo/rnD6ENqd34NwXdQ8oC+rHqyt4Dt/8JJA+vOs9r3Ayro3A8MVjwtqEX0qhu4LvpKZFcF9JDBINYlor+BqI7q8N3ViWl9nSybAHte/ol5NcruivNcLd/zYSQA804JKuttZZ/TdfA9HlfQqAOf9eUeU+fwA7oj5lm3mUY7NfENmAzc9DmOs6cR0TH6TVNqw+zX4HqrKyKoiexF3o+ZZCkT3L5ESuvc/4Tn3EBvDdHqC+MrwPhn/U4Ii6ReAth1z2RIB27pgLaliqJ8I64ksgzdaTpmctYYXF+lwoYRvRTVrDb/WZBeZKnEUQIiDz7IS2pAdL2NHjKMEgiiwANj4r4kDDynwlFCKbXyH4I0Sd/AKLVpf8lRmGrNhhNXULy5g9oYcF42fO3Q9nhhZYPwSP9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261022075727099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JFFpKXZErJjDiUhjRKaMpa5ES3lFTl/4AU9ANA2cSrUVsxHJnqKOgdK6b0IkZVuPe88iGvDVajaPji69vM7OWzaS6uC9Dzgb4Y36opeTnT9ZKdYIU5BlkVJCtiurmVYPRFAaHP7OvBarSEXN5adBLS6I/NCNfEXmFNK7Hh/0zMhHUoUUf1POEuwKa8p8uMcwIc+mdqzoyzNqESIUCY0oJg5ygyLqSKvBupzJiks/BEw5Wzx/cjkt45kboOyREJjXJLJpSQW35d71At7BdUPghzUOFaLVHH+XXAL7b/2+RdPXtQxGsPD5LlyZuvO1EASZ1Y7++ypLCLfyGqItkQHgq1Qe+TaPQNsJfmcDXWhRJRcb1m3X1XbuVltK/NsYDWD2wOeZk0S7UHeUqHYj66B0MJ0UnCUdbmfDBSprdigWomGfRGFDiH7olBEMCaRpA+ih
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:44.7090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac55bbf-0fb9-4653-3cc3-08df45e8bee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429

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
index a192302c5e19..c55148f3ae8f 100644
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

