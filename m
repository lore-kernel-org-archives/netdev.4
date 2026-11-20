Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144967;
	b=DMw39S+dqWGsB6GDHZUQcwP1jXaRGl8i1WHCL0go7I6+Roh5uXUMoEaWRAvQ2EwCFFBl
	 6KMZSJqcDpHGJKPqBUzA+r8FuLa9YBh7di9t4pay5I6FDOJ5URxW0VgW1hgFbmEes5MX4
	 zVFqEaGfYTQLLcZovI7mrNNjrrnkIYZwR1rSfs+t/BzLijtPiP8dwGbEC+zd5wmRCkNj8
	 0fnowvnq6o/E2bgouPxoMyXbRLV1vwp2lLB7A7Pq3aCwoOk16eq8gazUpMaLkm6z+RfVW
	 p0IVKq8YT6SoWHtnecywsSSjPkfOx5Ht5nUfFIQIjs0s4StZzefidTbkm52T7AfrZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144967;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kpgmt9JPwJx/7KwYPT+OUzJInPwQSfTaGCm2zYmlyjg=;
	b=cKqPLBhmwLxS8U+L4wtuZ4ASiGUDS+lFAG359fTid2rmuTLjUi/3p6VspgoEVKoXTf4X
	 ioxsglO9Inhv2Jyp4+8hDmPIjzQtLmeGi7ORK4BL27J6MqJK1Uj7OyKJFBHg0ihrDsIQg
	 7fbdT2dfSqjKtF83HKCfsgM8FgweKtL0YCvRPs5prCvYq3kP1rd3up6rg0TO/BHqbQUxm
	 HUwCoa94lQbUxQ5Rs8xlXJYCF5KiNok83Isu9m9uDQzUCGcJNcnCMlyLM/03HVNdRPvV6
	 iZz3akD2p6I3zpFym7p9q7sNGjTFbPGiPznlE/81B3wsETOmXNDki2NuBAiBxXRjFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="Dk/Ms4tw";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25489606A33D;
	Fri, 20 Nov 2026 03:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25489606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Dk/Ms4tw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Dk/Ms4twRHl2l/kuQGEyL55Pik3uWVn8Iqht6bdxg3GEWitZteQRzQoYFHUikjaoEwR6eGYrgeCne
	 yS2imIDfeBvJ5QVXT6M2LnbkVLwPd0NMTk/aWVOSCB9RqMQ8myQV2lowlrroq1ZfSpfBcsR0r20+83
	 g0BpziORJQ2ZNaJE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66affbd02fd1-f02f2;
	Fri, 20 Nov 2026 11:22:42 +0800 (CST)
X-RM-TRANSID:2ee66affbd02fd1-f02f2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.114.161])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46affbd01cbd-13a7c;
	Fri, 20 Nov 2026 11:22:42 +0800 (CST)
X-RM-TRANSID:2ee46affbd01cbd-13a7c
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: Re: [PATCH net-next v3 1/2] ipv6: check mc_forwarding before calling ip6mr_get_route()
Date: Fri, 20 Nov 2026 11:22:19 +0800
Message-Id: <20261120032219.18091-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <179509619796.3136.11845865038486249097@kernel.org>
References: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com> <20261116014744.18223-2-sunwenbo@cmss.chinamobile.com> <179509619796.3136.11845865038486249097@kernel.org>
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

Thank you for the detailed review on v3 1/2. We reproduced and verified each
of the findings in a User-Mode Linux (UML) environment (`CONFIG_IPV6_MROUTE=y`)
and prepared a focused single-patch v4 to address them:

