Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758158;
	b=0U9R/BGMBpfV4g65dWuChLWOSgH2zyI8ji2heSxmvQiOVTtDdC0zKqMpjf618yYJkpiY
	 wq4PyMsb5wXIvxTsyk15X30HHAvHIITKIs3s7fqlw2PvRiOkDwY9EqLhZgp6xT0ODvPVP
	 75xXIBK5dnPq/Wh4LAzqgEccDD9Hou+WfV53EFRridZFSDIY28S40sbklPCQdMYq0sg+l
	 GW25Of6oxgpAAdMxXjF6f0wdl+dccA8uyZ6Lh7nqiSOlRLRQzmFwDSLNrc/StJbG3b/Fn
	 9gIS9Ru3liQoWLo4v+sG5rX/dISqplAtgjHph+eknrUEtv7/gsSB9OfJ7rrMoqYvHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:Date:
	 Subject:To:Cc;
	bh=6vL2sQL8xGeeLmFDinckbtrAWtg2a3oAHIFufbH5hHU=;
	b=ynUMO8ip2PlqrRKejEj2w/gzN395WEcAgug6dALiWQ2qnmHNBuW62VwZ5VOYWtf4a9Cx
	 rPPY/umkFHsQklePAASpQ8janYrjAamGedPGoYuN3YJhILkG/h5fzts63D9IBvVBdsulN
	 431KR7ExPXhDTYALd8RrPP0AtES01r6NH+L79lFeg+EkLRceeBDKvFu81UIs5Fcfm+CSc
	 7M3sdkH0rE2ECGf2G1QkSzunzpaCx37OPsxeMn3RF8TISwllzoeXYfWb2J1sPBDHeTiIX
	 aS4JUFsgcMN3S7D393xAGJARdVk6es85Bbpv/TSSjk4rxSjMBVtnpjn2vFZgo1NylBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWITkCaK;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC722606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC722606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWITkCaK
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b426133d98so2005811a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758157; x=1796362957; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vL2sQL8xGeeLmFDinckbtrAWtg2a3oAHIFufbH5hHU=;
        b=CWITkCaKWNAEFV4SKPWxpjJ5Rj8LHY3zLAIC5F0wknzcM6RweSJYGZNusFMYUdlB9f
         WsiEb7oGltI0haAh1IS/aqhkFvOvS4JS07loC9q101VOxgZvACY3vmLZqoVsDxMW67nz
         kdz3lBBMCnTVGZz4t3v6uO+DeEwX76oEtZIJgWVYAqLsNgQ3VAcZ+YAqNiXakmqF7Lt0
         bKAd2FytqcxX7Yjxr7z8VGMWUUi1qN2Io+/bYSKBWREU3m6Iv148gk7DCqm5P8U26xei
         exMT+PXlaRYHrJbniVpDrwUWmo4F73uFGcKHLLe+Bo1e/gJLZrI27ebgUo8YJagU2PR3
         LQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758157; x=1796362957;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vL2sQL8xGeeLmFDinckbtrAWtg2a3oAHIFufbH5hHU=;
        b=ToJ943DQo5K5So8wHmOt1RUjpzXIlq+MsI5xJKaoTG/OHmO5aHzcFBUZ9aRAj5tuRN
         wKU4HUKuAWgSlujJ7Vsif9+ME2rHhyC0TYYdcOylorgB8dQsNALHSKXmkXgaxr3/bDeS
         GshehVWleF/2DNQAj4mKbe9cpXP13uioYdNLB4Z5z6viLJXcglfRd22NdCW7OvbZheVO
         7NiuYaCGBwq0VOi+sgk5HVG0M1dGDqYcpI0uCkPUdf9snSzwBSYCqEFuw0c17CRaRP4x
         TcifWN8MGft0QC/nNizSfZ2QWJlgktYDEnTeaRZDsyOdh5DUQG41haqh8nlOy0nDt4EX
         jBnA==
X-Gm-Message-State: APuU4Z9PQGX/3zBWaAjt+fQmW7Bbe08lmX0qsybYw9tEqP8ZVG3n2tha
	zdv7gdYohU7HuhyhPGQ5ZxBmb1oRFF9O88fXRxB2tGbP6w8KkvyNRcVsEJ4QWg+oZk2bIA==
