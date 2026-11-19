Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106806;
	b=khv5Iyk9cbme0oFkUaVaHPy1aAziN9RAwTHbDYkbImSX6qfjfVdR6ozXluMrx+4x5ShH
	 uLLMCbhR2eASBTceRiKJf1nx86RNbJAOqV5kPPqtCvNaP2Wle88UuLPjVsvx94kqyX3oB
	 E+Z74UfR9GUN28OxgSsacLQHpRH3yjbfauZoFN9ZYlqImZhG33NC4ulfTAt4firNsC22u
	 GxluHYwOfwiA3tmb/vxur7C0YteNRUNfM9UT0O7oUnTdARRntmCPcMULD7OqlqhRW61X5
	 jKvxeUVhiGA/GnJUqSpBOm7jBqccIgXJD1pGoLNtabGs5du8usqjuLjqUrul4jH6jnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106806;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wBh/eVp009aTvSlfY2M4XVv+zkIxsl+UpC9OLyY/lAs=;
	b=qx+SSPcMjDJ3swjlc+Rx9trdRMSOk7f/Y25FuUoqfuWoulCt1NvI0MsNKb9FqT9Sq2oy
	 Uq++FxvyUq9+77I2t9dv90Ixy3XFpx0sxxJVrrO9cHZzWW1GQLa2KMokchPmBQeleLlEQ
	 MaSALvbYpchwEi2oav6A9vz9Vz97MgXuohHtNq+MZdh8sfJBtPpmY8eb0du1uMYiUiRsJ
	 5suTLSniLkNjHTEaJXAoSIHyShVoHrJhohs6BpecdRs6W6fCnqtjGm+S8+s25UMVYpTjE
	 eeJiA71X/iMizGYyhRWfcni0PIJy5JXUFr7YWTzw4I+yUwLPFloMboGZbgy9bmS427A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OobYT9cU;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D3606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596D3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OobYT9cU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106807; x=1826642807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lpb/9Yng2yYhs3hMnW1Cn/gncI064WWrEwe5YNGgoxE=;
  b=OobYT9cUL42DLGm58361PnqDpUYKB3g/5IP3He6AlrstQXDwINEctCjz
   RvcfEfOJbAjNnwyymg6b2xi+JWmQqUKDPXGFf+cf73hY9ZFGgXQlu6eJ7
   DmmHgvNMF3zM1V1eey31SbCPIv82fvsyTdJgyjjQmN07OyB0gm6VvXJI/
   XEg4+MDLHWLDU/OpoeIgeizO3ep4FckxhmfSLqFGxPzIJOAoy0FNG5Cir
   oEm5hZMLjGZXfHkDYtg/eRbFz3aHojPujwPuitQB1iwtM1fEiippUuzY2
   pG8Xle/PsU9A2xLHpn7simFNl7khPs5zUHGEz6pSwhzWYodEBuUnZnnUn
   Q==;
X-CSE-ConnectionGUID: zytM+LffSkK3F7PrDNixkQ==
X-CSE-MsgGUID: 4s4iHfAGQ5i8smxHk+LwVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991071"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:46:46 -0800
X-CSE-ConnectionGUID: rjo10RGDR+iokp1HmGD0Hg==
X-CSE-MsgGUID: et5JrBIaTuK8c4VohOZodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843333"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:46:44 -0800
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
Subject: [PATCH v5 net-next 01/13] selftests: xsk: factor endpoint work out of pthread wrappers
Date: Thu, 19 Nov 2026 17:46:24 +0100
Message-Id: <20261119164636.1071385-2-maciej.fijalkowski@intel.com>
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

Move TX execution, RX setup and RX validation into synchronous helpers
and leave the pthread entry points as thin wrappers, so that the same
code can run in a process per endpoint later in this series. Barrier,
pacing and test behavior are unchanged.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 98 +++++++++++--------
 1 file changed, 59 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index ca161511f1e5..74eea4a4dfeb 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -1623,40 +1623,31 @@ static int thread_common_ops(struct test_spec *test, struct ifobject *ifobject)
 	return 0;
 }
 
