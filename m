Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391853;
	b=PCf3zIxXzbfn678tMtctR2PLb/TUTF/L0tHjKIqTB7og/1BtiupSEqfTiQ/Pi6CMMbc1
	 WhboIMCX6BY92pWtQjLYNAv9dip7NIYTDXlXaUXSgomYZTHxwRrLc8uDBd5C8SdWsNQRA
	 lGAoW6HAWzmWCao8BHnNd6zpXxVUyBXVLbXEE8TrbcAo3z2X+V7P5fy+AU6hOeGWAMGAy
	 Epo7ULgkkmFvmVk21+6UbnNOU0txJEgDfyLXNhq2Fr4MXjxudHTZcZL0FQUmi2NR6Kpqv
	 Ann/rufxx83yhSdvUZN0JLKn3r1EIPA6gBobPml5cUFFFpp4YDu5fNUPVoIPiJD6WkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
	b=TBh40iB8g+JaiVFDOMlWsbyCh6u4xrgXVGYh9bEaYd4tNWtKs/DpYt8/KPyEml1x9oyq
	 J+7hl5FyNUzuFFDCPfdBIq1EDWVEw3W6p3+VuAxI1dEvUr6Ujm+fqE0ViMbnk6aR/3t2Z
	 hQCh6qHmvIrTC77vLMg2vmKMgctkD9OA39QoD6huyMAZ52XJZTEV1AjFRCv7kTFjOymbq
	 o1UPFZ4xiVKkLZ6P9a9c80Ewif0gEF3I5yoexQRKJSdrnX0vkoX4aD0HBJVLhKgrxrGng
	 kiezJNL53BNSHly8+VZfJovZpzqEDTmxpCNnQQtZFJ5aaAx7A7DqtCOHHgmB0RJkxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Pb2Oilg7;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4833606A697
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4833606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Pb2Oilg7
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so814743c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391852; x=1795996652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
        b=Pb2Oilg7pSU+FcXuYQsHj5y2eCCaT7hcox/M/7+2XQfZUkqwrk8U7rHEHGz0KWG4YU
         K+TpC4flg9W6+buOW7ybhrq1Yoz75+qRnwUNqq7qgm5BSH+pknOz80JVzX0fURvdluW/
         /a7RBJV+xkMENyFFgoGPASLHLgfbXy9u+fIwbT4bpe6M6/u5+NyBXAfzA17JHXcXOzwz
         Hlde7X+LcNlZvtyhTxuCJpuDBu7+CEEO5HWtGt7mXR5n/aMyJGimYepexwF98QwQs+kk
         9Ww5KOf6BmYqyuXMTtN1cs8fGzSDcbg0VLE4PweqpQqvOTJuo86PiyGQNEzIv9taCTJ0
         Mx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391852; x=1795996652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
        b=e8pR4JOeLvaeCgBvqRptnH3n8GqZYlneg+44Kdq7W8OE/ojt26aRks1ZBEaic2blXS
         M1LpjlOnARShKCVSJt9OPTaHymBGVA2UEDUujqPoJ0KXX4FYc3z/EXOBofncHQWwBQ4R
         uxEVVuHJwawCX9jZ5ybkL+4pzpRZrPFRUXcdcNhFrTU4F+b4crV+GT3H1/O++rz5rJMh
         jQrbFbknMDh0Tmch9SVuiESLlmPsX/Q5KlZttTeil33rLTIGMfuHWwuGvgYbGTry38pq
         Db7pxMHnG1oEMdtriWw9Bawu/Av6MTMipGcf4pg8sIuQskV9NRJzazEHm2zCNy+PuljZ
         f7Fw==
X-Gm-Message-State: APuU4Z+0VT/sxcwLwVx5KswOwAe3NtZn2lqQU7IgMxRiPnzj7L5LCG0+
	KxWXGZ3aB5aWrZIq0kzb333DVYbFSYplBbeuvHvbkMlCHi2XfkzN6pycyB12/74tyMc=