X-Gm-Gg: AZFdTZfujahx1f3X9O6FL9drRRdTmnA5UgfOdM+RPY2HhXb/lmBOnfmMHiPxZWnIf9F
	5aGbgNAtfmnbbN0g8jBRaaYWf5uYllVZU7jghb3e8yt518zRLs/1ZBx4qm7VXNt0l65EZ2C7CzJ
	VtUzl0r4L2LYp8VliRa14+JIEZOB86rbKg7GWltSVTTNv55fV8j52Hu8qIk4URlVnuc6NnaDwWn
	lm2X1QdhMAiEuf8C8P5Jo4et+UVgr1OcejowqnYtTe8NVhpw7cmSUPd5sFYd/UaQgEj/bk2aTkK
	yNJj7JbzNnonSPGEwdglJ+TG9QLKcR+0/Mn1/xtI5q2kmI7q2bFe/D8H38WLDsCmwPKiyESnZtM
	e3y98vTTSTRW8TBri3lGxzTWlIjXX6L/E4r0oOe1Flli8itOw+uGRzwrNWTNUQj6u1sUZZ7X/jp
	EbK/UHQE7+e1XSAqZB9ipyvWFGfTT0mYmM/CU7zRFkvqITwha/ZEP4yU6OI34SazPCc932vHe19
	53FFZGefqF2Uh67YAM/qm1yxIrSsiSyi+6s2/JMh10J3D0Sy6G0yARQ543gFh9gn2MxDsqFqr2I
	/K2+VLZsASy/l/zvMYgqrlsBKsYOZPzO4oS2zg==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:12a9:2dc with SMTP id 98e67ed59e1d1-3b41c7abf82mr23389670a91.8.1795758156951;
        Thu, 26 Nov 2026 21:42:36 -0800 (PST)
Received: from [169.254.212.233] ([2406:da1c:1ee6:2e01:64c9:ebb0:9e1:f7da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm12022687a12.9.2026.11.26.21.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:42:36 -0800 (PST)
Message-ID: <cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 12:38:01 +0800
Subject: [PATCH net v2 0/4] net: fix dst->dev lifetime races
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Hangbin Liu <hangbin.liu@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

The conversion of dst->dev to an RCU-protected pointer left two route
confirmation callbacks and the IPv6 neighbour lookup callback loading it
without RCU protection.  Also, netdev_run_todo() did not wait for readers
after flushing routes that can release the last dst-held device reference.

Patch 1 adds the teardown-side grace period after the route flushes.
Patches 2 and 3 protect the IPv4 and IPv6 confirmation callbacks.  Patch 4
protects the IPv6 neighbour lookup callback, matching its IPv4 counterpart.

Finding and validation:

- Patches 2 and 3 came from an AI-assisted source audit.  Delay-assisted
  KASAN runs on the exact v7.4-rc3 commit reproduced both bugs:

    BUG: KASAN: slab-use-after-free in ipv4_confirm_neigh+0xcc8/0xce0
    BUG: KASAN: slab-use-after-free in ip6_confirm_neigh+0x6a7/0xbd0

  The delay was debug-only window amplification and is not in this series.

- Ido identified the missing grace period in patch 1 and the unprotected
  lookup in patch 4 during review.  Both were validated by source inspection;
  those two windows have not been triggered independently at runtime.

Testing:

- KASAN reruns on v7.4-rc2 with the callback fixes corresponding to
  patches 2 and 3 completed without a report.  The IPv4 run made 392065
  callback calls across 110 dst_dev_put() calls and 48 device frees.  The
  IPv6 run made 13144 callback calls across 36 dst_dev_put() calls and 48
  device frees.
- On the current net tree base below, these objects built with W=1:
  net/core/dev.o, net/ipv4/route.o, and net/ipv6/route.o.
- A full allmodconfig or allyesconfig build and networking selftests were not
  run.

This is treated as a regular bug: the demonstrated teardown needs privileged
network-device administration, and no privilege-boundary crossing or exploit
has been demonstrated.

Changes since v1:

- Combine the separate IPv4 and IPv6 submissions into one series, as
  requested by Ido and Kuniyuki.
- Add the post-flush synchronize_net() patch suggested by Ido.
- Add the ip6_dst_neigh_lookup() patch suggested by Ido.
- Distinguish the dynamically reproduced findings from the source-inspection
  findings and document the validation limits.

v1 IPv6:
https://lore.kernel.org/netdev/20261123133000.1.n0ps1edzz@gmail.com/
v1 IPv4:
https://lore.kernel.org/netdev/20261123133000.2.n0ps1edzz@gmail.com/
Review:
https://lore.kernel.org/netdev/20261125190113.GA421469@shredder/

AI assistance disclosure: Codex was used for the source audit, test-harness
automation, patch drafting, and changelog drafting.  The runtime results above
come from the described QEMU/KASAN runs.  The Signed-off-by tags were added at
the submitter's explicit request.

Zhou Qiuyue (4):
  net: wait for RCU readers after flushing routes
  ipv4: route: fix use-after-free in ipv4_confirm_neigh()
  ipv6: route: fix use-after-free in ip6_confirm_neigh()
  ipv6: route: fix use-after-free in ip6_dst_neigh_lookup()

 net/core/dev.c   |  1 +
 net/ipv4/route.c | 12 +++++++++---
 net/ipv6/route.c | 24 ++++++++++++++++++------
 3 files changed, 28 insertions(+), 9 deletions(-)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
-- 
2.56.1.windows.1

