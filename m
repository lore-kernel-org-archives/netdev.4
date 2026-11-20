Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202620;
	b=R6FinAU1VjL8wEKVL91NrugKNayH+UkLPWZ+Wg7pDgHqjHLyT9q11EPXwq3WcHVP/gE3
	 2p5HK1b8It7o3ig8ovx85hpVICI8KNwjM0X7U39EUMH4CEtI7ej5bikYJsIMJLNXQDCkn
	 nO7MyBg4ft7KH/u54xwRWw1ZXWmfW8wgC8O7mPBmY4OevLpLfReozt9CiQSJCzScmYuVM
	 I6K799v8BSSWEWHaj9FjDbsLW5DJq4yvgLWwIXeA3OIVJH+8ShiXrDji6fTlCStV4WHE+
	 CIaZ5x31qPid+S8GTIWqYI3p6MFwAG1C643e/tC0phVv2GOfPWiC7p+znBiwixD4B1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
	b=xh7gd7HX9vdHbmarEn8yvVspbth8EXttNmpt2dqBFlbtzi6LtKGUDi5b3QKkxwj9DD5y
	 bCCZqSz9yZvIwCgxrajQOoS8O3/9hyN3JjYWPZOO1WfcIrCdfS2OHmZjq5eLBgviww70S
	 TTCbL4HwT/TAHkW4mu4k7EaBqUl5VVu9kG+9YL6A0DIBT4w6DeW9TWx5k66G0280cbPQO
	 DbZP70r4dgdSMIVSO43zc5dBn/MVfsO5q4qX/i/cdM/+dvpaFkGwGYPsyS+h7OVXbBsQN
	 EG09+4BVGEAzcRH06Q727mKJIPKXYTRBapEWAlWw5J2ukHr9SrsRts+Q3Hk2OVIGgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=TIUK28Kr;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FF606A6E8
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1FF606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=TIUK28Kr
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-862d919fb1cso754607a34.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795202618; x=1795807418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
        b=TIUK28KrHHS/jEIHaRwd4V3J2bTkqF68AyeJA7kxAxFkCrDgrzR0UWEsPIpj2OLGnF
         wnMAFZO0ockNTR/JIsRZw23QC4Jqil0LamS8z1CgD8Sc04RBrwMS91VYsq0h6YV1zFHx
         uGq0Epykbl00jRMqwPJTZUoP7R6mG5B19s8fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202618; x=1795807418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA5kH6g2rHXaT3SqVp79TdqL6vsLj+rBSzEJqsx/Hwc=;
        b=Z3Gu2bYWAMUtxFRJyRTQIjhVhveHkDkPESTfqIoEoyYN0tNbJsqe6G3Jak81sCb5Qw
         MZhxI1bk8nl+qVekfKic1a+z898lJhM2P+mpJuT9Dv2F5Z9+HUGSPC6thYJX1iOeCWeq
         xxAwy9efVcuUK2/Q1cFTuRfXh7rI9zjtkeiWGmrDZPzLR4Ix1rMvdkOzSoPFdce+zeSo
         Xzyn/ffMyjp1p12WGQ/5eTwtRnD3kjnhqg6vW90sFUE2skeKhuDUW24xl3gAEyxvHKeR
         4g+wCG9h8ue0Ylg51HhftJGHx2/iqT4f4KXhS0dfqFnc4wg39w5kGPcWPiZ/UlfcFmXL
         w9Yw==
X-Gm-Message-State: APuU4Z9/JsHeRvuAP3bwB2oAlATsIFtH0lizZlkQK2s8Bjd8feboWgss
	us3fcbwmHsuu/Cman+kYF8HCRFaORozcxoTkCGcyqhkmRk1DUtIZkdxotxIoUf3ct89AZzSxoME
	vzNuDkQc=
X-Gm-Gg: AYBFou1ZL5S4JzFHEJ6OgbfjPsJtJIF2PoaazT4ivgZAhYDnRUugJL4Xv70A3CyK7Dc
	l3Bv5wAiiPLBjjxxSZf/ua7Q22gz432sPggxvxqNRkBG5Jie/ZzqkH62KpgyHWIcwywKBpauC2d
	rH7ot/C0XTV/fXEFolWaHRO7KSY34E10GzUPzhI8CZMwBVF+kl0rI1gn1sni0KRtEO59V0oaDgE
	wY1dTFKpuBUhMUbK8Mm0+N+n4xidBHO5yEf6D0y/0gOt3bey9Xfajttt4rIkPqJ+VgIK5n4jGIb
	obvrUliRDQTWXMnHtmpxx40NSA3/xH8VVVisPIGrZ3NWnMxqrmG+7zsGG6EWqBpyHpqLznfpeHJ
	l4Ow1RXtl5F4PjKrLq6Gh3FySt9jqMp6k+6mYCJoh4Q6rauxUqH1pvu0YyqAXiPC6sciRSb20te
	5LbKme2XvEgqv4I6RHv0BntJ/WnZYa5dyOdINOXRGRKQEBrk4mdjLMrFNmig1q2+98qcnClVc7Y
	eKyE/rjjf3zaiOvi1eUCRFR/nkScdlPK1ixjiA/yf6E23C/rh1B92LMbPCaN7dQlKmsoukIHxGN
	Esn+xnEVtzExlkNB3RhsMkhym8l2mRPQ5lxNWpgsEldrH8vGufplQOyvmvebcDfr0qd3gggVa+6
	0GLe3REkKombNuXuRhfF29LhRspzi5Q==
X-Received: by 2002:a05:6830:640b:b0:862:a000:c45c with SMTP id 46e09a7af769-86315963a10mr5573204a34.25.1795202618333;
        Fri, 20 Nov 2026 11:23:38 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm2639106a34.18.2026.11.20.11.23.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:23:38 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH net v4] net: preserve skb header offsets during headroom changes
