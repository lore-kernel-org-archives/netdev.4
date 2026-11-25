Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636667;
	b=TXUmwVfOcH852CanZvJI+26UHpaN7wCjKgjs3CineCUQL7n+My1KO4JYHOB2d2dPpB4i
	 w3jUBzEVDIvHi8rRwsrsOp/JVLLxbBZTxmm/s7RSxdlL7ELaMfldsLu9KFgFw3WX6kE4u
	 m0Fi8fq7Gqz9mh6AXLDxgqVxEypPZ43nJwxq0gnYKunkoQ5n6I91CiZV2QlCE7UyZb0k5
	 yg7Sg5o8q/lLK9Y/0XkjWpbnnDrpS1t5Nox6wJANFCCsHZXTtV96DjjDV9l95YjPhEqCN
	 bfF2OnJCXbrJSZqjK8DZ2ypg2U/QKVF5YzXHDOotP6QOOY6Ifu8vvDnzdPMH/5/iqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RW4FHxXGyZEJsJcwKbYOpf6/c9VUn9gfas8f9jTHwlA=;
	b=aJfzyTkt3r8iY+EhavONrMQ60tk5fjSNv9KW+9koO/V1AsXVrHTG4SI+Cs8zfSY47dGW
	 JWkZGn2kYVwr4rQvlvz0HTqxhrp1Vbn6irpbaN1V6+Un7Fcs6FTJk9JqDLvBF4ON33DoO
	 hvBTrqrtwsgWTq+I7KPsulsW0IVmffdwayJZbmPFlZ6euqshvhy+9j/12P4SDpZ8HfoIu
	 uU3Z23IZN7D886BmK667gU0+ahRMxSmPrtSYwGpP8FlOZIfSzUPVbmbUF/zys4RpE6D8w
	 grD7o+0/lkyYsN1OyqMOhlavCexSmoJ7OzesRouQ/VtBzpatsjrZ4R41evRh9sYJIbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Fde+FQe7;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAD606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=Fde+FQe7
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38431138772so8092571eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636666; x=1796241466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW4FHxXGyZEJsJcwKbYOpf6/c9VUn9gfas8f9jTHwlA=;
        b=Fde+FQe7ExgpmmeyCCXOU+9tIGpPvsG+QKMhmKMVtqcYZQag2JJOeD8MebKYhx88IG
         NDiJN8lXu/eqVHH/NG+ziU3uvwaiqoh3OyiHsAqZJVppibCB1EEFsUF69Di9phUnPiPo
         n96dmNUQ830dRQsuaeqc/7nHxHGRY6PhNfsOK8g3o20g8LvhU+FJeokKc+jO2RNOcU6I
         xKRx6xdeyxD+krDEyxmNsCGZGiQ8cwJNawRVskv8b4ppFxj1ZXZrjBFrgKUxd1d4pddv
         cVPW15nggdAZtG6mRVZA8cSlytqM2bQu0Ogu5rGiZsh0rZK62kB/7oncNzN3ctEGzWjA
         1SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636666; x=1796241466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW4FHxXGyZEJsJcwKbYOpf6/c9VUn9gfas8f9jTHwlA=;
        b=oo+RPbrT+pR7m9SoGRcfyU/YkTZg7+BIX9xQuS8gxD///8rSaDzjJnjgapbuK8Znnn
         9aSMNrg5DdF7VlE3g2QCRhPSzCfzAk1Ft7Ly3EDVmC5ij3sqYYFjUB12CUTY3XVHd12q
         f5VxuU65UM5NOAaxImfFK1onooJI6CO/xhiRDIsUScLdLuHOwJ7rkqhFu0SnGd54vpd2
         p5/b8c1JeOdmrFyXIFKaFY/crJS7KniQEK5HR40W7oDwIoyAzxlp3ptMUtxML+Ir7BUk
         AV0gVHLp40V+E+Nisvn87Vi0Sz+nGkPBj2SYmgfalB1WQcWoIidsMObn2NT+MFMjhWrX
         Pm1Q==
X-Forwarded-Encrypted: i=1; AL+hErHhw1gLv7UCm6HJ9pqWTpWc32IzidTyB4DiHdTl8pe32V2jwFdm18/D7j6R+sZBQRq/nTnPVXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h3tJAY9GT/e+onK7pZV8V55E/d2qDir2tSufzlAEm/hk6h14d
	vwZBpO7U03/p9ynalnl7p8oMqiXMst7UHn0lgs4WaFYuZ8E8YiXrf7/i9QDtSxa4zf0=
