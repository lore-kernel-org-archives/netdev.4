Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506862;
	b=5mbOFFlR80lopOmlnMz+sxvR0dmSKpayRBxm9pkHMDGqSkEhfnAlaDr6x0kpBL3ezVKG
	 ftaD++3GbTqZ7tM5Or4JCJIE8NDRj8OwqBaA6q4TL2qzHCUstfNuiOd2FM7/TgC/DZfPi
	 GUeu+wbUWaqS9vJMwZr415smT/r42KBDQlQdvNVUEnbrRnp+Z4v+6v22NgnM5eqfMxqGV
	 fMlGlvoF9P/XRrsfMF7vPHFZ/YFBaKOB0rq/IsRKyjPYdymdd1EBKydCrJy/H+YPTigye
	 JJlmZgnEUNM6+/4Ym/T++T10j3aWTCPZUPTPQr1plHWZvwRHlAc0yMxcImJ9+f5JXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JCB9Arf3kgO8khRLtzH4NIGi9cnIQlT5R56mUfugRho=;
	b=tlPz6BcH3Y/d6AQu0OpvhENF1vWiKk8ujUHZCmoAiRXFwDtWcqKwbBbr09yQpHrk5OZN
	 o4c6c2ZH1zm5WuvcjIlJA0aVW3I+t3jHK51SuLgYjYO+6pIgRIv8nnHIZDvSYu8+LLFBw
	 H6IceDbpd7noj6yDmWLf7BSHEfFxTIrsvRoigucrK2A2l8NOk96ovKMngf4V9tgLb58J5
	 bDVurRFA/Skes/+S1V5RJ8XA3FEiXW9uDJa2Bjm+tflhRNtvOb5R3z+aUvi9VKz2wp4qe
	 1mwBzCwicgKmDHshL0GVy1yxOa5gbP1XqdDw8EcBnVo115+BoaF4nd78pvQvPyZesVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7Wg1sYr;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA04606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7Wg1sYr
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so2094547a91.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506862; x=1796111662; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCB9Arf3kgO8khRLtzH4NIGi9cnIQlT5R56mUfugRho=;
        b=n7Wg1sYrAk0a+473VNn49vRqoJ4yJnv9wgIVrWuQMgzK6niyYbZdxW+QLp5pKQR1Fj
         XOlZX3oBot2wBqFvEb7po8LKq8tNshgHXt6viLdhOs9f6qmBRAdUmc8c5nIxb+mrss1r
         Q5NBVlOrMMJ7LJ6KTTy6x61avuRmi5q07WFLZbEmpCGOzo8ZT2aza6NQDTytLHtGXBgc
         cPNBhiCOAOsPXUL0jK5933CqJ+mRa+FJbKBIHZ+aN+Qlndo8RIkuUKFEMED55A46P3dy
         2W2IG+Jkqb6e6DHTrWrSvf9VPptDFlu6wjRTuLF3/M0FgXY6cYV8SVSJrLBQjZ4wDQKd
         SPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506862; x=1796111662;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCB9Arf3kgO8khRLtzH4NIGi9cnIQlT5R56mUfugRho=;
        b=n1QUj1K2/ROg2XLNshi20tR+2mEYDBli89bkX/t974WQNsIlhpp5W3igPOBBf+lOfR
         QiLoNUPXh72L7/bdSjfy/VZdHwttt5B3VWZXWX6Pjeot1zi7xbhGVCGG1qywyzRZdALk
         XOZpt4gJZjyDxCjUgrQiyiZ+xWGJPqHwXtJ2YOcNSti3aTnha/tk+h9wmeXyBD5Ry6+s
         8Cx9Iq+UrsHAfsU1B7rsyINIhjLuJ4J2piUfUsksWybLpguqG9wOfYpvf8vdwOl1I5XS
         LeV5LVUKJa30ksIumm2EuCwWNI0TpH2/Ml36tVlT360QCIKLw01+pN9MdfC0lmwvz00t
         s5SQ==
X-Forwarded-Encrypted: i=1; AL+hErEd4WIDeA/DJTTNwSg5892j0xNhYuyoLcauwQr1GXR2XOuhDNl/gA3Y3CtfsKYV4DY8T8USWT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WnLN6Ru82zGK/1TXrQvapZxWjgxgESbCkwDkZXW5Phg681O3X
	w6+fQtvV9dQnrhQNbGsRjycwSRs8i7Ni3ngQXVKau5xZKrDR0X5DJcBp
