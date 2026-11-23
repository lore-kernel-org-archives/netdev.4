Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469189;
	b=G7uo+RFNWNtOal3W9ZUymTtb9srqFGVAnZ0+qKb0M69ipBm9tA/wAxAdj7fV0xOv5/p8
	 fVXu3Fz9x990y6H2utB6KitzPbFVhVovAPISH+fu1eaN3zZh5BjyrVQt9FojoXUy6IOTM
	 sZUv3JY8v5XJRH78CjhKEpp5cUk7Kh29oXrdvcVKF/QJZzanmJ5/hrrS89ZyvekFZ+HqQ
	 mFeTKWHyGeyTFbXpgmUmsWZzHK/iLArcly4mlvgXzFMDI7JOw69+jbYxMJ7aI/L59j9r6
	 eHB6bDttu+K7njM8lYGEZNcAb6krL5PTTC1pSZxIGxhIwmAJLtyAumVGanC4LCf3z8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469189;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QZuyscIJTtdqnDMZMnvVqc44iOBtq5csY34+KaIhoYQ=;
	b=NUFI9F9U89WPsrj7UeBzYvpaQfgle4X68dw/bughAf2XnWwe/qqcOLd404CbmAqov53a
	 LRdGgRzCVWYdxj8YbAtmmGlLh+Y0k3qrUyTpzasePNL4hXsNT+yuCvMLK//K5WQ5VUM8y
	 xZIUB6+Jwq8AMT0G9vaKVedY3Nd9ukQJo/aDOcrXiPHN+A/iE3HrqF2ZckoUdpoTFmzrT
	 tkkQhiyseAq2WhoQmK+L9NX6VnGKjl0lu4X/G6P1Dscxy6XjkAyfGvn31BUEihP16u7IC
	 PBC6INqA+UQhkpd8aXUW3E7AUNXO5H6rBDXdNAnaIebp5NRPWrbPnVOjeC9VWBbaQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mo5cDU/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A35606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo5cDU/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05501F000D1;
	Mon, 23 Nov 2026 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469188;
	bh=QZuyscIJTtdqnDMZMnvVqc44iOBtq5csY34+KaIhoYQ=;
	h=From:To:Cc:Subject:Date;
	b=Mo5cDU/T80Z2rbSHKqsoNs/Kn1Hjw2PtF4mCzBoNsgxWBXNfAA04qvEwhRXgbVet1
	 X9EeYX8CFpOLhbV8QkwnmTs0xzjgOtDdtxNzFj/u7bICL3RH6i0n1rqY0OTJ949zyV
	 KJYd+qrMzRCszQpfn/NUUs+p8a4D5t2tbcxiHDsDmZ0I0GN1ovn0c36FzfFHeeqeQ3
	 RGEtx0jUo44el3sQsjv5ZNPLXqDLFcq91C9uBdbxJS7KLOEGjjuDnsKmDNqJ7anQ1t
	 h9eAYxrdmWQtkNiaePUv7FRxIPP0ewinWqqPMsY3WkM2vjUPtWJC/GUv2hmzrPKRuV
	 Sk9Tvdv8b6n7g==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 0/7] ipv6: validate dsts against the netns route generation at lookup
Date: Mon, 23 Nov 2026 14:26:02 -0700
Message-ID: <20261123212623.106153-1-dsahern@kernel.org>
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

From: David Ahern <dahern@nvidia.com>

IPv6 dsts are validated in ip6_dst_check() against a cookie that the holder
(socket, dst_cache, xfrm bundle, ...) samples from rt->from's fib6_node
(fn_sernum) when it stores the dst. That is later than the lookup that
produced the dst, which allows this sequence:

  CPU0                                  CPU1
  ----                                  ----
  lookup returns Dold
                                        add a more-specific route (e.g. a
                                        blackhole /128), bump fn_sernum
  rt6_get_cookie(Dold) reads the new
  fn_sernum
  publish (Dold, new cookie)

The next dst_check() compares the cookie with the same node's current
fn_sernum and accepts Dold, which keeps bypassing the more-specific route
indefinitely. The same late sampling exists in every persistent cache
(socket TX/RX, xfrm, dst_cache users, SCTP, flowtable, IPVS, RXE), so
fixing each user would leave future users exposed. This is the problem
described in the thread where ovpn hit it.

This series moves the validity into the dst, as IPv4 does with rt_genid:

 1. every dst carries the netns route generation it was built under and
    ip6_dst_check() compares it with the current one; holders no longer
    contribute a token.
 2-5. keep invalidation targeted where it was before: ip6_link_failure()
    clears the failing dst's sernum, nexthop group changes bump the
    generation, and PMTU/redirect exceptions invalidate only the pcpu
    dsts of the affected nexthop, as IPv4 does for fnhe.
 6. rt_genid_bump_ipv6() becomes a counter increment like its IPv4
    counterpart instead of walking every tree to rewrite fn_sernum.
 7. the generation is sampled before the FIB is read and carried in
    struct fib6_result, so a dst and the FIB lookup that produced it
    refer to the same point in time. Without this a change landing between
    the lookup and the allocation is folded into the stamp.

Long-lived dsts are never re-stamped: pcpu and exception dsts are shared
by all holders, so re-stamping one would make it valid again for every
socket and dst_cache that already saw it as stale. A stale pcpu dst is
dropped and rebuilt; a stale exception is treated as a miss. This is the
same behaviour as IPv4, where a stale cached route fails rt_cache_valid()
and a new one is allocated.

Known trade-off: any FIB change in a netns now invalidates every cached
IPv6 dst in it, not just those under the affected node; stale dsts are
rebuilt lazily on their next use.

Changes since v1:
 - Do not re-stamp pcpu and exception dsts when a lookup finds them again
   (patch 1); that made stale dsts valid again for other holders.
 - New patch 7: sample the generation before the FIB lookup.
 - Updated the patch 1 commit message to match.

AI assistance: Claude (Sonnet 5.5) helped develop these patches. I have
reviewed them and take responsibility for them.

Ralf: Patch 7 is alternative to your patch that adds the cookie to the
APIs. Instead the result struct contains the genid before the lookup is
done. Adding it to the fib6_result seems simpler and accomplishes the
end goal everywhere.

David Ahern (7):
  ipv6: validate dsts against the netns route generation
  ipv6: invalidate the failing dst in ip6_link_failure()
  nexthop: factor out nh_has_f6i()
  nexthop: bump the IPv6 route generation on group changes
  ipv6: scope exception invalidation to the affected nexthop
  ipv6: make rt_genid_bump_ipv6() a plain counter increment
  ipv6: stamp dsts with the generation sampled before the FIB lookup

 include/net/ip6_fib.h       |  50 +++++------------
 include/net/net_namespace.h |  36 ++++++++++---
 net/ipv4/nexthop.c          |  42 ++++++++++++---
 net/ipv6/addrconf_core.c    |   7 ---
 net/ipv6/ip6_fib.c          |  76 +++++++++++---------------
 net/ipv6/route.c            | 105 ++++++++++++++++++++++++------------
 6 files changed, 178 insertions(+), 138 deletions(-)

-- 
2.43.0
