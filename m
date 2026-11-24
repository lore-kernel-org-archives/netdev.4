Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795500555;
	b=X5h+pmgP9cT7MN8rZn8zBI3oEBPJuUk8CM61eHfFlJ/cUVmyJMJbWDHqc3ZdFXzoDS9G
	 na2kzOR2B5R6qaYKk4Ix1xSsWTwwBXYCiqRFi/H+GirmJ6dfQqoL2I0BOHZaEYP5mK37a
	 Lou/BnTQZRggBGHUSJuwSbreklnOgDjQvy0u8ANFqyf5QP9jRLZuiG8LOmQqO6DgEE9nt
	 g4mr/0NwJGU5WliQSQ0m7w2QIsn2p8cKkGk5/IkvbXn6JU62Cap49CzoaCe3jSuS9CCEu
	 N0c9gOm8393/MNXV4eHj6prIAsU6mJ/Ca4MxgS+JRMAQ1EPq0u5xQNFj6iKm4T6jw0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500555;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=+Pf6DGuB5O7H6eurHYlhEkAGJRFo51ETIHTZJKvLn2Y=;
	b=IiIU4wjExsU3LaUCb/V0KeDmWo+D7Cdx3lOSC1FmatP7OgC1DNDAeRrntbm9kYk/bsXM
	 OJAq7tRE21Sh6HU6Nl3JZji00xknLEnhyPe1GLfAGSOxmxh0yHjprIozBv5/HewKGavm4
	 AC4VVMDT6TM3YHIUzXMCNH5HML/TYG34c5LPSN0pq806PFpzNzv7x0F/CQGMPh+Lf1mR6
	 s5YdPDdLjBCXzQPl6YEEAhA0WfN69w8hILZ3Mg6Ldcx59FmFezhUJdVOB61P6lmQkE5lr
	 Edk1xq2LilC99BDaMxluSWBwzFSH6744WdoFg/oWLHbiG7IgEC1RX8v//tlb0xIfMnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cK4hkMag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.43
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95021606A322;
	Tue, 24 Nov 2026 06:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95021606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cK4hkMag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNfRLQIqJvJNEoTXWCIwA9Cfg65Tmm+72oX3bg2G4LkCPSKOnn5SUGfzlcv306ChogOgoSEPVHy/eqif5y3U0XMd9vPivfuXhjE1w40i6X0b67zjowSgpZxs2qcqhUv0n+hU9tVLCbpE6vTrmBC0/uvx3/WvKdnXdYBs57GkJiylCpCAGnVTOhcIZMaPKPkt6JgjPdF/fJF04OGvce764p7I3AgIvHTLkdPgE0lkug+03KfIDvZoB5a5wH8TIPLsduJe4KPVKJf+7z81neJ5Gu6EEJRLhB5Qn0lI5TF/xiwPxZdZVr3lf0kALThRRfY75W853BRzLbxWS/7PAYoe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Pf6DGuB5O7H6eurHYlhEkAGJRFo51ETIHTZJKvLn2Y=;
 b=ItubkCtW9TvMN4GI7c977QrcXhFqdMh/BYCsMvdSfq4Jd4HlYtLx6vk0dd+MvtEk4jfjAiyFz7wM6nzwv21vBNxxE7D1WpCB8bNlDWLTX3MXWMwh+t5uuAL/lUJQMq1A2hrxzpDJ/TqjCBOK3WAm/pXUprH03oGIkpg62dsggCgceml5UuqjciB4m7wk6Gs+wQDVEHn+pUw2sFimf2IWOYcB45+/hjMMKQ23zmLQpJcqiXX3g//DZTkEw4uedF2lhes/duiX2DlM7ABl2klXAXCD0YXJfmeQ8N0NO2q3KiDnYUY7GI3pC8BWxQinypyYaq3AqLqo90NDq18R1kSiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pf6DGuB5O7H6eurHYlhEkAGJRFo51ETIHTZJKvLn2Y=;
 b=cK4hkMagdNRZZ+7dCCUzBAeIY3X2CbqnNGxVhH2mR4HeVQiI+CtjYIwYraxhQvJntquROkQRkepT/rNr75/7TasHDd5kIRQ5m0RuCkeB6hSjwHkTLnENYJqqomsO2W6cGR79E9X/im9GbGXznKOTc7S7LnZ7AgHJ+dowO2mvQQI=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by DS1PR12MB999187.namprd12.prod.outlook.com (2603:10b6:8:495::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 06:08:58 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:510:32a:cafe::5a) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 06:08:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:08:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:08:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 00:07:15 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 00:07:12 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
	<matt@codeconstruct.com.au>, <linux-i3c@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<meaganlloyd@linux.microsoft.com>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 2/3] i3c: dw: Track the transmit and receive buffer depths separately
