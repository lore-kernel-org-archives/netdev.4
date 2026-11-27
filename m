Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789567;
	b=HF01Fk+RVpCfNbIzhVW/VWOhm4DgQ11ABpIw6pFJdYEPtwgTOIG0ZcX/d/J8ChQpbu32
	 z3syvz/GzQOWIO+i3YQpK40G8pM9ScChOZ51kPv4k0meC0qvmPSaW7TMe9L7H7t52Bb0Z
	 DywhjPvyWxg6DguTXcH8kp2a3zw+L7OwJaSqFJWVd5BvH9eIXlna9dBGsshcvC2xfuxA6
	 BZQ7X37swoG9dCdvgHZBejZI1NjNy1eSjBcCctFu3H8nokqucAUyBovjgOYZJI0ginxYp
	 ifMMcl9zGrtuYvCe2Riso5KVxiCbS5PiZGFBJMIDHglXv8sN4dLer/4EjuskgAhehHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rGni9AlTGG5xVbZWZfwiZBu/wCWcaLCQAeaatovwSX8=;
	b=mO5Aqn4+9598R1TcCzb5g4Vdmuv3KnnHl8hXgtB1UbVvgJiq9A3XkPTId7e6NPc6T2Ol
	 vppUF+If3qBKPQAzJc7re4ipfmWUMC+RaEAhcqyBaLsu0HtSc7+2IINdlVSqrWItZ5tSr
	 /eVuaF1a07PM6Zn4lBN7kAeNbMiuNbOAgTdRvxPWAZYsLgo87TSdtakYO4Sz7Wwul9ZlQ
	 gyIsxoEPWY4tPey3jNtHa78gh4p8pzco04A/NIc/lNMZAA/Pub/opR24TKGQASOC78cag
	 UNdV3AR1ma6aU2Ah6lxh8WV7fkiqfWI8NeGibBTq47dJkKbAyBgoz6E36gdkxnBvvFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgtoOtn7;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DD4606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DD4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgtoOtn7
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5569551d19dso93565701cf.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789566; x=1796394366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGni9AlTGG5xVbZWZfwiZBu/wCWcaLCQAeaatovwSX8=;
        b=rgtoOtn74EmOMwu4iilSpzxcsYJDiE+exXeZmdifLXpTkHxHycmgdQozLxnsQho+K1
         f7Z3weKOK8g5TIkfwor+ZdpaiIZXgUeMV+ux56wFLnDdadpV3ZAu5VAAOkJMqdfu/gWj
         fzrw+lUB6nBcPLghUeq6R7hcpRmhF+2GQa0kUsODza4HgaLOCuQUFvJ5LQqpXzTcOJ+h
         KOMkRyU5hUg8tBelK8HlQmm5ifC1OUtklSO76F0vnXQQJqqGRanL2jgeiFqGGklekKEM
         Nygb61v53vArvbkdUkVRoo5BgIyrG6hUBMctsVPhfqSKQIMPhkj61cs7F6ym/GqfuvDa
         3i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789566; x=1796394366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGni9AlTGG5xVbZWZfwiZBu/wCWcaLCQAeaatovwSX8=;
        b=paVv9ym5Qgeo1fFJ3bC1dlf8zRo50eylwds4jpli1eedIn//IlUPXY48x7dc5bzDno
         K3zpVyyUpylMYK9K28qRseHjB3pLc3ctOhtbWY91GRu68ffvmrg7v3mxDewBY4haKPwh
         5tGOKpNDh3TpKNge+C39MxOAQ15xOMDbyvSSVU5RlNoaNpyDO8Mn5nHOxy1G4Yt+8m0G
         IoLrPobR+9Fr0vPCW1P7LiR6wdloPQnaQqXunek0pHWOQLew3kKJPyJKoso5tISjhkik
         Rh1oz+l1Bq79iaUZ9wVR9bqTxETpdgEWK17qCZRIYaLH664UaeUJdSwLiapON4ULzvkp
         bKOQ==
X-Gm-Message-State: APuU4Z9EWdMK63SRO6AHq/ETpnGh3ko0BSO0eY/RDJx8dlJ5ZP5jri7V
	g54A1kWQi24otybC3uVWRV5pr+arQKPb/pUQCVsposrbfDqWTgyrbqv8h0dSJQ==
X-Gm-Gg: AZFdTZf5V8zsHYOUrp0yJW8sziIUa74gi0gFKtyfmxI4MzRQCvpo9FOQ5pmeJKh2DuL
	W4KFWQVQUViNnPwXp2zoaGFyn7KoCkD8ld73n6zouSeavPkAwyrpNAhNO0Tk7VpndD0EFNkaxWc
	1rHdD0FpUGR56cN++nCxNThTHd7OMa+m1K5JyLu49SgIRA2o15VvCA+6DvnfyFMJurEp2YjjV74
	x3cLF8Gu0Z4cGUrT/0v2J8uGxcpUKwv4FuoOspxYxigKntYtCrrzKGhZjrV7YpoGPQvN9IxMJ+r
	xjdbyn5Bu+r33U6ltKoUzJw8xpOm8OJ7WrrERFvXKorrkgUmC12yzIEexOAB7zVZbIEaAp3xyq6
	SSwScZEsm6uMyP8gHre474z1Guitenz12FqFKME29aqaU0CdKS8GjQqWxLiBn94wy/CNCG+bJXN
	hkpuSY0JXRtulIPy0lNa/9zqWA4hqw3BUwoaPCXcEqiVLl/aoi4DoPxjZoeTWqD5pF4ClrH796y
	bqSJVLvUOVVOCWaj99R4qtVsYJuUD7vrwAH/o70In1jM4sJ+r9sB14jKIffxPrYyCdMtN2h04lF
	jAJ6aw3XyRW9mkOqdWgMU9HIVaah7MG+r85/m591UUYA8iuemESD7cM8y4DTls6MQliiCvGwP2f
	dqRax2hBAfhehHy+zWaPv92UMTVnOnZK0dUI/xswJhIVM6PjhFl22CWlvvdlqpdF+6wRceng=
