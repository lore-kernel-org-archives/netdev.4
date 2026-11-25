Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591484;
	b=1Vn/5PCBqXK7bdzHq4pdrVNZfT4mxpIG6D8bl2rE6vfVLGxpD0zpdZM3jbRUfWRy3Up+
	 lRB5IJUl+nC+FdFViZrmM+5xrieQN9T952LjMW3n2bT78Ck2Hyu0Amb0SOcPDPrSMebl7
	 Vp7vYH01XaOcWqHE1kQ00tbCXoX0px8C3QRhMFfdfEx1WBmoZmqf4c33z+kmguOpqp3ib
	 PBwmWDq1hmZAUAaP1zJfOIL/zNBHgOCOTPrIhMEZKzZf71BR7SnAOYUk4IRaO2aFU0SNV
	 qOGoKGICxCs0hTkL/zR0yfdURUgHXuWCpyAkI44UlaaPmuzu6QnoKzV7cqY0IObIHBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3RvJ7jvZeAedFK81T5hXt5zG8ttm1un36O2UVXfViZM=;
	b=LLqtJ+pn8roq6UhKJE9Ty39eD8m+vGt3g5uPYst7P5+JxUq+EjZsxmshUbPMKo5qqQ6Y
	 TmQnl4lVhSl11x25dPtdjbYI0FKs4yg3t1Rli15oHY+Q+i4GKSEpavWRI1Tv1dqf2i6WG
	 4UCuMRY1wki5r/JI5XPUhwZF3ejR4/UkGYauuCYMC4HFUHtERvdLlZe76rzjCrvDMCNvl
	 ZixrkwspeTaq4qY/e2MxG0TRC9uxw2DDCjIAcgFFBKexspQgFcsonC50Hz9OBQnikivAb
	 srNCZpKoTCnTRdRu7DtWfSL25knixDoWvXn+gwwwtdU+pVuTmmkSwRjhuByN98Nl3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhS3WEkx;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FFD606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FFD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhS3WEkx
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f02f04a426so43935935ad.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591483; x=1796196283; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RvJ7jvZeAedFK81T5hXt5zG8ttm1un36O2UVXfViZM=;
        b=RhS3WEkxMbYkcos86zbxOOxcOiVgOieDqIOuzEZA9EaPEQR4bUE3VSWA1P2zv+CMBr
         qs6Ed7nnma9czP5ITNyU+tEKsnBSDhu5WIrbaAqgYKwdgsOXPoCr7d7vQ6awLMDwe77O
         9bwSvSgz7+Bu2EaWmJ/oXwHf+QOzgwLYUNB3Drarqf+voavWszOwhofY9MUJpODDy2W6
         J5cl63JeSdGLYAnJSPKk7GX/sZAdrau/kNeaJVu2ElvzftkzlwmeNXnrE9BJl4AYejzI
         XdBd0YUasixnoQisLMsiuMGnhGnmwIFsi+Tf2/KS+91SbI1FjQ0FRCP2X6n+pxSBlIJw
         Eb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591483; x=1796196283;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RvJ7jvZeAedFK81T5hXt5zG8ttm1un36O2UVXfViZM=;
        b=iWPYLcvuIKSIN6VKEdWvsI72i5SF6/B4GV11DIMmOwU8JOCjcR39/1OzvX8WNFqdgh
         4aZ7Mt1McNmxhvvOtyWGlRLtMYDRxNdifLLmD15FJnAvJZ9+E3aVnww7I2DnTLFMHRPX
         UPwAL/hY66D1Zp/wxP3EliB8kabk4qpKCSnWzzACT2DMMAI/8/Pu8+gxGcQc2QoLeKyn
         knNuCInedO3ADbJxazCCroMqAVLLhbGpplPhJH6wmmlFVFLpsDyZK2Rb7DJ8v9AGjgwf
         toUKCgKIDqNwmQeuGCbNd9Ly4vgWnd5xC8MlMR5YfUIJ6tTdlsNfvjmlxJxD4m/1NJtb
         lODQ==