X-Gm-Gg: AZFdTZfHGGZMJn7CP932BdnToLAjQBqyMLKxtDI41fy7evlA3rAlqko36sraOXr+aff
	L1j3x8hi5Wp6W5ZjxRYCjKouHTZzum8fQV1Wh7goflFZwtFwqmNVrKgS5jH0OHaTNNa2FZw+/OS
	UWNEIlH67JiJHJnmPR0xaGe7Bfu4o9HZD09UyjJPNG+MWnLZm16pu+qrZ5fLRehONatHs8aIB+e
	iWjF0rXnR3y86ncwGtf0TF1WIIe2Qb+7JL2AJ7AgVDTUVUJ0vjCBZLmxsjIyGa2tnPmG9mL9Kpb
	aJQSmgciDsDqnYg2Y9cxX4NTi/I+TW8orTh6ktdRx3vl3p3dxT/Q51M783nvq+z2NUDr7nuEJt/
	SNPuIXk72PWhMlYgNErDq5j7BiNJZRqucJxdTj8dkPg0so8YNoda1iRMZVTyDdtGz6S6f4AVWEa
	bBmlde0KmU40vWfnqx5EOvP+HHCqCaEq5YBKU7B7uFgbPNclcdaQ/BzMnTEb/XIMML+UPaIPITW
	vzP5H3KwhnYfRMcCPC3+k1n5RvUooIUokwS65miODTMpls2LtNMeyQnQ6JZZQajQghVcxXWuZS8
	srjSod/qVljNTBDxL2Yh3Ehr3YYUEBCDutFkM42ue/AOSL1GDn+pDKulfKuzanxP0U8bOh9bin8
	7h1ZVguP/SdGV2Whqls3cZ+GKD3ldwEHl07ZvnULwS+1jfBga5jQbx1UXICSZTLmh6lL5XrBS
X-Received: by 2002:a05:701b:2616:b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b5568e0a27mr9374716c88.19.1795391851945;
        Sun, 22 Nov 2026 15:57:31 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:31 -0800 (PST)
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
Subject: [PATCH net-next v3 2/3] amt: bound the source-state work of one Membership Update
Date: Sun, 22 Nov 2026 23:57:23 +0000
Message-ID: <20261122235724.2898320-3-omar@blockcast.net>
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

The relay applies every group record in a Membership Update under
tunnel->lock in softirq, and ip_mc_may_pull() is the only bound on how
many records it applies.  Each record walks its group's hash buckets and
sources several times, so a report that names the same full group in
many short records costs far more than one that refreshes the whole
tunnel.  At the current defaults a 1.5 KB Update of about 180 empty
records against one group already walks the group's 256 buckets over a
thousand times.

Charge each record for the passes the mode handlers and
amt_cleanup_srcs() make over its group and for its per-source lookups,
and stop applying records once the total exceeds twice what refreshing
every group the tunnel may hold, with every source, would cost. A report
that refreshes the tunnel's whole state uses half the budget; one that
exceeds it is truncated, as a lost report would be, and the next
periodic report restores the state. A record for a group the tunnel has
no room for does no walk and is not charged, so records the relay
refuses cannot use up the budget and truncate the same records from
every report.

Found by review (Sashiko, on the limits patch); not triggered at runtime.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 include/net/amt.h |  6 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 79d68bcc7..177bc0b7c 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2157,6 +2157,30 @@ static void amt_igmpv2_leave_handler(struct amt_dev *amt, struct sk_buff *skb,
 		amt_del_group(amt, gnode);
 }
 
