Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303293;
	b=Yfsv4+FAo8kdnTFtTT6bL5J6o9gaxJfQbLnLMp/5jer9+aQWq3MKcOjpQI+UTw1KlksD
	 FJc5mPV0gTy2Dm0Y+d2cfnfT1+0r8jI3HZqPn5lhGW+GlHw4dwfEXv9fZ2IriH99pC4Q6
	 KQLZpXY4QXrnXJdsurkhLnr/P3x1RVKtCwWDSjivQPIo/W62ZF01AVu4q7YAIsrhMs5V6
	 TQMMpeU77FgGgV1+zOfypJpHpSDayBvJBjMUCS/R4yD4PmLXcKssX3viwsJZrIeadu0Ll
	 B6C0wU1rtTd5jm3w6uAh3pC7y9piKkzAS6TE6KrpmxwXstmrl/Gzb5mChpgXhSRR4rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303293;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=Aj67hpSVfvyNeY2bYAHOKOCgXRNNXNasIUFLScoP+LQ=;
	b=Qyanwo7JiJvJmDqA9DeFZax2HqqY0wBqa2rZIKeAamo6WlMK/FvLlsOrU3MBS7mWFEKp
	 cUp2lfFq4XinrjD1VNksk+KS/7GU58C7anjIY5j6QtyDJqCK4RuWCvOyZwm8zYH82CqvQ
	 mtHTa9sdOV0voiWI9QILIIwt0zQv7LvJNcPCmKwBR/Yj8XX7YuypUDYmzVPRy0Jrn+Ph5
	 bSrRQTyejU3mNrLwe9+Yvq9/cGHas2j4wXJauM/qLoN0F20j9gn2QVDJnRooAwmYRzg/D
	 BOfKW0F3pq8PXr6KuSDeUDHJVcVfpKNxgXM6FgDPpb1V0OMUXLWdEz7xroQK2Xrq7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kcPrKc2y;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02BE606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kcPrKc2y
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+1izkUncMumyUej9MQnzVY6Io8Kc1oNzUryCzKqQJWg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303289; v=1; x=1795908089;
 b=kcPrKc2yaWA+PmvdP2c9E1Dy9Tjx4Iiq1ty3HHc7V5L07ELJzhqJrmtoau2PKjdINfQhg8g1
 NROsykXOa5bVkxqYjitvdXhCjYEbPEwWnXeMzR0S+9uQiBvVypdRccucdP86963jBfcT+1XiLWU
 nRuHKfTSOS+cwgArdy1bNMpo=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b4e59da960c162c4;
	Sat, 21 Nov 2026 23:21:29 +0000
X-Mizu-Trace-ID: b4e59da960c162c4
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH net-next v5 0/4] net: make moving a device to another netns
 cheaper
Date: Sat, 21 Nov 2026 18:21:18 -0500
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4nAmsC/43Py2rDMBAF0F8JWldBL+vRVf6jdCHJY0cQ20Wyh
 UPwv0dRFjXduItZXIY5l3mgBDFAQp+nB4qQQwrTWELzcUL+ascecGhLRowwSQmV2C09HmF+zZj
 wMGXA0S/Y2ViciFtjtJfcNJoTVJCfCF1Ya8EXet+tM/oum2tI8xTvtTnTuv9vSaaYYEEb1SqjZ
 aO7Sz/YcDv7aah0ZnvOHHKscE6CU0oTLwz7y/FfjpJjjhdOEi1c7Xf8cgvjsp5byG9O7DiqDjn
 xepYD9ZZY61W357ZtewK0fm6DwwEAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Ralf Lici <ralf@mandelbit.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Moving a device to another netns waits in rcu_barrier() with RTNL held.
Container and sandbox managers move one end of a veth pair for every
new network namespace, so this barrier limits how fast such namespaces
can be created on the whole system, to about 70 per second with 4
CPUs online however many threads create them.

The barrier was added for NETDEV_UNREGISTER_FINAL, which is long gone,
but it still keeps cached IPv4 routes through the moved device from
being accepted in the old netns, and it lets the RCU callbacks of the
nexthops removed with the device release their IPv6 route exceptions
before the move. Routes through nexthop objects are not fully covered by
it: their cached dst entries are released by an RCU callback queued from
another RCU callback, so a socket in the old netns can still send
through a device that now belongs to another netns whenever the route
generation numbers of the two netns happen to match.

