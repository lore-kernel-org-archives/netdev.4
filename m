Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795277039;
	b=kk0NZTfQ7+TB5zL0LxA5H+60hcxMqwnJMvlW/wSWgF8uVz1y/BLOgBXl5eweBP2j/e/6
	 68nSA9lLsVQOUKbz3a32gOS8VP8wlGA2ozlJ8NrtQxEumvCgm5H1GE9Cenz/kVoaNHDyk
	 IBcgoHkAA17/3Fcr5GmPXKN04OK1+0pe6ZSiYtlJ6w5E45fsv8Hm15PW/S8Pr20WOPRtu
	 r8NWZpxOCnEEHKZ8pIkBDH1MPecMw/dWoXPQCn+5WEk1okbn7oRs9WftxidzUTXH5N+F3
	 yB/uA8g9hAheUP4V/moWrirWQWcDQaDG+Odr9C1t+0TFspSP2HXKvodbUklGzIsYKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795277039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5QdzEuTi+4UKBT+/YqvcdZRVWj9ymg25bD/LvLIywzA=;
	b=fCovmCsjgmCd2MRiCF8+RDyT0FjpkbMNoccgxMgTyAmnylqJnFgd7juMUhnMhgVeB6Rb
	 vD8RWvw0gCzdie9BzOMDVWGMVrv1NjfenLaMNTwz/cu07Tfug9x4u8LKtmie3imnbofEq
	 8b/gnvTZAlNViL9dTCXwIWH8Xvaax3TT9y6xvuW2IO1/mzE4oYb8ejwZ2M504sh8opRTM
	 iW/D11h3ZkAl9FjzCXm4IFcYfL0EVzuVhcXYVeCgb3xP300okYo061O8pDfNaMPEGV+q6
	 KMr5IWHWoyQmAbISUP2wOyHHrzkqGTnxG+C88m+5o0PSSaPDTPliL4RSmnlY3bkSaGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=XHI+1v5D;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12F606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB12F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=XHI+1v5D
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18537375e9.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795277037; x=1795881837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QdzEuTi+4UKBT+/YqvcdZRVWj9ymg25bD/LvLIywzA=;
        b=XHI+1v5DKeTpstUjmWCsHSaEer0ErGEJyETi/mrY46CAkAADAMuR+SGE6uWGmDkITc
         FxpSdBp0rXjLWdtjcij6EJdpK5JeHq9YE05RGHmgvtBtjPYQmwmvxCXfHDXgKjnMjEY3
         1WfrIZZyJGCQEEY46fy3wLFbLVOnumVmVWJ22r4o5M0pGygk96DYA2IP4nV+BbM1kRhN
         FzmMPzgHnbpHTCOqhf/ak8csoRZ7nq40JzV+n1yw7sm+I/p+VMoW0JfGOytKta8Zs5b3
         hwHGrWAIQCCZoDMBvWQ672fYw7mwGRQ9ACzNnXZjUWp/YynQZHOAgcgUfziijsFQA8tz
         YMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795277037; x=1795881837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QdzEuTi+4UKBT+/YqvcdZRVWj9ymg25bD/LvLIywzA=;
        b=AUjNW+f/5oVbBayBH97R7M/x1y2SothrN+9BkRX4DCNe/iNqpo6jVfLjd+WE7JWe67
         thq4g7kkM5qTQA35AivB/3sNihIEKtvY7/Cyw9whNxkdfWlHzt1oETh5MGd8EICZ/F6n
         P2OgQNJbi1x0ot9aC9cZC20j3gzWgfU0T9KnMjRc2glWWPEJK+C/0xVi7CRzv2rlbLRL
         g8ecNYEVezmY2/K29gsrG2ZR+P/rifmkaV76g0TXfjccjoVkAgABDAZ4Z9YnoezJOmQD
         2aO0leMZjh/ysyh6kznkmlC2lwJqh1kvcjKvwf3a7v11pKGRDySLbDBlDykk8Ax93i9x
         gJBw==
