Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791969;
	b=n54gpu+PUkDBeA94MvUYifVPm+EN0YJzV5fsZaM0OixdgAsrNO1jB+S6N4fqH6y8EsZO
	 Oc4hChx9c2fJhej3oO7ak8eCtGgbmcseENR2ghITVz+h87Fh/E4CIwxrqcT98QBradoWx
	 L8XkRbeGt5a9IbllvBxe2kf0w0RfCNcnb+bMGVeqQkCM2Xrn6oUR3ZDzxQub0uCQ5n8X7
	 QnJg0TFdqKYnffkx5u+xCj33IXRJn0MhjloDROqIcc/g0QcIWa37Cs9U8G3fQU92fADGx
	 3Nv0NA9c1yfdHZls5u0F8ovNA/QfV4nhYpePiyyAjkiNbhoCrHNNRU1+N4GHkCio+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791969;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mOqcvqcABvWYEDtD/XikQeaQUxDj0tveEp5DGVUn2xo=;
	b=aogUW3hwQBdDHBuiqwj6UkU5/MAhEQo3atdRhiGoNlU/Q0tvTN+gNzMF3C/9hA7MgzXd
	 GoeKjw5h5P+NNamJWjx3boMIQcB2AqXj2YfKa/2GQOLYDJE3htT6xzVqoK0EocwnKVBLm
	 6a7H+NlD3Ln1y0JrEsFtPIqDCPF/se17vssyOWVhGVfPnZ7wzjDrZmEJ/0ht25KGw85jV
	 +eXtN2uNcoEz1P6pLf8qFl/tDB/UBRGdK+ZB8V3GWeNucf/sc39C0tKk9mAqkdNo4ezOL
	 aThzUlUzxUcvndfIL+1yOz0WK6uwAUPJ/Zx6bZxLcTQ6SmawvP9IaiI8NYs5PQK/uKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="jH/Oe80Y";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4B606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A4B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jH/Oe80Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791968; x=1827327968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H16LBAyxQ0s37yK6ieZL59ZQzAt/HNlk9g/+VCCpdKc=;
  b=jH/Oe80Yk0BUPdjjZhbaOvlmN7gYmAcPrGAo/UbFi2aZhFqZ00p9zwqI
   5VMrV5/LJ1b9PLVXDcEyUJwlUnSIsz9tBEpCpHwy909czEb9h3IRikHjt
   Cyrga/LBaNb1R3bU+f0dX6SUuTPfPNb8F/KvhTcvg2drOEFzF4QfuAn83
   3FjkfJXpCndD7hlZRHoflCPxTDgwOIi7l0IzohOER+MM9gue0VKbRvU+9
   Xu89UeyZlQAcKMhUzHtnaRiBLscCEVrMT3eL5xsRlTTvcKFBSj1x2O1xM
   bUEp6YktBiaGfA7fhIOrryhY1mwaTC6ry35PWSdd3yv9pOv6JL5iUvnu5
   A==;
X-CSE-ConnectionGUID: gVMvcdoaTL6OQIZ3j+EUnQ==
X-CSE-MsgGUID: 6ICp+4PiRPOK6pw09jrQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666092"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:07 -0800
X-CSE-ConnectionGUID: x4PuX9HaRKK0yip1HpFixg==
X-CSE-MsgGUID: V7/y65hdREKUBYirhm/GVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202772"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:05 -0800
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
Subject: [PATCH v6 net-next 08/15] selftests: xsk: run the RX and TX endpoints in separate processes
Date: Fri, 27 Nov 2026 16:05:20 +0100
Message-Id: <20261127150527.1122049-9-maciej.fijalkowski@intel.com>
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

Run the two endpoints of a test case as separate xskxceiver processes,
so that a later patch can put them on two hosts. Each process binds
only its -i interface, takes its role from -e rx|tx and talks to the
other endpoint over a TCP control channel (-p HOST -P PORT). A shadow
ifobject mirrors the local capabilities for the other side, so the
shared test code keeps working on both.

The pthreads and the barrier go away. The endpoints exchange three
fixed-size messages: READY, a barrier before each step; PROGRESS, the
packets RX consumed, so that TX does not overrun the RX UMEM; and
ABORT, which stops the peer after a failure.

The --listen endpoint listens and reports ksft_ready(), so that the
launcher starts the other one without polling the port. As in other
selftests, the control channel is not authenticated.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 tools/testing/selftests/net/lib/Makefile      |   2 +-
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 203 +++++++-----
 .../testing/selftests/net/lib/xsk/test_xsk.h  |  23 +-
 .../testing/selftests/net/lib/xsk/xsk_peer.c  | 293 ++++++++++++++++++
 .../testing/selftests/net/lib/xsk/xsk_peer.h  |  19 ++
 .../selftests/net/lib/xsk/xskxceiver.c        | 132 ++++++--
 6 files changed, 557 insertions(+), 115 deletions(-)
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.c
 create mode 100644 tools/testing/selftests/net/lib/xsk/xsk_peer.h

