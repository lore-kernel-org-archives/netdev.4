Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097809;
	b=tZxdOrT+RKSZrhoVv3ZY7EZlL9yhzBAUs25mv1xzjJupLO4Yd86ZNOa1LeYsVBc2Invn
	 PTpiVWSfX+b0R7pytEQj83dmgKBWufP+hWNVFx8/zZwUEPEKHTYANCg5047tGJjMJ8mdx
	 SWG7vkeClt8e4lLdNpAONeXdtv40Vln9ocMeqnlGWCx8BskVU3TF4iyLJpkFWN1SmZWfK
	 2HaO8imLPYSQ3XeMyrPoDZJSCYO6t9f6JjjoPPJxaE1b2sZJ//1e14ayafylr/UFKNiu3
	 28DMzvv2AGafPFvbmQiJzaszTn8c/6t6VDiqMI/Od/HT3Tb2NvTMfAVx0UPjMERsUeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097809;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	bh=AjGmTYfwk+pEetozVokxzOL4oEgaLM49CmOKLNeGY3U=;
	b=mM8V1XfvYotfeE5XWKjIfIvGVBuVv2P6QSBHiQqgKHw2FUm/kPTlBSVU+qNzynkBPVed
	 zytwWcHS2Pr8McjIc+/5qvbr7cQPpsXSiR6lmpPJ7gde2WF7N+fuhZJaQEXk+WE/gK2K0
	 1w+GowZeWwtgS2Pxn3I1XQ9zICiBCqMLEANwS0sWhFsrT0NQ+zjNOKP+9zs3K96sEEGQR
	 coUitcJxtim4OdlQ+sk/8+fgIcanjQCsPjld/VxVzRMLVVYtgOYUwlGgz4l3MqwB+2+oQ
	 xO5wAnFQfeiDO5p6oEZeX+TLIL4AgyuEVp6vAVjuOtoGg5Koby0F2DCQmTUmE77F95Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=lziU0q5v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.129
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020129.outbound.protection.outlook.com [52.101.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CA60A260F;
	Thu, 19 Nov 2026 14:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95CA60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=lziU0q5v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCgvjLQKsz753iARkIIJMaIZi6Y9DgXOT8NMusJz90yz540rgIfjZDpxgkTRtbVsJ7YS3uqqPuVstD3VjpOBPXK5dpuV+jttqwg7Y9tcqhAHkb+ceU+47/0XJLmdc8/cj1wwewp8G4H5WHB1eGWah0vQB3pwy4A5ycQMhC4MveU4cDnTsy4e1Nim52cfd5DPcReCR0fXwBRWO0k0N/WOnkxC3mmSf96ZnRgDELEtfaGCEe34HdwSfbpCXmVo3fJho9hCxW5oYoew6XRTrW8tM6vgp6ae3QJxSJyTAdKDXmIyIjT4B/bm5z12NEW04T3yF66DDv2/bRuITOG4n2DPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjGmTYfwk+pEetozVokxzOL4oEgaLM49CmOKLNeGY3U=;
 b=bIQ/u+Pk+b0n52LWwMbKs1Csw80qQQhXmT975466YLgB+XJg4iGBDn8783QCswvi1xz8GXwPAwxnmklYeDHMHqbzt6moyRa/FOMenbtDHk3FbP3z5kjEi50nmBTXZg0/P6xw1mXEYvtBO0v0aMLS/onpJScXj5Ghl7qGyhkkMuL0kaK19OlE566/CbS8JXn75GrY+Ldg8Aq5S5w7wy4XmsIUSnrQ58SDum/f7q/oWQGb/5DzR/UrJxj9Gdk5uhMvMa/Ux5pbrhhnsZZSxW7MueEz4vgTvX+vKWkku8/dnonX5RK9PfwyT3xiXaGMUHrbo1VN7L9L4IdgtrXJ3qwQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjGmTYfwk+pEetozVokxzOL4oEgaLM49CmOKLNeGY3U=;
 b=lziU0q5vdTmlR57Gxz+r+fb6Dp6ZvJ4NFpErIyJwIpEaQ9DegHTlNZZe50E3DHWAnYuKxUBztazX/AhIWE5YnpVL9a0Q+md+q1FeNorz7DroSm9xlesG+c55T56SP+OxC9Cq96IYe6+WGss5OLrqR1JLcI425UqIQ4bBU4srw6c=
Received: from YT4P288CA0092.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:d0::27)
 by YT1PPFFAD0C5CD4.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::5ae) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:16:42 +0000