X-Received: by 2002:a05:622a:60e:b0:55d:3347:813a with SMTP id d75a77b69052e-55d76a3a0c4mr414480461cf.27.1795789565626;
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889ea4csm209378831cf.26.2026.11.27.06.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:26:04 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net v3] sctp: unshare GSO skb frag_list members instead of linearizing
Date: Fri, 27 Nov 2026 09:26:04 -0500
Message-ID: <112afb6053d880d08bc768ecc72853357240ce29.1795789564.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
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

When the iptables TEE target copies an SCTP GSO packet with pskb_copy(),
the frag_list skbs are shared by reference via skb_clone_fraglist().
The SCTP receive path then races on shared sk_buff headers in
sctp_inq_pop(), and can hit a BUG_ON in __pskb_pull_tail().

Commit fd60d8a08619 ("sctp: linearize cloned gso packets in sctp_rcv")
tried to fix this by checking skb_cloned() on the outer skb, but
pskb_copy() gives the outer skb a private head without marking it
cloned, so that check never fires for the TEE case. The frag_list
members stay shared regardless. Even when linearization does trigger
(e.g. for AF_PACKET clones), it destroys per-segment boundaries,
breaking AUTH: the HMAC is computed per segment on transmit, but after
linearization the receive side hashes across all concatenated segments
and the digest never matches.

Fix by avoiding linearization for GSO packets entirely. Add
sctp_gso_unshare() which walks the frag_list and ensures exclusive
ownership of each member:

 - skb_unclone() on the outer skb to privatize the head when cloned.

 - For shared members (users > 1): replace with a pskb_copy() to get
   a private sk_buff and data buffer.

 - For non-shared members: skb_unclone() to handle the case where
   users == 1 but the data buffer is still shared (dataref > 1). This
   state arises when a cloned GSO skb is trimmed via ___pskb_trim() or
   __pskb_pull_tail(), e.g. an AF_PACKET socket with a BPF snaplen on
   loopback trims a clone from dev_queue_xmit_nit(), leaving the
   original's frag_list members with privately-owned sk_buff headers
   but shared data.

Data exclusivity matters because sctp_sf_authenticate() zeroes the
digest and writes the computed HMAC in place; shared data would corrupt
AF_PACKET readers or let a crafted packet pass AUTH on a second copy.

Fixes: 90017accff61 ("sctp: Add GSO support")
Reported-by: syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
v2:
  - Use a proper Fixes tag and refine the commit message.
  - Use pskb_copy() instead of skb_clone() for shared skbs in frag_list
    (noted by Sashiko AI review).
v3:
  - Call skb_unclone() on the skbs in frag_list that are not shared in
    sctp_gso_unshare() (noted by Sashiko AI review).
---
 net/sctp/input.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa51106..89599fe4c2f1 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -82,6 +82,42 @@ static inline int sctp_rcv_checksum(struct net *net, struct sk_buff *skb)
 	return 0;
 }
 
+/* Ensure exclusive ownership of head and frag_list data for GSO skbs.
+ * pskb_copy() shares frag_list via skb_clone_fraglist(): copy shared
+ * members and unclone shared data so sctp_sf_authenticate() can safely
+ * zero and rewrite the HMAC digest in place.
+ */
+static int sctp_gso_unshare(struct sk_buff *skb)
+{
+	struct sk_buff **pp, *p;
+
+	if (skb_unclone(skb, GFP_ATOMIC))
+		return -ENOMEM;
+
+	if (!skb_has_frag_list(skb))
+		return 0;
+
+	pp = &skb_shinfo(skb)->frag_list;
+	skb_walk_frags(skb, p) {
+		if (skb_shared(p)) {
+			struct sk_buff *copy;
+
+			copy = pskb_copy(p, GFP_ATOMIC);
+			if (!copy)
+				return -ENOMEM;
+			copy->next = p->next;
+			consume_skb(p);
+			p = copy;
+			*pp = p;
+		} else if (skb_unclone(p, GFP_ATOMIC)) {
+			return -ENOMEM;
+		}
+		pp = &p->next;
+	}
+
+	return 0;
+}
+
 /*
  * This is the routine which IP calls when receiving an SCTP packet.
  */
@@ -117,8 +153,14 @@ int sctp_rcv(struct sk_buff *skb)
 	 * it's better to just linearize it otherwise crc computing
 	 * takes longer.
 	 */
-	if (((!is_gso || skb_cloned(skb)) && skb_linearize(skb)) ||
-	    !pskb_may_pull(skb, sizeof(struct sctphdr)))
+	if (!is_gso) {
+		if (skb_linearize(skb))
+			goto discard_it;
+	} else if (sctp_gso_unshare(skb)) {
+		goto discard_it;
+	}
+
+	if (!pskb_may_pull(skb, sizeof(struct sctphdr)))
 		goto discard_it;
 
 	/* Pull up the IP header. */
-- 
2.47.1