diff --git a/tools/testing/selftests/net/lib/Makefile b/tools/testing/selftests/net/lib/Makefile
index 2b77d960d91a..b2f01c4e599b 100644
--- a/tools/testing/selftests/net/lib/Makefile
+++ b/tools/testing/selftests/net/lib/Makefile
@@ -44,7 +44,7 @@ $(OUTPUT)/xskxceiver: $(XSK_SRCS) $(wildcard xsk/*.h) \
 	$(call msg,CC,,$@)
 	$(Q)$(CC) -I$(top_srcdir)/tools/include $(CFLAGS) -I$(OUTPUT) \
 		-I$(SCRATCH_DIR)/include \
-		$(XSK_SRCS) $(BPFOBJ) $(LDLIBS) -lelf -lz -lpthread -o $@
+		$(XSK_SRCS) $(BPFOBJ) $(LDLIBS) -lelf -lz -o $@
 
 # TEST_GEN_FILES lacks xskxceiver when bpftool fails; clean it anyway.
 EXTRA_CLEAN += $(OUTPUT)/xskxceiver
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index aaffa1b04ee4..1ce937fc8bdf 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -2,12 +2,12 @@
 #include <arpa/inet.h>
 #include <bpf/bpf.h>
 #include <errno.h>
+#include <limits.h>
 #include <linux/bitmap.h>
 #include <linux/if_link.h>
 #include <linux/mman.h>
 #include <linux/netdev.h>
 #include <poll.h>
-#include <pthread.h>
 #include <string.h>
 #include <sys/mman.h>
 #include <sys/socket.h>
@@ -15,6 +15,7 @@
 #include <unistd.h>
 
 #include "test_xsk.h"
+#include "xsk_peer.h"
 #include "xsk_xdp_common.h"
 #include "xsk_xdp_progs.skel.h"
 
@@ -38,10 +39,40 @@
 static const u8 g_mac[ETH_ALEN] = {0x55, 0x44, 0x33, 0x22, 0x11, 0x00};
 
 bool opt_verbose;
-pthread_barrier_t barr;
-pthread_mutex_t pacing_mutex = PTHREAD_MUTEX_INITIALIZER;
 
 int pkts_in_flight;
+static struct xsk_peer *ctrl_peer;
+
+void xsk_set_endpoint(struct xsk_peer *peer)
+{
+	ctrl_peer = peer;
+}
+
+static int pacing_rx_progress(u32 pkts)
+{
+	int err = xsk_peer_rx_progress(ctrl_peer, pkts);
+
+	if (err)
+		ksft_print_msg("RX control channel failed: %d (%s)\n", err,
+			       strerror(-err));
+	return err;
+}
+
+static int pacing_tx_sync(void)
+{
+	int acked = xsk_peer_tx_sync(ctrl_peer);
+
+	/* Only forged reports can take pkts_in_flight below INT_MIN. */
+	if (acked > 0 && pkts_in_flight < INT_MIN + acked)
+		acked = -EPROTO;
+	if (acked < 0) {
+		ksft_print_msg("TX control channel failed: %d (%s)\n", acked,
+			       strerror(-acked));
+		return acked;
+	}
+	pkts_in_flight -= acked;
+	return 0;
+}
 
 /* The payload is a word consisting of a packet sequence number in the upper
  * 16-bits and a intra packet data sequence number in the lower 16 bits. So the 3rd packet's
@@ -222,7 +253,6 @@ static void __test_spec_init(struct test_spec *test, struct ifobject *ifobj_tx,
 	test->current_step = 0;
 	test->total_steps = 1;
 	test->nb_sockets = 1;
-	test->fail = false;
 	test->adjust_tail = false;
 	test->adjust_tail_support = false;
 	test->mtu = MAX_ETH_PKT_SIZE;
@@ -289,26 +319,31 @@ static void test_spec_set_xdp_prog(struct test_spec *test, struct bpf_program *x
 	test->xskmap_tx = xskmap_tx;
 }
 
-static int test_spec_set_mtu(struct test_spec *test, int mtu)
+static int test_spec_set_mtu_ifobj(struct ifobject *ifobj, int mtu)
 {
 	int err;
 
-	if (test->ifobj_rx->mtu != mtu) {
-		err = xsk_set_mtu(test->ifobj_rx->ifindex, mtu);
+	if (ifobj_is_local(ifobj) && ifobj->mtu != mtu) {
+		err = xsk_set_mtu(ifobj->ifindex, mtu);
 		if (err)
 			return err;
-		test->ifobj_rx->mtu = mtu;
-	}
-	if (test->ifobj_tx->mtu != mtu) {
-		err = xsk_set_mtu(test->ifobj_tx->ifindex, mtu);
-		if (err)
-			return err;
-		test->ifobj_tx->mtu = mtu;
 	}
 
+	ifobj->mtu = mtu;
 	return 0;
 }
 
+static int test_spec_set_mtu(struct test_spec *test, int mtu)
+{
+	int err;
+
+	err = test_spec_set_mtu_ifobj(test->ifobj_rx, mtu);
+	if (err)
+		return err;
+
+	return test_spec_set_mtu_ifobj(test->ifobj_tx, mtu);
+}
+
 void pkt_stream_reset(struct pkt_stream *pkt_stream)
 {
 	if (pkt_stream) {
@@ -939,6 +974,9 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 	fds.fd = xsk_socket__fd(xsk->xsk);
 	fds.events = POLLIN;
 
+	if (pacing_rx_progress(0))
+		return TEST_FAILURE;
+
 	ret = kick_rx(xsk);
 	if (ret)
 		return TEST_FAILURE;
@@ -1038,9 +1076,8 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 	if (ifobj->release_rx)
 		xsk_ring_cons__release(&xsk->rx, frags_processed);
 
-	pthread_mutex_lock(&pacing_mutex);
-	pkts_in_flight -= pkts_sent;
-	pthread_mutex_unlock(&pacing_mutex);
+	if (pacing_rx_progress(pkts_sent))
+		return TEST_FAILURE;
 	pkts_sent = 0;
 
 	return TEST_CONTINUE;
@@ -1116,9 +1153,18 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 	int ret;
 
 	buffer_len = pkt_get_buffer_len(umem, pkt_stream->max_pkt_len);
+	if (pacing_tx_sync())
+		return TEST_FAILURE;
+
 	/* pkts_in_flight might be negative if many invalid packets are sent */
 	if (pkts_in_flight >= (int)((umem_size(umem) - xsk->batch_size * buffer_len) /
 	    buffer_len) && !test_timeout) {
+		/* Only RX progress reports can lower pkts_in_flight. */
+		if (xsk_peer_closed(ctrl_peer)) {
+			ksft_print_msg("ERROR: [%s] RX exited with %d packets in flight\n",
+				       __func__, pkts_in_flight);
+			return TEST_FAILURE;
+		}
 		ret = kick_tx(xsk);
 		if (ret)
 			return TEST_FAILURE;
@@ -1200,9 +1246,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 		valid_frags += nb_frags;
 	}
 
