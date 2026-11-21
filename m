Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295672;
	b=k0do961qqtkS7MtGN6OU1ACwiYVaLBd5y5vdRgiNgSeIjx9jbwkvkrnxYhJZjx3oEIyd
	 JybtrKP6bHnD/K5+BygCfJmTRS6LsyRs9U2taa9c0JsUQF8tbdANEeKXk/bGHScsostEp
	 kIj7rInjCkGJWR5RjQPGCosd2Rj4uQ3FbvwPKWo1vMXaQbsq6zG8RpSdyPmljAV0QsQ+j
	 C+Hq+Tjc0cCKReZfcyxyPdbzM8wUm/HAsYLEDZxK9kr9C0Ea/cIWQUFi9MWf1gjbJQiDH
	 67mXPXsv2426OEvNSZ2Ga6CJrbfXIpWCDf5XG5/qu/1Cx/Y1QKaSBwA7mi4YbhIkydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tt7kM3FFpIM6AzSUK6zaasuLpjRzWj4Ky1jpo53o8aE=;
	b=UkyZ5sTtwqbOyiG/Rad1Ri0HNyEw31+1xCgOWcOak0XoFQbwvTVNOlD6GQgzmQYKQb7w
	 QOCAoFpJgMruTtlNW2Hl7UcAZcek6BO9Rt1kSfZik5SQTGCnCLBRKJaWUIPBOGtEmj/8M
	 dOpzaGTGopAeQ+X7SNGjCnQHbnLZhcJPERCDvT3YeKHIjDz6B9zSBnuI7DKw1TlJQRJXu
	 cd5jofkR4kr/nMl9YPx5RHqJ2mHV8b2z95EyylaRf2yXqQ6me9/ITXPJwaPkvCN9jovMH
	 9ijErT47nkZ2ARoZgoipaOHRYvGEp1L1O5ti8qdy8S4fOtRwj7g5uaF+I50/04W37Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=LuneVfEg;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8F606A33B
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA8F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=LuneVfEg
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50cc7540b7so281366166b.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295670; x=1795900470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt7kM3FFpIM6AzSUK6zaasuLpjRzWj4Ky1jpo53o8aE=;
        b=LuneVfEgDo5WT66IPjJ8XasW467EqmNWWgpj7MuCG6zzt7dzEWQNOk8m0s/NnazY9G
         fLxb70I97q7BiX9zqychXn+/N3GGfC5HpEvSbBuzbQzBKlc1hwaAjiQzyT9C7PCdpPg4
         ZvFM1CGzpHS7Z5E3DnE55pPVMLetqZV/viqYGQz7IjBI9S/1xiZx76LuQnukPBOEhmAF
         o+a5olBy9aiUg8+L/DXvl7xpeRk630abszuPn5BtjG7EgFawPemQgW3PXRPNlZZ/m4fY
         JofQ2K67XSAo7ktRO2X2GirFEqxuNIupFhANwlksVtAnNu5hFiX43Axiw/ODYHP4wE/B
         Of8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295670; x=1795900470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tt7kM3FFpIM6AzSUK6zaasuLpjRzWj4Ky1jpo53o8aE=;
        b=pnL/y4l7WOtFrgW2NAbuZFrsgJNEBFXyyQcF+y6tCI+/IoPWVWtjA6SJKigNI7MvfI
         NV5XEp0uRS79LH4yksL5lsDftUuRjEcWz1lIhT9G5xACehZLX3lRJDu0FJLPWpP5ykvz
         Pqm/ndWLI7mQLByLWMCNs9KJpSopGr85DTZ7k/IZSHvO/r6H9Ggbx1ABV2+q9emIWhnc
         36vzs6fNB8zw39am0wqtsijwQV4HtculYzHHE1sNwyxJqcebmNIPw4mzX5XdYfN8tZ/+
         K73UBCwkA+47HHJP/GAt5UD1jfdgo+1wMiDL+3yYaE7/0aM2UrJQnzSwAYDRnp6zb8ak
         UtXw==
X-Gm-Message-State: APuU4Z/ImRTFC16P2jMoSTFIY0YT8vj2oHziQKwltYK+8CR3rR5lO54E
	qoXhOWLV4GpphAvlwPf/0BM1U3aB7xMbVbbmwOrKkZjQm6Zxp/4ZH4i4TluuM/LOw7NSP/nOPIy
	2adDKenuH
X-Gm-Gg: AZFdTZeIK7R7djvHiOSpHkictPUR2ltG7QVx9VFzhWLymgcH0tG51Mn1jMbsaPG5aIy
	JHmDacXS+IujQViU7gUd0J9aLjRVl1KGIAnr2sDWzHaN0U6CJ8bzLtUt82JznuAp2uHPeFrISVC
	WCag8klLjLY6NK+fC57jFkjUUnU5LNgIf1BnUYqM2AiC/cPToRQtcrvOaZa5/lYtfcUCzpOrPYY
	nyJLjsPNzyzLF4APGnB2kBdlpmRJjqSjH2XcMFP+iyRb4QUeTddoNb2InPOof8UEkMGAFtg7rdU
	/ldkNhtGnfTMLB6LjwZmYbF6V1GJ1+MNQ4GGEYfvAKTqlzpGQRsjWM6OhOA7Elixw4tEB+Mgkbl
	u8tYPgCA+vH6eNoDeAcZOjU0If+rkfHvQBnPplC4JJn7Da8ikLkHnSYSMlLeRfM21Sk4vHvJG+M
	MvCpHChnOZaLfZCAirA7RdFRC0WBzgXUJZxRemsF33q5W2Sk3H8zwsn18bSgPjqP4XXSGMi8Kvt
	/zOey9M5K6WqbIRwM23mJU6MF64zHRspTO94caxp3qxCEz+tF7MPNfM8zbZgEex1yQVNxyggvGe
	ZmZ2k3bsclyVR8D7NMzX3B/qJ42x297Rdthk9ril0/VFnMH6t45DuCuYmEMGFlviv7BddQmonXj
	ZE7VCyL0Xu7qsoGAPUnNE4S7+iyltZGgv0uymWbPmZy1HOt3V5NyNiR7iIVyKJ91GsjFYj42C6S
	+LbWZCxEH004I1VP4ZQMBzw31D1XyrPxesWx1d57urHUHHsKOdmBVB4RkOeICxeBqNaW9/W5tRo
	D+CaVoHVtExtLme3lVKqmC1oB4RqWoJ8qz0N9RowVVWmI3V6PrecXTqs9BiTgG5kpZM8k81iWtA
	A7tZN6veI9U=
