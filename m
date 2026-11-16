Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870437;
	b=rRWqbNZbyjXq65lOao0VxX7wk7HdHL4OlXfIrEZX1fpsMiFyVoz4HfIN2+VZ79o/aIUf
	 LJeuBSs0oLDFtmcWUBqzfxidpvpOFiYQMjI+1MOFqKAbWf0iQ+5/qCvWE1oMTjDRniREk
	 gJuooMqoJkX+NEwwWeup9Mvx8P9vAUrq1XHrmo1VN5zuFKwidh6+qKACVDOKGnUvjtUmG
	 9nw9GHoUfc86y1WJnwhTP4E93oVREnhGnjrnl6E6YFiroFh0NBT/CWayhqIPR0keshCrU
	 jogVekA6jBJL5Kw5eIrz7zsJLww+XFOBJCbd6H95y7h/JYYZ8FLlXzSG+L1ju6bRqZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870437;
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
	bh=xd45l5/ruYp6rbC3nTyvYWz4mTJ92S2msEVvggiCNfU=;
	b=pV3G6IMwRJYKWdtWN8VOVo7xgSVhJnPAzcunUkP2Xx2BDnQplUSOPPwEgrJokcds4GFS
	 aV6dYFaVDkYc648j8UE9zeVee0Kkgr2F5SSC/bJvDJMXDWFlSymdvFpe7Ai/R4uXbqTR4
	 xH5A2jXfD5JPTiWAs1eCDz7Iy1iXuCAQHp4nUnfqR/0PzkD9oDh86FjxBqDGVnNGB84Wz
	 g1pQkD9ahRqtj/68meI4zy/55ndU4ghDQVG6BgXq/BCb/AEG8ig4iJweYlhkTinOdW59n
	 /inYW84ZXKamLRmKzI35E8JENnuT6zJRpVkM2Q9Gx9BQz28KOTaD5Xh/rcbu/xbhaOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rkLKhuu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.17
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E0606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 604E0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rkLKhuu+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/X0bnk6GeIHTx1WsJkA0Nlyg5LbqbNV6i4tj2SecMD2/wlTJkccIxTTgEchGtDSscPrhEYrE4oD7o66B7rcaVGd9CRJc5XUXEdW3IMYOgPy2ofn4En9dftvTclXSAeNb/nSVkDpfiOr9wWEKta/fMSHFiagluQTxC8Fm+VrItM4ZTnOc7Cn8Ed6u2skc/vohDlMBlpg+KDoBCxX5rbn99nfpeaj5xJjoHUelZhlewJVltNCkPOLUqwB0ywSCKapyUVW/FFYbZWgVSt8/a/65rMBKzd5tW/slPcUVb9mQKn48+eo2TQu6VWw1YW08Ijtz84IaKaauK4XFhixCaFvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd45l5/ruYp6rbC3nTyvYWz4mTJ92S2msEVvggiCNfU=;
 b=akIilH3JnEA9pgdGsWgQjb2ejeh3Z72W6JmXqW3kTEa1s08KV+MJKZuP4viBVmYvCXuuYb9X52Ha58b2wM0CZayYUTC5KLQxOA1hZzoUk2VFFEUkS3kcC9r0zeUmAQ2lETQp/CMUW+h2MsTF1gNSkERBu5D4ih8PQ0eMZgGi6Pt9dywSwWCMb/OVYtMQ45IL3XCFkGlAFEen10xOO4NXANCjHsESLZ9GCFqw4kFP0FVxFJABRztYOSJFntyhcSHm8AoTkMqp8TvolqEvZsaZAZvrxgNNquRydf73FH2oJ/5ktJMsGkvL6ZVbWzVhf/J93FMpvpDiPp83q/91LUI5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd45l5/ruYp6rbC3nTyvYWz4mTJ92S2msEVvggiCNfU=;
 b=rkLKhuu+MgxQsi1bLYBoD0JJf8QiAuDIM5dtb4Ojh7niw3c5algYZS3VPyVhF2d1hfHZkJy+vgSv5xGxwIH6HO5UST0ldrEYQDADaLBf+xbydA7NmQ/pwoiGj+9VlMyD8z7wacrOgz7erz/DKujB8BYQZJ/1dTNj5tQNCg/98js=
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:07:11 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::42) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 23:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:07:10 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:07:08 -0600
From: Eric Joyner <eric.joyner@amd.com>
Subject: [PATCH net-next v4 0/6] ionic: FEC reporting fixes and
 .get_fec_stats handler
