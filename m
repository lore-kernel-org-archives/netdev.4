Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437293;
	b=wMVgWxOC9bVOTb6PunCnzTTtSPiPZOaMW0rpxRN9UFEkcvFenhRImEmxkxMixF7jxg3i
	 PSWoe3wt5swiR39YwtXrbe7pXwseFxyKtoLOV25ZfO3kqYmsZxO5fVveT9Fu1j20kK7qD
	 CeqqyP/XHq/RwocXXQWAnzU2W4Xk1PWyc3tqkuAAPyiT5c5sUtytRSpzPgwVqGlSgCoMJ
	 lFQTs4YjOAFexLs6tz8ETgAS5DXvEsidSrYacpti5sb3NBmBAHNh20Ej5TqJHsiBo0JDv
	 NJmIJKzdETCP8jNFlBSViSD9gEuEYWp+0bJ8Yjn3lwtJq0hAZx1WmvX/CrPeLuqWn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437293;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=3IJwMBwW8JkW2wptK+zgfPvwr+IFceyZHyiWMzHt3Lk=;
	b=ANlzll2GCe6UIT5KhmW3PkePBVu5QPNJmoeW4Ii+mhZaZ974j3uAwxu4ZPuSiKOhGqb9
	 NgtUo4TIBe9lDntV6ZZj6Jkpm/5w7sjnc/2iBretYBAGR+ANHBuAU+ahDTGD4Q//SkX9K
	 WYrM7uKIWDKkgV8fORa1YBQ9omXsU/VlT+Lb6xKtR/0NEQL8XsB0N23+gOl6zpHryl6mX
	 FVJFRWi/Gmkj0ws4v7sJpxctdAvPCOfn9yPKepqfmL5+dJvlF1LuxWSZCa7IQOuwHcqCA
	 iWqmEGyCaL3VHlRjKTO0EdD3rrqQt/8U2QXz35VL1IO6y7jLgNsJHMIniYLcFoX9xzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=V9PRYonZ;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC2606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FC2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=V9PRYonZ
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jY5422ywSz3wgl;
	Mon, 23 Nov 2026 13:34:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795437282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IJwMBwW8JkW2wptK+zgfPvwr+IFceyZHyiWMzHt3Lk=;
	b=V9PRYonZekA2+PUXBjx/quDh4m8B8rBdUaQDMnvYAAGtlpqvrpaSTHm+NW+vU/LETjBV2F
	l7a9boELYKna7KO7sg8Kd1QVZRJCy/2TjxF+JdyIiskv/VJpfGmoHVbotwabPotag/JDzn
	Ob5bXags9DofB8pe7VJQxJ+jxtJvMJ9Esv8Q09cHunnyorCIhImOD56JMOQJVyX5HjDJNN
	fzbNf6VhMWMH+/JtdCjJmLOaWA1/OkVm8FIzcpfOI552+qCez5fFsOeOv9hufORHw203Fs
	wBW6MSroWlHtXQm9gg6GxOLPIVq5QRY+eUhMD0R/WWWiNyIdFjbraYVwhiN9dw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	David Ahern <dahern@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [RFC net-next 0/6] ipv6: validate dsts against the netns route generation
Date: Mon, 23 Nov 2026 13:34:34 +0100
Message-ID: <20261123123435.402751-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261122222717.126333-2-dsahern@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org> <20261122222717.126333-2-dsahern@kernel.org>
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
X-Rspamd-Queue-Id: 4jY5422ywSz3wgl

Hi David,

I had a look at the series and tested it. I see two problems with the
approach.

On Sun, 22 Nov 2026 15:26:58 -0700, David Ahern <dsahern@kernel.org> wrote:
> copy of it. So this series moves dst validation onto that counter, the
> way IPv4 uses rt_genid, instead of adding another one:
>
>  1. Stamp every dst with the counter in ip6_dst_alloc() and validate by
>     comparison in ip6_dst_check(). Long-lived dsts (pcpu dsts of routes
>     with an embedded fib6_nh, and exception dsts) are re-stamped when a
>     lookup finds them again, otherwise they would stay invalid.
>

pcpu and exception dsts are shared by every socket and dst_cache that
holds them, and with this series validity lives in the shared dst
instead of in each holder's cookie. When one lookup re-stamps the dst,
the stale dst becomes valid again for every holder. IPv4 does not
re-stamp: a stale cached route fails rt_cache_valid and __mkroute_output
allocates a new one, so routes already held by sockets keep their old
genid.

