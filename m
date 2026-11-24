Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530882;
	b=XxT+Kqt4BVpSLqjW6Mk9Battk7KIyaVFprk2XLkXTXcx9dgJxA7sE7y9f91UBNLCOxng
	 x9KWXG32jfnXGSabOCvb6CPGGlpZdCnQF4ujDeYF1oEcBdkZ+AakRwhE6rOVieHvL4j6W
	 ZY+bgn+r7qfQFz/hEdUKETnqq807i3UOv9xHyAeejGypyhZwotBWIsP6a5oybJKUeli2u
	 NZnvzXk3GoQdNig/4Kf0Mfw4t+jtoHA71+8ZCtIFjlLiQsPiX9xqn1IG4F9rJNcFBZJ+V
	 HSbz5fvr/VbU9r0eCSMWDuCeRMx1RVfjprVTyC4E6E3Xy4x0prmd2if5G/tZSJj7O4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530882;
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
	bh=iMjnB/NCJnNrhYlylXddG5jX7nwOYMAYo1u3CMNxOYA=;
	b=lQ85oloTTBxswRt1C2Wtm+E+MkniiXAHncQkGlcZodVSbRMuKnmTXuvQ28s/hoY4TsYl
	 AzHGPuIWjq+s4+FmnuWkAZXDKQHCC6pnbMis6HbPHiu1Zb4a3a4g/Vr5Q6HEg4l6+vqmK
	 vqz6YW4xAVGK20XWaay930Tq6izSbmHP7uTjpcA+96DArwTQkDJcFyV9XwFTxJv6TRN5l
	 I1WToARtl7i36jGlaBobrsV8G1RWu/v4tTrPt8CIJyEnAvrK8/TqdxrCGlem7j4aDRYl8
	 C0b0WrzpmjEoVcYIj+1o/9ySpGfZma7WtDW0oa38SWlbQbDN0C7PcGLrRMmJqcgsrTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Gmlzqmjv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.30
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2D606A6A0;
	Tue, 24 Nov 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F2D606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Gmlzqmjv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzj5iHNG2XnObvTtVV7TQMapnAhvKf0skLfhORwnBXLUuHnH9Bd/DDqbWrsm0T+HgCy1mxbTzR3KQC0WFWbZlghG9u+rIgKY4PGgBnd0+lCytO2ZpefdX2K/qCoRJu3k5j3essRIFhEmWDk/3Fqj2bgxHbC35zN2WEeTKTjXL6wasUji3+0KIuikABWDxGRIA9wrq2NcfvAafYCUYrzRvmTKuToO9VHujWJaD13b8MZh995mPb+mNn1GwDiTtdRAgKMzKpPAmrvv7N1Yc8/GrQG+R3RuIXqtYLwgdodRfRHWgBIaqF04+eDvJ/cv9EHp77XAiBvrs3h0R8HHAt3W1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMjnB/NCJnNrhYlylXddG5jX7nwOYMAYo1u3CMNxOYA=;
 b=A8AkyaaOlJMvJBlNCz99AIov7ehGptUQga28tmkHz60vmX5wSdn/wDEzqG/8TMgC2rIMO31cIeINpOQxkcN+zbeg1tf0g3/9K7L7okidExvA+9qSB1fK0kxNPtIG/+QhmmwwYG0y0s7I8JxP3HDsZ6ND84treFn3d/gBqkOd+6Q/lg6Ra7X9hnNYJ8zfYBjTiwuSJi+/oJ+jCM2cwqAhlFcTjfuVk9xoBcHGmeNOgTtXNI4OA2ze9vVesSR5Bc1J4BGVfmkpIhMttlcEcGgVnMr0FMAcOyqoRXl2Oq3H8CWZ62XxM32Wj0sd5X5lXZuxwXZrUU2PNcb0Bvqxgox9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMjnB/NCJnNrhYlylXddG5jX7nwOYMAYo1u3CMNxOYA=;
 b=GmlzqmjvUtL20T5vMmkd6OOlaUEtVECf4Xpm9UTMj3QI+z5rnRpNDtErzflIyezMIgwYmDY7F8X4mZYIhBY1xFMTCZUmVUQ70m0Muq0iINxhldsfxIeiBPuGZAIN4/dyP1DQ1cTwV+g6UG7DWIfgsUq6jl4n8oFCu7rLRgAzN29CBvLzG73qMphnSaq2mdmrQI7XLV4/mAolcdPzzoz7+tBqsZftLEA7NmOXnFIvLLIFZXKbY03AOCv1bz4XWLILu9UMUwYdJuEw1g8cQhMV38CCWA17HgPl/ftIlDcdzq5iILqCoVf9viPYuHOO1EaREGDGPtnouElSahMbm2T64g==
