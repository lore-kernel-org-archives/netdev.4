Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708887;
	b=5FMvk2wKux2JqFPg4B6O+tCyHzXV4WYgfaUDEbp3H/U+lCr7bkqqNqw2GBHFnj1QQ9PT
	 eXo8cwSF/ZNJ9Tn1a/Aw10H6xEh6ZZm5yskEIynxEM2FxvWjG6e3+YfUWE18nd2nU7YCn
	 SuVJAtTBA9EOu/qIWufdlFfAFOAuCOEjqaZbfdSh6ZXklB20L13753kEe5Kf2effEk73m
	 G26zaIkxiitMrS9vUk8Ppl0J3pcoHNrkOT36H+E7cwhlr48gR7Y0+SMbsxNCUzXEZpQA1
	 I8KMqV44dc0FDRvp2Zr1IqHbuu18j4TlxJ2xpb0MhzrVAwkfZ1jUk6NZG29nw16dyrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708887;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=ApBRuiRq9MiiKPNpKr47XsHHpu41hYjHGSBfhSvzPtI=;
	b=Q0Yn6C1CLhPrwtvOkPxZlMoe/YbqD8Obp+nbo3kMsvwLjMPSJ823jhOg/iZibXnPTWhB
	 vaObOORWL6DG4nZlb+HfgldwUoS/ng4Q65Zq7WPs7TSs2wL88t9OIT2x0iJtKSnB831G6
	 jD6IreP/mLGFDP2iJyo6zxkcMbkPKcA4ySXTE6qRPLPVMOqpGUuUVelaeJQz2AK8IWRg8
	 6BMIgHul2Xjr4xeh1WevlgqLEfmfwOs70dteb0V+81i3bZpn7Jmtv/vuwcCkfCkRVM2pd
	 W7liJiasUuj8YYA2cd+3vI15smzeR3+t6yTBWK3Obf9gNADYpNAlokB2YVOluBPM32g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=powwRxMk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.129
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022129.outbound.protection.outlook.com [40.107.193.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25236606A321;
	Thu, 26 Nov 2026 16:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25236606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=powwRxMk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFq3oPu47E/kPMlT+lsKJ1h4lEEThjUEvwSF2oreuJ/1UzA7tm4iWWjblQVXQtNPxYAHVjR4qwVOZyxDN3EMpDbU/ACe7pS4C7tB+7z+1+TkMKFHWmoSUZI4gPSI3tud72HCdgHWzJkwdHqCYJEWki1ATEXNnYGVUcMubC7LdlIg1bpj88HZqmIgugptnbi+07tezM4/nrdAP085k0W6z0RCMqUI4GUEyjonh4dxcoHvvXuiroGrKao1dJ1XlHYfQao3Gwz/O41qjVlHOdm+iCRPWCdExJtN2fgUFHm4LkbtRj5JnOC0uGR+G0iZi8PV7Pm9wP27+M6jmkVt1zlzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApBRuiRq9MiiKPNpKr47XsHHpu41hYjHGSBfhSvzPtI=;
 b=RrUcE2XWUWM52mJ25YEpp4pW5M+Us3rgJufwGSDZDAUX8XztlaKjh+/UqVQQy0UWu8js72mkPnDFLKrJA1mLIVSOzdy2yGiqn7OgRzxfTFZAkkwCpDQEWLu/W75l3OJsTNr99JPhn22sIfiG4zq7EwVQ2xxYscyAeirdRb6Vg3+KROFVwqE4CDuT3rAuR/OL4jhBIWUyaCoxJJnd1+6dJYlL8fQUd2Wv/4eCmbFG3cyly7kMP59q8a1YYMpkTM/s7fRoETQ7wNoBwVaHn27CpelFPqsmb7dxJaAavwvmTMch04oyh237hqlOUPu1rsFEJxEKQwBnpqJo5dTe3MBWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApBRuiRq9MiiKPNpKr47XsHHpu41hYjHGSBfhSvzPtI=;
 b=powwRxMk08qVRLyMXEhbQ0w8C5vN4unsQIZnfxOR0nIiN+N1OKkagEx4WQ2hzm6W5hGWFmLjVQkhrFTt5DM86M2vIFPExn4MugDeCo9fimdFO27NIS5uGn6QNoPfaJ1gs0YT2Wni5C9eIXwtdJJ6oKjeiOXHXTUl89rLiTSM8ZU=
Received: from YT4PR01CA0162.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:ac::28)
 by YQBPR0101MB5202.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:45::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:01:20 +0000
