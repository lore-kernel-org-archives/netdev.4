Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391854;
	b=u3ECR0SdEZd85CGrRbZ8EanVCDCDxkNcerwpyBrzsGksc/8krSwekxmJSfdQzi7HnW8i
	 5k28cqe2t9Edalacviy0AO7BAnWF6YGKmVHL3CgyOvupUQiDSz70pfeIe2T/ZIM88NVkQ
	 HgFRkiwgPB7Qo/MC3e1qd+XircwCnuKZnSgjwf5Y11U6G8pKdYEeAeH1NNW+9UefVvmfa
	 zYJsDZZHe1r1rIzaAxyjRcv1ebfXlLrIo0TeSwNa3q/Px7BqPhnYwts3fxuSjLcQfqjxZ
	 0QPT193vZzfdVukkghUeBo+/jia0pEfBvMUC98I7d7jL9eeF9VfkxD9X3FlvM2eQYSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NW/1Frfb7mXCSDL0SysKw7qO5sxKBEHZ2YmPtDESfGU=;
	b=cfZQ6vHdiGxBD/DKnWTA1O81zJu2B3zLc+sgSeRDr+HWqoyCR+sjrAS1U8IHCwcNk41x
	 76dVDZxBZMIWjoOg9rLsTUZKkmWp7hN9S0i881XCaR7uPNgz2dF+cWsc0Hb9jeDqZpijK
	 rCLqZyMxX+a8kVvbs9WqyIE+7W+ycpUAWuEQnmyoWN1rNKzWQceIBntp11CzFGwjcG7Qw
	 4QE8pOgDXrKUc/vXZ00dxrO6d4i14eUrlYw47XSPQuTp+sXr+wKodWsKBGz0nTWs6AQAf
	 M/joy69tw+BZJf6L6B+s3llwfBZ6TyJiCc19V4g72ps/G+0pcJ0PMrGFza3Y7kXD4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=kl79WiDc;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937A606A6B2
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4937A606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=kl79WiDc
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so814807c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391853; x=1795996653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW/1Frfb7mXCSDL0SysKw7qO5sxKBEHZ2YmPtDESfGU=;
        b=kl79WiDcKoleDENYg2th4u+H4KlC8X/WaKf7NV5o30pnE9MXZHo4kVNTvlE+rOsZYf
         d8VS65fzY+jQVwnUb6Qxg0XXUOBjfWJpO66SsHiEJR1Z3eOErnUUaEnojaJFAwL/NUXJ
         VX3Ahu/cTn4yqMCApiMumU6mu5kjsMbiHMtqvweFmyBd3INyibP8HH+866OdvXpZNMJl
         MzMDUPjBsywWKhuX2pS7Z217H9PNXDkO6dHNdXtBX5t2Qb99e6tHIl2wYnXQKHFDJIN6
         0jAZ6gn4ssajloAp4bgRxOU8sXSWLpYqQ7uzs0D3IuR3usYMDaqvGRZAlO2Vrf2tuvgU
         RMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391853; x=1795996653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NW/1Frfb7mXCSDL0SysKw7qO5sxKBEHZ2YmPtDESfGU=;
        b=2KwIzaJZdqIUOkYC+THywopbyVZZssVXFxbd6hjXRSAfhCBxPMppkSwbMBrEVAoiE/
         Zx+K1bmlPDQKNA+U4DbzdBCbTw6plKFgaLAI8aC2euijxnvFmB9EH/h1veLJCE9d86y0
         X1AOXCve+OPjPnmdR9PpYSGgCpKGB/rP9Et2ufjJeNXwLCAeNCpzuETpUKj1IW58z+fd
         +B8OQHcZghVf317FNm+rT77SlEGc63cseefsjLeGhoMbYJJiUVIKLvqu+Bbpy10zRC6w
         Zr3OV4V1uPIZXQhT1gcN5zD+1/7FlLP5T15+44HWSb7SGEpIxN4V9Dw+e2TUe8AutV1H
         9w0Q==