Date: Tue, 24 Nov 2026 11:36:50 +0530
Message-ID: <20261124060651.1987454-3-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS1PR12MB999187:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b7b956-87df-48bb-8501-08df49f16c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|261009221227099003|261009221727099003|261009223027099003|261009220027099003|261009223327099003|22082099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bb9JjsT86TuEOA5VokgniyMdJ7P/QKN7wQv4kaarF3a84WIHwBSl4otYFhH80yD9zJYmKcGULOIpn+b2758/1SKiRpz2Qi7hyvLjbB5wb6MmBPQhZ4+xRmpojQElMQsHdudEGbaTRX5v2uCpQCbfYvrGAlhABxKKxxx/yLJ09YAM7zvSkJdiqby4ItDkW4Zom9AGHzTDShwwDRsU52gQhvWg5Z2YJyOaosEBkZ75L73Z6GCpWLaHAO9uQsrHETNCu+i8qLDzxLxy+FzEP/2En00bgYvpdYc/LD8fSLLr3jLShlr7pxyHFjHIeb2Eq5lh2Zfa/upF8WC4fTukGX+3LOxWkqPey5BElmmAqtpUHrweDyfkvCcULvEmgOmjfImTyYCND/ShNrHJbyLgxc1+uez3h0q+uExDwxd0E0zG2Q/CSS/RB9Qe87N2lry1RnBlWSkYohw9+GQHKlCwX558afuxPsylZ0APX6YYXNx4Eizw6xFXNzP+dhX2MnCTcxucI+i8HMewX/IlQxe9r84VBgUc8do2V9Foe9xAfsWdTgg2BzrS29Qhd0JytblsyTZT9ZfBdhUWU1ICUnGNxSwJfxhQHEonm+AKOrxgZh39Sw1Hw1UnSOYxHbPjXMVmPS0BuVsqOgOr3+samVaNsmfQcgky2mhASKLhYYButfhuVI3kBNsX0BtMhu4aEivMfwBbp6QKW6JqNXIdAn2XiNgwdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261009221227099003)(261009221727099003)(261009223027099003)(261009220027099003)(261009223327099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VoH7iI/ftHs7c7+9eVsO9jq04YC7to075g0bXSX4PMsJHOnYjSZW7i1OOhFvsrhdES165uXRlypmpoCqUM17nq+gZIX+6EItjq4DgYjBbnQLc6yf1v6zhd9QZPrB+OW7z6+Nro/3AxmPKEdAzeH25yRJunDmoYedLU+SDe+gLdIRYA612w10e4AyWTv4xQtTtGN0uxhhVDJIgvkWRUe3uoGgpc+cNJlbC1Alwt0bNt5Hst4o0xBGo/36MLhtzBcE8D53Eu/DIw8fzg0WSLipQRpMMUW44TayMcV5zzcDW/YGuvCDUpKkrS17xWrD/NHkTKnGXOPhSSosgu5QHXsL2AOfHGG48ZllVejzFvqchUZi2d/b8dkY6Fy93x8aKXA/EXt9JQ+JZaXz0LNyzGxeTtkPZ7CKas03UzEFDZrAqZcnbAnIzYQDlDlYX1wCoosI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:08:56.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b7b956-87df-48bb-8501-08df49f16c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR12MB999187

The driver currently uses the transmit buffer depth to validate both
transmit and receive transfers. Since the transmit and receive buffers
can have different capacities, receive transfers must instead be
validated against the receive buffer depth.

QUEUE_SIZE_CAPABILITY reports the configured size of each buffer. Take
the receive depth from there, leave the transmit and command depths on
the status level registers they already use, and split
caps.datafifodepth into caps.txfifodepth and caps.rxfifodepth so that
each direction is checked against its own buffer.

That register was already defined at the right offset, but under a name
that does not appear in the databook and with no user at all. Rename
EXTENDED_CAPABILITY to QUEUE_SIZE_CAPABILITY and add the field
accessor.

The DesignWare I2C/I3C databook, section 11.1.58 ("QUEUE_SIZE_CAPABILITY"),
defines RX_BUF_SIZE in bits [7:4]. The documented encodings 0 through 5
represent 2 through 64 DWORDs, respectively, corresponding to
2U << RX_BUF_SIZE.

Publish both depths in bytes through base.max_tx_bytes and
base.max_rx_bytes, so that device drivers can size a transfer this
controller will accept.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v3:
- Use FIELD_GET() and a u32 variable for RX_BUF_SIZE extraction.
- Use sizeof(u32) for byte conversion and the renamed controller fields.
- Add the RX_BUF_SIZE encoding and databook reference.

 drivers/i3c/master/dw-i3c-master.c | 24 +++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.h |  3 ++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d1119f203d1b..21bd94e5a6be 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -203,7 +203,10 @@
 #define BUS_IDLE_TIMING			0xd8
 #define I3C_VER_ID			0xe0
 #define I3C_VER_TYPE			0xe4
-#define EXTENDED_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	FIELD_GET(GENMASK(7, 4), (x))
+/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
+#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
 #define SLAVE_CONFIG			0xec
 
 #define DYN_ADDR_LO_MASK GENMASK(4, 0)
@@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
@@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
@@ -1666,7 +1669,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
 	int ret, irq;
-	u32 thld_ctrl;
+	u32 thld_ctrl, val;
 	const struct dw_i3c_drvdata *drvdata;
 	unsigned long quirks = 0;
 
@@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
 
 	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
-	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+	master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+
+	val = readl(master->regs + QUEUE_SIZE_CAPABILITY);
+	master->caps.rxfifodepth =
+		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(val));
+
+	master->base.max_tx_bytes = master->caps.txfifodepth * sizeof(u32);
+	master->base.max_rx_bytes = master->caps.rxfifodepth * sizeof(u32);
 
 	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
 	master->datstartaddr = ret;
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index f5b4491b247a..e23554bfc5e4 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -14,7 +14,8 @@
 
 struct dw_i3c_master_caps {
 	u8 cmdfifodepth;
-	u8 datafifodepth;
+	u8 txfifodepth;
+	u8 rxfifodepth;
 };
 
 struct dw_i3c_dat_entry {
-- 
2.34.1

