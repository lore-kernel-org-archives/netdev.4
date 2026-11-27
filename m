Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791963;
	b=noBtPF6d0H0M+2YP9kR2E1oOMXWGS256diUXtHcrsPznUQkhXSHIML/NWxg8N1BIFGqN
	 3WlI6VLUH4asmtKj5f/pD5aKHkHSFoz81YaBIRq9z/k18MVlaXlxLSN5t9MPeb49RsjAH
	 RqaSCaEhtivPEZOfHTDHKInG8QqbcjA2eG5riiMyLBM0vUsXKOIJ9Zny55lJ4UNpTcvtz
	 6I/XlK6oL8SFvZcQyGjDrJ3So/EwutjyLbCA/vVfnYJlrcJ8rCix64adNsf8R9kgK7lOm
	 Nmsp/h3mn7WsQ0lIkhJfgeLVZJJZ8YsTflLjlmapv6nVMoRN8OwKNTIttX/Hw8KGAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791963;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4ozKL1qKd/61SBWORAtSQcHg++RMQfOSaF3ZlR5I1Ns=;
	b=2zlffrTXzzv3tGDTQ5oDpHmdWFa/laiEFf5LDord9fY9LGKf72bunwWROsxK0xV3sPAm
	 1EfluSm0lYqc9jxOzKXnj+tiL4eXC9ZrDfB+ESv2lPZXxbMu+Tak/8BBYY7/bsAV66ovt
	 AZyf1Zc9SVtfBhZ85yQEbWyDGKannzIvvOy2IVi0zVHpjn8xmp1sKr8laM0vrX7pCKV/Q
	 zv4kmCl3ucetytcISsCeFD8Vg+SNijYWZBXvp5+5GyYmBheAQhN/f6l5aNPM8fotncP5V
	 QR2vW/6TvASMbqW+XMsUOirxrpM9QSp6QZM1dK1eKTjXgGXNeK9DTPCPj1QBze07cIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NigL1y/Q";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D7606A337
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99D7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NigL1y/Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791962; x=1827327962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5oGpisO/FgHMiWgKlD8lSaYhMk4+Opg7Pop3ZDaraVg=;
  b=NigL1y/QGUXtaHB8nzZS7OkR5O76E5pck1MJa2HxOooQI2ZZ3qlaoWh9
   uiV45IyBYGADuJ4PGVER1vHSZEaLlkNuLOhZDN6Vm/0hgCVgTDuZ55c9B
   9Xp1tHt/zUIxpld7uMzB4z7AtNyro2MSrZs/FJz6NIYTvRgYv23uUybMy
   L5iPwggqmoIeE8JxMCiyvys4K/uv8CkPaTSbKlG02cuiLJTgPZGkeJS5+
   pbHi30MHitbP9Ul2NDhgLJzI2yR8b69TqwXgch53Mvqm+9mZqqolcihp/
   OX7tMxVw++6TewxosVoUBm1wKwgC7malIEzXgctDQPyrHfAbfiUBLuIUU
   w==;
X-CSE-ConnectionGUID: jeDIqxbBSLW/gZJve/TUgQ==
X-CSE-MsgGUID: byBiitFAQBW027IyJKuWPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666044"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666044"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:05:59 -0800
X-CSE-ConnectionGUID: lrb90hBCQF6lZUAxtOCNfg==
X-CSE-MsgGUID: m1+/yUcNREWmk4P6ZVnNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202717"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:05:57 -0800
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
Subject: [PATCH v6 net-next 05/15] selftests: xsk: collect interface capabilities in struct xsk_caps
Date: Fri, 27 Nov 2026 16:05:17 +0100
Message-Id: <20261127150527.1122049-6-maciej.fijalkowski@intel.com>
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

A later patch runs the RX and TX endpoints as separate processes, each
binding only its own interface, while the shared test code still checks
the capabilities of both ifobjects. A process will mirror its local
capabilities into a shadow ifobject for the other side.

