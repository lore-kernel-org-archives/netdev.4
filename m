Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837064;
	b=PxLyEW64JvjU3iquj10EGWmcwabknIYm+m3PShXyHbE8uSQHyel0VNX9DOQyf5HzQaKF
	 KMNXiO0EWVStbKpzvyViIvwfnD/Yx+sDJE/0J4Y0Sw5TfpOk0C+oNQkAocb8B4Sex+/IP
	 pWeHDG8Phlmup0J+/kHId8oFhTuLejfugWFkcH6asc4qU2aP0g+jpihGjoZ9uaYyCQ0R1
	 G+v23Eth41F4ujSKIfhw2wviGCj25mYaO1tGO505J/w8BLhIwnkKbAcK/4URnDK3TUf+f
	 16/8Tba2eq05jUVj/mKg2pmt2l/uWEsMzXkWMAhSg0C/0as+uPBdfM+DkMZcEynRcRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
	b=WK5g8j7xhhQuZRTrm27tBPQgT8TtOuPPxFDYKotkqUddcHocXztRSsLNLgKcFwAHRtzQ
	 IqrUIih+KEypVehWPsuKj1zdlucGmG9HAV3MPP32RU8WXF1QxTXuxMinQFQ/axG4Q1gZR
	 pe+SDbb1h/0FiNLmoGrH4dyGz5wtmCYtFfyDGGVCW+djQ6fjk12heWgSAAMTlJPz0G+js
	 rp1JzuYL374Md+jnBzWog2IzSVk+l+P/l/UBo9IE9CnC4Xfp7szul+89qr5LAJf4V9iC+
	 k7rORjb0+53EMZ3/36w3Mv12dSl6Ch7APnEBi16uA2vsN98uY5e8PbvzxHw/dKYo5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ZVqfHwS0;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912B606A31F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D912B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ZVqfHwS0
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2382bf051so4629320b3a.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795837063; x=1796441863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
        b=ZVqfHwS0yY6hgOTchfvwgYvA39Vbn9CgOLbgnbOhlMuIrvLQo1S95FPGUYgXzRDkwi
         R4jeXPmLTI8dz76eAd5GrGUHAOINYeuavetVDJRVWkUyqg1D4UzwTim1ZyS3k0N9nFAY
         rbgGTTTZoVtxZDdwOXuDAMWkQ6EimirerceNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837063; x=1796441863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoOSrxK+y3duBfRBPRX/cABY+OCMf/PDrt2oQl6NHUg=;
        b=yXRLteJdJuPLCMTlmPTm40/w0a4zypLP0Dsq5uIA4YMQKWmUe/HbMmcCOxzh6IVgv6
         7axLDWtg9fFN+eckehyCPB5zI/jhmOBj80SBHY7ljlDVbcAig53EslLz1XYFhB7K9x/4
         vN3X8BNMH8e3ZE+HjCyNgGiAM10nVpM31Ad30Y8u6sy9YCmQ+W6LRiaAdVCT361Bt68u
         AidbRBcpZ+DVxp3hxjEvpO7Yqin8aelOdc1zxztgU+xIBLpp6zvg7ryutk1ThW8kLqT1
         +X4p9W/dUtIRsrZ6emFY+uZTT/5etS1y226U7tQhRxKKAxadK+VbiJyLgURRZFMNz71k
         YRmg==
X-Forwarded-Encrypted: i=1; AL+hErGhX16rb0d9pbaT+lxHqA6iBF+1iopHmWSLa6emAbsj3OR1eCGm3GQcMko6yG8KR5uLFYI+BvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/kNBJAl1M/wdPVN6MOybfVh3TgnHH2y+6Fh9dr4cJKBmjPDse
	sJdoqH9rXyhB2xIA714VPH2SkOe36G8Uwz7ubWcuAJbafPqqg0zpZ8qVkvQIgMutRzs=
