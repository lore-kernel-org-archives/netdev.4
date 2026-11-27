Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770965;
	b=dsXhCq+Uy/I87KOFeXvn+m8H95q1Nqa+zrPYCOhxkgN/3lyLZ2eqFwFY5WaHregDd1Qe
	 kJkULy1SAagJDa7giY5qOznQlk1pXXrI63EeAwz4b8YdsFCwGwE1uroN05vMOzuK5dlEH
	 QBpFLEFtQvbcGxn5d0e9QynoJUWP24qj8mW6aopJ6G4WYOs54gMB1XgSWB/EwoI77Alv6
	 XYxaIvUN4CmNrr5HpkSAPJsm+53vf9kILaLGuqJr39TGxMz8hKmyMkTF67qRWrsxecHxk
	 He4umsLKHTV+GxJhKrjEPWjHcz8F6TU2FIglQIum9BbZeGdj6l7ltrg59ExMb0rjkAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:Date:
	 Subject:To:Cc;
	bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
	b=Xd3FLlwnWAVsaKSm6h1emPootiKyEMXuIOijjf37n6KHUmedTg2WG6TJtFUynP3piJK0
	 jklOL+3pei6gxcZvBUdZsE9hs0OlAc8KK5pdm5aaQcagdFfhFDDwqBh/4Ka7MENKr2hn3
	 sjB/MBAu3cu+KeAv2HnQV/CbCpFVSaZbV6H4XxFppMXQAqOlhtpqWpARUtROp52ZCO/s6
	 Mb3f3ucJOoJMW4ujROYEQhEhbA8XJGO7oGrfdFgi7azZOoXs68KkawYTxPBgXs0D4cZ10
	 pqUOjTl5Fmolpc4zhguPVdKXNjukYO4WypmL0wK9HCXf6jlLSyU2dtDVqJhMvY/GWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJGCOsjg;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C19606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJGCOsjg
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f042b6ef3aso56678115ad.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770964; x=1796375764; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=sJGCOsjgD3vfdsq4YYzV6nIOYtrLP6Smw/0L+vea26RSlbfEi5DmxmGugbjkmXzxIL
         v4SkG21qO7WzVyJbx5R/SF99Dt49toTzbyTUj0emFtDTbaKE31dp+AnhgFzvVw7Ni+tj
         SKk7zxrz8h7GK8ZuZCF/3jVCqqYUbUIePqg2SvjSThVNJZkOBtRL36OC5i81e6k5i0Jt
         AmJPTYVUeNQ8pXr8upLjAWt2SaCasFOWyS6wbANhRvkf+eGIC9fGcqmIJaw+ozbtMCl2
         j9R9oCFVE1gFC4pO0Dx+nc2uBp36D319haHMFZD3nTg9b4+eXfokmdMf43FCP1ziXikm
         i96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770964; x=1796375764;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=y3/mgZFpzh0TI4SAmwz7CyYxKNuMMZfi5nJmskkw0bpLXhgBtirNCx0w4wJGVfTszd
         K15lcYF2Hizrc5ls3Lq7ziSG400sJ4LzJjRf2nDhqjtVMDm4dWbuGuRX9dkuYE4t1ay9
         LMFrn2cSLkcII9q7JHzsFNIr+Qm5bgGOHydxyzMu+q4+TIXOGsnw4nVen1Vpul4wk4Eq
         6omjJ5SbBGjnjTFVJar2OVAO0vvKZeY64AjzVO8T8lwaInTQiVtHKGdYWFIMIX14w0jk
         N8j7vORQ7YVL8ZtEMSGUO2H8cDYl6CYB/fNQ5TBTb6Ev/tG9SQt9OXnYtvdtQ59SBsUB
         e7zA==
X-Gm-Message-State: APuU4Z+5EfHp9ByI6JZp+f6kUTiMbOnWJnJHGAArgzW0kc6a/HDyHks5
	YfjihAuMlSzCw6ljiCLBAt49oY+hFLUF0IoHKqj9ylcUs0g9uuTZvZxyUXFoUwYRII9/Vg==
