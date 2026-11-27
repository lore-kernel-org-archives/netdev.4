Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791976;
	b=ThcwZRQj+Vs3EYBm+Cx6S1rvTFqfLq91msJdbQNwEHJgHIAqzTMTR6aqCjuuRoXRxp4z
	 q652W+ydwxSPYcT7EiJQZ9HxdyyHuvE+wEbRQDFctdixKrhBuofozarckKzWH6LlIDCtY
	 aabEvheZ3DLTJDTyW5GLJT4fIgmtOWttPF/iQf2D/SptW0WocSDNXvZdmq0nUZ3ZN4C5/
	 T1DLxh8OI+7JHRZ3XaeO0BKB2cY01YugPj1p2uCZo3En8UQdW3jdJ4qwRC5T2ZJuq1GY2
	 krGAEmXjNf/7/SStouAAmsbOpEf9cWRNSjgQKCd6WFf8doywdc2na3Sk2kTJf7kfOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gR1c2N+Q495nStvZp/LuuDtxmog0wN4+QVadgMYRGyg=;
	b=KBGs1gvxBrcza3tqGnkYWE5mq3DLehi7Ha0Uxx4r/WU85SOhKmKrgohBDjIoAPG3SVaq
	 ZdMuOPPU/Rw5X8o6uNf9G8tAlD3ZpSl4xes7bexk5XiWeRcub2x5rhcYqSMs5w4R0ztq4
	 ijGAs41jzSuTE/VZ1lZlt0IAT3Dtw0IeIh3v4CO9YxrDfNi5ofA54j+SIYmwMNPFgdN/t
	 EcwETX7mWFbVKOIUDqfgL/SXepVMv+2ZcFE2nJdBvEDVlfVNNG5rA4mQZBx/1uE7hCNqX
	 +a4kvimHhqP6uSYe/c4Wis+UEPrB9Gfp74w+rO9z0Z0flj49oG8E4koPTrhPYfWoA6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UybObJXR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B2606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UybObJXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791976; x=1827327976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zkOlVY/t6WTsKrY+GsYBaxi5cMvBH0kWYhlSJsIPYUw=;
  b=UybObJXRtD0Dp9wJKcMOyg1vdwyG/MMqqv1NA0wVZL5haQowX/upYV90
   510J5kUe4wqnhAXjXOIeWTeBnacE9WDLnNNDcgLjw7Dz1meR5Jq1g9Da7
   cvluPTg1UplO02LMcFKj3uzVqLjXiNmTIko0w+m3H2uSKtlcoEW48g4I+
   1tuaBBI8beNQ/3kX5Y7STuucnwzT8SmkTwZ9NJupjXLkpEVVC6aNXzajT
   eGwDP8zTSU2+8D+NsNdjBW8simAlmBAciQYabdJjwRxSh8AtJYAtF8oTY
   czgwxq44AtdOhnBOvrVExS3VAeMKEGddDfJsVBlaHUgvP7eNuZSImi7mj
   A==;
X-CSE-ConnectionGUID: iDBWj6PdSbyPFtg4DigN+A==
X-CSE-MsgGUID: D9h2bquUSB24Tf3kTDAnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666168"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:06:15 -0800
X-CSE-ConnectionGUID: TIIxSn6lRMal50y6gPozcw==
X-CSE-MsgGUID: 2wfsDGJiSMqBmmZbZtLDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202882"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:06:13 -0800
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
Subject: [PATCH v6 net-next 11/15] selftests: xsk: wait up to --timeout for the RX stats and a busy bind
Date: Fri, 27 Nov 2026 16:05:23 +0100
Message-Id: <20261127150527.1122049-12-maciej.fijalkowski@intel.com>
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
Content-Transfer-Encoding: 8bit

Two waits are too short on a slow kernel, e.g. a debug one:

- STAT_RX_FULL and STAT_FILL_EMPTY check a stat 1 ms after RX took its
  share, while TX can still be sending the rest. Poll the stat instead.
- TEARDOWN rebinds to the queue of a socket it just closed, which the
  kernel releases from a work item, but xsk_configure() gives up after
  10 tries 10 ms apart. Retry only on EBUSY, and bind TX before READY,
  as RX does, so that the retries do not eat into the RX timeout.