X-Gm-Gg: AZFdTZd1ET4Gb1gT7lrCKZs96AUzPK+NRoM8UF1/EjC1xRLLYv1I3x9UZZw/jfFBPt3
	vvM2h3BPnwp81WixVn+dRqlJhC7jhXIOBEFEnhDSElvD3gBIMp4sRhWx+Orvv4gp/2amLMnQ8a1
	RgmZ6Q88el1D8hqsziKlQUPPdKFi7wdZNK45KD4yPHZjEdG403/1GrgU6ZyfS08To2/YfDkHPfo
	T160gc2MrNCW2McUleWU7OYkdKHvCWVSfS3kYGr4jQmni4JbxCQqo+zZa2pTXHDZ5tbJGDMY79y
	A+U3XamaGbJUQIDkoJZGc2MgbiqEqD4ox00JE6/l5cnSERLXR59UaIk0isxdCMv0q8Iyi/KVHst
	pmkGt8qzy2jDi0nL/eghYJ/3CM8yCEUQpdnBaBHQVVA6mgKQ3HsOlOREEJzqLrmgOzl6GjUxuYD
	DWc5UF7WgOj3gLQsSclFcrHEiny+zc6dcfRqzTO9B057QnX0BFmsSWnIjiG1okXMFvgnxhBeXCr
	2NAJKDZIZF7pnzQ1zeKiXU49ijjgv3UJFrxtPcJ1pCfdVP8CWt7rmatuIoM3FswSqrDvMRgeiHG
	USyma8xxJpeE5+pJVZYk6AwTSOJyR9R/G3WX4QWe6FnoJTAfm7pxXd3dUa6zyczoFlJ+PweK384
	3W+PuD0WASI5HTDi3hpa341R7jvi5QE9YHpI4XvGSlrtkyq49p5KqPqtwBpSozOvwjg==
X-Received: by 2002:aa7:88d4:0:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8c87d12283bmr26030379b3a.51.1795837063176;
        Fri, 27 Nov 2026 19:37:43 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm13517969b3a.32.2026.11.27.19.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:37:42 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Allison Henderson <achender@kernel.org>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [PATCH net] net/rds: do not leave ic->i_cm_id pointing at a freed cm_id
Date: Sat, 28 Nov 2026 09:07:37 +0530
Message-Id: <20261128033737.467966-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

rds_ib_conn_path_shutdown() frees the connection's rdma_cm_id and only
clears ic->i_cm_id afterwards:

	rdma_destroy_id(ic->i_cm_id);
	if (ic->rds_ibdev)
		rds_ib_remove_conn(ic->rds_ibdev, conn);
	ic->i_cm_id = NULL;

rds_ib_remove_conn() takes locks and can sleep, so the pointer is left
pointing at freed memory for a while.  Both FRMR paths read it with
nothing that excludes this teardown - rds_ib_get_mr() from sendmsg()'s
RDS_CMSG_RDMA_MAP handling, and rds_ib_unreg_frmr() from the MR pool
flush - and the NULL test in rds_ib_unreg_frmr() does not help, because
the pointer is not NULL, it is dangling:

  BUG: KASAN: slab-use-after-free in rds_ib_unreg_frmr+0x119/0x860
  Read of size 8 at addr ffff888022d67010
   rds_ib_unreg_frmr+0x119/0x860
   rds_ib_flush_mr_pool+0x685/0x9f0
   rds_ib_flush_mrs+0x57/0xc0
   rds_release+0xc9/0x220
   __sock_release+0x65/0x160

  Allocated by task 37:
   __rdma_create_id+0x48/0x4f0
   __rdma_create_kernel_id+0x3c/0x80
   rds_ib_conn_path_connect+0xfa/0x320

  Freed by task 9508:
   kfree+0x1c7/0x660
   rds_ib_conn_path_shutdown+0xc2b/0xd30
   rds_conn_shutdown+0x3ca/0x940

The same dangling pointer reaches the registration side, where a fuzzer
found it posting a work request to the QP of a cm_id already destroyed -
rxe reports that as "qp has been destroyed" from its own
WARN_ON_ONCE(!qp->valid) and then faults on qp->state_lock.

Clear ic->i_cm_id before destroying it, so a racing reader sees NULL
rather than freed memory, and check the pointer in rds_ib_post_reg_frmr()
the way rds_ib_unreg_frmr() already does - it is the one FRMR site that
dereferenced it without a test.

