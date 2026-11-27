Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791979;
	b=Uu1gtgYrtltk6K8fT5J32CfE7g6F5tNBIMmM/d41mGSrM0C5DBQMeAXA90mCyQE7Pp5N
	 KXySYwfBLKy2hDdWJJBC7zCqgodXtL2LwZVNpPdv8YuZy1XavDmwehIXakxC2vY1Nv6fT
	 anwC6gp1iMRA4Sh49Z9W0aMbHRgOli1kXXzZSMLiZBjh5T7MVYetM6zVUX5VoRmf0Rs1r
	 Rhemnb26lWDtbOcE8dvnVzHbuPvYBlbRmgNbM4krw7HiDRhrDGKzM/JnNgPwoIsZ0JDiM
	 ilrgLI+Qdts/qnlH5sWc1x1rEQPM1hBlwo9eNcdfzrVzf9+MCiPwagsmViHetjNfStQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791979;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hB4AxvW4mJtIMviSd89HZFX1F49XQwww81vlLGp7fsE=;
	b=GjO/kFZfxIoHdWGf/2T/bhpqf5vK2Z/rexd8CpAPogIARC+dCBomLy+3O+3azu1/K8+t
	 2TLjp2+HA/TpqvcN7K66VIGL6Dkro6da1OxV2LmLRXRqlx7zrjA8/9Wx5x5ZKdv8t94XH
	 0HgmosVVDLY8UOgbl0EO/8wvbrlTRoeQm5NHWKN1Ap0Ql8unLw4dZACEVEZinW+rE3PHJ
	 Ta8jwR/degwSnCuEga8F3lmrB1ueEWm5rqrPHGfRQSaZB6IkLIEe8tKiFARzYUZcPqtC3
	 xJTPo5d+0NB4IjVzigEocq1EdQNazx3bFKFePtRfXobYeKmXfiQNc2oaMjcrEIQxALQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5W4UvHk;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCC606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFCC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5W4UvHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791979; x=1827327979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJi7uUyCDiDA0XokVRTbuchv7SJGD6iPdYi9NB4uXOo=;
  b=N5W4UvHkHvJpMM4M17edflIjPyAd0JCxycKIj403W+YJ/Oew1Vwjiyps
   hmxURZ8veywxdUU3UWR3mJ5DnV4fGrvGX1CHZQ6B6keSGYp7ee7JPQcE4
   CdDHtiK8ieZSUlAdnZICxES4/EauSNXEuYrTMUwePd+3FohpGTzIgpxMQ
   7EO4bUerRwAsKyQG2dcUYSHMmFR7/RvPa5oQeY008bSHZOLis+XO+34Gg
   wQh5F2lDPRgwIGImZf2QuMnzK4ZzSUfWPiuDB2JFriWWvXr+4GPxQCPm7
   gKaimWNlg3kIK6DJB1fSHoltxMz3VwAETmin7W+B1Cxmrz0v2F+RnNyMb
   g==;
X-CSE-ConnectionGUID: B0dSfBSVTGKVXvRYGjF3cQ==
X-CSE-MsgGUID: 0BrJvP3bS+eV0CiHuoZ5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666190"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:18 -0800
X-CSE-ConnectionGUID: NycPpIDmSpeouzsQtd0+mg==
X-CSE-MsgGUID: C/vV3PcAQoSHEC9thGyjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202919"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:16 -0800
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
Subject: [PATCH v6 net-next 12/15] selftests: xsk: list the endpoint roles of the test cases
Date: Fri, 27 Nov 2026 16:05:24 +0100
Message-Id: <20261127150527.1122049-13-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On a NIC, drivers/net/xsk.py, added later in this series, runs each
case with the DUT endpoint as RX, as TX or both. Rather than keep a
list of case IDs there, split tests[] by the role that a case tests:
both, RX, TX, or none for the cases that run only on veth:
BIDIRECTIONAL, and STAT_RX_DROPPED and TX_QUEUE_CONSUMER, which skip in
zero-copy mode. The test IDs follow the new order, and -l lists each
test with its roles, e.g. "0: SEND_RECEIVE rx tx", so that one list
serves both runs.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.h  | 68 +++++++++++++------
 .../selftests/net/lib/xsk/xskxceiver.c        | 33 +++++++--
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index ee840ccdfcbf..872e15206b48 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -303,49 +303,73 @@ int testapp_xdp_shared_umem(struct test_spec *test);
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
index 07e4cadfb164..7d6aa464c660 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -173,7 +173,7 @@ static void print_usage(char **argv)
 		"  -v, --verbose        Verbose output\n"
 		"  -b, --busy-poll      Enable busy poll\n"
 		"  -m, --mode           Mode to run: skb, drv or zc\n"
-		"  -l, --list           List all available tests\n"
+		"  -l, --list           List all tests and the roles they test on hardware\n"
 		"  -t, --test           Test case to run, a number from -l\n"
 		"  -e, --endpoint       Role of this endpoint: rx or tx\n"
 		"  -p, --peer           Control host: IPv4/IPv6 address or hostname\n"
@@ -218,13 +218,31 @@ static void bind_iface(struct ifobject *ifobj, const char *ifname, char **argv)
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
@@ -503,8 +521,8 @@ static int setup_peer(struct ifobject *local, struct ifobject *shadow,
 int main(int argc, char **argv)
 {
 	u32 cache_line_size, max_frags, umem_tailroom;
-	const size_t total_tests = ARRAY_SIZE(tests);
 	struct ifobject *ifobj_tx, *ifobj_rx;
+	const struct test_spec *test_to_run;
 	struct ifobject *shadow_ifobj;
 	struct ifobject *local_ifobj;
 	struct xsk_peer *peer = NULL;
@@ -550,7 +568,8 @@ int main(int argc, char **argv)
 	ifobj_tx->caps.umem_tailroom = umem_tailroom;
 	ifobj_rx->caps.umem_tailroom = umem_tailroom;
 
-	if (opt_run_test != RUN_ALL_TESTS && opt_run_test >= total_tests) {
+	test_to_run = find_test(opt_run_test);
+	if (!test_to_run) {
 		ksft_print_msg("Error: test %u does not exist.\n", opt_run_test);
 		ksft_exit_xfail();
 	}
@@ -593,7 +612,7 @@ int main(int argc, char **argv)
 	}
 
 	ksft_set_plan(1);
-	test_init(&test, ifobj_tx, ifobj_rx, opt_mode, &tests[opt_run_test]);
+	test_init(&test, ifobj_tx, ifobj_rx, opt_mode, test_to_run);
 	ret = run_pkt_test(&test);
 
 out:
-- 
2.43.0

