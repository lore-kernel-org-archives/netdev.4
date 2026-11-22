Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386443;
	b=Q5DbybhRUhMSCvN2s8QQGZsMWkrRdiH4ysMBJZGfKaF9kqYoQIeyhA7jJtv/A+9tD4E5
	 JNUPjA4hL2tlM9q2PMfa3APo3Ro8oENF+eRGkxgdLHwNQ+uUjPwkeTgy6XyU1q+tR2X6z
	 09QfAWGdkDI2bWZQNWxSeqIUI/f8ts69oc3CO+CIah9uj9/Le/Jh0LsgwlCJpfWUv4ndf
	 ze/6RLthjAWHmZL5w62euDxqrPLcNVTuQ7FvoiiJSOVWneSaQnToRXAhddcMXPRFSgDJh
	 WU4d/FF29G64dXV6fSM+4TcmcBGS4po2REbVlclKNCrXnUekYGCii7N1j7PVhyFVkMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386443;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qbRXlVCB7D5FhRXLboUHrGkLQd1PO+KQDpMzjFFF044=;
	b=NXE9OVAC30bEFPbPCsMMz03Vw2FwyAaMZbIDTcO0ut7YLcCEomIgPDy5XXzb+HrwKwtr
	 P8lYfpDOvfoD/rQpAwT/15CZ2Umfg3KIfNrfr0E3RM4gfjIDnTKMicsIUiQSFgIUax0fY
	 icZ0kfDcNgR96jZ3HB0/FV2Wm+z75TDcPgOM/ubnLTzZAr4tq74rWcSP+G6twCJvVmOhc
	 djhZqo3/qZOhZoKsW7S6nLDe8NdOdGupbisEjmlRSkFNlsjUJpBE7nuSnQJzT+QLjtzgP
	 3QVhhFMph63+dKtNzjKMfAd7tXoNpuFwQf/Q3DSlt0Fg9PP51dhThLjkxx39cSqqG/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqiYGH3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F1606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqiYGH3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6003B1F000C0;
	Sun, 22 Nov 2026 22:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386442;
	bh=qbRXlVCB7D5FhRXLboUHrGkLQd1PO+KQDpMzjFFF044=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iqiYGH3RVB7PaeSCwaWvKP8XkNhX9KJXRAooY1n6rRLLLshdosbgfZcP4E9GmW5Mm
	 R40y3MmScXTHT7Y0K1tULvpRPACmfLl3E1g5pwE1qS74NIQWh5Wipj7ZB63zNWpP7S
	 27Y+ThrCNNxi96U+B76G1Aym2qM1AIEijBJBPPEu+EzQeF9annpfJmRSDZxbm03VPo
	 fOeOo7pjtapy+EWXCQQEUOba2IE2/wEUzAZ4BtY21CVCPDyppG0jziIB7C8tAyAzzH
	 5s7wlxTNhTQD4iGe3pWGc1av7iJJgzr6B8y4k7zTjvjhHHqVoLMG4au7k3/gGeVnA1
	 cbtohM0ouHgUQ==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [RFC net-next 0/6] ipv6: validate dsts against the netns route generation
Date: Sun, 22 Nov 2026 15:26:58 -0700
Message-ID: <20261122222717.126333-2-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122222717.126333-1-dsahern@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org>
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

An IPv6 dst has never carried the fib6 serial number it was created
under. rt6_get_cookie() reads fn->fn_sernum through rt->from when a
socket, dst_cache or xfrm bundle stores its cookie, so a FIB change
that lands between the route lookup and the cookie capture is folded
into the cookie and a stale dst looks valid. The only dsts stamped at
creation are pcpu dsts of nexthop-object routes, which store the netns
genid in rt->sernum.

Looking at this I found that rt_genid_ipv6() and the fib6 serial
number are already the same counter: net->ipv6.fib6_sernum, which
fib6_new_sernum() advances on every FIB change. fn_sernum is a per-node
copy of it. So this series moves dst validation onto that counter, the
way IPv4 uses rt_genid, instead of adding another one:

 1. Stamp every dst with the counter in ip6_dst_alloc() and validate by
    comparison in ip6_dst_check(). Long-lived dsts (pcpu dsts of routes
    with an embedded fib6_nh, and exception dsts) are re-stamped when a
    lookup finds them again, otherwise they would stay invalid.

 2. ip6_link_failure() forced a new lookup by writing -1 to fn_sernum.
    That no longer invalidates anything, so clear the failing dst's
    sernum instead.

 3-4. Nexthop objects: factor out nh_has_f6i(), then bump the counter
    when a nexthop used through a group is replaced, and when a member
    is removed from a group.

 5. A new PMTU or redirect exception used to bump the counter, which
    with (1) would invalidate every dst in the namespace. Do what IPv4
    does in update_or_create_fnhe() and invalidate only the pcpu dsts
    of the affected fib6_nh. Route dumps still need to see that an
    exception was added to the root node, so add a per-table sequence
    for that rather than inventing fn_sernum values the counter could
    later issue again.

 6. Since nothing validates against fn_sernum any more,
    rt_genid_bump_ipv6() no longer needs to walk every node of every
    table. Make it an atomic increment like rt_genid_bump_ipv4(), and
    drop the __fib6_flush_trees pointer. fn_sernum remains only for
    route dump consistency, so nexthop, address and rule changes no
    longer restart in-progress dumps.

David Ahern (6):
  ipv6: validate dsts against the netns route generation
  ipv6: invalidate the failing dst in ip6_link_failure()
  nexthop: factor out nh_has_f6i()
  nexthop: bump the IPv6 route generation on group changes
  ipv6: scope exception invalidation to the affected nexthop
  ipv6: make rt_genid_bump_ipv6() a plain counter increment

 include/net/ip6_fib.h       |  45 +++-------------
 include/net/net_namespace.h |  26 ++++++---
 net/ipv4/nexthop.c          |  42 ++++++++++++---
 net/ipv6/addrconf_core.c    |   7 ---
 net/ipv6/ip6_fib.c          |  76 +++++++++++---------------
 net/ipv6/route.c            | 104 ++++++++++++++++++++++++------------
 6 files changed, 162 insertions(+), 138 deletions(-)

-- 
2.43.0