-void *worker_testapp_validate_tx(void *arg)
+static int testapp_validate_tx_endpoint(struct test_spec *test,
+					struct ifobject *ifobject)
 {
-	struct test_spec *test = (struct test_spec *)arg;
-	struct ifobject *ifobject = test->ifobj_tx;
 	int err;
 
 	if (test->current_step == 1) {
-		if (!ifobject->shared_umem) {
-			if (thread_common_ops(test, ifobject)) {
-				test->fail = true;
-				pthread_exit(NULL);
-			}
-		} else {
-			if (thread_common_ops_tx(test, ifobject)) {
-				test->fail = true;
-				pthread_exit(NULL);
-			}
-		}
+		if (!ifobject->shared_umem)
+			err = thread_common_ops(test, ifobject);
+		else
+			err = thread_common_ops_tx(test, ifobject);
+		if (err)
+			return err;
 	}
 
 	err = send_pkts(test, ifobject);
 
 	if (!err && ifobject->validation_func)
 		err = ifobject->validation_func(ifobject);
-	if (err)
-		test->fail = true;
 
-	pthread_exit(NULL);
+	return err;
 }
 
-void *worker_testapp_validate_rx(void *arg)
+static int testapp_prepare_rx_endpoint(struct test_spec *test,
+				       struct ifobject *ifobject)
 {
-	struct test_spec *test = (struct test_spec *)arg;
-	struct ifobject *ifobject = test->ifobj_rx;
 	int err;
 
 	if (test->current_step == 1) {
@@ -1669,35 +1660,64 @@ void *worker_testapp_validate_rx(void *arg)
 				       strerror(-err));
 	}
 
-	if (test->use_barrier)
-		pthread_barrier_wait(&barr);
+	return err;
+}
 
-	/* We leave only now in case of error to avoid getting stuck in the barrier */
-	if (err) {
-		test->fail = true;
-		pthread_exit(NULL);
-	}
+static int testapp_validate_rx_endpoint(struct test_spec *test,
+					struct ifobject *ifobject)
+{
+	bool supported;
+	int err;
 
 	err = receive_pkts(test);
 
 	if (!err && ifobject->validation_func)
 		err = ifobject->validation_func(ifobject);
+	if (!err)
+		return TEST_PASS;
 
-	if (err) {
-		if (!test->adjust_tail) {
-			test->fail = true;
-		} else {
-			bool supported;
+	if (!test->adjust_tail)
+		return err;
 
-			if (is_adjust_tail_supported(ifobject->xdp_progs, &supported))
-				test->fail = true;
-			else if (!supported)
-				test->adjust_tail_support = false;
-			else
-				test->fail = true;
-		}
+	if (is_adjust_tail_supported(ifobject->xdp_progs, &supported))
+		return TEST_FAILURE;
+	if (!supported) {
+		test->adjust_tail_support = false;
+		return TEST_PASS;
 	}
 
+	return err;
+}
+
+void *worker_testapp_validate_tx(void *arg)
+{
+	struct test_spec *test = (struct test_spec *)arg;
+	int err;
+
+	err = testapp_validate_tx_endpoint(test, test->ifobj_tx);
+	if (err)
+		test->fail = true;
+
+	pthread_exit(NULL);
+}
+
+void *worker_testapp_validate_rx(void *arg)
+{
+	struct test_spec *test = (struct test_spec *)arg;
+	struct ifobject *ifobject = test->ifobj_rx;
+	int err;
+
+	err = testapp_prepare_rx_endpoint(test, ifobject);
+
+	if (test->use_barrier)
+		pthread_barrier_wait(&barr);
+
+	/* We leave only now in case of error to avoid getting stuck in the barrier */
+	if (!err)
+		err = testapp_validate_rx_endpoint(test, ifobject);
+	if (err)
+		test->fail = true;
+
 	pthread_exit(NULL);
 }
 
-- 
2.43.0

