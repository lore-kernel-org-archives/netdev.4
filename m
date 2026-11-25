Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604651;
	b=sF6LRUXQetbCXr6cL+aSLnjIQWqJZOBoV/fn0KSe3cikKJbi5VZyCpTySYlll88igL/U
	 fd4fLNv1wnsRppOC2rnwW9m0Ofcug4xv/HZsg7EEUoO5+aP7QxjZKgFXKaArRkJkISyCK
	 lZCE705GNNHVnzmcBsKwS0YL00VpLvoPCMMwclxpOjPcMcPHrLuE4lSMxOtxNZh7jbg6u
	 UrXyvRwmQ/bWBEj27aTmKqivDBNEmSEEqW/MP00xFg0KTMK60x8gIDqIbvUwQCXafmsN/
	 /0CmM27d/Otr4nwSGEQs7JKGXb0I3xwVFE+pixc2v9QO8H6xaY1Q7oAYyspRyQThIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RI1LTDKM6gU+kRJPf9idiLjvZjawI12ooLY1rUsEH3o=;
	b=uTgBEiIW+M2HgNFURTYlMPfseqJHSKRE7vpK52xJrhaIJwFOBoNjws1pnlsDy99KO1pJ
	 NCWD+fRN9Mc7D8zzVT1qGT8h/WCVzPI2JrBTNf/HznnDKw1XJmT5MJ3Uc0XMh8a3xh3q3
	 gk9nkey+tJR6l+bI8sODxKpjMyiv1pchurGByL0m4/0uJWue1HwgVkSOtPMWgbdm4A9ww
	 sFhIoCp5P6hR6szL4XeZhCdmb+RXvOosarz4yomqkJbuY7xYYuggMJqBEcYFnSp33ZCEk
	 Wx7le3BgebcFWd9BbZlG1LAQQSb0DrAyFfVlsLyh8cm0GKTRHSix5YrE9oK4Sji+J2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnEjP8+p;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D318606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D318606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnEjP8+p
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so1896882a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604651; x=1796209451; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RI1LTDKM6gU+kRJPf9idiLjvZjawI12ooLY1rUsEH3o=;
        b=LnEjP8+p4UK0lWeePSgGhKWnRTKvVH9GGM5auKjqmHZVbkYUwrw1tu5WEHpvgGrOiY
         o8sIQnpgx67Z6++oGBfDABLtXV8iOA6wHSitvFpYNfQAP/4wt+/FG08ijmJVyD4SVgzF
         sRv3NidpNTNXBjC3a9fUP2aOihlLb93zu8q+LehWcCsjR0TKbabvJXYw45E+G4bXnV2o
         AozNZ85bhEkFwRys0rQ9X8Mvil/wQg4Kofg7NZd2m39DnUoWiNgZhAj8LhnyTSyJ0z72
         FgESwEn7cULNzUdN/W5WM0ZG99EIJRVEiisKJWuBvFhiE/YE/BiZKvvKLDg4xLq1VaKf
         CdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604651; x=1796209451;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RI1LTDKM6gU+kRJPf9idiLjvZjawI12ooLY1rUsEH3o=;
        b=DV4ss+H6/IJAsS4aK+3uLYl3jYYdOtQDhRa8rJxAgbkCX4x7YA/9ZsxHbX/2Eu3ytI
         0FOIpQ9fBf72YeZCdjHZoBvf6s+SY8TyW36ruTevqQiy6SCFiSMswHvXXXjZAUQ+jyVp
         pDgimiV5mbGP2cTpk7WfCIsADTnsvLfvGXWIQjeQsVYqChD0vqxrTVq9yx6gYJXLaT4v
         Dx4S+Mi73rq7729kbTQl37sEhEBkOXD1bwYLDEtkgYWn0DDBKb+gFGOgm1TC6Pumh3uc
         bJFVNl4PrtRvPyEmNDAfh4RVhpCBq4KzufAZtK+raB8pnz4NZauMogPjYNX4Vl8h/e7t
         x5+Q==
X-Forwarded-Encrypted: i=1; AL+hErESL87ZFKya8CZbhOVQeTu3HtsXsCl028tnr7YnLsat76+CrlFMlr3b9ZLWSmgn6uNizJ2G16U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ST1EoJxgbLPeMLowajZ+J3FV8pSctDdbcw/FUoWgAkaZ+Fu1G
	2X7cPDhR+pcxYDoVIfTMTnhOEAJWl5iB/i0UaxPy1JrC3uwSfBg+9bKi
