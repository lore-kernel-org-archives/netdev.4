Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755498;
	b=QI93Iejeazkh1xiN2rApq8WjpcIrsE1wvJjki2e3YhpVcTqrKGlTbTPy5KxyI1Cxr5qx
	 OWub7X17bPae6blLVkLoD12Ug6dcM1gse4bGfdk5mo+g28pf3BNkPdaQILXu9MPSFORSJ
	 b0F1OY6RkWYFPrdqHRqt/MlpyjFPaq/bRYsFRg4RN6ZQ+PVpj/IvZeObF0eBefTBcIAZd
	 g1A+QrG9VFvyMjJpSDVAgUgMsv2MAF1mnWSncFCfEKu84A5WucWtTJsxgoowBHYenhRJu
	 odTFYHnAZ0fP7ft/4gYIxOUDGDzjed0WAg1AeiXZrEKD3B8VCKV8ZHAC56etnSdo1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
	b=xpv+ZuNYFb/ytpUfaWWkwIFf4ZW+X08A71z+4QauJecH6EmV4ecw7IEB0YFKMEeOqgB9
	 c5AuWQTxiNJdVulOLPg9SmjyDLiQS/2xAvk0El0ix43QBB+WlmFK9QSJoePCmHTRdwkjR
	 qT2iam2GU1s6Fv5XlhYkV04zVR+fl4DrnwSsmRa/SHYXW9bP72PGbKy48FICJmByFWI9Y
	 mkRVb/FauF5e7I9u1EDt+SKHBYkl+ARtg8Tj5AYrNMjAl/pRn314XYL8rDzVokcA53A27
	 H/IMtQ4DBm/EyhKpcqbddV5gFC0Mi8GjyjEUr52ISxfEwmGkAn6wXwx+oRAQn8JQZtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egq0a59s;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBE606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CBE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egq0a59s
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b413997581so5683783a91.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755497; x=1796360297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
        b=egq0a59sOKC+hNlgn9DJt91f1YQF25DaRHQraiur/NltXmKS8MZRSXYKFKrzI0ZH9j
         MBSuj/hFLnKTo7Vm1nEs7TCOQtmjJf6JF3flABg8LZGf/jRG92FME/2IDw5vvjV+fEHe
         fo+C7ZZUZWeC260YoAKD6/txowXhpH2vg1hFSJ1lBMqtfO1wWOgbEh63t/OqO6iV7O0I
         9qK48o3pgZjFOAsG+5uDpOofXWZ4xMqBmzhimV+ZkLEMSSgt7hLtGZXfbPG6CgX9hf7M
         K69jUs8qlvYczyKNzk/6i1z/qCFF18Em+mh6+ZhzzbpTl6cabrD/Vnp7AvtF5iD6R8eQ
         3BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755497; x=1796360297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7vTOR3oemTA1W0hJKqVqhgWngwg5/C2IpV/104sVMI=;
        b=ngSOb3qquDSw9/dSfd/R511cq9236wVHUW7ALYDCMaXkiJZeD99lRMfa7TFbF4sJpV
         TJkYFY+csKJK0I9+UF/uZ9Fba2te/b6HqLCfPDRjyIAZo/gsyFHvSIMHYMYegVrvME9u
         ob5+AqhWImZWrG8tG9btwJLDjC5yfgiDZUSHn+vfsSAatQbJCvEwCInjNkC3d12pZJZK
         ENd2LwK5FTqTXgfZG6rAv2AVjCnUiOB6FF2CwGCXFTi1CEByC9mPy49MJzhPiSHe18Xi
         anluSOfdww5yAihofOwbkVVZjhH7k81vrkKEYJk4JNpe7Aa5vFLLQtNk/Q3Heq6eG0i+
         mhHg==
X-Forwarded-Encrypted: i=1; AL+hErHy2JCaQqvhHvjqO2XbIPMheReLOHuMGdLyA+JIT/Boqf0QibiXqkN4ACJNisilalmn1LGMfLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iENyYZdLPKZq5mStDlGHZL7U1H0cmlJPz0puI5f6BvDVfDr/n
	j2DNSydJmPdPCtxujZCtX2G3v2oo8ZVJk8iGyZmKYpSqBTKTKqK5YPJx
