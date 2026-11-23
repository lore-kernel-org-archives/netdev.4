Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430538;
	b=x3IiD8NaOSw1ahP1LaI+AsxJ4CuxSIdPt3ZNZxtPGxAkKwQ0QsDGQT1UuzSdZAm3Jl/C
	 NacJkJj+SFV/J3WjtvehnHe92PT3rs4RcAI5miGFvgKpHmmGs/ai5GhRZ1GVP8U7CKV0m
	 7JBMUxi63TOeUXq91JCyr22Hl9ccsJC6Kjr6VEfBerCE9s6I7ptL/SoBR/tLQJ9I4pEb9
	 jmSUXDlakQRr0LFt9QQDXekUg1HU0tfm2VkDPxr74l0DtebNApmLh9QjGE8GWQspw/jnT
	 yCGbPpHkOjVkFPArufyzdKvJ0fdn1eDfaEckqTk3dU0db4PEgOlo/o0cqHUF7zj0Hog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
	b=01y5bpgFBxT8UiDBFQ+Aap9mr9dDjyi4CjEBMQD1La4KH8+TBfDyfC9RROLu3TaamJRn
	 zJXbnexHyK7t8YHPhoUpWO1wq6udTYrSK73sfi6XPOClfoFJQkRnNj7Ucp8RQSdLALEIj
	 zD0UUgr5fRhlOU4rHYQaJ83KU5alVnBUK0rFun4zzu+fEQvbRDC+VohQpfrlZEDAjZr67
	 Zt3aRGNbnYGimbSWdLoStNeKqbuqGKDaYT0mzvbH/jTi+HN9sbTlx05yEvOIh9U19mGrp
	 /Fu4e7+r3W2OVOu/CUYqpO/8ksYEyLUZQ5JvWOotpIOQFVYxaem62fEl6UhBYUx6zdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbE0EcD2;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F324606A334
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F324606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbE0EcD2
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1b8120565so1723009e87.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430536; x=1796035336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=TbE0EcD2HmwZYHxVytSn3JrmXZnugMzpnM51QPW4xfu7LSF/P/nw+4ksDtf7HP6oEC
         qKMLW9bPluv7wq62IIpXbkokKvRkkwWCQxGFbN8D4bseyDAgENj1Smpktb+dXm+f59oq
         uZYL+eoEjeTFXKSUYl4w7VAyxrrlvHEfixScszjhMcKUOdUowC0ziL50FkBzqgG0CXM4
         xnCvz6hMEtqItflETBwur4nGcef5GwDmTbBKYvNWyTjjtvN29MBrHsKvkk2opvEYTFoX
         Lk3rmTeUah9CElX05+75AsyqujWmCSblwDEi4T6RTYqscgKtOqNG2RpLacBqSRYqJoB+
         PvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430536; x=1796035336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=tQ+eFf8iNUux4hJSH0dU0azNLlhsVTY/wn0/Wd+poynliD+AsG8fD1/UsBruEhsCSK
         FB1FVRk5x0eOfXkOWJfq/5If+KkN5nZwsf1PraJ5HaT2ry0dC/KkXzHHj6s8d42mLq2X
         zVHEp9AxQH5B+veqLbJ8yYCtOl48GRXaFC3hqIPNA/TeWjEORqi4ggRAQ80mi1MDkAED
         cK0tIhe9X813sPODOdOq97mmyaLR6T2/UnCZDadFCghUV+DBTanjGHIuDvHKgfBOQ8Ux
         AN3+9+7shCd0WGzaP7s9O5PCevbdsEEhIy0yD80XwUeEqJ+UYQ5PgZMrY0yxsV7Qy4Kd
         Qwyg==
X-Gm-Message-State: APuU4Z+paFb8iofZ0pWXkyDXkobg6B76HBty70Vf90v8kKluTBxsuYuV
	DlaURtUVh5VG7OGg+J3JXQJ1LQZ5I3VYomdjb8Kivlf6oToAuALumnrbta632KLwslOslg==
