Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607730;
	b=pgKozkXW9Jux6V9vfl1+d/SVzW4MKpmB0gOhwodZ5fw1+wlmsguUOC8tgcnosxi6tob0
	 v21lm9Af/nwW0SKzn2f6gnf/RRukYPRBuWXvF6aBOld9K5+bwA2qtO5dniICDiAIoalOz
	 jyP5EZnh+2OLAwTZxV7vx/SltKmzwB7QgcUHsk49hfXV+6Frh8dfx/AGtHhZkq8LEtiWu
	 gE2S6NuLjJeUS8gZdIiiRVrBDCOdubqmHX6xYrB/qqCvObAh0b258XYIsHPpygQn2/Du9
	 s9rGG9porsxUy/Vq59L+1onvuTkb5MB85jNxHYgo6brVVuicn3MpwVT0xNPWIzrw2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607730;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
	b=ES9uuk8K83DbtQqgYJarXhlT/bgbAbBf3ebutybHH85uIz4ALJGsqiTNeoHWSGed0sIF
	 1/qT9pbklAB4RmHUaXJFrIXn4cmR90qLkS5OU0zBM02K1VJYwLqKqbccWelbeEwTgmzc5
	 CXUp6FPJSGpnJB4xp4JYfGTt89oQUhOSoos7U61AsujyXcIjGrbJvFFyqpC/5R+86QQf8
	 svplfe+p4RxUGlKPuMqANngwF83Orao4wOUAYC74ckZbi38zg8mOnvhwE6zQLKl+DRSm1
	 hnYnZRnwZrDnu2/8vUtC09mcwn8txOZpXDtAif15S9BvjFBkp90jULC8y+C0wrcX4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fHTKYE85;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73B606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F73B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fHTKYE85
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2290685a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607728; x=1796212528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
        b=nSz/fw62DdSBnUj4/AIoTlvPthT2Sa/XXB6f8PWNF+rhzJggfxLC9p1Hw6pAnrEuXA
         rZEefTcpIIqR7Gr11yp56GQ+acdJS8hR5Awz+j9lXYKRxWthtCjWIFzrUzVHDhK1wqdL
         KRzPwcgH5ew+W4Px8GdxzjZ8Gks/aqlM2P5ZBk5tq7j0Xdkvg5TJ6jZkilYSpBQVsTPN
         2p7OIlZss++0ZvJMETVLLrTYkTVR2cP5Izabm0746QvfnWNQ6N/TNs+nu9wJybXQpcKl
         71DG5nfnwWXHAciFMLX3u6/E1b5vg52xJN+/b1PiuwNnFC9K0OLY8ge1MpdGxn99MY6W
         Nmeg==
X-Gm-Message-State: APuU4Z/kJe4Y6jqsYjo5PaCGBAmjGGuFLgux8Qa44RV70+p0LCgWsVHO
	BvIE2Ps0PRYgGeVOqzpWoEfMI6BbI+LidgE3G2tlefaPPMPPiWiiYTwTXWfMZFbo8JMGuHnZ3Ot
	1dsPDKbNmaxke4EUASZS0NJK1N6FBhBgEQsQxnFUf2zIdUtmwDR1qa+0EX0yGYmn6BREHucdn/U
	Qy5QWSj7gsdrwaJhfWAdQ5emNATYPKMz9EiSNqddXDZDGT07pdqvckz3xU4hL8BeQ7SeuITcxbj
	gXHxswJgw==
X-Gm-Gg: AZFdTZcaxvvpkjYvAwDA4AuvDM8JSKJnweLTl6aKWsJP47hvtPmx3/F+eTnvn0Wq9bW
	WfMf7d/FKYyHl+bE87xZHtaDUuXYnnPtmkOg4vkHsIjxWXkNwjEV3k/jBNAgwg3vT2gZTf04jdI
	5uejqkei28J7Ro/YkvLdcSEeInFbXCE2uaixAlkTfjHFEX+l++qfUCYOl0Dg2Tqjc/bQg7DOc/n
	cVb2r92FIyJ3tbg9FXr79+pgHgI5bTbVuM8tAwp8T9jpQ7Jb46L52Iuz73S/uUeRWmOQa8HVbjP
	ipUK9Ye3/86nt+nqBZF+63ripDOA9nbXAAwbkyk7Ux9DUy3fmori6FA7kUDKBCf1+/GhUGkvdHb
	1ADJ89NlkeNZm9AIDtTLTB7dE9TR4RyYXrmJGz6dpDRw7e3M1jJ//JfHxwCVOUxlsa0NiStY/HV
	uZiy2vx4rbZn06KwIOxU95/p04RhVumQejj6ad