Both now wait for up to --timeout seconds.

Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 113 +++++++++++-------
 .../testing/selftests/net/lib/xsk/test_xsk.h  |   1 -
 .../selftests/net/lib/xsk/xskxceiver.c        |   2 +-
 .../selftests/net/lib/xsk/xskxceiver.h        |   1 -
 4 files changed, 71 insertions(+), 46 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 4b8cf5a3d387..a0ad1df00212 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -1563,46 +1563,57 @@ static int validate_rx_dropped(struct ifobject *ifobject)
 	return TEST_FAILURE;
 }
 
-static int validate_rx_full(struct ifobject *ifobject)
+/* TX sends more packets than RX takes, and the stat counts those that find the
+ * RX ring full or the fill ring empty. RX can take its share well before TX
+ * sends the rest, so wait for the stat to count one.
+ */
+static int wait_rx_stat(struct ifobject *ifobject, bool fill_empty)
 {
+	struct timeval tv_end, tv_now, tv_timeout = {thread_tmout, 0};
 	struct xsk_socket *xsk = ifobject->xsk->xsk;
 	struct xdp_statistics stats;
+	u64 cnt;
 	int err;
 
-	usleep(1000);
-	err = kick_rx(ifobject->xsk);
+	err = gettimeofday(&tv_now, NULL);
 	if (err)
 		return TEST_FAILURE;
+	timeradd(&tv_now, &tv_timeout, &tv_end);
 
-	err = get_xsk_stats(xsk, &stats);
-	if (err)
-		return TEST_FAILURE;
+	do {
+		usleep(1000);
+		err = kick_rx(ifobject->xsk);
+		if (err)
+			return TEST_FAILURE;
 
-	if (stats.rx_ring_full)
-		return TEST_PASS;
+		err = get_xsk_stats(xsk, &stats);
+		if (err)
+			return TEST_FAILURE;
+
+		cnt = fill_empty ? stats.rx_fill_ring_empty_descs :
+				   stats.rx_ring_full;
+		if (cnt)
+			return TEST_PASS;
+
+		err = gettimeofday(&tv_now, NULL);
+		if (err)
+			return TEST_FAILURE;
+	} while (!timercmp(&tv_now, &tv_end, >));
 
+	ksft_print_msg("ERROR: [%s] %s is 0 after %u s\n", __func__,
+		       fill_empty ? "rx_fill_ring_empty_descs" : "rx_ring_full",
+		       thread_tmout);
 	return TEST_FAILURE;
 }
 
-static int validate_fill_empty(struct ifobject *ifobject)
+static int validate_rx_full(struct ifobject *ifobject)
 {
-	struct xsk_socket *xsk = ifobject->xsk->xsk;
-	struct xdp_statistics stats;
-	int err;
-
-	usleep(1000);
-	err = kick_rx(ifobject->xsk);
-	if (err)
-		return TEST_FAILURE;
-
-	err = get_xsk_stats(xsk, &stats);
-	if (err)
-		return TEST_FAILURE;
-
-	if (stats.rx_fill_ring_empty_descs)
-		return TEST_PASS;
+	return wait_rx_stat(ifobject, false);
+}
 
-	return TEST_FAILURE;
+static int validate_fill_empty(struct ifobject *ifobject)
+{
+	return wait_rx_stat(ifobject, true);
 }
 
 static int validate_tx_invalid_descs(struct ifobject *ifobject)