Date: Mon, 16 Nov 2026 15:06:53 -0800
Message-ID: <20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQY7CMAwF0KugrMeVnZSGsOIeo1mUxIWMRIqSq
 AKh3h0rCxALltb3f/ZDFc6Ri9pvHirzEkuckwz9z0b585hODDHIrDTqAXfUg+TRw4krTOyh1LE
 WcA6tGdzQO9wpaV4zT/HW1F+VZDXxrao/Sc6x1Dnf27mFWt5ka0hTj5o62mrrgEDe8t3/fE+cD
 +MldH6+NGHR79a3fxYtAJkJ2QbNFvWnYF4CEX4RDCAcZWEKWxNwtG9hXdcnwTU51TYBAAA=
X-Change-ID: 20260814-ionic-get-fec-stats-990736964908
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcad0e6-3f11-4197-1076-08df44365814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|6133799003|13003099007|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261021123027099003|261009223027099003|261021121427099003|261102123227099003|261021135927099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	0vxtnm1x1oEbqiefow4OPxdNIctM5VS8o8GIyGq1Dq48VSm54rcavCaIcBdxWNZ3N7g3ACmhmdb047trkbrm/ugjfiERQz4qgbdKrzEtKTjX8haSqVNWDxnPPqOdGDF1AaRqeDyPt8QTrSiuI7VOP2FupZqAlbNuMbckRd4Go6fUtjDqYRCcTIE3ZYrn82x64ga7a7PtddjtO8CRHXSmYt0aL8bYRWeXLBWeQ+SX4wCqLIoBEiSJ7BWAiSJSWZJdReg+Up+HfKHee8E0Q5AkjQTrf/VNp8dWGND2+I7IrMrK8W2XuBME0hLqCnZX+WxEtZyUZDRw3FvdUdJzg49ZNyrRC98yFdNFKYk6xemHJ0ULPx+J/CbK8riEThT9uZlGrhlO8xK0ZVbcMa92xxNsI41tYlLbYUBdu3eXYD59W1BCLgWs4DKUojGDPbR9C/2aDkJ5MXmKpd/U9dHec6mc+XJF2XHHNBPbvrTjAes/RJqcPIzyRwuDQMqt1j1Q1GwVSxx1cxZEQsnM3co1gqaUIqjKW2VL3kqivBzsA8PV23llDFbvB72XUk71+Kxj2dgtlBG8iCkwpWKBUNz39JOAtSYNPc9LGAYdv72H6QU6zGyHAJMSH1EM0MqdSdeAuCDt2ZOf14Qg3x+oACJWOvJ2Rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(6133799003)(13003099007)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261021135927099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qtj5CljvdhgwciRMOJiAcvcCbvWysEgaadmQuVBCSHeuorHqMHXNIyJre5Vf2MqJ+yiulKKrK7Gfz6cUq8/Kw4tEgTJH9vtFIROyQ1diURLUF7zv4hDs17rmY4rDQkuERavMJscAcTp3kR0h3NWrJ8em1C8Zsle1XtXd6XKPg0owaEi+oGL/EusJqXHyMKWZsJaEJyv7ERBQKLYOQGeud7ucjUC3nF6DLi8jQZsD6OrGHfrkqtiYteQePyXy9gIsVjvZZICK4KXOOaHjcaVPwmsrCsrIUGO5/TdgYkw1mheaggBNGq12E2obQEDojnAcjW72wa1vAl4O4rRr6wectLW1GyGAjvyQvRapSDuHFn0yoPQ6SjZt4RTWQwl6+mXk7OiV/u6aAO/pwfXsBLHNTm5miP6ryRmxP25lvYhegPYZOg5hzpuVVnxKokX9aHX3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:07:10.5182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcad0e6-3f11-4197-1076-08df44365814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

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
supported link mode, which the new patch 2 fixes, and that patch 4 made
old firmware report forced-FEC links as FEC off, which v4 also fixes.

Claude was used while developing this series: to investigate the v2
and v3 review questions, and to help write the code changes and commit
messages. The authors reviewed every change. The series was tested on
Pollara and Vulcano NICs.

Signed-off-by: Eric Joyner <eric.joyner@amd.com>
---
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

