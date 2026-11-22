Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329752;
	b=bcBpwhFfQcRYddxHG8aOdDeb8vbE25aJZGxyFz/8D3oWdVWMQVZiYVjBpHeHe7kN+0zf
	 dvjPt+Bn9n+/vaD482HGkJyRS7his8DMgs3USfIG0mhJi8ojK3qYPQ8q64ZZ9B3AYEDOx
	 IBIH52GryahyViB5wMpAvZKjhFvUA5ma+2nKvB5ySKZ/Ukvlm2tJxCzZBfO3Sn69Gd4R/
	 9fO7Ns4FXSVdsPBNGuQSBNeyWDS5/Zzq7zQ+MEkPhmD9xqaCouAqrSoJoA9TOMykmmZkB
	 PfUq8nTC1uyaqms9319u4xpeLbS/TsQ0p0Uy6BbBkZ9M2DrhOJ+bBrOKE9QzM9n0VPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
	b=15eP9FU+xSlL/p0VtZNmN8ZdAbXMgBLWnIljnx/Ds0S2JlKNffMdHyhrrexRWb49FgL1
	 HNEOp2foKu3aetXKN3K7g5JnN7NIxkFLWDQRECOtqOq5f74GwcqbgTRS7CK27+sJCsVJP
	 lmDMU5fykxbxoDNJ9cFqf4G7IWXbbL5PEEywnVA74gPzOf3u9/Nwqd4H49wEVYRWK68gw
	 C5WtzNrEwozTqfqcrWYC/llUZpilhqOMfN9FvqObe8CLq/7dw5LsALPZ06jJJZOVYCvEv
	 5zdumbznKwTurYwoKZxSFxjSklW9QEAwMTvZd6ivlzQ6eKG7GAdSqeOULH4M+UU91rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyM6oUy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51358606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51358606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyM6oUy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so20986175e9.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 22:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795329750; x=1795934550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
        b=ywyM6oUyz76x6mwkCve2+pHTwiP5a4/k+93GHzzUVrarrMdmOyzeNZGofKeGIbY0Sl
         58QgHWIYtsHBUwKDM8S9/lHoJTYeIJyWGyXbH2FLgwbamPRP4pxNtDZYDFwZI773qYsM
         NXqLotGHpcxIwIdqrt6nFIrTP+f9Mu4gFo6zPTZZOXcw+VXbs8Peco7twgSCsN+2izMa
         CTfq1PRnq7etNRwgE9rQ0WuzgEX965SmCiChq9YgR0QsnmkdfOyxRQV7aC2smlyk6qHO
         zOZVjtMKQ84ixZSr/QNsZeA8ogfLZXyWuIbHIyBZ3J4yaxBdpoPDns4CW7aHatWdbf1+
         FCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329750; x=1795934550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
        b=BlRar+ubiyHiA8hYV4Q6OOJuuxa8ZZiRZ1S0QWf/ImhOi3ZpBcAjZne6Ev5441SjxP
         lnCVYoXns19UO3smU5MAgsL2uiTc4rny4iTc4G37+/YHxAmXVPQZYEFyCT2SbepPqEmM
         G1nk7Mh34K1qI1VZFfMrEoDoh8lgCt4vJYatmJ+vtw1sK822KMgX2EXSQKF2U74nLCSd
         HhliB/BxoPO9Q5EP03+j7LGd7EFjXskwFzCs7q1UUWElJOz0K3Z7XiegTJgrbCdURG+y
         06ih3fLYlYGBMHV4vZmRBjH9pXGiW6VpwaRbEAy2rqF7CHSiUdVw2hngYxFkcwAu5Wy2
         bmQw==
X-Gm-Message-State: APuU4Z8OgqpFLLCYmPp7i8tPfICL7J/Ec79elUzysaG+7nv39ndX95TC
	xFB2cnTRm3ekjC3h4elN+JknRjLY98MPjr++XPGm8xX3dSajwNmBiup6Ug/FVvS3
X-Gm-Gg: AZFdTZfJvIKYgHnq+l+fP/n2rmIEPhwFhp9kwnl7ggCYqDlMvDPP9cDkD8DLI9VbMEF
	rSe2uSwffREaNJJXtst3uJZARyYRk3CzGfVO5kfNsHgNLTMFjRIZ39wS2a2NEdoz5VMFJnxUjMw
	5lMD4BTC17KMAxCAPAqLBgGeEiyKFgMOATfNHpHXG60rZCcNHTX1+juvLa+ZC9GAt5NKuqpyBuS
	35aEZgmn3eNMDx2Tq2zuI8bEGLbJt5CWhqEH6vN1+3TUpRiqWUZ4FZtbWfWlmKN6jyMPkV69Y+0
	YP5sj5xgvx/KNp5GdciKUHVpBQxxgh+AHdbiOjWOUZ2Sf2Znus7Zr1QvUNs4UcsOGjwBBOW0Szp
	MJLi7g9aROJ71sHaw4XNzDQ5IGCQh6iqd6tDt1m5w8FiCfxdzR7B3wwKWyBE/FWUWbsPWdZ3Kqv
	czsUHTwhEEJHGv+3FJ91gSkKJx2KOW1JoY6MAtkTGrpb9lVHqhdHrMwmVBswGv93XI/BovHERwa
	jMHJpiu/s1LoTTCE9SYaqPnRdaOtMp+3ELN3ZBVPGB0KbAC9n9IlNYJxQEawidw3SI0zwKaG0Lo
	jEM1E+YHhOnGkv46Cm5OibYY+9Xcm729pzJ1OGwmwQ==
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr179283065e9.34.1795329750289;
        Sat, 21 Nov 2026 22:42:30 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm13745986f8f.12.2026.11.21.22.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:42:29 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev@vger.kernel.org
Cc: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org,
	Mohamed Dawod <mhm.dawod@gmail.com>
Subject: [PATCH net v2] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Sun, 22 Nov 2026 08:41:55 +0200
Message-Id: <20261122064155.2094434-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
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

cbs_dequeue_soft() estimates when the transmission of a packet completes:

	q->last = now + div64_s64(len * NSEC_PER_SEC, port_rate);

len is an int and NSEC_PER_SEC is 1000000000L. On 32-bit architectures
long is 32 bits wide, so the product is computed in 32 bits and wraps
before it is widened for div64_s64(). For a 1242 byte frame the product
is 1242000000000 mod 2^32 = 754451456, which gives a transmission time
of about 60 ns at 100 Mbit/s instead of about 99 us.

As a result q->last stays almost equal to now and the packet sending
time is ignored again, which is the problem 'commit 961d0e5b3294
("net: cbs: Fix software cbs to consider packet sending time")'
set out to fix. The throughput becomes

	idleslope * port_rate / |sendslope|

instead of idleslope.

Measured on a BeagleBone Black (32-bit ARM, CPSW, 100 Mbit/s full
duplex) with software CBS (offload 0), one UDP flow with a 1200 byte
payload (1242 byte frames), sendslope = idleslope - 100000. The rate
was read from the qdisc byte counters:

	idleslope [kbit/s]   before [Mbit/s]   after [Mbit/s]
	10000                11.1              10
	20000                25.0              20
	30000                42.9              30

Cast len to s64 so the multiplication is done in 64 bits on all
architectures.

Fixes: 961d0e5b3294 ("net: cbs: Fix software cbs to consider packet sending time")
Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index 1c93469c56e3..107c2b6e9da3 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -222,7 +222,7 @@ static struct sk_buff *cbs_dequeue_soft(struct Qdisc *sch)
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
 
 	return skb;
-- 
2.25.1

