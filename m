Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636668;
	b=3/1Yp7TMJBZHdRf2PbLo37aojG7EsWp8DJFOm1EHv1nWwNbE1pS459xUQL9/z9qipCkL
	 KCR99v8TzwXB+6bjFxMfN5HiVLvFtA3yOtb9G7IPY6xBFkUplPb+gL25Dh9qy/vNn4H0n
	 xPDlf//hrAw1eRNwAYO5ICy5BNB/RdpqKddKwl5ISjw9xLbwIcd/2EksZN+yDTSGjw9g+
	 FA9UCCTXIVyP0XbhL5MEPp4tLpLAyyneua5Pg1wfgNlkXztlSsFE4+VcGXf8yRV6IpIVH
	 L3V5Ec3SIR34csRzRbTJqauf8krusqTSxqautF7ljKT6D30WV2NyrUS53kA+bLDbXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZE954/YJTgQdr7KI7FtWvHvLXLz8xxAtjTdUMGYCyGc=;
	b=KEwCds8TuRhnJNRBRcUZv+5Nu6XVbPZrel7nJkRpcKuSFcH+i9P/huAwyWNO4L6laN1p
	 D7WGg0VsY0iU6R7OSWOaqVk8pahIzVMQAHkhsILCMk7NAzH2Z/nWg3KqtSiJUCNEK7MXL
	 B7UAEYNvf/kdyIFJv5pfiptn2VOPOLRSwZP6zkQrw+J8KT0HceyVMHv1pznvbVtffhQwU
	 xhx0Ui1CUqNhY7dRSWB6aeZm1VpmDjZ7TgowNzQ1LP6WCecYub5IG+9MD1Z4+JC9B+xc2
	 NZbdNHSdEZlM4FomQyiiwiAEQuL0J4DI5/JEX7ubUoQl6LbdGklvxVJhkIWQnQVGEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ERy50hI3;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0553F606A336
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0553F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ERy50hI3
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3863db981d4so8733271eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636667; x=1796241467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZE954/YJTgQdr7KI7FtWvHvLXLz8xxAtjTdUMGYCyGc=;
        b=ERy50hI3pCNQ/nIc6U0RxuIxZn1i7q2FvQ2X/jjjstUcucPFp3fJpkubxtXYhzBHQZ
         YuKRoOYyILiFOikJQdpPGy/+sb6zzaE4glP7hAwdqTGjjDhFoqh+Qqw3LLHGdSAy7i1H
         bB0C+zyGAmZ2tpS+5Jadwro6piASUNZ1iZAmLlmljRNiDLp3J7QDUnKynEzm5HBRryyy
         z3VWzTT4bxaszpTaqXDUNqNbSksBNlkejv3m7sCPfkSAeOOzQ94ccvdwE4lmmt0ez8Wy
         ZitKNtvZWvm5zaezeHjr9/R4chZr1lWKzfOnT7tr3k/Lwwmcw2YSbkvuO5YxoR3sDLP3
         JfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636667; x=1796241467;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZE954/YJTgQdr7KI7FtWvHvLXLz8xxAtjTdUMGYCyGc=;
        b=iB519SQx+nU8rW5LD1pUdVkxgojQQenyex4XF0kr+Wmso1TtGTz4wkZcq+TbdH30+m
         on2OqIukGJFuUv5dclP182lDru+DQFf1r2olH6+koEAbydm1uqSJpbNueHjpqXDfUF4a
         vb584XpG2lclyA77jXWI7Gs/g+G/FfaXfWA9LS+1FkNOXkvkAspEcv10zk+FQDlAzPpw
         J+rLe/h/4prQLyfU+sY5gCczjS19faOA9P1oApOnpgeZcFOzzZ8EX48PpHIAW5g5Va+H
         wiT9egEWv0LwM2jHMlsN7LJVDSS4RCnl2agew1UyYeemHopc5PzIea6P5FsdwW10cUQa
         F9tg==
X-Forwarded-Encrypted: i=1; AL+hErE7YiDBdKvqNOWb/T8twGi3rr6Bj+AMLmIo+IqP6aUUwv760nCZ1NaPhLu80hTiOjozEyDBfio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cryf0rnlkb8XIEmeNSdp+cti4vnTO6eKlGKJ70WPLklMXSzGP
	G9+LICSv03DEwhJ+GGVHC0G5oyRXF6JQnqPMoSBhSTAmCbGT1pPF0oQiRkUwuLdaATQ=
