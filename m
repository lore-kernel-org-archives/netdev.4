Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145027;
	b=RYBg6QrWGGFqeF/Cvhu3AMeN8hsUxFcAv7OyrJL0J1NAYM/F5WP/CeTHe8Yqz/S4drtH
	 OryRTapIh5NxXm2keVms3DfCVKvzRritQeUsXQz4uvNEBIx3nBpNgcaoMzhRdRq++v5k3
	 Bl5TUzTbxs33IY9hcuG9hrP4l6F6NCXUnfm6dqmQyovpVJhG8X/lRAJGkIiTbvovtjHOo
	 PtKLbIZmE0xE5Cg8i1RfEcnmK7gyYIVIJ6TpO4o1bdG2ttMCVosTzN5ZlH65O6PusPXlV
	 ydcDBYLL+kSRkPIouLJ5tSS6I9FsyTK0zPkSQt2mnYFjAoZKb5OzLJcCPIy5ZnYm4Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145027;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7nYL4hSIO74kr4TiC7Rkam1cn1cFWaksrMGkbt493mw=;
	b=aRqSvREW24DbxDvacLu2O+/xE4npCL0jU0jHA1jiru/EEXFjFCP4GZF/oU9/MAfl7lcn
	 hHMrrYKehNwj0V5IssmgMewMrWSmakwqixM1g1IbPsW2OWYEoRU4Aj1COqmbzbxtYNJY6
	 rIWZVdKLy5GX/sEbV0EiiCtKXd5GvLrs7vmBCFvHmeBL8LYBpA2Iz7x1sruUnSyAB5nC9
	 pp+iSNHsrUYIADvbyto70MiUlsEihP18fLUKPORrEnJZtKvnr7bNEKcyaGVYCmMgWvQnw
	 WBYIGwFN8Ju4vQaLNbJBv9y+CeniVx6rGcYGskE+rZfVXn3zao4bu3KPt9neVk/XohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HjZEkKyl;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0BF606A33E;
	Fri, 20 Nov 2026 03:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0BF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HjZEkKyl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HjZEkKylCWcx68Qdtre67jYjfWUPljANgz4ETSqsZhu6j2NPfwc+i/e7OJdexYS9iSwcFm3X+MZX3
	 a2IyHw6Tiwq/HwM9h2d0DWmS8/JGMN9tsoR7lpmAzsy68hB9SMh/cYm/BDMs6poh1ElRQzrbMlLLGP
	 1QNmL2WuWxcfeoaw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26affbd3b3f1-5fa05;
	Fri, 20 Nov 2026 11:23:43 +0800 (CST)
X-RM-TRANSID:2ee26affbd3b3f1-5fa05
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.113.192])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46affbd3dd45-13b11;
	Fri, 20 Nov 2026 11:23:43 +0800 (CST)
X-RM-TRANSID:2ee46affbd3dd45-13b11
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.org>
Cc: Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: [PATCH net-next v4] ipv6: check mc_forwarding before calling ip6mr_get_route()
Date: Fri, 20 Nov 2026 11:23:27 +0800
Message-Id: <20261120032327.18375-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
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

When CONFIG_IPV6_MROUTE is enabled, rt6_fill_node() currently calls
ip6mr_get_route() whenever an input interface (RTA_IIF) is specified and
the matched route prefix (rt6_dst->addr) is multicast.

However, ip6mr_get_route() should not be invoked in three cases where
the kernel does not perform multicast forwarding lookup:
1. Multicast forwarding is disabled in the network namespace
   (mc_forwarding is 0);
2. The queried destination address (dest) has interface-local
   (IPV6_ADDR_LOOPBACK) or link-local (IPV6_ADDR_LINKLOCAL) scope, which
   ip6_mc_input() never forwards;
3. The query requests a raw FIB entry via RTM_F_FIB_MATCH (where
   inet6_rtm_getroute() passes dest as NULL), for which IPv4 uses
   fib_dump_info() rather than ipmr_get_route().

In those cases, calling ip6mr_get_route() falls into the cache-miss path
(where skb->dev is not set by inet6_rtm_getroute()) and fails, causing
rt6_fill_node() to jump to nla_put_failure and return -EMSGSIZE instead
of emitting RTA_IIF and the matched route attributes. Note that
supporting MFC cache lookups when mc_forwarding is enabled for routable
multicast groups would also require passing the queried (S,G) and input
device into ip6mr_get_route(), which is left out of scope for this
change.

Align rt6_fill_node() with IPv4 rt_fill_info() and ip6_mc_input() by
requiring that dest is non-NULL, the matched route prefix
(rt6_dst->addr) is multicast, dest is neither interface-local nor
link-local multicast, and mc_forwarding is enabled before calling
ip6mr_get_route().

This alignment was identified with the assistance of an LLM-based code
review comparing IPv4 and IPv6 multicast route get handling, confirmed
in a User-Mode Linux (UML) environment, and verified in UML that
routable multicast queries with mc_forwarding disabled, link-local
(ff02::1) and interface-local (ff01::1) queries with mc_forwarding
enabled, RTM_F_FIB_MATCH queries, and queries matching a non-multicast
route (::/0) all succeed and report RTA_IIF.

Built with W=1 on UML, x86_64 allmodconfig, and x86_64 allyesconfig with
zero new warnings or errors.

Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
---
Changes in v4:
- Converge the series back into a focused single patch and drop patch
  2/2 ("ipv6: preserve ip6mr_get_route() error in rt6_fill_node()") so
  we do not alter the -EMSGSIZE errno to a misleading -ENODEV while
  ip6mr_get_route() still lacks skb->dev and (S,G) parameters.
- Check `dest != NULL` (so RTM_F_FIB_MATCH queries bypass
  ip6mr_get_route() and return the matched FIB6 entry with RTA_IIF) and
  keep `ipv6_addr_is_multicast(&rt6_dst->addr)` (avoiding regression on
  non-multicast matched routes such as ::/0), while testing
  `ipv6_addr_type(dest)` against `IPV6_ADDR_LOOPBACK |
  IPV6_ADDR_LINKLOCAL`, per Sashiko review.
- Add UML tests for RTM_F_FIB_MATCH and non-multicast matched routes
  (::/0) with MRT6_INIT enabled.
- Link to v3: https://lore.kernel.org/netdev/20261116014744.18223-1-sunwenbo@cmss.chinamobile.com/

Changes in v3:
- Also exclude interface-local (IPV6_ADDR_LOOPBACK) and link-local
  (IPV6_ADDR_LINKLOCAL) multicast and drop Hangbin Liu's Reviewed-by tag
  due to the code change.
- Link to v2: https://lore.kernel.org/netdev/20261112094630.197244-1-sunwenbo@cmss.chinamobile.com/

Changes in v2:
- Reword commit message for clearer tone.
- Link to v1: https://lore.kernel.org/netdev/20261111094528.425826-1-sunwenbo@cmss.chinamobile.com/

 net/ipv6/route.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc066e19..419161269701 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5868,7 +5868,10 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 #endif
 	if (iif) {
 #ifdef CONFIG_IPV6_MROUTE
-		if (ipv6_addr_is_multicast(&rt6_dst->addr)) {
+		if (dest && ipv6_addr_is_multicast(&rt6_dst->addr) &&
+		    !(ipv6_addr_type(dest) &
+		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
+		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
 			int err = ip6mr_get_route(net, skb, rtm, portid);
 
 			if (err == 0)
-- 
2.33.0



