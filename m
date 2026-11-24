Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537655;
	b=RzKopj4ESzHzRFaN9ce7DigW4nwthApJxmFvhyqVGQZsWT0lOSoXY9uUHRuqIk1qhl65
	 U+JsbeWR0lksu3sWxZmD/iFIXtxbYhiEGN7y6PSrCJtSKwqyN6mDSqNtlPeSG5JNO8Q7V
	 lCHTU/TPVafA/SlpR19QhedXpVlx6QtrEO0ax72qicFU9lu/DqprvP+JgIky+Tba3MrOR
	 SLSOGN9Xdsl99eWqspxRUm6qxppJcgf+5c+bGQjtCTiJF7mu4Gq/lHjr20eLom1vJqacX
	 pjA4ta0JFZBTSN30h6eMqwk3udFdWt47728+3UFEjpS/mBwUmPAnyTNkncATBXieosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537655;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=RRPKSlH/AFlBoyx42n74fxoqo2DHk47ScSbq0Z4ucHU=;
	b=vBx9D+0hjhKVnG5jzd2TuRf4YubpwXDq1RcMOV4HiCJqPK+anhgeCqV9CBK0+Km3fCVR
	 5D6JQEwAn3kcoK0NNKumU2sgIY6DktPmaYhaGBz9D/6zc7W9J7Df9f7/UQQ8Uqj4gWujh
	 zVHgd6rCgH+nGFSPDq5LiHqnpdeLnyEmOpxrswXnNhjtegy6pmTpWJGetuxviaH3THZMk
	 vbcrVu2TWofIHFxrD7QhY3fglCY7rvk/zZCl0GC/zhLQFaz4Z3zwFWrWZkHxArfhXJPQ2
	 Q5gmXrQ9BsoKNoHQ4uCnkZ0fdS/75nABZXgRHR6lpRRd98zv39JozF8DDnjMabaUTSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=N3VlWcNJ;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345A606A330;
	Tue, 24 Nov 2026 16:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B345A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=N3VlWcNJ
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jYpB51ShWzNmF9;
	Tue, 24 Nov 2026 17:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795537645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RRPKSlH/AFlBoyx42n74fxoqo2DHk47ScSbq0Z4ucHU=;
	b=N3VlWcNJ0CwZjW8aK7GT1lYwYzNvntuV9a9kmzG/p9FCnlC3bpWDkZ1Ww6L4ZI2/Jyf8FZ
	RantTnEQittgImGiK8vaoMFecLyAwgTmMtOXq2JHAy1mEkYdKgLnf8R0PnaPGUG38eIcQh
	7o25cjA2sceKzLWg7b4Gn63gBMk9hs/2mVTzqlBvY1PGLksZZJkyvrMHL39LaesNPnxRQw
	sH5J+n3VbFOC54+MtUWWv3sm1mmTb52Kkpyr8PMfx1k1sySMwmuq8ZgGsIrEO7kadNJDWb
	jGh3ah3rU1LHldhhGBNUpn/h9C7a8EsFWAn35AXBj4xF/bLjpGK3OaCdrOq+XA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 0/4] ipv6: tie dst validation to the lookup that returned the dst
Date: Tue, 24 Nov 2026 17:27:06 +0100
Message-ID: <cover.1795537128.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 4jYpB51ShWzNmF9

Hi,

This series fixes the late cookie sampling race described in [1]: a dst
can be stored together with a cookie read after a FIB change that its
lookup did not see, and then passes dst_check until the next change.
With xfrm, a socket whose lookup ran just before a policy insertion
keeps its plain dst and leaks plaintext although the policy matches,
and a more specific blackhole route can be bypassed in the same way.

v4 returned the cookie from the lookup and converted selected cache
users to it. Following David's objection to growing the API and his RFC
[2], which moves validity into the dst, this revision keeps validity in
the dst but stamps it with the fn_sernum of the route's node, sampled
during the lookup, instead of the netns generation:

- Every holder is covered without being converted, including dst_cache
  users and the route and path dsts of xfrm bundles.
- Invalidation keeps its per-node scope, rather than every FIB change
  invalidating every cached IPv6 dst in the netns.
- Shared pcpu dsts are never re-stamped: a lookup only reuses one that
  carries its own stamp, and replaces it otherwise.

Patches 1 and 2 are writer-side fixes from v4: a fresh serial on default
router failure, and fib6_ifup and fib6_ifdown advancing the serial
after the ECMP rebalance. Patch 3 samples the stamp during the lookup
and patch 4 validates dsts against it.

I tested it in a VM with lockdep, PROVE_RCU and DEBUG_ATOMIC_SLEEP,
using reproducers for the races above, which I can share.