X-Forwarded-Encrypted: i=1; AL+hErFyYNAo2GpkVCoK7cQigdiFPRgw2t3BVafP8dAdFpumt3X4UOdjcJFxlkVVcPSU2ynr1QIl5zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yGNDN2xlgNe3nABmKb4VXZ/4g/QyMKas5472ZhwPC9Bn6mwLO
	48FH0y0JcFywnbJg7o3bhCaXl67GEzx3W8/9bQuUKBGbY6UdnraD0pfq
X-Gm-Gg: AZFdTZf3YPH6x1IQD24bYgXXIOggkV5/hvKmuttcsEZ3LtOCKNPl6JjuKbiF8Jtgg6n
	UAzswyaiTz1vbqEcl4I+e6EEfG6c3CcU6ZqAaU8VWvpKd7vc+XTTV5j7rgp9khud62vahPIKUOt
	iCW0FQ5IoPBYGb7OucZnei0KV/dC6lWOzCuyyeUyMQYXjlGTnP5tHDkRICSS/P8QjLroct0vS8w
	3RNZueQ9emV/2XLEM9flMfbxKQ5s3wo1hzocuTUs8MALSnPQVGrNxQEj+0ejSHD7vxTApqezTS5
	AMqBpBpv2i0PEe2ZAJ9ubPYVubJbcdtQj+EfS2LBN/8EXkm6UIp9KI/cg72Mdmoi3cHkw0m7M7k
	DKASX0Ltv9Qb+aRJiHKG1GWMbGGU2gPpjPDkiNQfNa9E6NZc0JoyydDtdaI30n3o490ygW1stZ/
	9HAXFcMnI3uilKwiwmUgsMEahvyE8uXBGVUbJNJtCsaXYhrm8Dmui5geLBZgTVOYYaMKBUiEjN5
	CaF1CFO8gc8b/Fqvt49E20WxrCvhLu9QJSeunvp8pg2ELLOo2Sl3RvGubR4R+eBYZXsP4eNFhU8
	kGnJy7kNTCZ+XzUXtSsGINzvUtt00+Vg9LhkzTOOJun0aPkI0uCx7nvQ0iYXQiw8sveMXIQ2Ldm
	YC3UeAYCBkj7KoQC930tLvXAQd2Mpg3JavXd0QXVY1mFwgfsXm1k72k6FeOo=
X-Received: by 2002:a17:902:e74f:b0:2f0:b586:1945 with SMTP id d9443c01a7336-2f0b5861a66mr66612785ad.22.1795591482900;
        Tue, 24 Nov 2026 23:24:42 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0667679d8sm62418155ad.48.2026.11.24.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:24:42 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: pablo@netfilter.org, fw@strlen.de
Cc: phil@nwl.cc, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Subject: [PATCH nf v3] netfilter: flowtable: interlock NF_FLOW_TEARDOWN with NF_FLOW_PENDING
Date: Wed, 25 Nov 2026 15:24:37 +0800
Message-ID: <179559147736.38007.14255585896242834600@gmail.com>
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

This complements commit 0abb54363974 ("netfilter: flowtable: do not hw
offload flows in teardown state"), which checks the teardown bit in the
nf_flow_offload_refresh() caller: checking inside
nf_flow_offload_work_alloc() covers all FLOW_CLS_REPLACE callers,
including flow_offload_add(), and the GC-side barrier closes the
remaining window where GC reads NF_FLOW_PENDING at entry before
NF_FLOW_TEARDOWN is set.

Found with an LLM-assisted code review tool and verified by inspection on
v7.4-rc4 (b6a9fa34ce4). Build-tested only; reproducing the race at runtime
requires a hardware-offloaded flowtable device.

Fixes: 7c549fb7eecd ("netfilter: flowtable: generalize pending status bit")
Cc: stable@vger.kernel.org
Signed-off-by: Qican Ma <goonsomeway@gmail.com>
---
v3: rebase onto net-next with 0abb54363974 included; note how the check
    inside work_alloc() complements the refresh-side check and why the
    GC-side barrier is still needed. No code changes.
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

