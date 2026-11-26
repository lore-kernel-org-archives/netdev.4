Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708889;
	b=fclvY6uzZGyMIyQt8pLEdoQDbQMfXKXZr8Y6vyqdGkxTVI6UKvmExwYHYdQZD0R0p3+/
	 n+Vx34KjR0r9j13JE9Vugt1V1d9UYyAdzrYbFp+XlIfnOvqKkncJIpyq/NPUm4IKqlugJ
	 DUB3XFpjUmUU1eSEvb2rvjnZy/3xYpbm8VP7ccdKteH4YvmsWqRVnfeqGZmwZpH+kb1f0
	 TfN+wLW51mu5a0huK3sMpEe/dq2imksRZ5syaw2hUygk86Td1xvAMQX4AnoSW9lrhH6Da
	 gW1OHyqkK7MrD4o2hvfHZy/0bhAtyQ9A3ErXI1AVtTNV5IiFOMiuhlYcye+oD4pVNCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708889;
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
	bh=g3C0/ymgwIxvM0d+P3CAu49I72VvCxfnalCInUO3d1c=;
	b=AN2ggFc0kG/ezpr6XFbHRWTTqVMwIjMp0I9M+cy/0S5UZ/gQ+4fy5dWJbQdZaAxRqrBm
	 Gxllpgk4L+520TXp9pDq1aHD569kHWGlDHXMJxiOsToMIE4vW1oKkCVyE6rOwp3yoj1SC
	 rFecsoFkz6IXKBkXfEMgcOOSezSGOvex0g8PzxGFKmkA38rS/laJK4/2bPs7P7ImilGLd
	 VJaWlGXbkXkRXhLnecpEm9tKTGQFtOdMAqAUOc0LiewhuUoh150NKd3ZDvoQTORIen1ud
	 HMX4++fRpZ8VHe9yo7I3DY4NZAFCt8yepyOAHmW1dvhBZ1E5gxEP7WfVKOd/WtN8xUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=F8Diyp8W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.107
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022107.outbound.protection.outlook.com [40.107.193.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D1606A327;
	Thu, 26 Nov 2026 16:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=F8Diyp8W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j07OUMrsdhF5xEVfQccmEHIAL+1+FYkZvrlxUwEXs4/m1Nf4kfck0Y7Kjx+xe55V1MJchb9cj20G4NNvIgEbk+wDlQSZKtxybWoz+cpoZxVk9pNvO9Q6WVj22PeYbYT/YP4Inkp4tEzzsClthdCT8qBE+mPsnGSslQQduOK8kzLkMyRPE+rffbuDa5MYwijWLZ0A7ekiZHri9ZIOhL5gvxdeUFts5NyWxuzhccuuxOnH5GhzY7k/4dyYD4CYMkUMCH3sr7ENnBNlrEvjZfxHDTi66COja5R2wZqpcl1jmK+nTZaqMq0SVbdLSlinsWf8N6gIusyakA5NBaWhriR+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3C0/ymgwIxvM0d+P3CAu49I72VvCxfnalCInUO3d1c=;
 b=LEwIbXdaOiM7YQHtNmjjjcSB8vir6/Num5rCFv1RqX/c+C6RdYktTbHnG6Qu8M9HSibSpquXSVSPfjLz4uOPtPYaCMfda3ynBmANhQKHdhHftS3V1Fum74cznFDQOqzWCDJkVqjGDX94pjzlNfA9tFXZIHMKIDexm1G2+LoTcQSnVx2UeriFs6TPHCaNWgVBPkpqC9ihXJnooKVyqbmhr3i/6GvNCVFXr6yUeqwRdkvaL37jPCdWQMAYYaFMLghvlwcJ1tkCVO+W1G0WRhTxGRwBcy6Dd44G7ZsiRfTfC8RinSUwlfs54yUxXhWSpgm9ZgmxGCxBLKxTpdTXX4XNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3C0/ymgwIxvM0d+P3CAu49I72VvCxfnalCInUO3d1c=;
 b=F8Diyp8WcCrvu5FIqx8CVlAjyjq0sc624nZb5eg8WThaEEphHZYn3VmCY897tHu40Pn8j2IVVLxp//OBF0h24kpPXv6ZOY9+n49chjPx9xkfecWSEP2bIyATvzZWztw7uNl+C/7Fqn8Jj60Ba0BMwk6ZNcNOAOEOSC3GgTVtiqw=
Received: from YT3PR01CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::9)
 by YQBPR0101MB5602.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:01:24 +0000
