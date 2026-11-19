Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092727;
	b=L/kuvc3qcW1IICpgKtG1SQP6k8h/2J8v9lIIw7nDqceg4t8X9Xb9UZMxF1kCHIxyZ5aC
	 f5x6AP+arW1dGR6jGZif+V6o8p1GzZI9pnV1fzk1VIy6PIET6tA996bELSNUEy3vX8Hzj
	 aK4TFCc7LOojYLZfcDHRnISpLVRiuXW38YVwZTUvjEbIOqusWAGRcRk9NEs6rtAmXw3ss
	 0V1mjox0pGbphtBZXCm5x1gdt2T4UVTEYVeHy9LuJ4s/SNipoNkFAA1pdJ+de7elpyKG2
	 UsloCRQa85Q8wZD1mh0Hc6MkjwuwEBDoYOoik00joCU1KwzyXfPkHq54ubykEd/O7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092727;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=71i+6QmMWBr6xdnxXs1YG/oXksyIqockWxgvr0zhSMM=;
	b=qnlxL3FKD/OFjn04F2gs7QVoOuCAcdO0P6kBdsyF+sEBMU8BWaFDHr0RYeGCROpcU/Wp
	 4kmsOPwCDAnfzt6QiXr356k1OPc9LgwyRALYrRsvcVP+zw2fIpVQLQkzFrP/C1bXI+9j+
	 YyQ6S3Yo9J5Xy/KzNVeQaHwQ7ChH0odADZ7N61LJoscZ5r4pXDFm/7uZTEvusi1mVl/s8
	 5pMa6lwIc+8ufdRiexZNrBf66x6fUZWlpB6bWB5w8ETDkN1GixGcPFJyePLUEdOeI2FAk
	 N0etZS6tZTRt/LzgsxHByQT/+2lrWnkYzbL6iuSyZOMb/CN3HSscyTLELfxqsh1BXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qNbP591W;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF3606A320;
	Thu, 19 Nov 2026 12:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FFF3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qNbP591W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=71
	i+6QmMWBr6xdnxXs1YG/oXksyIqockWxgvr0zhSMM=; b=qNbP591WoN9WWHr6t+
	3Csmc8RLP/+o9CiB4JjetfQFVAoeeki9GzW/FMqZh8cNmxDVkva9VyANrQ/mKW9+
	4P5oV+bH+qplMA2JSQzZpOZwpevfCFFel4uBQ9SV6ZZuW7Uus/uDgTFOX8F0hfga
	V7vh+H/PeMLcXLGXsWz/ASL30=
Received: from colol4bi5.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3v6fB8P5qZByjGw--.21046S2;
	Thu, 19 Nov 2026 20:51:15 +0800 (CST)
From: Binbin Deng <18983559317@163.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Binbin Deng <18983559317@163.com>
Subject: [PATCH net v2] igmp: use copy-on-write RCU updates in ip_mc_source()
Date: Thu, 19 Nov 2026 20:51:11 +0800
Message-ID: <20261119125112.540125-1-18983559317@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:PygvCgD3v6fB8P5qZByjGw--.21046S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtryxJryDCF1rJFyxur4fuFg_yoWxGF1fpr
	13Xwn8Ar18Xr4UJa95Zw4kCrn3ury0vF1YkwsxGw1S9rs8Kw15K3Wava43X3Z09F1rua1F
	qrnagw1UAFWqkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUfQiUUUUU=
X-CM-SenderInfo: jprymmytvvmjmrxbiqqrwthudrp/xtbC4APGqmr+8MM+gQAA3X

pmc->sflist is read locklessly under rcu_read_lock() by ip_mc_sf_allow()
during packet reception in the UDP and RAW multicast receive paths.

ip_mc_source() mutated psl->sl_addr and psl->sl_count in-place when adding
or removing a source filter.  Additionally, when expanding the filter
buffer, newpsl was published via rcu_assign_pointer() before the new source
was written into the array.

The setsockopt writer holds RTNL and the socket lock, but neither excludes
ip_mc_sf_allow(), which traverses the filter inside an RCU read-side
critical section.  During an expansion, the race looks like this:

CPU0                                     CPU1
ip_mc_source(add = true)                 ip_mc_sf_allow()
/* RTNL and socket lock held */
allocate newpsl
copy old sources into newpsl
newpsl->sl_count = old source count
rcu_assign_pointer(pmc->sflist, newpsl)
psl = newpsl
                                         rcu_read_lock()
                                         psl = rcu_dereference(pmc->sflist)
                                         read psl->sl_count
shift psl->sl_addr[] for insertion
psl->sl_addr[i] = source
                                         read psl->sl_addr[i]
psl->sl_count++
                                         apply source-filter decision
                                         rcu_read_unlock()

The in-place add and remove paths have the same problem after a reader has
obtained the old list: the writer shifts or appends source addresses and
updates sl_count while the reader iterates those fields.  This is a data
race and can expose a mixed old/new filter state, with duplicated or missed
source entries.  A multicast packet may consequently be accepted or dropped
contrary to the configured filter.

An ordinary UDP socket can trigger the race: one thread updates a source
membership while multicast traffic is received and filtered on another CPU.
No special hardware is required.

Found during a static-analysis-assisted audit: candidate sites were
surfaced by a Coccinelle rule, and the reader/writer paths were
confirmed by code inspection. The issue was not observed at runtime;
it is identified by code inspection only.

