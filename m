Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295667;
	b=wUNcPXGgJ6/pqJdVABJ6meTTDZ02rKITTkB+/7XW2MBVjg6kGk1RqV/TfNiXU0ObHreU
	 HA799HJtaisKnRV3PpZl6VyZhNXD4PrabmideXfAxLAyB/v/HESrhZJLgiIk5yTsG4qyb
	 JgEet366KA4gkKfQT61kS8PNf0lK4rG6/+L9GQdtqrYNkMWYN7Ph629yDIFBi87RGIhon
	 iPu+nUcvUZg6EQzZv2/MN8yZmxNdBdSXNQT9OxdUXRaQRq/4UOdvcAC6IoU5tCmLuAwi0
	 rPZiUbcq3bFutt4Msju5Ode/o+Ov30VylzNy49XgDJLaxeSpgka62zRcvwSMXNNmjbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1AXbqInRAUgKMLxuh8yn0VYxc9x0oyzkhbMGDasa2Ds=;
	b=hL+jnEVo7llasGJkS/8q/WZfURqvZkRfsiR6RMhqPtU3bBn2ChCUvJ9oEHC5+6XljBpq
	 Rgc7nqqNPVlG2ojlaFNvv6dhrFbtx2Po7Cfv+feAuBi/JWTYaTLRZaaLIzH7s+1ovu9AC
	 oOEMKiIjiWM4Y7+zjgPVQAnmryZr7/C52/OAX6nJdFyEeXhANSJQuocamXYrVWzX1b9mu
	 EFJR5z4SvWjkEv2DbHtzH0YC38qwkYQajkUEOuEPSihSll4fwndGn+LgUqOjUeEsbe0vE
	 TGFdFBYczkYNGRdRTXbhNdkhtSRzv+AGGSzk6R+Ba6s+L9SUtfY+l5Q1YwttcfYNNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vKlnWvYT;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CE606A336
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6CE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vKlnWvYT
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c511cdd5a82so241845766b.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295665; x=1795900465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AXbqInRAUgKMLxuh8yn0VYxc9x0oyzkhbMGDasa2Ds=;
        b=vKlnWvYTdoAUMYow2bL/QkaMbtWCfS7TL6d9JQhSA1L0y3KpQteeqlfeI1mIoiwlMw
         VkRUcsm8HbqMr1muqZ4r+M83DAMmO+acZ0hP75nI+z6LjdjmSDwXHjnFT+RaD25oHwHY
         iq0BuDbbVEg9HsO8tWI4D2CwZX97j5w+sB8H2ZSeZJK1P9StXaW7fKfnhJS0wL7VpBQe
         Aj96Dy0P0AY+uthndlBWzldeNvOg+GuFq1l5TO5bIU2pJrE/XuRqJoEAVGAXijgj5vKZ
         q5sKJGNaZkM6kZu1CamhfW7aFpOpkR3rzITNIcqD/AmZNmxIhJBwibVsM2RHSTcNTYmv
         lWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295665; x=1795900465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AXbqInRAUgKMLxuh8yn0VYxc9x0oyzkhbMGDasa2Ds=;
        b=IIBe8X1nEgKMS58QDJ2DdOIQ9vJJvg8tG2NR3l+2VVsNtSs2g0JaRVVoI1rXzAPukU
         OohWMQ/LI7sO2Mgb9qXdjKWTJLKcLqNUleTeVw5p/y5joy6hqWocuoDBibuvh+pLI7aX
         6p/vlVaPrDvfshiXqCKt2GjwRxkV8Krz4IKD/+YzzWLe+ecwExP7x9gl5nM90OAdt2nk
         b6T9qx/VTNosyYNw58xraDD3NPzq3tM2OKXQU+MQK8trRXaCep3s9aS6INr1tCIPCNyQ
         RsKSCyeMy2HICXqMTMppK84o7AlHxaPMQygYbWla27TCeD4pZ96AfPhnEEV5YXHxaJV5
         ldmw==
X-Gm-Message-State: APuU4Z/U8tgq/L92sk8spMkGLgFsj45X9Z9BfVoPtCV3mUSaYPCPTjma
	rwVcvM7G6ut+8WO0koJNp3Gb/k08O6ePfSfnmQsvqwVX0gf8KZx8UMIlXx5aSWWazPzHCnH2oDh
	Ga5eH05wa
X-Gm-Gg: AZFdTZdqMT0HtvuGWZPn9dxSFxufphvxi6nYI7JATX0jslyIg02tkdoS+04bgyDE60S
	VDXHZESE4T0rWEYe2oqMomRegRKYJ3ssFkHHU1AqHvwnQxLpBunCA0oVOdm0s5vRHB2K93kRJfZ
	EYHPo9X51E/Nj2Z0yDfjM8fPAEC0IUGbhTcR+SH/sjVfGZjC/irNq29BTv0UgCwI0mV0W1QHtHy
	9amYR6Q6pmcb//UJi/ylOAWCCXkF885eoqU/UP4FBMFdyaVKnQxGqhK20I0jWYlMG7hqdErokDf
	JIdT3C9KExb6whvCU5tBNPSxrv3a8XffDlrteKtiKtsdk7H4auOkm8A+zKqQRdvPKbhKWX67xOd
	nFbRhed1rvtx2xgp8w7BuS05xq6caVT7qwmuH3I++nV5XiF/aYcwsRHyCqxnVM1RUrRxL+6zbUd
	cXwhrxrKMjrGIxKpSt2Sd0lXOT3IB4dzu/Jre+FH486NeRSvMv+0spUQcWW+HYOpdbmmb8z0Lqw
	Nb0kAJYi4WtN/MXI0MOiSDrcn5J0Cwxw3Q8/xvkj0PYDBDuOrJx9IFJiH8E7yZqaZn4zePR1kJR
	O3NyhheF/z7MZhFxYMmr98oDKJo411YQorm24zruN7ke/qBppdGbph/d/pwXW1l9hAFddSWBYY0
	f9bgue1c9o2FLBDjZXgK2dBm2QmV1eo0waU+Y472fJX9Ym2zhzGH+vi7ab8B/SMehjOvxpQqJq9
	jnme0YqppTPhEMu0Tq28kirJKoJA0Lqw3jf4KWfyb11kFeOQjAU2E75KxuaHzhxWSCT1p+lC+t1
	F/7NeAfbYVuqvX+Yon77x68ZEvrX1cu1d2PRgU9KI/Ibit2arbeChDSOXrIMziMbfe/2+IDDjg2
	wYYTjipOSzJQ