X-Gm-Gg: AZFdTZfYtuGlPWu1xS9cn5dJak8G5pVf2BPHuW8omzf1sQzC02g8BzPZS/3eL2R5hlX
	f1mRCpxIkFPOfzJK8zAKnsiMe6bZ2wQ5YRQkcm3K1c4F2Z+fCKipoQD/6tHfZAJ0I4GdWtHi2Dl
	J/lxsckMkwNi52m8IvNyuzh9dQM1LJPyRqMXTkf5vHi20Dn/j8dcU+3/DV7bmAwDrn7k8BhSbVT
	TdVZMrH2yvY1gQ+QO1xx3dfE76YgkRSz/LtXEji8gYBhYJnsjjlpTMOVxDEcF4tGqdZ03GmHphB
	3vyVrdBzHAjFmeh4kpCYiOhSu9ct50CbIIxEeEwExUABNtDqBc/xxj/0x22A7ywc5iwgWcpYG7A
	XdmztVqxEodMaUoqGKF3PxLRGZa41VMoGJD+oQeNorc9K2GnWFzCZszQplqfXEFI6Zspt9Ltilj
	8+kX3z+qNLvTulzpYY85rKTbV7fAi174iOFaHvrvNg7wpZROIT0fK+F1gvyZ0JX1yvoUxsnGy0S
	qYemEuAAgfZ71Z3gRIoXWZWhG9WxbMhIrDD5ftt7qmhI1bCoqDtGhLsgnDeiPhXW10orGwV+ZcD
	at6Vx+Y1+FYiarvDvcVXPpSKjnjQ8bJUtljreUQR/GYc7OdqfKBrf0AoovFYNOB9a5c=
X-Received: by 2002:a17:90b:2e8c:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b41c8e105bmr19924654a91.17.1795755497037;
        Thu, 26 Nov 2026 20:58:17 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm39010808a91.12.2026.11.26.20.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:58:16 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v3] net: free the socket policies when sk_clone() fails
Date: Fri, 27 Nov 2026 13:58:10 +0900
Message-ID: <179568863376.462699.9896914557163021386@gmail.com>
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

sk_clone() clones the parent's socket policies with
xfrm_sk_clone_policy() and then its BPF socket storage with
bpf_sk_storage_clone(). If either fails once a policy has been cloned,
the new socket goes to the "free" label, which only clears sk_destruct
and calls sk_free(), as the socket is still a raw copy of the parent.
Nothing frees the cloned policies: they stay on the namespace's policy
list and in its count, and the namespace teardown warns in
xfrm_policy_fini().

__xfrm_sk_clone_policy() fails that way when cloning the second policy
fails, with the clone of the first already in the new socket.
bpf_sk_storage_clone() fails when memory is short or when the copy does
not fit into net.core.optmem_max.

Free the policies in a new label at the end of the function. A failed
filter charge still goes to the old one: xfrm_sk_clone_policy() has not
run then, and sk_policy[] still holds the parent's pointers.

Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
Fixes: 8f51dfc73bf1 ("bpf: support cloning sk storage on accept()")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
v3:
- Free the policies at the end of sk_clone() instead of in
  __xfrm_sk_clone_policy(), so there is no unwind loop (Steffen), and a
  later failure of bpf_sk_storage_clone() is covered too (the AI review
  Steffen forwarded). This is the unwind Jakub asked for on Josef's
  patch for the second case:
  https://lore.kernel.org/all/20261020192044.7c3a58a1@kernel.org/
- Hence the new subject; nothing in net/xfrm/ changes any more.
v2: https://lore.kernel.org/all/179540803323.3139700.5340002553684152759@gmail.com/
v1: https://lore.kernel.org/netdev/179505710269.3511679.8893709762919027206@gmail.com/

Both cases reproduce as root in a new network namespace with a loopback
TCP listener that has IP_XFRM_POLICY set in both directions. For the
first, failslab fails the second clone_policy() (a stack filter on
__xfrm_sk_clone_policy() and interval 2). For the second, the listener
also gets an element of a BPF_F_CLONE sk_storage map, and
net.core.optmem_max is then lowered so that the child's copy cannot be
charged. Without the patch, the clones are left behind and the
namespace teardown warns in xfrm_policy_fini(); with it, it does not.

The patch was written with LLM assistance; we reviewed and tested it.

 net/core/sock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 5675053625e6..d291433749d2 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2598,19 +2598,20 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	RCU_INIT_POINTER(newsk->sk_filter, filter);
 	rcu_read_unlock();
 
-	if (unlikely(!is_charged || xfrm_sk_clone_policy(newsk, sk))) {
+	if (unlikely(!is_charged)) {
 		/* We need to make sure that we don't uncharge the new
 		 * socket if we couldn't charge it in the first place
 		 * as otherwise we uncharge the parent's filter.
 		 */
-		if (!is_charged)
-			RCU_INIT_POINTER(newsk->sk_filter, NULL);
-
+		RCU_INIT_POINTER(newsk->sk_filter, NULL);
 		goto free;
 	}
 
+	if (unlikely(xfrm_sk_clone_policy(newsk, sk)))
+		goto free_policy;
+
 	if (bpf_sk_storage_clone(sk, newsk))
-		goto free;
+		goto free_policy;
 
 	/* Clear sk_user_data if parent had the pointer tagged
 	 * as not suitable for copying when cloning.
@@ -2638,6 +2639,8 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 		sk_sockets_allocated_inc(newsk);
 out:
 	return newsk;
+free_policy:
+	xfrm_sk_free_policy(newsk);
 free:
 	/* It is still raw copy of parent, so invalidate
 	 * destructor and make plain sk_free()
-- 
2.43.0

