Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.57.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795057003;
	b=ZkFT95WeTOo904b5BK+Xw6hTho9LzK7wURpyyRfh6OnLsp+jgVUeYbRw9lqShP0RY6sH
	 a+LZF6G/5zsl+HgF39YiVYSRN/ufF0MRHImxDk8fGRIix/ETrEBw9usIV2t1VJB6QzVz7
	 po4kBYpI3Cmh1Uc9HBviWGTop6d3OGViSLhdidRriJ8TsxWiQzxYG6ZlaVbD8/9oKKYCM
	 JeCR0flEN2w0O+TOgt3bJrjRwEwY/6fWmAM0wc8qlJOsq2jrPAkUkx3CPIknNfTpu3Zyh
	 L2FHynAFKRUIeqsQtm0zg7xTnFfxxlmHmp3PZEqcx5qrJYRSon4iYkd1kP8Uil4ec1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057003;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
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
	bh=DLHcdJzbpUyl5MIQzwE1h84ZYCg3TheizzQQSCofCro=;
	b=dJWwa8Adq7PqXxq4jv2OjkBYYkbTH1smfGSkczj/k+sbFI5LQhZhoGOUstpv20lMobKy
	 /ek9Tjd8DF8ezH0cYNhIbqLqJl0GtNeT9xJ4BGrx1Qzjx8KfN3oZiHaHvim/WNryiHvol
	 BX9tcAcCgbBKcbkVXdBon1UQ8teNkY54jlwpOutKmHsg8DO80a1vTIqohGQiD3pEgv6H8
	 6aJ73Mvwhskz5b8Z4v+sjCVCX7rD8qfCs5KQs3jNXKj5Bfv8uw6mpXlkCkU27xVFS3BUm
	 U5sbTHAaWZKDRRPh6XFYkhgJHy4LkoJsQ2TRA8iQ3KJi9qkyWalwvGggIHK1eK1zilw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0pKPy5dN;
	arc=fail smtp.remote-ip=52.101.57.49
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65D606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC65D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0pKPy5dN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOnsibrPxXoZ4YGLom0ONOjlTOwzllY5KMW9BNH4/yAgoeDRJC1SKj76B25fxYLhyOxhOIQji+7yxyiD744t3QArb0NjnPfFXtOdowfieEfbCs4XemSOEXWoeamFDgO4CsaHa0BpyqK3LhP0Ky7xFFxx/nIOHJ2CsEncoWD7PCN0ylWfYE0xxeB4F/yMaVDt/8k7jwCOG34yyyMT7CJaLDHgfGH+aTU2bfy6/6qiAozYp2lFRO07iP+t3kQJ8q2y0Ol1bPBJ7rFgQSrUDOEL02IQGG+gWevATIjVZ6Tl941HpkS3aflCEl2cbXjPuirmprRk6vtyU+5rVidBWfLIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLHcdJzbpUyl5MIQzwE1h84ZYCg3TheizzQQSCofCro=;
 b=bVXdBjkdxvTpKjrLucIVDafgTnNvskdSwEYQPoeQtkyXlfUXX4pFnehWiELYn6UKQi6oPZOe2aG5P6w7eaSRUm6luJottronhXxIpLfWYccUlAKn4KTAJpV+mTVhXYG5a9HNpeLs6qMGqy3Cj30O8RDqwrsT2MpqLh2hbTntYZuwi97081qYBzg1sP/jfSRL/hM612N8OTmFoPxnAM3P7Ii65F2dn3vufypyn5LneyKyaU9vQ38bn3sRFAhlqzLy7zi0ywb04mO4/VVoYzGOHcAElj1jIW7gG2CCbNJSjD7PutAi53GlfbVdux1lbKiOfdvJ2E+le1dKyDm0jW5stQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLHcdJzbpUyl5MIQzwE1h84ZYCg3TheizzQQSCofCro=;
 b=0pKPy5dNM9zIqkvWXH9Q3FtX1WLV+8fGQkBfDUI57x54LWfrxanQ5LuG+TD6QNWxQkalkU88T1TTdWoN5palKPRb1fV9sRvTVN4aFqsaUzvgQ1ntj3LpJarF+2hKEzbNMijXOaOOshm1NyTsRGWiA748878K+cDfTmuJjYJwxT4=
