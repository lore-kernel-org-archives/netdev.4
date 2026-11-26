Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691732;
	b=C1Fnknbv78tS2/i/AJSkveivsNLw9xKTOuS6cyAL0Bv+jIMJiPNWy878jxBMjzeVJ1En
	 7YEhpeYcRp/CD1zaryz6TRqO65kUcIjSvhO9hxXKbTm+q+Rmgc6FVekOma/Tu77dHSkKQ
	 oFwpUyDOwlApw/o53gE4ogusKuf3E+vWYZJvnKJnTqD8vuxRidlImhZPXvdRq0ezCorso
	 QkLA5W8x60DY7Jh1MOtLugnOPqWzLuJBBUQpbBULuRcD3ZvMhEmuJO82LHi3BeCDBEfXl
	 A8LJgV3/UMq+PHef2FABCm1OBoVr2CHzyJ3kAn++JKKz2Md5u5R0zdFf3dd3bv4R9/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691732;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=lKuETvdOXSFXrLX8KJzppos0tKsmNCcYHiCIlXagajo=;
	b=DqC7i1GjBURZ7cbu66uo1ZsAawQCRNBBpPVELbPcRacadikY5R3p7Yn8GFlZ+eI+Dwiy
	 QSqyuMzKUeWmVsnJsQwoYGSDgqg7RqC2mS0tKzHraJ2hvcPRi+oocu3XIVPnTJCA112+7
	 e/+taHumzRVzo4V/44IKAIK0BcUdJ1qXOUs2bARJykqsKUCttXsAPpIolX9k5OOTCZXjF
	 68ShFrv8OObmpE5u9Lpc/ldO71ZNidNMZTOhC8BFrDBl6ZP1AJzDaZL+CT51t5qEC3tKE
	 UXgu4bUp8k9oQfu/tIW5sCik3pTp0e2fvEKTran6hzfOICKZLube2pE3ugosMtRSCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="AdLu3L/h";
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F8606A31E;
	Thu, 26 Nov 2026 11:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=AdLu3L/h
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jZv9C1pltz5vRn;
	Thu, 26 Nov 2026 12:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795691727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lKuETvdOXSFXrLX8KJzppos0tKsmNCcYHiCIlXagajo=;
	b=AdLu3L/hfv+dVRp977DAjYZ6siETgQZTBGuHFQ9Ug9kVmoQUhkR0p0YeP+hRe9mz5+IoKI
	GhId9J4qSDBM2s2x/pg7nM0FKeBNMrhITOMd6GlCvxAwCgA1zyI+sayKqjl/sGWOAWqFm8
	ea9WzzyJVG+s3Kx7rTEaWkXAIkTTW5svvXx0ZzmMq74DXY05T2dzZ828LRMsjpPn9YN0Ff
	j8XlSDQCUXruUlmqMS1Xy8BWNvnVFG74wf+nGx7wsC685yotyX0qUJM4WZUwMp8LZmotJX
	6NJ6RmaKIa0zD5F2bMDECVfolB5DPFswC2YEgyfjIvK/XB3ghdRWlCLOoEfoIg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: advance the route generation when policies are removed
Date: Thu, 26 Nov 2026 12:14:39 +0100
Message-ID: <20261126111516.317545-1-ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jZv9C1pltz5vRn

Only xfrm_policy_insert and xfrm_set_default advance the IPv4 and IPv6
route generations. Deleting, flushing or expiring a policy does not, so
a route that a socket cached while an allow policy without templates
matched its flow keeps validating after that policy is removed, and the
socket keeps sending in plaintext although a policy requiring IPsec now
matches. xfrm_policy_insert also advances the generation before
unlinking the policy that the new one replaces, which can still be
matched until then, since the new policy can be linked behind it.

Advance the generation once a policy is unlinked by a delete or by its
expiry, once after all policies are unlinked by a flush, and after the
replaced policy is unlinked by an insert. Socket policies only apply to
their own socket and are left out.

