Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647566;
	b=FQm8iGRtJZdLX21mh1LcF2NX/utPdsoBdfkgsPzfMsiNfq90uRlVSEq49o2ZwHo+hSpT
	 lrEKsa4TjF2o495j42ukLzYjylHvmvZNx0SC6p6iT6iHPtxx0+iprbUpFdCNDS/71pXWB
	 RmsZ1dz6Dwz8sUQT+pQvWfdqKT0W5khnlHSciDJ+VYstMQ79tifD/AGqlgdeehGu4edds
	 UK/dlIlD8YTZb6WSjMIru/oBbZkhI5dsFL47RDjzKoXbkkwCji0Z52q8JrNgcZe/43PGn
	 a/lTpQaqtPp2cKKY6enaEPPIVlrm/DjJjkeN937F6Aburo1QYT/YdLp0jwek2Ytv9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
	b=Toh+FISBZL+SKXRWm+570tlvw55706Gjft4DytH850GpydMsbPiNBxZq2A9V6aSuyRV2
	 21jnFVjwViHam8x1LiFbFSjHmXfHNgVxqiKbVH2ft6BkKfhh/bp7SKABARbFacVqdnPix
	 e34/CUSLKq7dBWHUmHryxSHoSG+8CPf6V8TlJMnVe04lo//hl3UAnyx9m9RzogYFqqF0e
	 zofEfPsIo4im8fOgqD/dmz2+WbH7DWNzOm86/vYcShWkX9cAFWSeCy19BzaOyjrdAfpdW
	 k5+RBNj26guVwLO1ufQ41qkRf/Yi58vwh4u06GZy8g95+h9OV9hdj6jmJr6aPkGCDxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV6mQUGj;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F97606A88F
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F97606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV6mQUGj
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so5655265ad.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 01:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647565; x=1795252365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=RV6mQUGj7+F93NrSqCxxKeUED01cOhim5hASqZ3AYiS1YT0y21Kl3GdKHKu1t9l44t
         GSQ37UxZasL+fHnTpBsopAbYWA903/H4/llyno2eMbaCzFwjioBAJ3jm5EseGU8Oud3r
         OwE5LQPoW2sTjoOPLTS7t5z6j/aTatIHwVuOjyFblgKtjfE8HVpYYHYcljsWeUC0zB2z
         38H8L4C31ZV5BOP2BiGXW58+M7b1OgIt0VnoSK2dzT4vepwOIeVumpezx1CXurFoWicV
         0bApP5+CmlF1jpQmgBpMhJUlu0DqVwao0lCMUtf3vwZ1iSNCAXUlGQ7ugD/V0VNLSluF
         HHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647565; x=1795252365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTbQToynBqwf3n1SZSg1pf/eN+ziaT5I0ox1EckFMS8=;
        b=IAYV9b12oKwwRuWmeIQoKqEih566MQrpiFXjZ7l9OZKzvdl9h/5ukxtQ7dF3mcGVIT
         WPmziS1BZh7ZUHmPNHORM+TufeBxOZJL2YRzzQznSZiQosyrJ0UYssKjrr6BAsVlAjI6
         Ywjj8+RiJ1WVyZsyibGEBOZsAfCvbqAe3CZjeno+AQcF78hLLv4Z+GdYZ29UaNUXESsQ
         EcwNxjWD6dh6UHQ9WBXt8UumLgHNSmSzutAj41GbeSLIAvqZmRu6dBWnsdWlqZQ0CpNJ
         7CdZbKSYuCA3Ku6isl2bYts1khcjnvRy601AM/pn1P9u1nch0AqTKDChH9MbV2jssszI
         +QQA==
X-Forwarded-Encrypted: i=1; AL+hErEa3m0oPQHRnlmDIWqM6PPLt2J/RV41cEmAdSzoWDRm7cBhgum+voYGeaEAOW4TV3glhEH486I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YIDOEARIr6JiHV8Es1vGKQntnqjn7VOYpP79wR8RyN8wNtDOi
	wmNp1Xr+BgOaaJGJH1rcAhwJfRlcHO0ECDUyYl0dhKK37SGkl7EANGhd
