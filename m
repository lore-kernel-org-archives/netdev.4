Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.115
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097801;
	b=yf/19V5fdTDYedPZyFKM9ULT1CkDmGR/GBNQc4FMRLow+31k7NmUZVVjGtR6YOnFr7PH
	 ZqRlr6RdTNUcnJyQyKmxDiqbnSFCXTJ0wzfKo9StIfjrWzosQ+9fqYnBfmYBRWdrXMfEN
	 ACzd1StT3ICyk6eXgw7fjShGWg8PeJ1aoglKRgM3SJ93KJtzqmYSrJAmrUPB86CZbR9nm
	 doYFIRO2W/njTEj8tlLWp3AH1lVLsmEDRuFyyXzzphl48cEj3rcqhX+/vUlzhbeUc62NF
	 CDl2xaYI9F/VIoP5uH8fGez8d51nm279lpdbQdZNHbl5SspOXgX6ftsUWZGxR5ZomfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097801;
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
	bh=k1uZAwPGVYZw0BEXV7gS2uNFAyBQZAV9umQBzcA0z9U=;
	b=1Wc5oRvQFCYbpG7F9RPUWFo26ReYuK07+uHFYwbNT+nUOpZSASXSTvvUN9mbryoVnO0Y
	 Ryx8Ir+jwIIsKs1Lc1AlLo+MBU0DCu3noUXq3UvEpYNAoQS39gF4IYhlp6Waino3nFcSz
	 K6GUef1nuDM8f+CYicE8B1b7emT0W/SbgstZdJ0Jbz+DugMAB9bRkyQKOvz0nCVvyf5q0
	 ugy/Eltk93MwxtKg5AvF0GewA1YVY+0X5rtwxpoJui0BsJF939icPpn+tMz96Vj9nFj6o
	 32pHPOnolpfZPXFQaJN90RDQqJvjLqGTxoEp7OGxccweK+0UeqPj+0+cFQMdjkK25Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=aQ5y3w8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.115
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022115.outbound.protection.outlook.com [40.107.193.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783B606A320;
	Thu, 19 Nov 2026 14:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3783B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=aQ5y3w8Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ/UJVLDNLM3cSzBOw/XNjQKjEBlZIaLanaPNYaY0ptmFWZa6ud7X9tn50bO4YnDazubeTWG0FwKFvLaKXRmMi1E3UzN4K7LutdD7ZoFXs2KJ15f0ArGIurntIML+6t6yF1PhNaV1wFMn3J2rp8rmTOz+XhXQYPBwYf5a/avDZinvFrq1XungilinSUOaDgsYVt5WE3zP44eJYOBpsRm+JTVo6m7VkIEaiot32DS93k4lzAWrNcko5eQMlR1dEOJpxouOWMy1Zzj18D+4QlVRtHJ6glzgQcZjpj/p7II4p3Nl8of3VohF8JHSA5INtdUKLC/XHaXLDbdkldONlKUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1uZAwPGVYZw0BEXV7gS2uNFAyBQZAV9umQBzcA0z9U=;
 b=ISAqiAGdewf8VFMFoklN2U6VWQBzAgN/4uDqnDfhpuXH7zy1+aat1Da6S8ClzeeBzd3HlrIQiPaWmE+GYatF7XrQOfUECI/Mgl1n4tF8WVLHonqPZs8LfTMYDAd3n+Ny9uO6iQ+59AAZ7YZfXODImOdRcnXdtFDSoBC6FOdGrNt2Zhjgze6wsDLiw/jzBfbo5HZ/vDLfl7T1Jb0a3nPotYVIHVWP+flHfm6n6A7fKL4e7zRZg6MwgXe8qYyihCzqTEu2LLKZqJJnaG5LsTHCEydP604ILHkGkYNfwDp1fu2EtvLlJJfqxXMJ8zx9vFB6GB3uI+jkGK/XNZzy4/aqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1uZAwPGVYZw0BEXV7gS2uNFAyBQZAV9umQBzcA0z9U=;
 b=aQ5y3w8Z3R2YdI4yQdV7TbV1mK/fL0eKU7UHXXKYScz5g/HLLuCaXjo2adqze7mlzpMUpTR2j80LIxFKjsDIwk/mPEDYfALwL1PyYUra3/RyPRy4Yp3iOGH4gSG7QAmfhU7L5FdgulAkC0KpANQYSqoxwPFCnJnuqlxy0dTu4HQ=
Received: from YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::14)
 by YT2PR01MB8149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:16:37 +0000
