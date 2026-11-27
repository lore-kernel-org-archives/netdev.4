Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791956;
	b=JAGox7jzGUHs7L2Ae0DcwhyU0hPXJ6JiH5Woe4TrQ/oHO+sccew3QntIOR/fNIeiYRS0
	 n2ctYrSf3Mi8mzIgkIk1nH84wfUPvStvTxhnVeREWMvzWQvnIW2XjP2Wms6gmUhNZpNCl
	 c9Z/8GmUhoIhmbR8zptB79LLZ+Vrvm0Hib4+73CDd3LyV8y4S3h8OiQZm9GikfbQ4iaDY
	 I0I2h+UlJhc6k/Y5rIAZNCIMbxA2Kjty7wx4Ol/9G+oX9r7E8j3VLEKwimS6HSSVtfO2t
	 aUrKIdpC30F8HxPVG7lVXhHyDGRQW7L5unz3nG/2RBYRe/Ku7Gh/xId2NBJRLSNxmfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uUc3M6mRr08FQ9MAf40oo8bYfWKx8R+rnNAEvCw0zsI=;
	b=Rc+2Kj/8tyG4VpMvfXLgVM9MXPNswd+NJvSzfr0IOlJA95NaHgUGfH0moOpZgqC5LtYW
	 7RiDcAUDvvAuJXlr8wWHEFt4IyZpcAYLinx/ElkVupuvvao2h/ec2pZVk72EO+bAgnoH0
	 S3XqpuC4WLBc40NK8wbkgaAV7UVceWHLbiaTfre4Hh/gTY6EKO3eNsquB29oLx+8xrun/
	 yslMY/wGZYvConhXcffJmOdNq2mHxsRmiG7GAXRu7qG4XvVfGm5XyKItrmfzx3VsQ1zRR
	 6qBnuozedyCJaO4kHo4lXmMLBx5YyU0SFihz6NkPpy4TBwX1ky3UhJuepFf/4/DXGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9+66HsJ;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C6606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 407C6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9+66HsJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791956; x=1827327956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=utWPsvHIzJVjPHndSeae31O9l8PjomtKpcV+n8YvM74=;
  b=H9+66HsJZgRBdjyyT3wCEJ94yP+nSs34tKfyeAZqjIhHZVnUgT0oYqx/
   p3c4TZY8EBiBJMcdAAlm1tyFVbhAi7NScfLURLU7u2pAaCV6Cz52au8fW
   ws/OBKkgHoecB055fegG7NK5VtOhMPCIXo7g5Ef+bYj6r3FO35RsH1p80
   pAebTJN4hfgsGlF4xR/q4HrG+tyRYsuIGMunyGSmk2oluPRVSrswoT/YH
   KqdMWOQDWj8gWTr39g83YjnRdWtfFC98u/LRcE0/koVxhW0VvK8NVwLOU
   NKVwLNfPMG/Bz+yq+PybueoOfk/xMkljxUFcQxGgV7Fn8ulRL0EtB8SRD
   Q==;
X-CSE-ConnectionGUID: qBVUHrKPT9mjRDFPjdw6Nw==
X-CSE-MsgGUID: 8XWBupn3S/qNxQutEij+5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4665983"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4665983"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:05:51 -0800
X-CSE-ConnectionGUID: 1rX2bSs5QfWGPXDNBO281g==
X-CSE-MsgGUID: eU6MdOYDTeeklv0ihyVvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202643"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:05:50 -0800
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
Subject: [PATCH v6 net-next 02/15] selftests: xsk: factor endpoint work out of pthread wrappers
Date: Fri, 27 Nov 2026 16:05:14 +0100
Message-Id: <20261127150527.1122049-3-maciej.fijalkowski@intel.com>
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

Move TX execution, RX setup and RX validation into synchronous helpers
and leave the pthread entry points as thin wrappers, so that the same
code can run in a process per endpoint later in this series. Barrier,
pacing and test behavior are unchanged.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 91 ++++++++++++-------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 407c65f7293c..73f6e0302ee3 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -1604,40 +1604,31 @@ static int thread_common_ops(struct test_spec *test, struct ifobject *ifobject)
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
@@ -1650,29 +1641,61 @@ void *worker_testapp_validate_rx(void *arg)
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
+	int err;
 
 	err = receive_pkts(test);
 
 	if (!err && ifobject->validation_func)
 		err = ifobject->validation_func(ifobject);
+	if (!err)
+		return TEST_PASS;
 
-	if (err) {
-		if (!test->adjust_tail)
-			test->fail = true;
-		else if (!is_adjust_tail_supported(ifobject->xdp_progs))
-			test->adjust_tail_support = false;
-		else
-			test->fail = true;
+	if (!test->adjust_tail)
+		return err;
+
+	if (!is_adjust_tail_supported(ifobject->xdp_progs)) {
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

