Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680829;
	b=uCJnIAf3zd2krppwgRNVsXOHZHt02eZSYmX239s3aySK0twpo5kvkLYR8vbUIVxkWCGh
	 kqBDzbgQZxyXH8VHtwLJn/ngpjFOHlEaFO8AuIGYlWRvsR97M4G1vz1177U34ct+u1Y3c
	 nVasQ60ZQfaYFK/e9TbJRVENZGcqS2wVZc42p9Z4MLg0jpWc4w78a4sTw1+QciPK5Z7hF
	 ILUcbj0yCeh8i3YgjxoD4RXgCFOGrcstmqxzxHmR/1pVGcimMbUwUpys8yfz7hAavJMJ1
	 IWlbzbnn/UKzC4qM+SILCCGq0ZhNnBWI5czUptLBtbUzM6CiIvEfGA8HMiusmDtxweA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
	b=bdJsdo1dudCZPtcHIjR0miG0s7HdChblO/gQALF+7ieQAcNTzHV5n/eNgE7fUv45xP76
	 dmA0qQ7okNvaNUqzZl0AkUlaaN+Kp4n5mqToGqd+RnSB2SYgnGFSNAhqZRIYwxTEdkHF+
	 ZBMpKmHFrZ8W65FVzn4HRgIQ4tPbU7WSWn6nLyplaDR0JTqKtBEG7djxqcsl1JyTKq28A
	 jBC+ssnLD5PjEovHt0lLNSAxHaV4KjlEXWcG7fphE+B+Oys6ZUAhIwX0+r8Jy7vHMgJh4
	 ck6cQXtZw+sT1ojo6YE+ZIa2zkOw/xLa2QrpqcJozZXy5dwLI9hnI0iim1N/YRYUhfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Juhy6Mmh;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07431606A336
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07431606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Juhy6Mmh
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50aaad19fbso127333566b.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680827; x=1795285627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
        b=Juhy6MmhgGon6OdfQwDwIAgPdVBOOliOn6+qnipkggEzUiof3BOERnBnwGu1jNL6hL
         IwpCGJU8i4Qqh74dJYXd/o+H8r2SlQXjeljJCCYMTL/BlCgMWLttcewgWSq73qXwvX7+
         itCJ2vVZOYvXcpI7ooueXx7+bZ2K9740RWJdIlAE4rzSl/GTogJcLEC3HG/RPUkNtiNw
         BSgKwf/k74CaxWM33GCr00PJEnPQ1H7Ao5vqJhu2Ze7dandmFDIu23jsmN8aVr18hXd4
         gQaG1mzXCpshcss+3GQI3MOw7HSM5Bnu1+TUcktw8kPsCKKuFKQViM+iBHxzzs77E6bH
         62mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680827; x=1795285627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
        b=sKQ3aLFlhJongE7wpIIR2DRujS7322q4+n/m/osuxLBaWklhrJGj9EhJvjbn1yXuqS
         vtrBUi+Ij8sFpuAJ7hVTFU2QTx1106Wc4IapV3Cv3h/jNh+07zUoQDbyzbFNRT6MnMng
         Px08Vg5n2IVTDw8wLOnuk3SfGqa1IytWaLromyh4wyi6F9IiiH4fGpPD2F07FjuiNbtH
         J94A7JvaV0vawLsBJcx7evBtLIHbR/5DwxeV2Olu61IQB0W6gHi5haUkZtIQo8XKLwiy
         YLxNPPdWq1m4nU7qWN8jfyHk6+lrPoPpwxgfSCTlp6Y9RJrA6wKQNJUyjeNNtQUPAw0u
         EH7w==
X-Gm-Message-State: APuU4Z8AV3xjrWywIiZ9tCSKu61jFyRPpjsLj6ezJJ8ySirCoHAzDzCZ
	YFJNuM8DrScWs/LOvV8NqS1P0j5WdBX10+2xNANGQsXj7vvtd4+X97T8224J7wLe6uheWQ1G7iA
	Mg0MPcasp