1. Root-Cause Analysis & Local UML Reproduction of v3 1/2 Findings:

   Base UML topology:
     ip link add d0 type veth peer name d1
     ip link set d0 up && ip link set d1 up
     ip -6 addr add 2001:db8::2/64 dev d0
     ip -6 addr add ff0e::1 dev d0 autojoin

   (a) [High] Routable multicast query when mc_forwarding=1:
       In `inet6_rtm_getroute()`, `skb->dev` is never set on the newly
       allocated reply skb, and `ip6mr_get_route()` looks up
       `ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr)`, where
       `rt` is the per-CPU route copied from `f6i->fib6_dst` (`ff00::/8`).
       We reproduced this in UML by opening an `AF_INET6` `SOCK_RAW`
       (`IPPROTO_ICMPV6`) socket, enabling `MRT6_INIT`, registering `d0` via
       `MRT6_ADD_MIF`, and adding `(S=2001:db8::3, G=ff0e::1)` via
       `MRT6_ADD_MFC`:
         MRT6_ADD_MIF(mifi=0, pifi=3) OK
         MRT6_ADD_MFC(S=2001:db8::3, G=ff0e::1) OK
         mc_forwarding=1
         $ ip -6 route get ff0e::1 from 2001:db8::3 iif d0
         RTNETLINK answers: No such device
         ip_exit=512
       Because `ip6mr_get_route()` checks `(::, ff00::)` instead of the
       queried `(S,G)` and `skb->dev` is NULL, it misses even when the MFC
       entry exists. Making `mc_forwarding=1` MFC queries work requires
       passing `(src, dest)` and handling `skb->dev` / `skb_realloc_headroom()`
       across `inet6_rtm_getroute()` and `ip6mr_get_route()`, which we now
       explicitly state as out of scope in the commit message and drop patch
       2/2 in v4 so we do not alter the uAPI errno to -ENODEV prematurely.

   (b) [Medium 1] Regression when a multicast query matches a non-multicast
       route (e.g. `::/0`):
       In v3, replacing `ipv6_addr_is_multicast(&rt6_dst->addr)` with
       `ipv6_addr_is_multicast(mc_dst)` caused queries matching a non-multicast
       FIB route (when `ff00::/8` is absent, such as on `lo`, an l3mdev
       master, or after deleting `ff00::/8`) to enter `ip6mr_get_route()` when
       `mc_forwarding=1`.
       Reproduced on v3 in UML:
         # ip -6 route del multicast ff00::/8 dev d0 table local
         # ip -6 route add ::/0 dev d0
         # (with MRT6_INIT / mc_forwarding=1):
         $ ip -6 route get ff0e::1 from 2001:db8::3 iif d0
         RTNETLINK answers: No such device
         ip_exit=512

   (c) [Medium 2] `RTM_F_FIB_MATCH` (`fibmatch`) missing link-local exclusion:
       In `inet6_rtm_getroute()`, the `fibmatch` branch calls `rt6_fill_node()`
       with `dst = NULL, dest = NULL`. In v3, `mc_dst` fell back to
       `&rt6_dst->addr` (`ff00::`, scope 0), so link-local `fibmatch` queries
       still entered `ip6mr_get_route()` when `mc_forwarding=1` (whereas IPv4
       `fibmatch` uses `fib_dump_info()` and never calls `ipmr_get_route()`).
       Reproduced on v3 in UML (with `MRT6_INIT` / `mc_forwarding=1`):
         $ ip -6 route get fibmatch ff02::1 from 2001:db8::3 iif d0
         RTNETLINK answers: No such device
         ip_exit=512

   (d) [Low] Fixes tag / net vs net-next:
       Because this patch aligns long-standing non-crash route-get reporting
       semantics with IPv4 (while full `mc_forwarding=1` MFC lookup in
       `ip6mr_get_route()` remains a separate effort), we keep targeting
       net-next without a Fixes tag, and have softened the commit message
       accordingly.

2. Concrete Fix in v4 & UML Verification Results:

   In v4, we converge the series into a single patch that checks `dest != NULL`
   (so `fibmatch` queries always emit the matched FIB6 entry and `RTA_IIF`),
   keeps `ipv6_addr_is_multicast(&rt6_dst->addr)` (avoiding the non-multicast
   route regression), and tests `ipv6_addr_type(dest)` against
   `(IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)`:

     if (dest && ipv6_addr_is_multicast(&rt6_dst->addr) &&
         !(ipv6_addr_type(dest) &
           (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
         atomic_read(&net->ipv6.devconf_all->mc_forwarding))

   Verified on v4 in UML (`FAILURES=0, TEST_EXIT_CODE=0`):
   - Test 1 (`mc_forwarding=0`, `ff0e::1` with `iif d0`):
     `ff0e::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
   - Test 2 (`mc_forwarding=1`, link-local `ff02::1` with `iif d0`):
     `multicast ff02::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
   - Test 3 (`mc_forwarding=1`, interface-local `ff01::1` with `iif d0`):
     `multicast ff01::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
   - Test 4 (`mc_forwarding=1`, `fibmatch` for `ff02::1` and `ff0e::1` with
     `iif d0`):
     `multicast ff00::/8 dev d0 table local proto kernel metric 256 iif d0 pref medium`
     (`ip_exit=0`, PASS)
   - Test 5 (`mc_forwarding=1`, `ff0e::1` matching `::/0` after removing
     `ff00::/8`):
     `ff0e::1 from 2001:db8::3 dev d0 proto boot src 2001:db8::2 metric 1024 iif d0 pref medium`
     (`ip_exit=0`, PASS)
   - Test 6 (IPv6 unicast with `iif`, IPv6 multicast without `iif`, IPv4
     multicast with `iif` regressions): all PASS.

Thanks,
Wenbo

pw-bot: cr