Received: from YT2PEPF000001C8.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e:cafe::33) by YT1PR01CA0045.outlook.office365.com
 (2603:10b6:b01:2e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Thu,
 19 Nov 2026 14:16:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT2PEPF000001C8.mail.protection.outlook.com (10.167.241.20) with Microsoft
 SMTP Server id 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:16:36
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 2F5169628;
	Thu, 19 Nov 2026 09:16:36 -0500 (EST)
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
Subject: [PATCH net v2 0/2] net: keep txq->trans_start on repeated netif_tx_stop_queue()
Date: Thu, 19 Nov 2026 09:16:29 -0500
Message-ID: <20261119141633.3118789-1-cmcburney@telcobridges.com>
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
X-MS-TrafficTypeDiagnostic: YT2PEPF000001C8:EE_|YT2PR01MB8149:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c59230ce-099a-455d-d242-08df4647b8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|7416014|261022075727099003|10067099003|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	HUoAhn4YxIqa1vYElGNloZGuIbA/I3oHucOYYNQKGCjTE8YKjD6P6FYNF988osl/aO+O6a7ctjJH0kjeZ6A2C7CbH8il3IoF5+RVYQhiGcGcTgRauOEiPzHsjpsr8fIdXYcy476wEft1ENmlGguDCBxBBWneuyHNihkv+mPfXhY2VDa5aUFkKtqyvRpEce20KxgPhjCx0Wff72FVQsR1ffm/NsSkCnu5kx5vLKYNeKAVxZHZ/tXuHxC0qYYKJ36MDDwvli9hEs4SBIF+YS9BjupHRHBS++llcNW/OBaJ0YoOkV0CWmIwU6GnSThq6XqDnIYLENF1VomHHPhXTsXnDUq2ycVXyyhrFHnRWvRQiKBUdqbe9UKSjQpzXmEIP1NK5+wYCKwCS9Pxzz50MqiJqM8RdbffjD5r3QxH0HqVhn6AuPxtJB7eFxeDyKhG0gXURhGIL/S5DO90gAOkEMiQStkDnNNZIfqCSu0YcVNp1pfZ6DjXnKb+Jj4HwCqUxxW9qzAPptLlaEjhbw5hU0/PXPv7NVjbgPEnx8nTXjFV/gTDEyDFsD3/DsvwWy7DyMULAuaathoXN+XBbol4W+ssVUzJ0z3DV2kGSEBq3e5u/7S08mujhQRSqfzYQ9QZ5vluGQS7qrIpLtVA7AFEypggxg==
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(7416014)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eEpKpuHH1nbaedKoaJUiYz0Sv42SErxBcQDraDA9+wqCnJA+PkGNmiS8nxJkQEfmOqRgAU7V+hCXSo8RgIxLUuUEkYL5//2O39wYFuHEeM+/EE0pmgO/aiTMAkkUkUUVgJsx9nJi1z9n8gtvMuNmm1TWOwjCn/XWEFdk0bzkPi+yAAl6jr+opB1xXj7red3WX8A0T8A6us9v9s1HTYuhK2wshl2V1TguktTQgdPA+DrViUqyzsPrYrcAPR9fyrJv+fbDNSS2atZvTg5oRiJ0rt+BSzGqSueUqHLBNmAK/dQCqyGRnTWS1Fsv5/An58rNW3s5SG3uDdIRTraVoul7rDOJ4r0WNHyUDGSvcz5ylOU+Jv0PiZfynF5mlWO/rt1lNDKalvBLB+C4cYI8SFCapwsRBMiFnRFbsiCGof5waf5CGclhRpiD52SGiuQmDtL0
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:16:36.4283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c59230ce-099a-455d-d242-08df4647b8ad
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT2PEPF000001C8.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8149

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

v1: https://lore.kernel.org/netdev/20261116143716.367451-1-cmcburney@telcobridges.com/

Curtis McBurney (2):
  net: keep txq->trans_start on repeated netif_tx_stop_queue()
  net: net_test: add tests for netif_tx_stop_queue() trans_start

 include/linux/netdevice.h |  14 +++++
 net/core/net_test.c       | 112 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)


base-commit: a1671b708d2c063d036f6e4c997e63539c2c2f3e
-- 
2.52.0

