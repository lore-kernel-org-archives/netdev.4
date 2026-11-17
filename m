Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950339;
	b=Ri1efwxgTH3hhtFQSCmVvjQ6GCdWxI8y23HIMJ6Z4NO1CB/Vk2teMgpcao3XQuJGO0uQ
	 tmNYx6bv8Q1Y/gFhyMfs08JMt3DWbEbkvHTGPF/0E2s4R3Mryg8EQx7y2E10whvNd0tyY
	 5dYrx3pFXSfRn53yCQeRkXUOZY2F5KFHmTFnJRnCezMe23CppkykJpRMqhxgsil2dbSp1
	 cVW7Thbv0OQfTpOgOYAqomfB4CkCCPSasYnPZZGEC3bCO5nafycnyvW1hSy891CI8zDD8
	 3uO3trSsTcuoFD1ZrzQedhVeZIRU915eD2odiPBycmPYwE5dZnCwbgtO8hk0ew+WVZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
	b=kXewlQqosnbJRtTcR7Gg3qmQhfkfKXxvDr/XlWBl+GKX/ePr7oNrfcZijrNfYCDDO06K
	 D4cwOJH+CHK8TVL4XwiYtQ8ERNCxsqyconrDtna7ruvD0tx03py+E/5f84WeOxIGIesjc
	 iXQIUT7PFfOMhreRGAHRUM1KFJSUQtzSYXQIy7pDbIxp3ArTTzXmR+I+vnAV0svENYeHE
	 K2k/G29HEzpOQBzqcB8eT/Msz16+WsVBw9Pb5wDUf3WCSO/aYeyoBIroWpe3jLaWN5oEp
	 WtraiK6/6XApVBXwdKBjFiAWaontS0xlDJENRIj3/EVsrh3zO1YddcAZCGpdURMnC1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSCT2kPM;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83209606A890
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83209606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSCT2kPM
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso180823e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950338; x=1795555138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=dSCT2kPM7qCIsgslpfSDEo/K73skdCToK+/f6A2A/6cdgdwVj+YFLMAs4/JwcaGk3A
         VnXD3eQW5p2puqEZ+aCZaslk08qtsMW+aX5X+rzY7eKKibJPHJV0EE09LpURcITLKfH2
         /xgLnNuvE2jMr0a1ClWNCP8vU00fzAJR4JWAYlB5dkz8SXURPTsz/zZ1a8rBGnihWpci
         HxsYOZKi4egf4nYlRucAQd4IykkWLpJl3BEps1J6PvzissMF5WwmIp0fDoSmcdAKd/RA
         OhQCterhO4l4IbmQaY0woSiGkMUDSqofY0v/G+eDvofn11dn/rR0k/YzLwgHFgsQxf5m
         0QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950338; x=1795555138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svANmzVlQPod18zx4UiEVTuKZ2HdW1VhhQxArxLt/Sc=;
        b=s0ljwZHhmxSx0p/lMi9Nnr3uu47JuObm8ZXgmRmIl6/oMeyiyZQCX9W+7AXGv8iW9W
         EMVirQyHvNyEDDFFfuxPsfmkf9OZDmK4jrYUuwRNQ6QHXDsh/RBk1Y7dLD2Pu5yF25ZV
         wjSBpOnCSWwzy5vgEoIUCa5tkr3Vqk8l9InLliMk2cZ2IkSOlvFzKMCThOewfbW2i27o
         IrFAN3D6zCHh8tC3+COyJdQbIAVUK12gT8ESNdAdJXe/v0bbvetS/rcMQFtqp1Yfb7bf
         OfrtaCe14RJItwosxHmYEuLeaRk9DMpmd4jSSK3QLkkXGmWzaF5yyqBBt21xImdCI+AW
         db0g==
X-Gm-Message-State: APuU4Z/E5568Yr+Onc5zKJw7GL8meMbDBgiwCPkqUePnk8FLTcpg5p18
	oyMqf4jMVjxYizOztJ/wJ6WseAo9cf8nOW90DZsACErTcgld1G6Hfl/FuYkV0qcnfDK99w==
X-Gm-Gg: AYBFou0DrWjaZr0nSTM+7sanSJpvFwuoJJKFQ3fnAL/nQe9BG8K04EKXHcXqygQi3Ud
	H0Jos7eBlS8BPkhtr3Wse5OxAFWULatPelCBgvT28ly3NqOBwIWv15ZWEULTrR9OceTpaEjOGme
	Oj4DBXY2CA7I7Bb6GcJ5z6ubH29CEobgnLCnSNjeO2rMOk51bovZ+KhyWY6bZsEY/nBcPv15+Sj
	cGJKcURfhN1S2dFymq5/7ShB3hhHM69zQdQ1V9EY9/eW3hejbCzVfj3wXvKpW90HP6y7YWud8qY
	mt+CcabaRT7dsErXIg7JWOz1gUR36W53TLD+je7LCLXOtD8OLAsrxBJhr6h117rN0eMxW2NkDeQ
	qYJEmyELoXGLFJv3uExHBSn4ulOacvftE/N/XGehBmiTKxyUl/eFU/V/xvWV9XRedKC83RKJmwG
	AYwL21UARgPSSfhtqujhJLArbjCXkNQf8ZnbydRvyzYc2u2Sw6DA2bNT4f1gOkahlAO2KRTN7g1
	gItdZGoO71gUr/m8hSWZyw8bZou0GqDYsF0HN3r4aZ2aM2ue/LMegmDlc+FMazcQ7LZcBwux+2b
	4o7wA7ldznTup/h7QKbgmDh9pICEtX4tNm2iZ5b4WrqsS0EvpKeJYxldaV5ZXZ02NE5TpNj6Xz0
	t81N6VBUWsWR2GYXKYg==
X-Received: by 2002:a05:6512:3dac:b0:5c1:4cad:c31a with SMTP id 2adb3069b0e04-5c1a9f30272mr116770e87.63.1794950337601;
        Tue, 17 Nov 2026 13:18:57 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:57 -0800 (PST)
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
Subject: [PATCH net-next v7 2/8] ip6_tunnel: add drop reasons to the receive path
Date: Wed, 18 Nov 2026 00:18:47 +0300
Message-ID: <20261117211853.3733250-3-littlesmilingcloud@gmail.com>
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

