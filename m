Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554310;
	b=eHdbV341bNSzqtyX0syk1hCsSkYAsJF0KHzeCnAq2CXGUvDayiwIqxQ1ct3H+wPdDEgk
	 PDuoEwu5Sivtbd35iSWUgXcHe9B7WnJs/g4NDp4r+ng+4DsyU7f4Y1VP+GXzQPDIV/mJm
	 FXXE7b7eoLKknVAZDxA1W6p3RiPDnISLbX2821VMFRUT45CCMn1O3ORSkZhM3+aWZ3rZA
	 FqD/WBmT/Y1INHY2F6j75JBqgm8vcrMedcdjcJC4hj8pkB3nYlXHlRyE8lT3I1NFKqYm9
	 WJSDT/U/5QLEPZXDhhJ4RpJFPGuzgkhV5maSKfxTVba6TW3DrbfZvikW+D4Ayahf25g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pkpq8GK0gZhArObYbGxp6BFjgE9VIEQP5FZ3dfj6SyI=;
	b=jKyjJExAzjd05uty6v9I/VAfYuUe+X0mjfXxaJKoY6q6nTv/dYy5qXdj1N0w++ecs3rd
	 6x54R6ns/WoIxizuAbkWbhra9TqJKdOAS4d9uHelzFR+r6BJPFMWqHCyYVwN9aKdXNG/f
	 qVcSr11vdn49VM89j45O5vGuMbizJDkOyhimJnK/E2bEbbr6n4lRvIx0fB78/pgrnIB3J
	 5kzDy5wPRPBlGfNurtOCf6t0v4xoFb/317/aWXA1BuU+EykjvDsUMBhNMLJ49WNzxEwkY
	 7C3MPIsP/UCUHW7VCBBPPC2+axxPS/d+ciMfrr+R1ycgBJDPxkA/9MD7RDK26xxyzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="TY1/C6MC";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1B7606A68F
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1B7606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=TY1/C6MC
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b563e32936so1231772c88.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795554309; x=1796159109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkpq8GK0gZhArObYbGxp6BFjgE9VIEQP5FZ3dfj6SyI=;
        b=TY1/C6MClitj3g7ZFW8jz1IBUox0fftxB68Lv2pLQEPfo3k+LnsCT0m4x90lxryPGY
         bQtrKyS3s1EOtgdj2HDepS2YwikFjB0BpYZkK+mDMukbVENqnnE1YytNB/Wp2uKa229f
         1OL6U0He+djX+9JkuDaDexNzrdlAuAjmJaSwoDnWsaELKKSKLD1lLNyiwS2PrBCyMWQl
         00wLpPo1fkPK8jg67CXFzAKh/5mOdL9zJHYD535CgsygjMymtd2MctTa/KxQvzsxpQ1d
         QvInikWTR9I9IcX5vjtaC4w5lQKQUb20oqVr//IsOS7u9ffjAP6hZMhmRR7ddOMiug7L
         767Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554309; x=1796159109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkpq8GK0gZhArObYbGxp6BFjgE9VIEQP5FZ3dfj6SyI=;
        b=QDDu6Kp6oiNV5+iGnRkTGOKsg8AfiZltdetVAvwA/lH3bZ+wHCFee7olXXeHELKRRW
         Jm1afxvqZ9iy+qt9m8M6yd7rGFysi95x1JjwIbVJ8QzzZTfnt71593dgLpyjkEZXOj1t
         LDjNCs2/hboRnXCAzxLTBd75JrUUfhcGIAbwluKxb4DFiAIqhQz91hQ7VpxSDlbt3qEe
         YkO4mb5xHBHd7HdWUtDxgDmvrTyj0PL13JSdruPACxTUNBB+Vut5O0JhFOMZLvxrLtEU
         BRjWpe+K1+SrJjL0l4wuFGCG720hvu+wbuHw1VKhXgf8knSoophk0PXPfZjv5wKcolaV
         eZ2g==
X-Gm-Message-State: APuU4Z+U6/0JTj96MHr3ETMxJSLF8sULfjWeA+s+lhodIGcLXrnS7CDP
	4cuYGYZoJruFX5bnk5Dh2uZhAfviaCRhHg3UOlBZG/gTa5QaaftENGQpVArYLF3xUmPe/jAGQX9
	bhC4oTjo=
