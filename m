Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167411;
	b=2SN/wqPsWBeYus0aTBCHdcoBUnwm+tJxyNZ/vxA708olsYEcbrCalTIfQ+mgqnmK7PNa
	 tuMKwrV954650bLrfEnPjpjPDV9JVL7EBiLpwYuxsG0NBdM3DEz8JOeqat4ZzIaZG9eJs
	 CgdlJBdLEz/pSnJUhRl2y/hwHQR6GLv7tLpDwMcBAIwZmehOms9dXDRxH0uCsosl5k1lW
	 m9EXwcN0o7lJ1ukcwQIXhUOrpRRuF2Qf2y4tZlxm2ERWM3OPYqObFHQf3mgMre9nMKOSO
	 S3GgmESJ2yMwtxnC988YVJpTDrYhb+ZBAm0jQxEgRd18nO+/bicgxwGXA91bhQUYGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167411;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=d6lb7Hnw0DWU6OAPDNaafrAQ3t701D3eK96pG8I1zUo=;
	b=vzQvJfVeA3Cyo7xeDZWVlNA2mp9rGTF45JAVvNJE9/sEcV8lwvoX5f+DkAw6G63YzDD3
	 dxNw3afLdTupaLznA3WtoEOFseGiym3eGC5UhVXCcBau6UYBWp9MRiyTgiEVSUUEN4CLz
	 ujxTCT9+5fpwU63emUZW7/vUJ2PXLR3YDFfVmRPMGiwDDsi6eIzODMCmYB4vi02iY3fuo
	 NE5O9ttUTjQfNN/OuzcmG+mrMyBYHT/49Ia8bto6xcYmWjCsVW1KsbLGVuD1VzAPhyfgF
	 VMKG+TknWLfmADtUVrFxWfw866ytR52gpNf1iwbLMCJGso3sMEtbZN+4QiT6uN6qIOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=wjgDI+U5;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA9F606A32A;
	Fri, 20 Nov 2026 09:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA9F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=wjgDI+U5
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jW9G049jXzP8;
	Fri, 20 Nov 2026 10:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795167400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6lb7Hnw0DWU6OAPDNaafrAQ3t701D3eK96pG8I1zUo=;
	b=wjgDI+U5Ev321FT7YcfFAB0YeLkXZ2y0jwYHEub4S4CSZ7RaQ2k3hGlejR5Ym81+VC6HaW
	OabkJgBAIKjNHqsoKWw3z2/V3c1HRUWP6NxUMNV94cuAI4CAFFvrUYgBsJWhOOB59lG3/v
	WCxXkp7GxEtEpQLflLRFZRxxk9E8nhl04QInYbh2u2aFpyoWik1/Ih1/yQDbYbZVCmmlAc
	II3E+K+S06x1CctVWB0vT1LmyM3iSR4tJP1ma14BrPHNhO4GhKpFGt9LAJ8kGQ3vXW7diW
	KZtuSq4A4rIs7ITqweQ+9GpczUcoGBdqoVIo+a4x7+4U5kgjZWcbnIzsZz4nAw==
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
	Sagarika Sharma <sharmasagarika@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 2/5] ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown
Date: Fri, 20 Nov 2026 10:36:17 +0100
Message-ID: <363e8614dfd168dcaf90cf7f158e12d587ec8355.1795166508.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795166508.git.ralf@mandelbit.com>
References: <cover.1795166508.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jW9G049jXzP8

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

The lookup-cookie generation checks introduced later in this series rely
on this order: a lookup that reads the new generation must also observe
the routing change it describes.

Reported by Sashiko while reviewing an earlier revision of this series.

Fixes: d7dedee184e7 ("ipv6: Calculate hash thresholds for IPv6 nexthops")
Fixes: 4bc852006b62 ("ipv6: update route serial number on NETDEV_CHANGE")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
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

