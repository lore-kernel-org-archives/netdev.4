Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106822;
	b=GeEF9xaO1tw0vkBvv8EWvN1SAfgi3Tgamq3+B25XyP9LU4kalp3EY6KirZ0ZX3Baphcq
	 Fwvrl8YO6pOJkMWFhofJvtI4y2X4pvhP/liYW5DwhqpB4pFB1Tig25w4sZhFQ5QpvR562
	 gDV4KZJYfTRpw2bg2j6WgSXJgYJTVYQIj51hGGca5R9IwwZS13iq2NiQwSftGLgKmSI8y
	 Q5P7eFBJhwEocv9fJE9iK2uBv6b4g5tJWrNcYaVRPj4sVjEoRH+/7ZiiqERGgxYJ8R+41
	 KoXn5cNxscY58CeN3m1dNngosV9dLWEUzEN5KZQQKEX8ab0hVV1kSMdeQ8nVT/NLl0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ngporE/fgzBUrF3KnSnyaN3ut7orhbtzLCAAphO3Oms=;
	b=s+H/71KclKHbstPzDejBJtT03AT1SFuFHRckl8YsyEak0fMKXj8un+HZph3oYO3LzoRB
	 khTcJHPVGeYVQpLp3Nw7cSuz7onuhEGXARHJzA7WenawWRHHqxqnh6OA4wO6Z5vBi3cHs
	 H3v2XEViiQkaxW8Zoizsrm1zPtRZPwU/GP8cPJzGrav1oF3+9iXQqK1LIvQD1biVm8fRi
	 qqCPkNO/0GgMxXcpPM+YDmVPNU/ZEg0RC+kZiOyG4Qdh3+CNzSFkCVtn8cO7LiiSORreK
	 Ey2kspsS3ZXx4hxm71riHBMEFwDjhoyQ/TGpbtzeMHrse++eu8M6pM0HwaLAw6lI39w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrfX1jnl;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B96606A33E
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B96606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrfX1jnl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106822; x=1826642822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=owemP3a4HV+ybeqq/2f7rmaV5+S56SQWzPoV7w/mFV8=;
  b=RrfX1jnl9IayfOQJXfg25DhlIoiogZphNITcGRY4rcrzeEDFg5w0umIp
   YrXUtWEMx1lsGr4N1wZ+xD59vfM5mA5N3ArmNe2IwWHJKN7y/+yE1C5xZ
   svBUGN81Mx+ZMNX2mUzWSrDTBeewPsEw3Axt/uT9RDEcELLuB0Cl/ebdC
   33jwoszg3d9qO9tKh2abpOw1ajRyGuWbq8gN1gG7KIVJLgF5Xvk5mxgcf
   jNULR55OdoPlsR43IwVKAFc0CmyBERZ2Rfw6V6vCGrbMRop+kYSQFwNvZ
   HiDMFqLhogUbF5nBW7bHve8iNDk056xW6xZwihaVZVeG5MOiVj+EhYH22
   Q==;
X-CSE-ConnectionGUID: WWe/HaNaSpyy2cYjy2mRnA==
X-CSE-MsgGUID: DLNqNXeVSSy2akblh9wt4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991156"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:47:01 -0800
X-CSE-ConnectionGUID: 2i7MI+W0Tny7HeaqJqYfAw==
X-CSE-MsgGUID: AVwHTwlDSNOvW0hmC+pQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843383"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:46:59 -0800
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
Subject: [PATCH v5 net-next 07/13] selftests: xsk: run the RX and TX endpoints in separate processes
Date: Thu, 19 Nov 2026 17:46:30 +0100
Message-Id: <20261119164636.1071385-8-maciej.fijalkowski@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Run the two endpoints of a test case as separate xskxceiver processes,
so that a later patch can run them on two hosts. A process binds only
the interface given with -i, takes its role from -e rx|tx and meets the
other endpoint over a small TCP control channel (-p HOST -P PORT). The
other side is represented by a shadow ifobject that mirrors the local
capabilities and holds a loaded copy of the XDP skeleton, so the shared
test code keeps addressing both sides while only the local interface is
programmed. Once BIDIRECTIONAL swaps the directions, the local
interface runs the shadow's programs.