X-Gm-Gg: AZFdTZcNRnLyM8ZXsTOp95CMhdmiCoFVZRyPN+LPZ3u33lFPH0AP/iKZUcRX78la83w
	9gEfKaau160w7MYKeSvTbYTFAUd8qk0Oww6RstiX7sJEKA3OKznkhedSHjBDOFWRwr6ggOUu9jB
	ByhCpo2NDT6dhVkED290biSkOET9to747U0Vn9QKV1PXWq4zqtXyFL6UidWIV4KECSte8V/ysDD
	bmoxsA/7/hHFYBkQ5P4sBWM+CiU0x5sIVTORcMYzVbMYT87TRZgm1kIOqx2OMP3P8t0tk/PIyip
	mZN8CtKPXA9RWCARduBdo5gYmTtgefdQvUeI005p6tO7/+7kJEGH2yYU9eEUgRp3Y5ISf6XQP+2
	RrfL2TmJopOEl8ycmMchfqiC6EykcsFcfG+I6Ra62QhubhnPkLWCKvLGTNWP1626/OKLkNf6R/D
	UB19Uh3knWHFvxwhE9pCoOrks1BkHWaYOxLEO+LE1Sv9XvsYRZ8t2zcX+NkO9dFZYu7hgic21q0
	lNLT1uuGL7YkYAnZsm2A0HJy0yv9uz6nyP61LpdSKBO///L2I0MtVPJBDus19Z7KFtalpaWZVvB
	OzAgwFpA8yE6EA0ibTYT6uVHb4uPYuhNG9bvtm4O8hpBQpQqKxlkX9q4uLcxr9iCly3GvH1dnB8
	LIJxSrBPI0Qq4vWswBrsj4mKg2fxk7aRI+/Ck
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr15854965a91.55.1795604650485;
        Wed, 25 Nov 2026 03:04:10 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm28178398a91.12.2026.11.25.03.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:10 -0800 (PST)
From: Qican Ma <goonsomeway@gmail.com>
To: pablo@netfilter.org, fw@strlen.de
Cc: phil@nwl.cc, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Subject: [PATCH nf v4] netfilter: flowtable: interlock NF_FLOW_TEARDOWN with NF_FLOW_PENDING
Date: Wed, 25 Nov 2026 19:04:03 +0800
Message-ID: <179560464380.44975.9475732143161255806@gmail.com>
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

nf_flow_offload_gc_step() checks NF_FLOW_PENDING once at entry, before
the teardown decision that may set NF_FLOW_TEARDOWN and free the flow
via flow_offload_del(). A concurrent caller can set NF_FLOW_PENDING and
queue a FLOW_CLS_REPLACE work item holding a raw pointer to the flow
after the early check but before teardown is decided, so the flow is
freed via RCU while the queued work item can still dereference and
clear NF_FLOW_PENDING on offload->flow.

Move the NF_FLOW_PENDING check after the teardown decision and pair it
with a full memory barrier, so a caller that sets the pending bit after
the barrier is guaranteed to observe NF_FLOW_TEARDOWN set and bail out.
This complements commit 0abb54363974 ("netfilter: flowtable: do not hw
offload flows in teardown state"), which provides the caller-side
teardown check in nf_flow_offload_refresh().

Found with an LLM-assisted code review tool and verified by inspection.
Build-tested only; reproducing the race at runtime requires a
hardware-offloaded flowtable device.

Fixes: 7c549fb7eecd ("netfilter: flowtable: generalize pending status bit")
Cc: stable@vger.kernel.org
Signed-off-by: Qican Ma <goonsomeway@gmail.com>
---
v4: drop the work_alloc()-side teardown check, which duplicates the
    caller-side check added by 0abb54363974 in net-next, per Pablo's
    review; keep only the GC-side interlock. Generated against net-next.
v3: rebase onto net-next with 0abb54363974 included; note how the check
    inside work_alloc() complements the refresh-side check and why the
    GC-side barrier is still needed. No code changes.
v2: resend via direct SMTP without line-wrapping corruption in the diff.

 net/netfilter/nf_flow_table_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index d5652e45ee04..7b11c4935aa5 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -580,9 +580,6 @@ static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
 {
 	bool teardown;
 
-	if (test_bit(NF_FLOW_PENDING, &flow->flags))
-		return;
-
 	teardown = test_bit(NF_FLOW_TEARDOWN, &flow->flags);
 
 	if (nf_flow_has_expired(flow) ||
@@ -596,6 +593,11 @@ static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
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
-- 
2.50.1 (Apple Git-155)

