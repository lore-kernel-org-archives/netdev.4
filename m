Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430536;
	b=Bx78a+IBeg2I+CsoFF+H/KMn+nDoKFMoS7U5/StWX2js4GKd+MJV+Z6KJ+RxwCy87jAq
	 K+YKNUMLlyXmgh/DKMl5LtT5rk+OWBVrq0glp0rKlsCxdZ9eQb3oUXlq3x1mkFI5aPsdj
	 1Gsr/RrK+B2Ru7U0ll/FnaObavPKxek7LpbyJMVcRe3s1eY4nbiQX9jrGm0+X1zP+xTiH
	 S5VjLcfufZeh7raqW3wV4kI1JZE57HIeKRptTqE1LHR22OTxPBbwLkSsl+E5BTUcyO+Hu
	 G/ugiuxrIKAsBarR2I3C0IjqBw3L6QXJZE+c2P4CwIsXoq6WjS4gfDKmJUUGeQe5nYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
	b=2hjsgaN9iJPo9zwuf5dsGEgfBhM2YPl/JoLzUHi4pcMMa+jgKcQ3URL4EQwrqVIuWCev
	 H9KudAwIxdoBgaOOSmXMfj+FfWzzxtTdc6WfCkILJmFzKcRH0frPOBwzD7uSCutvV97uv
	 BPaivt+NnZMFbRFicXeEza7CjqsPpE/VIWSuRH1Jp8dAF1PL3aI3egqTqq8VEpMIBRv4w
	 x+Reu3kAreibRkgikSyFLdghcMLmtsUkLTM6JZRYQUmBM8iwgnlLZ11uh3uTX/U7vvzN8
	 cKkXbPAumdcvRtIaVczNIQkcWv5QzrUrVCSYxevjX/d071G84V8snEF3O14IUVAEIlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcGPa0GQ;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B7606A335
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F3B7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcGPa0GQ
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so26236601fa.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430535; x=1796035335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
        b=vcGPa0GQO/HXO6DJDxV07bel9tvg/kEmWFX2k9vKrYoq8GScaOMxHnCuw/5HxBtm10
         qa+uYvEkSYMomvYoPJoUXw08PkByWiimD/0zkECurzHP9uKwO0zj2+tGpE1bkeKlQHsQ
         8appaCL7ZgAEfwn9+3dhQxGwEGwwUdTpzV1LRKTDkNSVMcSOU0zrJo+yvgPbaSUuGiFa
         BdFH3k05uyDfjeanZL8l9fe+lk7KOjjQN1xvZko2Bk612K5FNwFVNtbB9ct3gZObMvc3
         9+M3dp1OKHQtwJSZB5LsZMB779YEh7HC34oC5ODr7UTM3outyUs3jCLa2C/zdVPTxpg1
         AShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430535; x=1796035335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sZEvWJJs9gNGR6cDHf5uqCIrchpjW4HhbI7/ro7mHso=;
        b=XysK+Cze5X7sQNz7WhmkXUN5Ikxb+l5+FSbVkLdGmq7P6HVtk5Nvx/ymn4Ne1Zx/TZ
         SVhJoIXCHesIBAv2tc4FwTtkUN5Y4bGJR+LHHOcfnSqYt6hAOt+CY0Un6246/PGr8km9
         ku9Htxd9eZO/mVdcDHVbaPBjL6Smb7pdIyZSMYEGm0KnzuuXsJDBtiBv3KWZ5aZDC8m4
         mntY9pwOp25GsfLH3MuFx2V3L0wcOlE9QrP2egQbHypTBXAYGfDgnX0d86vdxM36x5Iq
         TTz0CzHUXSouLph6/IiFV/1DxMJvDEGwMas+Y8l2iV1dcEJPaZR29XpfOBtwvvdeRWcn
         9CIw==
X-Gm-Message-State: APuU4Z+WXL5HWPc/mlbfDdvnRbz0+P2+lyx60fICxCgy9N0QPGbYK+ur
	sP3QQzuGmba0VVwfovTLo0FLxwiFfFUjxnzQ9s7K8WTdzz2SZttjeH/fLMsIFClkIcOFjA==
X-Gm-Gg: AZFdTZd0gzWHF/2t7dhOUNijqOrP5JZufpauRTv5ZxBFN4Q1qYCi0mm+8A1UHZX0wy7
	ocqyX43x6glWDPVGCUZIe9LvGKxGV9DEM6uYsC2Gi9wxd1+VhKOypRwSRM6xgdcTyFRAlkJe0Vy
	tVNDQSd3xdiD6sPEYmFDuOU45PXW2Dw8BaF5dClW7m6CFigVNCULsmMLz510BCzMwVKnm3Q3JN6
	tD2ESXykIssOSNdAEDAMZV+lwUFJws/N4kuolhMxnWaeqPd1DoJ81fCpepTqIRSv8KGa0tK2V3q
	125NSk0MgPXIU5o0BM7Ojg0w1op91WK5ks4vnf+oPEXscFAY0jRnWPYCEWlo3ToIZjZx4Too3P4
	6E5Rh0S4NxK5y2AurNxlXLK6kenQ0i6XwT/AeO9GQg/6ok1N+e6w7USDnFr973Lla2MOx4id5Rk
	ZSttU+MVh8mkLwe6YAaba1fQLlAuH6NU3S2+6i9vNx1/YvfFIhZXBsK6HHrdo8VQGKhxlcFrnxm
	gLwahjKcsJiklOKitTorZGE3ufJnbOZaOVpYcwu6/HQ7FjY8569EwLWhZnyY33RGUhh2M7ZRWpe
	W2Rpede1iB98+SivR0OzTixxtvbx5XPfC2cP44GBLLDnlK055vxMwlPt+vLUIi2AJRSWTDZL0rT
	fXy8T7cs4zX8uoFjr2w==
X-Received: by 2002:a05:6512:138d:b0:5be:3c86:f24a with SMTP id 2adb3069b0e04-5c1bc82068amr3577069e87.53.1795430534670;
        Mon, 23 Nov 2026 02:42:14 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:14 -0800 (PST)
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
Subject: [PATCH net-next v8 1/8] ip_tunnel: add drop reasons to the generic RX path
Date: Mon, 23 Nov 2026 13:42:03 +0300
Message-ID: <20261123104210.199916-2-littlesmilingcloud@gmail.com>
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
index 8cd7551a9370..4c89485b98e6 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -113,6 +113,8 @@
 	FN(TC_RECLASSIFY_LOOP)		\
 	FN(TUNNEL_INVALID_HDR)		\
 	FN(TUNNEL_NOT_FOUND)		\
+	FN(TUNNEL_OPT_MISMATCH)		\
+	FN(TUNNEL_OLD_SEQ)		\
 	FN(MAC_INVALID_SOURCE)		\
 	FN(VXLAN_ENTRY_EXISTS)		\
 	FN(NO_TX_TARGET)		\
@@ -550,6 +552,21 @@ enum skb_drop_reason {
 	 * packet, e.g. no VXLAN device for its VNI
 	 */
 	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
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
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
 	SKB_DROP_REASON_MAC_INVALID_SOURCE,
 	/**
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 1052af6245df..5137c26b9c1d 100644
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

