Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922861;
	b=YjPLiqEARIWhvRBkeXvJXST4/q3POW9PoxSgSdofg8a7XexguojAmSfgAiCet1Ge7c27
	 j6sJRs23o12qrprLjDNmJhHsY6oXIEfwvd9o6xNE5TCgOckFxh4ZuIarFIa5g1hkROv10
	 p10SuR3xVZHyhvljJoyeEiyoQGX+lj9Eyn4zC6sdfm2Wiq4JmU7m2KiIE6RmxTPqYQW2Q
	 OCtI/d7i4BjjDCMhxg/GU2/vEA0g/f+CE3Eiki4S44dFfcCZeRlza92NJxG/blLTl2y4M
	 U8vvyFAkUEBFYSaZ1OngUc/K+SRmDIoc4MaF7Bx/HNZPKmoMo9NyiM4wS4r3ybCKkEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xbM/8NkFsyBNUIt/zB1tHx2aYKgPjS1RSmbEYKw0CLs=;
	b=x26PpMn1Ic3R1xfQkS7Fess+BMeE4/SzGJfDPc5w/e94cqHKLbAbqNwZjTOWUCsjxXQq
	 lI8IvwZemGi8wRWYsGV2d6B/D8VfVPuWjDUAyWgfa4/haUuHjUx5lpbghAjiNCqdqshQm
	 +xmsw0S8VdVK2ds8LnmgvtrM1ek3m+RGjL4eXW4T8j0LZ7AqtCIUKbSzKJHt5zPrMG2V4
	 6FLnQ+NozM6dSyFUicanKufJQYpkOb6eXlcoDGP7FHvuFS7vAC1tEWZqizOd9eLaQiJo8
	 hJJq+vpM77185OebsDqcI3XHE655DeAPw8B29DEfwvk3pg21Nm4y6j8seOhT458JiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1password.com;
	spf=pass smtp.mailfrom=agilebits.com;
	dkim=pass header.d=1password.com header.i=@1password.com header.a=rsa-sha256 header.s=google header.b=foXaldXx;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D4606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0D4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1password.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agilebits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1password.com header.i=@1password.com header.a=rsa-sha256 header.s=google header.b=foXaldXx
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365d26ccbdso33433511cf.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1password.com; s=google; t=1794922860; x=1795527660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbM/8NkFsyBNUIt/zB1tHx2aYKgPjS1RSmbEYKw0CLs=;
        b=foXaldXxEEH54V2YER/HHxt3jQlsWT7az36Ckd/VVrISFU+poHoFoVbuu7oDwkMqzU
         qb2Irozt25K9uH+74SzjT1PdSdXH54erl8ewjyR8naD8oGSgnVqYFLAsTrAhqK+ZjDqk
         stYd45245HPCPLkxFvpF7zkqwuKxfJCeAjwcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922860; x=1795527660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbM/8NkFsyBNUIt/zB1tHx2aYKgPjS1RSmbEYKw0CLs=;
        b=oMthCCbGYGnaNgMGBWS8MlhFnBL+B8yyFMVSY27/VYAW81BEuv+VTb8c5XXYYUg4/z
         o37gvIsLDf4vTb1dfsh3OyspZViwjsJO73z1Fawr3fB9pE7uUhfbFEl1GiUN9seOGS+y
         cXT2pdStjFsrB8snIrMI3Iudz8ZRc/kfxrkuWq99aGZFVUMFaZsHqORlW/e29SFMQ6C3
         Hgy5Ln6T91Df5Y0syUn6+Qw4yA6hQsIBMZdOCx82daXWdMJQUt0U9lzbYk3l1LJMY+nE
         SvpfQSgENEcCRa/6bDfQBEI6YQyTV6VhQxoi/j5l2MtPSt95nLNKDgVgz5pyaVly3x9Y
         Tiaw==
X-Forwarded-Encrypted: i=1; AL+hErFywK6DZzXc6UJSD7rxEjBmEg90XKIMLZqbmHPFYxR15OE1MLT+GyedaZk1nE51/8GxiYQY7bk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N75kGY2X+j9ymetCXn9y3CscYKVSpA/oBIZgRPB+IpppMeQZ0
	d25p7JlHRq8SoELKWyiMpUUgCATVOyL99lLspBGeMNVSxhZI5XnJKxGe4MvTfIVn9js=
X-Gm-Gg: AYBFou1LD5xbXDjC30KueIfTAiBHJzajgngoh/431j/d5KooP7HKK7qjr0kLQohdi+t
	lQsG4cO7gVGm3H2L4dZWYW18eOQ5cHzcxP9vZORe5DQkAox41QkUUYBrTLPsYkGdMswOLsQLtdb
	PVQ5Mi1Kkyplee0Dnm3Nyu3zVt3KLuK8mUB4yOt9hdEsdSVzsaG820UfaFLSTtcCmfWgyXKauHd
	FZwgTmFlTZsLY7oxvqus9K/yPYcEyefEzeZtCd8LkEPIJhSbqKBw3m0jFIkKjB9TXKDGeD0T33m
	u/m+D4iI+Uk0Z4MyFTgXyVlFdYbvrHSUtZguxW+z2WFR+DvM699mBw1Arzw/RMlgOnywzk3W0Q/
	hD5ukje5tcyDptFDyWZJEsS/5RL8kbMw0BDS45mPR2T6a/IIzS2/ewMu2dqwmHzmPt8Ma/3xOec
	u1LKRhSi1QQ2mFZOj/ebYK0hlzKmUnW9fjlmiQ7QyZlv1LRcHhj76QfyA1uNML77w75GomLrhym
	DreUIaK3rlWrhA5LTys5qgY5yf8UV9caMG+tr36qVKxy2jZ9LfrHswZHQwby/Gh7qXielpgCXjM
	aCL/lfkjw2VhRMk5iCaLZhhUtyNlI2Jk5pAbpYOpAj+HQ3s=