Fixes: ee8372dd1989 ("xfrm: invalidate dst on policy insertion/deletion")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Found while auditing the writers of the route generation, where the
xfrm_policy_insert ordering was also reported by Sashiko:
https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/

 net/xfrm/xfrm_policy.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index d2e938d4db9a..47379da24e99 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -1569,6 +1569,14 @@ static struct xfrm_policy *xfrm_policy_insert_list(struct hlist_head *chain,
 	return delpol;
 }
 
+static void xfrm_policy_bump_rt_genid(struct net *net, unsigned short family)
+{
+	if (family == AF_INET)
+		rt_genid_bump_ipv4(net);
+	else
+		rt_genid_bump_ipv6(net);
+}
+
 int xfrm_policy_insert(int dir, struct xfrm_policy *policy, int excl)
 {
 	struct net *net = xp_net(policy);
@@ -1589,16 +1597,13 @@ int xfrm_policy_insert(int dir, struct xfrm_policy *policy, int excl)
 
 	__xfrm_policy_link(policy, dir);
 
-	/* After previous checking, family can either be AF_INET or AF_INET6 */
-	if (policy->family == AF_INET)
-		rt_genid_bump_ipv4(net);
-	else
-		rt_genid_bump_ipv6(net);
-
 	if (delpol) {
 		xfrm_policy_requeue(delpol, policy);
 		__xfrm_policy_unlink(delpol, dir);
 	}
+
+	/* Advance the route generation only once the replaced policy is gone */
+	xfrm_policy_bump_rt_genid(net, policy->family);
 	policy->index = delpol ? delpol->index : xfrm_gen_index(net, dir, policy->index);
 	hlist_add_head(&policy->byidx, net->xfrm.policy_byidx+idx_hash(net, policy->index));
 	policy->curlft.add_time = ktime_get_real_seconds();
@@ -1695,6 +1700,7 @@ xfrm_policy_bysel_ctx(struct net *net, const struct xfrm_mark *mark, u32 if_id,
 				return pol;
 			}
 			__xfrm_policy_unlink(pol, dir);
+			xfrm_policy_bump_rt_genid(net, pol->family);
 		}
 		ret = pol;
 	}
@@ -1735,6 +1741,7 @@ xfrm_policy_byid(struct net *net, const struct xfrm_mark *mark, u32 if_id,
 					return pol;
 				}
 				__xfrm_policy_unlink(pol, dir);
+				xfrm_policy_bump_rt_genid(net, pol->family);
 			}
 			ret = pol;
 			break;
@@ -1835,10 +1842,12 @@ int xfrm_policy_flush(struct net *net, u8 type, bool task_valid)
 		spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 		goto again;
 	}
-	if (cnt)
+	if (cnt) {
+		rt_genid_bump_all(net);
 		__xfrm_policy_inexact_flush(net);
-	else
+	} else {
 		err = -ESRCH;
+	}
 out:
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	return err;
@@ -1875,10 +1884,12 @@ int xfrm_dev_policy_flush(struct net *net, struct net_device *dev,
 		spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 		goto again;
 	}
-	if (cnt)
+	if (cnt) {
+		rt_genid_bump_all(net);
 		__xfrm_policy_inexact_flush(net);
-	else
+	} else {
 		err = -ESRCH;
+	}
 out:
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	return err;
@@ -2365,6 +2376,9 @@ int xfrm_policy_delete(struct xfrm_policy *pol, int dir)
 
 	spin_lock_bh(&net->xfrm.xfrm_policy_lock);
 	pol = __xfrm_policy_unlink(pol, dir);
+	/* Socket policies only apply to their own socket. */
+	if (pol && dir < XFRM_POLICY_MAX)
+		xfrm_policy_bump_rt_genid(net, pol->family);
 	spin_unlock_bh(&net->xfrm.xfrm_policy_lock);
 	if (pol) {
 		xfrm_policy_kill(pol);

base-commit: 2803867cf3defa294710088a4663b434e12b5e93
-- 
2.56.0