The pthreads, the barrier, test->fail and -lpthread go away. Each
process runs the worker of its local ifobject, and the endpoints
exchange three fixed-size messages:

- READY, exchanged before each step, works as a barrier; TCP ordering
  puts all progress of the previous step before it
- PROGRESS carries the number of packets RX consumed, which TX
  subtracts from its in-flight count so as not to overrun the RX UMEM
- ABORT tells the other endpoint to stop waiting after a failure

The endpoint given --listen listens and the other one connects,
whichever its role. The listener reports with ksft_ready() that it
listens, so the launcher starts the connector then rather than polling
for the port, which could also find a foreign listener. The listener
waits 10s for the connector, and -P goes to getaddrinfo() as given. As
with the control channels of other selftests, the hosts are trusted
and the channel is not authenticated. Test selection, interface
capabilities, option ranges and verdicts stay with the launcher.

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
index 84e3d220d5aa..675b1b31571d 100644
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
index e0f413ee17ab..fdf449822f02 100644
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
@@ -958,6 +993,9 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 	fds.fd = xsk_socket__fd(xsk->xsk);
 	fds.events = POLLIN;
 
+	if (pacing_rx_progress(0))
+		return TEST_FAILURE;
+
 	ret = kick_rx(xsk);
 	if (ret)
 		return TEST_FAILURE;
@@ -1057,9 +1095,8 @@ static int __receive_pkts(struct test_spec *test, struct xsk_socket_info *xsk)
 	if (ifobj->release_rx)
 		xsk_ring_cons__release(&xsk->rx, frags_processed);
 
-	pthread_mutex_lock(&pacing_mutex);
-	pkts_in_flight -= pkts_sent;
-	pthread_mutex_unlock(&pacing_mutex);
+	if (pacing_rx_progress(pkts_sent))
+		return TEST_FAILURE;
 	pkts_sent = 0;
 
 	return TEST_CONTINUE;
@@ -1135,9 +1172,18 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
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
@@ -1219,9 +1265,7 @@ static int __send_pkts(struct ifobject *ifobject, struct xsk_socket_info *xsk,
 		valid_frags += nb_frags;
 	}
 
-	pthread_mutex_lock(&pacing_mutex);
 	pkts_in_flight += valid_pkts;
-	pthread_mutex_unlock(&pacing_mutex);
 
 	xsk_ring_prod__submit(&xsk->tx, i);
 	xsk->outstanding_tx += valid_frags;
@@ -1298,9 +1342,6 @@ static int send_pkts(struct test_spec *test, struct ifobject *ifobject)
 			if (ret != TEST_CONTINUE)
 				return ret;
 