Received: from BN1PR12CA0001.namprd12.prod.outlook.com (2603:10b6:408:e1::6)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 02:56:38 +0000
Received: from BN3PEPF00022BBE.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::a4) by BN1PR12CA0001.outlook.office365.com
 (2603:10b6:408:e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 02:56:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBE.mail.protection.outlook.com (10.167.248.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 02:56:38 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 20:56:37 -0600
From: Eric Joyner <eric.joyner@amd.com>
Subject: [PATCH net-next v5 0/6] ionic: FEC reporting fixes and
 .get_fec_stats handler
Date: Wed, 18 Nov 2026 18:56:28 -0800
Message-ID: <20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwW7DIAwG4FepOI8IGxLCTnuPaQcGpmVSkwlQ1
 KrKu8/isLXSerR+/599E5VKpipeDzdRaMs1rwsP48tBhJNfjiRz5FmgwknNYCTnOcgjNZkoyNp
 8q9I5ZfXkJuPULLj5XSjlS1ffxcKrC12a+ODklGtby7Wf26DnXbYaEIxCGGBE6yRIfisMX+t1o
 fLmz3EI67kLG/61nv2zIQOgkyIbkazCR0H/CgDqiaClkp+8kOKoo/L2UTB3Akz/C4aFiGPw5BL
 QfCfs+/4DzJa30XgBAAA=
X-Change-ID: 20260814-ionic-get-fec-stats-990736964908
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBE:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bc2629-3601-4a17-a1a1-08df45e8bb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|6133799003|13003099007|11063799006|56012099006|261022105027099003|261026140227099003|10067099003|261021135927099003|261028144727099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Qcf+imrbsfcGZ21KXF9r9PvUCEFOV9B+TL1oR+SwhNQfVkVv0V8EQKFODDneHEu62GU0/304GtpUOlD/1kRxEVPWZqMWLYme716D/xOaSfmrGC5lmoYququnHF4NH0VtXWZP6yoZopnTqi1IVxfBCT3KD40zQFwRNzi9kKZ9zNWq7IwoH4P1N6yu57C9HJ2pGAC9t4o3/CQJ/ieUoMyhkQ/DHLVp8Jcv0rep+g2i/S3bDS1ROFGYOS5KiX5MgDgJqOLfSTo3zd9EPfS8t/J04W/m1HC2PJs9MyzUnHEqeGUa+YVndh2qfV6yTEGvFGc3e0bKdd+ZuZ8eQXB2ODzbG9A1FBfvADUhX9kFt/WDE1Su9BjrEcVc7ZGbzXVQ8m8eOGX3QvxcBFWv3nMyTjTBGMnZWZx4Cxqy1epXeFxuFgWdFSKNhQT0JUM9sfSiEwcoA3pJyxqFrbm4cDHBebw47eTaRQjYe+/xpm3ta+gQ8RcWB84zAPLATX5DAtA496jN1+hXFKiIkJhfCrp7HaFv0566xDMW+naTsBPA++WiyswKuaEQjLQxQIsAXlODogAo/Gk1q5MLx3wxAu23ydsiyMWVVOFjfqhgY6npU6PvfLSucW/Hkwfb0/15BRRCc9UxOaOBkUB2jdOejQSsgZjC9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(6133799003)(13003099007)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(10067099003)(261021135927099003)(261028144727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d79sTBXLdUikRKnfuA/ujG95+fHuk3sFzrP3yPYNEStZm2vCtI770k1/Z+ItXrIBjzZD4oER1yrPi0WRRbhhofJyiyr4nMQ+as8kqRIP/EmuDg2SCXCI9UO55svgAwkx07elEZIi5AUsM307JbQHuoTzY/dO4eU5fq0rHRjGxyDeut+yXHIjdYzzGGlyV4VEbhtiD4o5JbjupDO9lTVfw6Zcm0+KDl6PskANCb0N8OUBGD3KEvpdrlh73/9r9QjbO9RiSyBSIKm9uiRcXo9BhpKBDxJg8B7bMEZTc5cGS85oI/evn/1net8xfuRDcFKNpJvu7/EwaOjfaSkQ9QPB0KzHK2uCAWnV/1z9VF7JbCqgcEboje3eFJ3fwwbOFX7QUfXnOBTTxPQggD2GD0wOTLZKstsI6LOdFvB3Sk1FXrG6mBDol1rqrnT91zx217Hf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:56:38.4116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bc2629-3601-4a17-a1a1-08df45e8bb27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760

Add a .get_fec_stats ethtool handler, and fix the FEC reporting it
depends on.

Patch 1 writes the IONIC_STAT_INVALID markers in extra_stats one
counter at a time, so a reader that tests a single counter cannot see a
torn value.

Patch 2 adds FEC off to the supported and advertised link modes.
Firmware does not report which FEC modes a port supports, so the
supported list holds every mode an ionic device can use, and firmware
rejects a request for a mode the port cannot run.

Patches 3-5 fix ionic_get_fecparam(). fec->fec reported the constant
set of supported modes instead of the configured mode, and
fec->active_fec reported the requested mode instead of the operational
one. Patches 2, 3 and 5 have Fixes: tags, but the later patches build on
the lines they change, so they are sent to net-next with them rather
than to net. The bugs only affect what ethtool reports.

Patch 6 adds the handler. It reports statistics only while the active
FEC mode is RS.

The netdev AI review of v2, which Simon forwarded, asked whether the
per-bin local really guarantees a single read of each counter. It does
not, so v3 reads every counter with READ_ONCE() and drops the struct
copy. The port_info lifetime problem that the AI review raised on v1
and v2 is fixed in net-next by commit d90d1a768b3b ("ionic: fix
port_info use-after-free on firmware recovery"). The netdev AI review
of v3, which Jakub forwarded, found that FEC off was not listed as a
supported link mode, which the new patch 2 fixes, and that patch 5 made
old firmware report forced-FEC links as FEC off, which v4 also fixes.

Claude was used while developing this series: to investigate the v2
and v3 review questions, and to help write the code changes and commit
messages. The authors reviewed every change. The series was tested on
Pollara and Vulcano NICs.

Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
Changes in v5:
- Patch 2: say that firmware leaves the supported FEC types in the port
  identity unset (netdev AI review of v4).
- Link to v4: https://lore.kernel.org/r/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com

Changes in v4:
- Add patch 2, which reports FEC off as a supported link mode (netdev
  AI review of v3).
- Patch 5: with autoneg off, report the configured FEC mode as active,
  so firmware that predates status.fec_type no longer reports forced-FEC
  links as FEC off, and add a Fixes: tag (netdev AI review of v3).
- Patch 6: gate the statistics on the same active FEC mode as patch 5.
- Patch 6: explain why an RS check is enough for the histogram (netdev
  AI review of v3).
- Rebase onto current net-next.
- Link to v3: https://lore.kernel.org/r/20261104-ionic-get-fec-stats-v3-0-b261fd53d0a7@amd.com

Changes in v3:
- Read each counter with READ_ONCE() and drop the struct copy of
  extra_stats (netdev AI review of v2).
- Report statistics based on status.fec_type, the operational FEC mode,
  instead of config.fec_type, matching the active FEC mode that patch 4
  reports.
- Add patches 1-4, which fix the FEC reporting the handler depends on.
  Patches 1-4 are by Nikhil, who is also a Co-developed-by on patch 5.
- Drop Vadim's Reviewed-by from v1, since the code has changed.
- Rebase onto current net-next.
- Link to v2: https://lore.kernel.org/r/20260814-ionic-get-fec-stats-v2-1-13f0e7d2e702@amd.com

Changes in v2:
- Latch each histogram bin into a local before testing it against
  IONIC_STAT_INVALID, so the sentinel check and the store cannot be
  folded into two separate reads of the firmware-updated DMA buffer.
- Explain in the commit message why the RS FEC check gates every
  reported counter rather than just the histogram: they all come from
  the RS decoder, including fec_corrected_bits_total despite its name.
- Rebased onto current net-next.
- Link to v1: https://lore.kernel.org/r/20260731214021.15279-1-eric.joyner@amd.com

---
Eric Joyner (2):
      ionic: report FEC off as a supported link mode
      ionic: Add .get_fec_stats ethtool handler

Nikhil P. Rao (4):
      ionic: write the extra_stats invalid markers one counter at a time
      ionic: report the configured FEC mode in ethtool_fecparam.fec
      ionic: map the FEC type through a helper in ionic_get_fecparam()
      ionic: report the operational FEC mode from ethtool --show-fec

 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 137 +++++++++++++++++++--
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |   8 +-
 drivers/net/ethernet/pensando/ionic/ionic_stats.h  |   2 +
 3 files changed, 132 insertions(+), 15 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20260814-ionic-get-fec-stats-990736964908

Best regards,
-- 
Eric Joyner <eric.joyner@amd.com>