X-Gm-Gg: AZFdTZeMaeGiQaXFQpDu+IouFJ9oBvI8UjyGcovUXJQuC2G2bmmPkXOpooTldUwqVpZ
	rzSy25ehw+9f63De3yXXnnVjX6UJmGSDUggllMImuyX7BlFXc+KQOfLWNzwXgqgQSzlk6FoJiVg
	2j+FuoFPC/HyuLGBhreDXs/W4QM2Dc6NzhzkwnCoAv/hsMSQkRoEqRhk1cUJCVIgSidrGIP9BJw
	P15IZeOvBjUEzujwD9+4bbrFznYmlOAsSfVgFPj4s/X/BM8fJD7R0tuRJnv4i7ub+Iv81uspgHS
	57SfRQQ3IkayVe6WsQRJZurdGAQy4OGxZW+nnQrmxlyhrJxORM6a4ZuccVHSGCbEm8o2zVaBsfM
	DUSU/lCsqAbmkzBZ7F2WfVxlzlHPvzJkiRq9uqXLd9E7oTtqkJ9SAU5dj0RqaKmgatAkcPB4pBq
	h7Ehyj/XEWTZ3AQVqX3u2mWO0eYd2xDXQwP10K/t1UVddL0kJMmFV9j40lKxvIT1HxjGTGzYpMk
	lq8JJgYvnyc8QojDnGij+b3TbVmlrO4SXl2Z+6BLA6foiMnjBBQcQTv+qld43gdOxWykjdVQiPz
	gVt3nk6cL/puuclrOB52m3BE4IPYqL6lkk0wQ6K/eUTYvIXPJoaCieKSiIepqrjw3JYXWyn8cuW
	j46qRKselHZx0qXkWHLCMfm0=
X-Received: by 2002:a17:903:32c3:b0:2f0:6576:280f with SMTP id d9443c01a7336-2f065762a04mr236624405ad.19.1795770963963;
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Message-ID: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 16:45:01 +0800
Subject: [PATCH net 0/2] ipv4/xfrm: fix two dst->dev lifetime races
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

These two dst->dev readers were found after the four-patch v2 series had
already been sent.  This follow-up contains only the new fixes and does
not resend any patch from that series.

Both patches depend on the post-route-flush grace period added by:

  [PATCH net v2 1/4] net: wait for RCU readers after flushing routes
  https://lore.kernel.org/netdev/ae140ad9c69d3403d3596b1187b86fdd232292e8.1795754281.git.n0ps1edzz@gmail.com/

Please apply them after or together with that patch.  The
prerequisite-patch-id below records the same dependency.

dst_dev_put() can replace dst->dev with blackhole_netdev and drop the
reference to the original device.  The route-output and XFRM no-policy
paths still had direct readers that could race with the original device
being freed.  Convert both readers to dst_dev_rcu() under an RCU
read-side critical section.

On a v7.4-rc2 net-next KASAN kernel, the supplied reproducer triggered
the route report in 2 of 2 runs and the XFRM report in 3 of 3 runs while
deleting and recreating a dummy interface.  Fixed-patch runtime reruns
have not been performed.

An x86_64 defconfig W=1 build of net/core/dev.o, net/ipv4/route.o, and
net/xfrm/xfrm_policy.o completed successfully on the exact
prerequisite-plus-two-patch tree.

OpenAI Codex was used to analyze the supplied KASAN traces and
reproducer and to draft these patches and changelogs.

Zhou Qiuyue (2):
  ipv4: route: fix use-after-free in ip_route_output_flow()
  xfrm: fix use-after-free in xfrm_lookup_with_ifid()

 net/ipv4/route.c       | 4 +++-
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
prerequisite-patch-id: 0e86b27e6eeb1f9bdcc54de4115415ecd29d4e70
-- 
2.56.0

