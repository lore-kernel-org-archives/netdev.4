Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530864;
	b=FATX+0b+v4fqclLsinhR3Twk4DkqF7350+wM8t/YfdKqzMhZy1qKBPfPkpI+T6sm9WEE
	 tJGT2aXF9WsUXpDcb5fvekzC4KCLQ3LyVG/kJCzKGAV4OHyWzyoSh3sPFGcQb1wzIR0oT
	 +dMciTGTj6udxFSAHuNF7GE4bw7pgRTkaT3XzdAKOrN1rd8qlEw4HGCPFm94pU9BEHM2D
	 wZ1u/WRVTsMHYsWx2VkvK2KuNKtzpUAo1N/fTGF8cKkn7OT3B2NkzJgK22PY0VR3FIQOM
	 0bVYtss4jDcc4GKSnXSMX1Rhp6uPIebSYd0HElW4fANXEuUabgNtCyhZx5bc6EosvSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530864;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
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
	bh=SWpWWEkvpdjtEHIjmDikzOjMpwbW36BQoruV6pjHdDs=;
	b=bH1QzyMBo+7z4YSGgcjodfK3mnn12sOsn+tfhiEQllnL696EvVHxRWmhpmlBMEjb41ta
	 bhAY0eSOQMY1mDflXBrb/CGTgws7dtWFaFkTEzBWUuH/84zQgiTJqQx0IIudZMFu6E+h+
	 RGKvF9EUa1f+8M+U1w7U0qHsCSOJf4kYvqA6Jbm8WMSUNGnFboLVGAYPQDvbM/u5AkwJ5
	 bJrei9ILxgcaTrZ086aHJ2Ic6Za6AFjuvgy3xXd0Sz3KgWCKhtWfLJL4Ijn9JZHqf18S0
	 hgv7K7/DC22A80Bfyto3F6lyRHe83uqStaexy1ogIfjGs8DXghKzBPPUXNlfyfjInJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="WC2Sig/i";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.40
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B817606A693;
	Tue, 24 Nov 2026 14:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B817606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WC2Sig/i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1+sH7YhRRsWhQf67z/RbahYztj7Yq39AqNvKelXkmWM/P/Q3wTKI+gRH4HYCIuuZ1U5B4ay6d7AY0Ri8OqEWiyW3ck7wvcz1Tyr+Ndhw7z5Z4AGI7NHMkg8vEOuBcEyC0A6m5s3LOOrN3G6jfNbhLkiTLbrvz4oV/M5t49zIlKVHY/KQaOHCqBJxZ5IJfwTokFA+xR6UuYEZBkTQUZik51+azZrtFvubXadDCn/3NWMouFAztQ+uWxQ9ZMCKOgRon/FU2tmchWMZgFX6WfMTz9C06BxR1yoZ8+JaJTisC9nWxd19wfe1LvMb+HV0Bi3IYRZTr+/Y6ug83bp8OYFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWpWWEkvpdjtEHIjmDikzOjMpwbW36BQoruV6pjHdDs=;
 b=o7Vq7p5Tk+HriBk9jcCLEk+Tn1bWcfMMuyuIQSAuTshY8/nDI6+dQiSoLR+woR/PYtW3Y/9P3v5o5qbjcHet8+LrCtIeN4Oln7IkoIaRoh5H7H0o6UyIGJxxPMt+oYGmHfVLz2pZNNXQCZNTYOwhzfRNcR7SebtD+VYIkL6PE6BkYix8LJ5n3X/7VIZcRkuBjT8XiEpXqD7lPf1Z46EXdPnzWhdpv/TuKymR6c48hdUoqXL57v2e0HuUtYBD7Hki8mugy93oFKupXFZqUwGFRADwHo3a1a9xbdR//jv1boS0+EPqpWbc18FsjFGKFEbgNELrGXvI5Ng0qc9ile9I9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWpWWEkvpdjtEHIjmDikzOjMpwbW36BQoruV6pjHdDs=;
 b=WC2Sig/iX36zHEHsbYVOYY03yygortb+UWCFf9tFBGJT+74CDBpHM7WsOfm4tIcOewDR6DvFqkXjxsWkJ1aRMdA42lt2SgMQhEwGgLH7XcJ6LdIhQWz//6FR9cQYi2i5jyxwuhoFQTkE1K9WpOywH+hzW2XsvyqM4DE2rrZCw+ax7mXlC+AtYsaIHz/RHadYAD4bUZG1vEUP6q+DCAwarl5CA3B6fh+prT1gfxWRRajUX+pKLZOe5pehcpCZnNTSnrDnq1moR7CUjhqzw7Bi258OG0XkTwGBSjPfa62Ee9KxcgRM0IdxwJ8EtdA+6mBjrMs1lIyR/MSb8MplGgKiTQ==
