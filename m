Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391850;
	b=USsRMk7MZWdbzhrTfB0a4M8+iv4pkDRn14YFKKBFGOyfC1Cje9glNTfLfiqbQkmjtZBZ
	 pyZmRinGqbRAXcagzrAqMWW0MOJvVD1J+JYoh+0xQVDlhxI1unoqwDqVxNbxGhk6qD9Ex
	 uTs3vNu93MHwVXmyDfQlE9sYHzLD0H2VCrbG3/CCYyLgse/ewC5bi9Xub3tN3srWBrEOK
	 VGeGulXzdIs1IxkujZR6XAFsNKb7kmZOHBHMqZKYslllPRuktRsUjztna5o5dAgXA/Qtv
	 lEGY3VHM3PBYCK7Yaen576ll/jdZ7v72jYhwP+w2/iEqmM6jxahpKzDEcSEXRzOf09A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OWDvcWQJFaW+Q/Z3BycR33gTS+57k2jipoqFVw/ucn8=;
	b=hDIUhPQ2nzWkF8PZMrVhzVpRJhh8eXlqUQssgwoCW3jzxbltLSDQm0t9cBPW6hf8FBzM
	 greZtI1vcFIzmf1yhM61A/4c7lVkFJHUhCYSHhxRTfZiHGHSsJBeORNWHkRJFb4Pr2/S9
	 ipIqF62kTeNf6QNIBgk0cgTrTvPOGv/yYyfviLGHiN6HNP6uc8CbwzW0AVt64uwho8SoL
	 vp+itV2OrSmTjyeZ1DsPKQCpttbylFyX5EGgUHMFsbqYqNYG6CgBUrap8Dt+JTRsqf0EE
	 sDhDS52YQWmH0wqA03A0Pk1qGaQAyYaBBf4MeHopTrQO8qL4JVhLPoG1uTJmj6GlCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=jRy3l6Ar;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EA606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=jRy3l6Ar
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so3848443c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391849; x=1795996649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWDvcWQJFaW+Q/Z3BycR33gTS+57k2jipoqFVw/ucn8=;
        b=jRy3l6ArLAvmqX2JCmmSSw1jPnFu7XKF3tr1v7xXmwpWJAJdlMeH0O2dM8kJN87DUL
         Q9GYAIwIgYNMo6Jwe+BcDK8kMHiIUH0pzrIxBy5TMlqbAYDar5vefcmuxoX7o367/7aZ
         Nf9g4XrP35n4qD/POLElajb8WRZvk9UR+GWyhVxvfk/jzEA0ilTe2+Mng7ZuvoPfbys6
         eJhDSn9huxW7wPywERRvMkm/5N49QVmZh9naSdsy2crX/FRSJlGol/gXqdL5aSS9nuHY
         crnvNl6WgSTj/kmKyz+NbaLM5Vci6p0LzUfXCfWuuoGp46Ir7EoVZsbRxCOKj+Y3rXSB
         5lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391849; x=1795996649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWDvcWQJFaW+Q/Z3BycR33gTS+57k2jipoqFVw/ucn8=;
        b=2h4Ryg5puLvtO1Ipa2YD4Ctdh6tlAGgJF4pieWsNqupuewzICmvE8WWysETWBRE1Ns
         jsJEWLFIZBnZj7YN4N41SbNnxAuC45Eu6pijlOCxXqrtnQLrTXzgFXwapJa7hvigzuUL
         eAgc7gNng14QMi4TK7cXErDnVYDb6/Kz+tE2lc5dlNUEqQ5c38eAfJJBJ7+Qtti/Gsm6
         TlmHx4+KoU+tBLyYK10Zt8Ni0GJOtkctJMbrFaKle2FxrTM5Kx5BrAbuQuEEZG0BbWIJ
         yGRIAEHGJRmjFlUoErHmJnY23UER3SGoYCQPom7lkaKgtcjeaY59EP6sbKNkhl0sxwPN
         Chcg==
X-Gm-Message-State: APuU4Z9vdkaqmreUXXy2orrwMDXz4NTpk2a0lwf/thsXA0VQpShatgQm
	1k1tn5AjgSbj9jPQn2U+9eguG5e8U4hQA7jqQN04cv5X0GtXupooUVMp7Ph4ykLwVMg=
X-Gm-Gg: AZFdTZeXyMiqaX36CTEkzjMsgGY6I3ua/vbIyU/CVVAA9vxgXn1ImSEp2YqDxiknvFn
	e+09AgQSm+91tQcqYfrYbg/p+1dAlUZaMg0l2seWau/POansNgxoRWcU/P2C3nlXIhCZtWtAGbN
	uih+wvSzcL0R2e1X90PMYQdeqXuqZiVSaTLODL3gZg7q9O9AXi6IMoB+4pN00HZOMCA9qo5ybI7
	7LOZtiDzIy8wiNGCpHJbqi2OA+POOw/EBvpp4mWsHTfLqF4Yv29yPkj5ExjKH+wv63tW3OPVeTX
	Ibx9qbk8LT0JP0q32pd/zPeFc6a9szI5sGJ+pCGoSQpUXWv6BAIzP9V+cvznKXlS/Uh63MyUvUA
	E3jiveAyqclEtGtwl8OMtKliFtYpgGARTK6RJSypbCIkOEQfgyKjpvLFPTWEiZyBQiUxstSNsRM
	rguPqUYkHZd275+Kq0uYDFnklASlduXATUcoAqBp7Lr4RdUwgZ0lU1b4N4yEWZW5iyAgx/JdpXO
	Al9dQPD3VH7GyJgVOdU+pjiYIEkdmEiiH6mITHompw+Ujy48V+Jtt+U5oVNT22hOXCH8DF3qe7b
	eMzUzY7PokiptWjIKyDFAUX07zYZH7HA7r9vwwrJXZPF+WzXLvqZPKbYmi3x0cpWRE0AOZI66Qy
	ZXLDqxGeFcYgpWFBslqB1j4TCAJO9HaobB7RCkEOOMb8q2LWLjb76
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr10259181eec.29.1795391848463;
        Sun, 22 Nov 2026 15:57:28 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:26 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v3 0/3] amt: configurable per-tunnel limits, with bounded report work
