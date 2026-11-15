Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700873;
	b=Nnd38i3VI00nL6qqLD+xdRkwDtksMN8jIuPIeCyCfGdNYR08gnb8ybTbXOPLb0EKlcho
	 utzQbz6yWtIKuyfiUnoX67oPcRxyuClwmx4WycPiJ5ZLvz+AarDPIeXc0gHI7FN7EUl0N
	 hxYXokvgaIDMeJ84uj/5jRq29vatny2bkuKDyPY2VDsULUGrISIlE1vtNzenJEQ4lGDlc
	 Ho5wuNplEbacDcaUsq494cc9jwExMvXMtvCiZ/HdyJCoUB97OO2Yex9RGiLTf+ySlP9dB
	 5TOlvKM61qh0HVZk96v2a1N+umegbhZq5lGRoR+rLbpFDfoNkZO6scg7Op3TQ0tp7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nzjK3qRl+Pu4qquC/Ip3LRng8SL8FLwBXbtkRFDwJZU=;
	b=VnmMvoVRUuB9G8v190i7/J3VNas29jXJoz6fHl7g3RvHwQROWxVKY93f3hfiO2748AZK
	 39rtg17AQ8xZ9xIe87OY+bM35lYDDEXyAUVm3BDNpmmwzaSvlEQkm2djoAj9NwWR/knL2
	 /i4mPu9Ea1/ZtCDFqHkJo3YmV7gFEExbgKqmmAaxUn0rRLhfRR7NNvaAtsEgj3f0JXHUs
	 wfVcGzi4V+z/wc1pmfVzVVhHggb8tvNo021hgoGpanHusp6lNLZv+UrYxhrXTr0z6f/hV
	 H1cw5jQ4AQVJWbs0k3/YJPmdoc1s1y0oTIf8Dm3CdSwzBq+BZV+4TpUSH+JDaFhS68w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhcjVLPy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D2606A33F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9D2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhcjVLPy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso15701655e9.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700872; x=1795305672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzjK3qRl+Pu4qquC/Ip3LRng8SL8FLwBXbtkRFDwJZU=;
        b=nhcjVLPyGGAlUPHUMwU5aP1EA7J/dnRJpYp7JFVpQ9c+yKtyLaDuHgTTAnfUxinbwd
         Qt79Df8XQnZCdlfVpFs5CF3To8N8jrDp9XQi+4uzc1bpp3x+zNdh4b5nrc7AGMwROfvh
         Ms59q0W707FzdCGEjD7QSaWFb77H06FQ+E9x29irC6NSHv5g+UFAIy8ZLDi1LcSegp+h
         NC3z1xdDcMqDlzN55alJ8N74Zujb85z6IOof8afnDCh9aj+I/blEVZ2vf/w3ZtQfBW+y
         2cA5dpNy0GTVRKMs9DI8myZf/vf1xCNgi84ENLCIkNb0TR1ohON0n+opcGwZyMu4oR1A
         8XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700872; x=1795305672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzjK3qRl+Pu4qquC/Ip3LRng8SL8FLwBXbtkRFDwJZU=;
        b=I8Aze6ONA/J0+ExYFPsdrkyLwoymL42hO6SvTWXn9mP5RPBbps/rBvZGUDdJKQsCvB
         rEICiBlqW+Qu+nO/E8eGglV8MMYDH+jqGs9Nly8Oz/GhE8rj6UHPKE+JX/qmW7mDlGOr
         co5fE2ioUZmihz6jcI441CgLa3NIjWDHIvoPCD0OMbtKsPzf2iXp7pG8HrpZOIvd3YJH
         H+ioHYTrfccH0nqxxK5MbB4A1A/Gzji5vmLRj892+zPmPmQmjXze1Gv7g+NK3fR1pDm/
         vYuF97tLG9t39ouS7FVXNSmSnOZCKUYTjoQDyG0b1t/h22rMDWcKrvNBV2elbKjTtbFG
         8u7w==
X-Gm-Message-State: APuU4Z8f6WdS22CW3yE+nNI/y/LgThBQKWjkFw4dOc4Ry8uqaZYW9NYo
	x6mT3SSbhDevb6gVLgvP3/VBMU6K8f7+beBvQW7ja+SYr6zAiekD1WUTfQ+3iw==
