Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167405;
	b=sF5osAGOIY2vlvbc8/NIhVcz877ZdpeGfcFpXaOhs/qX0n4vkEl4VSib+ZKOcbCIo0FC
	 GT49QEwmBUQ38FWaeUoJ2fwF2ZliwpbpsYVlu7usKRxvw3XXOcrZ66iCkf3cti8GubK3Z
	 9HxH3mLjK6hrDUFB6jERI95V+uWZUAUC9/FuJ00OmZOqknaPM+HrzrOe8XeF2B51HJ9ii
	 OYwEWa0c/Z2FrO5jmoDi8fV5dPSWpVG7ntotkjxn7kx9hjVQP5kuN4mJJtZ1gd8F4rVWd
	 jK3ig0kyVpc5pNh6co5elJOQsGThYzoY7/nwMjF3HAAb/hgxHWc3Q+jUJDAzFROHAXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167405;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=UKh67dQiqlnLa6mxIVPr8Wactau05fNB6QPF1BV+pQY=;
	b=GMziHAZ6X+h4cs4sXwKTUuFcRK8ScShfpTtH+07XezIKtpNusNZ/13MIJeKwrXM9r8z0
	 nB/tFoZJMYfr2PHN3gcdP7XK/+VZiJEeE0LueeeRmFzIQfxtS0cyrcsaqH6Ruqw3xP7Lb
	 +V1N+dcllTimPtu2syIShonzJjprUoWQBWfjKeDnKgsJR0PX/IJHPaVMFMoFpVftuNGyo
	 5ppvGpQ5VBe/1h8YjfEpD0r83S0Rh3qVCXWRh6pEN3KeL5QTF5rxz2h34pSilgvKG3P+y
	 h6nRDSH5/6/kCKxQdpMcg0T21RKLY3UiScOcxHEUsGjdO2WTK6fJYOBHxDA3XqbFklQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=m+DAmz8j;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38AF606A336;
	Fri, 20 Nov 2026 09:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38AF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=m+DAmz8j
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jW9Ft4Yy3zNl9C;
	Fri, 20 Nov 2026 10:36:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795167394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKh67dQiqlnLa6mxIVPr8Wactau05fNB6QPF1BV+pQY=;
	b=m+DAmz8jAmgLAJDwE/WhB/K+efmF1EZQ6o2aYlPme0YHi57k4Qa0bQLEiqM07H0gVSYZp/
	JJgKgQQcS+8ciJhtEEHEG83ZHodRtemHXzzJgkcwDV8y4srcA+mz6MmSDGoYRvbXTL5Y5A
	/Kl1uYxNSYgnmVREGQ3Dkw238jGq8slrlpDcUq+lp62QCLamcsLQt6JdDMXHMoKlmb50ZD
	lar7PvIKwLdQswp5hYgIEDkdnk6ZYwHoxmfm29JBn3abnrwe0P+zVfqc+f2Ufm2jqHa+Cf
	e6vSd3XuqyN6GxHwBHoJy7J8uTeAdFcomKOB/JIj0bC01afICMXlrVfZyHBiAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/5] ipv6: tie the dst cookie to the lookup that returned the dst
Date: Fri, 20 Nov 2026 10:36:15 +0100
Message-ID: <cover.1795166508.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jW9Ft4Yy3zNl9C

Hi,

This series implements a first part of the model proposed in [1] to
address the late cookie sampling race: a dst can be stored together with
a cookie read after a FIB change that its lookup did not see, and then
passes dst_check until the next change.

The case that made me post it as a series is xfrm. Adding a policy
restamps every fib6 node, so a socket whose lookup ran just before the
insertion keeps its plain dst and leaks plaintext although the policy
matches. I reproduced it for TCP connect and connected UDP, and the same
window lets a more specific blackhole route be bypassed for routes using
nexthop objects. The ovpn patch [2] hit the same pattern in
dst_cache_set_ip6.

Patches 1-3 are the prerequisites: writers that publish a routing
change before advancing the IPv6 generation, and an ip6_dst_check that
compares the cookie of nexthop-object dsts. Patch 4 adds the
lookup-cookie API and patch 5 converts tcp_v6_connect,
ip6_datagram_dst_update and ip6_sk_dst_lookup_flow to it.

Compared to [1], the fallback cookie is 0 instead of the pre-lookup
generation, so fib6_flush_trees is left alone, and nexthop-object dsts
are checked in ip6_dst_check instead of passing the generation down to
ip6_rt_pcpu_alloc.

I am targeting net-next to get feedback on the lookup-cookie API and its
incremental adoption before extending the conversion across the
remaining cache users. I am not requesting stable backports at this
stage.

Known limitations and pre-existing issues, not addressed here:

- The conversion is partial. The remaining ip6_dst_store users
  (inet6_csk_route_socket, inet6_sk_rebuild_header and
  tcp_v6_syn_recv_sock) and the other cache users (dst_cache, sctp,
  ipvs, flowtable, sk_rx_dst) still sample the cookie late.
- xfrm bundles ignore the returned cookie. Their route and path cookies
  are still sampled late in xfrm_bundle_create. I plan to apply the same
  generation bracketing inside xfrm as a follow-up.
- xfrm_policy_insert unlinks a replaced policy after rt_genid_bump_ipv6,
  so a lookup after the bump can still match the old policy. I will send
  a separate fix.
- Route deletion does not advance the generation, and ip6_dst_check does
  not look at rt->from for nexthop-object dsts, so these are not
  invalidated by deletion. This predates the series and the kdoc of the
  new helper does not claim otherwise.
- A newly linked fib6 node holds fn_sernum 0 until fib6_add stamps it,
  so a dst stored with the fallback cookie 0 can pass a check in that
  window. It fails as soon as the node is stamped.

I tested it in a VM with lockdep, PROVE_RCU and DEBUG_ATOMIC_SLEEP,
using a debug-only delay after the lookup to hit the window: no
warnings, and the plaintext and blackhole bypass are gone in these test
cases.

[1] https://lore.kernel.org/netdev/20260901122501.482920-1-ralf@mandelbit.com/
[2] https://lore.kernel.org/netdev/cover.1789639346.git.ralf@mandelbit.com/

Thanks,

Ralf Lici
Mandelbit Srl

---
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

Ralf Lici (5):
  ipv6: stamp the default route node with a fresh serial on link failure
  ipv6: advance the serial after rebalancing in fib6_ifup and
    fib6_ifdown
  ipv6: validate the cookie of nexthop-object dsts in ip6_dst_check
  ipv6: add ip6_dst_lookup_flow_cookie
  ipv6: use lookup cookies in selected socket dst cache paths

 include/net/ip6_route.h | 18 ++++++++----
 include/net/ipv6.h      | 13 +++++++++
 net/ipv6/datagram.c     |  6 ++--
 net/ipv6/ip6_fib.c      |  4 +++
 net/ipv6/ip6_output.c   | 63 ++++++++++++++++++++++++++++++++++++++---
 net/ipv6/route.c        | 38 +++++++++++++------------
 net/ipv6/tcp_ipv6.c     |  5 ++--
 7 files changed, 116 insertions(+), 31 deletions(-)


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.56.0