Date: Sun, 22 Nov 2026 23:57:21 +0000
Message-ID: <20261122235724.2898320-1-omar@blockcast.net>
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

A relay caps one gateway tunnel at 32 group and 128 source records, both
compile-time constants. v2 made them configurable [1]. Sashiko and Paolo
pointed out that at the new ceilings a single Membership Update can
livelock the host: records are applied under tunnel->lock in softirq,
and only the packet length bounds them [2].

This version keeps the processing in the RX path and bounds it instead:

1/3 makes the A-B case of amt_lookup_act_srcs() linear. It used to
    compare every source in the group with every source in the record.
2/3 charges every group record for the passes it makes over its group
    and stops applying records once a report exceeds twice the cost of
    refreshing the tunnel's whole state. A record for a group the
    tunnel has no room for does no walk and is not charged, so a host
    joined to more groups than max_groups keeps its refreshes.
3/3 is v2, with the source hash sized from max_sources and the group
    ceiling lowered from 1024 to 512, which keeps one tunnel's worst
    case at about 4.75 MiB.

Measured cost of one Membership Update, in a UML guest (KASAN off, so
these are slower than native and only comparable with each other), at
the ceilings, three runs each. These were taken on 734bef548a96 with
v5 of the net series (an earlier version of [3]), before this series
was rebased onto net-next, and with an earlier 2/3 that also charged
records the tunnel refuses, a path neither row reaches. They have not
been re-run since [measured]:

  report                                   v2 ceilings      this series
  512 groups x 8 sources, full refresh     5.0 - 11.9 ms    4.9 - 10.3 ms
  ~7,500 empty records naming one group
  that holds 4,096 sources (64 KiB)        1.74 - 2.32 s    26 - 45 ms

The second row is the livelock: one datagram held tunnel->lock for about
two seconds. With 2/3 the report stops after its budget of 3.85M bucket
and source visits [estimated, from the code], about 120K at the default
limits. I did not manage to drive the quadratic A-B walk itself into a
measurement; its old worst case is |A| x |B|, up to 4,096 x 14,998
compares for one record [estimated].

Deferring report processing to a per-tunnel work item would also take
the work out of softirq. I have not done that here: with the work
bounded, the deferral would add a queue and its own limits without
changing the worst case much. Happy to do it if you prefer.

This depends on the net series "amt: relay tunnel lifetime, validation
and request-path hardening" [3], which fixes the source-timer vs.
teardown race Sashiko also flagged: 3/3 touches amt_newlink() next to
a line that series adds. That series is now in net-next, and this is
based on 24630ff92eff, the net-next merge of net that brought it in.

Testing: tools/testing/selftests/net/amt.sh, unmodified, on net-next
24630ff92eff with this series applied, x86_64 under virtme-ng/KVM (4
vCPUs, 4 GiB) with generic KASAN (inline), PROVE_LOCKING, PROVE_RCU and
AMT=y: all six tests pass, amt.sh exits 0, and no KASAN, lockdep or
WARNING report appeared during the run. amt.sh does not reach the new
limits, so this covers the normal paths only; the over-budget path of
2/3 is covered only by the measurements above, taken before the rebase.
Each patch builds with W=1 C=1, with IPv6=y and IPv6=n, with no new
warnings.

[1] https://lore.kernel.org/netdev/20261015231825.2852054-1-omar@blockcast.net/
[2] https://lore.kernel.org/netdev/361bbccf-6ce7-4b1f-bd55-4d8270423320@redhat.com/
[3] https://lore.kernel.org/netdev/20261110210538.217936-1-omar@blockcast.net/

v3:
- New 1/3 and 2/3.
- Based on net-next after the net series [3] was merged; 3/3 rebased
  onto it.
- 3/3: size hash_buckets from max_sources, at most 8 sources per
  bucket, 256..512; lower AMT_MAX_GROUP_LIMIT from 1024 to 512.
v2: https://lore.kernel.org/netdev/20261015231825.2852054-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261014221334.2443184-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (3):
  amt: make the A-B source walk linear
  amt: bound the source-state work of one Membership Update
  amt: make the per-tunnel group and source limits configurable

 drivers/net/amt.c        | 118 +++++++++++++++++++++++++++++++--------
 include/net/amt.h        |  15 +++++
 include/uapi/linux/amt.h |   8 +++
 3 files changed, 117 insertions(+), 24 deletions(-)


base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
-- 
2.43.0