X-Gm-Gg: AZFdTZdpNgPnQBh0+jXKEMG1d95Ee/wvzW7ZvwB7XRHMzOE7nwS8mW2l/Ttm1/T8d3j
	qqg/QTR59X73AGn5h4luMEwC04O2EwpoXL9aca82fRhlqbaswAkBYrzcomjj0SGjYSVCQO61Z55
	LSSXNL34kefupHUB6KJJF5PaYnfT2PxlWlNK9e9/G/xD5s1WmRzbHTMbpDAMb9wUdUP8A5A8rhC
	wmkLXA6nAD/wu8tb/HQIFIi0PXTETbupbPBX78BYO7SJMwJW31jCBrONgVShLCEk1cKjnpelL2v
	0RiHDCHyH8OEDWOTbvbhGw5kwS3tMNkj+0JYcPbZl1XIBNP4pwyC2ighB75Avo/wfaMm8Ru+zzu
	V1oRmpOEzDFf1LhbBXxk2l/3hQri0qq+j7ruwT6eShOq0L+dQ7EFrW6uq/b1xNr4kLUDKopmnIE
	L3E8+4cYIksLy2u7ze3ccvjKTNzRChWiuYKWv1oqkvwVkDqJFxt3rcamA8eTyzoXlcN2KUvFlkP
	eloHiChOVwJMDr+ABkSMyTAGhbquJ9z/VCcXFDG4sH8f3yvdsveQTDL4Xm82atiJo6KLE7CCkPh
	lwo2w0OX9zoQQureyLo0nK3Dhbe6wsrVCAnjDIpo824RzA0qeLtLJUdnkGqVKwt5wCMQkSyL4An
	lB/nXhzFGh4Fr4bvsMbBgCDQH8scQ2UlShTvVQOKPJCPn1DzqsQtzaFRXr5L+iqjhxHdMq01q
X-Received: by 2002:a05:7022:ea8d:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b5567c02b5mr15256299c88.5.1795554308666;
        Tue, 24 Nov 2026 13:05:08 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm5577813eec.17.2026.11.24.13.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:08 -0800 (PST)
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
Subject: [PATCH net-next v4 3/3] amt: make the per-tunnel group and source limits configurable
Date: Tue, 24 Nov 2026 21:05:01 +0000
Message-ID: <20261124210501.70394-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124210501.70394-1-omar@blockcast.net>
References: <20261124210501.70394-1-omar@blockcast.net>
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

The group and source hashes keep their AMT_HSIZE (256) buckets. Sizing
them from max_sources would push every group node and tunnel node into
kmalloc-8k once max_sources passed 2048, doubling per-group memory; at
4096 sources in one group a chain averages 16 entries, which only makes
a lookup longer.

Raising the limits also raises the previous patch's bound on the work of
one Membership Update, twice what refreshing every group the tunnel may
hold costs: about 2.0 million bucket and source visits at 512 groups and
4096 sources, 17 times the default 120,320. Cap it at what one
legitimate report can cost. A host splits its report to the MTU, so a
report names at most mtu / 8 groups, IGMPv3 records being the smallest.
On a 1500-byte stream link (relay MTU 1460) that caps one Update at
about 416,000 visits at the ceilings, 3.5 times the default, above the
roughly 348,000 that the largest legitimate report costs. The defaults
keep the previous bound. A report larger than the relay's own MTU, from
a gateway on a jumbo link to a relay on a standard one, has the records
past the bound ignored at high limits, as an over-budget report already
does.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 48 +++++++++++++++++++++++++++++++---------
 include/net/amt.h        |  9 ++++++++
 include/uapi/linux/amt.h |  8 +++++++
 3 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 177bc0b..fd907eb 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2167,18 +2167,33 @@ static u64 amt_rec_cost(const struct amt_dev *amt, u32 nr_sources, u16 nsrcs)
 	       (u64)AMT_REC_LOOKUPS * nsrcs;
 }
 
