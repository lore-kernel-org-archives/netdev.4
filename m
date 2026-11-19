Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106831;
	b=BHB/ww5Sf/vfGF1X+Axd3JIm7NxaMxzhiX3s7ahrFhmEXb1UOoCBgLI9Gi3EqKL3dJxZ
	 0mceoaEfgMXcxrTth2yqD2B74N5Gvvsm+5hLMKWJoYLlsVPawkTFvXPI73D7XRWmpAmVp
	 2yTswN0uQmvhSbhGRnWiu8ola82WMB7zC+g3Z53ZiiAAFpTqhg3L2AbY6lTfzHtpoEGV5
	 jNWZYzKhhHk/a/Lth3bdFmEI+QVI9FX4pZ8D5IHV3TXqt2phU3vTDVQFPI3WNPADoRtFt
	 wW8K6qdxTj6z3xZrbUmJc/DSfzyDIpSL+Xt3FCoDVVTLQ43SJP9JaMqQpPHlB//PZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UthzXr7qW5SLshY0NcDiwgpNH51IAMCiNCLdhyyDWzo=;
	b=Et90kyBbfTNqfwP/+qHL4BGKmshJ4KhUl3yQ/h4uUS8OibLkZZxzfqF/n+MBkRsUASho
	 Mwx6ir4B/KVhcm+gCrSYoSz7/Q89rtKB4NoinzEgxJOQL/yM6ti59bB1RM7aeiCMhAlN4
	 +w8+wbrXlM4B5aCIXnvgwFyS14eAJV29gVZpPlmLjGlCEmVvkFYSY6eYCpGBgEdZ0ZQoN
	 hQ3sOLUq0pu6+AkSd+DPzLuXu4SGiZnYR4i9IfKJZonF0ngg+l0zGEDCaRq2PIsEEOeuO
	 YnaGtpnDQg+rNubGCY7wWhEgQG/IVZGoidz5gN57Aaxn3NKXZKH68waeIK6C0z1tjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6wkzHXR;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5960A2610
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A5960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6wkzHXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106830; x=1826642830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ijNUoshtmw3s2h/iK754kbI7JYaXU59Jh28lj3rkhiQ=;
  b=S6wkzHXRNCzzY3K040ngzZtIiC19RFuzyq9IFnuCjvQjh7i4ucuSUXfr
   cJNQHS/zA+3r4SXbs0qWxihNSc6hhgSsF5jH/hqpcZd89iSOcET6f7cKm
   1dpu+Xd0w+KZ7qrNCr1QCtpvsVyJEjpTaMAW7ek7L576sss9WNEluvqLA
   r414x/BZn86uWHNN8TwF2hk63WSMd1W8aLNaI0koonRakdDXCZu04+FpQ
   uw5Xx2N1COpdeHiXmdYB/bYvIaNhwftB4Go7xngJDWN8qE1N0RUuT2e5S
   Q8LjHC0NhRLdlqqYkj6KT/323ZUjKBo+ae6CN4zhNaawFYDwj5ceFgJHc
   w==;
X-CSE-ConnectionGUID: fPNN1aRJTTqwtatBILUamg==
X-CSE-MsgGUID: 9JtGTpKZShGJjpIKr77i0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991197"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:47:09 -0800
X-CSE-ConnectionGUID: 6dD22HmnSHeb3lJBNr26UQ==
X-CSE-MsgGUID: ZeVgF+ReTl2Id8OTA7WgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843397"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:47:07 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v5 net-next 10/13] selftests: xsk: list the endpoint roles of the test cases
Date: Thu, 19 Nov 2026 17:46:33 +0100
Message-Id: <20261119164636.1071385-11-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
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

On a NIC, drivers/net/xsk.py, added later in this series, runs each
case with its zero-copy endpoint as RX, as TX or as both. A list of the
cases by ID in that runner would repeat the test table and silently go
stale when a case is added or moved.

