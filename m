Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703208;
	b=qcvngE7nEX4PGTJhBdp4cKnSc1+0IeoInebx15zphNzqBiogLBJ+gkwk3cQ6OwD8aWBh
	 xW/jWPODAtM7C8f1BeNe157EBvdPxuXLVd2a2W4czZRy5OY/hMJ8bPJSVeL1+/Wt2rCNH
	 5Q5JuG6WiZ9eNqycDiDqffnZDkWYoEOIRRL2dvW0aeQwdKqgnUaRme8zIWXIMuuEdDqk+
	 VLbhgc98JAHtyuIeNOBGdE9H49d8Tm7SiAotTVlp2ugkZvzSMTM53jk/DhepAZPpr3qdv
	 BDa3VlQW9ycztelilhsN5GpspZAgDUh31dohr74xD2z+iW888kX4eFhOVu9S+awn0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
	b=AiSaj32k6UP2HHJ2gwwzGeoGdYSxJOgC8azK3l8vUV1zXy6ZpTuho5MDa2x9srG9bcnG
	 a4yH0O9DF8DmAgifEWmaklpSyxImLjfVU182IYXKeh2CARJVePJjeWojIH3+rxi0/Vd5Q
	 QJCyKcKh68PWYsFNgfSCz+xFjtOoING1bTCQ/0jZYDbzQXETQEby6bCyUbZ/RngR9/xWM
	 s2OLLv0wrxQrIm5971OvubH1yiitbDbAsEz5zsrLcudEe9CN5ML4H18y8yhtbb+xfJe8y
	 T5Ef1bXu6CyOsG/pgucGOz3ngSBbSKLPLHlOuBsguQXYm5Rps0Y9fHtDgaKtWmJ/oLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+FuumOG;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A790606A89D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A790606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q+FuumOG
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so5117137c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703207; x=1795308007; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
        b=Q+FuumOGIxeLSmXWXt3zAZM3NE8DXetRicg3BZZ3uxe/rw4g9OMn//8ussnzJp+/l+
         sE7VLAThwrDIpmLp/nq219EUXCTbnbaaqii64Lz9dNwN9J6T0z26XFoM92WJP7dA577M
         ZqzyOHU1tkrF7OorCfu4L5I37Wv+8Fmejf2if1V21YnTRSCBygpt+ncZxIIn+NISB0dF
         OtZrYzXzAXGSH3aLp24hNzrGXCK0qxZBLcg01B9q9mYW2CUmOig2Lbng9UkLe0pK+Qzi
         dRGxGYfjNUChynNl/ze2JDFMU4dSwcStnKBBrdGa1M5IVdulEWsxCYu2GCC29IF6y1ZW
         Sn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703207; x=1795308007;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgDDWaqaaS/aiO86WDODrYk/EL2uW+1mnI6To16WgSk=;
        b=WPnZ0s7dvrbMHMXDG/Ex8Uej7cipFcz21dzcRj7JwTtDSjns+xzZA01UjSolrcTyv0
         JkYfFV8UmfNZHpuAvLGiWkpXJTnQRd1ipi/flc5oj4SrOMBuHmuqfokdXwm1zuoz7FjM
         cIvTtRUXVzpLWOlvZO5xklqq9TryY+O7rXGyPYqmlmFiyldw/6afQkLrSxows68rDh+4
         31QUHNxLSOGxx5bg8eoKM/lcPboMatuUJRlbp1VPnTLr6dHnF0sbhMcd/xMwQDVzp3qS
         UFYOUzd+Y6rbioLYnEtfxWzoAqtYYGhJs5XrRMS0+luLNzGzsoIqU9MncfxyUdnuF4iE
         cFlg==
X-Gm-Message-State: APuU4Z9OnzDirLJEALuGprDn4dQHnu494jl5kX6AVCw0czuRFSBh4IBQ
	hzQ3fPeEEG2UbCq2xVCFCdYxyLnlkUOwOADeqdrhDuCGl9gOa0gLt1OZdw9uecPSE7vQJWrqOPt
	U7i5UPOLp5qKTfNLrA+gge0todMSx2rHznukskFio9tfpknKtrfG6LLhuzl40Zu512NqA8S9Zad
	zoEbY1k5jqsQNUMWd025COy9wbtZMUvK1k0aMyZqak5Mk+tY6L3/5Rlh/+LLMli5Q=
X-Received: from dlbsw4.prod.google.com ([2002:a05:7022:3a84:b0:1af:74c2:e2b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2706:b0:1b5:126c:eb88 with SMTP id a92af1059eb24-1b5126cec12mr3641935c88.45.1794703207011;
 Sat, 14 Nov 2026 16:40:07 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:03 +0000
In-Reply-To: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115004003.3695475-4-almasrymina@google.com>
Subject: [PATCH net-next v5 3/3] tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

tcp_clone_payload() takes references on source skb fragments when
building an MTU probe skb, but never attaches the source skb's zerocopy
ubuf_info (uarg) to the probe skb. When tcp_mtu_probe() subsequently
frees fully consumed source skbs via tcp_eat_one_skb(), skb_release_data()
drops their uarg references and can deliver the zerocopy completion to
userspace while the unacknowledged probe skb still references the user
buffers.

Additionally, tcp_can_coalesce_send_queue_head() only checks
skb_pure_zcopy_same() (which compares SKBFL_PURE_ZEROCOPY), allowing
adjacent zerocopy skbs with different uargs (or a mixed-zerocopy skb and
a non-zerocopy skb) to be coalesced into a single probe skb that can
only hold one destructor_arg.

Reject coalescing across different skb_zcopy() uargs in
tcp_can_coalesce_send_queue_head() and propagate the uarg to the probe
skb via skb_zcopy_set() in tcp_clone_payload().

This is a pre-existing issue found by manual code inspection and LLM
review; it was not triggered in production. Verified with the net_core
KUnit test suite; not tested on real hardware.

Fixes: 736013292e3c ("tcp: let tcp_mtu_probe() build headless packets")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/ipv4/tcp_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 19059d03152e..bedf828cc0e0 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2664,7 +2664,9 @@ static bool tcp_can_coalesce_send_queue_head(struct sock *sk, int len)
 		if (len <= skb->len)
 			break;
 
-		if (tcp_has_tx_tstamp(skb) || !tcp_skb_can_collapse(skb, next))
+		if (tcp_has_tx_tstamp(skb) ||
+		    !tcp_skb_can_collapse(skb, next) ||
+		    skb_zcopy(skb) != skb_zcopy(next))
 			return false;
 
 		len -= skb->len;
@@ -2718,6 +2720,7 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
 	WARN_ON_ONCE(len != probe_size);
 	for (i = 0; i < nr_frags; i++)
 		skb_frag_ref(to, i);
+	skb_zcopy_set(to, skb_zcopy(tcp_send_head(sk)), NULL);
 
 	skb_shinfo(to)->nr_frags = nr_frags;
 	to->truesize += probe_size;
-- 
2.56.0.611.g1030f0b940-goog

