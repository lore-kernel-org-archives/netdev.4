Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167412;
	b=wZi+S6isci+4rMPia85sYB9zU2THA5TbYiffVFm6/CzFRYsYvPH6xJ+uoslXeHgjuUYV
	 E4Zu2xWLDMxj4yHj9syhbUtmgIOChySbOyfuF70PlGSZOGlJ/tMI2ON1m/VLgplYu5mfm
	 BaOfVpnFMG6vOCr2oSs9gQIM3qHUY0mLdkKnUvGZIb8lpacdUjuDN+l9vNyQme4ZXOx5F
	 PupXqufTVX9nGaRvLVWcYbONkA4KPP9karTHt+zzCnirDwbEBxJHd7Qeb8PAtzjARLCLJ
	 73SVWwHUugMCBP+XOLZu+CohizCKB3QODt79EJy8GEXKVuKD1q6esA6MzEyPid+Isfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167412;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=CBRjt2NVmqmr8eAsAkVI2JCou07B9wKadKRAvYBAxnw=;
	b=K3k1zyFQxEPMwiagkVQeQrtUChRl286+rlJHQL8W7CrWwNN5R+RKqDvPcTkSa9kUeLQg
	 1YpGtdW46wGoA67uj+1182pspd5MVa2T126stRl4f3ntOS8cqykJ4jfAZFHO89IgTzKF2
	 ieP7/qnoXhX3MpFi3Ox6b332Y8dbmImakpnulPWV94z5ABccjoqlmTgBb8YYs5e8JBVg7
	 ouRLEaJtyGVctw5lCnsgKo8BydzvRo5yFQOSNhsUIlcxoyLUcqfxg2UYaIPHiIxpB84il
	 zwfZZFpA2tkVwIZCX5O5FYbSPtyLg7EQWub7LjNpygFdG/IkDcS/vGAgceQ+sRzIGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=VjW8sIgi;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3828860A260D;
	Fri, 20 Nov 2026 09:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3828860A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=VjW8sIgi
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jW9G23xlWz5wtM;
	Fri, 20 Nov 2026 10:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795167402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBRjt2NVmqmr8eAsAkVI2JCou07B9wKadKRAvYBAxnw=;
	b=VjW8sIgirRLHVWTS6QjHcCVbXHunQMEcB5ekacCZT7p7NuvfkTYOZmIqmb159hckWXdLx4
	pmLDT18HEJUcNXb40cLM7FGeSe4P+5/7UvYrG0Q1Kmgd3jhuHhg2jWCLQENE3IQFcm7tIN
	iuWRut0aJhT5LQDtzdyqwLk3lEmLJ92tJnfJA7sGLrjb9fEdw7QsSSzN/ffTorGH/cwjLe
	vUE7S5/aTjoYJEx//01eCc0MPzgcoGtIS3knIXRZ3iqJV9VnLYhtD1gYsKxAYt/NFYs3zL
	rcB6ge8ewRHuwn305GXQUmVYSE6YSMW3NEoEIl2TJ4lgzpR4ouPBi5C7awEcRw==
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
Subject: [PATCH net-next v4 3/5] ipv6: validate the cookie of nexthop-object dsts in ip6_dst_check
Date: Fri, 20 Nov 2026 10:36:18 +0100
Message-ID: <5409c8c2f60cdc4816a57adf841934688a5a010d.1795166508.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jW9G23xlWz5wtM

Dsts of routes using nexthop objects record the IPv6 generation at
allocation in rt->sernum. ip6_dst_check validates them with
rt6_is_valid, which compares rt->sernum with the current generation, and
ignores the cookie supplied by the caller.

If the generation advances between route selection and dst allocation,
the dst records the new generation and passes rt6_is_valid although it
was selected from the old state. A caller that sampled the generation
before its lookup can detect this only if ip6_dst_check compares the
cookie as well.

Require the cookie to match rt->sernum. Existing callers obtain the
cookie with rt6_get_cookie, which returns rt->sernum for these dsts, so
their validation is unchanged. ip6_dst_lookup_flow_cookie, added in the
next patch, returns the generation read before the lookup as the cookie
for these dsts.

Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
New in v4
- Split out of v3 2/3 (David):
  https://lore.kernel.org/netdev/7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com/
- Carry Xia's Reviewed-by from v3 2/3, the code is unchanged.

 net/ipv6/route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 98e3ca0644ab..4c02c5168163 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2819,7 +2819,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 	rt = dst_rt6_info(dst);
 
 	if (rt->sernum)
-		return rt6_is_valid(rt) ? dst : NULL;
+		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;
 
 	rcu_read_lock();
 
-- 
2.56.0

