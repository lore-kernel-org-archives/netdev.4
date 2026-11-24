Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537654;
	b=prqTA/hgFjEjNhU4514tO2pfk3iWAGHf6JrTu46tUKsTqxw2/yQGweyryztZioMsu5C7
	 vgQKy6hkKUTAvbZPF64ljIhP1riGYTtI+spCuzdsvl8SnmSliL6D5xgoIdpPLDw/gnEvh
	 0WcS/5zgjZSNybQ0+hdQllrPtPYZGX0Iq+T1dXw1D+mK//m6373SGSk0eoDhfzQnGKnHL
	 kBGHuyQetqS4XPdcZ5DxBgws7eZE7uhrY9CSbJHZITbKE4uzTlzl8RiqFRG0RZnICJqHl
	 5yB+ytVakZS/xy6VTZM2UGbBxIM7LaHPWbbpjbl4KkyjgagEdc8JSSOqHTtjd1l/9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537654;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=72DsguPX3SxJiTs5bSAHIvajccwjl55CWuZ9hwooaCw=;
	b=VCSV8xNr0oeMwvQ9bYygLk0oEX1tlS6wwGbeasOEge9FMTLOTbt5z9n5eF0U4l0sA87f
	 WEXCOmmn7WcYe41qxXl5I7LVa0FNjcPCoHn+5VcezywozWfMQClhwV0tb5zTZZPJkxJSY
	 KByb/8TlcuA8lQZBDvxiGDOCCxP/ZjQZ+fIxkcSxTNbvKL7qbJRGm2YS4VmEuG0hcW53W
	 o9uk/qM2AkYyfEjMHRV+YdJmYnTJ362wzz0BgejjlTb9qllWZsTEiAYoCV1Hw/FMlm7sX
	 pj0TrpK8XKWrEY93OWuYKB68wUyC2gMS3oKPI9Y82PZ17nEWntjtAHX6OUS3LSfP5Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=r90umDw1;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA8606A32C;
	Tue, 24 Nov 2026 16:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=r90umDw1
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jYpB908Xzz5xPJ;
	Tue, 24 Nov 2026 17:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795537649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72DsguPX3SxJiTs5bSAHIvajccwjl55CWuZ9hwooaCw=;
	b=r90umDw1oHvl/Yl3C/MhO9iRQ1lhoV9eOCRGByg2jX+O5taxB6kA2IGTJBDIWlbkPheupX
	P55Uldyb4FR+lItIkuum9JI7kyKxsYiJ2I4POKOrEczstA9FJesj5oz8Fy2OrEipnHatWk
	ugpS4OI4BGMQ9ZbIgg61/ssHFkVlnAfYUVdhMNh63K9qv/J3RuDUMdmHdEstvQY9yBRwGo
	M7fIhcGY/Pzdyc2VwuqhBCDWE8haAqR8R6fg2tBdYRbwxbjFtwiNuP+ROFiED4x/80m+R/
	7rv5GInBHQ+QxjsB5BKPDvAU8BTU/k97TNRtEf6/G7eRx1tNqUMcMy190efp5A==
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
	Sagarika Sharma <sharmasagarika@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 2/4] ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown
Date: Tue, 24 Nov 2026 17:27:08 +0100
Message-ID: <66b34fd272dce584863f6aabfd2e85c9d8017dbc.1795537128.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795537128.git.ralf@mandelbit.com>
References: <cover.1795537128.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jYpB908Xzz5xPJ

fib6_ifup and fib6_ifdown update the node serial before calling
rt6_multipath_rebalance. A lookup that runs between the two can select a
nexthop using the old ECMP upper bounds and read the new serial as its
cookie. The cached dst then passes dst_check although it was selected
from the old state, until the next relevant change.

Update the serial after rt6_multipath_rebalance, so that it is published
only after the routing state it describes. fib6_new_sernum allocates the
serial with a fully ordered atomic_try_cmpxchg, which orders the
rebalance before the serial update. The invalidation scope is unchanged:
fib6_ifup still updates the node and its ancestors, fib6_ifdown only the
node.

The lookup stamps introduced later in this series rely on this order: a
lookup that reads the new generation must also observe the routing
change it describes.

Reported by Sashiko while reviewing an earlier revision of this series.

Fixes: d7dedee184e7 ("ipv6: Calculate hash thresholds for IPv6 nexthops")
Fixes: 4bc852006b62 ("ipv6: update route serial number on NETDEV_CHANGE")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
Changes since v4 https://lore.kernel.org/netdev/363e8614dfd168dcaf90cf7f158e12d587ec8355.1795166508.git.ralf@mandelbit.com/
- Reword the reference to the lookup stamps.

New in v4
- Split out of v3 2/3 (David):
  https://lore.kernel.org/netdev/7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com/
- Add Fixes tags.
- Carry Xia's Reviewed-by from v3 2/3, the code is unchanged.

 net/ipv6/route.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index bbe6d67bb696..98e3ca0644ab 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4913,8 +4913,8 @@ static int fib6_ifup(struct fib6_info *rt, void *p_arg)
 	if (rt != net->ipv6.fib6_null_entry && !rt->nh &&
 	    rt->fib6_nh->fib_nh_dev == arg->dev) {
 		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
-		fib6_update_sernum_upto_root(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum_upto_root(net, rt);
 	}
 
 	return 0;
@@ -5017,8 +5017,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 			}
 			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
 						   RTNH_F_LINKDOWN);
-			fib6_update_sernum(net, rt);
 			rt6_multipath_rebalance(rt);
+			fib6_update_sernum(net, rt);
 		}
 		return -2;
 	case NETDEV_CHANGE:
@@ -5026,8 +5026,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
 			break;
 		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
-		fib6_update_sernum(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum(net, rt);
 		break;
 	}
 
-- 
2.56.0