Received: from DS1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::18) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 14:34:31 +0000
Received: from DS2PEPF00007108.namprd05.prod.outlook.com
 (2603:10b6:8:455:cafe::13) by DS1P220CA0014.outlook.office365.com
 (2603:10b6:8:455::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007108.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:08 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:34:06 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 4/7] net: lan743x: keep the fixed link across reopen
Date: Tue, 24 Nov 2026 09:33:19 -0500
Message-ID: <ef118120626788ecb28b9d38283ca0130625f921.1795027003.git.cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00007108:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: a7520ddb-a9ad-4e3f-3656-08df4a380db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261009223027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jQwKC3RfLAbRau+0s8Iud3W0l7ZS9Lm7st1gqGCi3SJpEpa1vfN4t0Sdp7/ggeCJ35b56YGweX+rjk32ut06d/vwxI93wD7QgccTOIWNvP7fr+jsR0NL1xIRPi5CP44GdWdZQNXeMic6EWYy3rObz9hL9lXrG00+djmEw0CU7xn4RCWvWdhgkfB768TUgkNxwK5wP91SjbpFRrGw3PoSy08DfJFpcCO/0YpuISsVSu12K4BVoSAs96fd+/BhRkEkZ+6+SWYVPvLZd/InI8ByYTSYyvUdAvMQ1q5PhsZVnNwwxs3zeIv1HsuLgJGaQZPCV6ME//rv9Z1fbeD0bzFFXjNvCy6lxwfak0z//EGwpCOqL+l1qpHRaKiAYvM1wO9N0Wpt3STQwbyeFu64AWeBEM7obq6kAhl3/jZifcXRgDFBelCJfO/XuZFUr/5FiU9+PtsafbiTdroGyhKbl8Gu4KOtFsUebz7ZEAmkWpEfu/67MqHCibeUAUYTqXLBUMQvG5FN+yuXEnEexbLhrT9w8MKNGbX3vx8Z6h/tEP27X4kS3Qgv0wtSINpz0vFELH1ZxHN85Ccn9K0/fRN4uTugcLT+naJje5yOlvkv/aBpchqbMpTJbpYIG1gUDiZ0d4NsIBWM+bDR33RpmLKAVosRCDeSs2thCAlQjnw1Dzu7ov9FHSumPgadvl0H7XBvGnWkSQESiwlPob6OlE8ICERSSw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iqt/O8gNFLfq2in8VE8aoz33wU0g6IluPWH/lY67PeyhUOWaCHH4yeTw6LLiSswOvwKTWS+KaNpQ9CU5T1l0hmRUOVkCwmW8D3sevru7iR1803RW9r5CcfPWDGl1oKhfAfOsr+WVFZZG24glGxpn9A4lQiun4Q6rohkQrBi0XQgiQPPPUBBrmtBAS6TFvHE9SsOOpAaOr/OEkcrK3zjS6+Mxw8shhar18vOb8U9MzccMW4c+GX0UJrsm+BWCEjSL1wFnVzOLAtY+9PsEV3DHGuIpFwbDkf7dGTBSimwnT3Oko2MVDtZleEX7DLT+cabJyHdzyVxCoWI2PXPfi+e+aKYvUkAJ4zSh+zi+55mr7bsJQUodamktmLd0nviraajmdFGQg+9BCsIobhmgURQ6Llny/VNbIRIHcq8Jo/t2tz+uN4pfkuoaqfRB2UhOMf/v
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:31.7118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7520ddb-a9ad-4e3f-3656-08df4a380db5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504

On LAN7431 and PCI11x1x boards with no DT node and no PHY on the MDIO
bus, lan743x_phylink_connect() falls back to a fixed link with
phylink_set_fixed_link(). That switches phylink to fixed-link mode,
which neither phylink_stop() nor phylink_disconnect_phy() undoes.
phylink_set_fixed_link() only accepts a phylink that is still in PHY
mode, so it returns -EINVAL on every later open and the open fails. The
interface cannot be brought up again once it has been taken down, and
the reopen on resume fails the same way.

If phylink no longer expects a PHY, the fixed link from the earlier open
is still configured, so only start phylink.

Fixes: a5f199a8d8a0 ("net: lan743x: Migrate phylib to phylink")
Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 8eb0645493e6..b226078bf3a9 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3318,6 +3318,12 @@ static int lan743x_phylink_connect(struct lan743x_adapter *adapter)
 	struct phy_device *phydev;
 	int ret;
 
+	/* A fixed link set up by an earlier open is still in place */
+	if (!phylink_expects_phy(adapter->phylink)) {
+		phylink_start(adapter->phylink);
+		return 0;
+	}
+
 	if (dn)
 		ret = phylink_of_phy_connect(adapter->phylink, dn, 0);
 
-- 
2.34.1

