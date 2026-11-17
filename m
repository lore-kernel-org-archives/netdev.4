Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950344;
	b=YZmYj+WhRVeZe1E7Jie2NmZ0iCRZLo7kb7hIPmqe0UUSpLXTFmqvuPML5pfCj8YWZeHf
	 5qhdd8nRE/Y0xE90Emd9MhCh/la2bW4InPtWxaYcv1n2IY3Q97DhUdqecP+1HJo4suHfm
	 TEDpVTrDwKi7WZ6Sdz+ECEw846I4QdmLhUQrJIblgBy7dAvMcjK+aCb3QAQ6FveW+efeD
	 0c8I4/oX8s/jUxgGh1P+NAX6+B9id9yeFQAhOtbuNSknu9CtqpK6+APDu9hqSOMlLELpA
	 EVNlJd9YVxMJ3gUFdbbGNarDokOPC0iaPhMrcMKHw1YtKSfzjBS7zX/+BmuQQxaEkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
	b=kOiDNkyngALONGX9BT5uSTyPp+UiPrYlqprNig/bFDCmYdSBhPN54vpCmoE84ylQUhwF
	 hd82VIXWFZ/GhHB5/zGcPG2/mcaO+5eZO9VB9mkQOiFt9njwzZsQbxD9eHTZ3QniaHQau
	 BWemo/3m1NdGH8znLQ+Ac7H3zEboA1XnLyVF+96TTJzuPbpIKIl0mXlphoPkl4pH/Zr+N
	 sxMq+HPzVUqo3i69aCnlBvgAvRid89LwJ7j2rBXHMfYsUr841oQuTvAqZ/y+l5bK5OR+R
	 gLZNyG4sXseCYZ60XF9zC5U5N6xzKJ+XdrtSMDhlVY/IDdtW+tPirR1rg3rJmwYfjWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1Bs1jil;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1760A2627
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D1760A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1Bs1jil
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso211039e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950342; x=1795555142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
        b=M1Bs1jil3Pji5gyRqkQ6KQMECmLVcNYIvnVkgLgfvVsVKvasMBzo4IRxV6fexnwBMi
         7CdKUOhWjSyfqojjx1I8jiWICgkh9cmjBQ+Y3ZGwfg5eWch2VGp7nYs6sZ2pC9Z887mK
         iiB64ki47TovXpFpWZuDqHo74nxge6bi+B2Y/3fyG4y3hGFOAiVW7YuMLCj5gBlKqO/W
         z362cqjQNn7jyOJIwPs+qKbbr0A19MfsuNLmmFQzplaOBPC3tDD29L8/k31yn+HNhsvF
         5q/N/U/lv9/Yjd3Sr7Nj/ctyesQDaDz1evbpTO4I/NgB2fsPCD+QGpnpVQy8+w2SfP5F
         edFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950342; x=1795555142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrprGJi07n9XBqwPXj3E3onpWWQViLbV9z8e9Jua3Rk=;
        b=xZls48laNpIbNy5s4uQO3qTm6y9tevM5+QYndeQPNObRRXi+KtXzWwMmkmij0QXBjM
         R3XxyZR+wwoWOli17oayrluEwDOKEsfMk25cLkPyx7sLrmVfB2WkJHp6hZzcmS8/WS1K
         Si+bv9AwxRGtU5nX59yhBuq7k9Uf7z8MMpfeMPi8LeCOQvIFadqTAEtq+UV5P35SV+r8
         ypI1rn43VGtZR4Tp/GtOqXi3jWLpyvBUPRI/su9mv+oRWKjCgIaMIEQwI4ZTULOwnmsF
         eKUZcobsZBcJw5DEonOwd3ArMG5vBW2r42a3wJSuSYkcU6vWnGENgvAayuN8the+/GzQ
         G1hw==
X-Gm-Message-State: APuU4Z9v9aCef3ChIYkiqyx8P349r09lRcmhu7zwIcMbBUmFVhuxneAo
	YQ4ucEBD7gnBIolL4j3xttXe66WGZESaMzuvdcTUdy5g0xd9uZcnCr511mEu3i727Q2s1A==