Patches 1 and 2 draw the IPv4 rt_genid and the IPv6 fib6_sernum bumps
from sequences shared by all netns, so a cached route no longer matches
another netns. Patch 3 releases the cached routes of a nexthop when it
is removed from a group, instead of leaving its IPv6 exceptions valid
until it is freed. With these, nothing relies on the barrier, and patch
4 removes it.

Without patch 3, removing the barrier lets a socket keep sending through
a moved device that carries no IPv6 address and is a member of a nexthop
group, until its exceptions are released. Datagrams a socket in netns A
sent through such a device after it moved to netns B, 10 trials,
median and range, with patches 1, 2 and 4 before and 1-4 after:

               before (datagrams)   after (datagrams)   change
  per trial        886 (399-6542)                   0    -100%

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, in a guest
with 4 CPUs online, median of 5 runs:

               before (netns/s)   after (netns/s)   change
  1 thread                   27                31     +15%
  4 threads                  37                48     +30%
  16 threads                 67               103     +54%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V4 -> V5:
- 1/4, 2/4: publish each value drawn from the shared sequence with a
  cmpxchg on the netns counter, drawing again if another bump changed it
  first, instead of storing it with atomic_set(). This keeps the routing
  change ordered before the new value and the value before the nodes
  stamped with it, and keeps a stalled bump from overwriting a newer
  value, so rt_genid and fib6_sernum stay monotonic per netns (Ralf Lici)
- Rebase onto net-next and remeasure

V3 -> V4:
- 2/4: reject the initial fib6_sernum in rt6_is_valid(), which a route
  can record while fib6_add() has published it but not bumped the sernum
  yet (Sashiko review)
- 3/4: release the per-cpu routes and exceptions of the removed IPv6
  nexthop instead of bumping the IPv6 sernum once per group, and flush
  the IPv4 route cache at most once; this also drops the forward
  declaration (Jakub Kicinski, Sashiko review)
- 3/4: with the exceptions released when the nexthop leaves the group,
  4/4 no longer lets nexthop_free_rcu() remove them after the old netns
  freed its rt6_stats (Sashiko review on 4/4)
- Drop the Fixes and Reviewed-by tags (Jakub Kicinski)
- Rebase onto net-next and remeasure in a 32 vCPU guest with 4 CPUs
  online, so the netns creation rates differ from v3

V2 -> V3:
- Add patch 3: flush the cached routes of a group when one of its
  nexthops is removed. Without it, patch 4 lets a socket keep sending
  through a moved device that has no IPv6 address (Sashiko review)
- 1/4, 2/4: say that cached routes carry values drawn from the sequence
  because inserting a route bumps it, not because NETDEV_UP does, and
  that this holds until the sequence wraps (Sashiko review)
- 1/4, 2/4: add Kuniyuki's Reviewed-by, the code changes only in comments
- 4/4: commit message only, keep Eric's and Kuniyuki's Reviewed-by
- Rebase onto net-next and remeasure in another guest, where the barrier
  costs about 4 ms per move instead of about 10 ms, so the gains are
  smaller than in v2
- Send from my linux.dev address

V1 -> V2:
- 2/3: keep the initial fib6_sernum of each netns and never hand it out
  from the shared sequence, instead of drawing a value at netns creation
  (Eric Dumazet); 1/3: do the same for rt_genid
- 2/3: note that fib6_sernum is no longer monotonic per netns (Eric
  Dumazet); 1/3: likewise for rt_genid
- Drop Kuniyuki's Reviewed-by from 1/3 and 2/3, which changed
- Rebase onto net-next and remeasure

v4: https://lore.kernel.org/r/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev
v3: https://lore.kernel.org/r/20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev
v2: https://lore.kernel.org/r/20261019-bug-net-netns-move-rcu-barrier-v2-0-b6eb7780c492@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com

---
Qiliang Yuan (4):
      ipv4: draw rt_genid from a sequence shared by all netns
      ipv6: take fib6_sernum from a sequence shared by all netns
      nexthop: release cached routes when a nexthop leaves a group
      net: remove rcu_barrier() from __dev_change_net_namespace()

 include/net/net_namespace.h |  5 +----
 net/core/dev.c              |  1 -
 net/ipv4/nexthop.c          | 15 +++++++++++++++
 net/ipv4/route.c            | 36 ++++++++++++++++++++++++++++++++++++
 net/ipv6/ip6_fib.c          | 28 +++++++++++++++++++++++++++-
 net/ipv6/route.c            |  6 +++++-
 6 files changed, 84 insertions(+), 7 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261016-bug-net-netns-move-rcu-barrier-d998c6395830

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

