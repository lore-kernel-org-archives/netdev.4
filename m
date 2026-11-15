Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741482;
	b=SpRkP+IoWpHlL4yDfDJvh73peNHl5KcodljY6sc0qdM2SpJGj/sK/bn9VZwX5git0h1l
	 pTnQu4LKAIaUL6tfHQnEAcblmT9nbt4ehIsPM0wT2BLqrrCcuaYxOEz1AOArv5VK7/Py8
	 Z3ZDIWSkmNSq7MFmpSgWx8wAHpBP0Dyco3Os4u59yjSVGhbF4fjYYvkCyRlIQa1LyEdTN
	 ZIMACcY8o7sX4I54SZfNgRVTcoia8u0I3PJHa4huKgnkBACbKgb2zSXeuOkyHZCigLCFZ
	 JiAFOFLSwMiXiM/J9N3LbrXWIIgpx+NbL7j9n6IZQFPgvnBI04mwT3oddD6hY/0cXyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0MFn0SwmKvzqZy236PQ2mSoWTCxqLcQeT9u2UUqbkyA=;
	b=5S3Ck4GyPms+NPE4/W94wmXipxjZPjkyKwHKLz0mKpZX5OfQrG6frSwLEkSYfVkkyCoH
	 2m/9H+Ha3KClFv+jlCb3LEKst7smF1h++oxEQ//ozTemrSpUAF/3ig3ZMAVnNb/Vil/Xc
	 kmnpWqTiYiI7vXuxFg4JIEeWMK/c6PeySQ/0gIBomPxo6Q/G88x7O3F80FW3ReLWSaPIT
	 eIPi8xROW8Pk33xnhunqS53MjCDw0EL+VAdvMSL9XWa8GwyYovZJgMM62bjau164IxLlq
	 KH06ZrVZJELdPDqIktA/E+rqIbiTP/71gmaEmFXKyLE4jvCUPCwzCG7mhgHMQNzzrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=GLOISEcx;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E4606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=GLOISEcx
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2707914a91.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 03:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794741481; x=1795346281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MFn0SwmKvzqZy236PQ2mSoWTCxqLcQeT9u2UUqbkyA=;
        b=GLOISEcxuuLcfZm3ipE6Yaz28kG2F9MnHKZ8WannWzlZYobXfQaai7I6SvVfMrzrG8
         gIYBilr36Ol8RrhF6YZM87XMXWGHBhz/fpmWeZI0jUxxAIQzomG58Ypto1iDXbm1Tk7l
         0blAt8nfgJk54Op5A3GOE1CSGbmB2OP0EN/WPhSFwzHmCNIBOGADenUSmvy5uD6cN9Qz
         uS9W2+sNI69Oqf/vBwChph/xKeLYr7B24dGP2EeLWqKk15BI7GhLbQZXf1gcUiJXRz28
         xfFcPAxzXUuWwOmRSfaRObIVWjG/h+6kRmaNIId16Pc4N+NdcXSVo2WuD8Wfv4ZRI4Gd
         NobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794741481; x=1795346281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MFn0SwmKvzqZy236PQ2mSoWTCxqLcQeT9u2UUqbkyA=;
        b=Aq0pSSYIg7xyZ1XPc12Bs3YOQdZO+qUVtzUMvQslJL9T25dCAmCRlEAIlBXvwQmGyx
         oh5DAfkF4WQD/VGZslFxkSlRhherwdGBYpHEewIfZkWW2Wf8qKo9TJrKHQG6knOFMdCf
         NTQjGvhLQCzItkiy84f2zOalRapVmmZjxwarkv2mEM4vC/YTOHfMA5xmH86GzGUt3S8q
         lWbmlR9NwB2QXP2E4BoncWGu0BMMr125sHY6tHFKNtD2AmXlrMf2qmfbbyq78xQ5mwLW
         3K2nKWxIYYn6OciqUPmvWGbPSbKYTAY/82SKo0wD3nYT9Airlj/R979+XDDgshbN5lZG
         fIyA==
X-Gm-Message-State: APuU4Z/jKjGe1nMLaCnt/Kf3kOECXkx4FUeWKSPnu+xrtOvl3fW09jmr
	0FlTwaDUt/9W2KmxP6dfM1XLskx8gYUh+GlzUloeKV1nwUVILB7/ghWqeWHqpsxW3ZrrrQrbSU2
	QRPGKWnlL