X-Gm-Message-State: APuU4Z8tg6tA8r6PDpcprQiBuOV8mpeTHHRoS8B2g9otrGg42EBzCNhs
	FxAhmRk/tCpzNMaWgFoe+/b+3lR84Ujrv3oGchNqzIDy4sIAjI34Jwsiou28/UXWXWE=
X-Gm-Gg: AZFdTZfCDTSbNgUI0CAkNX8Zdt+Zy3WaPcYyQ5OHAtM81v3B6dWcOcphEEMkorDMNS0
	RoyekA3zMXoQ7JdgcG/8VYYM8DRR1oKYxlL30OXPDJ1/SQgWqZGhLzXyEH4+uur7I9gvN4ExAmP
	nBSCpkmdmb7GO+LnJPQD9SrmUgKBFquzU42ISvs3eTESZzfpwcFbfJmxHe5FqxdkfGJUwDe5hrk
	mbKdo1FBz3I+xFeEwXOgXWVeHyZcu5gX27Yf+uH/Qnoq1MoIyWM5Lbkze+KRs4L1PS9gkg1rr84
	6ChtQOj/mts8KQzF6I3g/36yEY/waiR/GsMELC/FM+Q1UEpp3H3atoqIvCkC4queBBHJnZB8eWq
	J/0VKqfg0k6rxYbZRVVQHTXxZu8BzqBoBgpKB5TZWQzut6GbDAzcLJnuRoWA/64mDKIB/pOXEjZ
	aRj39RY43wE4NJJ/RN76YPXAljh6DxQlBmLB3LGp4Ji34v4n/tfTDOoyI2Smsa5PeM0hy3U4Ji5
	eYA+yL0J8fgzGKVtHI4nX66mZdlkG4d0UkMVPljDDn4szVSM/8aCNM6YYemoENRQKQIG7yJwuyP
	RLhEvLhrkcGecJ87s/Xv+a2dkapNiYZgWV3Yh6waz9QdQIZc9QEb4Vbpx9bn/wlcQupM7DBbTyO
	6wwH05hE73SYVBi3Jw11+MC0Zjmth7Qbl++uI4EiMVoYvzFGWlFk=
X-Received: by 2002:a05:701b:2313:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b5568b31admr9709668c88.9.1795391853529;
        Sun, 22 Nov 2026 15:57:33 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:32 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v3 3/3] amt: make the per-tunnel group and source limits configurable
Date: Sun, 22 Nov 2026 23:57:24 +0000
Message-ID: <20261122235724.2898320-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122235724.2898320-1-omar@blockcast.net>
References: <20261122235724.2898320-1-omar@blockcast.net>
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

A relay caps the state one gateway tunnel can hold at AMT_MAX_GROUP (32)
group records and AMT_MAX_SOURCE (128) source records, counted across
all of the tunnel's groups. Both are compile-time constants. An SSM
receiver uses a source record for every (S,G) it joins, so a gateway that
needs more than 32 groups or 128 channels through one tunnel has the
excess joins dropped, and the relay operator cannot raise either limit.

Add IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES, read when the link is
created, like IFLA_AMT_MAX_TUNNELS. Zero or an absent attribute keeps the
current defaults. Gateways drive these allocations, so the policy caps
them at 512 groups and 4096 sources per tunnel, and strict_start_type
has it validate them, and any attribute added after them, strictly.
Report both limits in amt_fill_info().