X-Gm-Gg: AYBFou0EfPetEI6jKBpR+G0QeTWBJaVt01dq68QdEfoGq9wOdap6of181bndHzKz91G
	yP/V5JxXPG2fqNjDFCsc8PS06SyyjfDvOs2oFAyIhWionyNHPptYobYx7X02Yj8Zi6fpDeRpey4
	dvKMX915feg3gf337is/XaptwYkwJ9YFAY88PY+JzGueUA1GBSmBRJ3t9NC0rZW6+fbDY0+o3K1
	+GEbFppE92a/SxneWuboH1JWyYgOb3eyY36aFYjyEI5hoQlSZbD5Y/JCusL5qUoJcY4NYWNPpUh
	pG91c6xDI/Wrquc0Uwk4zXgCjrbtEPM5JNZsy9li2Mo16iYbqlQRJTyMatKwudenzW+g/i6pmRb
	f+ixOsgcD2IOzOljHRo7QUTvFLdmM/MT13ntkAWddPaPZYoY1mCCFRPiMf51tBls28DJI71mz1l
	KsYMkJk+3N21azqMZ+cKEaofyuIw19ahJRjznxFKNeIGvLLQT7h6b3tk/puBbZewJo50KS1yU7s
	AiWPb1stLAPmkk1epN6/dkbFR7OGzHSpsnGx+KX59CdJUcbZ7H1qK1qzZ45glrGY7dTtOK13WTQ
	TixvJb5fxsU1EjN8OkVf2I+/DV9eDAqfKL4WO6NTOqLB4VYvaQQ=
X-Received: by 2002:a05:600c:6092:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb55a42ff2mr131541855e9.9.1794700871490;
        Sat, 14 Nov 2026 16:01:11 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:a75e:9a00:a644:3b4b:4691:92a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm142366405e9.0.2026.11.14.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:01:10 -0800 (PST)
From: Justin Iurman <justin.iurman@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrea.mayer@uniroma2.it,
	justin.iurman@gmail.com
Subject: [PATCH net 2/2] seg6: drop the packet if no outer source address is available
Date: Sun, 15 Nov 2026 01:00:47 +0100
Message-Id: <20261115000047.14669-3-justin.iurman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115000047.14669-1-justin.iurman@gmail.com>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
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

When no tunnel source is configured, set_tun_src() ignores the return
value of ipv6_dev_get_saddr(). On failure, the source address of the
freshly pushed outer header is never written, so the packet is sent
with whatever stale bytes were in the skb headroom.

Return the error from set_tun_src() and drop the packet; all callers
of the encap functions already handle their errors.

Fixes: 6c8702c60b88 ("ipv6: sr: add support for SRH encapsulation and injection with lwtunnels")
Signed-off-by: Justin Iurman <justin.iurman@gmail.com>
---
 net/ipv6/seg6_iptunnel.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
index 3bc47c5614ff..395614fdb83f 100644
--- a/net/ipv6/seg6_iptunnel.c
+++ b/net/ipv6/seg6_iptunnel.c
@@ -107,12 +107,13 @@ static int nla_put_srh(struct sk_buff *skb, int attrtype,
 	return 0;
 }
 
-static void set_tun_src(struct net *net, struct net_device *dev,
-			struct in6_addr *daddr, struct in6_addr *saddr,
-			struct in6_addr *route_tunsrc)
+static int set_tun_src(struct net *net, struct net_device *dev,
+		       struct in6_addr *daddr, struct in6_addr *saddr,
+		       struct in6_addr *route_tunsrc)
 {
 	struct seg6_pernet_data *sdata = seg6_pernet(net);
 	struct in6_addr *tun_src;
+	int err = 0;
 
 	/* Priority order to select tunnel source address:
 	 *  1. per route source address (if configured)
@@ -128,12 +129,14 @@ static void set_tun_src(struct net *net, struct net_device *dev,
 		if (!ipv6_addr_any(tun_src)) {
 			memcpy(saddr, tun_src, sizeof(struct in6_addr));
 		} else {
-			ipv6_dev_get_saddr(net, dev, daddr,
-					   IPV6_PREFER_SRC_PUBLIC, saddr);
+			err = ipv6_dev_get_saddr(net, dev, daddr,
+						 IPV6_PREFER_SRC_PUBLIC, saddr);
 		}
 
 		rcu_read_unlock();
 	}
+
+	return err;
 }
 
 /* Compute flowlabel for outer IPv6 header */
@@ -213,7 +216,9 @@ static int __seg6_do_srh_encap(struct sk_buff *skb, struct ipv6_sr_hdr *osrh,
 	isrh->nexthdr = proto;
 
 	hdr->daddr = isrh->segments[isrh->first_segment];
-	set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
+	err = set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
+	if (unlikely(err))
+		return err;
 
 #ifdef CONFIG_IPV6_SEG6_HMAC
 	if (sr_has_hmac(isrh)) {
@@ -304,7 +309,10 @@ static int seg6_do_srh_encap_red(struct sk_buff *skb,
 	if (skip_srh) {
 		hdr->nexthdr = proto;
 
-		set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
+		err = set_tun_src(net, dev, &hdr->daddr, &hdr->saddr,
+				  route_tunsrc);
+		if (unlikely(err))
+			return err;
 		goto out;
 	}
 
@@ -340,7 +348,9 @@ static int seg6_do_srh_encap_red(struct sk_buff *skb,
 
 srcaddr:
 	isrh->nexthdr = proto;
-	set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
+	err = set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
+	if (unlikely(err))
+		return err;
 
 #ifdef CONFIG_IPV6_SEG6_HMAC
 	if (unlikely(!skip_srh && sr_has_hmac(isrh))) {
-- 
2.34.1

