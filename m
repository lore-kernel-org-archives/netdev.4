Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870438;
	b=Qxb2RD1Pt1zINx1T8CHg4v3vdlGn2saBRo6iYTn4k+fqpi7Oo2OIFKDi2UBh+2z70wCF
	 39j4WKDt9hr2XTmMRzFukJtp8Xtswc3OejJ1JXq7/ToGGlJ630UoD2ILRky3MiLNkZ/nZ
	 1CSy2UFFF2pkrI1AWytKz4nIN2KazTivaFujaIuKhGeaTuLzj2zN9SGft2iiMn0ShAbXh
	 X12MsMD0FtMXZc4YbGAJdKY2k093kf0OHTgdcXx2QKI0lIGsGz8C8wMIz80YOBv3MtT60
	 PVr4rFxmwCRElRZoXAIomaVDhS4z/M2n7eMiUJKyG8wbz0t7/VjlmC3/ubk1jVgeibw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870438;
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
	bh=HTElm5ghyXuWgFT987hazjTZewi0yjyuVLpJXxS3FKk=;
	b=Fh9Nfyt4b5qoGb4/rYWFtATT6LFKsZrsR/cRO9c1a1W9MojSVzD6QzNDstZrqqd94IOp
	 uZhxWQUhIynP7IsZD7UQAOkECwMFtszopzDjK9CzVaX1BrUzEqflMI/GW4eR1VMp2t8eq
	 E4psGz2mo6dByqFhh/6SN7HhSxI3YojnRnObjPiUVULL6Lb4iL9a4hORhcZZKZv/EzJC8
	 XezXcqRItlIwEHMJ6JYhEdsTASCsKNL+eaPBhaD9svYSYaAWmXqu7ltD6Q3DBfxZ5ESbk
	 7XSArXstgdA9bzkCjE2sJ+w7Gr5/+1KegspoyZJM+9U7r6q1D58WcgiN7pAyDrmU9/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xU2lc3hV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.24
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31072606A330
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31072606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xU2lc3hV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiF2ToOkqpGst0vKogv7KlVaDG178oo13LneaRrWs34o+aArTUWxgJQDbJRsvDisKUijYrPvXfIWKtQy7NQpvvDm5sOeLDOz4Af+hFqz+VmzALZVXG+VZKHRROY+wUbzws+yTLOSHiAN2Ih+Kqb+NvoB6zhTcCmB8ML4QVqB2v7iRlZ5PBb5pkYkfvJVSkYVl7kNU5ydInZf11/PCk/vIHAp8jEBPapZkaNF3iokg29BUKY8TmQuMmIkThahLwkOpRsphMm6a06OY73fYV7Q+ZTXMJKeKBSWV5YEkj7yH9rKVolwLpuUEr3nc9DsmM2jym9AYuj0sxxkvQhbGwwOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTElm5ghyXuWgFT987hazjTZewi0yjyuVLpJXxS3FKk=;
 b=OS56eXNQnYo6tV/+ypKXKJKWPSwEeDTqfEeFdg5pZOFVMqlE+DukEJ0RUbiXKwI8VS5wVDXrg2J7XNni5Zn03Oviw3/WuAdXkV0ZX7S1yZDUU+SdSUV+uDQ+Gj/nPk7IIWIjkqQ61QdFbmwn795lIO7v0FaNLFoC7DcJt1S4agoyW+5YoAvhpxibjL/FDI9SEBguBkWYelOJT2RzD6XSuMktcLZye01/4QwExPU1UA2DjMsJ019edY1KajdBKFJZdbC08ZdivDECQjGwjSWneMBxmOzYYZZpXMPRW9ElkSzGnclvcYCVvTe3iO0MTpqpkj4iNLDppOTVDcegLT8yfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTElm5ghyXuWgFT987hazjTZewi0yjyuVLpJXxS3FKk=;
 b=xU2lc3hV1FlPtNHEJZvuqqDXH/tKIiwCKSLUSm+rUytpKFTqEAvG+M7dlhVqWg1KKoDO75XNg0Yv75SB46HLBKx145MhTpmsyEq4VMdgv5ahADrrwTwXd9FCNbosJUiOpGJAcioUup1BgjR4RGatS+WAh5oAMB+hTI3fPBtn3XI=