X-Received: by 2002:a17:906:27cb:b0:c51:3acc:9f86 with SMTP id a640c23a62f3a-c513acca092mr520415866b.39.1795295670070;
        Sat, 21 Nov 2026 13:14:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:29 -0800 (PST)
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
Subject: [PATCH net v6 4/5] ipmr: set up GSO state for tunnel vifs
Date: Sat, 21 Nov 2026 22:14:21 +0100
Message-ID: <ffd8ca7abd44882707fbca297889f6e43ced4a65.1795295554.git.julius@bairaktaris.de>
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

ip_encap() pushes the outer IPv4 header but does not set SKB_GSO_IPXIP4,
skb->encapsulation or the inner headers. A GSO packet forwarded to a
VIFF_TUNNEL vif is then rejected by ipip_gso_segment() and dropped in
validate_xmit_skb(), after being counted as sent. A device with UDP
segmentation offload is handed a GSO packet whose transport header
points at the inner IP header.

Call iptunnel_handle_offloads() and skb_set_inner_ipproto() as
ipip_tunnel_xmit() does, reserve one outer IP ID per segment as
iptunnel_xmit() does, and set the outer length with iph_set_totlen(),
since a GSO packet plus the outer header can exceed 64 KB.

An encapsulated GSO packet keeps the inner headers of its own tunnel,
and ip_encap() overwrites skb->inner_protocol for the IPIP header it
adds.
IPIP and SIT aggregates (SKB_GSO_IPXIP4) still segment in software, as
inet_gso_segment() follows the IP headers by their protocol field. GRE
and UDP tunnel aggregates do not: gre_gso_segment() and
skb_udp_tunnel_segment() take the payload type from
skb->inner_protocol. Drop those before the vif counts them; without
this change ipip_gso_segment() dropped them, as they lacked
SKB_GSO_IPXIP4. A device that segments IPXIP4 packets itself, such as
i40e, prepares only the outermost and the innermost IP header of each
segment; it was handed the same three-header IPIP and SIT aggregates
before this change.

Complete the pending checksum of an encapsulated packet that is not GSO
before ip_encap(), as validate_xmit_skb() does for a packet sent through
an ipip device, so that ip_encap() does not leave the inner offsets of
the previous tunnel on the IPIP packet. This is done after the last use
of the IP header pointer, as completing it can reallocate the head.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 836f3f95b20c..eae382a2fadb 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1869,6 +1869,10 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 	struct iphdr *iph;
 	const struct iphdr *old_iph = ip_hdr(skb);
 
+	/* skb_cow() in ipmr_prepare_xmit() leaves no header to unclone */
+	iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4);
+	skb_set_inner_ipproto(skb, IPPROTO_IPIP);
+
 	skb_push(skb, sizeof(struct iphdr));
 	skb->transport_header = skb->network_header;
 	skb_reset_network_header(skb);
@@ -1882,8 +1886,8 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 	iph->saddr	=	saddr;
 	iph->protocol	=	IPPROTO_IPIP;
 	iph->ihl	=	5;
-	iph->tot_len	=	htons(skb->len);
-	ip_select_ident(net, skb, NULL);
+	iph_set_totlen(iph, skb->len);
+	ip_select_ident_segs(net, skb, NULL, skb_shinfo(skb)->gso_segs ?: 1);
 	ip_send_check(iph);
 
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
@@ -1951,6 +1955,15 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	}
 
 	if (vif->flags & VIFF_TUNNEL) {
+		/* An encapsulated packet carries the inner headers of its
+		 * own tunnel. Only IPXIP4 GSO packets nest: their IP headers
+		 * are segmented by protocol field, while GRE and UDP tunnel
+		 * segmentation read skb->inner_protocol, which ip_encap()
+		 * sets for its own header.
+		 */
+		if (skb_is_gso(skb) && skb->encapsulation &&
+		    !(skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP4))
+			return -1;
 		rt = ip_route_output_ports(net, &fl4, NULL,
 					   vif->remote, vif->local,
 					   0, 0,
@@ -1985,6 +1998,17 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 		return -1;
 	}
 
+	/* Complete the pending checksum of an encapsulated packet, as for
+	 * a packet sent through an ipip device. This may reallocate the
+	 * head: no pointer into it is used after this point.
+	 */
+	if ((vif->flags & VIFF_TUNNEL) && skb->encapsulation &&
+	    !skb_is_gso(skb) && skb->ip_summed == CHECKSUM_PARTIAL &&
+	    skb_checksum_help(skb)) {
+		ip_rt_put(rt);
+		return -1;
+	}
+
 	WRITE_ONCE(vif->pkt_out, vif->pkt_out + 1);
 	WRITE_ONCE(vif->bytes_out, vif->bytes_out + skb->len);
 
-- 
2.53.0