X-Gm-Gg: AZFdTZeS3HkHEmpqLr+7/kRLX1XwF4H3wj2ugHYcjrdYZZdvydffD1HiD6QjJGe4hVj
	ptHS9Pyg+xb+hm4irmHMwQRFDN+ESn8JaZ6Q6cmjZMSU1yaKN8uhT6tjtqRBCqJX3+ymX5hNOze
	FBAG7pk16vAqulxZWfktwuY2OQY6J2Okm8/IEVXcFZSj6AWwg1lCxEZxKFW/eTb9y+e1hwe7gB/
	zNPTo785Vp6xzh5e67lBzEnWfa7Au3BudF8sCT5RAZ1rmUN7prbUM3XuYk0UQHJjv3h8jadCv9z
	1bG0PWBDuzE2QzMVz9yzHlwHHeR6zb592oq2dFGKZX39AJKiGW7q2t7d1+L3UnxD/t7Cr1DpPHb
	K8mwGpygRM7BLNaXy96DoXKXUHUjOifJ05IC7bcxU2ajGZUV4VljcsAF7WioL/KeMWQbX2Dau1H
	qWQzHEwHevMG0xNEXomzq8knrZeJ91UNFk9HPV9yo7BwU6QPtVCiJdUuIrrJPowUHFScwpSIC/k
	6qaAhXKjjhjN7g8zZ1ymx7bblew3dKqs6v+/9f/aauRham5DG7Dx4NUjUaphVyQ4lTtabHhqoof
	LT9ORaWTgJSmRGnS1IHLI/tpxpW6X1aY+mnfFivBqU0TmaSbaFccLtQ4iflwz6sWOE26bfPUkM+
	obOyJH2x916lSrftyqA==
X-Received: by 2002:a05:6512:1193:b0:5c1:57d3:efd0 with SMTP id 2adb3069b0e04-5c1bc80fd63mr2925805e87.35.1795430536150;
        Mon, 23 Nov 2026 02:42:16 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:15 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 2/8] ip6_tunnel: add drop reasons to the receive path
Date: Mon, 23 Nov 2026 13:42:04 +0300
Message-ID: <20261123104210.199916-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
References: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
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

Report the same option, sequence and ECN failures in __ip6_tnl_rcv()
as in ip_tunnel_rcv(). Preserve the reason from skb_vlan_inet_prepare()
and use pskb_may_pull_reason() for the Ethernet header check.

Also report drops in ipxip6_rcv() before it hands the packet to the
common receive path. Distinguish a payload protocol mismatch, an XFRM
policy failure, a header pull failure and a metadata allocation failure.
Keep NOT_SPECIFIED for ip6_tnl_rcv_ctl(), which returns a single value
for several different failures.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 45 +++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca467..4912b08228a1 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -813,6 +813,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 						struct sk_buff *skb),
 			 bool log_ecn_err)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct ipv6hdr *ipv6h;
 	int nh, err;
 
@@ -820,15 +821,22 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno &&
-		     (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OLD_SEQ;
 			goto drop;
 		}
 		tunnel->i_seqno = ntohl(tpi->seq) + 1;
@@ -838,7 +846,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	/* Warning: All skb pointers will be invalidated! */
 	if (tunnel->dev->type == ARPHRD_ETHER) {
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (reason) {
 			DEV_STATS_INC(tunnel->dev, rx_length_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
 			goto drop;
@@ -859,7 +868,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	skb_reset_network_header(skb);
 
-	if (skb_vlan_inet_prepare(skb, true)) {
+	reason = skb_vlan_inet_prepare(skb, true);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -881,6 +891,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -898,7 +909,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
@@ -941,6 +952,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 						  const struct ipv6hdr *ipv6h,
 						  struct sk_buff *skb))
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip6_tnl *t;
 	const struct ipv6hdr *ipv6h = ipv6_hdr(skb);
 	struct metadata_dst *tun_dst = NULL;
@@ -952,21 +964,30 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 	if (t) {
 		u8 tproto = READ_ONCE(t->parms.proto);
 
-		if (tproto != ipproto && tproto != 0)
+		if (tproto != ipproto && tproto != 0) {
+			reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 			goto drop;
-		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb))
+		}
+		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb)) {
+			reason = SKB_DROP_REASON_XFRM_POLICY;
 			goto drop;
+		}
 		ipv6h = ipv6_hdr(skb);
-		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr))
+		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr)) {
+			reason = SKB_DROP_REASON_NOT_SPECIFIED;
 			goto drop;
-		if (iptunnel_pull_header(skb, 0, tpi->proto, false))
+		}
+		reason = iptunnel_pull_header(skb, 0, tpi->proto, false);
+		if (reason)
 			goto drop;
 		if (t->parms.collect_md) {
 			IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, 0, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				reason = SKB_DROP_REASON_NOMEM;
 				goto drop;
+			}
 		}
 		ret = __ip6_tnl_rcv(t, skb, tpi, tun_dst, dscp_ecn_decapsulate,
 				    log_ecn_error);
@@ -978,7 +999,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 
 drop:
 	rcu_read_unlock();
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3