X-Gm-Gg: AYBFou0/t7V921+hqPiz3RHjq7n8Pa182fX2CqXFsq/jI9bW2RxxIo//n3nYIwARWdP
	jNNPRvGSfNzuAsVEsEz3yqm/C7vOwu2zdNijIqVmmUMAeq/NDicJvUM2VyW03dAKSvnTajS5uwZ
	gb5/gm6bovZHLHrX/xpcJuqLag+67PK3P34RX2W+OCJKqDpcuRtSdOvPeGed/iYDZzZFzAXK5nf
	8V1TSz3x7mjVbNtCsFt8Ba/LFjMN/NMF/f68cHRvcMk0TRib/P8Ir78Fq3fpxn/V+X842J0lb5c
	RLlwfNMALxI2Gq1DQOhglMbtKiMHNrV5UMqVmOe/Ghji1vBy8eCFdbDhmS6ZEgqcUN9lUpCNHHM
	Q2If7vbusfYjXqrWOPYe2NNBARdL2fJH9qYl7fu8aoMe3cwdVimQYVx8JYAjeSZyw/PAL4cb72x
	rwmi/D08jNcEZ/fR+8mn2SvkNk5586+VMfU93V784j5d2kfEcKQW0R3DDc8s9OeEI0BRmbU1sLW
	roQTDYq69Sr3/pFqLaMdOkQLBxzfLxauf3zpsHCaYN4I9xRPQ2bYOLt47V2v9L+KxQxqO7Kv+9h
	FXh569cZJCfKKQ3mcdv8nNi5oqI1WSHa51+0PRCghos3U/LvdRM6
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr4722150a91.43.1794647565057;
        Sat, 14 Nov 2026 01:12:45 -0800 (PST)
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2b6e:fd48:7485:9720])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm8311897a91.4.2026.11.14.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:12:44 -0800 (PST)
From: Yingjie Wang <flashhhhha@gmail.com>
To: steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: avoid wrapping AEVENT timer thresholds
Date: Sat, 14 Nov 2026 17:12:39 +0800
Message-ID: <20261114091239.780633-1-flashhhhha@gmail.com>
X-Mailer: git-send-email 2.43.0
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

net->xfrm.sysctl_aevent_etime is stored in 100ms units, but the
conversion in xfrm_state_construct() multiplies it by HZ while it is
still a u32. Large values can wrap before the division by
XFRM_AE_ETH_M, disabling the replay timer or turning a long threshold
into a short delay.

Do the conversion in u64 and clamp the resulting jiffies value to the
range representable by replay_maxage and safe for jiffies comparisons.
Use div_u64() so 32-bit builds do not require compiler runtime helpers
for the u64 division. Use widened arithmetic when reporting
XFRMA_ETIMER_THRESH as well, so large stored values do not wrap during
readback.

On x86-64 with HZ=1000, setting xfrm_aevent_etime to 536870912 made
XFRMA_ETIMER_THRESH read back as 0 on the base kernel and 42949672 with
this fix. A normal value of 8 read back as 8 on both kernels.

Fixes: d51d081d6504 ("[IPSEC]: Sync series - user")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <flashhhhha@gmail.com>
---
 net/xfrm/xfrm_user.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a5fbe38839c4..4a676a6aa53e 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -924,6 +924,14 @@ static void xfrm_smark_init(struct nlattr **attrs, struct xfrm_mark *m)
 	}
 }
 
+static u32 xfrm_aevent_etime_to_jiffies(u32 etime)
+{
+	u64 maxage = min_t(u64, U32_MAX, MAX_JIFFY_OFFSET);
+	u64 j = div_u64((u64)etime * HZ, XFRM_AE_ETH_M);
+
+	return min_t(u64, j, maxage);
+}
+
 static struct xfrm_state *xfrm_state_construct(struct net *net,
 					       struct xfrm_usersa_info *p,
 					       struct nlattr **attrs,
@@ -1022,7 +1030,8 @@ static struct xfrm_state *xfrm_state_construct(struct net *net,
 	x->km.seq = p->seq;
 	x->replay_maxdiff = net->xfrm.sysctl_aevent_rseqth;
 	/* sysctl_xfrm_aevent_etime is in 100ms units */
-	x->replay_maxage = (net->xfrm.sysctl_aevent_etime*HZ)/XFRM_AE_ETH_M;
+	x->replay_maxage =
+		xfrm_aevent_etime_to_jiffies(net->xfrm.sysctl_aevent_etime);
 
 	if ((err = xfrm_init_replay(x, extack)))
 		goto error;
@@ -2782,8 +2791,10 @@ static int build_aevent(struct sk_buff *skb, struct xfrm_state *x, const struct
 			goto out_cancel;
 	}
 	if (id->flags & XFRM_AE_ETHR) {
+		u64 etime = div_u64((u64)x->replay_maxage * XFRM_AE_ETH_M, HZ);
+
 		err = nla_put_u32(skb, XFRMA_ETIMER_THRESH,
-				  x->replay_maxage * 10 / HZ);
+				  min_t(u64, etime, U32_MAX));
 		if (err)
 			goto out_cancel;
 	}
-- 
2.43.0