Date: Fri, 20 Nov 2026 11:23:30 -0800
Message-ID: <20261120192330.48965-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

An MPLS LWT route over a netkit device configured with large headroom
can make aligned skb expansion wrap the 16-bit network_header.
Neighbour output interprets the resulting negative skb_network_offset()
as a large unsigned pull length, causing eth_header() to write outside
the skb allocation.

Reject growth that cannot preserve the network, set MAC and transport,
recorded inner-network, or partial-checksum offsets. Do not relocate a
set MAC or transport header onto its unset value. Check the actual
post-pop positions in skb_mpls_pop(). In native MPLS, bound the post-pop
offset before decoding labels; reject excessive LWT headroom before
reading the IP header.

The issue was found by an LLM.

Fixes: 1a37e412a022 ("net: Use 16bits for *_headers fields of struct skbuff")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Changes in v4:
- Move the native MPLS headroom check before label decoding and
  multipath selection.
Changes in v3:
- Check the actual post-pop MAC/network positions and reject the MAC
  unset value in skb_mpls_pop().
- Check a set outer MAC header and a recorded inner network header
  during positive relocation.
- Move the MPLS LWT entry check before reading the IP header.

v3: https://lore.kernel.org/netdev/20261113235019.74384-1-kylebot@openai.com/
v2: https://lore.kernel.org/netdev/20261110051258.64350-1-kylebot@openai.com/
v1: https://lore.kernel.org/netdev/20261030042246.74144-1-kylebot@openai.com/

I have a reproducer for this issue and can share via DM.

 net/core/skbuff.c        | 35 +++++++++++++++++++++++++++++++++++
 net/mpls/af_mpls.c       |  3 +++
 net/mpls/mpls_iptunnel.c |  3 +++
 3 files changed, 41 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..bc836adafecd 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2130,6 +2130,28 @@ struct sk_buff *skb_clone(struct sk_buff *skb, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(skb_clone);
 
+static bool skb_header_offsets_fit(const struct sk_buff *skb,
+				   unsigned int nhead)
+{
+	if (!nhead)
+		return true;
+	if (nhead > U16_MAX - skb->network_header)
+		return false;
+	if (skb_transport_header_was_set(skb) &&
+	    nhead >= U16_MAX - skb->transport_header)
+		return false;
+	if (skb_mac_header_was_set(skb) &&
+	    nhead >= U16_MAX - skb->mac_header)
+		return false;
+	if (skb->ip_summed == CHECKSUM_PARTIAL &&
+	    nhead > U16_MAX - skb->csum_start)
+		return false;
+	if (skb_inner_network_header_was_set(skb) &&
+	    nhead > U16_MAX - skb->inner_network_header)
+		return false;
+	return true;
+}
+
 void skb_headers_offset_update(struct sk_buff *skb, int off)
 {
 	/* Only adjust this if it actually is csum_start rather than csum */
@@ -2317,6 +2339,9 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 		return -EINVAL;
 	}
 
+	if (unlikely(!skb_header_offsets_fit(skb, nhead)))
+		return -EINVAL;
+
 	if (unlikely(skb_shared(skb))) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		return -EINVAL;
@@ -2535,6 +2560,11 @@ struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
 		return NULL;
 
 	oldheadroom = skb_headroom(skb);
+	if (unlikely(newheadroom > oldheadroom &&
+		     !skb_header_offsets_fit(skb, (unsigned int)newheadroom -
+						  oldheadroom)))
+		return NULL;
+
 	n = __alloc_skb(newheadroom + skb->len + newtailroom,
 			gfp_mask, skb_alloc_rx_flag(skb),
 			NUMA_NO_NODE);
@@ -6804,11 +6834,16 @@ EXPORT_SYMBOL_GPL(skb_mpls_push);
 int skb_mpls_pop(struct sk_buff *skb, __be16 next_proto, int mac_len,
 		 bool ethernet)
 {
+	unsigned int headroom = skb_headroom(skb);
 	int err;
 
 	if (unlikely(!eth_p_mpls(skb->protocol)))
 		return 0;
 
+	if (unlikely(headroom >= U16_MAX - MPLS_HLEN ||
+		     (unsigned int)mac_len > U16_MAX - MPLS_HLEN - headroom))
+		return -EINVAL;
+
 	err = skb_ensure_writable(skb, mac_len + MPLS_HLEN);
 	if (unlikely(err))
 		return err;
diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index ad4ad6f2001a..f6b77570ca48 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -403,6 +403,9 @@ static int mpls_forward(struct sk_buff *skb, struct net_device *dev,
 	if (!pskb_may_pull(skb, sizeof(*hdr)))
 		goto err;
 
+	if (unlikely(skb_headroom(skb) > U16_MAX - sizeof(*hdr)))
+		goto err;
+
 	skb_dst_drop(skb);
 
 	/* Read and decode the label */
diff --git a/net/mpls/mpls_iptunnel.c b/net/mpls/mpls_iptunnel.c
index 1a1a0eb5b787..5123394234cc 100644
--- a/net/mpls/mpls_iptunnel.c
+++ b/net/mpls/mpls_iptunnel.c
@@ -59,6 +59,9 @@ static int mpls_xmit(struct sk_buff *skb)
 	    !dst->lwtstate || skb_warn_if_lro(skb))
 		goto drop;
 
+	if (unlikely(skb_headroom(skb) > U16_MAX))
+		goto drop;
+
 	skb_forward_csum(skb);
 
 	tun_encap_info = mpls_lwtunnel_encap(dst->lwtstate);

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.55.0.openai.911.g06873a30d2f3