X-Gm-Message-State: APuU4Z8wVB2Vmv58Xn7HzRt9hIGIaBSMV07KSglBj5cMoYQsKw7x3Hoq
	Ex7jK0hlhRsI4yAGr3IMFm9u/9ZObHSrnZxz4D1TfBfLhD7GcMeyPisxK4j59pInbwi4d9UEFyc
	f5k+AgDeTaih1
X-Gm-Gg: AZFdTZcagcRXipk1G1u27T6WtJJGWnkPybRi/v5g3PQLSqjCs8wEXYgbU7afS4VN/50
	DTGRTPNFj1aQKvVEOCykWFe7R9S/R17GRsNjNPUhxBZVTZSKR5dy6FN1uffH3ZjJIcOJilsxY9U
	RROxP6mPUD3jHYpy0536pjAE4XyR0n3moZi6xhkgrwaDlhyLDyYq4Bf33aSGUM8Ufd3Z1az4NP6
	yBAbd4XPfuByLjg3etFm5dN3YjfRHKsAVu+aK+U+No3Q1Uj3HGeXld45LqPyQ7Sj/hnOxx1WoKR
	HK9CgHajOzYJg/kgn0o4nvFuwIKRSJ++pF7b1/KmYM6vi/oYNsPNRNSW1GvmPu8KuvlAERlaQE0
	PNh8FgM9nrV5JaYOvvmXCDqXSjIgYwcN/0O89P4Rs7EmoXGRnrBAOZvm3kpZKFk0hnRiDrgcK87
	qMkz3jWLcv8hRg0WluT/DIlJ058luOelChROKd9YtODgl35MaICF7FvIwBjjj5OFcM+4iXiVwUQ
	2pGJxuNsVrlDLrGhyaJpo+HVxwnQIBh9xHgEaP7Dy0MvYsHPnCp/FR8u+u2tKQLiMlJ1gJIukVx
	S68Vl6HoOdX87wJEmMJHNpCYKFln6/93L2bJKopE3+EGZtBDEdg=
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr141164155e9.31.1795277036426;
        Sat, 21 Nov 2026 08:03:56 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b216esm227175685e9.12.2026.11.21.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:03:55 -0800 (PST)
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
	bpf@vger.kernel.org
Subject: [PATCH net] net: keep skbs with a prefetched socket out of gro_cells gro
Date: Sat, 21 Nov 2026 18:02:04 +0200
Message-ID: <20261121160204.4024204-1-razor@blackwall.org>
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

bpf_sk_assign at tc ingress holds a reference on a socket that is not
rcu freed, such as an established tcp socket, until the receive path
steals it. ip_rcv_core keeps a prefetched socket so when the assigned
packet is an ipip, gre or esp packet the socket stays attached after
decap and their rx paths pass the skb to gro_cells_receive. GRO merges
skbs with the same skb->sk into one flow and clears skb->sk and
skb->destructor of each merged skb without calling the destructor so
every merged skb leaks a socket ref.

Send skbs with a prefetched socket to netif_rx instead as
gro_cells_receive already does for cloned skbs, where each skb is
consumed on its own and no reference is lost.

skb_sk_is_prefetched tests skb->destructor which shares a cache line
with skb->cloned that is read just before so the common case adds a single
cheap test.

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
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Joe Stringer <joe@wand.net.nz>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: bpf@vger.kernel.org

 net/core/gro_cells.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/gro_cells.c b/net/core/gro_cells.c
index 31352cac355c..8c74b2a1227b 100644
--- a/net/core/gro_cells.c
+++ b/net/core/gro_cells.c
@@ -4,6 +4,7 @@
 #include <linux/netdevice.h>
 #include <net/gro_cells.h>
 #include <net/hotdata.h>
+#include <net/sock.h>
 
 struct gro_cell {
 	struct sk_buff_head	napi_skbs;
@@ -26,7 +27,8 @@ int gro_cells_receive(struct gro_cells *gcells, struct sk_buff *skb)
 
 	skb_unset_transport_header(skb);
 
-	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
+	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev) ||
+	    unlikely(skb_sk_is_prefetched(skb))) {
 		res = netif_rx(skb);
 		goto unlock;
 	}
-- 
2.47.3

