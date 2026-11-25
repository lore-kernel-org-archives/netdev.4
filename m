Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648960;
	b=s375M0W0cdaF7CMpPgEg9qHkkWhTAWXBtv9BT3vWZRBo3STDcHh5xPF/aDr+WAJCLgcc
	 VTszcazT22Z+F2nS0cDQBbUIoKPnut9JsOKosZhELAfHlVoiuz4wvVP/YjHL1WbUqi2an
	 fSuNN2T4FE/mlZXJcBQEVjf5BzoXfmPl2fJWaM/GJ3QT2zVvhB/C1oeEb6yqXktrXoG0t
	 6CxxWLhT81Z3AXlCfASgPPc2PsXUZKyVrq50Z5hNUyt75/B4j41yPcGEy7EBkgUq6MyI3
	 Lxwq3RSwuntrRGp7aTECIoX5rd4QAjBoP8/DypPFen3JirDgzSI2Be8LeWoefkXKOGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648960;
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
	bh=o8hBGRzihinSlnvqYZ5nZtWffVezDCofmEv6ybtMDcs=;
	b=d8+FB6t7nxnWD3+W5mVRcr+Oujm/sDy1/UcpcZlvNyJoVGF3YavOo2EX4ylnTT68LvI4
	 D5cOiPD/XoWoJapyrlIuOA/2QYhpUKYHBVFxL7Qvwz9u6+ybhFEJVo0owP4rzHo22WoPV
	 XYgIJ0dsd1q6lyHZrpihF7KsUJzRjiJZhIgJDedvqBwYsoSPwHwnqWL4M4g8w7as2Xs9I
	 modOFWG8pd6RbfPA3F/BaFmPQIS+JE9jj/+1tBh8cmC6h6oIT/o3lvQfCPjMXnA86AAVJ
	 cEmDy6G30foLL324/IADN4est/PWOmCT0qztSBvub9E5TdexQbbQWTvg3rXtg+Fk6FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=45DnCHF7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.9
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6FD606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6FD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=45DnCHF7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgC1rYnYReZ8qJf1Q5tE8v7FVP3/UkfZl2QKEFCuBKFVeEVxh9h3FmUnNnhqGXJokANuwHPfLvodmB+S3JBL2dFOAOmNjvOqrFQJVrAvw8VF5Ct5JJrcjXVRh61ttJMfcqX5eqWMJ2rg4TBY9Kptu8CM1YhbH1vV5/aEezdXoIK5zKpoR+IN3j7K1nuWYduf+spDOrbvUhSrLUXw7XP+kN/DIfdc5sw3LiKDy0SILSWAS7o7GOCufomhQsmEWfnrsYOeJfNMn48lNpRCP94tWklkrbGvPi8/hWtbJbwElzhMjJ1diPtbpuM30UEXudbU4aXPqj+va/S0kha0x7lBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8hBGRzihinSlnvqYZ5nZtWffVezDCofmEv6ybtMDcs=;
 b=x7+2KdZOhcm7w57B4Me53aMuAlAVP/EFdyb+Di383XQZJ47W3iES/ozE4D+eElNISVPsAXm5zHsQfoNIe0sTdcXpjoI3QkTNB/1HWfnLtoCy8eX8X3rlN+KIDd4epsb3ZAkCcXPyKqnTX6I7SyzKZVqkEAj/G/ZJzbhAWzv/7XRRpe7moTQ32tjuW6lfZbLguO66mgxF2ivkL0S9/fZ7y6ty4FoRTk71juzoSz+x4bHv/ftIjam1s2/cpaSq8vaGCv3ct7//UHOx1vaaFtbNugsmajRi4CRQa+DDkNLHqFdLb7eUB7fHl8xpBSYcsRbDYvtrbEzuFLddLUZJQmmZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=davemloft.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8hBGRzihinSlnvqYZ5nZtWffVezDCofmEv6ybtMDcs=;
 b=45DnCHF7k1D+8JJrsxg4Ec//zj3ToMBXrRaomh4ut9aQhQyGPTLXg/mNVsBobHLaQhWnF6EkM14KK8zy2Suwm3n52cczDGUQNl8/8djHiwVcDGEncp3L8EWGF9IeK+6XMk2bH7kL79pYpQw99no81BztyxvtaKmaRgDqCKrmml4=