X-Gm-Gg: AYBFou1K2oiIL75vak0lTh3HjejgJSAuCyxtT9iDnaUF0rwAD4GtY/vI8GsNOzDCp0R
	M6nGZISbLdVQt8j/jOhXNn71mjTwhtI4HmnLr8XHjmhHuv0hCrQDzyv78KMdbuO3PNGIvo0ay/m
	ZbtVVmy9rKnHe6X11yRekzJsmTaA7caybbuSwhauYTmcAZbApHgSqtgjmcmi5u18MkZrpdB21JI
	SrYHS7cpr7VVQqr5ibTnr4/fLx128t+jse0p5lXCFQBUk1KH3RifKwFGa75ccj3iTLU2l1Un//z
	aCsDyblaol8OEz7jveHwwGbt9JBo/xYUGJ4UDVpI6U0YQg+ywJPQJp9GrROHq8b/q5qtLkrAMFt
	WXONy6ddzEVVJ5NO+Dx4xAWkj1ePk4C/1IafjnE9F8I9i7W3pBHk6he/UvyafIGCqeRMgL4yEc4
	l0LAW3w3Jn2FdkQ1gUjqxJJfAvGKv+LgWIE0UKIBGjonhJhb40Kzpb5ls5y7vt1ZNOu5nOE9lYf
	3AGtMLmFUbVEzFZCkAdWIpYuEDDmhrPXwLPbiVN6URFTi+e3SfhQOKlVmNCg5o1LacUSppyiUFT
	kj5AyrLpDPVfOUteiEfUowlM0srBgy1oax1YOMLWdrhEKqBNRCehmgeC+06aq2tXGYVc2Cld+ed
	zSagUkmeEPLxjQ7yRriU=
X-Received: by 2002:a05:6512:3a96:b0:5c1:5a43:6291 with SMTP id 2adb3069b0e04-5c1a9c09b13mr119951e87.20.1794950342339;
        Tue, 17 Nov 2026 13:19:02 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:01 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 6/8] ip_tunnel: make ip_tunnel_encap() return a drop reason
Date: Wed, 18 Nov 2026 00:18:51 +0300
Message-ID: <20261117211853.3733250-7-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
References: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
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

IPv4 tunnel transmitters need the reason why encapsulation failed.
Make ip_tunnel_encap() return NOMEM when the FOU or GUE build_header()
callback returns -ENOMEM, and TUNNEL_ENCAP for other failures. Success,
including when encapsulation is disabled, still returns zero.

Update both callers in ip_tunnel.c and the one in sit.c to test for a
nonzero result. Their old negative-error test would miss a drop reason.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  7 +++++++
 include/net/ip_tunnels.h      | 16 ++++++++++------
 net/ipv4/ip_tunnel.c          |  4 ++--
 net/ipv6/sit.c                |  2 +-
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 83a17e36fed5..73053bd25c2a 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -132,6 +132,7 @@
 	FN(TUNNEL_OPT_MISMATCH)		\
 	FN(TUNNEL_OLD_SEQ)		\
 	FN(GRE_CSUM)			\
+	FN(TUNNEL_ENCAP)		\
 	FNe(MAX)
 
 /**
@@ -640,6 +641,12 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
 	SKB_DROP_REASON_GRE_CSUM,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_ENCAP: failed to build the encapsulation
+	 * header of a tunnel, e.g. an unknown or unregistered encapsulation
+	 * type.
+	 */
+	SKB_DROP_REASON_TUNNEL_ENCAP,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 792690ae4f26..87046ba50d45 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -541,18 +541,18 @@ static inline int ip_encap_hlen(struct ip_tunnel_encap *e)
 	return hlen;
 }
 
-static inline int ip_tunnel_encap(struct sk_buff *skb,
-				  struct ip_tunnel_encap *e,
-				  u8 *protocol, struct flowi4 *fl4)
+static inline enum skb_drop_reason
+ip_tunnel_encap(struct sk_buff *skb, struct ip_tunnel_encap *e,
+		u8 *protocol, struct flowi4 *fl4)
 {
 	const struct ip_tunnel_encap_ops *ops;
 	int ret = -EINVAL;
 
 	if (e->type == TUNNEL_ENCAP_NONE)
-		return 0;
+		return SKB_NOT_DROPPED_YET;
 
 	if (e->type >= MAX_IPTUN_ENCAP_OPS)
-		return -EINVAL;
+		return SKB_DROP_REASON_TUNNEL_ENCAP;
 
 	rcu_read_lock();
 	ops = rcu_dereference(iptun_encaps[e->type]);
@@ -560,7 +560,11 @@ static inline int ip_tunnel_encap(struct sk_buff *skb,
 		ret = ops->build_header(skb, e, protocol, fl4);
 	rcu_read_unlock();
 
-	return ret;
+	if (!ret)
+		return SKB_NOT_DROPPED_YET;
+	if (ret == -ENOMEM)
+		return SKB_DROP_REASON_NOMEM;
+	return SKB_DROP_REASON_TUNNEL_ENCAP;
 }
 
 /* Extract dsfield from inner protocol */
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 7d8744ed1664..f3c5d8424925 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -619,7 +619,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
 		goto tx_error;
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -780,7 +780,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
 		goto tx_error;
 
 	if (connected && md) {
diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index a7ec800216ad..9576d146c961 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -1096,7 +1096,7 @@ static netdev_tx_t ipip6_tunnel_xmit(struct sk_buff *skb,
 		ttl = iph6->hop_limit;
 	tos = INET_ECN_encapsulate(tos, ipv6_get_dsfield(iph6));
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0) {
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4)) {
 		ip_rt_put(rt);
 		goto tx_error;
 	}
-- 
2.47.3