Move the support flags and limits of struct ifobject into struct
xsk_caps, so that mirroring them is a single assignment, with
ifobj_has_cap() and ifobj_set_cap() for the flags and xsk_get_cap() for
the limits.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 84 +++++++++++--------
 .../testing/selftests/net/lib/xsk/test_xsk.h  | 34 ++++++--
 .../selftests/net/lib/xsk/xskxceiver.c        | 14 ++--
 3 files changed, 83 insertions(+), 49 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 8826697c58de..4e6adc2e4532 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -1721,20 +1721,24 @@ static int __testapp_validate_traffic(struct test_spec *test, struct ifobject *i
 				      struct ifobject *ifobj2)
 {
 	pthread_t t0, t1;
+	u32 mbuf_cap;
 	int err;
 
-	if (test->mtu > MAX_ETH_PKT_SIZE) {
-		if (test->mode == TEST_MODE_ZC && (!ifobj1->multi_buff_zc_supp ||
-						   (ifobj2 && !ifobj2->multi_buff_zc_supp))) {
-			ksft_print_msg("Multi buffer for zero-copy not supported.\n");
-			return TEST_SKIP;
-		}
-		if (test->mode != TEST_MODE_ZC && (!ifobj1->multi_buff_supp ||
-						   (ifobj2 && !ifobj2->multi_buff_supp))) {
-			ksft_print_msg("Multi buffer not supported.\n");
-			return TEST_SKIP;
-		}
+	if (test->mtu <= MAX_ETH_PKT_SIZE)
+		goto skip_mbuf_check;
+
+	mbuf_cap = test->mode == TEST_MODE_ZC ? XSK_CAP_MBUF_ZC :
+						XSK_CAP_MBUF;
+
+	if (!ifobj_has_cap(ifobj1, mbuf_cap) ||
+	    (ifobj2 && !ifobj_has_cap(ifobj2, mbuf_cap))) {
+		ksft_print_msg("Multi buffer%s not supported.\n",
+			       mbuf_cap == XSK_CAP_MBUF_ZC ?
+			       " for zero-copy" : "");
+		return TEST_SKIP;
 	}
+
+skip_mbuf_check:
 	err = test_spec_set_mtu(test, test->mtu);
 	if (err) {
 		ksft_print_msg("Error, could not set mtu.\n");
@@ -1799,8 +1803,10 @@ static int testapp_validate_traffic(struct test_spec *test)
 	struct ifobject *ifobj_rx = test->ifobj_rx;
 	struct ifobject *ifobj_tx = test->ifobj_tx;
 
-	if ((ifobj_rx->xsk->umem->unaligned_mode && !ifobj_rx->unaligned_supp) ||
-	    (ifobj_tx->xsk->umem->unaligned_mode && !ifobj_tx->unaligned_supp)) {
+	if ((ifobj_rx->xsk->umem->unaligned_mode &&
+	     !ifobj_has_cap(ifobj_rx, XSK_CAP_UNALIGNED)) ||
+	    (ifobj_tx->xsk->umem->unaligned_mode &&
+	     !ifobj_has_cap(ifobj_tx, XSK_CAP_UNALIGNED))) {
 		ksft_print_msg("No huge pages present.\n");
 		return TEST_SKIP;
 	}
@@ -1900,7 +1906,7 @@ int testapp_headroom(struct test_spec *test)
 int testapp_stats_rx_dropped(struct test_spec *test)
 {
 	struct xsk_umem_info *umem = test->ifobj_rx->xsk->umem;
-	u32 umem_tr = test->ifobj_tx->umem_tailroom;
+	u32 umem_tr = xsk_get_cap(test, umem_tailroom);
 
 	if (test->mode == TEST_MODE_ZC) {
 		ksft_print_msg("Can not run RX_DROPPED test for ZC mode\n");
@@ -2162,9 +2168,9 @@ int testapp_too_many_frags(struct test_spec *test)
 	int ret = TEST_FAILURE;
 
 	if (test->mode == TEST_MODE_ZC) {
-		max_frags = test->ifobj_tx->xdp_zc_max_segs;
+		max_frags = xsk_get_cap(test, xdp_zc_max_segs);
 	} else {
-		max_frags = test->ifobj_tx->max_skb_frags;
+		max_frags = xsk_get_cap(test, max_skb_frags);
 		max_frags += 1;
 	}
 
@@ -2224,7 +2230,6 @@ static int xsk_load_xdp_programs(struct ifobject *ifobj)
 	return 0;
 }
 
-/* Simple test */
 static bool hugepages_present(void)
 {
 	size_t mmap_sz = 2 * DEFAULT_UMEM_BUFFERS * XSK_UMEM__DEFAULT_FRAME_SIZE;
@@ -2240,21 +2245,13 @@ static bool hugepages_present(void)
 	return true;
 }
 
-int init_iface(struct ifobject *ifobj, thread_func_t func_ptr)
+static int detect_ifobj_caps(struct ifobject *ifobj)
 {
 	LIBBPF_OPTS(bpf_xdp_query_opts, query_opts);
 	int err;
 
-	ifobj->func_ptr = func_ptr;
-
-	err = xsk_load_xdp_programs(ifobj);
-	if (err) {
-		ksft_print_msg("Error loading XDP program\n");
-		return err;
-	}
-
 	if (hugepages_present())
-		ifobj->unaligned_supp = true;
+		ifobj_set_cap(ifobj, XSK_CAP_UNALIGNED);
 
 	err = bpf_xdp_query(ifobj->ifindex, XDP_FLAGS_DRV_MODE, &query_opts);
 	if (err) {
@@ -2262,19 +2259,34 @@ int init_iface(struct ifobject *ifobj, thread_func_t func_ptr)
 		return err;
 	}
 	if (query_opts.feature_flags & NETDEV_XDP_ACT_RX_SG)
-		ifobj->multi_buff_supp = true;
+		ifobj_set_cap(ifobj, XSK_CAP_MBUF);
 	if (query_opts.feature_flags & NETDEV_XDP_ACT_XSK_ZEROCOPY) {
 		if (query_opts.xdp_zc_max_segs > 1) {
-			ifobj->multi_buff_zc_supp = true;
-			ifobj->xdp_zc_max_segs = query_opts.xdp_zc_max_segs;
+			ifobj_set_cap(ifobj, XSK_CAP_MBUF_ZC);
+			ifobj->caps.xdp_zc_max_segs = query_opts.xdp_zc_max_segs;
 		} else {
-			ifobj->xdp_zc_max_segs = 0;
+			ifobj->caps.xdp_zc_max_segs = 0;
 		}
 	}
 
 	return 0;
 }
 
+int init_iface(struct ifobject *ifobj, thread_func_t func_ptr)
+{
+	int err;
+
+	ifobj->func_ptr = func_ptr;
+
+	err = xsk_load_xdp_programs(ifobj);
+	if (err) {
+		ksft_print_msg("Error loading XDP program\n");
+		return err;
+	}
+
+	return detect_ifobj_caps(ifobj);
+}
+
 int testapp_send_receive(struct test_spec *test)
 {
 	return testapp_validate_traffic(test);
@@ -2364,7 +2376,7 @@ int testapp_hw_sw_min_ring_size(struct test_spec *test)
 {
 	int ret;
 
-	if (!test->ifobj_tx->hw_ring_size_supp) {
+	if (!ifobj_has_cap(test->ifobj_tx, XSK_CAP_HW_RING)) {
 		ksft_print_msg("HW ring sizes not supported.\n");
 		return TEST_SKIP;
 	}
@@ -2391,14 +2403,14 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 	u32 batch_size;
 	int ret;
 
-	if (!test->ifobj_tx->hw_ring_size_supp) {
+	if (!ifobj_has_cap(test->ifobj_tx, XSK_CAP_HW_RING)) {
 		ksft_print_msg("HW ring sizes not supported.\n");
 		return TEST_SKIP;
 	}
 	/* The second step sends batches of min(tx_max_pending, max_descs) - 8
 	 * descriptors.
 	 */
-	if (test->ifobj_tx->ring.tx_max_pending <= 8) {
+	if (xsk_get_cap(test, tx_max_pending) <= 8) {
 		ksft_print_msg("HW TX ring too small.\n");
 		return TEST_SKIP;
 	}
@@ -2423,7 +2435,7 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 	 * sends only while fewer packets than the UMEM size minus a batch are
 	 * in flight, and reserves a whole batch in the TX ring.
 	 */
-	batch_size = min(test->ifobj_tx->ring.tx_max_pending, max_descs) - 8;
+	batch_size = min(xsk_get_cap(test, tx_max_pending), max_descs) - 8;
 	test->ifobj_tx->xsk->batch_size = batch_size;
 	test->ifobj_rx->xsk->batch_size = batch_size;
 	if (pkt_stream_replace(test, max_descs, MIN_PKT_SIZE)) {
@@ -2518,7 +2530,7 @@ int testapp_adjust_tail_grow_mb(struct test_spec *test)
 	grow_size = XSK_UMEM__MAX_FRAME_SIZE -
 		    XSK_UMEM__LARGE_FRAME_SIZE -
 		    XDP_PACKET_HEADROOM -
-		    test->ifobj_tx->umem_tailroom;
+		    xsk_get_cap(test, umem_tailroom);
 	test->mtu = MAX_ETH_JUMBO_SIZE;
 
 	return testapp_adjust_tail(test, grow_size, XSK_UMEM__LARGE_FRAME_SIZE * 2);
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index 410702f89dc9..716ea044797c 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -112,8 +112,22 @@ struct xsk_umem_info {
 	bool unaligned_mode;
 };
 
+#define XSK_CAP_UNALIGNED        (1U << 0)
+#define XSK_CAP_MBUF             (1U << 1)
+#define XSK_CAP_MBUF_ZC          (1U << 2)
+#define XSK_CAP_HW_RING          (1U << 3)
+
+struct xsk_caps {
+	u32 flags;
+	u32 xdp_zc_max_segs;
+	u32 max_skb_frags;
+	u32 umem_tailroom;
+	u32 tx_max_pending;
+};
+
 struct ifobject {
 	char ifname[MAX_INTERFACE_NAME_CHARS];
+	struct xsk_caps caps;
 	struct xsk_socket_info *xsk;
 	struct xsk_socket_info *xsk_arr;
 	thread_func_t func_ptr;
@@ -126,9 +140,6 @@ struct ifobject {
 	int ifindex;
 	int mtu;
 	u32 bind_flags;
-	u32 xdp_zc_max_segs;
-	u32 umem_tailroom;
-	u32 max_skb_frags;
 	bool tx_on;
 	bool rx_on;
 	bool use_poll;
@@ -136,11 +147,20 @@ struct ifobject {
 	bool use_fill_ring;
 	bool release_rx;
 	bool use_metadata;
-	bool unaligned_supp;
-	bool multi_buff_supp;
-	bool multi_buff_zc_supp;
-	bool hw_ring_size_supp;
 };
+
+static inline bool ifobj_has_cap(const struct ifobject *ifobj, u32 cap)
+{
+	return ifobj && (ifobj->caps.flags & cap);
+}
+
+static inline void ifobj_set_cap(struct ifobject *ifobj, u32 cap)
+{
+	ifobj->caps.flags |= cap;
+}
+
+#define xsk_get_cap(test, cap) ((test)->ifobj_tx->caps.cap)
+
 struct ifobject *ifobject_create(void);
 void ifobject_delete(struct ifobject *ifobj);
 int init_iface(struct ifobject *ifobj, thread_func_t func_ptr);
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 7876ad47ed0f..d82224a4fa4b 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -361,15 +361,15 @@ int main(int argc, char **argv)
 		ksft_print_msg("Can't get MAX_SKB_FRAGS from system, using default (17)\n");
 		max_frags = 17;
 	}
-	ifobj_tx->max_skb_frags = max_frags;
-	ifobj_rx->max_skb_frags = max_frags;
+	ifobj_tx->caps.max_skb_frags = max_frags;
+	ifobj_rx->caps.max_skb_frags = max_frags;
 
 	/* 48 bytes is a part of skb_shared_info w/o frags array;
 	 * 16 bytes is sizeof(skb_frag_t)
 	 */
 	umem_tailroom = ALIGN(48 + (max_frags * 16), cache_line_size);
-	ifobj_tx->umem_tailroom = umem_tailroom;
-	ifobj_rx->umem_tailroom = umem_tailroom;
+	ifobj_tx->caps.umem_tailroom = umem_tailroom;
+	ifobj_rx->caps.umem_tailroom = umem_tailroom;
 
 	parse_command_line(ifobj_tx, ifobj_rx, argc, argv);
 
@@ -392,8 +392,10 @@ int main(int argc, char **argv)
 	}
 
 	ret = get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
-	if (!ret)
-		ifobj_tx->hw_ring_size_supp = true;
+	if (!ret) {
+		ifobj_set_cap(ifobj_tx, XSK_CAP_HW_RING);
+		ifobj_tx->caps.tx_max_pending = ifobj_tx->ring.tx_max_pending;
+	}
 
 	if (init_iface(ifobj_rx, worker_testapp_validate_rx) ||
 	    init_iface(ifobj_tx, worker_testapp_validate_tx)) {
-- 
2.43.0