-	pthread_mutex_lock(&pacing_mutex);
 	pkts_in_flight += valid_pkts;
-	pthread_mutex_unlock(&pacing_mutex);
 
 	xsk_ring_prod__submit(&xsk->tx, i);
 	xsk->outstanding_tx += valid_frags;
@@ -1279,9 +1323,6 @@ static int send_pkts(struct test_spec *test, struct ifobject *ifobject)
 			if (ret != TEST_CONTINUE)
 				return ret;
 
-			if (test->fail)
-				return TEST_FAILURE;
-
 			if (!test->poll_tmout) {
 				ret = wait_for_tx_completion(&ifobject->xsk_arr[i]);
 				if (ret)
@@ -1600,36 +1641,57 @@ static int testapp_validate_rx_endpoint(struct test_spec *test,
 	return err;
 }
 
-void *worker_testapp_validate_tx(void *arg)
+static int sync_endpoints(struct test_spec *test)
+{
+	int err = xsk_peer_ready(ctrl_peer);
+
+	if (err)
+		ksft_print_msg("Endpoint synchronization failed at step %u: %d (%s)\n",
+			       test->current_step, err, strerror(-err));
+	return err;
+}
+
+int worker_testapp_validate_tx(struct test_spec *test)
 {
-	struct test_spec *test = (struct test_spec *)arg;
 	int err;
 
-	err = testapp_validate_tx_endpoint(test, test->ifobj_tx);
+	err = sync_endpoints(test);
 	if (err)
-		test->fail = true;
+		return err;
 
-	pthread_exit(NULL);
+	err = testapp_validate_tx_endpoint(test, test->ifobj_tx);
+	if (err) {
+		ksft_print_msg("TX endpoint traffic failed at step %u: %d\n",
+			       test->current_step, err);
+		xsk_peer_abort(ctrl_peer);
+	}
+	return err;
 }
 
-void *worker_testapp_validate_rx(void *arg)
+int worker_testapp_validate_rx(struct test_spec *test)
 {
-	struct test_spec *test = (struct test_spec *)arg;
 	struct ifobject *ifobject = test->ifobj_rx;
 	int err;
 
 	err = testapp_prepare_rx_endpoint(test, ifobject);
+	if (err) {
+		ksft_print_msg("RX endpoint setup failed at step %u: %d\n",
+			       test->current_step, err);
+		xsk_peer_abort(ctrl_peer);
+		return err;
+	}
 
-	if (test->use_barrier)
-		pthread_barrier_wait(&barr);
-
-	/* We leave only now in case of error to avoid getting stuck in the barrier */
-	if (!err)
-		err = testapp_validate_rx_endpoint(test, ifobject);
+	err = sync_endpoints(test);
 	if (err)
-		test->fail = true;
+		return err;
 
-	pthread_exit(NULL);
+	err = testapp_validate_rx_endpoint(test, ifobject);
+	if (err) {
+		ksft_print_msg("RX endpoint traffic failed at step %u: %d\n",
+			       test->current_step, err);
+		xsk_peer_abort(ctrl_peer);
+	}
+	return err;
 }
 
 static void testapp_clean_xsk_umem(struct ifobject *ifobj)
@@ -1688,13 +1750,13 @@ static int xsk_attach_xdp_progs(struct test_spec *test, struct ifobject *ifobj_r
 {
 	int err = 0;
 
-	if (xdp_prog_changed_rx(test)) {
+	if (ifobj_is_local(ifobj_rx) && xdp_prog_changed_rx(test)) {
 		err = xsk_reattach_xdp(ifobj_rx, test->xdp_prog_rx, test->xskmap_rx, test->mode);
 		if (err)
 			return err;
 	}
 
-	if (!ifobj_tx)
+	if (!ifobj_tx || !ifobj_is_local(ifobj_tx))
 		return 0;
 
 	if (xdp_prog_changed_tx(test))
@@ -1707,7 +1769,7 @@ static void clean_sockets(struct test_spec *test, struct ifobject *ifobj)
 {
 	u32 i;
 
-	if (!ifobj || !test)
+	if (!ifobj || !test || !ifobj_is_local(ifobj))
 		return;
 
 	for (i = 0; i < test->nb_sockets; i++)
@@ -1719,15 +1781,15 @@ static void clean_umem(struct test_spec *test, struct ifobject *ifobj1, struct i
 	if (!ifobj1)
 		return;
 
-	testapp_clean_xsk_umem(ifobj1);
-	if (ifobj2)
+	if (ifobj_is_local(ifobj1))
+		testapp_clean_xsk_umem(ifobj1);
+	if (ifobj2 && ifobj_is_local(ifobj2))
 		testapp_clean_xsk_umem(ifobj2);
 }
 
 static int __testapp_validate_traffic(struct test_spec *test, struct ifobject *ifobj1,
 				      struct ifobject *ifobj2)
 {
-	pthread_t t0, t1;
 	u32 mbuf_cap;
 	int err;
 
@@ -1758,51 +1820,27 @@ static int __testapp_validate_traffic(struct test_spec *test, struct ifobject *i
 			       err, strerror(-err));
 		return TEST_FAILURE;
 	}
-	test->use_barrier = !!ifobj2;
-
-	if (test->use_barrier) {
-		if (pthread_barrier_init(&barr, NULL, 2))
-			return TEST_FAILURE;
 
+	if (ifobj2)
 		pkt_stream_reset(ifobj2->xsk->pkt_stream);
-	}
-
 	test->current_step++;
 	pkt_stream_reset(ifobj1->xsk->pkt_stream);
 	pkts_in_flight = 0;
 
-	/*Spawn RX thread */
-	pthread_create(&t0, NULL, ifobj1->func_ptr, test);
-
-	if (test->use_barrier) {
-		pthread_barrier_wait(&barr);
-		if (pthread_barrier_destroy(&barr)) {
-			test->use_barrier = false;
-			pthread_join(t0, NULL);
-			clean_sockets(test, ifobj1);
-			clean_umem(test, ifobj1, NULL);
-			return TEST_FAILURE;
-		}
-	}
-
-	if (ifobj2) {
-		/*Spawn TX thread */
-		pthread_create(&t1, NULL, ifobj2->func_ptr, test);
-		pthread_join(t1, NULL);
-	}
-
-	pthread_join(t0, NULL);
-
-	if (test->total_steps == test->current_step || test->fail) {
+	/* In a one-sided step, the idle endpoint only keeps in step. */
+	if (ifobj_is_local(ifobj1))
+		err = ifobj1->func_ptr(test);
+	else if (ifobj2 && ifobj_is_local(ifobj2))
+		err = ifobj2->func_ptr(test);
+	else
+		err = sync_endpoints(test);
+	if (test->total_steps == test->current_step || err) {
 		clean_sockets(test, ifobj1);
 		clean_sockets(test, ifobj2);
 		clean_umem(test, ifobj1, ifobj2);
 	}
 
-	if (test->fail)
-		return TEST_FAILURE;
-
-	return TEST_PASS;
+	return err ? TEST_FAILURE : TEST_PASS;
 }
 
 static int testapp_validate_traffic(struct test_spec *test)
@@ -1841,7 +1879,7 @@ int testapp_teardown(struct test_spec *test)
 
 static void swap_directions(struct ifobject **ifobj1, struct ifobject **ifobj2)
 {
-	thread_func_t tmp_func_ptr = (*ifobj1)->func_ptr;
+	test_func_t tmp_func_ptr = (*ifobj1)->func_ptr;
 	struct ifobject *tmp_ifobj = (*ifobj1);
 
 	(*ifobj1)->func_ptr = (*ifobj2)->func_ptr;
@@ -1880,6 +1918,9 @@ static int swap_xsk_resources(struct test_spec *test)
 	test->ifobj_tx->xsk = &test->ifobj_tx->xsk_arr[1];
 	test->ifobj_rx->xsk = &test->ifobj_rx->xsk_arr[1];
 
+	if (!ifobj_is_local(test->ifobj_rx))
+		return TEST_PASS;
+
 	ret = xsk_update_xskmap(test->ifobj_rx->xskmap, test->ifobj_rx->xsk->xsk, 0);
 	if (ret)
 		return TEST_FAILURE;
@@ -2228,7 +2269,7 @@ int testapp_too_many_frags(struct test_spec *test)
 	return ret;
 }
 
-static int xsk_load_xdp_programs(struct ifobject *ifobj)
+int xsk_load_xdp_programs(struct ifobject *ifobj)
 {
 	ifobj->xdp_progs = xsk_xdp_progs__open_and_load();
 	if (libbpf_get_error(ifobj->xdp_progs))
@@ -2284,12 +2325,10 @@ static int detect_ifobj_caps(struct ifobject *ifobj)
 	return 0;
 }
 
-int init_iface(struct ifobject *ifobj, thread_func_t func_ptr)
+int init_iface(struct ifobject *ifobj)
 {
 	int err;
 
-	ifobj->func_ptr = func_ptr;
-
 	err = xsk_load_xdp_programs(ifobj);
 	if (err) {
 		ksft_print_msg("Error loading XDP program\n");
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index 8503ef055d37..f1fafae2d140 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -77,9 +77,13 @@ enum test_mode {
 struct ifobject;
 struct test_spec;
 typedef int (*validation_func_t)(struct ifobject *ifobj);
-typedef void *(*thread_func_t)(void *arg);
 typedef int (*test_func_t)(struct test_spec *test);
 
+struct xsk_peer;
+
+/* The control channel to the other endpoint. */
+void xsk_set_endpoint(struct xsk_peer *peer);
+
 struct xsk_socket_info {
 	struct xsk_ring_cons rx;
 	struct xsk_ring_prod tx;
@@ -132,7 +136,7 @@ struct ifobject {
 	struct xsk_caps caps;
 	struct xsk_socket_info *xsk;
 	struct xsk_socket_info *xsk_arr;
-	thread_func_t func_ptr;
+	test_func_t func_ptr;
 	validation_func_t validation_func;
 	struct xsk_xdp_progs *xdp_progs;
 	struct bpf_map *xskmap;
@@ -161,11 +165,18 @@ static inline void ifobj_set_cap(struct ifobject *ifobj, u32 cap)
 	ifobj->caps.flags |= cap;
 }
 
+/* The shadow of the peer's ifobject is never bound to an interface. */
+static inline bool ifobj_is_local(const struct ifobject *ifobj)
+{
+	return ifobj->ifindex;
+}
+
 #define xsk_get_cap(test, cap) ((test)->ifobj_tx->caps.cap)
 
 struct ifobject *ifobject_create(void);
 void ifobject_delete(struct ifobject *ifobj);
-int init_iface(struct ifobject *ifobj, thread_func_t func_ptr);
+int init_iface(struct ifobject *ifobj);
+int xsk_load_xdp_programs(struct ifobject *ifobj);
 u32 mode_to_xdp_flags(enum test_mode mode);
 
 int xsk_configure_umem(struct ifobject *ifobj, struct xsk_umem_info *umem, void *buffer, u64 size);
@@ -215,11 +226,9 @@ struct test_spec {
 	u16 total_steps;
 	u16 current_step;
 	u16 nb_sockets;
-	bool fail;
 	bool adjust_tail;
 	bool adjust_tail_support;
 	bool poll_tmout;
-	bool use_barrier;
 	enum test_mode mode;
 	char name[MAX_TEST_NAME_SIZE];
 };
@@ -280,8 +289,8 @@ int testapp_xdp_metadata_mb(struct test_spec *test);
 int testapp_xdp_prog_cleanup(struct test_spec *test);
 int testapp_xdp_shared_umem(struct test_spec *test);
 
-void *worker_testapp_validate_rx(void *arg);
-void *worker_testapp_validate_tx(void *arg);
+int worker_testapp_validate_rx(struct test_spec *test);
+int worker_testapp_validate_tx(struct test_spec *test);
 
 static const struct test_spec tests[] = {
 	{.name = "SEND_RECEIVE", .test_func = testapp_send_receive},
diff --git a/tools/testing/selftests/net/lib/xsk/xsk_peer.c b/tools/testing/selftests/net/lib/xsk/xsk_peer.c
new file mode 100644
index 000000000000..3ff9d82aaf49
--- /dev/null
+++ b/tools/testing/selftests/net/lib/xsk/xsk_peer.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <arpa/inet.h>
+#include <errno.h>
+#include <limits.h>
+#include <netdb.h>
+#include <netinet/tcp.h>
+#include <poll.h>
+#include <stdlib.h>
+#include <sys/socket.h>
+#include <unistd.h>
+
+#include "../ksft.h"
+#include "xsk_peer.h"
+
+#define XSK_PEER_MAGIC			0x58534b50
+#define XSK_PEER_ACCEPT_TMOUT_MS	10000
+
+/*
+ * One case per connection; the launcher owns the verdict. As with the control
+ * channels of other selftests, the test hosts are trusted: nothing
+ * authenticates the peer.
+ */
+enum xsk_peer_msg_type {
+	XSK_PEER_READY = 1,
+	XSK_PEER_PROGRESS,
+	XSK_PEER_ABORT,
+};
+
+struct xsk_peer_msg {
+	u32 magic;
+	u32 type;
+	u32 pkts;
+};
+
+struct xsk_peer {
+	int fd;
+	u32 acked;
+	bool ready_seen;
+	bool closed;
+};
+
+static int io_full(int fd, void *buf, size_t len, bool write_op)
+{
+	size_t done = 0;
+	ssize_t ret;
+
+	while (done < len) {
+		if (write_op)
+			ret = send(fd, (char *)buf + done, len - done, MSG_NOSIGNAL);
+		else
+			ret = read(fd, (char *)buf + done, len - done);
+		if (ret < 0 && errno == EINTR)
+			continue;
+		if (ret < 0)
+			return -errno;
+		if (!ret)
+			return -EPIPE;
+		done += ret;
+	}
+	return 0;
+}
+
+/*
+ * Past its last barrier the peer may exit at any time, and it resets the
+ * connection if our progress reports are still unread.
+ */
+static bool peer_gone(int err)
+{
+	return err == -EPIPE || err == -ECONNRESET;
+}
+
+static int peer_send(struct xsk_peer *peer, u32 type, u32 pkts)
+{
+	struct xsk_peer_msg msg = {
+		.magic = htonl(XSK_PEER_MAGIC),
+		.type = htonl(type),
+		.pkts = htonl(pkts),
+	};
+
+	return io_full(peer->fd, &msg, sizeof(msg), true);
+}
+
+static int peer_recv_one(struct xsk_peer *peer)
+{
+	struct xsk_peer_msg msg;
+	u32 pkts;
+	int err;
+
+	err = io_full(peer->fd, &msg, sizeof(msg), false);
+	if (peer_gone(err))
+		peer->closed = true;
+	if (err)
+		return err;
+	if (ntohl(msg.magic) != XSK_PEER_MAGIC)
+		return -EPROTO;
+
+	switch (ntohl(msg.type)) {
+	case XSK_PEER_READY:
+		/* The peer waits for our READY, so it is at most one step ahead. */
+		if (peer->ready_seen)
+			return -EPROTO;
+		peer->ready_seen = true;
+		return 0;
+	case XSK_PEER_PROGRESS:
+		/* xsk_peer_tx_sync() returns the sum as an int. */
+		pkts = ntohl(msg.pkts);
+		if (pkts > INT_MAX - peer->acked)
+			return -EPROTO;
+		peer->acked += pkts;
+		return 0;
+	case XSK_PEER_ABORT:
+		return -ECANCELED;
+	default:
+		return -EPROTO;
+	}
+}
+
+/*
+ * Consume what the peer has sent so far without blocking. A closed connection
+ * is not an error here, see peer_gone(); xsk_peer_closed() reports it.
+ */
+static int peer_drain(struct xsk_peer *peer)
+{
+	struct pollfd pfd = { .fd = peer->fd, .events = POLLIN };
+	int ret;
+
+	while (!peer->closed) {
+		ret = poll(&pfd, 1, 0);
+		if (ret < 0 && errno == EINTR)
+			continue;
+		if (ret < 0)
+			return -errno;
+		if (!ret)
+			break;
+		ret = peer_recv_one(peer);
+		if (ret && !peer->closed)
+			return ret;
+	}
+	return 0;
+}
+
+/* Return once both endpoints are set up for the next step. */
+int xsk_peer_ready(struct xsk_peer *peer)
+{
+	int err;
+
+	err = peer_send(peer, XSK_PEER_READY, 0);
+	while (!err && !peer->ready_seen)
+		err = peer_recv_one(peer);
+	if (err)
+		return err;
+
+	/* TCP ordering puts all progress of the previous step before READY. */
+	peer->ready_seen = false;
+	peer->acked = 0;
+	return 0;
+}
+
+void xsk_peer_abort(struct xsk_peer *peer)
+{
+	if (peer && !peer->closed)
+		peer_send(peer, XSK_PEER_ABORT, 0);
+}
+
+int xsk_peer_rx_progress(struct xsk_peer *peer, u32 pkts)
+{
+	int err;
+
+	if (pkts && !peer->closed) {
+		err = peer_send(peer, XSK_PEER_PROGRESS, pkts);
+		/*
+		 * Leave closed to peer_drain(), which first reads what the
+		 * peer sent before it went away, such as an ABORT.
+		 */
+		if (err && !peer_gone(err))
+			return err;
+	}
+	return peer_drain(peer);
+}
+
+/* Return the packets RX reported consumed since the last call, or -errno. */
+int xsk_peer_tx_sync(struct xsk_peer *peer)
+{
+	int err = peer_drain(peer);
+	u32 acked = peer->acked;
+
+	if (err)
+		return err;
+	peer->acked = 0;
+	return acked;
+}
+
+bool xsk_peer_closed(struct xsk_peer *peer)
+{
+	return peer->closed;
+}
+
+static int accept_tmout(int lfd)
+{
+	struct pollfd pfd = { .fd = lfd, .events = POLLIN };
+	int ret;
+
+	do {
+		ret = poll(&pfd, 1, XSK_PEER_ACCEPT_TMOUT_MS);
+	} while (ret < 0 && errno == EINTR);
+	if (!ret)
+		errno = ETIMEDOUT;
+	return ret > 0 ? accept(lfd, NULL, NULL) : -1;
+}
+
+/*
+ * The listener tells the launcher with ksft_ready() once it listens, and the
+ * launcher starts the connector only then, so connect() needs no retry.
+ * accept() is bounded in case the connector exits before it gets that far.
+ */
+static int peer_open_tcp(const char *host, const char *port, bool listen_side)
+{
+	struct addrinfo hints = {
+		.ai_family = AF_UNSPEC,
+		.ai_socktype = SOCK_STREAM,
+		.ai_flags = AI_NUMERICSERV,
+	};
+	int fd = -1, lfd, saved = ECONNREFUSED, one = 1, err;
+	struct addrinfo *res, *ai;
+
+	err = getaddrinfo(host, port, &hints, &res);
+	if (err)
+		return -EINVAL;
+
+	if (!listen_side)
+		goto conn;
+
+	for (ai = res; ai; ai = ai->ai_next) {
+		lfd = socket(ai->ai_family, ai->ai_socktype, ai->ai_protocol);
+		if (lfd < 0)
+			continue;
+		setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
+		if (!bind(lfd, ai->ai_addr, ai->ai_addrlen) && !listen(lfd, 1)) {
+			ksft_ready();
+			fd = accept_tmout(lfd);
+			saved = errno;
+			close(lfd);
+			break;
+		}
+		saved = errno;
+		close(lfd);
+	}
+	freeaddrinfo(res);
+	return fd >= 0 ? fd : -saved;
+
+conn:
+	for (ai = res; ai; ai = ai->ai_next) {
+		fd = socket(ai->ai_family, ai->ai_socktype, ai->ai_protocol);
+		if (fd < 0)
+			continue;
+		if (!connect(fd, ai->ai_addr, ai->ai_addrlen))
+			break;
+		saved = errno;
+		close(fd);
+		fd = -1;
+	}
+	freeaddrinfo(res);
+	return fd >= 0 ? fd : -saved;
+}
+
+struct xsk_peer *xsk_peer_open(const char *host, const char *port,
+			       bool listen_side)
+{
+	int fd = peer_open_tcp(host, port, listen_side);
+	struct xsk_peer *peer;
+	int one = 1;
+
+	if (fd < 0) {
+		errno = -fd;
+		return NULL;
+	}
+	peer = calloc(1, sizeof(*peer));
+	if (!peer) {
+		close(fd);
+		return NULL;
+	}
+	peer->fd = fd;
+	setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, &one, sizeof(one));
+	return peer;
+}
+
+void xsk_peer_close(struct xsk_peer *peer)
+{
+	if (peer) {
+		close(peer->fd);
+		free(peer);
+	}
+}
diff --git a/tools/testing/selftests/net/lib/xsk/xsk_peer.h b/tools/testing/selftests/net/lib/xsk/xsk_peer.h
new file mode 100644
index 000000000000..da4462192994
--- /dev/null
+++ b/tools/testing/selftests/net/lib/xsk/xsk_peer.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XSK_PEER_H_
+#define XSK_PEER_H_
+
+#include <linux/types.h>
+
+struct xsk_peer;
+
+struct xsk_peer *xsk_peer_open(const char *host, const char *port,
+			       bool listen_side);
+void xsk_peer_close(struct xsk_peer *peer);
+
+int xsk_peer_ready(struct xsk_peer *peer);
+void xsk_peer_abort(struct xsk_peer *peer);
+int xsk_peer_rx_progress(struct xsk_peer *peer, u32 pkts);
+int xsk_peer_tx_sync(struct xsk_peer *peer);
+bool xsk_peer_closed(struct xsk_peer *peer);
+
+#endif /* XSK_PEER_H_ */
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 42fb3149ca6b..7f6ef07e5bf5 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -6,9 +6,9 @@
  * Linux kernel samples/bpf/xdpsock* and modified
  * for use.
  *
- * This test program contains two threads, each thread is single socket with
- * a unique UMEM. It validates in-order packet delivery and packet content
- * by sending packets to each other.
+ * Each instance of this test program runs one endpoint, Tx or Rx, with a
+ * single socket and a unique UMEM. Two instances validate in-order packet
+ * delivery and packet content by sending packets to each other.
  *
  * Tests Information:
  * ------------------
@@ -54,12 +54,15 @@
  *
  * Flow:
  * -----
- * - Single process spawns two threads: Tx and Rx
- * - Each of these two threads attach to a veth interface
- * - Each thread creates one AF_XDP socket connected to a unique umem for each
+ * - Two processes run the test: Tx and Rx
+ * - Each of these two processes attach to a veth interface
+ * - Each process creates one AF_XDP socket connected to a unique umem for each
  *   veth interface
- * - Tx thread Transmits a number of packets from veth<xxxx> to veth<yyyy>
- * - Rx thread verifies if all packets were received and delivered in-order,
+ * - One process listens on a TCP control port (--listen), the other one
+ *   connects to it and the two synchronize each test step over that
+ *   connection
+ * - Tx process Transmits a number of packets from veth<xxxx> to veth<yyyy>
+ * - Rx process verifies if all packets were received and delivered in-order,
  *   and have the right content
  */
 
@@ -84,6 +87,7 @@
 #include <sys/types.h>
 
 #include "test_xsk.h"
+#include "xsk_peer.h"
 #include "xsk_xdp_progs.skel.h"
 #include "xsk.h"
 #include "xskxceiver.h"
@@ -92,8 +96,23 @@
 #include "kselftest.h"
 #include "xsk_xdp_common.h"
 
+enum xsk_endpoint_role {
+	XSK_ENDPOINT_NONE,
+	XSK_ENDPOINT_RX,
+	XSK_ENDPOINT_TX,
+};
+
 static enum test_mode opt_mode = TEST_MODE_ALL;
 static u32 opt_run_test = RUN_ALL_TESTS;
+static enum xsk_endpoint_role opt_endpoint_role = XSK_ENDPOINT_NONE;
+static bool opt_listen;
+static const char *opt_peer_host;
+static const char *opt_peer_port;
+static const char *opt_ifname;
+
+enum {
+	OPT_LISTEN = 256,
+};
 
 static void __exit_with_error(int error, const char *file, const char *func, int line)
 {
@@ -154,6 +173,10 @@ static struct option long_options[] = {
 	{"mode", required_argument, 0, 'm'},
 	{"list", no_argument, 0, 'l'},
 	{"test", required_argument, 0, 't'},
+	{"endpoint", required_argument, 0, 'e'},
+	{"peer", required_argument, 0, 'p'},
+	{"peer-port", required_argument, 0, 'P'},
+	{"listen", no_argument, 0, OPT_LISTEN},
 	{"help", no_argument, 0, 'h'},
 	{0, 0, 0, 0}
 };
@@ -161,7 +184,7 @@ static struct option long_options[] = {
 static void print_usage(char **argv)
 {
 	const char *str =
-		"  Usage: %s -i TX_IFACE -i RX_IFACE -m MODE -t TEST [OPTIONS]\n"
+		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT [OPTIONS]\n"
 		"  Options:\n"
 		"  -i, --interface      Use interface\n"
 		"  -v, --verbose        Verbose output\n"
@@ -169,16 +192,19 @@ static void print_usage(char **argv)
 		"  -m, --mode           Mode to run: skb, drv or zc\n"
 		"  -l, --list           List all available tests\n"
 		"  -t, --test           Test case to run, a number from -l\n"
+		"  -e, --endpoint       Role of this endpoint: rx or tx\n"
+		"  -p, --peer           Control host: IPv4/IPv6 address or hostname\n"
+		"  -P, --peer-port      Control TCP port\n"
+		"      --listen         Listen on the control port instead of connecting\n"
 		"  -h, --help           Display this help and exit\n";
 
 	ksft_print_msg(str, basename(argv[0]));
 	ksft_exit_xfail();
 }
 
-static void bind_iface(struct ifobject *ifobj, const char *ifname, thread_func_t func,
-		       char **argv)
+static void bind_iface(struct ifobject *ifobj, const char *ifname, char **argv)
 {
-	size_t len = ifname ? strlen(ifname) : 0;
+	size_t len = strlen(ifname);
 
 	if (!len || len >= sizeof(ifobj->ifname))
 		print_usage(argv);
@@ -190,7 +216,7 @@ static void bind_iface(struct ifobject *ifobj, const char *ifname, thread_func_t
 		ksft_exit_fail();
 	}
 
-	if (init_iface(ifobj, func)) {
+	if (init_iface(ifobj)) {
 		ksft_print_msg("Error: cannot initialize interface %s\n", ifobj->ifname);
 		ksft_exit_fail();
 	}
@@ -208,23 +234,18 @@ static void print_tests(void)
 static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj_rx, int argc,
 			       char **argv)
 {
-	const char *ifname[2] = {};
-	u32 interface_nb = 0;
 	int option_index, c;
 
 	opterr = 0;
 
 	for (;;) {
-		c = getopt_long(argc, argv, "i:vbm:lt:", long_options, &option_index);
+		c = getopt_long(argc, argv, "i:vbm:lt:e:p:P:", long_options, &option_index);
 		if (c == -1)
 			break;
 
 		switch (c) {
 		case 'i':
-			if (interface_nb >= ARRAY_SIZE(ifname))
-				break;
-
-			ifname[interface_nb++] = optarg;
+			opt_ifname = optarg;
 			break;
 		case 'v':
 			opt_verbose = true;
@@ -253,17 +274,33 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 			if (errno)
 				print_usage(argv);
 			break;
+		case 'e':
+			if (!strcmp(optarg, "rx"))
+				opt_endpoint_role = XSK_ENDPOINT_RX;
+			else if (!strcmp(optarg, "tx"))
+				opt_endpoint_role = XSK_ENDPOINT_TX;
+			else
+				print_usage(argv);
+			break;
+		case 'p':
+			opt_peer_host = optarg;
+			break;
+		case 'P':
+			opt_peer_port = optarg;
+			break;
+		case OPT_LISTEN:
+			opt_listen = true;
+			break;
 		case 'h':
 		default:
 			print_usage(argv);
 		}
 	}
 
-	if (opt_run_test == RUN_ALL_TESTS || opt_mode == TEST_MODE_ALL)
+	if (!opt_ifname || opt_endpoint_role == XSK_ENDPOINT_NONE || !opt_peer_host ||
+	    !*opt_peer_host || !opt_peer_port || opt_run_test == RUN_ALL_TESTS ||
+	    opt_mode == TEST_MODE_ALL)
 		print_usage(argv);
-
-	bind_iface(ifobj_tx, ifname[0], worker_testapp_validate_tx, argv);
-	bind_iface(ifobj_rx, ifname[1], worker_testapp_validate_rx, argv);
 }
 
 static void xsk_unload_xdp_programs(struct ifobject *ifobj)
@@ -349,17 +386,46 @@ static bool mode_supported(enum test_mode mode, u32 caps)
 
 static void cleanup_iface(struct ifobject *ifobj)
 {
+	/* A peer shadow has a skeleton but no bound interface. */
+	if (!ifobj_is_local(ifobj))
+		goto unload;
+
 	if (ifobj->xdp_prog)
 		xsk_detach_xdp_program(ifobj->ifindex,
 				       mode_to_xdp_flags(ifobj->mode));
+unload:
 	xsk_unload_xdp_programs(ifobj);
 }
 
+/* Connect the two endpoints without negotiating the remote NIC's capabilities. */
+static int setup_peer(struct ifobject *local, struct ifobject *shadow,
+		      struct xsk_peer **peer)
+{
+	/* Once BIDIRECTIONAL swaps the directions, the local side attaches the
+	 * shadow's programs, so the shadow needs a skeleton of its own.
+	 */
+	if (xsk_load_xdp_programs(shadow))
+		return TEST_FAILURE;
+
+	*peer = xsk_peer_open(opt_peer_host, opt_peer_port, opt_listen);
+	if (!*peer) {
+		ksft_print_msg("Failed to connect XSK peer: %s\n", strerror(errno));
+		return TEST_FAILURE;
+	}
+
+	shadow->caps = local->caps;
+	xsk_set_endpoint(*peer);
+	return TEST_PASS;
+}
+
 int main(int argc, char **argv)
 {
 	u32 cache_line_size, max_frags, umem_tailroom;
 	const size_t total_tests = ARRAY_SIZE(tests);
 	struct ifobject *ifobj_tx, *ifobj_rx;
+	struct ifobject *shadow_ifobj;
+	struct ifobject *local_ifobj;
+	struct xsk_peer *peer = NULL;
 	struct test_spec test = {};
 	int ret = TEST_FAILURE;
 	u32 caps;
@@ -406,12 +472,26 @@ int main(int argc, char **argv)
 		ksft_exit_xfail();
 	}
 
+	/* swap_directions() swaps the workers, so the shadow needs one too. */
+	ifobj_tx->func_ptr = worker_testapp_validate_tx;
+	ifobj_rx->func_ptr = worker_testapp_validate_rx;
+	if (opt_endpoint_role == XSK_ENDPOINT_TX) {
+		local_ifobj = ifobj_tx;
+		shadow_ifobj = ifobj_rx;
+	} else {
+		local_ifobj = ifobj_rx;
+		shadow_ifobj = ifobj_tx;
+	}
+	bind_iface(local_ifobj, opt_ifname, argv);
+	caps = detect_mode_caps(local_ifobj);
+
 	test.tx_pkt_stream_default = pkt_stream_generate(DEFAULT_PKT_CNT, MIN_PKT_SIZE);
 	test.rx_pkt_stream_default = pkt_stream_generate(DEFAULT_PKT_CNT, MIN_PKT_SIZE);
 	if (!test.tx_pkt_stream_default || !test.rx_pkt_stream_default)
 		goto out;
 
-	caps = detect_mode_caps(ifobj_tx);
+	if (setup_peer(local_ifobj, shadow_ifobj, &peer))
+		goto out;
 
 	if (!mode_supported(opt_mode, caps)) {
 		if (opt_mode == TEST_MODE_DRV)
@@ -427,8 +507,10 @@ int main(int argc, char **argv)
 	ret = run_pkt_test(&test);
 
 out:
+	xsk_set_endpoint(NULL);
 	cleanup_iface(ifobj_tx);
 	cleanup_iface(ifobj_rx);
+	xsk_peer_close(peer);
 	pkt_stream_delete(test.tx_pkt_stream_default);
 	pkt_stream_delete(test.rx_pkt_stream_default);
 	ifobject_delete(ifobj_tx);
-- 
2.43.0