X-Gm-Gg: AZFdTZfRvDN7CtqowrTELfNsJQ3Nl9pRGX7e9rU7HY+fOxvpYTjEshJYYCIN1QG2iIO
	NNOuGihP8JdgXQ/+bYeTXXz/6RJ1nfwR8fa7Vr1kSTjg9QJbfXFH/TJ5GWuRzxnm2bMPeOnwC4b
	JoLpadh1k5BxZWaUaI9+JCRiE7o+sPE2VVJMGR2jPuvbVpbyzoWMr6G++Lhq+IbXYPrbiabIWpT
	IWEMajSiWyqAqpQl+7HmaGRZp0Gtp/GKziKTjzTQuWrDdMXM47+5qmUqtUbMR1nsUnSA4nBs+Gx
	uvoRB+HI7FlRvwnHVyXcOUljNicJ3q95KSbpMUhMqZb5/UQOan1pZrpoRuGb+3r+YWUsFTLCfLh
	KQzq8RKLiGTB0Jvy0U/1rfGdDpXbBUZl2Nv0SX7MCnGhz3PYXlMjMPbb9zR+Fyzl4ETnhWYgQLQ
	sipuavoe8NE0RrOai/4yrsLDE6zs6vteyx1bntj8AhZRiqTzavIJqVWKDeNpUk2zGObXo84GH1y
	tR1AkIuBLeDgsz8ZnSitMwu8uOvIx9Okxu7wPgMIjIMXV5Ipm4XLDMurLO3HmcOyQF3yzoIEw0A
	8FrNH5e02wV0hKZE6oQo2EdYtYCwk8pUzqXPlsF764vbn0VnUl5uJUGitnTQSrlj1HXcLyKDytU
	WRmU2BOQ3/+2LrKT2W5YuG2Byxj+cgGeugLx8
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr13476909a91.37.1795506861691;
        Mon, 23 Nov 2026 23:54:21 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b828ab9sm7681673a91.2.2026.11.23.23.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:54:21 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: pablo@netfilter.org, fw@strlen.de
Cc: phil@nwl.cc, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Subject: [PATCH nf v2] netfilter: flowtable: interlock NF_FLOW_TEARDOWN with NF_FLOW_PENDING
Date: Tue, 24 Nov 2026 15:54:16 +0800
Message-ID: <179550685613.38700.16148920957970479663@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

nf_flow_offload_gc_step() checks NF_FLOW_PENDING once at entry before
setting NF_FLOW_TEARDOWN and potentially freeing the flow via
flow_offload_del(). Concurrently, flow_offload_add() or a datapath caller
that looked up the flow prior to teardown can call
nf_flow_offload_work_alloc(), set NF_FLOW_PENDING, and queue a
FLOW_CLS_REPLACE work item holding a raw pointer to the flow without
rechecking NF_FLOW_TEARDOWN. If the pending bit is set after the GC check,
flow_offload_del() frees the flow via RCU while the queued work item can
still dereference and clear NF_FLOW_PENDING on offload->flow.

Interlock the two flags: in nf_flow_offload_gc_step(), check
NF_FLOW_PENDING after NF_FLOW_TEARDOWN has been observed or set, paired
with a full memory barrier; in nf_flow_offload_work_alloc(), recheck
NF_FLOW_TEARDOWN after test_and_set_bit(NF_FLOW_PENDING) for
FLOW_CLS_REPLACE and bail out if set. Restrict the teardown check to
FLOW_CLS_REPLACE because GC itself queues FLOW_CLS_DESTROY and
FLOW_CLS_STATS work on flows already marked for teardown.

Found with an LLM-assisted code review tool and verified by inspection on
v7.4-rc4 (b6a9fa34ce4). Build-tested only; reproducing the race at runtime
requires a hardware-offloaded flowtable device.

Fixes: 7c549fb7eecd ("netfilter: flowtable: generalize pending status bit")
Cc: stable@vger.kernel.org
Signed-off-by: Qican Ma <goonsomeway@gmail.com>
---
v2: resend via direct SMTP without line-wrapping corruption in the diff.

 net/netfilter/nf_flow_table_core.c    | 8 +++++---
 net/netfilter/nf_flow_table_offload.c | 7 +++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9d..fcd37f7a37f 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -578,9 +578,6 @@ static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
 {
 	bool teardown;
 
-	if (test_bit(NF_FLOW_PENDING, &flow->flags))
-		return;
-
 	teardown = test_bit(NF_FLOW_TEARDOWN, &flow->flags);
 
 	if (nf_flow_has_expired(flow) ||
@@ -594,6 +591,11 @@ static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
 		nf_flow_table_extend_ct_timeout(flow->ct);
 	}
 
+	/* Pairs with test_and_set_bit(NF_FLOW_PENDING) in work_alloc(). */
+	smp_mb();
+	if (test_bit(NF_FLOW_PENDING, &flow->flags))
+		return;
+
 	if (teardown) {
 		if (test_bit(NF_FLOW_HW, &flow->flags)) {
 			if (!test_bit(NF_FLOW_HW_DYING, &flow->flags))
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e..402a46e1645 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1088,6 +1088,13 @@ nf_flow_offload_work_alloc(struct nf_flowtable *flowtable,
 	if (test_and_set_bit(NF_FLOW_PENDING, &flow->flags))
 		return NULL;
 
+	/* Pairs with smp_mb() in nf_flow_offload_gc_step(). */
+	if (cmd == FLOW_CLS_REPLACE &&
+	    test_bit(NF_FLOW_TEARDOWN, &flow->flags)) {
+		clear_bit(NF_FLOW_PENDING, &flow->flags);
+		return NULL;
+	}
+
 	offload = kmalloc_obj(struct flow_offload_work, GFP_ATOMIC);
 	if (!offload) {
 		clear_bit(NF_FLOW_PENDING, &flow->flags);
-- 
2.50.1 (Apple Git-155)

