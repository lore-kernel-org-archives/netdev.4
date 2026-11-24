Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795490490;
	b=Mn9jpwwhjGnwBksyj5AMIQreraHvcxYtzXioQn9JgeVVL3+G9356kIu9UXlBLc0xpBqn
	 jWAs66HP03eRo7TZ4bQk5JOuaqB9wx+520ZYljnZREhXYsAu1ICoiksR/W62uL87MDRhp
	 v8tH46epvx9+klA3F2GF94lpybUa3ofNBsC4B03ezP2/eUCTkxUllOdsbrvfn89cBBfWC
	 HNB/6Kye7n9WDqjWxba3SO+6MDYl30BoEKIH8wzG1dVin/MH54kvK4cKKRlFW0//ZuaOs
	 8UAbI0WJC9AiP6lLh9Fp6LFEC/J7rLvx5JVVwsmfde0WMQDZPxa4yx2HFAvZ3l0Ewfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=oaCz9FAobFX+cqXKdeVDaXGsBDT/dh6s+LEZD6XoqC0=;
	b=UMlwExingZsUSsvnPY80tQOAIKT28RpOuN3RqlGncBxpFqnNPsHqRy3ZkJreM3xfqOo+
	 HRtDXtyGvAZXbYUnYwIczwSEk2BpeIEnw/eaJJdK5dyiPfjtk0zVDponSK/Bxdr5bGSrE
	 meZCPwvlhDVN5KRx7nM8r47Dn3yyjIfWV/Olp9g1CIoKwI6u8tqooBsfBlelm1fVvzPd6
	 uaNw07RhvnlBE5jgtAcNZUzgMvRDyJZ2GlGZrGqxf7rdwhNyL+LV7/VEib0auqTD61+EW
	 9CE/ZtRZE4wlQ5UfQq9nbRBdx/y7oELKrywtpNYSHtMLtDXdf0gQ4uor2E8/3xJNh7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygdhWyXJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C83606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygdhWyXJ
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db89857abso4146109d50.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:21:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795490489; cv=none;
        d=google.com; s=arc-20260327;
        b=SbMG2BrG+YYlKLzDhfDmicS7dDo9u610QYfcUack0QwTw+UPACxPcNwFpH0hDWxDfu
         gXtsNftRM4PSDT/DXLS+SN0OzNA9ZaGMtph8Fa8UPcv3Reiqme55C+UFu+GKxbnZSts6
         +saQ/NdSjitnv+fLsKF/cJwZ04EoylyViz0ypSDP0koXblwX1LhkqCE7WMvRJ5DMbITm
         cTwiz3r7D96yJ3uHP/4PoQHaKuOlsYYk5rxwqNCU0zsmNc2xmnQinIhOP7AzcyQRsY5v
         lqn7zwmfmdubH2KxAQfhyz5qezeNEBA+Xa+lXA/MHk6K6HgPVv2tfrQ5jc/gP1gtAUyD
         QGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=oaCz9FAobFX+cqXKdeVDaXGsBDT/dh6s+LEZD6XoqC0=;
        fh=pzxEp6WoT5BFr4ggUdZzOJLPuH0mQbY+hDcMazqt84c=;
        b=VXb9BLEzaAyCIRjGW9+ZLKGPoHu0LrwkaRngY8jkhuyzQkheXYQXVUqWJA9Zvj8HmA
         f7qjNt0Y2CqtE1yl5sHevaUMJ3jsOseNsiMsuBES3EzW9/pyjAHifdysUI7TH73+mHkM
         8RIzX4t/zFtotUOJMm0MMuMlBsLUUDqnqMIl3TXWRyWaJo7Bxa8UhSWM5bL9C5uQCBW9
         uYJSXQN7rsmXwmAbmjy9O2/k5qL8Ww4EOHqE++h0u90Q7D0SqBXE99QGVdlocI2aW9eL
         hfkvK52p0ZpNWVrSFHmrIcvpWX1QiL6pwrDpFODBtq/R86qhnUZ0AXit/j1ntAjKYlkQ
         raSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795490489; x=1796095289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaCz9FAobFX+cqXKdeVDaXGsBDT/dh6s+LEZD6XoqC0=;
        b=ygdhWyXJ2CwF7ZVtnVsPGbwTCnWx5ht+tzkPURyfSIv2fLnVMEViXq2doQdwo9o6Lq
         eH7t66NiHQZYgp+dYLRHslcGfwdcPzaR3DkWd/okPXArmZZvfzXTLAzcnqyUhRiUZvr9
         mvqR/gG03w8CR8H502UE9jqgMs/5Gx/XvHvyPbpg3m3BuGqtZ/myYh1M9kDLmBHeUho6
         lgUSCL2/TVdEUYz39dpaWLIOomLcQs6btSQ5ZMpqXqvOBzN+L0WwnFinvD3pW5uEq+aD
         4I5IjpVfqkY/GqZkVsLmaIlm5CEmy7W8TXSAkBfQ30IUGez845V/cl1x5HcA1X4jg96Z
         wGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490489; x=1796095289;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oaCz9FAobFX+cqXKdeVDaXGsBDT/dh6s+LEZD6XoqC0=;
        b=a6v2M9BMe1qLDBVk+QNV4NrLBuHX2X4OMs+tyO3tHfxO8SwsmwH5zBukX6ecyNxidn
         j5YqUq8wcJ7Jjw+RyTckSfTNBib6eDUCzh10PfgNpDI4l/5diUOy74XMiJbWUyq1MSQZ
         9IGf1dQ2LSTorZUcJY2vaJkwjlgezvApEs8NAYWv9MmZFm8jrR8VvUefUyJXLdoZbkNx
         0GxlQti1YxnOHs2UZcrxC7KqTrV3gY85BooI5x4OOlarJzDmGFF2pEgqge9ysA7mO35d
         MFCb9ETLW8x3iSWTV6w3Su1C+mb+/8/Gz2pWHyVYZnOSbY1ZiP2rSVOOu4tMlDCEnEly
         ICOg==
