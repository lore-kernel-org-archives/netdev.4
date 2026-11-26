Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714347;
	b=0Kl8QYRsWcptIkYQspRjJDdaUBYYwXLTRbYimab38xY8wkz2e+doeD/jlcQdhu3bl1QA
	 8jcObY5jXwixedBuWb7hpbTPQHKiDshfnXM+NRY/mqsp/q+TAe0cg1LA3t+Y6l5dS9icV
	 0OGqAYhYwx9dXIzUFQM0b9BxzjZAEeOXL1g9bXpPlGak5XyO5dWX19l9MR3hErZahoQme
	 c6EmXQxBxeOMrdO2x/dOt4Hj9f5V7cqhDLgOiICJr7gDtXbXmG7fGSpQ78HzmJQ3UuRFY
	 HpWNVssXH70iAVa0rsN5NZEp96xtlT4YvJWWdBwdK+FltcK0NWwdiGtkkhWkeWRrOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HGUEFbhyMPHvtc3QryNaymed5lzjFNWIsxM5k1JO/oI=;
	b=JuotADuACPooJ2ebJB4kCXL554DFPNMjzzkVC1yZ9QDbvt/GhqZ0GjBu9Q6CVySR4pRc
	 vdlIFa+//9VEdd+S1Ri5P1CBmJ2bKpuKGpQgEGsIJfcsbE4IO+lTHo6Xv9tuSD0ncJS0p
	 YzQ+PUDSK2COjnGPA+UyXlw5tVH8f/lagOXPbgr/JUoR+FMhWP2qvi5c/ztwb1apqvfEc
	 nfe2qiWOlWT2RmH4Zb0hVTVC++oBo1CWQtLxoYfohZwlyoJhWU2Tw+I+sHGays6Of7I+b
	 nVSTa0tbpdEK1rO0BdA+z6L/9BmLbLwCJmKLuAeJFu42elqFsrhNwEu9W/2gLniOprw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=c0PHCRsS;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B98606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=c0PHCRsS
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso89727485e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795714345; x=1796319145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGUEFbhyMPHvtc3QryNaymed5lzjFNWIsxM5k1JO/oI=;
        b=c0PHCRsSqx+4QTbIaJGYJRjTvVGLARj7ZW3OeaMLrkbBYVJNw8GniuuESSJFDN8gyq
         ioHZsUkpS0wfAldrG2ANQTahQM3Bp2XGdSa6IpjmpBjHiCJz/gaBfU/QvhLQlOkneVLX
         XB7135vdtOWKBlYRDXNvQj9NW/HT3ecz//PpUkH6L9EkahndC/KWA98s/gw3m7eY2uLI
         Rz+WfMc83qk1meAdJaJCrtptlG88dzQnIf4rZERn1cM+A0NgZ5h8b/xjA6wjkQoB6n7P
         RKT9zmXNEGYdR1Hgr87cYPV/nEBs4Jigb2DbxiRvW4VtIQm+kw8Xs/HWRmEZ58AOZP3c
         klgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714345; x=1796319145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGUEFbhyMPHvtc3QryNaymed5lzjFNWIsxM5k1JO/oI=;
        b=cRxefi57DvK9iO8zejFHNomFwEwJ3Tea60aFiKKFOk1uhyoRnP1R9vAe/2yLwlJlHf
         0a18pRR9f7KU/tbJcAdRpHkYTMAJDJNMokQy0Rw1/pBL+bSVY6MteM8Nr4fO1n6dLGkq
         2eSBmNHzDOf+24opVnRRYrMxdlm1qgc4HdTXD82qPHaokd/DrHwT37o2GojnzfdCzSRX
         qFCjR+qNWOHsS04WrNwIrSbLzI24Wi/0xmzSdTxggv6P2VrqBKhGa5729l7shIhAQUbn
         v52gZRRgGIbeoSebJCFm+QPVtSUy0TVcI2LCMFqOQnnnK0nh7iWXfZMk5qME1FJ8Ve8O
         LTFw==
X-Gm-Message-State: APuU4Z8kvBqyqLgczdO1ogOqSA/mwkKmpwRKn05ONtmf4Qom25neQm+m
	PwttfDmLcytOeo7fHYrSKQF/mYqId9QzfLILkoIywjDNc9BcC9vicy+ILMtTsg3ORwNSr58VgUD
	Gzc7KUetzXA==