X-Gm-Gg: AYBFou1k2USH0YnwuPDHB/ZLLxCNlS+Iv+Yvs3rNJHekY1hbCv6bZxfxxWCPTKTm0PX
	wB5FhSTeUH/zEgvL5cs9Bb3nspCx9b/XMPyWflwlDGda3b+tQbPW/aZfKPztMjkkaYe7MUuXOlE
	TXXkCnTYus7HJgKPKIwddMxB4aluy0AqOH7p54b7ySPrxG6w0JSs253E+d1o1zW1qg9B5ZnW3Xy
	WqIaIINQBCk3navrQif4Dod2Mfuz7XRTjQomAvxuUm0WS5Y8fejtelLlrRK3Ptw1nD/Hx+Bz5iO
	Q3ZeGMt+YeZTfKPhTdyq5i3rEHxEaDI+ijDB+JyN/SYDWNVcr+d/u+Fu9+t7DfY+6yc19JROEBa
	aExzggJpkgNC5A5b0saYvfqXuvDo4RyTIozs9iJU4fdD+/j5WsOZoKR0UH+5a9SjhRlkR2sImWH
	a7Vc4dUEIu/bSNZKyqbI+3ukvF7Sxj1oV7rtG/lykgw8mHJ2oNESlxJ8rh8YuA2DiINbAiKUjRl
	qGogz+M9T8yEa4LhiKCIGt4XHoFpvmzrfCH7R4lAW3ZUs10mPAYcB1bxzhgi2jx++UPeWpvRd+L
	3ek5Vq7BgCg4dk+bQEczCHLEJlFgH89e5aNosioNNN8ez1Kz+QY7Ee2/7LyPN8yI4Yj88uloJbF
	5tdvRMkkMZPWHxWRt7URiU7P915fMmQo4JFJXgcfgWo1imNGVsaGfaLc4HVZeDASugmTUz+a40P
	L9hNC73MJ370LtLjLaR/yBwNs+PhQIPO6A8VCj/q3Z5YRU7cKh3U4OsbxAKBos6mHDyK/ewyEnz
	nrFwafodEeN+xuBiBF4lIRjltSWT7fyRPpXKqIrPdVZLne9fuCq4dIXq2PzjZn3z0qJrauGaGgf
	mR4=
X-Received: by 2002:a17:907:608f:b0:c4d:456c:4a29 with SMTP id a640c23a62f3a-c50963dca44mr489044066b.14.1794680827253;
        Sat, 14 Nov 2026 10:27:07 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:06 -0800 (PST)
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
Subject: [PATCH net v5 3/4] ipmr: set up GSO state for tunnel vifs
Date: Sat, 14 Nov 2026 19:26:59 +0100
Message-ID: <cbd032be365b09f1108faed42ca165531d5dd99d.1794151759.git.julius@bairaktaris.de>
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

ip_encap() pushes the outer IPv4 header but does not set SKB_GSO_IPXIP4,
skb->encapsulation or the inner headers. A GSO packet forwarded to a
VIFF_TUNNEL vif is then rejected by ipip_gso_segment() and dropped in
validate_xmit_skb(), after being counted as sent. A device with UDP
segmentation offload is handed a GSO packet whose transport header
points at the inner IP header.

Call iptunnel_handle_offloads() and skb_set_inner_ipproto() as
ipip_tunnel_xmit() does, reserve one outer IP ID per segment as
iptunnel_xmit() does, and set the outer length with iph_set_totlen(),
since a GSO packet plus the outer header can exceed 64 KB. A GSO packet
that GRE or UDP tunnel GRO marked as encapsulated already uses the inner
headers for its own tunnel; drop it before the vif counts it, as
segmentation dropped it before.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 836f3f95b20c4..09d6b0ff1ffb7 100644
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
@@ -1951,6 +1955,9 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	}
 
 	if (vif->flags & VIFF_TUNNEL) {
+		/* The inner headers can describe one tunnel only */
+		if (skb_is_gso(skb) && skb->encapsulation)
+			return -1;
 		rt = ip_route_output_ports(net, &fl4, NULL,
 					   vif->remote, vif->local,
 					   0, 0,
-- 
2.53.0

