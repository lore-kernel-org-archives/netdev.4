Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680830;
	b=5t+aL34hrPLESoPmYHOx8TcADus+81gXeDpoQoMGngy87Zj4bxfrDOtqHpO8BetTtQIq
	 mayGg9ms10WS05m2KKkd+MDzekGFfxrqdJ11LYAByetHzTNUpA3xSYNxM/1+FSS84YGdl
	 38AU8BBEtfToS+yGRRQ29Ykv/xisaY59rLsH3QkGecq43WtoEDf5qtIAktgs29YNsUjnk
	 7tAgL55J2dGKbgdMVWt7biUS+Z8WYWDTe7WT79H4EUJWED9zPjVwxRD7ZJr8i4umUvx7u
	 JDtO46IeZZptIQpftspPh/w/NpUrUZHtZtFwmEsX5XwOAFO4Im11fgGea+jX13LcF6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
	b=dblsZtxKiTI5IrY3BSyrR3TFnPcUH09vd5lXxvK9s0KjEHKkOMzYE+gJIL8+0Yvy2145
	 2jmfkQO5iSo6yRTYtAlDRbmVbntFzR+y/d/KwNiZgX3CzKGJ/m2oV2vDuoLOOZkTpsR2b
	 X8OpOs/jK+4uMbnhD3NUU1YTkCaTp5IlSlaRKGu4+B61mBFQyoILQ5PNABdGbz2261s5V
	 dwL48FMDYc5GwzG0s0sE+M3p6v6NhF+HcwWyDGbSY/6KmTloEKIWC9U4E7FiPwe1WagdE
	 scIj+Pdfo1T7ffFq+F9lvej0/PLapy6X+rj+fVMCZH7vy2Y8H5BcEYVSd6HIf/siZOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BSYPy6Da;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650760A260B
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3650760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BSYPy6Da
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so395404766b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680828; x=1795285628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
        b=BSYPy6Da2odycq/xEWzn34xv7dn6WOqX4mLAmrzI6LZnzBB9mA/Ox+Oe3Jayd4eEP1
         5MZ0xMaIPxXqdakSBQjLJ5oIQu+jz/OEhsUUitWKUCi06O5X13Ya0CzGWdmJK5dZUuLk
         Q1xUzAo2e0ECrfmkWDHxWS0TJ20nS5BP+d/eD09sbWF2bUISZfpPbveRdsoH8T6kQX3o
         GTTr7i5cukJDio/L3DMKdTAQzNUL5z8noGiuUSo2hCriUQQMucOwpUlmLo4DafS4O6vK
         0WIYyYW7MHIU/C66JXrJTUn6pEta4NoNVx4GTcXGq30n9ZOTqsEhALnREC8dgS8BomcU
         XEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680828; x=1795285628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
        b=zdG7S9Ny9ghlSsx7eEEfBqccMGIjgVp+ncItbLgxqC0e8s2M33tumQWkuQ/ePh2tC+
         nV/GPfml8S0+bZkHOBo6JMsgU7x9Lxv9n/BoexsXtYNmPXo2dw2pxlGkcsMvGl0E9Km2
         NNni6RraYkIPoML4eCGrfvA3gECy2WdvO3KxivJ3ZeMIP//NtKZUPlBVnKdb/46DX8hG
         cyBEV4ycsXnn7MDVc0Rs2O6sZZ7eXesShv1GMqEmO/xO09jt5v2Nl7BXUrlz3hZmT2vJ
         GyZExM8X+70ZUIfrfvBAnAFj7RqMVWDOe+ooV+cA4LZUmwTg2UpfrEmxGuznLFMEgNuW
         9lXg==
X-Gm-Message-State: APuU4Z/jFr+nj+e6cxEwf7n4Z7n4gSUh68pg6U631PCJYJGP1hLiEgJK
	/GPjKJStJnDP3YvclHsyRvNgzeYDCzB6VH2t8Bg8PN/MMlS8ONJ8J8cecP/wzjQGZ+vZgYSqjOm
	MIzMtcgH8
X-Gm-Gg: AYBFou1BydrchuutecExCIBRDTqzYnmahRN14BQse39ykde+5SgTEo4ZvZHU9yVHtvD
	KrJZPLQmWyYW/PdGoiLcmK/Rl/FPXtwyryzWmsjg2NcbVgcdVS2/Xxg5JdK7w3Qq6t8RrrvZkBG
	qZlB7ao/vq21qw7Khx9BPzYJr8NLIbpQ2kL4cVsjcYGRwrrc2pZG87Rg/xO8p/i4KxrYAmUpXFQ
	KTFDd512hihhrcL1LrR0gNtWPhskoOlIokZrhU906U/A/AzFByD+kRj9T68eDtIrJU7SCjBHJM/
	exniUnfPTyNTPTJ1TqJh7lBZR81OZxJ4wM+XAhIkgp5rpVe+Pzd4G1mNrv0pf033kWJKZWHjJgk
	mcW5160TuXzFzWmUjdgcfoen9/wYigk/umJUF/msVggToHPiEzsA67KDHY78rjziG/GSSYi7yF7
	bSN6F3dRu6xeUbm9ceQ5kYknr6SetnOqXTVQ6U8hWTfOhMKYGnLmUcwpcg4ZuHDz8lZfO4MEgvb
	u7INGH3FzTqBgi6sftywqLu3kBT+oEOM5SN/nKLlLUCdqXPmXe7RjxBBdNPvzV6DAVS1uNG93IC
	NAwK8SQM0Nvrm75N6G0yFr+fI6OiR6hH6j+IbgXkkHAG8iWrx4NxKF2QEijoCNdnvN27j++P87f
	ECmKN5jhWZBVP0Kw8dAe54OMSy3fTiHzlZj4xbpZ2llSKoAYxKzSrsRQKddWFODglU5ZFCM+IGQ
	azPtNw6ohrYkCIX3ZUJuO+xiKe2DNc69cftM32vmanAt50xqVtxNfDj0kAqbN1TITuDah8xu7sW
	dRltCizpeDMO71lTMUH1ufyyTagp7MIJussgsv71b3yIa1rVAMh/hFRCWPJM2LmeqDBjqfhj/qg
	j5Y=
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c50962eeff0mr503135566b.11.1794680828136;
        Sat, 14 Nov 2026 10:27:08 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:07 -0800 (PST)
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
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sat, 14 Nov 2026 19:27:00 +0100
Message-ID: <1447f5496cdf334e48af37fcbd9f56dea8cd6de7.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 09d6b0ff1ffb7..45769d2077172 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1940,6 +1940,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1975,7 +1976,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst);
+	if (skb->len + encap > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && mtu > encap &&
+	      skb_gso_validate_network_len(skb, mtu - encap))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

