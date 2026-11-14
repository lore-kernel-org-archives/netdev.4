Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672389;
	b=3kHJkYYhTAwD86uvHn/pZI5aJYIoKUZW9SDu9bTd+Z6NImgu4WsWjwghLlkupT00Lxgb
	 Keho+b5RTQOR7IbWoZ108dw6odRBtiC9nzqC8UZpWd6vxPkEhZmDESvsn8ELqVNNnBgmK
	 ZxQktdR4XAh0nKuw9qpBa4l9hhs/iKHjFEeO0pVa1d5i/sz2DapU1As4ydM1Ujwn6RbAq
	 ARZ7tZE9bp/1YaOiTKn275a4rr4/XHIubzmcGmPdP495nZHYNiQIavylXUAczGqZtFJLn
	 YuLRowwaPmN2iZwkAE+woY7Tzw8g5uqYPZd+TcYp9iltqHDEA9bPUEZ+cDXhSdWCWKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YLqpOrY5wphe6XnPgI9og6/K27EO1dnETkN+/JSjm9k=;
	b=jQb3ONYh1bMkcR6QkB9SDY8UzfMgI1EWvzBA0K4WPBCGZ6wJfFyvbkQBpmAcux2TxH3u
	 glOpPbQi69E6oADybdnWaF6mDLlspCNEwMrUdAX2HR50ezCus0IQ/wkIf+k3s4PScAk2e
	 4B2HUr0PQ2whf1YTDFwGbKUmzI88MgCGZza7Nwu76vUruKxy4AerB+LH5RJaVdaZJmvc3
	 Wn8na1iVWTDvq8t6AJUzN/cAf9FxSo0f+tDO+9t/A90vCUQ15MrLjTmibtx4iniyhE0cP
	 DCgrslKF3Q5ifC2GIbnfBqYrvu9zwO0+eGyYb0tXS6TeRXLV1S9cmI6j6ReQ/zRZK2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3vHXHdv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A030606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A030606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3vHXHdv
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so2549528c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672388; cv=none;
        d=google.com; s=arc-20260327;
        b=J6s7uR9Evcp+0VtVxM6UNyMPWG4z7qZOnfm0KdSMhbV9MVGNynH2Hz7tRGjv5bhqpv
         FimVmRV7YWMJCuypFWm5c3koglQ3jclfI5G5GtXDSUMraYwt/Gkq/FDvmwsBHeMXGBKa
         KHPTr+zzZBY4Nghbgi7oectqZO1+IULdzcm/Uz+TcBeiK4OC10IhKHCcF0MA8wRBl4CI
         LqZ4wtGBejVUMqkIs5vOMAahUBLdIgvn0ktVYZvYVmdEmqAH7zUSdu6S3Y7PL/xEFseA
         c3yB9bQHXbjAmE2zYz6QV6dS1DMYjwf/DYzy+ICalvSzCxoOO7Y+fI0fCqQeK7+waUNH
         9AZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLqpOrY5wphe6XnPgI9og6/K27EO1dnETkN+/JSjm9k=;
        fh=z/GeNMHFgxOrhVb2Xn1Yp+/G60Ur2BJwhb9QabHU1Yw=;
        b=ICHpquyDTZNfpwoTKnbPIIuPjyoR+pxBE9QMhtFpDRvCc1oUhgZZhF2GQ6CEObBTWH
         tV9kAYTjdUgrN7QWq7QLKF/DA3kFwW5YGxq3J9EkRAjuVJpYVRLae3gN+NDTgZDSoU3s
         feK4ADhV6zu697VGXTvyROjng0TftOkySxXbpDwW/O30yhIuL6ir7xohGxons8jXukcO
         /ilvciHvAIMtM+YD4IKa6AGf+P+wUa8rkcH6VCQRJb1gbwZHIgrPuXXzbvFF0QYNG8Vh
         cQ7vWWWAfa0+DaPXK9yGpsPBnDaK4jyXna0bExaL5UVxH0SWmQGLh0evu1npI/Of624J
         XpqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672388; x=1795277188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLqpOrY5wphe6XnPgI9og6/K27EO1dnETkN+/JSjm9k=;
        b=V3vHXHdv1+RQRS8t1GbvSP3zycZyuDvzQGjYfRESI2ugST/GXZCa21If6HdCN6DTFK
         1bgqJjJuvDMvs5B2OV0dZOtpaerqGlzplcfbL+w7h1vs0F+R01x8Yb5IAyuX1JaVgblt
         oi/zegNwnjA5qHgmpdAJXqu3ZJUU3A3o3BZcn3DcGyGiTfzTBw1u/5uaNSRrpttp+PfT
         bKY0Dz0IAFVh5VgX++Z4bZTDGXTeGdSB3zi3uDTPYRnkf2qVTgCVIzS9kUyGAfmUqaYY
         cSVho0OLRpb6WQ+xPmzgmfKb1RmEWv2U1n/LOnFPcJhxQuS60+dJYFDJn8m44fmilw9m
         C+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672388; x=1795277188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLqpOrY5wphe6XnPgI9og6/K27EO1dnETkN+/JSjm9k=;
        b=PM/2jggr1uwI46hiyhlbU9xkaOWf/W4IP/uXggqo9zyS+XlHE3HOQQfJeTHgq4Er2k
         Jk4KWEw/0zOeSp0nXZgomYaaXgPoPvDGZaexj8k4PtfjpjCOU5znOBtu/6aa+qdnuPHh
         GdS1dm+vKlkREHaqwZ6kgjbi2W/o84NEF/jN+6YVjXXUQ0dRb+qMhh50HK2gkTiMtJxu
         38fzde0UVZudx1qb5LdmyY0TpXIAESYav9jrIXtL/lGQfxtoOs/5fXkJ9EDz4SrrZdzy
         Vc2t11giX/TfIrMA/3pA78c66uouCmMXLGpsiAvKm1ALwPoSqu0+X6mPG15XyNppRNCS
         JErA==