X-Received: by 2002:ac8:5d04:0:b0:55c:8b2d:bb41 with SMTP id d75a77b69052e-55d4a6ce73amr38497231cf.57.1794922860216;
        Tue, 17 Nov 2026 05:41:00 -0800 (PST)
Received: from localhost ([96.239.0.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0534196sm104516571cf.9.2026.11.17.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:40:59 -0800 (PST)
From: Axel Mierczuk <axel.mierczuk@1password.com>
To: ja@ssi.bg,
	horms@verge.net.au,
	pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	dsahern@kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	netfilter-devel@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	w@1wt.eu,
	Axel Mierczuk <axel.mierczuk@1password.com>,
	stable@vger.kernel.org
Subject: [PATCH nf v2 1/2] ipvs: avoid out-of-bounds write in ip_vs_nat_icmp_v6
Date: Tue, 17 Nov 2026 08:40:48 -0500
Message-ID: <20261117134049.52386-2-axel.mierczuk@1password.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117134049.52386-1-axel.mierczuk@1password.com>
References: <20261117134049.52386-1-axel.mierczuk@1password.com>
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

When an ICMPv6 error embeds a non-first fragment, ipv6_find_hdr()
returns at the Fragment header without updating *offset, so
ip_vs_fill_iph_skb_icmp() leaves ciph.len equal to ciph.off, the
start of the embedded IPv6 header.

ip_vs_out_icmp_v6() and ip_vs_in_icmp_v6() pass embedded non-first
TCP, UDP and SCTP fragments through before any lookup. AH and ESP set
pp->dont_defrag, so their fragments continue. Their lookups read only
the addresses and never use ciph.len, but handle_response_icmp() and
ip_vs_icmp_xmit_v6() size skb_ensure_writable() from ciph.len, which
then covers nothing of the embedded header. ip_vs_nat_icmp_v6()
rewrites the embedded destination or source address, 16 bytes
located 8 or 24 bytes past the end of the validated area.

Include the embedded IPv6 header in ciph.len at both call sites when
ipv6_find_hdr() stopped at a non-first fragment. Only the size of the
writable check changes; the AH and ESP lookups do not use ciph.len.

This fix does not depend on patch 2. Stable kernels without commit
342e24a339b9 ("ipvs: do not mangle ICMP replies for non-first fragments")
also need that commit to handle incoming ICMPv6 errors quoting
non-first ESP fragments.

Fixes: 63dca2c0b0e7 ("ipvs: Fix faulty IPv6 extension header handling in IPVS")
Cc: stable@vger.kernel.org
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Axel Mierczuk <axel.mierczuk@1password.com>
---
 net/netfilter/ipvs/ip_vs_core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_core.c b/net/netfilter/ipvs/ip_vs_core.c
index fd503f0efb57..d5da16ff9673 100644
--- a/net/netfilter/ipvs/ip_vs_core.c
+++ b/net/netfilter/ipvs/ip_vs_core.c
@@ -1206,6 +1206,16 @@ static int ip_vs_out_icmp_v6(struct netns_ipvs *ipvs, struct sk_buff *skb,
 				     true, &ciph))
 		return NF_ACCEPT; /* The packet looks wrong, ignore */
 
+	/* ipv6_find_hdr() stops at the Fragment header of a non-first
+	 * fragment and leaves ciph.len == ciph.off. Only AH and ESP
+	 * (pp->dont_defrag) pass the fragoffs check below and their
+	 * lookup reads only the addresses, but handle_response_icmp()
+	 * sizes skb_ensure_writable() from ciph.len before
+	 * ip_vs_nat_icmp_v6() rewrites the embedded header. Include it.
+	 */
+	if (ciph.len == ciph.off)
+		ciph.len += sizeof(struct ipv6hdr);
+
 	pp = ip_vs_proto_get(ciph.protocol);
 	if (!pp)
 		return NF_ACCEPT;
@@ -2036,6 +2046,16 @@ static int ip_vs_in_icmp_v6(struct netns_ipvs *ipvs, struct sk_buff *skb,
 	if (!ip_vs_fill_iph_skb_icmp(AF_INET6, skb, offset, true, &ciph))
 		return NF_ACCEPT;
 
+	/* ipv6_find_hdr() stops at the Fragment header of a non-first
+	 * fragment and leaves ciph.len == ciph.off. Only AH and ESP
+	 * (pp->dont_defrag) pass the fragoffs check below and their
+	 * lookup reads only the addresses, but ip_vs_icmp_xmit_v6()
+	 * sizes skb_ensure_writable() from ciph.len before
+	 * ip_vs_nat_icmp_v6() rewrites the embedded header. Include it.
+	 */
+	if (ciph.len == ciph.off)
+		ciph.len += sizeof(struct ipv6hdr);
+
 	pd = ip_vs_proto_data_get(ipvs, ciph.protocol);
 	if (!pd)
 		return NF_ACCEPT;
-- 
2.50.1 (Apple Git-155)