X-Forwarded-Encrypted: i=1; AL+hErG/oOfKVbIOznSlibj42yEjIQCx6rANhOkrQYsnLM4JXbql23Mw0AjUr6R3wLRPIz1h35Nkrek=@vger.kernel.org
X-Gm-Message-State: APuU4Z83q1nF85AdMti4lzlepGrBaMufpqlAA/60cL7wef47MU6TSyRI
	fV9L1UHIFU3VU8cJZ7060z17VYGcQj5mu7nMunxzrk6g4yqWxXUyWqdyj+1kYSPOKXocHpsAd4C
	yCW4VJlO6wUF5tA9LC2UjxYvnz6RcIxY=
X-Gm-Gg: AZFdTZctVCCWLoHfEKMCO3jBVS22XWGNCNvBgoiUFXB0LUXXtZyir/o5aftLMvHqt85
	+1pOKnTtcYbFzD9FS7WkxHiaytkqK8F4VMu28ZnHjC3SD2v1ofbc6EJxmatTAMJvsulNco9kX+X
	C6GXcJFh64iJH01hX+AGl7n/uKIsec8bU6mpccEMifw3dX+DfrwHwjl0B4y4ikaGf1yn46GlSH+
	pCvT3V7EaN0sCRoyjE6GsWVHSvwTBREXeyIn9W5cTJhkbIz0Rj8oK21SqqGkQB4LPDvgX60UyBy
	+9bGmC2Erz91Qt81W6ThL+GEyV1BlgGymPjQDNSKGZWWRhaiZHQUlHr/YVs53F4n9XQuwVMf9Bq
	xRrSPrKYvbabNAv4IHTBxHCGuQhuT3Hygezw7
X-Received: by 2002:a53:ac90:0:b0:67b:f57b:e83f with SMTP id
 956f58d0204a3-67df447f272mr4806179d50.84.1795490488933; Mon, 23 Nov 2026
 19:21:28 -0800 (PST)
Received: from 723974502065 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Nov 2026 19:21:28 -0800
From: Qican Ma <goonsomeway@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 19:21:28 -0800
X-Gm-Features: Aa3M54rNlXAI5CQumPMU76HNcv4d3a5IJ4JIzap1D3akCM2UEOumxiswycw6PKQ
Message-ID: <CA+OT+OPg-vtPQxO-5dqLo=DGe9yH_k3m3sM8oyE3yKHHmTskVQ@mail.gmail.com>
Subject: [PATCH nf] netfilter: flowtable: interlock NF_FLOW_TEARDOWN with NF_FLOW_PENDING
To: pablo@netfilter.org, fw@strlen.de
Cc: phil@nwl.cc, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
 net/netfilter/nf_flow_table_core.c    | 8 +++++---
 net/netfilter/nf_flow_table_offload.c | 7 +++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c
b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9d..fcd37f7a37f 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -578,9 +578,6 @@ static void nf_flow_offload_gc_step(struct
nf_flowtable *flow_table,
 {
 	bool teardown;

-	if (test_bit(NF_FLOW_PENDING, &flow->flags))
-		return;
-
 	teardown = test_bit(NF_FLOW_TEARDOWN, &flow->flags);

 	if (nf_flow_has_expired(flow) ||
@@ -594,6 +591,11 @@ static void nf_flow_offload_gc_step(struct
nf_flowtable *flow_table,
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
diff --git a/net/netfilter/nf_flow_table_offload.c
b/net/netfilter/nf_flow_table_offload.c
index 4365859220e..402a46e1645 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1088,6 +1088,13 @@ nf_flow_offload_work_alloc(struct nf_flowtable
*flowtable,
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