The script below shows this. A connected UDP socket on CPU0 caches its
route to fd01::2 through fd01::/64, then a blackhole for fd01::2/128 is
added. If an unrelated socket on CPU0 then connects to fd01::3 through
the same /64, the first socket keeps using the old route: all 10
datagrams it sends after the blackhole reach the wire, in 3 out of 3
runs. Without the unrelated socket they are dropped, and current
net-next and my series [1] drop them in both cases. With an xfrm policy
for the socket's port instead of the blackhole, the same sequence makes
the socket keep sending its 10 datagrams in plaintext, where net-next
and [1] encrypt them. This is not a narrow race but the deterministic
outcome with this series.

The stamp is also read after route selection, in ip6_dst_alloc and in
rt6_refresh_sernum. A FIB change that lands in between, e.g. the same
blackhole added while a lookup for fd01::2 has already selected the /64,
yields a dst selected from the old state that carries the new
generation. That is the window ip6_dst_lookup_flow_cookie in [1] closes
by reading the generation before the lookup.

For generation-based validation to hold, the value has to live with the
holder rather than in the shared dst, and it has to be read before route
selection. dst_check already takes a per-holder cookie for this: with
the generation read before the lookup as the cookie, compared with the
current one, dsts need no stamp or re-stamping and pcpu dsts stay
reusable across changes. That is what ip6_dst_lookup_flow_cookie
returns, with fn_sernum in place of the netns generation, so the two
approaches differ in invalidation granularity (per node vs netns-wide)
rather than in where the snapshot lives. I'd rather keep the per-node
granularity, but either one needs the holders converted to a cookie read
before the lookup.

[1] https://lore.kernel.org/netdev/cover.1795166508.git.ralf@mandelbit.com/

Reproducer, run as root in a VM, "restamp.sh route|xfrm ctrl|other":

#!/bin/bash
# usage: restamp.sh route|xfrm ctrl|other
#
# A connected UDP socket on CPU0 caches its route to fd01::2, then that
# destination gets a blackhole (route) or an xfrm policy (xfrm). With
# "other", an unrelated socket on CPU0 then connects through the same /64.
# Counts what the first socket sends to fd01::2 after the change.
case=$1 mode=$2
log=/tmp/restamp-$case-$mode.txt
on_cpu0() { taskset -c 0 ip netns exec cl "$@"; }

ip netns del cl 2>/dev/null
ip netns add cl
ip -n cl link add c0 type veth peer name p0
for dev in c0 p0; do
	# no link-local address: its DAD would add a route and bump the generation
	ip -n cl link set $dev addrgenmode none
	ip -n cl link set $dev up
done
ip -n cl addr add fd00::1/64 dev c0 nodad
ip -n cl neigh add fd00::2 lladdr 02:00:00:00:00:02 dev c0 nud permanent
ip -n cl route add fd01::/64 via fd00::2 dev c0
ip -n cl xfrm state add src fd00::1 dst fd01::2 proto esp spi 0x1001 reqid 1 \
	mode transport aead 'rfc4106(gcm(aes))' \
	0x0102030405060708090a0b0c0d0e0f1011121314 128

on_cpu0 bash -c 'exec 3>/dev/udp/fd01::2/5002; echo before >&3; sleep 3
	for i in {1..10}; do echo after >&3; sleep 0.1; done' 2>/dev/null &
sock=$!
sleep 0.5

if [ $case = route ]; then
	ip -n cl route add blackhole fd01::2/128
else
	ip -n cl xfrm policy add src fd00::1 dst fd01::2 proto udp dport 5002 \
		dir out tmpl src fd00::1 dst fd01::2 proto esp reqid 1 mode transport
fi
ip netns exec cl tcpdump -nn -l -i c0 dst fd01::2 >$log 2>/dev/null &
cap=$!
if [ $mode = other ]; then
	sleep 0.2
	on_cpu0 bash -c 'echo x >/dev/udp/fd01::3/9'
fi

wait $sock
sleep 0.5; kill $cap; wait $cap
if [ $case = route ]; then
	echo "route $mode: $(grep -c UDP $log) datagrams sent past the blackhole"
else
	echo "xfrm $mode: $(grep -c UDP $log) plaintext, $(grep -c ESP $log) ESP"
fi
ip netns del cl

-- 
Ralf Lici
Mandelbit Srl