X-Received: by 2002:a17:907:9306:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c513a52ab6cmr563239666b.2.1795295665178;
        Sat, 21 Nov 2026 13:14:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	nbd@nbd.name,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com
Subject: [PATCH net v6 1/5] net: gro: set the inner transport header of encapsulated fraglist packets
Date: Sat, 21 Nov 2026 22:14:18 +0100
Message-ID: <7b97180d58a027672614af854d79e5639f17d180.1795295554.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795295554.git.julius@bairaktaris.de>
References: <cover.1795295554.git.julius@bairaktaris.de>
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

The fraglist branches of tcp4_gro_complete() and tcp6_gro_complete()
return before tcp_gro_complete(), and those of udp4_gro_complete() and
udp6_gro_complete() before udp_gro_complete_segment(). Only the latter
two set skb->inner_transport_header when skb->encapsulation is set:
commit d51c5907e980 ("net, gro: Set inner transport header offset in
tcp/udp GRO hook") added it to the regular branches only.

The TCP fraglist branch completes the inner flow of every tunnel that
GRO handles (UDP tunnel sockets, FOU/GUE, GRE, IPIP, SIT, ip6ip6,
ip4ip6): tcp4_check_fraglist_gro() and tcp6_check_fraglist_gro() do not
look at the encapsulation. The UDP one completes the inner flow of a
UDP tunnel socket, whose udp_gro_complete() clears encap_mark, and of
FOU/GUE, which clear it on receive; behind GRE, IPIP and SIT encap_mark
stays set and the aggregate completes through
udp_gro_complete_segment().

Such an aggregate keeps an inner transport header from earlier
processing. skb_gso_transport_seglen() computes the segment length from
it, so ip_forward() and ip_finish_output_gso() compare a wrong length
with the MTU; qdisc_pkt_len_segs_init() drops the aggregate with
SKB_DROP_REASON_SKB_BAD_GSO when the offset lies in front of skb->data;
and __skb_udp_tunnel_segment() sets the inner transport header of the
packet it segments from it.

Set the inner transport header in the fraglist branches as well. The
transport header points at the inner TCP or UDP header there, as in
the regular branches.

With rx-gro-list on a virtio-net port of a router with VXLAN sockets,
1000 VXLAN packets per case (outer IPv4, 1400 bytes; inner UDP or TCP
over IPv4 or IPv6) forwarded unicast over a 1400-byte route reached the
receiver 7 to 245 times per case on net, the router's egress counting
the rest as dropped (4 runs of 8 cases), and 1000 times with this change
(2 runs).

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/tcp_offload.c   | 3 +++
 net/ipv4/udp_offload.c   | 3 +++
 net/ipv6/tcpv6_offload.c | 3 +++
 net/ipv6/udp_offload.c   | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd07c723..27bc48a24c2b 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -465,6 +465,9 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 		skb_shinfo(skb)->gso_type |= SKB_GSO_FRAGLIST | SKB_GSO_TCPV4;
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
+		if (skb->encapsulation)
+			skb->inner_transport_header = skb->transport_header;
+
 		__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index b77ae2f00c62..7dc85eb333aa 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -971,6 +971,9 @@ INDIRECT_CALLABLE_SCOPE int udp4_gro_complete(struct sk_buff *skb, int nhoff)
 		skb_shinfo(skb)->gso_type |= (SKB_GSO_FRAGLIST|SKB_GSO_UDP_L4);
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
+		if (skb->encapsulation)
+			skb->inner_transport_header = skb->transport_header;
+
 		__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index eec3778855eb..5bed3f341786 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -88,6 +88,9 @@ static __always_inline int tcp6_gro_complete(struct sk_buff *skb, int thoff)
 		skb_shinfo(skb)->gso_type |= SKB_GSO_FRAGLIST | SKB_GSO_TCPV6;
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
+		if (skb->encapsulation)
+			skb->inner_transport_header = skb->transport_header;
+
 		__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
diff --git a/net/ipv6/udp_offload.c b/net/ipv6/udp_offload.c
index 7370bcb80332..79346fc17df5 100644
--- a/net/ipv6/udp_offload.c
+++ b/net/ipv6/udp_offload.c
@@ -176,6 +176,9 @@ int udp6_gro_complete(struct sk_buff *skb, int nhoff)
 		skb_shinfo(skb)->gso_type |= (SKB_GSO_FRAGLIST|SKB_GSO_UDP_L4);
 		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
 
+		if (skb->encapsulation)
+			skb->inner_transport_header = skb->transport_header;
+
 		__skb_incr_checksum_unnecessary(skb);
 
 		return 0;
-- 
2.53.0

