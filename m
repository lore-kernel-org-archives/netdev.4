Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636668;
	b=kicAjUzddCYKSMdNp20AiwXWBCKb2RpVgrPb/Xnsh++OWHqAHSuD6CbV4NuxF7Vsn2bz
	 jas1hfX+d7iEU1Z8BglSWCMOuydGBQQbjMUqjp+efg9J045xq9EkWRoghPbJSS/WAoqO7
	 kW47g/q0yjrGg4XkvdzNLGwI+MAIQtgZhzPrFHpqh1avs6tGA8rv6zxm7u5MrP4rwZMjv
	 3uwnD7s49oIc00eCupSBMVtguhVJrq7qyF4L0APqZ+xWaOP8VTQYPLT+aLum/7qps2RA1
	 9bSng3b1nT0NA1PCiXxzIs6ybEcKR3nc1w6N0l3G5c5JPL8n+TlzHl/rG+Dg864cHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
	b=04qy9rx5840mIx2Y4PR6O2nTYhTuTVFoUWpKCDuOWbW2y4rOTmD1t2T1WBvZ95IWvF8o
	 OVwBVFplZ2iZ8SSOIPr2uYIGHVTnKMsXaozPx/ds/j57SI2xSVWBKc+9FyUo43pmnkROs
	 3836exOMOzE3rpRJILK/aid+Txg84UXyKBwA2sDVs8aGc72ScGp6RSa75ik1phJZ9JoYy
	 mpwgfYbPTfHsxQKhnMIPQQk2YeiDVRX2nEZ/bASUlVvPBUS2hAsPBmoxF/PJKA1XjpD6X
	 WzGoHfnDHRBip3vFDcYeSxMQL/af6mTK03/gN5Q2h3xCaDBdFAA8ytEl7WzxJAel16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=hfDzQ+yb;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408C606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C408C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=hfDzQ+yb
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so9581907c88.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636667; x=1796241467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
        b=hfDzQ+ybCYBao8mATsVqSfsDtzTgjDs5Zq8i51yhF0Rq+t/X2RnzZ9IlGC5wPTJrHH
         PdNokTSeSi2VH0GSVMpMTr9s8T6SI2T8dFuLMWcLBt8+MbnYnwV3+FqoR+SdvAZnNfUK
         cyQdyEvLwStJZI2C2ghlmVaAo306eao+x3ajBItDQGhBa86E6BSSDuB4QuViexdzvumL
         DW+/tI3+moX+8jgtH6+VDX+roNVcU4HcmgvXdTZJj+p9F+Nw/3z5nIXoDI89nq4ufmjM
         LMx25AViHqVjSSLm41jlDPtVAEdgrPg2PX53OTb+fwCFFGA8QjzVSzLoE4bzV1iX17W+
         dcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636667; x=1796241467;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSbicBCggixQqMOYfUZmOoYxybMhCFwsk9cNA7EU8U8=;
        b=AjXSOOV9zB6OEc+svl4evwiaxRLZf0uZkilkhH+tSXD+zRLMiUOVzRYP9/Mmq27ybk
         jt28KrXt0LfAs5U650h8kzPW4nlX8liKAx5mCjYZNWrnEwJqW3YMrkjcDzWuNhEM3F6J
         ooqNCDIGiVwVBXP7PJNmcyUaY35+V1+BDOwlUgRrY+8GBBaSjOC6fkJ66KXBjlAoZts3
         ESq/pMne6GcbwAIRn7myotQZ8AHouVfdesKpI3kxXSwilApBBYA7w3WMI6hE/IGfKIdq
         0qjz4N4ulz49ePKoKbrd326BFY93FQNOTcZlvHCvHb2bdHcJy6eoSZzbt2rItqHG5bvv
         VD/g==
X-Forwarded-Encrypted: i=1; AL+hErF73p58FbhohGmsHQj6Xnl6z/8VA8IiI6HxHc3ro6HOwPtr1OLvOkdLSXLEektTCyvheCByfr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0gvebGflHNe6r5jCnwar/W5QHTZ7BS5Eq6oIr8yHPcipmPUCY
	J57E1gz6poIbwRY6r57FgmLk92zGn4sURRDdyz1wxRNHJXu1zUjsFNtR+JXvfSYFyoI=
X-Gm-Gg: AZFdTZfhehvMXBWi/t5+3x4giReZoTBIjZPH/HlU6a3s11UY6Xs+qaoUg4m9UOuCeMV
	LzK3j9JLxdnYadYc6Zx2gz1CexA/KZX+wbQ5lIGJbgmWFrRBQtC91NwuY2qtp6+RGrwnlCPANWa
	heapbs0bSXdWyuBCxJ7/KIRmQ3G5ax6PHBrslp3niOUT6yvYlVHmdfqclO33PeJpSCFr0qGy3v0
	XeeA/6Y0swg2KFWBgX4JvepcQ2K7Zzr3kyiVGtU1C51rJ5as5FBag2giI1QErgS42gS2hvJ5tue
	VvV5Wsk6OYKtUr7RMdM+IzyUSUwHBikEvRHcPcxGFlsEo0WRs+lQNV4SNnxlxBjGJSwkxWfaYgP
	qw2ytPeliY3xk5x9XIUxjGNV2X6cYLdZZe8OyYnnLxp5GwXGzEKcdiNvg34GI2UJqMR3xdigGrV
	eU3hPpZjEZJx+abzPe+B3b3vfgkEgpOQ/XvWXLP9VbuLynZlLhBydnaE0Z+Nyt+5pngDV3TTSrh
	hVWlyD0qMajJLacjkSDvcQmn7oQiEA6v7d3oGSZWgaM9h/o7aAZqeGR9tQGhoDyfqZnNj4rX9il
	2VIR5Z2JRsDbKTtqPh0+ukylOvVEBH2tu3MGRu4dQ1dI9fO06zUKx5JaiVB3a/qIlcIbBdALuGR
	eWfBwxm6a3Xlp+9pxaBju+cJZdA==
