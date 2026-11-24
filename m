Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537651;
	b=3bwP746EB+1/aYKUkzMfSGYmKYRgC2eGLPO4AWamt1/B0HMmBYPU8+5JMhTm+66iAzqO
	 2yeMjxhEhR7SzdijJKVU/f2UpaoIcwU6olf1kCtMff/q91owtSJ75/dyUll/qmuvgI/sK
	 Nsa3N6emaqCzBqNeLjWvvzO337zEHIjYuSOol19fXbRTfmPxXamp0oFVpOeEBMnNCSarX
	 hc3Gd9JtAKuADCHboQktnMdikQ3bXZWjFztqTkjWF8ovGZFdLjHCmLbHbQ8SDJVvEI6Kq
	 raUuw9yn2wesp7TS0IpIFYkn1UrCZanJ6gdeBus9vS9CC812K/wSqkCrXpv0kZiagOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537651;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=EYwlmi6nVR2KBTF/EYBGQySw9lW8D/ABKdT8CfSaVg8=;
	b=Bl35qkIVp9OEqw9lUu1vD6pCszb0g7NbtqPSS4a/tpZnFyrrbRNYUG3k3jmpufdvdJyw
	 VknR/WTZ7mqePNwrTSeBaAECDtEq0PqoCK/L+MJzvyg3PjwnfIN/+obOiRCyYJc9GPF5U
	 Wk5d6koJXqfAW7PRzI1d0N/Te5mQN7lx5DsdMp/D1bDJOOB9vXnd9lgLx/5tnq2wYLqFG
	 5fceGScg/SkurWZHD1y54QyBFp9EfuzlgiqADv1XEfPN7zCguf78KVTZerT/BRzkNVhH5
	 K0yUo2G31Lueaq+dDMPzlY8GsrZybdcLPUgAPQ7wOzfb9fspyFvnNt4T6nXHtEteZFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Fuqxaacd;
	arc=none smtp.remote-ip=195.10.208.52
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E19606A31E;
	Tue, 24 Nov 2026 16:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E19606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Fuqxaacd
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4jYpB71G33zLmY9;
	Tue, 24 Nov 2026 17:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795537647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYwlmi6nVR2KBTF/EYBGQySw9lW8D/ABKdT8CfSaVg8=;
	b=FuqxaacdRITZwmg52GFge1uH5xPdkOdlMGebKPBpHv69a/KKI7TLnTwsrPnVUR6n3E+zDL
	LfzO843JWD8av+ZWZ8Sp0/Yvx3JSoUjRKm65W1cwJK/SexQhdIXMQylGw1+k29EjY3jmv0
	t2B+rnQBRH2HNeTOmhxelrTB53cGpqZEVyAprXXHpMJPqw15eepQFa2baEjGkx2Vv/Tf9d
	2U/CVxCVj6tjd2ID/CpKq0TJmNP8hLy6VKN/Q6w41H8/3CfpTfeehZquwtZKBnmxKtdzq9
	Yeramoa7tnWDTlDGGJPu+B8I10kfM8UbQtX4EMW5Qsu/pxb/cMYMZ+VVKJmJWQ==
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
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 1/4] ipv6: stamp the default route node with a fresh serial on link failure
Date: Tue, 24 Nov 2026 17:27:07 +0100
Message-ID: <002e141deadfa855bc389899aba43be60e840d5c.1795537128.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jYpB71G33zLmY9

ip6_link_failure invalidates the cached dsts of an RTF_DEFAULT route by
writing -1 into the node's fn_sernum. Once the node already holds -1,
another link failure leaves the serial unchanged, so dsts cached with
that cookie can survive subsequent failures.

The assignment also leaves net->ipv6.fib6_sernum unchanged, making the
invalidation invisible to lookups watching the namespace generation.

Use fib6_update_sernum under tb6_lock to allocate and stamp a fresh
serial. This makes repeated invalidations distinguishable and allows the
lookup stamps introduced later in this series to detect them.

Advancing the namespace generation also invalidates unrelated dsts using
nexthop objects, which are validated against that generation. This
happens once per ip6_link_failure call: once per queued skb when the
neighbour of the default router fails, and once per packet on the
tunnel transmit error paths that call dst_link_failure, some of which a
remote host can trigger with ICMP errors. These are error paths and add
no cost to the fast path.

Found while reviewing the IPv6 routing code to address the dst-cache
race.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Changes since v4 https://lore.kernel.org/netdev/79fea581787dd175005d81090d246e982a07cc51.1795166508.git.ralf@mandelbit.com/
- Mention the tunnel transmit error paths. (Sashiko)

Changes since v3 https://lore.kernel.org/netdev/5b59512a6c51c7a5d7c7b4e16728de3c522d9a1e.1794906743.git.ralf@mandelbit.com/
- Note that the generation advances once per ip6_link_failure call.
  (Sashiko)
- Widen the rt6_exception_net comment. (Sashiko)

Changes since v2 https://lore.kernel.org/all/143461e2c94a20060ff4c7d6e5eb46c47ac46aa0.1794384146.git.ralf@mandelbit.com/
- Add a Fixes tag referencing the initial git import. (Sashiko)
- Clarify that the nexthop-object invalidation is a harmless side
  effect, rather than a deficiency being fixed. (Sashiko)

No changes since v1 https://lore.kernel.org/netdev/5b039a5a24808f2678eedd283c29f8dae514ef5e.1793806941.git.ralf@mandelbit.com/

 net/ipv6/route.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c5..bbe6d67bb696 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1531,9 +1531,11 @@ static struct rt6_info *rt6_make_pcpu_route(struct net *net,
  */
 static DEFINE_SPINLOCK(rt6_exception_lock);
 
-/* Exceptions are accounted to the netns their dst was allocated in.
- * Unlike dev_net(dst->dev), it does not change when the device moves to
- * another netns or when dst_dev_put() points the dst to blackhole_netdev.
+/* Return the netns the dst was allocated in, which owns the fib6 table of
+ * its route. Exceptions are accounted to it, and ip6_link_failure advances
+ * its generation. Unlike dev_net(dst->dev), it does not change when the
+ * device moves to another netns or when dst_dev_put() points the dst to
+ * blackhole_netdev.
  */
 static struct net *rt6_exception_net(const struct rt6_info *rt)
 {
@@ -2873,13 +2875,13 @@ static void ip6_link_failure(struct sk_buff *skb)
 			rt6_remove_exception_rt(rt);
 		} else {
 			struct fib6_info *from;
-			struct fib6_node *fn;
 
 			from = rcu_dereference(rt->from);
-			if (from) {
-				fn = rcu_dereference(from->fib6_node);
-				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
-					WRITE_ONCE(fn->fn_sernum, -1);
+			if (from && from->fib6_table &&
+			    (rt->rt6i_flags & RTF_DEFAULT)) {
+				spin_lock_bh(&from->fib6_table->tb6_lock);
+				fib6_update_sernum(rt6_exception_net(rt), from);
+				spin_unlock_bh(&from->fib6_table->tb6_lock);
 			}
 		}
 		rcu_read_unlock();
-- 
2.56.0