Size the group and source hashes from max_sources instead of the fixed
AMT_HSIZE: one group may hold every source of its tunnel, so at 4096
sources 256 buckets would mean chains of 16. Grow hash_buckets to keep
at most eight sources per bucket, from 256 up to 512 at the ceiling.
The defaults are unchanged.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 21 ++++++++++++++++++---
 include/net/amt.h        |  7 +++++++
 include/uapi/linux/amt.h |  8 ++++++++
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 177bc0b7c..01b3a8cab 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3583,6 +3583,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_MAX_GROUPS },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3591,6 +3592,8 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_MAX_GROUPS]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_GROUP_LIMIT),
+	[IFLA_AMT_MAX_SOURCES]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_SOURCE_LIMIT),
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -3657,9 +3660,15 @@ static int amt_newlink(struct net_device *dev,
 
 	spin_lock_init(&amt->lock);
 	seqcount_spinlock_init(&amt->key_seq, &amt->lock);
-	amt->max_groups = AMT_MAX_GROUP;
-	amt->max_sources = AMT_MAX_SOURCE;
-	amt->hash_buckets = AMT_HSIZE;
+	amt->max_groups = nla_get_u32_default(data[IFLA_AMT_MAX_GROUPS], 0) ?:
+			  AMT_MAX_GROUP;
+	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
+			   AMT_MAX_SOURCE;
+	/* Keep source chains short when one group holds every source:
+	 * at most eight sources per bucket up to AMT_MAX_SOURCE_LIMIT.
+	 */
+	amt->hash_buckets = clamp_t(u32, roundup_pow_of_two(amt->max_sources) / 8,
+				    AMT_HSIZE, AMT_HSIZE_MAX);
 	amt->nr_tunnels = 0;
 	get_random_bytes(&amt->hash_seed, sizeof(amt->hash_seed));
 	amt->stream_dev = dev_get_by_index(link_net,
@@ -3774,6 +3783,8 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(__u16)) + /* IFLA_AMT_GATEWAY_PORT */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_LINK */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_MAX_TUNNELS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_GROUPS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_SOURCES */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_DISCOVERY_IP */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_REMOTE_IP */
 	       nla_total_size(sizeof(__be32)); /* IFLA_AMT_LOCAL_IP */
@@ -3804,6 +3815,10 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
 			goto nla_put_failure;
 	if (nla_put_u32(skb, IFLA_AMT_MAX_TUNNELS, amt->max_tunnels))
 		goto nla_put_failure;
+	if (nla_put_u32(skb, IFLA_AMT_MAX_GROUPS, amt->max_groups))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, IFLA_AMT_MAX_SOURCES, amt->max_sources))
+		goto nla_put_failure;
 
 	rcu_read_unlock();
 	return 0;
diff --git a/include/net/amt.h b/include/net/amt.h
index 96357b3e3..296570fec 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -392,6 +392,11 @@ struct amt_dev {
 #define AMT_GC_KICK		2048
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Upper bounds for IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES. Gateways
+ * drive these allocations, so keep one tunnel's worst case to a few MiB.
+ */
+#define AMT_MAX_GROUP_LIMIT	512
+#define AMT_MAX_SOURCE_LIMIT	4096
 /* Per group record, the most passes the mode handlers plus
  * amt_cleanup_srcs() make over a group's sources, and the most hash
  * lookups they make per record source.  See amt_rec_cost().
@@ -400,6 +405,8 @@ struct amt_dev {
 #define AMT_REC_LOOKUPS		8
 #define AMT_HSIZE_SHIFT		8
 #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
+/* hash_buckets grows with max_sources up to this, see amt_newlink(). */
+#define AMT_HSIZE_MAX		512
 
 #define AMT_DISCOVERY_TIMEOUT	5000
 #define AMT_INIT_REQ_TIMEOUT	1
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index 2dccff417..a106d7a07 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -54,6 +54,14 @@ enum {
 	IFLA_AMT_DISCOVERY_IP,
 	/* This attribute specify number of maximum tunnel. */
 	IFLA_AMT_MAX_TUNNELS,
+	/* Maximum number of group records one tunnel may hold.
+	 * Zero or absent means the default of 32.
+	 */
+	IFLA_AMT_MAX_GROUPS,
+	/* Maximum number of source records one tunnel may hold, counted
+	 * across all of its groups. Zero or absent means the default of 128.
+	 */
+	IFLA_AMT_MAX_SOURCES,
 	__IFLA_AMT_MAX,
 };
 
-- 
2.43.0