Split tests[] into the tests that check both endpoint roles, those that
check the RX endpoint, those that check the TX endpoint, and the
generic ones, which a hardware run does not do: BIDIRECTIONAL swaps the
directions, and STAT_RX_DROPPED and TX_QUEUE_CONSUMER skip in zero-copy
mode. The test IDs follow the order of these arrays, so they change,
and xsk.py takes them from xskxceiver. The notes that came with
ci_skip_tests[] go.

-l now follows each test with the roles that it tests on hardware, e.g.
"0: SEND_RECEIVE rx tx" or "9: POLL_RX rx", and a generic test with
none, so that one list serves both a veth and a hardware run.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.h  | 68 +++++++++++++------
 .../selftests/net/lib/xsk/xskxceiver.c        | 33 +++++++--
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index 15534f4ec8f4..6877ec324b58 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -304,49 +304,73 @@ int testapp_xdp_shared_umem(struct test_spec *test);
 int worker_testapp_validate_rx(struct test_spec *test);
 int worker_testapp_validate_tx(struct test_spec *test);
 
-static const struct test_spec tests[] = {
+/* Tests by the role of the endpoint that they check, which xskxceiver -l
+ * lists after the name. A hardware run gives that role to its zero-copy
+ * endpoint. It does not do the generic tests: BIDIRECTIONAL swaps the
+ * directions, which a hardware run tests one at a time, and the others
+ * skip in zero-copy mode.
+ */
+static const struct test_spec hw_rx_tx_tests[] = {
 	{.name = "SEND_RECEIVE", .test_func = testapp_send_receive},
 	{.name = "SEND_RECEIVE_2K_FRAME", .test_func = testapp_send_receive_2k_frame},
 	{.name = "SEND_RECEIVE_SINGLE_PKT", .test_func = testapp_single_pkt},
+	{.name = "SEND_RECEIVE_9K_PACKETS", .test_func = testapp_send_receive_mb},
+	{.name = "SEND_RECEIVE_UNALIGNED", .test_func = testapp_send_receive_unaligned},
+	{.name = "SEND_RECEIVE_UNALIGNED_9K_PACKETS",
+	 .test_func = testapp_send_receive_unaligned_mb},
+	{.name = "HW_SW_MAX_RING_SIZE", .test_func = testapp_hw_sw_max_ring_size},
+	{.name = "TEARDOWN", .test_func = testapp_teardown},
+	{.name = "XDP_SHARED_UMEM", .test_func = testapp_xdp_shared_umem},
+};
+
+static const struct test_spec hw_rx_tests[] = {
 	{.name = "POLL_RX", .test_func = testapp_poll_rx},
-	{.name = "POLL_TX", .test_func = testapp_poll_tx},
 	{.name = "POLL_RXQ_FULL", .test_func = testapp_poll_rxq_tmout},
-	{.name = "POLL_TXQ_FULL", .test_func = testapp_poll_txq_tmout},
-	{.name = "ALIGNED_INV_DESC", .test_func = testapp_aligned_inv_desc},
-	{.name = "ALIGNED_INV_DESC_2K_FRAME_SIZE", .test_func = testapp_aligned_inv_desc_2k_frame},
 	{.name = "UMEM_HEADROOM", .test_func = testapp_headroom},
-	{.name = "BIDIRECTIONAL", .test_func = testapp_bidirectional},
-	{.name = "STAT_RX_DROPPED", .test_func = testapp_stats_rx_dropped},
-	{.name = "STAT_TX_INVALID", .test_func = testapp_stats_tx_invalid_descs},
 	{.name = "STAT_RX_FULL", .test_func = testapp_stats_rx_full},
 	{.name = "STAT_FILL_EMPTY", .test_func = testapp_stats_fill_empty},
 	{.name = "XDP_PROG_CLEANUP", .test_func = testapp_xdp_prog_cleanup},
 	{.name = "XDP_DROP_HALF", .test_func = testapp_xdp_drop},
-	{.name = "XDP_SHARED_UMEM", .test_func = testapp_xdp_shared_umem},
 	{.name = "XDP_METADATA_COPY", .test_func = testapp_xdp_metadata},
 	{.name = "XDP_METADATA_COPY_MULTI_BUFF", .test_func = testapp_xdp_metadata_mb},
-	{.name = "ALIGNED_INV_DESC_MULTI_BUFF", .test_func = testapp_aligned_inv_desc_mb},
-	{.name = "TOO_MANY_FRAGS", .test_func = testapp_too_many_frags},
 	{.name = "XDP_ADJUST_TAIL_SHRINK", .test_func = testapp_adjust_tail_shrink},
-	{.name = "TX_QUEUE_CONSUMER", .test_func = testapp_tx_queue_consumer},
-	/* Flaky tests */
 	{.name = "XDP_ADJUST_TAIL_SHRINK_MULTI_BUFF", .test_func = testapp_adjust_tail_shrink_mb},
 	{.name = "XDP_ADJUST_TAIL_GROW", .test_func = testapp_adjust_tail_grow},
 	{.name = "XDP_ADJUST_TAIL_GROW_MULTI_BUFF", .test_func = testapp_adjust_tail_grow_mb},
-	{.name = "SEND_RECEIVE_9K_PACKETS", .test_func = testapp_send_receive_mb},
-	/* Tests with huge page dependency */
-	{.name = "SEND_RECEIVE_UNALIGNED", .test_func = testapp_send_receive_unaligned},
+};
+
+static const struct test_spec hw_tx_tests[] = {
+	{.name = "POLL_TX", .test_func = testapp_poll_tx},
+	{.name = "POLL_TXQ_FULL", .test_func = testapp_poll_txq_tmout},
+	{.name = "ALIGNED_INV_DESC", .test_func = testapp_aligned_inv_desc},
+	{.name = "ALIGNED_INV_DESC_2K_FRAME_SIZE", .test_func = testapp_aligned_inv_desc_2k_frame},
+	{.name = "STAT_TX_INVALID", .test_func = testapp_stats_tx_invalid_descs},
+	{.name = "ALIGNED_INV_DESC_MULTI_BUFF", .test_func = testapp_aligned_inv_desc_mb},
+	{.name = "TOO_MANY_FRAGS", .test_func = testapp_too_many_frags},
 	{.name = "UNALIGNED_INV_DESC", .test_func = testapp_unaligned_inv_desc},
 	{.name = "UNALIGNED_INV_DESC_4001_FRAME_SIZE",
 	 .test_func = testapp_unaligned_inv_desc_4001_frame},
-	{.name = "SEND_RECEIVE_UNALIGNED_9K_PACKETS",
-	 .test_func = testapp_send_receive_unaligned_mb},
 	{.name = "UNALIGNED_INV_DESC_MULTI_BUFF", .test_func = testapp_unaligned_inv_desc_mb},
-	/* Test with HW ring size dependency */
 	{.name = "HW_SW_MIN_RING_SIZE", .test_func = testapp_hw_sw_min_ring_size},
-	{.name = "HW_SW_MAX_RING_SIZE", .test_func = testapp_hw_sw_max_ring_size},
-	/* Too long test */
-	{.name = "TEARDOWN", .test_func = testapp_teardown},
+};
+
+static const struct test_spec generic_tests[] = {
+	{.name = "BIDIRECTIONAL", .test_func = testapp_bidirectional},
+	{.name = "STAT_RX_DROPPED", .test_func = testapp_stats_rx_dropped},
+	{.name = "TX_QUEUE_CONSUMER", .test_func = testapp_tx_queue_consumer},
+};
+
+/* A test ID is the index of the test in these arrays taken in order. */
+static const struct test_group {
+	const struct test_spec *tests;
+	u32 nb_tests;
+	bool hw_rx;
+	bool hw_tx;
+} test_groups[] = {
+	{hw_rx_tx_tests, ARRAY_SIZE(hw_rx_tx_tests), true, true},
+	{hw_rx_tests, ARRAY_SIZE(hw_rx_tests), true, false},
+	{hw_tx_tests, ARRAY_SIZE(hw_tx_tests), false, true},
+	{generic_tests, ARRAY_SIZE(generic_tests), false, false},
 };
 
 
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index cc7754f3a822..fa6d8798e6b0 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -176,7 +176,7 @@ static void print_usage(char **argv)
 		"  -v, --verbose        Verbose output\n"
 		"  -b, --busy-poll      Enable busy poll\n"
 		"  -m, --mode           Mode to run: skb, drv or zc\n"
-		"  -l, --list           List all available tests\n"
+		"  -l, --list           List all tests and the roles they test on hardware\n"
 		"  -t, --test           Test case to run, a number from -l\n"
 		"  -e, --endpoint       Role of this endpoint: rx or tx\n"
 		"  -p, --peer           Control host: IPv4/IPv6 address or hostname\n"
@@ -220,13 +220,31 @@ static void bind_iface(struct ifobject *ifobj, const char *ifname, char **argv)
 	ifobj->orig_mtu = ifobj->dev_mtu;
 }
 