-/* The most work one Membership Update may cause: twice what refreshing
- * every group the tunnel may hold, with every source, costs.  The packet
- * length used to be the only bound, and a report that names one full
- * group many times costs far more than one that refreshes the whole
- * tunnel.
+/* The work of a report naming @recs groups, each walked in full, plus two
+ * passes over every source the tunnel may hold and a lookup per source.
+ */
+static u64 amt_report_cost(const struct amt_dev *amt, u64 recs)
+{
+	return (u64)AMT_REC_WALKS *
+	       (recs * amt->hash_buckets + 2 * (u64)amt->max_sources) +
+	       (u64)AMT_REC_LOOKUPS * amt->max_sources;
+}
+
+/* The most work one Membership Update may cause.  The packet length used
+ * to be the only bound, and a report that names one full group many times
+ * costs far more than one that refreshes the whole tunnel.
+ *
+ * Twice what refreshing every group the tunnel may hold costs, but never
+ * more than a report as large as this device's MTU can legitimately cost:
+ * a host splits its report to the MTU (RFC 3376 s4.2.16, RFC 3810
+ * s5.2.15), so one report names at most mtu / 8 groups, IGMPv3 records
+ * being the smallest.  The second bound is what limits the work at high
+ * IFLA_AMT_MAX_GROUPS; at the defaults the first is the smaller.
  */
 static u64 amt_report_budget(const struct amt_dev *amt)
 {
-	return 2 * ((u64)AMT_REC_WALKS *
-		    ((u64)amt->max_groups * amt->hash_buckets +
-		     2 * amt->max_sources) +
-		    (u64)AMT_REC_LOOKUPS * amt->max_sources);
+	u64 recs = READ_ONCE(amt->dev->mtu) / sizeof(struct igmpv3_grec);
+
+	return min(2 * amt_report_cost(amt, amt->max_groups),
+		   amt_report_cost(amt, recs));
 }
 
 static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
@@ -3583,6 +3598,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_MAX_GROUPS },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3591,6 +3607,8 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_MAX_GROUPS]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_GROUP_LIMIT),
+	[IFLA_AMT_MAX_SOURCES]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_SOURCE_LIMIT),
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -3657,8 +3675,10 @@ static int amt_newlink(struct net_device *dev,
 
 	spin_lock_init(&amt->lock);
 	seqcount_spinlock_init(&amt->key_seq, &amt->lock);
-	amt->max_groups = AMT_MAX_GROUP;
-	amt->max_sources = AMT_MAX_SOURCE;
+	amt->max_groups = nla_get_u32_default(data[IFLA_AMT_MAX_GROUPS], 0) ?:
+			  AMT_MAX_GROUP;
+	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
+			   AMT_MAX_SOURCE;
 	amt->hash_buckets = AMT_HSIZE;
 	amt->nr_tunnels = 0;
 	get_random_bytes(&amt->hash_seed, sizeof(amt->hash_seed));
@@ -3774,6 +3794,8 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(__u16)) + /* IFLA_AMT_GATEWAY_PORT */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_LINK */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_MAX_TUNNELS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_GROUPS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_SOURCES */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_DISCOVERY_IP */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_REMOTE_IP */
 	       nla_total_size(sizeof(__be32)); /* IFLA_AMT_LOCAL_IP */
@@ -3804,6 +3826,10 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
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
index 82aaa6b..fa3a61d 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -392,6 +392,15 @@ struct amt_dev {
 #define AMT_GC_KICK		2048
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Upper bounds for IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES. Gateways
+ * drive these allocations: at the bounds one tunnel holds about 2 MiB of
+ * group nodes (each a kmalloc-4k object with AMT_HSIZE bucket heads) and
+ * under 1 MiB of source nodes, and max_tunnels multiplies that.  The work
+ * one Membership Update may cause is bounded separately, by
+ * amt_report_budget().
+ */
+#define AMT_MAX_GROUP_LIMIT	512
+#define AMT_MAX_SOURCE_LIMIT	4096
 /* Per group record, an upper bound on the passes the mode handlers plus
  * amt_cleanup_srcs() make over a group's buckets and sources, and on the
  * hash lookups they make per record source.  The handlers need at most 5
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index 2dccff4..a106d7a 100644
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