Received: from YT2PEPF000001CF.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82:cafe::74) by YT3PR01CA0038.outlook.office365.com
 (2603:10b6:b01:82::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 16:01:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT2PEPF000001CF.mail.protection.outlook.com (10.167.241.39) with Microsoft
 SMTP Server id 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 16:01:23
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 75DE69656;
	Thu, 26 Nov 2026 11:01:23 -0500 (EST)
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
Subject: [PATCH net v3 2/2] net: net_test: add tests for netif_tx_stop_queue() trans_start
Date: Thu, 26 Nov 2026 11:01:14 -0500
Message-ID: <20261126160117.652865-3-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126160117.652865-1-cmcburney@telcobridges.com>
References: <20261126160117.652865-1-cmcburney@telcobridges.com>
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
X-MS-TrafficTypeDiagnostic: YT2PEPF000001CF:EE_|YQBPR0101MB5602:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ebec64f8-f330-402d-2db7-08df4bd68519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|10067099003|261028144727099003|261026140227099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|56012099006|261102123227099003|261009223027099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RNI2jeZsOwtx04AvVlIL0gjxPrPQwAFK3JXghxrBFMQFwdcLZsce+LO8Jz+fUW2Co2XE4E22bBysHteUbRNce33SMVPnIaf+W/9XvK+l3yn5vIGUa/ky+x9Js9BRnlFqwYvd9DIWmFL92p0koIEBHfvl97mPmtKkNmPSLLkGjaMiadC2yiEH6OGZgjTydluYM6DTEqquvo9wBaz6aSCsklmvMsV4uCkFdBBtP5gkr2ieqYf+Yg48Wi7c2eiY3rsIQnJpITS/nV3F0D9J9Q1nHxfVHabiNEXvPcrDbhDXvoH+UDfxCkZV/aQMfc+6CO0Xur+xqXhuDaO5tazoGGB8UV3PVa1ZtlpeflIF7gwCdToKeGpoT6k7Ru83ciU2k38bqdId2PfMyjeIruPBK//mMN+r7Sg1f2VPUePsHhoj4F4DFCbPkEKwPGnPpKiEFzZreytttlOtQB0DA2qyVfEqvXNl7mrEVMowdOkLdmeIS1J42Uso4yCRtPSRtST3WmWlupRZw5JncxUISHPrLlHjmbhkoYo03EAVfOf1swAbEbg6XI9ZMEfvTV7EzY5gpe4rdKhiBCWFd7tAZ0i2TuHuKV6xrx8X3WtJBm8aanMwIVBhaJofUZ+T33KRPwM3ZTCXCVZjchq4tieSncdaxQrgLBbrRsVWak+I6gmSZtrA2hetic/RfRLxiI13G85uY0zd1Rxr3Fr5WNPqsYJYYmLHqg==
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(10067099003)(261028144727099003)(261026140227099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(56012099006)(261102123227099003)(261009223027099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qoHNGxnfCjQXejd9oyfH5sC6hcHnM8heJnP8t5zT9VemyfvwIrFIrwzXITTzgh2v/vuj5S5XspCLaygf3J3ol7DyNJYnDhjz6b7Ta7gsq3OAXZPI9BEO4ofGtuHbive6dr6zxJxMm13NANZhpBzoY3lQ/lByF9tvCcjuz7HpUs6fGwTODg6M1Wm6QRe+Tm4d2uqNhJb4HuDMPeHGIA5YIOufTDhTEDxmK5LN+D4tMWrS36Vd83zYuJbNtPerm6UxBKGQekSI+nPSQSD8qG95rbKk69rM/lrj7+0Y7iekS7sT1gLdCopfNaj3899H/vSyVYSnECQEHsi9bVYasx8Y2PSeIhUiVRZWwkKIv30TVXMPsD4qmU36gDph1KyH3veCAAV0EvTgI5Uru43tT0/Gsx/vi87pHIwDMFbl5OTAa7Xn53d+whsLqPweIJOJj5fE
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:01:23.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebec64f8-f330-402d-2db7-08df4bd68519
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT2PEPF000001CF.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5602

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
index 47f5dc0fa5cf..dfc91eb2638b 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -513,6 +513,114 @@ static void ip_tunnel_flags_test_run(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, __ipt_flag_op(bitmap_equal, exp, out));
 }
 
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
 /* Netmem & SKB fragment refcounting */
 
 #include <linux/skbuff_ref.h>
@@ -1791,6 +1899,10 @@ static struct kunit_case net_test_cases[] = {
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

