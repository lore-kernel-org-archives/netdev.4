Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785076;
	b=iNhTk3qURydJNVhfbEkGF44aY1GoQDT4hNAOJtSLoiHwdcY6w0RUbUoeQCO5Ds+AHkSf
	 YkgE4/QoltWirwjLO79gGez0KMCrMTWoOuajviLjy67duITYB+D6b2Cm6EGWqUc5MLOWh
	 /+6o+yVah2ZAFPPk9IEBvhMRJI2JOwcJ0xa2hRbZpevm0IaHG7ukF7MRokiJs4WQ76fKv
	 v0vMturb0s3Oa0OR8B9Ue6so1Ik7XNybvAMoXce+ueEsuvITnkRbBAWas2fTseLjxFpjh
	 7VFxGGtofVub4oQcu0LKccERl3uZu2Kj/czaw42fm9cv8ygKaiUvfUKjqih7dtJ80IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785076;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=nJnEU6+MtRQRQxuHA4iNwQhIPtw4+yFeYhV9aF0xWNY=;
	b=vun1MRqVzqVkKUBk6E/WywTbOpq3Nj48e6KPeBKkvPBSdq1qZhCx23+1AZM2Te9FObX9
	 w4kZCg+D+DntMTGVPrcdUybMZEQjKwYw4lWd5uKDfeqVLSJPAd0gDCopCJpHxGS1IKg+c
	 F3ZZwREzu9HcbPLFvlNVbXu2Zcr+KsP0qWyWGvQB3f5I27Mv4BQtTePFG14HbWSIK7lRv
	 hI0E73R3L3jst6I4lmTwWeNd6CHbjPYVUtHLDQ1qWtSOGBNdLdy0gkfTA+Oj4tHtzj+vD
	 oUIJeOMr/+RSTs0N6D4GXQ7V9DxWhNFBOsYNm6YNdKv+aHlok4I0CbSVichPkBC4Hjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh78YCip;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D4606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jh78YCip
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785076;
	b=Lc7fz46V52MIKO/Dnw0YpMS2OVvNC3Gmu2TlbdguDMl/w5OaU69AplU+l9inavBfQ2rk
	 RfbAa3/66n3o1WVEfHBw3y79Vdzhh12gNWuVLD0FrbPyy6Ntm3TbD9dpVuiIHlRHM3uG+
	 8HHGgJRsbfexYolZJ1VppzCpfCsFLzokKFb30aVueZHjC2v+g/1Cqc9o8BhS/I5dhV1FS
	 zMeLf1YPnkXUhKV1fJbfKXSOMZFpNdsoBUIMoMbA4zr1an9vDbojgh/QicWILkfr5rIlT
	 DUWmpCEgEufHPUK1mxivKAxRO3EAaomZTaH96MXCMyCeLiqUritU5KAmclp8e435yPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785076;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=nJnEU6+MtRQRQxuHA4iNwQhIPtw4+yFeYhV9aF0xWNY=;
	b=cpmgw60N8pNfunCgGZ40pzNXlz53h/ZOhNu2c9731ygkuFp0RrWjulvm/vs4r9wmhwy6
	 q14euIWeTQhWcq2LvlDhStqNxc7LPevYktN2ac4hxYfVUKneZuYMAGj+atXBeu/prdpWq
	 6C8K9z1b/mQnpowqZdlO0/SIqcpCG/O9E8BUvkChzR9Q9xD8z7rLmNYwwDN3KL2hH6pkb
	 1qSIXVZy3RBO4zWr15dtJa9MP1e4/saVF/3wlBJXroby1bUGsS5TJj6aXwYy+wf/qmX1t
	 9SxuXPqXQzBJxdje8gKro/bNcUsbG5JQLNtIG6+aD8h/yEa7VTJbhT2yJFy7qx/iSVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A3581F00898;
	Fri, 27 Nov 2026 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785076;
	bh=nJnEU6+MtRQRQxuHA4iNwQhIPtw4+yFeYhV9aF0xWNY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jh78YCipXBdhNu7fHAvy9hjPw9XpkK9eoRpwJWayicLxqAExZ4ZA+keEzsCHiG+Ps
	 dQ9Dv+UvI/5spbz/21m8cxNRfzWahOfBhX3IBEAaus8ywNPmXgHsaIWHL/E2dt1TWI
	 FsC0n2RUs5Ouz5RM9tMMCIPXfSP2pPTLNtcUWs3mk9jePTXnYlqDBf4O2ot0RyEyvq
	 IEYQZbeJJFT6KrrwzSZ28i6XjZFNa3W/c8RtPMfvINb9iHFzfSS/f8+zbemWIOnN9v
	 sDqqHZt3K+kHg7YkFd8EPeRndnxXgQiZzqjwXfJI8vkconDvaM9crOGg5MC7X3JS9N
	 qRSuUhClZzmNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF6E24B7D2;
	Fri, 27 Nov 2026 13:11:06 +0000 (UTC)
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 13:03:36 +0000
Subject: [PATCH 5.10.y-cip] net: skbuff: propagate shared-frag marker in
 skb_zerocopy()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-cip-nfq-510-v1-1-100519287635@certik.com>