Received: from BY3PR10CA0015.namprd10.prod.outlook.com (2603:10b6:a03:255::20)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:13 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::20) by BY3PR10CA0015.outlook.office365.com
 (2603:10b6:a03:255::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 23:07:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:13 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:11 -0600
From: Eric Joyner <eric.joyner@amd.com>
Date: Mon, 16 Nov 2026 15:06:55 -0800
Subject: [PATCH net-next v4 2/6] ionic: report FEC off as a supported link
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
Message-ID: <20261116-ionic-get-fec-stats-v4-2-d25cae9f1e87@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: cca30886-6ea3-4918-472b-08df44365998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	flLxWg5Uh3vyKN4ok1VbhvknpJ3RTg3MTGUZzGrEmZh/ImbKS7Af/R1vgpWtTn5PL9Fs1BLbg5pgws+9uO3xaAhn75wc7Doid2qBVcsQZAIr9jXvChyc6T+IshJNYiOt75Cuy9bGFYXjaXxyZ+/Xd9vw0u5N1g/H3+15jAhaUSI5VsOIxf2VMzmUFXng969qZkM3M6dUMBgRy22aAeXGu/QB2emw+3pM2dAamvDk2jO1PzRovxWD7LeId8YJp/8bNUGHO65bjPk5rj+MRuPILKEn2gIvx598/2nH9Y+AeK6YJwYVVjbfewsXc++9qw19ZmwQtFWhh+LRFV0EFyDR3mBXM1NHFjblqRnQT0rWhnm5wnZ5z11E9sC7fGI82NU1f6AGgLd2WLPiF9J7ENANvWaKwwUO1OVebjkOoBm7G8rq2GzwvxPx92hFN/monSmGpjE7ta5BP217c0ZHtVrCJwRxXQ1ZgIcPUlQtFDe66fXpDGBwl22Tuoieh9Q/4I0UcQRtdG8eH/56Xteo+vxJ05Snyb2gjtD1PRjZuZFiMccZYJVmRVbmbNQYbfmoaxEqT/HC1/S+Hv9FoVZK9yrIZQnGXNRBM2RjgqP08gPkl71/REpy1KORSkFzZoZbCQa646v2vBMTlrG9bctEaVFZZekc4lS6bKpaAXsr1SiODGD9yNsqdjHZqJm+JXcfgo60JGV6ICQuX+f5eqHVv0s9fg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sALHFtp45XJJ32K3vtz7f3Sx3SqAAsYm7DNp22X9VTkDLUQeqQkB30SeqSo4TcXVg/zOJlcc52+7faJINuYUkXnGWBlYeg3JdOkBvm5BBtLZIcGf7CaIyPVcZ3BDvO9KCGADFhJtH+8axE3wglOoaQ9EJFbyJxLW4dWBbMP9FAXYL1kM+9k6nv+5nl/G+2VvsrdhqnrAXqlZzInD/3S9J50SMGqfsaOxZa3gAMmsty3Xh/X5uRed3puRT9oTdfda7MDrH21Tpmf3kREyB0gH99wjx3+0ByS4JDEdfApFIQqht/n0G1ErpbVghG8gW0J+U854gp84XybZkRxApsK4y5yuPgkU2MwkzMCw5JkDGPPVVCKzHcJB+8ktEOB+XxC6FXoH/1pGvwdH+qewVkGUDnEPvOtnU2OfCUfb5rIF7hHEqjHAQ3MJkzoIUkc3z3QK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:13.1245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca30886-6ea3-4918-472b-08df44365998
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978

ionic_get_link_ksettings() lists BaseR and RS as supported FEC modes but
never lists FEC off, although ionic_set_fecparam() accepts it.  Add
FEC_NONE to the supported modes, and to the advertised modes when the
port is configured with FEC off.

Firmware does not report which FEC modes a port supports, so the list
holds every mode an ionic device can use, and firmware rejects a
request for a mode the port cannot run.  BaseR and RS are already
listed on every port this way.  Off follows the same rule: AINIC
firmware rejects it, while DSC firmware accepts it.

Fixes: 4d03e00a2140 ("ionic: Add initial ethtool support")
Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_ethtool.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
index 119ac720c078..84378bef9fb8 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
@@ -298,9 +298,16 @@ static int ionic_get_link_ksettings(struct net_device *netdev,
 
 	linkmode_copy(ks->link_modes.advertising, ks->link_modes.supported);
 
+	/* Firmware does not report which FEC modes a port supports, so list
+	 * every mode an ionic device can use; firmware rejects a request for
+	 * a mode the port cannot run.
+	 */
+	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_NONE);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_BASER);
 	ethtool_link_ksettings_add_link_mode(ks, supported, FEC_RS);
-	if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_FC)
+	if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_NONE)
+		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_NONE);
+	else if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_FC)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_BASER);
 	else if (idev->port_info->config.fec_type == IONIC_PORT_FEC_TYPE_RS)
 		ethtool_link_ksettings_add_link_mode(ks, advertising, FEC_RS);

-- 
2.53.0