X-Received: by 2002:a05:693c:69d4:b0:382:90fb:4cad with SMTP id 5a478bee46e88-3856ca9db95mr17568429eec.2.1795636664223;
        Wed, 25 Nov 2026 11:57:44 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:43 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: cratiu@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	ipsec@lists.linux.dev,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	steffen.klassert@secunet.com
Subject: [PATCH 6.18.y 3/5] xfrm: Don't clobber inner headers when already set
Date: Wed, 25 Nov 2026 14:57:33 -0500
Message-ID: <20261125195735.57472-4-artem@trailofbits.com>
In-Reply-To: <20261125195735.57472-1-artem@trailofbits.com>
References: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Cosmin Ratiu <cratiu@nvidia.com>
Date: Wed, 22 Apr 2026 17:06:48 +0300

[ Upstream commit fa90a3145c0340c3f624206a81637c542254ea1d ]

On VXLAN over IPsec egress, xfrm{4,6}_transport_output() blindly
overwrite inner_transport_header (== the inner TCP header saved in VXLAN
iptunnel_handle_offloads() -> skb_reset_inner_headers()) with the
current transport_header (== the VXLAN outer UDP header set by
udp_tunnel_xmit_skb()).

This was a latent bug, harmless until commit [1] added a doff validation
check in qdisc_pkt_len_segs_init() for encapsulated GSO packets. With
the wrong inner_transport_header set by xfrm, qdisc_pkt_len_segs_init()
interprets inner_transport_header as a TCP header, reads doff=0 from the
upper byte of the VNI and drops the packet with DROP_REASON_SKB_BAD_GSO.

Besides the use in GSO to determine the header size of segmented
packets, inner_transport_header might be used by drivers to set up
inner checksum offloading by pointing the HW to the inner transport
header. A quick browse through available drivers shows that mlx5 uses
skb->csum_start specifically for this scenario, while others either
don't support VXLAN over IPsec crypto offload (ixgbe) or the HW is
capable of parsing the packets itself (nfp, Chelsio).

But in all cases, it is more correct to let the inner_transport_header
point to the innermost header instead of overwriting it in xfrm.

So fix this by guarding all four inner header save sites in
xfrm_output.c (xfrm{4,6}_transport_output, xfrm{4,6}_tunnel_encap_add)
with a check for skb->inner_protocol. When inner_protocol is set, a
tunnel layer (VXLAN, Geneve, GRE, etc.) has already saved the correct
inner header offsets and they must not be overwritten. When
inner_protocol is zero, no prior tunnel encapsulation exists and xfrm
must save the inner headers itself. The tunnel mode checks are only
added for completion, since they aren't strictly required, as
xfrm_output() forces software GSO in tunnel mode before encap.

This makes the previously added test pass:
 # ./tools/testing/selftests/drivers/net/hw/ipsec_vxlan.py
 TAP version 13
 1..4
 ok 1 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v4_inner_v4
 ok 2 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v4_inner_v6
 ok 3 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v6_inner_v4
 ok 4 ipsec_vxlan.test_vxlan_ipsec_crypto_offload.outer_v6_inner_v6
 # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

[1] commit 7fb4c1967011 ("net: pull headers in qdisc_pkt_len_segs_init()")
Fixes: f1bd7d659ef0 ("xfrm: Add encapsulation header offsets while SKB is not encrypted")
Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/xfrm/xfrm_output.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index 262eea7bdea3..433ce19c2900 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -67,7 +67,9 @@ static int xfrm4_transport_output(struct xfrm_state *x, struct sk_buff *skb)
 	struct iphdr *iph = ip_hdr(skb);
 	int ihl = iph->ihl * 4;
 
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol)
+		skb_set_inner_transport_header(skb,
+					       skb_transport_offset(skb));
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
@@ -168,7 +170,9 @@ static int xfrm6_transport_output(struct xfrm_state *x, struct sk_buff *skb)
 	int hdr_len;
 
 	iph = ipv6_hdr(skb);
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol)
+		skb_set_inner_transport_header(skb,
+					       skb_transport_offset(skb));
 
 	hdr_len = xfrm6_hdr_offset(x, skb, &prevhdr);
 	if (hdr_len < 0)
@@ -277,8 +281,10 @@ static int xfrm4_tunnel_encap_add(struct xfrm_state *x, struct sk_buff *skb)
 	struct iphdr *top_iph;
 	int flags;
 
-	skb_set_inner_network_header(skb, skb_network_offset(skb));
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol) {
+		skb_set_inner_network_header(skb, skb_network_offset(skb));
+		skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	}
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
@@ -322,8 +328,10 @@ static int xfrm6_tunnel_encap_add(struct xfrm_state *x, struct sk_buff *skb)
 	struct ipv6hdr *top_iph;
 	int dsfield;
 
-	skb_set_inner_network_header(skb, skb_network_offset(skb));
-	skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	if (!skb->inner_protocol) {
+		skb_set_inner_network_header(skb, skb_network_offset(skb));
+		skb_set_inner_transport_header(skb, skb_transport_offset(skb));
+	}
 
 	skb_set_network_header(skb, -x->props.header_len);
 	skb->mac_header = skb->network_header +