This does not serialise the two sides: a reader that has already loaded a
non-NULL pointer can still be preempted before using it.  Closing that
would mean giving the registration path the exclusion the other users of
ic->i_cm_id have, which is a larger change than this one.

We found this with a syzkaller-based fuzzing harness driven by an AI tool.

Fixes: 1659185fb4d0 ("RDS: IB: Support Fastreg MR (FRMR) memory registration mode")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/rds/ib_cm.c   | 12 ++++++++++--
 net/rds/ib_frmr.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/net/rds/ib_cm.c b/net/rds/ib_cm.c
index 16bfeaaf3b97..17d748f08607 100644
--- a/net/rds/ib_cm.c
+++ b/net/rds/ib_cm.c
@@ -1077,6 +1077,7 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 {
 	struct rds_connection *conn = cp->cp_conn;
 	struct rds_ib_connection *ic = conn->c_transport_data;
+	struct rdma_cm_id *cm_id;
 	int err = 0;
 
 	rdsdebug("cm %p pd %p cq %p %p qp %p\n", ic->i_cm_id,
@@ -1178,7 +1179,15 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 		if (ic->i_recvs)
 			rds_ib_recv_clear_ring(ic);
 
-		rdma_destroy_id(ic->i_cm_id);
+		/* Clear the pointer before freeing what it points at.
+		 * rds_ib_unreg_frmr() and rds_ib_get_mr() read ic->i_cm_id
+		 * without holding anything that excludes this teardown, and
+		 * rds_ib_remove_conn() below can sleep, so a pointer left
+		 * behind here is one they dereference after the free.
+		 */
+		cm_id = ic->i_cm_id;
+		ic->i_cm_id = NULL;
+		rdma_destroy_id(cm_id);
 
 		/*
 		 * Move connection back to the nodev list.
@@ -1186,7 +1195,6 @@ void rds_ib_conn_path_shutdown(struct rds_conn_path *cp)
 		if (ic->rds_ibdev)
 			rds_ib_remove_conn(ic->rds_ibdev, conn);
 
-		ic->i_cm_id = NULL;
 		ic->i_pd = NULL;
 		ic->i_send_cq = NULL;
 		ic->i_recv_cq = NULL;
diff --git a/net/rds/ib_frmr.c b/net/rds/ib_frmr.c
index 8397aa4a17ac..09e732ac2324 100644
--- a/net/rds/ib_frmr.c
+++ b/net/rds/ib_frmr.c
@@ -124,6 +124,7 @@ static int rds_ib_post_reg_frmr(struct rds_ib_mr *ibmr)
 {
 	struct rds_ib_frmr *frmr = &ibmr->u.frmr;
 	struct ib_reg_wr reg_wr;
+	struct rdma_cm_id *i_cm_id;
 	int ret, off = 0;
 
 	while (atomic_dec_return(&ibmr->ic->i_fastreg_wrs) <= 0) {
@@ -164,7 +165,16 @@ static int rds_ib_post_reg_frmr(struct rds_ib_mr *ibmr)
 			IB_ACCESS_REMOTE_WRITE;
 	reg_wr.wr.send_flags = IB_SEND_SIGNALED;
 
-	ret = ib_post_send(ibmr->ic->i_cm_id->qp, &reg_wr.wr, NULL);
+	/* Check it the way rds_ib_unreg_frmr() does: the teardown clears
+	 * ic->i_cm_id, and nothing here excludes it.
+	 */
+	i_cm_id = ibmr->ic->i_cm_id;
+	if (!i_cm_id || !i_cm_id->qp) {
+		rds_transition_frwr_state(ibmr, FRMR_IS_INUSE, FRMR_IS_STALE);
+		ret = -ECONNABORTED;
+		goto out_inc;
+	}
+	ret = ib_post_send(i_cm_id->qp, &reg_wr.wr, NULL);
 	if (unlikely(ret)) {
 		/* Failure here can be because of -ENOMEM as well */
 		rds_transition_frwr_state(ibmr, FRMR_IS_INUSE, FRMR_IS_STALE);
-- 
2.34.1