-			if (test->fail)
-				return TEST_FAILURE;
-
 			if (!test->poll_tmout) {
 				ret = wait_for_tx_completion(&ifobject->xsk_arr[i]);
 				if (ret)
@@ -1622,36 +1663,57 @@ static int testapp_validate_rx_endpoint(struct test_spec *test,
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
@@ -1706,13 +1768,13 @@ static int xsk_attach_xdp_progs(struct test_spec *test, struct ifobject *ifobj_r
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
@@ -1725,7 +1787,7 @@ static void clean_sockets(struct test_spec *test, struct ifobject *ifobj)
 {
 	u32 i;
 
-	if (!ifobj || !test)
+	if (!ifobj || !test || !ifobj_is_local(ifobj))
 		return;
 
 	for (i = 0; i < test->nb_sockets; i++)
@@ -1737,15 +1799,15 @@ static void clean_umem(struct test_spec *test, struct ifobject *ifobj1, struct i
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
 
@@ -1776,51 +1838,27 @@ static int __testapp_validate_traffic(struct test_spec *test, struct ifobject *i
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
@@ -1859,7 +1897,7 @@ int testapp_teardown(struct test_spec *test)
 
 static void swap_directions(struct ifobject **ifobj1, struct ifobject **ifobj2)
 {
-	thread_func_t tmp_func_ptr = (*ifobj1)->func_ptr;
+	test_func_t tmp_func_ptr = (*ifobj1)->func_ptr;
 	struct ifobject *tmp_ifobj = (*ifobj1);
 
 	(*ifobj1)->func_ptr = (*ifobj2)->func_ptr;
@@ -1898,6 +1936,9 @@ static int swap_xsk_resources(struct test_spec *test)
 	test->ifobj_tx->xsk = &test->ifobj_tx->xsk_arr[1];
 	test->ifobj_rx->xsk = &test->ifobj_rx->xsk_arr[1];
 
+	if (!ifobj_is_local(test->ifobj_rx))
+		return TEST_PASS;
+
 	ret = xsk_update_xskmap(test->ifobj_rx->xskmap, test->ifobj_rx->xsk->xsk, 0);
 	if (ret)
 		return TEST_FAILURE;
@@ -2246,7 +2287,7 @@ int testapp_too_many_frags(struct test_spec *test)
 	return ret;
 }
 
-static int xsk_load_xdp_programs(struct ifobject *ifobj)
+int xsk_load_xdp_programs(struct ifobject *ifobj)
 {
 	ifobj->xdp_progs = xsk_xdp_progs__open_and_load();
 	if (libbpf_get_error(ifobj->xdp_progs))
@@ -2302,12 +2343,10 @@ static int detect_ifobj_caps(struct ifobject *ifobj)
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
index b72e9332bf70..ded94b84cd1d 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -9,9 +9,9 @@
  * See drivers/net/xsk.py for detailed information on test topology
  * and prerequisite network setup.
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
@@ -57,12 +57,15 @@
  *
  * Flow:
  * -----
- * - Single process spawns two threads: Tx and Rx
- * - Each of these two threads attach to a veth interface
- * - Each thread creates one AF_XDP socket connected to a unique umem for each
+ * - drivers/net/xsk.py starts two processes: Tx and Rx
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
 
@@ -87,6 +90,7 @@
 #include <sys/types.h>
 
 #include "test_xsk.h"
+#include "xsk_peer.h"
 #include "xsk_xdp_progs.skel.h"
 #include "xsk.h"
 #include "xskxceiver.h"
@@ -95,8 +99,23 @@
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
@@ -157,6 +176,10 @@ static struct option long_options[] = {
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
@@ -164,7 +187,7 @@ static struct option long_options[] = {
 static void print_usage(char **argv)
 {
 	const char *str =
-		"  Usage: %s -i TX_IFACE -i RX_IFACE -m MODE -t TEST [OPTIONS]\n"
+		"  Usage: %s -i IFACE -e rx|tx -m MODE -t TEST -p HOST -P PORT [OPTIONS]\n"
 		"  Options:\n"
 		"  -i, --interface      Use interface\n"
 		"  -v, --verbose        Verbose output\n"
@@ -172,16 +195,19 @@ static void print_usage(char **argv)
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
@@ -193,7 +219,7 @@ static void bind_iface(struct ifobject *ifobj, const char *ifname, thread_func_t
 		ksft_exit_fail();
 	}
 
-	if (init_iface(ifobj, func)) {
+	if (init_iface(ifobj)) {
 		ksft_print_msg("Error: cannot initialize interface %s\n", ifobj->ifname);
 		ksft_exit_fail();
 	}
@@ -211,23 +237,18 @@ static void print_tests(void)
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
@@ -256,17 +277,33 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
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
@@ -352,17 +389,46 @@ static bool mode_supported(enum test_mode mode, u32 caps)
 
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
@@ -409,12 +475,26 @@ int main(int argc, char **argv)
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
@@ -430,8 +510,10 @@ int main(int argc, char **argv)
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