Not addressed here, and noted in the patches where relevant:

- PMTU and redirect exceptions keep being validated against the
  holder's cookie, so they keep the late sampling. Refreshing them
  needs PMTU updates serialized with the replacement, a follow-up.
- The stamp covers the lookup in one table: a fib rule inserted while
  the rules are evaluated can leave a lookup on the previous table.
- Deleting one route of an ECMP group rebalances the others without a
  new serial, changing the forwarding sysctl changes how gateways are
  scored without one, and deleting a nexthop-object route does not
  advance the generation. These predate this series.
- A replaced pcpu dst is released with dst_dev_put, so a holder that
  sends through it without validating it again, such as a corked UDP
  socket, loses those packets. This already happens when the route is
  removed, and now also when a FIB change in the route's subtree
  replaces the pcpu dst.
- xfrm_policy_insert advances the generation before unlinking the
  policy it replaces. I will send the fix separately to the ipsec tree.
- pcpu dsts dropped when their route is removed, in
  __fib6_drop_pcpu_from, still release the slot's reference without
  waiting for a grace period, as before.

[1] https://lore.kernel.org/netdev/20260901122501.482920-1-ralf@mandelbit.com/
[2] https://lore.kernel.org/netdev/20261123212623.106153-1-dsahern@kernel.org/

Thanks,

Ralf Lici
Mandelbit Srl

---
Changes since v4 https://lore.kernel.org/netdev/cover.1795166508.git.ralf@mandelbit.com/
- Keep validity in the dst instead of returning a cookie from the
  lookup, with a stamp sampled during the lookup (patches 3 and 4).
  Drop ip6_dst_lookup_flow_cookie, ip6_dst_store_cookie and the
  conversion of socket cache users, which are no longer needed, and the
  ip6_dst_check change for nexthop-object dsts, superseded by patch 4.
  (David)
- Mention the tunnel transmit error paths in patch 1. (Sashiko)
- The xfrm bundle cookies and the UDP rx dst cookie pairing reported on
  v4 no longer matter, since dsts are validated against their own
  stamp. (Sashiko)
- The xfrm_policy_insert ordering reported on v4 will be fixed
  separately in the ipsec tree. (Sashiko)
- Reword the fib6_ifup and fib6_ifdown patch to refer to the lookup
  stamps.

Changes since v3 https://lore.kernel.org/netdev/cover.1794906743.git.ralf@mandelbit.com/
- Rebase onto current net-next.
- Split v3 2/3 into the writer ordering (2/5), the ip6_dst_check change
  (3/5) and the new API (4/5), each with its own explanation. (David)
- Reword the kdoc of ip6_dst_lookup_flow_cookie to say that it performs
  the xfrm policy lookup (David) and narrow it to changes that advance
  the IPv6 generation. (Sashiko)
- Document the ordering of fib6_new_sernum that the helper relies on and
  name it in the barrier comments. (Xia)
- Note the per-call generation advance in 1/5 and widen the
  rt6_exception_net comment. (Sashiko)
- Drop the Fixes tag from the conversion patch. (Sashiko)
- List the known limitations and pre-existing issues above.

Changes since v2 https://lore.kernel.org/all/cover.1794384146.git.ralf@mandelbit.com/
- Rebase onto current net-next, preserving the connected-only cache
  lookup introduced by f778e80b3daf ("ipv6: fix cached route reuse for
  control messages"). (Jakub)
- Move the serial update after rt6_multipath_rebalance in fib6_ifup and
  fib6_ifdown. (Sashiko)
- Add Fixes tags and improve wording. (Sashiko)
- Clarify that this is the groundwork for fixing the race and a partial
  conversion to the new API: other users will be covered in a follow-up
  series.

Changes since v1 https://lore.kernel.org/netdev/cover.1793806941.git.ralf@mandelbit.com/
- Fix kdoc return statements in patch 2/3. (NIPA)

Ralf Lici (4):
  ipv6: stamp the default route node with a fresh serial on link failure
  ipv6: advance the serial after rebalancing in fib6_ifup and
    fib6_ifdown
  ipv6: sample the route's serial during the lookup
  ipv6: validate dsts against the state their lookup found

 include/net/ip6_fib.h |  10 +++
 net/ipv6/ip6_fib.c    |   4 ++
 net/ipv6/route.c      | 151 +++++++++++++++++++++++++++++++++++-------
 3 files changed, 140 insertions(+), 25 deletions(-)


base-commit: c2621b518b38ed38e280e008aa33e6c2d302f8cc
-- 
2.56.0