X-Received: by 2002:a17:90a:d2cf:b0:3b4:c0a:9b01 with SMTP id 98e67ed59e1d1-3b41c9ef71cmr13240708a91.35.1795607728434;
        Wed, 25 Nov 2026 03:55:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm5649596a91.1.2026.11.25.03.55.27
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso9649823eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607726; x=1796212526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
        b=fHTKYE85UbDtlgOCFdTu0frbCM5IUGVsCUHK9oOACG1RNV+33GBkYlb7DDRAhqaqWW
         W4vBqL+nx5xJyPe1JZjbKJ2003gf2dw8tveJmQ2dX7zH2eX7iTxBHIVcJtg9gKpLq0KJ
         B+SghgvYbIR03KFxfmaHRK4D0PLT8HOdNUYIs=
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr12704702eec.24.1795607726434;
        Wed, 25 Nov 2026 03:55:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr12704666eec.24.1795607725771;
        Wed, 25 Nov 2026 03:55:25 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:25 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v10 06/10] bnge: remove refcount from L2 filter
Date: Wed, 25 Nov 2026 17:24:30 +0530
Message-ID: <20261125115434.2080590-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
References: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A reference count was previously used under the assumption that any
context holding the last reference could delete the L2 filter.

However, going forward, the filter will only be removed by the same
context that created it, making refcount unnecessary.

With no reference to take, bnge_alloc_l2_filter() now returns
ERR_PTR(-EEXIST) when a filter for the same MAC/VLAN key already
exists, instead of taking a reference and returning that filter.

The L2 filter hash table is no longer walked under RCU.
bnge_lookup_l2_filter(), which also takes over the RCU lookup wrapper,
and bnge_del_l2_filter() now rely on the netdev instance lock, and
assert it with netdev_assert_locked_or_invisible().

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 33 +++++++------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  2 --
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index a8bb441ebef9..6316f75ca36e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/dma-mapping.h>
 #include <linux/jhash.h>
+#include <net/netdev_lock.h>
 
 #include "bnge.h"
 #include "bnge_netdev.h"
@@ -13,8 +14,8 @@
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
 {
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	hlist_del_rcu(&fltr->base.hlist);
 	kfree_rcu(fltr, base.rcu);
 }
@@ -31,18 +32,19 @@ static void bnge_init_l2_filter(struct bnge_net *bn,
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
-	refcount_set(&fltr->refcnt, 1);
 }
 
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
 {
 	struct bnge_l2_filter *fltr;
 	struct hlist_head *head;
 
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+	hlist_for_each_entry(fltr, head, base.hlist) {
 		struct bnge_l2_key *l2_key = &fltr->l2_key;
 
 		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
@@ -52,20 +54,6 @@ static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
-static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
-						    struct bnge_l2_key *key,
-						    u32 idx)
-{
-	struct bnge_l2_filter *fltr;
-
-	rcu_read_lock();
-	fltr = __bnge_lookup_l2_filter(bn, key, idx);
-	if (fltr)
-		refcount_inc(&fltr->refcnt);
-	rcu_read_unlock();
-	return fltr;
-}
-
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
@@ -75,9 +63,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 
 	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
 	      BNGE_L2_FLTR_HASH_MASK;
+
 	fltr = bnge_lookup_l2_filter(bn, key, idx);
 	if (fltr)
-		return fltr;
+		return ERR_PTR(-EEXIST);
 
 	fltr = kzalloc_obj(*fltr, gfp);
 	if (!fltr)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index ea1acefd70b4..372657cba43c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -6,7 +6,6 @@
 
 #include <linux/types.h>
 #include <linux/if_ether.h>
-#include <linux/refcount.h>
 #include <linux/jhash.h>
 
 struct bnge_net;
@@ -49,7 +48,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
-- 
2.52.0