+/* The source-state work one group record can cause: AMT_REC_WALKS passes
+ * over the group's buckets and sources, which add_srcs may grow by nsrcs,
+ * plus AMT_REC_LOOKUPS hash lookups per record source.
+ */
+static u64 amt_rec_cost(const struct amt_dev *amt, u32 nr_sources, u16 nsrcs)
+{
+	return (u64)AMT_REC_WALKS * (amt->hash_buckets + nr_sources + nsrcs) +
+	       (u64)AMT_REC_LOOKUPS * nsrcs;
+}
+
+/* The most work one Membership Update may cause: twice what refreshing
+ * every group the tunnel may hold, with every source, costs.  The packet
+ * length used to be the only bound, and a report that names one full
+ * group many times costs far more than one that refreshes the whole
+ * tunnel.
+ */
+static u64 amt_report_budget(const struct amt_dev *amt)
+{
+	return 2 * ((u64)AMT_REC_WALKS *
+		    ((u64)amt->max_groups * amt->hash_buckets +
+		     2 * amt->max_sources) +
+		    (u64)AMT_REC_LOOKUPS * amt->max_sources);
+}
+
 static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 				      struct amt_tunnel_list *tunnel)
 {
@@ -2167,6 +2191,7 @@ static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 	union amt_addr group, host;
 	struct igmpv3_grec *grec;
 	__be32 saddr;
+	u64 budget = amt_report_budget(amt), work = 0;
 	u16 nsrcs;
 	u16 ngrec;
 	int i;
@@ -2194,6 +2219,20 @@ static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 		memset(&host, 0, sizeof(union amt_addr));
 		host.ip4 = saddr;
 		gnode = amt_lookup_group(tunnel, &group, &host, false);
+		/* A record for a group the tunnel has no room for does no
+		 * walk, so it is not charged.  Charging it would let a host
+		 * joined to more than max_groups groups lose the same tail
+		 * records from every report.
+		 */
+		if (!gnode && tunnel->nr_groups >= amt->max_groups)
+			continue;
+		work += amt_rec_cost(amt, gnode ? gnode->nr_sources : 0, nsrcs);
+		if (work > budget) {
+			netdev_dbg(amt->dev,
+				   "Membership Update over work budget, %u of %u records ignored\n",
+				   ngrec - i, ngrec);
+			break;
+		}
 		if (!gnode) {
 			gnode = amt_add_group(amt, tunnel, &group, &host,
 					      false);
@@ -2335,6 +2374,7 @@ static void amt_mldv2_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 	union amt_addr group, host;
 	struct mld2_grec *grec;
 	struct in6_addr saddr;
+	u64 budget = amt_report_budget(amt), work = 0;
 	u16 nsrcs;
 	u16 ngrec;
 	int i;
@@ -2362,6 +2402,20 @@ static void amt_mldv2_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 		memset(&host, 0, sizeof(union amt_addr));
 		host.ip6 = saddr;
 		gnode = amt_lookup_group(tunnel, &group, &host, true);
+		/* A record for a group the tunnel has no room for does no
+		 * walk, so it is not charged.  Charging it would let a host
+		 * joined to more than max_groups groups lose the same tail
+		 * records from every report.
+		 */
+		if (!gnode && tunnel->nr_groups >= amt->max_groups)
+			continue;
+		work += amt_rec_cost(amt, gnode ? gnode->nr_sources : 0, nsrcs);
+		if (work > budget) {
+			netdev_dbg(amt->dev,
+				   "Membership Update over work budget, %u of %u records ignored\n",
+				   ngrec - i, ngrec);
+			break;
+		}
 		if (!gnode) {
 			gnode = amt_add_group(amt, tunnel, &group, &host,
 					      ETH_P_IPV6);
diff --git a/include/net/amt.h b/include/net/amt.h
index f36efcdd9..96357b3e3 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -392,6 +392,12 @@ struct amt_dev {
 #define AMT_GC_KICK		2048
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Per group record, the most passes the mode handlers plus
+ * amt_cleanup_srcs() make over a group's sources, and the most hash
+ * lookups they make per record source.  See amt_rec_cost().
+ */
+#define AMT_REC_WALKS		7
+#define AMT_REC_LOOKUPS		8
 #define AMT_HSIZE_SHIFT		8
 #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
 
-- 
2.43.0