Fix this by allocating and fully populating the replacement filter before
publishing it with rcu_assign_pointer(), and by reclaiming the old filter
with kfree_rcu().  The socket source list is therefore never modified while
an RCU reader may still be traversing it.

Fixes: c85bb41e9318 ("igmp: fix ip_mc_sf_allow race [v5]")
Signed-off-by: Binbin Deng <18983559317@163.com>
---
 net/ipv4/igmp.c | 103 +++++++++++++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 40 deletions(-)

diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index d56355aca797..fd067858dd3e 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -2489,10 +2489,10 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
 	struct ip_mc_socklist *pmc;
 	struct in_device *in_dev = NULL;
 	struct inet_sock *inet = inet_sk(sk);
-	struct ip_sf_socklist *psl;
+	struct ip_sf_socklist *newpsl, *psl;
 	struct net *net = sock_net(sk);
 	int leavegroup = 0;
-	int i, j, rv;
+	int count, i, j, rv;
 
 	if (!ipv4_is_multicast(addr))
 		return -EINVAL;
@@ -2554,13 +2554,33 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
 			goto done;
 		}
 
+		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
+			&sk->sk_omem_alloc);
+		if (psl->sl_count == 1) {
+			newpsl = NULL;
+		} else {
+			newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr,
+				psl->sl_count - 1), GFP_KERNEL);
+			if (!newpsl) {
+				atomic_add(struct_size(psl, sl_addr, psl->sl_max),
+					&sk->sk_omem_alloc);
+				err = -ENOBUFS;
+				goto done;
+			}
+			newpsl->sl_max = psl->sl_count - 1;
+			newpsl->sl_count = psl->sl_count - 1;
+			for (j = 0; j < i; j++)
+				newpsl->sl_addr[j] = psl->sl_addr[j];
+			for (j = i + 1; j < psl->sl_count; j++)
+				newpsl->sl_addr[j - 1] = psl->sl_addr[j];
+		}
+
 		/* update the interface filter */
 		ip_mc_del_src(in_dev, &mreqs->imr_multiaddr, omode, 1,
 			&mreqs->imr_sourceaddr, 1);
 
-		for (j = i+1; j < psl->sl_count; j++)
-			psl->sl_addr[j-1] = psl->sl_addr[j];
-		psl->sl_count--;
+		rcu_assign_pointer(pmc->sflist, newpsl);
+		kfree_rcu(psl, rcu);
 		err = 0;
 		goto done;
 	}
@@ -2570,49 +2590,52 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
 		err = -ENOBUFS;
 		goto done;
 	}
-	if (!psl || psl->sl_count == psl->sl_max) {
-		struct ip_sf_socklist *newpsl;
-		int count = IP_SFBLOCK;
 
-		if (psl)
-			count += psl->sl_max;
-		newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
-				      GFP_KERNEL);
-		if (!newpsl) {
-			err = -ENOBUFS;
-			goto done;
-		}
-		newpsl->sl_max = count;
-		newpsl->sl_count = count - IP_SFBLOCK;
-		if (psl) {
-			for (i = 0; i < psl->sl_count; i++)
-				newpsl->sl_addr[i] = psl->sl_addr[i];
-			/* decrease mem now to avoid the memleak warning */
-			atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
-				   &sk->sk_omem_alloc);
+	rv = 1;
+	if (psl) {
+		for (i = 0; i < psl->sl_count; i++) {
+			rv = memcmp(&psl->sl_addr[i], &mreqs->imr_sourceaddr,
+				sizeof(__be32));
+			if (rv == 0)
+				break;
 		}
-		rcu_assign_pointer(pmc->sflist, newpsl);
-		if (psl)
-			kfree_rcu(psl, rcu);
-		psl = newpsl;
-	}
-	rv = 1;	/* > 0 for insert logic below if sl_count is 0 */
-	for (i = 0; i < psl->sl_count; i++) {
-		rv = memcmp(&psl->sl_addr[i], &mreqs->imr_sourceaddr,
-			sizeof(__be32));
-		if (rv == 0)
-			break;
 	}
+
 	if (rv == 0)		/* address already there is an error */
 		goto done;
-	for (j = psl->sl_count-1; j >= i; j--)
-		psl->sl_addr[j+1] = psl->sl_addr[j];
-	psl->sl_addr[i] = mreqs->imr_sourceaddr;
-	psl->sl_count++;
-	err = 0;
+
+	i = psl ? psl->sl_count + 1 : 1;
+	count = IP_SFBLOCK;
+	if (psl)
+		count += psl->sl_max;
+	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
+		GFP_KERNEL);
+	if (!newpsl) {
+		err = -ENOBUFS;
+		goto done;
+	}
+	newpsl->sl_max = count;
+	newpsl->sl_count = i;
+	if (psl) {
+		for (j = 0; j < psl->sl_count; j++)
+			newpsl->sl_addr[j] = psl->sl_addr[j];
+	}
+	newpsl->sl_addr[i - 1] = mreqs->imr_sourceaddr;
+
 	/* update the interface list */
 	ip_mc_add_src(in_dev, &mreqs->imr_multiaddr, omode, 1,
 		&mreqs->imr_sourceaddr, 1);
+
+	if (psl) {
+		/* decrease mem now to avoid the memleak warning */
+		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
+			&sk->sk_omem_alloc);
+	}
+	rcu_assign_pointer(pmc->sflist, newpsl);
+	if (psl)
+		kfree_rcu(psl, rcu);
+	err = 0;
+
 done:
 	if (leavegroup)
 		err = ip_mc_leave_group(sk, &imr);
-- 
2.43.0