X-Gm-Gg: AZFdTZfDm5wtNLBkSDKccgWVKOYF1XRTri4OFjjULsvq3ivQSECj8DdeT06YfR11Kq0
	Ie20VPKqjAa5dJEuL8A1cOLbk30MRCRzb7Ln3zkygseAYLrbYliVeGiLi43zArPnq5iAqQDzUDm
	NofOq+XTQf0pzCD+1+4dknH1qRW2huUzcgXtJn1inA7Z5vsQI5KwpPg+BJPSeQGOMV20P6jjsWC
	oCqwlD90RKJb9elAie5NwEVh6zRr4t59i/BMgXE06vSq2vuwr8kTo/ELuTqth6UIjl9L/fshcaj
	P8s06Zs4xNqQ7KHzfyePdAqsk+S/KGH9aZpvEA7iL8cCo1p9ljMt5a2KJ6EhCYTSRlOlOhO5tyn
	2u3B0j8n1SSJSpZKKT2l5JPJaR+KSKrNfbrD59hvKiW6RH2xOl+xPiRmYJ3thzuXlrnTbKtTq4A
	zru7R2QdBQQASUUxSv5Arb7f8U/3ssVUlFZdPYhldaThOqOjDO4vQ6M07/S0/x6GCnhxkGmAHKW
	YHH13w1ZBRq8G5nBH1hH6/+1hhJOrERIt87aI0c4kFQ25WBH/fqVmRw7O4N1Ihfwxkof1icMexp
	IZp2i+8P3nZ/nPkrVnQ8klSdoyvvla5cvDiqIo+n3tuE1GHzLuY=
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr417929205e9.17.1795714344564;
        Thu, 26 Nov 2026 09:32:24 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab65cb41f4sm40608361f8f.7.2026.11.26.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:32:24 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Joe Stringer <joe@wand.net.nz>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Willem de Bruijn <willemb@google.com>,
	bpf@vger.kernel.org
Subject: [PATCH net v2] net: keep skbs that carry a socket out of gro_cells gro
Date: Thu, 26 Nov 2026 19:30:34 +0200
Message-ID: <20261126173034.1860377-1-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
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

bpf_sk_assign at tc ingress holds a reference on a socket that isn't 
rcu freed such as an established tcp socket, until the receive path
steals it. ip_rcv_core keeps a prefetched socket so when the assigned
packet is an ipip, gre or esp packet the socket stays attached after
decap and their rx paths pass the skb to gro_cells_receive. A socket
that is rcu freed carries no reference, but if NFQUEUE queues the packet
__nf_queue takes one and switches the destructor to sock_edemux, so the
skb owns a reference when it reaches gro_cells_receive as well. GRO merges
skbs with the same skb->sk into one flow and clears skb->sk and
skb->destructor of each merged skb without calling the destructor so
every merged skb leaks a socket ref.

Send skbs that carry a socket to netif_rx instead as gro_cells_receive
already does for cloned skbs, where each skb is consumed on its own and
no ref is lost.

This also diverts sock_wfree skbs which GRO can merge when slow_gro
is set. They only get here via esp software GRO, e.g. from veth in
napi mode or netdevsim, and those lose GRO.

tun with IFF_NAPI passes sock_wfree skbs to GRO without slow_gro so
gro_cells could merge skbs from different tun queues and uncharge all of
their wmem from the aggregate's socket only.

skb->sk shares a cache line with skb->dev that is read at the start of
gro_cells_receive so the common case adds a single cheap test.

Reproduced with a tcx ingress program on a veth in a receiver netns with
an ipip tunnel which assigns an established tcp socket to ipip packets.
The sender sends 32 tcp segments of one flow inside ipip through a netem
slot qdisc so they are decapsulated in one batch and merged by gro.
Then the socket is closed and the receiver netns is deleted. The leaked
socket holds a ref on the netns so it is never torn down and its devices
are never unregistered:

Before:
  bpf_sk_assign() calls 32, sk_refcnt 32 after the burst
  receiver netns deleted, 30s later its veth peer still exists

After:
  bpf_sk_assign() calls 32, sk_refcnt 1 after the burst
  receiver netns deleted, its veth peer is gone

The problem was found during reviews of patches that add bpf_sk_assign
egress support.

Fixes: cf7fbe660f2d ("bpf: Add socket assign support")
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
Eric, I didn't add your reviewed-by as this is a different check.

v2: changed the check to skb->sk instead of skb_sk_is_prefetched (Sashiko)
    changed the commit message & subject to reflect it
    rebased and retested

v1: https://lore.kernel.org/netdev/20261121160204.4024204-1-razor@blackwall.org/

local Sashiko review says:
 [Severity: Medium]
 Does this regress GRO for sock_wfree-owned ESP packets?  A veth NAPI
 packet can retain its socket through ESP decapsulation and reach this
 branch.  netif_rx() then delivers the inner packet without another GRO
 pass, increasing receive-side work.

 Nik: That is understood and documented in the commit message.

CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Joe Stringer <joe@wand.net.nz>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Willem de Bruijn <willemb@google.com>
CC: bpf@vger.kernel.org

 net/core/gro_cells.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/gro_cells.c b/net/core/gro_cells.c
index 31352cac355c..4bb7316a8be3 100644
--- a/net/core/gro_cells.c
+++ b/net/core/gro_cells.c
@@ -26,7 +26,8 @@ int gro_cells_receive(struct gro_cells *gcells, struct sk_buff *skb)
 
 	skb_unset_transport_header(skb);
 
-	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
+	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev) ||
+	    unlikely(skb->sk)) {
 		res = netif_rx(skb);
 		goto unlock;
 	}
-- 
2.47.3