X-Gm-Gg: AZFdTZe3p6ilooAI3XVV607hyvesP+BZYP1JZsp5dfSY16N89hRStnmT1sJ/y5/EyHs
	RTpUVSIRR2pYGFiioIscJ3WyUCQ9f85ejxVLqrldUEAcu0AFj+m/UAqfZtUIISvLNyYLWFBsR6X
	skqEGSVNR5LJI420aCxy5TxjUVuOfvZu6DUZzlFl0YA/yUcvz2wltxNQgpo7SBpu/SzgYD7V0Qc
	Ml8YY9oCRhmvMHg4ewwLxriqpGZF4PTsc3Gjr9aoWWzKWhK9vuJbbtBn0jJAUZCRMr8mC5juWSm
	++a/c55Q4SXqaAiqjWSx405KPuYPLG8+R03MsrfHeH+f/O1Dyx63iLHvN42X76MdaglA69Uptyu
	dn0/tmp0ELjfms/lnDoeoBKe01D87qYlrq9EdozMOrt+1x+QvMTr9qrA2bFJDHoPgkHjeQpEjwL
	i6u4UIRA4BiUxa/5FrbhZsFJhcDltQv0509tvAo/aOdWXX6WLDOPAd/YPmkdBAMwWCnLix574l5
	Fj+WDAvacgpJc66HIbHhdsLEldy/A4R9lXR0SyGAG+yPsoarVXs1C/OQzAOIdmGYqBsqwI5eGJF
	uOj758KgDwZV5VOxRYAdOrX3WAcrb5Dgf5FXHVv2swpN/K50C8gvIAfaK8HIhbfbUCdrbTo4R49
	O65FdD4wqDBWcpINlwqgvmPL1ww==
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr12123813eec.11.1795636667182;
        Wed, 25 Nov 2026 11:57:47 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:46 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: ast@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	mst@redhat.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 6.18.y 5/5] net: reject a negative TCP header offset in qdisc_pkt_len_segs_init()
Date: Wed, 25 Nov 2026 14:57:35 -0500
Message-ID: <20261125195735.57472-6-artem@trailofbits.com>
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

From: Alexei Starovoitov <ast@kernel.org>
Date: Sun, 1 Nov 2026 19:44:33 +0000

[ Upstream commit 35d2d6e5ac0d22428b2a0216061f3330c095393c ]

qdisc_pkt_len_segs_init() stores skb_transport_offset(), or the inner
offset, in the unsigned hdr_len. A header in front of skb->data gives a
negative offset. For an offset a little below zero, pskb_may_pull() gets a
small length and succeeds. Then a 64-bit kernel reads the TCP header far
after the skb and can crash. Further below zero pskb_may_pull() fails.

Commit 28a57fb2c5df ("net: iptunnel: fix stale transport header during
tunnel decapsulation") fixed one source of such offsets. Other code that
removes bytes from the front of a packet can leave the same stale header.

Return SKB_DROP_REASON_SKB_BAD_GSO for a negative offset in the TCP branch.
SKB_GSO_UDP_L4 and the other GSO types read no header and still get a wrong
qdisc_pkt_len(). On a 64-bit kernel only packets that cause the read after
the skb today get a new result. Then __dev_queue_xmit() drops them and
returns -EINVAL, but sch_handle_ingress() ignores the result. Their content
can be valid. Thus the code that leaves the header stale needs its own fix.

Fixes: 7fb4c1967011 ("net: pull headers in qdisc_pkt_len_segs_init()")
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
CC: stable@vger.kernel.org
Link: https://patch.msgid.link/20261101194433.2637113-1-alexei.starovoitov@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

[ Backport to 6.18.y: in 6.18.y the function is qdisc_pkt_len_init()
  and __dev_queue_xmit() is its only caller; sch_handle_ingress() does
  not call it. The code change is identical to upstream. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/core/dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 36375c24b993..4d6f0fe79adb 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4152,7 +4152,9 @@ static enum skb_drop_reason qdisc_pkt_len_init(struct sk_buff *skb)
 	if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
 		const struct tcphdr *th;
 
-		if (!pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
+		/* A header in front of skb->data gives a negative offset. */
+		if ((int)hdr_len < 0 ||
+		    !pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)))
 			return SKB_DROP_REASON_SKB_BAD_GSO;
 
 		th = (const struct tcphdr *)(skb->data + hdr_len);