+/* List each test followed by the roles that it tests on hardware, if any. */
 static void print_tests(void)
 {
-	u32 i;
+	const struct test_group *group;
+	u32 i, j, id = 0;
 
 	printf("Tests:\n");
-	for (i = 0; i < ARRAY_SIZE(tests); i++)
-		printf("%u: %s\n", i, tests[i].name);
+	for (i = 0; i < ARRAY_SIZE(test_groups); i++) {
+		group = &test_groups[i];
+		for (j = 0; j < group->nb_tests; j++, id++)
+			printf("%u: %s%s%s\n", id, group->tests[j].name,
+			       group->hw_rx ? " rx" : "", group->hw_tx ? " tx" : "");
+	}
+}
+
+static const struct test_spec *find_test(u32 id)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(test_groups); i++) {
+		if (id < test_groups[i].nb_tests)
+			return &test_groups[i].tests[id];
+		id -= test_groups[i].nb_tests;
+	}
+	return NULL;
 }
 
 static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj_rx, int argc,
@@ -468,8 +486,8 @@ static int setup_peer(struct ifobject *local, struct ifobject *shadow,
 int main(int argc, char **argv)
 {
 	u32 cache_line_size, max_frags, umem_tailroom;
-	const size_t total_tests = ARRAY_SIZE(tests);
 	struct ifobject *ifobj_tx, *ifobj_rx;
+	const struct test_spec *test_to_run;
 	struct ifobject *shadow_ifobj;
 	struct ifobject *local_ifobj;
 	struct xsk_peer *peer = NULL;
@@ -515,7 +533,8 @@ int main(int argc, char **argv)
 	ifobj_tx->caps.umem_tailroom = umem_tailroom;
 	ifobj_rx->caps.umem_tailroom = umem_tailroom;
 
-	if (opt_run_test != RUN_ALL_TESTS && opt_run_test >= total_tests) {
+	test_to_run = find_test(opt_run_test);
+	if (!test_to_run) {
 		ksft_print_msg("Error: test %u does not exist.\n", opt_run_test);
 		ksft_exit_xfail();
 	}
@@ -558,7 +577,7 @@ int main(int argc, char **argv)
 	}
 
 	ksft_set_plan(1);
-	test_init(&test, ifobj_tx, ifobj_rx, opt_mode, &tests[opt_run_test]);
+	test_init(&test, ifobj_tx, ifobj_rx, opt_mode, test_to_run);
 	ret = run_pkt_test(&test);
 
 out:
-- 
2.43.0