X-B4-Tracking: v=1; b=H4sIAKd/CWsC/02NwQ7CIBBEf6XZs1uBBBv8FeMBlsViDK1Qjabpv
 wt68Tgzb2ZWKJwjFzh2K2R+xhKnVIXcdUCjTRfG6KsGJdRBSjUgxRlTuKOWAoMejDDkjSADtTF
 nDvH1XTuB7qXo342H8y8rD3dlWtpco50tjC7bRGOzCie/TNMNm7//u4Ft+wDJKdZQpwAAAA==
X-Change-ID: 20261127-cip-nfq-510-f57909cd90c9
To: cip-dev@lists.cip-project.org
Cc: Pavel Machek <pavel@nabladev.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ulrich Hecht <uli@fpond.eu>, Zizhen Liu <pointerliu@126.com>, 
 netdev@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784615; l=2684;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=xm+LCu4gjgfqDzef9HZ1mCC0CWg3F4chAeh/3bn3m3o=;
 b=bCBVOHJwDqFzgtH634XtNE/DPLg1E7QsuJRBEzy4Au4u+0dGmFzcf33JO0tAZxttdHzRQPtkh
 rxD54kxtbB1CeCDMC6KO89rW8SyGCQSvTpIQkbs1l5VCJoUvXlQLD3W
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com

From: Zizhen Liu <pointerliu@126.com>

commit 79dc34beb1fdb3da79753e51e15c68591a2561fe upstream.

skb_zerocopy() moves frag descriptors from @from into @to and takes a
reference on each frag, but it does not copy skb_shinfo(from)->flags into
skb_shinfo(to)->flags.  A destination skb holding the same page-cache
backed frags as the source therefore reports skb_has_shared_frag() as
false.

That breaks the invariant relied on by later in-place writers.  ESP input
checks skb_has_shared_frag() before deciding whether an uncloned
nonlinear skb can skip skb_cow_data(); with the marker lost, an skb that
skb_zerocopy() built for nfnetlink_queue or for an openvswitch upcall is
decrypted in place, letting an unprivileged user write into the page
cache of a root-owned read-only file.

Propagate SKBFL_SHARED_FRAG when frag descriptors are copied, as done for
the other frag-transfer helpers.

Fixes: af2806f8f90a ("net: Export skb_zerocopy() to zerocopy from one skb to another")
Fixes: f4c50a4034e6 ("xfrm: esp: avoid in-place decrypt on shared skb frags")
Cc: stable@kernel.org
Signed-off-by: Zizhen Liu <pointerliu@126.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Link: https://patch.msgid.link/20261022104217.1852191-1-pointerliu@126.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[ adapted to 5.10.y-cip: propagate SKBTX_SHARED_FRAG through skb_shared_info.tx_flags ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
5.10 stores the shared fragment marker in skb_shared_info.tx_flags.
The backport propagates SKBTX_SHARED_FRAG from that field.

Tested on 5.10.272-cip79: net/core/skbuff.o built with W=1 before
and after the patch, with no new diagnostics. The same paired build
passed on the 5.10.275-cip80 tip. On v5.10.275, the base and patched
QEMU guests each passed all eight stock nft_queue.sh checks. The
runtime test was not rerun on the CIP tip.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.
---
 net/core/skbuff.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 207c4d85fad7..56c4805413cc 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3135,6 +3135,8 @@ skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
 	}
 	skb_shinfo(to)->nr_frags = j;
 
+	skb_shinfo(to)->tx_flags |= skb_shinfo(from)->tx_flags & SKBTX_SHARED_FRAG;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(skb_zerocopy);

---
base-commit: bd8b111cdf1d9897bf4d826b7305a9c16bfe5f71
change-id: 20261127-cip-nfq-510-f57909cd90c9

Best regards,
--  
Dickson Wu <dickson.wu@certik.com>