Received: from YT1PEPF00001E8D.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac:cafe::ad) by YT4PR01CA0162.outlook.office365.com
 (2603:10b6:b01:ac::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 16:01:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT1PEPF00001E8D.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server id 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 16:01:19
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 561219655;
	Thu, 26 Nov 2026 11:01:19 -0500 (EST)
From: Curtis McBurney <cmcburney@telcobridges.com>
To: netdev@vger.kernel.org
Cc: Curtis McBurney <cmcburney@telcobridges.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	toke@redhat.com,
	daniel@iogearbox.net,
	almasrymina@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: keep txq->trans_start on repeated netif_tx_stop_queue()
Date: Thu, 26 Nov 2026 11:01:12 -0500
Message-ID: <20261126160117.652865-1-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PEPF00001E8D:EE_|YQBPR0101MB5202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2b88825f-3bfc-4642-ff62-08df4bd682ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261022075727099003|10067099003|56012099006|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a+49Rvk4O/oald86RREGTg4CiXzU2OuxUFKJlVY3glJaL1ZtDKdJnCtQ7UcZ58pAouDXytrUhVlkj4V9Yxxf2Ob3GBnidTjb/RxDQsx2XwocpA5JvXE5+6/mV1mevh4WFcqKOtC4AW/ZfOQuE8IEsxrWLO5jtkkQIrO3KfoCtnvVFLTA6gQy3CUoaRUO1/ZZdMbu+qF1kQXSIF+IS6xFKfeHPB30LQ/A/T1ie2A67PxxVCmnKVHNyRiHLBG0o7MuvXSeOHEQj7SvhlhQ3nv+AJCRQLWzVoNegJkSYJLGeDC6mxuwst747MNgj8Euu7BM5DI5i7x33yikRd+pEKSk50gEqS/oFbooDrAraAtQnfy3GR2VkRhfq8yk87Sm6U0rOOu6nEgJv64kDhvF9gbN+rHICwgP1o9AcFAI/W2v5cL76mutOWjEYBT3QUirUHnex7B648a5ljeE8SnsIR/VoEwHXvJIx1T9Y3F8vDDcN03xYK5+e0ujI6v/YuK1e75vlpEBD/+DJ0oL0GOah3yfmCS3hF8fHa5NrVmjL+htinaDd2m9NND+f4ceFM8682Z9PzDGA5RP1uCPPinJX1sYDURuWBjhSs3y5KlgCoiGlnddZx6x5ETZM6ok9dltHBomOSVBrp5orRe+DVfItM4iLw==
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261022075727099003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r2FCcG2HGPcy3+XrroKMH5s/8Jyu+fBFWDubftJisJ/fZSfNf36xyDJE5TYeeLVbqe67FEqoz1MNYaPbOUVlRKv8YyeiOUbMZdRgo5mVcqHHrwQPK+JOU0MA+jy2rtfkf0Wv2GkPJ55HvZ4ASyonI+ZyMceKenGyDKOrtx/DdOECu5tOMkTSz60woDxnBFfy8dpogXR2l5w9Z1EvYagD+Ss+ozQFxFCtC0rPPlJTBlip4k8f7F0o5gnEmeK9oDWJpbCt9zZgT8aqT9ks7qnqAL+RFxT4yaVfsgxtdC3H7kU44xUDTbU8Ovi6uYbUMDLX4IXOqA95gXxmyeIjbPDqQbLNbheF6CXECjWxeyiPP+Zk3sSHuDgv/3ZzeGVn04uphEPGWeDWmb4V2+WBSyH4xThesUAqAPbqrtXC4RYA5daQ0Lj7CocafxeLmz1Te63k
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:01:19.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b88825f-3bfc-4642-ff62-08df4bd682ad
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT1PEPF00001E8D.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5202

Since commit 95ecba62e2fd ("net: fix races in
netdev_tx_sent_queue()/dev_watchdog()"), every netif_tx_stop_queue()
call writes txq->trans_start, also on a queue that is already stopped.
Drivers whose Tx hang check stops the queue again on each run (e1000,
e1000e, igb, igc) keep moving trans_start forward, dev_watchdog() never
times out, and the hung adapter is never reset.

Patch 1 makes netif_tx_stop_queue() return early when the driver has
already stopped the queue, so it writes neither trans_start nor the
bit. Patch 2 adds KUnit tests for the four cases; one of them fails
without patch 1.

The issue was observed on a system in real use. I reproduced it and
tested the fix on an AlmaLinux 10 kernel (6.12.0-211.74.2.el10_2) with
e1000 on a VMware-emulated 82545EM, using a test-only module parameter
that forces the e1000 hang check to fire. Patch 1 has the details. The
KUnit tests ran on UML on the net tree.

I wrote the first version of the fix. Claude Code (Anthropic) reviewed
it, wrote v2 of the fix, the KUnit tests, the e1000 reproducer and the
changelogs.

Changes in v3:
- Rebased on net. Patch 2 did not apply after commit e8c39bfac24d
  ("net: add a KUnit test for the alloc_skb_with_frags() tail split")
  added tests at the same place in net_test.c. The tests now come
  before the netmem section. No code change.

Changes in v2:
- Patch 1: return early when DRV_XOFF is already set instead of only
  skipping the trans_start write. In v1, a wake between test_bit() and
  set_bit() let set_bit() stop the queue again with the trans_start of
  the earlier stop, which could cause a spurious timeout (Sashiko AI
  review). The early return issues smp_mb() to keep the full barrier
  that callers get after set_bit().
- Patch 1: rewrite the comment and the changelog paragraph on the race,
  which claimed a bound that v1 did not have.
- Patch 2: state in the changelog that the tests do not cover a wake
  racing with a stop.
- Rebased on net.
- Not carried: Xia Yan's Reviewed-by on v1, since patch 1 changed.

v2: https://lore.kernel.org/netdev/20261119141633.3118789-1-cmcburney@telcobridges.com/
v1: https://lore.kernel.org/netdev/20261116143716.367451-1-cmcburney@telcobridges.com/

Curtis McBurney (2):
  net: keep txq->trans_start on repeated netif_tx_stop_queue()
  net: net_test: add tests for netif_tx_stop_queue() trans_start

 include/linux/netdevice.h |  14 +++++
 net/core/net_test.c       | 112 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
-- 
2.52.0