@@ -1635,23 +1646,32 @@ static int validate_tx_invalid_descs(struct ifobject *ifobject)
 static int xsk_configure(struct test_spec *test, struct ifobject *ifobject,
 			  struct xsk_umem_info *umem)
 {
+	struct timeval tv_end, tv_now, tv_timeout = {thread_tmout, 0};
 	int i, ret;
 
+	if (gettimeofday(&tv_now, NULL))
+		return -errno;
+	timeradd(&tv_now, &tv_timeout, &tv_end);
+
 	for (i = 0; i < test->nb_sockets; i++) {
 		bool shared = !!i;
-		u32 ctr = 0;
 
-		while (ctr++ < SOCK_RECONF_CTR) {
+		/* The kernel releases the queue of a closed socket
+		 * asynchronously, so a bind to it can fail with EBUSY for a
+		 * while after the previous step or test case.
+		 */
+		do {
 			ret = xsk_configure_socket(&ifobject->xsk_arr[i], umem,
-						     ifobject, shared);
-			if (!ret)
+						   ifobject, shared);
+			if (ret != -EBUSY)
 				break;
-
-			/* Retry if it fails as xsk_socket__create() is asynchronous */
-			if (ctr >= SOCK_RECONF_CTR)
-				return ret;
 			usleep(USLEEP_MAX);
-		}
+			if (gettimeofday(&tv_now, NULL))
+				return -errno;
+		} while (!timercmp(&tv_now, &tv_end, >));
+		if (ret)
+			return ret;
+
 		if (ifobject->busy_poll) {
 			ret = enable_busy_poll(&ifobject->xsk_arr[i]);
 			if (ret)
@@ -1771,12 +1791,6 @@ static int testapp_validate_tx_endpoint(struct test_spec *test,
 {
 	int err;
 
-	if (test->current_step == 1) {
-		err = thread_common_ops(test, ifobject);
-		if (err)
-			return err;
-	}
-
 	err = send_pkts(test, ifobject);
 
 	if (!err && ifobject->validation_func)
@@ -1829,8 +1843,7 @@ static int testapp_validate_rx_endpoint(struct test_spec *test,
 /* An MTU or XDP program change can reset a NIC, which takes the link down on
  * both hosts. Each endpoint makes those changes before it is ready, so once
  * both are, wait while the local link is down. This is best effort: it misses
- * a reset that a driver has yet to start, and one on the bind of a TX socket,
- * which comes after the wait.
+ * a reset that a driver has yet to start.
  */
 static int wait_link_up(struct test_spec *test)
 {
@@ -1867,13 +1880,27 @@ static int sync_endpoints(struct test_spec *test)
 
 int worker_testapp_validate_tx(struct test_spec *test)
 {
+	struct ifobject *ifobject = test->ifobj_tx;
 	int err;
 
+	/* Bind before READY, as RX does, so that a bind retry does not take
+	 * from the receive timeout of RX, which starts after READY.
+	 */
+	if (test->current_step == 1) {
+		err = thread_common_ops(test, ifobject);
+		if (err) {
+			ksft_print_msg("TX endpoint setup failed at step %u: %d\n",
+				       test->current_step, err);
+			xsk_peer_abort(ctrl_peer);
+			return err;
+		}
+	}
+
 	err = sync_endpoints(test);
 	if (err)
 		return err;
 
-	err = testapp_validate_tx_endpoint(test, test->ifobj_tx);
+	err = testapp_validate_tx_endpoint(test, ifobject);
 	if (err && err != TEST_SKIP) {
 		ksft_print_msg("TX endpoint traffic failed at step %u: %d\n",
 			       test->current_step, err);
diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.h b/tools/testing/selftests/net/lib/xsk/test_xsk.h
index 15534f4ec8f4..ee840ccdfcbf 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.h
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.h
@@ -28,7 +28,6 @@
 #define MAX_ETH_PKT_SIZE		1518
 #define MAX_INTERFACE_NAME_CHARS	16
 #define MAX_TEST_NAME_SIZE		48
-#define SOCK_RECONF_CTR			10
 #define USLEEP_MAX			10000
 
 #define MAX_SKB_FRAGS_PATH "/proc/sys/net/core/max_skb_frags"
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
index 7ef6f08538bd..07e4cadfb164 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
@@ -186,7 +186,7 @@ static void print_usage(char **argv)
 		"                       the caller steers the test flow to the bound queue\n"
 		"      --queue N        AF_XDP queue to bind (default 0)\n"
 		"      --max-frags N    Fragment limit for TOO_MANY_FRAGS (default by mode)\n"
-		"      --timeout SEC    Traffic and link timeout (default 3)\n"
+		"      --timeout SEC    Traffic, link and bind timeout (default 3)\n"
 		"  -h, --help           Display this help and exit\n";
 
 	ksft_print_msg(str, basename(argv[0]));
diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.h b/tools/testing/selftests/net/lib/xsk/xskxceiver.h
index 3ca518df23ad..2365bda57a4b 100644
--- a/tools/testing/selftests/net/lib/xsk/xskxceiver.h
+++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.h
@@ -24,7 +24,6 @@
 
 #define MAX_TEARDOWN_ITER 10
 #define MAX_ETH_JUMBO_SIZE 9000
-#define SOCK_RECONF_CTR 10
 #define RX_FULL_RXQSIZE 32
 #define UMEM_HEADROOM_TEST_SIZE 128
 #define XSK_UMEM__INVALID_FRAME_SIZE (MAX_ETH_JUMBO_SIZE + 1)
-- 
2.43.0

