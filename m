Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642504;
	b=gJCXamaGNmJ92P/jrA9NzZ5oPiMM3VVjmlOITS4Q+DaM1HelQm7rvKzOnvogmM3NPdBb
	 jSACb+qQqGDTFbV9FphM+j3LQ9rGkXkkmPe2LtZcn/e7wOuotYJ0Ek5FDGZnQ0lXhj/Eq
	 /qIXemd2ltVqGrbQZ2sEHfrTIwEy6DtMQwtyXTwkI5vufPfTvX2tVRtbvl4LIx0mFoXoi
	 7shOd6PvuBjEqk2KfTar5bPgmcbV+vX4Np38xwpfxE04OPwAbcrM4YKjDcSBuqO86SlRy
	 kLEzrOABtpNF5i8qjqQLND1nKkGiIpR6EIy+g3AEdMAf/tPiaRqlyWhase5+Js9B6Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=I4RcxxymfCw4AHcouODHwkVsoWhzsiMS6Do5Mf7s+wj7YbvAt+yu4LsivDk/6pPBGKUs
	 mC2xGI547KeGkMcXqwmVgI95xmnQMsksLA1qtkalDOs8zSG1xpBPrqKblxdMEvhGjlntc
	 RQ3ww+igEUGkBcsgXXaThRE8hJhsbkzSQtlzAeyaaYf6kBat0YDiWdsulGO1/wlxMnqpe
	 GaVj7jYtJ0zgKGY1pvmbIbg3afDijz+PpGuaoE52REA02kHQ6lJS6I6YSa+aNzHDF/Qgd
	 EY62inmbHLUK1HgCfuRNRPDsmobntIdD8PYOOCqNXNuUzmcX1EJ69WtNvcgQgzh5sXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T8WTb2JF;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E544C606A884
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E544C606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T8WTb2JF
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso845824a12.3
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642503; x=1795247303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=DBbZfBQiiUZbUes9u8+Jm4wCyyiEcpvhWYFE99Lj5OdY7XEWcG0UimvdyO/UnGMAAw
         XLCC+5guB+M4bJQeiwtUt1t4bwDJypxXJdD4kIu10ssy+nQkN9sl1XuV+irnMdSaYSla
         hFXiYXfkDUsOSGuJlGS4hRbEY6SNRE1tcVvH+Z+rB3qwuQuLYG9dI5JftLhWYXeRLC+0
         mI+cEnwPyyUQxrLnXjk55XwXt8W7MjnhumOEJjjWZrwb9pQsTtbXwIjd/SfEc17HXKNV
         5D2w4aphcOGZGryi4CQWeO84k6AiBeSo8onWgXj+kBmqSUwNLP85CgztZFYzpncWBZz/
         FusQ==
X-Gm-Message-State: APuU4Z/tR8DJ1S/RY/6FB7Qk+Rt2CZa2/01Ig//N9O0b3iMkVzIIa8U+
	hkvVPIBWziXtcDUWYLQxsxdd8P3x6OjLgu4EPyHSs7rMwqRyKQ83rozgolSTMLVZLdwqCqp3IOq
	Rr1Z74+XaLt5ZqC7yHf+XTFnVTyrBeymWNYFV8+q+1aUIAJxunfA8zVSzUXPK75g3OTwDYPZ0SP
	E5DHHZHM1WYvRteNcNRKnnwrGD3LKLmb8tlqIDxrdJaHBZOfS8nntKjCZskG5d3fA+0XJ1gY0aP
	PXwIPVirw==
X-Gm-Gg: AYBFou3O9j/lmu1pOpgkN7VRWrFXe9i+4dky2euVxg4fnQcjQcTafZf8mN16GqNW5l+
	w/S6Z2TQnpM4NP5YE4xpqtYp8lYYXUFx+2V1Y9BVRgMylyW4L9jS59HCZNYOFbMhTRqW9ZLPyL9
	U2MVx7YB/DWIIjuySICDBVgUZwwoF4xQGhkpGIEEdpd2nqPKqdu9+F3Lxa/QJCHYW1SkM33aXhu
	Whxk0mS7to5jfnWV/j6vX5bUZLg+2vdLtF9wOSwI44gn2tPfOEFmK6yZlAno33Sz9iX/mHf6lUf
	tWy6Mcn5Nc6Zeu0T5zrmIV78DfolKeuKiTNZJLj1WIKNp9gJhWSKPBY/m6h4NcmTseRehbdB8Iu
	pUKb9IKA1AKaj3S/LK9GiZw5xZ7IUO5iFD5o/pJrFNcya72GIfO14b87NK50QM37DZqVVh+C4U3
	wP9SvRZDfjgh6DnONfaqs2WKG9f0vkRWk1ig==
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b1b0cccea5mr4428719a91.64.1794642503194;
        Fri, 13 Nov 2026 23:48:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3f74ffasm2785233a91.3.2026.11.13.23.48.22
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so2138772eec.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642501; x=1795247301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=T8WTb2JF1SGh/abGgK6f08W+6Q3nQ0XGXIHbQm+/SGIUskUwH4RCFXhZy7iXJyjPlT
         S5VQx9NsG/rZWRya0d59EBCHYu24N/zTr3VvCNX2FqMxXW9B6TBtUJduv3kN4VlGq8c2
         TDaUn2SeRkfZPC+8D+cB5RINQ3QnLNiYzxsY4=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr6522246eec.25.1794642501301;
        Fri, 13 Nov 2026 23:48:21 -0800 (PST)
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr6522204eec.25.1794642500655;
        Fri, 13 Nov 2026 23:48:20 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:20 -0800 (PST)
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
Subject: [PATCH net-next v7 06/10] bnge: remove refcount from L2 filter
Date: Sat, 14 Nov 2026 13:17:38 +0530
Message-ID: <20261114074742.1484603-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
References: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
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

