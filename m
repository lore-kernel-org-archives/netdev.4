Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656826;
	b=bXwgUMLdYenTSb6iK44JrTSVGZmyXzV8sa5Vanrsq1isUzZh8xpwdtfgVKyzHBrMpYou
	 iVikfTJH9TOqgVGypbUcHVBx0hM1GpoKaah7wUgK5z5B54YxOV48It7y88iXwCxZAG+oy
	 vnh23NC2uLIORNJbOZGbIZN2LxpssK2Hdr1cgioV6a5voElW562tznAp6v5pItau89qXT
	 XjfwuTJRDPvMtnupqIGD+AYfcmUvAUTvv9VtjzN+EjVR/8xJ5dAnLNy/lvJ2yYsjni/Dd
	 HGbPGA/9xlD4BEp5+WVohdNqoxehP0yZVQzIdygRoIDTH9a33ZMhbNEfAgUnAiZDKVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656826;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VRmkJt2mYMXfobOrERfxYtXmdhLSlFiM/a+GhwFqJSY=;
	b=xogoLxm8Bh0CloBMV8eQFI/GgcJDah+qWTxt6iy1XlqZB7WbVzip+JO2cksfKOeTBafG
	 wI27PrLmJclcY5RfadnweTLphlRLZVywC4d59IpFIcvr8jP08EQ+NFhIJvF6fuLGvRDaq
	 8taS6IXUPVXU55M8/hnBOB0Taw1epORQKSl75KsBBDsRVKmWjlO65uVYAr4+fOIFZLNvk
	 o1dy3cEp8XKV5NbFDmL5fG7SN2O7BJKyfJtzPX/zxjm99es7OjBS3nFYH6N8XHjewcVuh
	 FCSkHumlf4zqQ1w4nb7pw39d5cJJi9XkIYbxboNvdWyMCwWrbLiAnQTU8Lg/tt7TOKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bont+xHB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FD606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bont+xHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B7E1F000C4;
	Thu, 26 Nov 2026 01:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656826;
	bh=VRmkJt2mYMXfobOrERfxYtXmdhLSlFiM/a+GhwFqJSY=;
	h=From:To:Cc:Subject:Date;
	b=bont+xHBAKEtHuIDbWBjEVpJBiOUla491DXTHBdX0+Gy8zRztn7W9rblVw/xAxvAK
	 +7s91BHhN3Risvbudqfu/53fyeWVHgUuaa1QfKc8iHI/c3aI5xYEq+b6sZaSDXPjY5
	 0vQ2fauNOJmyEKI7ieKihT50u4RHYgvcMPU1YFZ76jpaZkp/Z6ykuWTPM4DxW6vCPS
	 X/eGsaHog/FCY3GpHWtGyrFAa378tOxnULmm/lsJF7IW4uxoIpjXdjchni5kyFgaVc
	 fpVPF1iLMYOAe8LMqbH06sq3rLFJ2YZamwsrEmu3xeMZMKXQVdz3gp3Glw4+qU69ki
	 3xk9ntECjz5ag==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@mandelbit.com,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: [PATCH net-next v2 00/13] ipv6: validate cached dsts against the netns route generation
Date: Wed, 25 Nov 2026 18:33:26 -0700
Message-ID: <cover.1795642432.git.dahern@nvidia.com>
X-Mailer: git-send-email 2.54.0
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

From: David Ahern <dahern@nvidia.com>

IPv6 dsts are validated through a cookie that a holder (socket, dst_cache,
xfrm bundle, IPVS, ...) captures from the fn_sernum of the route's node at
the time it stores the dst. A route change that lands between the route
lookup and that capture is folded into the cookie, and the stale dst then
looks valid. Only nexthop object pcpu routes carried a generation of
their own, and a pcpu dst that failed its check could be re-stamped and
made valid again for every holder (Fixes: 8f34e53b60b3). The reported
result is a dst that keeps bypassing a route change, or a learned PMTU,
for as long as it is held.