X-Gm-Gg: AYBFou1+HmPWiNoaSPzb9qJ7jRL+GXnAtnu3CSAnmn/P05/42NiFA/ClJjNf58NedPd
	bq2KNTjpwx2jLYHDtdzyZZ38hoThBoO1xtZUwu7RwnKkc8lb3ZhKTqxwRXG/KxPzcs5rrgRHGDN
	ZIiBv4pel1eyLD6FJu0A8aXE/IhGREEQm2dXxD8kkFN4VIBfpWV+aJnR/7qewl8zYxT5gQefXqA
	IQEQPYz62Kz2YtcLgYrXJ3ardABCaaU1rVJxzR95/Ha7adQhTmvyifvz92psN3ZYCTkcrOnEy/1
	/1L5B1uXozVNdN7NFFxygyUEdO3ZMFTmMtXXyii8xHqLW5DV90H40ehaAQnfdGlgsyDoJMVf03/
	BdympiFpF9cWB+3qIgtszpLL2u2DfqXFW+ysDJhYR4DvEjP9rTfDTFtpAbsJD0wVVYKQojb5bEw
	xKjMejGE1gvSNo93Dw0t/+p6xrGkJUCgpQI+eXoj2/Ld4j7TAUswHvDD/I8vzmMOTYWJkb2aj1E
	+cmsCgba7XBppFLNTBzic8xgIQQqC0R2yk7lXNSETRAmQwxWoovrT5Sd8BrD4fhI1iMjpbSmoKk
	81Ybva/rY/aA3Onuk/Z6BMgisIro/VpIa/LA9EzXpWhApFv6i2MKDdr215mEfhMy0gbz7yWjuSc
	d/8eHHB9xqBCsJzDgNC9o
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr8216439a91.1.1794741480916;
        Sun, 15 Nov 2026 03:18:00 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdddc55efefsm2160435a12.6.2026.11.15.03.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:17:59 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net v2 1/1] ipv6: mcast: pass resolved interface to source update
Date: Sun, 15 Nov 2026 11:17:45 +0000
Message-ID: <43dfcc2e60579f68e436ade82bbd7ab7c727e250.1794738094.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794738094.git.zihanx@nebusec.ai>
References: <cover.1794738094.git.zihanx@nebusec.ai>
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

When gsr_interface is zero, the SSM join helper resolves the default
interface before checking for an existing membership. ip6_mc_source()
then resolves the route again. A route change between these lookups can
leave a membership on the first device while the source update fails on
the second.

Return the resolved ifindex from ipv6_sock_mc_join_ssm() and pass it to
the source update. This follows the IPv4 group-source path, which writes
the resolved interface back to the request before updating the source
filter. Both membership lookup and source update now use one route
selection.

The resolved-interface duplicate check also applies to ordinary ASM
IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP calls with ifindex zero. Such
joins check duplicates on the route-selected interface, allowing the
same group to be joined on another interface.

Source-filter operations with no membership on the resolved interface
may return -EINVAL; specify its ifindex to operate on a membership
elsewhere.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 include/net/ipv6.h       |  3 ++-
 net/ipv6/ipv6_sockglue.c |  5 ++++-
 net/ipv6/mcast.c         | 39 ++++++++++++++++++++++++---------------
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 3de07e738538..aa5f130eb9be 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1230,7 +1230,8 @@ void ipv6_sysctl_unregister(void);
 int ipv6_sock_mc_join(struct sock *sk, int ifindex,
 		      const struct in6_addr *addr);
 int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
-			  const struct in6_addr *addr, unsigned int mode);
+			  const struct in6_addr *addr, unsigned int mode,
+			  int *resolved_ifindex);
 int ipv6_sock_mc_drop(struct sock *sk, int ifindex,
 		      const struct in6_addr *addr);
 
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index 4b3536571c98..5253ddd6a248 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -166,15 +166,18 @@ static int do_ipv6_mcast_group_source(struct sock *sk, int optname,
 		add = 0;
 	} else if (optname == MCAST_JOIN_SOURCE_GROUP) {
 		struct sockaddr_in6 *psin6;
+		int resolved_ifindex;
 		int retv;
 
 		psin6 = (struct sockaddr_in6 *)&greqs.gsr_group;
 		retv = ipv6_sock_mc_join_ssm(sk, greqs.gsr_interface,
 					     &psin6->sin6_addr,
-					     MCAST_INCLUDE);
+					     MCAST_INCLUDE,
+					     &resolved_ifindex);
 		/* prior join w/ different source is ok */
 		if (retv && retv != -EADDRINUSE)
 			return retv;
