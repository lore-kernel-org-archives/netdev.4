Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950338;
	b=m4CKvFcxBRetd5ajJ9Fb3qHLhJOYf86eK1eBHjsWt8vekND3H2R8bssiaIbKJzk84G9F
	 EjoHxQKtjdj9Asjzb8fi8VhT25j77zWrwDLqpzxrcgDM60w+uJ2+wOPez5gAjOYKuKYpW
	 z1gqhhrX8Rpqx66xgLTes0Pm5hJTN/5Af+zxp4K07bg283yqM2h2rR3QO07vCDIkPjNT1
	 xjXRztO3llrdUkqNdcMxKEigkKSTDL4CRlpkkbbpNyE8rx+a3S8IuqK99i2LsqJ/29ah4
	 dovzvbT1psHPSnnv1+CJ120HZkAcl3NxL57wvG0cmC/v/GHEhFYBuo7D5Fy1gvQhKhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
	b=ev2srbQ9A2ukdpaPN1Ym++AVR8zXC5eiiQCQxEQbTRcLNGkEj+mIVFLplNt0DMq5gsJP
	 HeryBw544RRy3HNO1Z+E7uRFV+uDI7zFbszUecORppsSq9PmDifvooG5FgXrC+/j7gLxC
	 TF1ag4nmz9HRZpuv3tVUSCfMsftLotVDNbEcCgZw9ITZKpcTIQJdewaI6p6NEtc2Au8Ks
	 OD5CPhLH0UKGSZaf2btgh5AN3ER1ua+LfJhVZkKUzC+rfdrw6viGW5sOfohhf/AR1FDP3
	 ZqTIdRIz6iDeJKcQhR3yTEaL9t1Mi0pyKOyzrV43UYj6rtuzJ3+ZHathsi4mO8YHaqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ul+Tq5Fb;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC9606A33D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEC9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ul+Tq5Fb
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so166810e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950337; x=1795555137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
        b=ul+Tq5Fbf/Rlj42uDV+HtK2Sc4z2rbt+cr7mrr5+5lNqN+x6M0DJI04jGh5JECKpvS
         +h3I4H2AdMHktmMxGjkgcz2exkmXqn594AqyoPxvX5mIhk6oM4lU3fy9ZETc/aKR2wqQ
         4lhd1ZumDNlHtfPcsFGsvAuWA0HLdEfy7K9zilLPKCL0yf3qAPqPxBLmfMM67xH7Ad4S
         4m5LSrzcWv5/cbPMgoCiKkcARGhlWJtUe538LubTWugGrpthM+ZL6ImHmctdS52z9hd+
         a9gmiPJCd/eMi0pRPtcirjHZkPoeNncyx0AtOaALDtfRW3SLxvD5xh1G2kT17s+Gh/O7
         awQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950337; x=1795555137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wB6bRo3lbSsZaUMjbOvD2Y5uBp3Ggx5j0TCCZ4sIdQ=;
        b=hY35H8qMvebPPBsGfBHS21xQzftYyrwn62IyATRs0reteYt8u0X0GMVkfCJn92Fyfl
         ANXdiVPZLRn5Rz+HWS1xDM8YZ7xOOKDjYlRH02DokAyJqvIxHc0Vw6jfWZgxB4nvzdRD
         MLTAKALeSOMq/8RU1yqGan0utN4TT06H88MDV7i3DMOT/4O3IrC5VkosbP5y8F5pfint
         73RaCCZh4x4kjNngDbzUY5p499xeHR9REx4E7QSMqf97RwEVa8teIO5bclREmZlQ9u0E
         ThEGJK6T/F+cTsaMg89HfeMci80tinV6GSBorZd/X1uXkirSDa8n64idZZNw9Fw57w/M
         JEEQ==
X-Gm-Message-State: APuU4Z8ilsLicO++N6fUs33pamVUJFbGsKJikMq08nh7ujVZesOfvu5m
	py7kLr5VPNxdxkba4EU7uhcGQpmYe0loaOr87t8ALiI3sHH5l+o64s6/GYXFOlFvhLH2cg==