This series stamps every dst with the netns route generation when it is
built and validates it with a plain comparison in ip6_dst_check(), the way
IPv4 does with rt_genid. A dst is never re-stamped: holders keep seeing a
stale dst as stale, and a new one is built for the next lookup. Learned
PMTUs and redirects survive a generation change, because a stale exception
is replaced by a current copy, not dropped.

 1-3: exception insert fixes needed before the exception table is
      touched more often: allocate the new entry before the old one is
      removed, keep a superseded pcpu dst working until its holders
      notice it is stale (it is put on the uncached list, so device
      unregister still detaches it), and do not insert an exception
      whose MTU could not be stored.
 4:   ip6_link_failure() invalidates the failing dst only, with a stale
      mark in its sernum, instead of the whole node.
 5:   route dumps notice exception inserts on the root through a table
      sequence, tb6_excp_seq, rather than through fn_sernum.
 6:   the core change: stamp and validate dsts against the netns
      generation, and refresh stale exceptions. An exception insert
      invalidates only the pcpu dsts of its own nexthop, tracked with a
      per-nexthop cpumask, and ip6_dst_check() also fails an uncached
      RTF_CACHE dst (the FLOWI_FLAG_KNOWN_NH clone, which IPVS keeps in
      dest->dst_cache) once an exception exists for its destination on
      any nexthop group member it can have come from.
 7:   rt_genid_bump_ipv6() becomes a plain counter increment instead of
      a walk over every node of every table.
 8-9: nexthop object changes that did not bump the generation now do.
 10:  stamp a dst with the generation sampled before the FIB lookup, not
      the one current when it is allocated, so a change that lands
      during the lookup cannot be folded in.
 11-13: selftests: a deleted exception stays deleted after a FIB
      change (pmtu.sh), a stale pcpu dst after a nexthop change
      (fib_tests.sh), and a PMTU learned after IPVS cached its DR route
      (ipvs.sh).

Known costs and limits:
 - Every FIB change bumps the generation of the netns, so every exception
   becomes stale and is replaced by a copy the next time traffic uses it.
   That is an allocation per exception revisited, and the replacement takes
   rt6_exception_lock, which is global. The entry and the writable
   metrics are allocated before taking it.

 - An exception insert still scans the nexthop's whole dirty cpumask,
   nr_cpu_ids bits, though it only touches the dsts of CPUs that built one.

Changes since non RFC v1
 - rebased to top of tree
 - added Ralf's reported-by to a few patches
 - Patch 6: the stale-clone check for uncached RTF_CACHE dsts, the
   allocations done before taking rt6_exception_lock, and corrected wording
   about the cpumask scan.
 - New selftest for IPVS DR mode.

David Ahern (13):
  ipv6: allocate the exception entry before removing the one it replaces
  ipv6: keep a superseded pcpu dst working until its holders notice
  ipv6: don't insert a PMTU exception whose MTU could not be stored
  ipv6: invalidate the failing dst in ip6_link_failure()
  ipv6: tell route dumps about exception inserts with a table sequence
  ipv6: validate dsts against the netns route generation
  ipv6: make rt_genid_bump_ipv6() a plain counter increment
  nexthop: factor out nh_has_f6i()
  nexthop: bump the IPv6 route generation on group changes
  ipv6: stamp dsts with the generation sampled before the FIB lookup
  selftests: net: pmtu: check that a deleted cached exception stays
    deleted
  selftests: net: fib_tests: Add stale pcpu test
  selftests: net: ipvs: check a PMTU learned after the DR route was
    cached

 include/net/ip6_fib.h                         |  70 +-
 include/net/net_namespace.h                   |  36 +-
 net/ipv4/nexthop.c                            |  42 +-
 net/ipv6/addrconf_core.c                      |   7 -
 net/ipv6/fib6_rules.c                         |  33 +-
 net/ipv6/ip6_fib.c                            |  76 +-
 net/ipv6/route.c                              | 720 ++++++++++++++++--
 tools/testing/selftests/net/fib_tests.sh      |  53 +-
 tools/testing/selftests/net/netfilter/config  |   2 +
 tools/testing/selftests/net/netfilter/ipvs.sh |  81 ++
 tools/testing/selftests/net/pmtu.sh           |  90 +++
 11 files changed, 1035 insertions(+), 175 deletions(-)

-- 
2.54.0 (Apple Git-157)

