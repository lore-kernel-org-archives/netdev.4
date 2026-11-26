Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680856;
	b=b2fFgi8jaIAfPx885qLkig2Ae5ee74k29GVng8ORykIG2aBoxmp7975i2aCT0asW05Zz
	 DOndmgqlO/C7jPs7qUA9aO8FpXF8lOeQ+sJRWZ9R9Og5AeIJXgUqXBmZAfXEvXTQLGMaR
	 FU2I09eL2BoMBBc9CruL37y6ewyXWgfL5lCHvnhUDcob+MVMXllNE2xUX7gjq25MZETGl
	 pW2fLJLaEjPtBogpnmHemT2A8gd2ZGlgxcNlIzaoUwoijs2Lw2hNMj8mkqJU4SUmdQZpK
	 quLu6QaTW1cfDOT/DF/H+HVVtOjaYYdI5vEcCtzv28YOrugW341yD/cH052sH+ou4eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680856;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=7J2wkcrNkzeTtVxHfayLP87adFuogRPt/IEKd/fTAXM=;
	b=W3fTK6CWXiP5K35Bxu8e8SxED5tg5yXzKLWR2jsWvbXAwXx2kj6VpkTfpIF3D1sOJOkm
	 pCjQtoPltR2MzsEoonpfGWHcONWP3teYIgQuh+majW+QRVdOzMeNGdkb7EV/3Q9GO72GB
	 Ots30bvMKnqfS7lUPzOs/5i7aCqkNXS0j6XxDPoKQmGcNSl0IX2lClv7newLy6CEqs+RT
	 SHiAHxhywZ+/SQG6kK6htmRra2Di+mUBWrFgBEq8diW1rjMuRgd8tWCeSK1lRkG6yvZDW
	 s7bEiq3k2kj6rD7e87K/WqdMMXsZc4kIMV3tu6Ax0dBFrY1/Ny76RZbktFIzb32pmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=I8oXpLGw;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065F606A336;
	Thu, 26 Nov 2026 08:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A065F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=I8oXpLGw
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jZq7x2Z6hz5wrZ;
	Thu, 26 Nov 2026 09:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795680845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7J2wkcrNkzeTtVxHfayLP87adFuogRPt/IEKd/fTAXM=;
	b=I8oXpLGwdlJGKsH57NjV3Pq/hBt/2kfABUdikdqOm+EIP5W1XX+v1Z8kbvizChYqWVPK7N
	64+8OPnoxCVJkuqOOKJ2S5RQ4kzK14kTPBxaiSnBSyuqQ2uuwmlCpOFuv2uKXvrhoSowxm
	LKRIMN2C9shao99leI4qAfWbY50Ihyfv6U5SuknjYk6p0frWhYLXdT+FXqRVcjixEgM+aY
	FTJ9fHseDU2IesJ9X3wYGvcvuWGWiBLhKssRd5nfFkq8ma+Uvo7F6fbh3LPpFPdMILEdZ/
	3xPMPpl8KV7GFAO+XQ4LqkKKJnupY8wVE7ts9cuCcGqkv1/vQw5Ns8lxMyZRnw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Sagarika Sharma <sharmasagarika@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown
Date: Thu, 26 Nov 2026 09:13:51 +0100
Message-ID: <20261126081353.55240-1-ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jZq7x2Z6hz5wrZ

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

Validating dsts against the generation sampled before the lookup, as
proposed in "ipv6: validate cached dsts against the netns route
generation", relies on this order as well: a lookup that reads the new
generation must also observe the routing change it describes.

Reported by Sashiko while reviewing an earlier version of this change.

Fixes: d7dedee184e7 ("ipv6: Calculate hash thresholds for IPv6 nexthops")
Fixes: 4bc852006b62 ("ipv6: update route serial number on NETDEV_CHANGE")
Link: https://lore.kernel.org/netdev/cover.1795642432.git.dahern@nvidia.com/
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
Split out of v5 of "ipv6: tie dst validation to the lookup that
returned the dst", which is withdrawn in favour of the series in the
Link above:
https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/

 net/ipv6/route.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc066e19..194432f1fd66 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4911,8 +4911,8 @@ static int fib6_ifup(struct fib6_info *rt, void *p_arg)
 	if (rt != net->ipv6.fib6_null_entry && !rt->nh &&
 	    rt->fib6_nh->fib_nh_dev == arg->dev) {
 		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
-		fib6_update_sernum_upto_root(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum_upto_root(net, rt);
 	}
 
 	return 0;
@@ -5015,8 +5015,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 			}
 			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
 						   RTNH_F_LINKDOWN);
-			fib6_update_sernum(net, rt);
 			rt6_multipath_rebalance(rt);
+			fib6_update_sernum(net, rt);
 		}
 		return -2;
 	case NETDEV_CHANGE:
@@ -5024,8 +5024,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
 		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
 			break;
 		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
-		fib6_update_sernum(net, rt);
 		rt6_multipath_rebalance(rt);
+		fib6_update_sernum(net, rt);
 		break;
 	}
 

base-commit: ef3e21c61baa74e39a49b75318bd4541562ec43f
-- 
2.56.0