Received: from YT2PEPF000001CF.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0:cafe::3b) by YT4P288CA0092.outlook.office365.com
 (2603:10b6:b01:d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Thu,
 19 Nov 2026 14:16:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT2PEPF000001CF.mail.protection.outlook.com (10.167.241.39) with Microsoft
 SMTP Server id 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:16:41
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 47ECD9653;
	Thu, 19 Nov 2026 09:16:41 -0500 (EST)
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
Subject: [PATCH net v2 2/2] net: net_test: add tests for netif_tx_stop_queue() trans_start
Date: Thu, 19 Nov 2026 09:16:31 -0500
Message-ID: <20261119141633.3118789-3-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261119141633.3118789-1-cmcburney@telcobridges.com>
References: <20261119141633.3118789-1-cmcburney@telcobridges.com>
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
X-MS-TrafficTypeDiagnostic: YT2PEPF000001CF:EE_|YT1PPFFAD0C5CD4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 85d2f126-7653-403e-0211-08df4647bbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|22082099003|18002099003|6133799003|261009223027099003|56012099006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SYqtGmquIUQ3VNsoTZbxE+Rf5ZEmeksPs5frX2XqQcWZjgnibsk6cMYpMg9MUslLiDc326/JhwumDaff4d+7qvqds+lyR5hwKlNWh63BhaNJClCuZOBNkkec43PO+IZwpt7ED6mkSSo1cbtjk7TSAgOrciwLZN1+ioYE77yW/LHxHcTbpSVyJGHclFwj8GZWNQuB2MijeYg21GaNN4fnTE79EcJPWgq9LXtlk343zHiTDtfJi/5ndQl14QwqiU9j76Z5YwIZPSq+/mfftXLjyKo1NtGffsKVs9b0Y6SZrXcKEez+Z5EEVMPzu73mp9/auS8RMYTgR6o89pnUbpNic76xT4bWE2/Txr74GROaUCe9b0EGphL90v7sOs/vbmOW2OiGDta7kFytuQbxZ+ZehYN5joQJKep3OfsKCrB0DGKqf2kGYnM9/Q+xN30odtJHhPaCvX5tbpS0i8dGmxNl6xHf75H8y8tA7XcqvtC+cRJp7IPYCmN6121/wf1Do5lVbxJvoR9X64Folg22XXjZx/lSky4bPVfkCmAwJ94CL7VDWXsVfZTApLKtP51/Yd4QcgvmQw37E2VX74lwUiD82yGm8KEcObKdAU5z8xPt5HZjzI8bQLd9mWj9uqOB/pyIDH+VAnDkh8LEFz88mXMHApSrYYvkiU/U+e3bQOuEtq5Rs4WfCPrCbiqJmvUIfSlV
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hpnlQfs6gPrDEuXpfUn85bEkfQ4ZP5XZJvBoZxgr9lWaGIHsgqb2E5TMx8e+ti65S8w1Jx0oy0M+SCJWr7+mSX9kir0hObywo1piE+G4L4/9TZhupP6x/Gcp1SYUtI7QPW+Uoq+3O03+bUJ1laxl3iSUktekLnBb6uBEOVP6S65kDEdZmjasu7HNsQ3VNwWcx7AwJMZB6iczmwTH0S7xw6YB1R5+BPwCNlaWLYKB3PcSyPSxyjP6u0HTAwjihDsIVUV+VxlJbMC0xJO1nDxZT3I5C7ndsBh5DGIK7oXctXIvinWgcbHO2WnkmnNS7t2jDpR/7HLf4FQSC/m0GtFDNUY8xC9gCsf76JAAfgpgHkj+G3oqbEJe7Fkz+PNu2s4JZvNJO2sAvpbcIsHWqgEGWRPpZvXocWcCCHVx/vTXEabntyNEEcSCP761FIm3sXZX
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:16:41.4913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d2f126-7653-403e-0211-08df4647bbb2
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT2PEPF000001CF.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PPFFAD0C5CD4

Add KUnit tests for the txq->trans_start handling of
netif_tx_stop_queue(), which dev_watchdog() uses to detect a stuck
queue:

  - a stop on a running queue writes trans_start
  - a stop on a queue already stopped by the driver keeps trans_start
  - a stop after netif_tx_start_queue() writes trans_start again
  - a stop on a queue stopped only by BQL (__QUEUE_STATE_STACK_XOFF)
    writes trans_start

txq_stop_keeps_stamp_stopped_queue fails without the previous patch.

The tests run on a single thread and do not cover a wake that races
with a stop. The previous patch removes that race by construction: a
stop that finds the bit set writes neither trans_start nor the bit.

Tested on UML with CONFIG_KUNIT, CONFIG_NET and CONFIG_NET_TEST:

  tools/testing/kunit/kunit.py run --kunitconfig=<cfg> 'net_core.txq_*'

Claude Code (Anthropic) wrote these tests and this changelog.

Signed-off-by: Curtis McBurney <cmcburney@telcobridges.com>
---
 net/core/net_test.c | 112 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index c36333b36211..368545f1f987 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1723,6 +1723,114 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
 #endif
 #endif
 
+/* netif_tx_stop_queue() and txq->trans_start */
+
+#include <linux/etherdevice.h>
+#include <linux/jiffies.h>
+#include <linux/netdevice.h>
+
+/* dev_watchdog() reports a timeout when a queue stays stopped for longer
+ * than watchdog_timeo after txq->trans_start. A trans_start value this far
+ * in the past is distinguishable from a fresh one.
+ */
+#define TXQ_TEST_OLD_DELTA	(10 * HZ)
+
+KUNIT_DEFINE_ACTION_WRAPPER(txq_test_free_netdev, free_netdev,
+			    struct net_device *);
+
+static struct netdev_queue *txq_test_alloc(struct kunit *test)
+{
+	struct net_device *dev;
+
+	dev = alloc_etherdev(0);
+	KUNIT_ASSERT_NOT_NULL(test, dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, txq_test_free_netdev,
+						  dev));
+
+	return netdev_get_tx_queue(dev, 0);
+}
+
+static void txq_test_expect_fresh(struct kunit *test,
+				  struct netdev_queue *txq,
+				  unsigned long before)
+{
+	unsigned long stamp = READ_ONCE(txq->trans_start);
+
+	KUNIT_EXPECT_TRUE_MSG(test, time_in_range(stamp, before, jiffies),
+			      "trans_start=%lu not in [%lu, %lu]",
+			      stamp, before, jiffies);
+}
+
+/* A stop on a running queue records the stop time in trans_start */
+static void txq_stop_stamps_running_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
+/* A stop on a queue that is already stopped keeps the first stop time, so
+ * repeated stops from a driver hang check do not postpone dev_watchdog()
+ */
+static void txq_stop_keeps_stamp_stopped_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long old, stamp;
+
+	netif_tx_stop_queue(txq);
+	old = jiffies - TXQ_TEST_OLD_DELTA;
+	WRITE_ONCE(txq->trans_start, old);
+	netif_tx_stop_queue(txq);
+	stamp = READ_ONCE(txq->trans_start);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	KUNIT_EXPECT_EQ_MSG(test, stamp, old,
+			    "second stop moved trans_start forward by %lu jiffies",
+			    stamp - old);
+}
+
+/* A stop after a restart records a new stop time */
+static void txq_stop_stamps_restarted_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	netif_tx_stop_queue(txq);
+	netif_tx_start_queue(txq);
+	KUNIT_EXPECT_FALSE(test, netif_tx_queue_stopped(txq));
+
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
+/* Only the driver XOFF bit decides whether the stop is a transition. A queue
+ * stopped by BQL (stack XOFF) gets a new stop time when the driver stops it.
+ */
+static void txq_stop_stamps_stack_stopped_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	set_bit(__QUEUE_STATE_STACK_XOFF, &txq->state);
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
 static struct kunit_case net_test_cases[] = {
 	KUNIT_CASE_PARAM(gso_test_func, gso_test_gen_params),
 	KUNIT_CASE_PARAM(ip_tunnel_flags_test_run,
@@ -1740,6 +1848,10 @@ static struct kunit_case net_test_cases[] = {
 	KUNIT_CASE(netmem_ref_test_tcp_devmem_recv),
 #endif
 #endif
+	KUNIT_CASE(txq_stop_stamps_running_queue),
+	KUNIT_CASE(txq_stop_keeps_stamp_stopped_queue),
+	KUNIT_CASE(txq_stop_stamps_restarted_queue),
+	KUNIT_CASE(txq_stop_stamps_stack_stopped_queue),
 	{ },
 };
 
-- 
2.52.0