Received: from CH5PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:1f4::22)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 14:34:18 +0000
Received: from DS2PEPF00007105.namprd05.prod.outlook.com
 (2603:10b6:610:1f4:cafe::92) by CH5PR04CA0005.outlook.office365.com
 (2603:10b6:610:1f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 14:34:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00007105.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:34:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:33:59 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 06:33:57 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <Raju.Lakkaraju@microchip.com>,
	<maxime.chevallier@bootlin.com>, <yuiko.oshino@microchip.com>,
	<cbabroski@nvidia.com>, <nb@tipi-net.de>, <woojung.huh@microchip.com>
Subject: [PATCH net-next v2 0/7] net: lan743x: automatically recover from TX hang
Date: Tue, 24 Nov 2026 09:33:15 -0500
Message-ID: <cover.1795027003.git.cbabroski@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00007105:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d7443e-b0da-4e2b-c8c8-08df4a3805b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|36860700016|1800799024|261021135927099003|261022075727099003|261021123027099003|261026121527099003|56012099006|260925022911599003|11063799006|261026140227099003|261021121427099003|10067099003|261028144727099003|260925021911599003|261102123227099003|261022105027099003|260925021311599003|261009223027099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	v/V29/cs1VHQGJeczLfMUg+vehKnyQkZGc0sYBaTe5H12s3a977RJ6HKvCWvyNJZA/QxBV9vtaYGbT3b6Oq/IA4FevDtZKro/BEjV5x9OcJPkZey6gq92fje0MDCAKNpBcovNpBXxD3PRFdKzSqYyTXMf3lmDXkm7Rcn98ULNX9P+FJX0f8jlVvLJSI3cVm+5icvbcpX1+Rv9EROmSP6W4koa1yPd1N5ReUDy/qfS1nfcSTZ71Km74qqbGW9ktZ7gp8+5HjZXTn1mjhWvpn8xMpB16ZbetSQhaYTM+bWsn+z9DsJdtoXvLbXQHjMvkzcf6Zb5N1bEqrgZPB4UE8IJ6E5hGWxi/fm0fRthC0CIISz6gi8YLs7oOYj/JKRFJ2MZkDS/uGCzOp5v6kIHCF1tnigLEECFTJPsrhdReMVFc7Xx6Mqr1DmsaeFWErR57muZv+9KCsdrNqYXaEiBdVQeZOZdiwuM4F6seMHtF0chmSJ/ITLmRULvdWiCLbzkt3nSmpHXniYRe0VO+qUIWOwQmIhs79n03JQBR0MSmFGFcoGjhX5kq7AChwLRtfrrqmcZ9KSS2ea+xBFcQ+vsrB9qA9HbjsaOWZ5lMJ8NC4B4PjyTFqAAxhmGYAKe6VA/Ddg3GDYHnyBTRGQbq5bNPwxTcdPnrNaDKLgj11qGQxZnPlnxYzZgruHSd9X0qykLp4YXMMpuLO0YfsaXMPO5sy1Sw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(36860700016)(1800799024)(261021135927099003)(261022075727099003)(261021123027099003)(261026121527099003)(56012099006)(260925022911599003)(11063799006)(261026140227099003)(261021121427099003)(10067099003)(261028144727099003)(260925021911599003)(261102123227099003)(261022105027099003)(260925021311599003)(261009223027099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fUT/AjjRjD9eBt0elyV4aqmLLBy2w/VJXuQA1ANiD4fR3p1sa9QF3M70L5hcTDkdUDhMHJqrF7SuKrcOF8wtv5vljo4lPwOG1Tni9qWzt0egBP57XcELZPNjq6lg62/3xAiUfjg1rw2qqzdTPhXAzWjhjab3xfkYSs2SXQxQBCINBGq6LqrIsNKQ08QyaukEj3BYDj9GP7GeFdpW44c1bhLksU5YYgvVoabAKViPmThU1FPIMITrg58FW/uIfy91l4ahew1L+AfvOGlc9+kAp/ggshIB9FVzgNxp6XXqqa6o32Pik6E2Fb/up+AlO8QP/2wexay/uBT65n6LC+0WkNYcpWfn8TA73ksLqAx+LJ1yMY87BBY4iiwCfgz2F4Jeo75u0LYPdhRZubeLslWlfe9n7fGtzoMKf+ESOHeS9QlZ0Pxv+HB25gh7SzFDAuhB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:34:18.3058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d7443e-b0da-4e2b-c8c8-08df4a3805b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00007105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439

Background
----------
On a custom HW platform that uses the LAN7430 NIC we have been able to
reproduce a scenario where the SoC stops receiving TX completion
interrupts, appearing as a TX hang. After dumping and decoding the
LAN7430 registers we see that the TX channel reports that it is in
started state with no error, but TX_HEAD stops advancing. TX MSI-X stops
incrementing while RX interrupts continue to increment.

This scenario has most often been reproduced in large server cluster
environments, but it's also been seen locally during repeated SCP and
iperf testing.

The root cause of this issue is still unknown and we are continuing to
debug. It was found that bringing the interface down and up recovers the
network.

What this patch series does
---------------------------
This patch series attempts to implement automatic recovery of the
network interface after a TX hang is detected. It does not fix the
underlying root cause of the TX hang.

At a high level, the patches implement the following:
1. ndo_tx_timeout support to reset and recover the interface when the
   netdev TX watchdog triggers.
2. BQL support to decrease the amount of time it takes for the watchdog
   to trigger.
3. Stability improvements and error handling around the open/close paths
   that now get executed more frequently as part of the TX hang recovery
   flow.

Potential issues and concerns
-----------------------------
* I do not have fixed-link hardware to test patch 4 on. The change was
  requested by Sashiko AI review of the v1 patch series.
* LLM review tools flagged several possible bugs during development and
  v1 review that resulted in the inclusion of several "Fixes:" tagged
  patches in this series. They are included in this series with the
  ndo_tx_timeout support because lan743x_netdev_open and
  lan743x_netdev_close are now called more frequently as a result of TX
  hang recovery.

Testing
-------
Testing was performed on a 7.0 based kernel using the same driver code.
Please let me know if you would like me to run any other tests.

Tests:
* Verified the TX timeout watchdog triggers and recovers the network
  interface when TX hang is reproduced. This was done as part of
  repeated SCP loop testing and is also being tested in a server cluster
  environment. dmesg was inspected for "NETDEV WATCHDOG" to verify that
  the watchdog is being triggered. No errors were seen in dmesg after
  reset.
* Performance tests using iperf3 to measure RX and TX throughput show no
  noticeable difference with the patches applied.
* Repeated module load and unload cycles produce no errors in dmesg.
  Network appears to function as expected when module is loaded.
* Repeated ifconfig down and up cycles produce no errors in dmesg.
  Network appears to function as expected when interface is back up.

Changes in v2:
- Patch 1 (was "net: lan743x: reset DMA channels that fail to stop"):
  - Retitled to "check DMA channel stop and reset results".
  - Reset a TX channel that fails to stop only after its FIFO is
    disabled, before the ring is freed (Woojung).
  - Fail lan743x_tx_open()/lan743x_rx_open() if the channel or TX FIFO
    reset times out, undoing the earlier steps (Nicolai).
- Patches 2 and 3: swapped, so TX is quiesced before phylink is moved
  and the series stays bisectable (Sashiko).
- Patch 4: new, keep the fixed link across reopen on boards that use
  the fixed-link fallback (Sashiko).
- Patch 5: new, handle a failed reopen on resume, keep the PCI
  resources when lan743x_hardware_init() fails on resume, and program
  the RX filter again after the device is attached (Nicolai, Sashiko).
- Patch 6 (reset the device on TX timeout):
  - Move the ndo_stop wrapper to patch 5.
  - Leave the device detached if the DMA controller reset fails, so it
    cannot be opened on a controller that is still in reset (Sashiko).
  - Program the RX filter again after the device is attached (Sashiko).
  - Commit message: state that ptp4l has to be restarted after a reset
    (Nicolai). PHC registration stays in open/close, as discussed with
    Microchip (Woojung).
- v1: https://lore.kernel.org/r/cover.1792008404.git.cbabroski@nvidia.com

Chris Babroski (7):
  net: lan743x: check DMA channel stop and reset results
  net: lan743x: quiesce TX before freeing the rings
  net: lan743x: start phylink last and stop it first
  net: lan743x: keep the fixed link across reopen
  net: lan743x: handle a failed reopen on resume
  net: lan743x: reset the device on TX timeout
  net: lan743x: add byte queue limits support

 drivers/net/ethernet/microchip/lan743x_main.c | 282 +++++++++++++++---
 drivers/net/ethernet/microchip/lan743x_main.h |   2 +
 2 files changed, 241 insertions(+), 43 deletions(-)


base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
-- 
2.34.1