X-Gm-Gg: AYBFou05JL8ARI+rRVH4XlTEa1pNnwU83AA0beaAm1Osy5CwhfDoC8+Ph127IlgNDeg
	o1zfWrljezJyN4jGIhuQqSLmqEDN/1/c+kIZ1B294jbn6IdjgwnskK2xZmXOQx+tc6BO4RlDTcj
	FjS5hBsuzXy3K5MgW6ktB3aylcXUAu+kps3XjkWNSgxCvCN8VDd+9FDRe1OoWIedpMWbu++XX01
	oFPN3tKD3N75GpxV+eoJpxbvXUBsuVHKAXGaG/Wsep4pxMnkvDAyc90vTwl2z4EymdZlhL36MgA
	X1qaqrpItJ19Ap3AE4fgRVG/V55pP6kmH8zrUAHBtmyL7Z3VAnIEDh/lLX4ViXUQiUT5bJikoKR
	IS+TL7Ks0dKbN4JgBSyTxvImmcm6w3aVocwOKdKPZBQ3m24xakzvPlf7dgBDfESQez8S683MFww
	NodUN/xm+dR8bcwXbeQzhd5p1FXPIK7xIGqqifO/Cm/ZNwc5hw9i99rF67w7tiZI6QCMFCELwPP
	K25Hyw1xwju10pIMD2TBiUcUwJEudL/lCJr4ZYqXWXwb5mZFaKOnqwIZeEM0g9QehwnKla3/KuK
	3nKQXOvvOMfUCtLDje0YNoVWp88K/1PvWhEdLaJPdLik3zB4uIaZFAvQfRPBOrnPaR97VW4/H03
	R3ji3vp3jVCsM8yujdSI=
X-Received: by 2002:a05:6512:3043:b0:5bf:ca51:e25d with SMTP id 2adb3069b0e04-5c1aa07392fmr111858e87.11.1794950336433;
        Tue, 17 Nov 2026 13:18:56 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:55 -0800 (PST)
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
Subject: [PATCH net-next v7 1/8] ip_tunnel: add drop reasons to the generic RX path
Date: Wed, 18 Nov 2026 00:18:46 +0300
Message-ID: <20261117211853.3733250-2-littlesmilingcloud@gmail.com>
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

ip_tunnel_rcv() frees every rejected packet at the same call site.
Report the failing check through skb:kfree_skb and drop_monitor while
keeping the existing device error counters.

Use TUNNEL_OPT_MISMATCH when the checksum option differs from the
tunnel configuration in either direction, or a required sequence
number is missing. GRE checksum validation happens earlier. Use
TUNNEL_OLD_SEQ for a sequence number below the expected value. A
reordered packet or a peer that restarts its sequence numbering can
trigger this check.

Propagate the reason from pskb_inet_may_pull_reason() and report ECN
decapsulation failures as IP_TUNNEL_ECN.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h | 17 +++++++++++++++++
 net/ipv4/ip_tunnel.c          | 19 +++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 27bc63cbc020..03c6f6aa1510 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -129,6 +129,8 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(TUNNEL_OPT_MISMATCH)		\
+	FN(TUNNEL_OLD_SEQ)		\
 	FNe(MAX)
 
 /**
@@ -618,6 +620,21 @@ enum skb_drop_reason {
 	 * itself.
 	 */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OPT_MISMATCH: the tunnel options carried by
+	 * the packet do not match the tunnel configuration, e.g. a GRE tunnel
+	 * configured with 'icsum' or 'iseq' received a packet with no checksum
+	 * or no sequence number, or a GRE tunnel without 'icsum' received a
+	 * packet with a checksum.
+	 */
+	SKB_DROP_REASON_TUNNEL_OPT_MISMATCH,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_OLD_SEQ: the sequence number carried by the
+	 * packet is older than the one expected by the tunnel, e.g. the packet
+	 * was reordered in the network or by the receive processing, or the
+	 * remote endpoint restarted and reset its sequence numbering.
+	 */
+	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 0875474a578a..7d8744ed1664 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -384,6 +384,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		  const struct tnl_ptk_info *tpi, struct metadata_dst *tun_dst,
 		  bool log_ecn_error)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct iphdr *iph = ip_hdr(skb);
 	int nh, err;
 
@@ -398,14 +399,22 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno && (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
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
@@ -419,7 +428,8 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 
 	skb_set_network_header(skb, (tunnel->dev->type == ARPHRD_ETHER) ? ETH_HLEN : 0);
 
-	if (!pskb_inet_may_pull(skb)) {
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -434,6 +444,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -457,7 +468,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_rcv);
-- 
2.47.3