X-Forwarded-Encrypted: i=1; AL+hErFUEea3XfRRtyPiQaL6IEEg3bMDsYoM4z46KLS6tgQbchr30WruSqpHopVvptW8pMCXmuNaSak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O6AkDSzPytBpFQofThk/JoREg31LfqX/t5RR0A733d2t2OOig
	3znUQ6Qn8bj+PAFBXp9FHa9l4U6XzY7SZYsU8yMEDT777Mxrqs4y9j3yIO4gVS2+54TxZY6Kt+Z
	WsWM76irGDKdzcnEDYDsUcsVVx2G/DoR+Yj2tcGqy
X-Gm-Gg: AYBFou2/iD0Xys8kg7p52lG7oYxjqTBf5Sk7ibsG+/t3sEvoydNKPujlBeaXpOGJ6kB
	RF+NwipNZlLp2oZ/w9Sbu39UCOEecPTADYEVoEsUepjr5yYLqkaCRGGkftmO2nHDE9cTtphkmGQ
	riElrT40Yay9lqHnaaZMXpBXcplYsH9c2nyH+k/IfyNc0og92Aw2GMrtlXVuw1lQ8Cjh4nKKKyJ
	prAPc05LsSBKNy4twEtwihhLGvyarcKb7az0ASp4AMMxniaTqcMnM6Aa6QAtM/phjB3Tf9vAtM9
	Kwct3SWG20d6BD0gqy+I91+sv+/UTMAaA4LzUl2kWTLta4QeZazDOV1yG++B6+hr9r5tKc6xpcK
	hcSXqTjdpgeIqTfzXPldjPIgEzQeBLbb5U9KQ3nuVwfAHrDuHlSwrmz3hWpRo0E43BDcwcBEsSG
	IPpE8D/Z7VVLfufzs1HJz5x9RJmN2wrvHirlf4b2qPj45pIwA+9dz0WPNhYWLkesrFsE5iKuqQ8
	8TW3cTApbyMZ25t/2eLvlPhd/BK1qE=
X-Received: by 2002:a05:701a:844c:10b0:190:596:4071 with SMTP id
 a92af1059eb24-1b5030eb279mr5675442c88.11.1794672387156; Sat, 14 Nov 2026
 08:06:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com>
In-Reply-To: <CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:06:15 -0800
X-Gm-Features: AclHuK8nU4CoZkMhu36U7ELxqIfxXUYURJ9Dlv6srLu-mcjnN5sT8ho-RH1k9qU
Message-ID: <CAAVpQUBPz90xhswAJcQXsZfEzim+p2ry-F4kpbEWWvX2cMO6mQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 0/8] tcp: Prevent tcp_collapse() from bloating queue.
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:31=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > This is a follow-up for commit 031c403d13e5 ("tcp: do not let
> > tcp_collapse() drive sk_forward_alloc negative").
> >
> > The core algorithm in tcp_collapse() is so simple and has not
> > been changed since commit 1da177e4c3f4 ("Linux-2.6.12-rc2");
> > finding a collapsible skb and repacking it into up-to-SKB_MAX_ORDER()
> > skb.
> >
> > Now that we use 4K MSS and tp->scaling_ratio, the simple algorithm
> > does not work well, and it could even end up consuming more memory
> > contrary to the intention.
> >
> > For example, the scaling ratio of SKB_MAX_ORDER() is 222, but
> > typically tp->scaling_ratio for 4K MSS flow is 252, and repacking
> > data rather bloats high-density skb.
> >
> > Also, once a low-density skb starts collapsing, it drags all the
> > following skbs into collapsing regardless of the density.
> >
> > This series changes the algorithm so that it skips high-density
> > skb and a single low-density skb between high-density skbs, batches
> > memory accounting at the end, and removes sk_forced_mem_schedule().
> >
>
> Thanks for working on this.
>
> I went through the series and ran it on a KASAN + DEBUG_NET kernel:
> your packetdrill test, a packetdrill test collapsing the out-of-order
> queue, and a loopback stress test (1-byte writes, small SO_RCVBUF,
> payload checked by the reader). No splat, no corrupted payload.
>
> I have comments on patches 1, 3, 4, 5 and 8.
>
> One general remark: the series keeps linear skbs of
> SKB_MAX_ORDER(0, 0) bytes as the collapse target, and uses their
> density (86 %) as the definition of a dense skb.
>
> I have been working on a patch storing the collapsed payload in
> order-0 page frags instead: alloc_skb(0), then up to MAX_SKB_FRAGS
> pages added while copying. A full skb is then about 98 % dense, like
> a 4K MSS GRO packet, and:
>
> - There are fewer skbs in the receive queue and in the out-of-order
>   rbtree (one skb per 68 KB instead of one per 3.7 KB).
>
> - Payload sits in full page-aligned frags, usable by
>   TCP_ZEROCOPY_RECEIVE.

Wow, this sounds great !


>
> This does not replace your series: the selection logic (skip dense
> skbs, stop at the first non bloated skb, skip ranges that would not
> shrink) is still needed. But TCP_COLLAPSE_MAX_SIZE,
> TCP_COLLAPSE_SCALING_RATIO, the estimation added in patch 5 and the
> pool added in patch 6 are all built around the linear format, so I
> prefer to mention it now.

I actually avoided touching the last loop to avoid complication,
and your series will complete the revamp :)