+		greqs.gsr_interface = resolved_ifindex;
 		omode = MCAST_INCLUDE;
 		add = 1;
 	} else /* MCAST_LEAVE_SOURCE_GROUP */ {
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index ecef55f26189..3f2a431ea0c8 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -196,7 +196,8 @@ static struct net_device *ip6_mc_find_dev(struct net *net,
  *	socket join on multicast group
  */
 static int __ipv6_sock_mc_join(struct sock *sk, int ifindex,
-			       const struct in6_addr *addr, unsigned int mode)
+			       const struct in6_addr *addr, unsigned int mode,
+			       int *resolved_ifindex)
 {
 	struct ipv6_pinfo *np = inet6_sk(sk);
 	struct ipv6_mc_socklist *mc_lst;
@@ -207,25 +208,30 @@ static int __ipv6_sock_mc_join(struct sock *sk, int ifindex,
 	if (!ipv6_addr_is_multicast(addr))
 		return -EINVAL;
 
+	dev = ip6_mc_find_dev(net, addr, ifindex);
+	if (!dev)
+		return -ENODEV;
+	ifindex = dev->ifindex;
+	if (resolved_ifindex)
+		*resolved_ifindex = ifindex;
+
 	for_each_pmc_socklock(np, sk, mc_lst) {
-		if ((ifindex == 0 || mc_lst->ifindex == ifindex) &&
-		    ipv6_addr_equal(&mc_lst->addr, addr))
+		if (mc_lst->ifindex == ifindex &&
+		    ipv6_addr_equal(&mc_lst->addr, addr)) {
+			dev_put(dev);
 			return -EADDRINUSE;
+		}
 	}
 
 	mc_lst = sock_kmalloc(sk, sizeof(struct ipv6_mc_socklist), GFP_KERNEL);
-	if (!mc_lst)
+	if (!mc_lst) {
+		dev_put(dev);
 		return -ENOMEM;
+	}
 
 	mc_lst->next = NULL;
 	mc_lst->addr = *addr;
 
-	dev = ip6_mc_find_dev(net, addr, ifindex);
-	if (!dev) {
-		sock_kfree_s(sk, mc_lst, sizeof(*mc_lst));
-		return -ENODEV;
-	}
-
 	mc_lst->ifindex = dev->ifindex;
 	mc_lst->sfmode = mode;
 	RCU_INIT_POINTER(mc_lst->sflist, NULL);
@@ -249,14 +255,15 @@ static int __ipv6_sock_mc_join(struct sock *sk, int ifindex,
 
 int ipv6_sock_mc_join(struct sock *sk, int ifindex, const struct in6_addr *addr)
 {
-	return __ipv6_sock_mc_join(sk, ifindex, addr, MCAST_EXCLUDE);
+	return __ipv6_sock_mc_join(sk, ifindex, addr, MCAST_EXCLUDE, NULL);
 }
 EXPORT_SYMBOL(ipv6_sock_mc_join);
 
 int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
-			  const struct in6_addr *addr, unsigned int mode)
+			  const struct in6_addr *addr, unsigned int mode,
+			  int *resolved_ifindex)
 {
-	return __ipv6_sock_mc_join(sk, ifindex, addr, mode);
+	return __ipv6_sock_mc_join(sk, ifindex, addr, mode, resolved_ifindex);
 }
 
 /*
@@ -362,6 +369,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
 	struct net *net = sock_net(sk);
 	struct ipv6_mc_socklist *pmc;
 	struct inet6_dev *idev;
+	int ifindex;
 	int leavegroup = 0;
 	int i, j;
 	int err;
@@ -375,6 +383,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
 	idev = ip6_mc_find_idev(net, group, pgsr->gsr_interface);
 	if (!idev)
 		return -ENODEV;
+	ifindex = idev->dev->ifindex;
 
 	mutex_lock(&idev->mc_lock);
 
@@ -386,7 +395,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
 	err = -EADDRNOTAVAIL;
 
 	for_each_pmc_socklock(inet6, sk, pmc) {
-		if (pgsr->gsr_interface && pmc->ifindex != pgsr->gsr_interface)
+		if (pmc->ifindex != ifindex)
 			continue;
 		if (ipv6_addr_equal(&pmc->addr, group))
 			break;
@@ -497,7 +506,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
 	mutex_unlock(&idev->mc_lock);
 	in6_dev_put(idev);
 	if (leavegroup)
-		err = ipv6_sock_mc_drop(sk, pgsr->gsr_interface, group);
+		err = ipv6_sock_mc_drop(sk, ifindex, group);
 	return err;
 }
 
-- 
2.43.0