X-Gm-Gg: AZFdTZelXCGzUyUt+c9GZJVb36/nFfbV6xiWWpWH/V9jWq6AJSeTqqekugrsUt6Cl+k
	IUEVmIIBbUPFQ7CORwmxKLosBQYwQ5NKO3rEQMa9qYcIf7WNnQNTLkgBrjPtrZr+eGiz7j1ALIO
	LlPDZN0fUMJGM7zNQSnJo9jcp67aXVb4mredVtmxlDhVE0GbmQYoGDIEL19b++eN4nO2UOcQdn6
	AXYdosGLH2YyxoYnNTugd99Hehmc63Vpq1dTB91PmMxUm2ahvBQvJ5YSSbwir8frpofNapWoAJn
	ckyaHnYNCjQoo6PJAGMj7yAOo4E2e+Ze7ZRCmn8/BIZx6VXri2o6iPiUEravW329O0SRlOKReTC
	itrYrQbAF18iFsMyZqkv3rBmcofyPITSw1F6zpezHjHLd3E4pGIDVlaPXjOSJAw/j64pfphIo6a
	N1C+VfQOOL9VAGBZxMsSrbG7Anb/pnmxpj+HGjRCmH80dvZQel979EyYlQXP67dEpV4Xm0W3LH0
	vWiwFxMV0Zfa3Sv2UXZXv6OKa4y99rj48OCI7hrex4TQK1LfmxDBgXWMK574b4M7FdKkM9+oJ5W
	lK9kZc3sI0g0viI/sQCxU05SpMlVpSv0zDCDdY9pNF+vYqFC9SphXH3IAjBSPV+l9YdGRLnNwQ2
	ZXRjNAB254mvIvODsUdxowoYcUA==
X-Received: by 2002:a05:693c:87da:10b0:386:aaac:7017 with SMTP id 5a478bee46e88-386aaac73a6mr11279980eec.26.1795636666090;
        Wed, 25 Nov 2026 11:57:46 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:45 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jhs@mojatatu.com,
	kuba@kernel.org,
	mst@redhat.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shawnq1@163.com,
	willemb@google.com
Subject: [PATCH 6.18.y 4/5] net: harden qdisc_pkt_len_segs_init() against malicious GSO packets
Date: Wed, 25 Nov 2026 14:57:34 -0500
Message-ID: <20261125195735.57472-5-artem@trailofbits.com>
In-Reply-To: <20261125195735.57472-1-artem@trailofbits.com>
References: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 22 Oct 2026 17:54:36 +0200

[ Upstream commit c6648c9f3b51c5a8a3df470c1542b2aa378d88f9 ]

An SKB_GSO_DODGY packet can carry untrusted gso_size and headers.

For instance, gso_size=1 and hdr_len=65532 for a 524275-byte frame
makes qdisc_pkt_len_segs_init() compute an accounted length of
about 4,294,574,091 bytes (after gso_segs silently wrapped in a u16).

With DRR quantum 256, the dequeue path then needs ~16.8 million
deficit refills before it can dequeue the skb, keeping the CPU in
the qdisc path long enough to trigger the soft-lockup watchdog.

Commit 8f735d64382d ("net/sched: bound qdisc_pkt_len to prevent
qdisc soft lockup") added QDISC_PKT_LEN_MAX to bound size table
amplification. Use the same bound for DODGY packets:

- Make gso_segs a u32 and drop packets whose segment count does
  not fit GSO_MAX_SEGS, instead of silently truncating it.

- Drop packets whose estimated qdisc_pkt_len() would exceed
  QDISC_PKT_LEN_MAX.

Fixes: 15e5a0307164 ("net_sched: better precise estimation on packet length for untrusted packets")
Reported-by: shaos <shawnq1@163.com>
Closes: https://lore.kernel.org/netdev/20261022144755.65025-1-shawnq1@163.com/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Link: https://patch.msgid.link/20261022155436.117507-1-edumazet@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[ Backport to 6.18.y: context adjusted; 6.18.y keeps the name
  qdisc_pkt_len_init() and has no qdisc_skb_cb()->pkt_segs. The code
  change is identical to upstream. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/core/dev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 2bbbfc82d779..36375c24b993 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4128,7 +4128,7 @@ static enum skb_drop_reason qdisc_pkt_len_init(struct sk_buff *skb)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
 	unsigned int hdr_len, tlen;
-	u16 gso_segs;
+	u32 gso_segs;
 
 	qdisc_skb_cb(skb)->pkt_len = skb->len;
 	if (!shinfo->gso_size)
@@ -4177,6 +4177,15 @@ static enum skb_drop_reason qdisc_pkt_len_init(struct sk_buff *skb)
 		if (payload <= 0)
 			return SKB_DROP_REASON_SKB_BAD_GSO;
 		gso_segs = DIV_ROUND_UP(payload, shinfo->gso_size);
+		/* shinfo->gso_segs is a 16bit field.
+		 * Also make sure untrusted gso_size/hdr_len can not inflate
+		 * qdisc_pkt_len() beyond QDISC_PKT_LEN_MAX, or deficit
+		 * schedulers could spin in their refill loops.
+		 */
+		if (unlikely(gso_segs > GSO_MAX_SEGS ||
+			     skb->len + (u64)(gso_segs - 1) * hdr_len >
+			     QDISC_PKT_LEN_MAX))
+			return SKB_DROP_REASON_SKB_BAD_GSO;
 		shinfo->gso_segs = gso_segs;
 	}
 	qdisc_skb_cb(skb)->pkt_len += (gso_segs - 1) * hdr_len;
