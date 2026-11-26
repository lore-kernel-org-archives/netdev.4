Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661345;
	b=NJrxEVTN6soejik5KqQfkt+RKQmO0T3w+sa8f3yz3dI0YAGNJKuijXp/UD54BkVO0AAM
	 t4jTWHRqPYicGJ8uWIFLu+sHo8+CCFrcdBXtYVAd2asAdcUxNcNW8Us/OKg19hd+74lSD
	 bB1hAarvRNb0pFVWvP5n28novqCuM+gG5ZMbbETbmffQkjA18ujOszd9LbfASKqPx+unO
	 1J9khmqpw+8z/sCLVS3rWZRjh4U20Kn3wGHql2X98EishHMehGr13JyIGamg9/49jeGP6
	 9M38apk0oF2QuAiz7HWYrXb6FCln1hKwuHVLt6sIgUxQy5zrU8fyBSkQQfyx/Ub+DlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
	b=5Bi1KrNHDU1jhUKFGV+3DjVdAJ9PRYWdRxFZjO/aJEyvBkZdfeZYK367KaPSQxKBj97m
	 tcvPIKktbSKcAdXXAjTNDOxQfgWs9cNOls7uxfsRUQ0AW+oKQwrFm0AeZLaLhwFhKncf9
	 xDFJ2ZpRqR9XNvbXYMW1hukD9IcGHT/Fa11/VV9Y+sDuPrnc1sJEa5+tMHtzE70gPyBFr
	 jywAblxlnksNynk5CiB9G4H0aZ5Xww/wBJ0wgulsRI0KGDZ9ijilsDo+/3zB2nN98Yw61
	 1GavGdNKgtXUCJhi7+6iIvTEd8wuEVQ+Tg8SqDLhz2dtkqyBJRd4j+axFdcrkx7uRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sammc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arR7VQp5;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C17606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sammc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=arR7VQp5
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-86287b38a31so6309818a34.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661344; x=1796266144; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
        b=arR7VQp5azQ5b6hju7KGOB7V6ClhAWrxmzkeZ9IITkugl3PI4ByVVbrEF24yrUH6fq
         gstOjY2waspQjNey/GwSzVvsbUD8T9q0ayX5K5WnkH4zzjCUJo+LZRJkh+zDtjaGXbWw
         TAcav06zp001mulhD7+tfyaBOeOHbson4ER5X/8Xx1CoPru8vXL3l7QNrQ7gUL8ZZHk+
         MOZuG4KI+DGoggDorzMITDtQ+nE2R+sRQAVwVp2EdzbMgkMWrNMntgreFThfMJaBiFhG
         v8Tjt5AnyQDc1chclyBragsg/fIiGQkeNe7gXMu3ppDBPCq56yRl3/J4e/Z4jPOiZeg4
         W5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661344; x=1796266144;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5Xf0dq7djJOyag1DG5P/5wzKwC4wT62MOh8WMXjPgs=;
        b=UtEXBoKT6AdmZMHTEuCxNTGxioGhC+yfXS6yV0b2UcI3rab6ewDMEf5i+43wIKjYIK
         qtKw2MMMerOU1BYbdBCaxXVbgAd+u7PICNcw2KOeENLogFzg3tzYn+yV5/JTrARbUad3
         Lr4uGFWS52J49wcS8OfUgn+3XN7EhEjn2JbJ1GEetEef7AA3HPT+lzGEOtuSw54OaLwx
         UaH/I0BOCYevNgu8rBpOFB/TryhAsYBKenu3305qbQoKwagN5REopogxYLGyKceyxRKV
         GFE0+y+SxKZHZVQMBprvoJJ12sUJl7sYLEJv9NHXjn2a7RVT2MbmaHZZZNu6h9ZQlhb8
         gVJA==
X-Gm-Message-State: APuU4Z84YtZaTH+ky52f7IgO7Q+sXYmroq/oLgOM8unYAdpvIcitduje
	UQyBgit34lKBk+2Wt8dnTlIbxXh9Xf75qJ7xFpyRdU0mXHs0bWTTmZM63vL+clcidC0G64lg2Fg
	wLlOkHPwV7lbFmRJGlmMS3ZwMRU6ymAj66EgP4iQVlzUy3oLnmXrJ8xOf1uL3MZg+QMQDH19mxV
	GPNL2c29JzIDfA903rT2CibVUpEekrdSw=
X-Received: from ilqh16.prod.google.com ([2002:a92:d850:0:b0:54f:e3ff:ca5f])
 (user=sammc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6615:b0:573:d802:fc1
 with SMTP id 5614622812f47-57a0a70c27bmr21744377b6e.30.1795661343537; Wed, 25
 Nov 2026 18:49:03 -0800 (PST)
Date: Thu, 26 Nov 2026 13:48:58 +1100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.911.g883d8bcb20-goog
Message-ID: <20261126024858.4013811-1-sammc@google.com>
Subject: [PATCH net-next] ipv4: route: do not allocate unreachable dst for
 non-IP packets
From: Sam McNally <sammc@google.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When ip_route_input_slow() reaches no_route: (from a missing FIB entry
or !IN_DEV_FORWARD(in_dev) for a non-local target), falling through to
local_input: allocates an uncached RTN_UNREACHABLE rtable
(dst.input = ip_error), increments in_slow_tot, inserts it into
rt_uncached_list under spin_lock_bh(), and attaches it via
skb_dst_set().

Non-IPv4 callers such as arp_process() never invoke dst_input(skb) to
send ICMP errors; they ignore RTN_UNREACHABLE and release the dst in
consume_skb(), unlinking it from rt_uncached_list under spin_lock_bh()
and queuing dst_destroy_rcu() via call_rcu_hurry(), which wakes RCU
kthreads immediately since
commit 483c26ff63f4 ("net: Use call_rcu_hurry() for dst_release()").

Return SKB_DROP_REASON_INVALID_PROTO at no_route: when skb->protocol !=
htons(ETH_P_IP), matching brd_input: and ip_mc_validate_source(), while
preserving ip_route_input_noref() rp_filter source validation when tip
is RTN_LOCAL.

Observed during idle power testing on CONFIG_RCU_LAZY=y systems, where
background broadcast ARP traffic with IPv4 forwarding disabled
repeatedly woke RCU kthreads. Tested on x86_64 and arm64 under
synthetic broadcast ARP load (~45 ARPs/s) and live /16 network traffic
(~20-40 ARPs/s): live in_slow_tot dropped by >95% and 60s idle
rcu_preempt wakeups fell by ~70% on arm64 and ~75-88% on x86_64,
raising x86_64 package C10 residency from 62.5% to 84.6% and saving
~100-250 mW of SoC package power. An AI coding assistant was used to
help analyze the code path and draft the patch and changelog.

Signed-off-by: Sam McNally <sammc@google.com>
---
 net/ipv4/route.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 11d990703d31..1f1b09b4ac8d 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2463,6 +2463,10 @@ ip_route_input_slow(struct sk_buff *skb, __be32 daddr, __be32 saddr,
 
 no_route:
 	RT_CACHE_STAT_INC(in_no_route);
+	if (skb->protocol != htons(ETH_P_IP)) {
+		reason = SKB_DROP_REASON_INVALID_PROTO;
+		goto out;
+	}
 	res->type = RTN_UNREACHABLE;
 	res->fi = NULL;
 	res->table = NULL;
-- 
2.56.1.911.g883d8bcb20-goog

