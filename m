Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838104;
	b=YP1w7m7Qz0mCzqD5p6Sdlnjckum5YUH+/qVY3P/OAtCEXP4a7JSf0je08C3dYc4vuFJl
	 92mzH26V1m/FlQ1+k/jECZkVY+kAPa5/n6Rd47Y1JzqIvoL41XnJbynCOZQRk6Sh0b6Iq
	 9Kvq/C5BPzrVBIW4Pu8AI0u3IjLXyQtHAsOZmEN8Wkmd4dzxYAnF1j9Y9Syc01yVQc2pn
	 aaq1p32QYyTAQdGV2Hv6rxUd0kbbSQkklVn94Dxt9/pSdlbxq18G+LUGb2OZCeplBmDWw
	 a4wd8uGHl29qpo9lw4zDFFffUY3/BH/K7bqlCswovBOcfb7nr3syAp++rNsesdCJmRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838104;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=zmD3Ghpanp4fQf1aC9s4opTZ9cNIOb+i+mMk8I0B9MG5m/iDhhyF3BDNkGmoXeAT5QSE
	 i5Y0I+zJt39VV97oaONwIzXUUq4qbm4TkpyXmyg6ZC/ylgqwvvL2XeLZacQXVRsfE/ONs
	 uJOocTyX1Fxt2jQDeIvrCJ+fUxMbuGIh+7+Pwb6ZGUKcv/DnV+W6qaPlE5MpDpHLQRh4y
	 45y+ds0Fr7viAnYaj4iLi9bJqo86CIvXolS9yKE7SeM4HnuOn2A8muQ1Hz078po6dFqAA
	 cEMzRzEL1QIcuT6IJhWqJRwX5q3Lqw/BFLZzuswI17CA/TlrT1uLszyNhntXF2WCEsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Ri/Td3sa";
	arc=none smtp.remote-ip=74.125.224.99
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF8606A883
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFF8606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ri/Td3sa
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-67be9601f31so3393857d50.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838103; x=1795442903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=OZXTqfJ/Yks91aOGnK3sI7TVQxYtX/hQDlsHX2aK0q+3fxk6TIXm7HuiTs4VcUcIXm
         lGh4NJ5dBu1u4JePaj6QKAzp/wkRAjmqGwizHBfz/6INfMAprsk9KL8gPKHmYMx1zE01
         KQqRHTbXZFIHXa0n/sQwS5+Ljnvu08g2BNzMtCW8iK8TtgKqEroAhDWEoJXZSV5Tq0G2
         qDyxqwYz2feVUPNAX+65MbPx8pfROzDePxV1EWCFjqlct97JwgOLg+UgVfPWXJD/xnvi
         URxraBfU8Q4JRkSjxl+Gr8JS+s1XCXsajeUCfOfRhsULj8/8VAh4CuflKr01uVsD8az3
         TEXg==
X-Gm-Message-State: APuU4Z8Z+8rmAhpeWai1dXDxYfUN5QWJDK7o19fwhHq8eaChHF6oh98j
	zplKMA39YPHfQv1E2yrFbXrGBC6/XccVVHFH4XmAdzG+ERbglBgdat828GsZg9wQMaeK/xeB80G
	YOO/u1EfpycsFp9KRFljqIHOf7UBIO5OUdHTKcv53cIAort31gkqixVP+HgsytY4eFQMqXzQQK4
	RTiLOepqAmMSghtWcv6jJCBpubdk24YsZTYvXr2U4EpyB5ZQ3mGDlMoFOh/1Av4v1cmGd2SZ1+k
	PNBcyNmJQ==
X-Gm-Gg: AZFdTZcbB5QE6iJW+yR0KOV1Xf4HBUcc1YmF+6netkXLHSoznSVLD746wzs2MCoMciS
	w2k9GaEghSxFkXWKGIWR1dPk6sApqmxKelkrtOnpdZYCr+QWnjMnJgad5vLe0qk/vPZQk6l/8bC
	Ctutt96E1quvXt8zHI1XBScqdLYbL2Aw+gKHVYpiZinnvu+qRdHXEwY7X7BCQk+/k7iQlzlV6tq
	o7tpEyOo6c43KjNUknMF3jbOlbCuKaAUaj7n1JWQz6/+ct3qUgGFhrJr8IscwnqcE9Sk5am77Wg
	zXXMErNH68NmlA8E8chHkskWx3+k0GA8pjos4Ze/ZmZ9Nedgs2Vfbgb2HTY/ljvuHDXu7e8GBbL
	au4o+Rb0pCMmIPU3dlRbWHTTOSt1mf3SUmeHaxtb6FPzPaPdUJfb6LUy7GoUq7OL0DeGbv9eis9
	XAQzvRuFj3PqT9EHxIYkGm+O+sKukGeokGqg==
X-Received: by 2002:a53:de4e:0:b0:679:a2c3:b2dc with SMTP id 956f58d0204a3-67d89774544mr4015403d50.92.1794838102708;
        Mon, 16 Nov 2026 06:08:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67d8a696943sm126986d50.34.2026.11.16.06.08.22
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3496305c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838101; x=1795442901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=Ri/Td3sasYfpiEQK15iA2TU3pgLv1OF7Sq4E+VGPUcCiuuOkX1aMNgXG/oCK/6G8LB
         TIcaEBkgUflGcxsW5MQRwfP1Ar9estREpau5mNSRzv0kWBkmpRqKL0yzmVPvSw2aCw4x
         sgJwhhOb+H5gSQPWk4PNvehWnq8LzGT1FxKeE=
X-Received: by 2002:a05:701b:4507:20b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b53490db69mr1561648c88.34.1794838101185;
        Mon, 16 Nov 2026 06:08:21 -0800 (PST)
X-Received: by 2002:a05:701b:4507:20b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b53490db69mr1561599c88.34.1794838100486;
        Mon, 16 Nov 2026 06:08:20 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:19 -0800 (PST)
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
Subject: [PATCH net-next v8 06/10] bnge: remove refcount from L2 filter
Date: Mon, 16 Nov 2026 19:36:49 +0530
Message-ID: <20261116140653.1685797-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