Received: from CH0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:610:74::32)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 23:22:31 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::a6) by CH0PR04CA0087.outlook.office365.com
 (2603:10b6:610:74::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:22:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:22:31 +0000
Received: from BELBCREELEY01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 17:22:29 -0600
From: Brett Creeley <brett.creeley@amd.com>
Subject: [PATCH net-next v6 0/6] ionic: FEC reporting fixes and
 .get_fec_stats handler
Date: Wed, 25 Nov 2026 15:22:21 -0800
Message-ID: <20261125-ionic-get-fec-stats-v6-0-1ab49c729c00@amd.com>
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
X-B4-Tracking: v=1; b=H4sIAK1tB2sC/3XOwW7DIAwG4FepOI/IBgJhp73HtEMGpmVSkyqgq
 FWVd5/FYW2n9mj9/j/7KgotmYp4313FQmsueZ54sG87EQ7jtCeZI89CgbIwoJGc5yD3VGWiIEs
 da5Heg9PWW+NhENw8LZTyuamfYuLVic5VfHFyyKXOy6WdW7HlTXYaFRpQ2GGvnJco+a3Q/cyXi
 ZaP8Ri7MB+bsKpb69U/q2IAdQJyUZED9SjoPwERXghagvzmhRR7HWF0j4K5E9A+FwwLUfVhJJ+
 Qhn9Cfy8Mz4WeheADEFkdkwk3Ydu2X3YemOy6AQAA
X-Change-ID: 20260814-ionic-get-fec-stats-990736964908
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cb3165-9dd1-4ba0-9ec6-08df4b4afa7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|6133799003|18002099003|13003099007|56012099006|11063799006|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021135927099003|261009223027099003|261022105027099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	n1nGEBTbuu9LyrphvfwZnLy0vqr63uLyG9pT0h6PktSqjCynEJtVBW771Ucv0/jTUVWEC3rqdeXTjuB5pQ8LYwNFQEtrk9qr+Nf+47/C7v9uj7UGzXRxv7jHeRFBg5dU88qpfWto3gQxePJQILqCgLaGuB6kAYImfdRfuh+/RrX3nHDSxJv/iy0HUuj1G18pXMhGBf9FNkldkNzSFrn7+jsoZQjUR+EEp+AMJ6lplMczdIW42YwRGmKi9iLWZW/DURTt9C2WeTOnDejgv1TjY5F4Mk/95y0Tp/KzDm6B60QbE3o++8ojazqegSub7kHnej6cmEEPUqvoqLkEaSVoSmjQ7IrE1K4mK/O22lZ8WSEuhXb4xq3WSTlMv0VWbCppQjSxdGE9Eh/HA79sYJKcj8L9T84hHdQL73xONjkAXwlylG5o53XCgJpUK0kHjtQlvfELrXqfm+h9CI9OtYcvPsZJokA/lYJR2n8M5PcWrb8UmNtfKY8tsxB12f2fP28mczChKK7r2sQajQJmXspm4XSHVezAXOqJPrBsi6vhTDjc0PSs1c8jVMns426+diyc644bFXcUJ1blYF0dYGumEcTQzeyF1G4CscNSOAMRxvt7Yhclg3eWTIPzUqMBEbQJZQhsl7E2oHTtnKkZHBJv8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(13003099007)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021135927099003)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H/qWfNoMkqtHw8dLtgfVUoDpDcqvSBvFzgr56AgkomrxaGSFlnRKEg7KOiOns9rR25Nwx9/3Hr0+MRyxQRT2UOJM1pzr6EYQS2FLvTk17hgVPQsGyExyB5XTiZ4xdh7M/d/fAdVL4wXDye+0AhLVf62QpH7Jmzfokof8jolTWcjzyf4wwlDjimetdUgpuMHPHFK1EhQZizFxZxv30Aa3cGHs2Dwk5FKvhoRUjWHz32M1NkrQidiW8hSOCrm1uq1jL1ATSd25hjKUnDEMjkTkDZDP3GHvDMb90r+k0G4HD4n2j4v07DYm/QzPYOf07Ul6eNSlydWqOrzr7jGOomkUeNjQkSPFKm4bSKiBxAiHKht1g5fIfLerk4UZcog+nI+JUMv3CyKqVV631a1wqx8SdN6ATH18SLfRKGFyleF6qeDHae6jNO9cjkxYYqiQ/YXf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:22:31.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cb3165-9dd1-4ba0-9ec6-08df4b4afa7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934

Add a .get_fec_stats ethtool handler, and fix the FEC reporting it
depends on.

Patch 1 makes the driver write the IONIC_STAT_INVALID markers in
extra_stats, and take the ethtool -S snapshot of that block, one
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

The netdev AI review of v5 asked whether status.fec_type can keep a
stale value after a firmware reset brings up firmware that predates the
field. It cannot: firmware copies the whole port status block to the
host, reserved bytes included, at LIF init and on every link event, and
firmware that predates the field leaves those bytes zero.

Claude was used while developing this series, to investigate the
review questions and to help write the code changes and commit
messages. The series was tested on AMD Pensando NICs: ethtool --show-fec
with and without statistics, the FEC link modes, and ethtool -S, before
and after PCI resets run while those queries were looping.

---
Changes in v6:
- rebase on net-next
- patch 1:
  - take the ethtool -S snapshot of extra_stats one counter at a time
    with READ_ONCE() too, and retitle the patch (netdev AI review of v5)
- patch 2:
  - read config.fec_type once in ionic_get_link_ksettings()
  - drop the comment that repeated the commit message
  - describe the devices generically in the commit message
- patch 4:
  - read config.fec_type once in ionic_get_fecparam() (netdev AI review
    of v5)
- patch 5:
  - drop the comment that repeated the commit message
- patches 5 and 6:
  - pass the configured FEC type to ionic_active_fec_type() so that it
    is read once (netdev AI review of v5)
- Link to v5: https://patch.msgid.link/20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c@amd.com

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
      ionic: access the extra_stats counters one at a time
      ionic: report the configured FEC mode in ethtool_fecparam.fec
      ionic: map the FEC type through a helper in ionic_get_fecparam()
      ionic: report the operational FEC mode from ethtool --show-fec

 .../net/ethernet/pensando/ionic/ionic_ethtool.c    | 139 ++++++++++++++++++---
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |   8 +-
 drivers/net/ethernet/pensando/ionic/ionic_stats.c  |   8 +-
 drivers/net/ethernet/pensando/ionic/ionic_stats.h  |   2 +
 4 files changed, 140 insertions(+), 17 deletions(-)
---
base-commit: e20f88c4f08bc9dba09c48ddc9806015f79fb20b
change-id: 20260814-ionic-get-fec-stats-990736964908

Best regards,
--  
Brett Creeley <brett.creeley@amd.com>

