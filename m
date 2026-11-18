Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012839;
	b=lwAxQCHpkm04BfHoOUphUZKY+I2n3eB+OfxUcizcoQAFQchIeA5FkfaU911JhwJg8F2X
	 BKTFPU6ICPrirxcTEe7X2I5g4TBnKcc8dYgmyvlvhrs3B4P9efkYM7syWrcfwpcE3TEax
	 uOUZjI2Meka4KDr9z0mu7mUXDZkNuMajlrGPfyNwHMm95+NDwK7w28tRxll+onBad1aW7
	 sGQzY/LPZdLP5xY54l+5wi4JLqa3Z5azV7VRR6PfWkz5IcvPgJGffZA5kk8XouxHc8+kz
	 HuGOVtC3Ehu2hCkNkQvhFK4mYTa/iTK8Ip81YkBtiCvivz3qvFqsnNjqcilSNsAPz2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012839;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=LhVoHzvEdL/Z/KdmPXXkuybPf4rArSyXNKEfeIYny9Y=;
	b=Dm9UGgsN83l/gMwn75KHztf367TX3aw96BtfCo3PgdCQrEN4ur1Ex3lyezZTOZsIg2og
	 Kf2xJC20PQ9wFEU3e3wKUyno3pw7PMSULExLhNIsgUJ+QRJinDFz+csM4pG27unNPPrgl
	 Y3+pQ5K3RwcXJ865kwevu2Yckxd0Exl4w4XOWNbIxaVPCCYRcm/+CTfZCQPaZAVP1G4gb
	 nmPb57yKw7Fe7i06jZAduDePT5cqYoBDJT7DP4IVT8/nnuhMnAyhnSoSertNJJUQVoZma
	 ExEbAer8HxbKyyHD+ilOyew8WTWPpzBGipNhfOtAm5MOAjIOylVIG82xZaEBUZ0iuWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EFzZ2Ez1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.43
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012043.outbound.protection.outlook.com [52.101.53.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44270606A32F;
	Wed, 18 Nov 2026 14:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44270606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EFzZ2Ez1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVFdlWe8LgBMJjPhBjtstrDBq2bwxJdovoNxcLAEP+NehqaxffvWiYUax83sMY6A/zVYsgRrafa6U/MRrWRs6hmSvMca+kwbcPzCO6d6Iaf6+8KCi/89U4EdiRUe0FWx9OlVcEbVJeMP178s+GvfxAfKXFseVSQiEIya96OWIbh5L/gMABhvXjn6+x5s9t9AN5F2Zp/a0PVAD60mKGoy9FPNHoLbSGIepoqySamzCFZwjeIi7FZuwGbwhE1w3s4tbDFlr85T0kljZ4D9qmQVXBfE0nc8deZAETZfD7JdQarEmzh3pBHg8ldDg7G3U2gNRg5PJEVhbbiir3MU9ICK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhVoHzvEdL/Z/KdmPXXkuybPf4rArSyXNKEfeIYny9Y=;
 b=CqaRC0EsRs06jKsd3sWJgAhAqD+/WTyxAwIPXK9Oo4jrXMNpw0rSXH5wAneaM+ARvk9y9GhImMRUWCFSIJ6wp1w/Ya5X7Ymb9J2Kmf2pHcNAmr9gUKXqt69cOWTfuUmbrZUtfC8/ceebWLS1YKJaEswAjDqpVCgrPpwERfNE2zNePeyEzNure4UNN8xtnCh8blvrmrHUngg6axmT+W3f5Ggd+FWiTEI6f/iup3/fiXiNAFNX8x5yH2mw7740hcuZA/5OXnJwnPXPxYZpgcZXqQeuFSmtOGiBFlTEELP2w2BBTVhYgKUJImiNy2QFHazm9VZ3qHBexd8+ejNKxsqvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhVoHzvEdL/Z/KdmPXXkuybPf4rArSyXNKEfeIYny9Y=;
 b=EFzZ2Ez1aHwrrQ5UgKaFM3e7v8upLAnDDL4Qz8kLaUZZWiWVGp13feZYd1feDGdhWBCnrmxRgBJ7MgPeP9BWajy0e3OeggM4yrAgg0P0ZqO0MfdlSPvOvaZcfKFHCZnBdZ4Ymx4cnaiuyFjRa8J4KjyZH5aQbc2s/tWgMhlWyV0=
Received: from CH0PR03CA0450.namprd03.prod.outlook.com (2603:10b6:610:10e::28)
 by IA0PPFD4454CAA9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:40:36 +0000
Received: from DS2PEPF00007107.namprd05.prod.outlook.com
 (2603:10b6:610:10e:cafe::84) by CH0PR03CA0450.outlook.office365.com
 (2603:10b6:610:10e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:40:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00007107.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:40:36 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:40:32 -0600
From: Prashanth Kumar KR <prashanthkumar.k.r@amd.com>
To: <netdev@vger.kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, "Eric
 Dumazet" <edumazet@kernel.org>, "David S . Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
	Prashanth Kumar KR <prashanthkumar.k.r@amd.com>, Sarath Babu Naidu Gaddam
	<SarathBabuNaidu.Gaddam@amd.com>
Subject: [PATCH net] MAINTAINERS: Update AMD XGBE driver maintainers
Date: Wed, 18 Nov 2026 20:09:10 +0530
Message-ID: <20261118143910.3573840-1-prashanthkumar.k.r@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00007107:EE_|IA0PPFD4454CAA9:EE_
X-MS-Office365-Filtering-Correlation-Id: e280369f-ba0e-47b7-6c66-08df4581e85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|261026140227099003|56012099006|11063799006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oJyDvBQyqvdp2+WFZiKwvK8YM1XzVtytH3bkWt2QjaiugHMzDCCjx0aKGyq8N4SkEKmEfL4cI5OytXHQ0OezIBcG30Y1xWrwV5tG9psFRGCxsVQDOFx+tBSIvRKSBgITANZajLpcmFRGzpyf8GstOi+ReOtCXUf5wEWOxPILS50lLTHkQTAc+DZabWGFbRkAPz6Gg0pYc6OIeAx347C9tRHe78sRyEFg5+Uq2CMgQQPDoUNEbOw0EBKBma3tzzdYHEaMSOfbH4Re6ke+GXirLa0j7TzgW6Wrmaqehn1Mg+z/9H1jOGFDK574oXZEsQEw3rRgUf2BbbNDMbclbcBbISQdIU4UvgcF7lGsacNwqHLAesSaEKqkzmW8LalNWTqy54d8Wf7xS9TSOlCFV+YU3ShU5AyWRni6CQAFQQkLt6kq8B445RhEd8ZiCTYbsm+OVAvRuKK53HkQzDQjf9y2xA7l/J3WGj4r+X5aBr8M59zSo/Ko9CGf/dUR0qu7gs1FjsQQcdD4b+iTKOY1l0p7SFNVdGsx8zCwAUCFj2nm2nSQJxAUM8aBBoRNtVL7H3P1TOBnvNqoOP4Jbm6DA3kqKsaD6XSg9XXvILDPEeN6bBJwPUjHEDRM2c6UxO5fXoG332oZ9aZvg/oK0Y1AEWsAOuqWFs2ftMwBa/JBWjm0623QIDpOX6FSOic85cIaehwQnLq9ydonhRsUd1xpMxI4tQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(261026140227099003)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MPP+SfIukL1tfllKQs88u15Ay011EQYXAyMle0irrFuhYX4xS50areiyXZjtJ9840BGhVDL0XvkdmSd3nX47LdS/p39X+Ia+4ybzItPeMEVwl80sEU1jzWZCxMNB4ZvV9Z+s3/b7jn+mEa038JkTQxkzD+e0Zcxwu1nT79lu+2XpntNnjMCG2fgdClXt+VumFdm9ZsS88ojcM6WC7kM7MaD1UzP3WHri73HtKXHKT88pG31efxRozyQ0bHqjhEObZo/Zftge+eRJwXS7Ackfu/phN+y7sCUwYpFznZBYL9MEXVN2AbGWuJyQGSq+7rtdn3zkd3lUSjjKIEaAiN00T22F2RgA0xfvESoHgCHzlI0AWR++DdLEGN8Lry7Spy0Rprt6zLOYTv73oY+WhUB6ZVptbU0cXskUZRbQVmoInfRpe7XGaajJrMh0stBL/8LS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:40:36.0555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e280369f-ba0e-47b7-6c66-08df4581e85c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4454CAA9

Remove Raju Rangoju, who will no longer be maintaining the AMD XGBE
driver, and add Sarath Babu Naidu Gaddam as a maintainer to help with
its ongoing development and maintenance.

Cc: Sarath Babu Naidu Gaddam <SarathBabuNaidu.Gaddam@amd.com>
Signed-off-by: Prashanth Kumar KR <prashanthkumar.k.r@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..64e7079668be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1376,8 +1376,8 @@ F:	include/trace/events/amdxdna.h
 F:	include/uapi/drm/amdxdna_accel.h
 
 AMD XGBE DRIVER
-M:	Raju Rangoju <Raju.Rangoju@amd.com>
 M:	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>
+M:	Sarath Babu Naidu Gaddam <SarathBabuNaidu.Gaddam@amd.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/amd/amd-seattle-xgbe*.dtsi
-- 
2.34.1

