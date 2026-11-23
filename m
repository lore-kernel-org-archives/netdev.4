Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428669;
	b=Kiep4HqqOgjnx9w/A0pQhGDtMbgYTQxAVF3VzECoUJHbmyJggkdcIwWyUvpziTW5V36I
	 9V21Ug5ge7uHFBXEIHgij6lKya2pIXUvBLg/GwUV5Vi6N46dncR4MFLYr8nzPUPpqae+S
	 Zg9PZqX3FPJgFEswdtIIK0nFMX7RHhsbYfIAmsb/J8rL69U2TgsRQkgb9HZP3tWHwp0JV
	 wH3+CH2FNcBO9vgpX0mhL8BdWFsS+MtqaoLvlZzu28BC/yyR+y5VTp0qeJXNunl57I6Gu
	 ujS9WTbyBnJ2f3D6VECALcW6YBKBbfCgpgMT+4MEZ8MHQzE5155pTwbIMnaw5xbP2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428669;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=pL9bgKim+WyzxgqcSH5MflLLxnE9zkAv5exXzYBQD79yar+Bxgo5xCNfmD28lSv2/jmE
	 1/8Bmp4fcQpd3pyCEcm69NaxYeKvpbgDYfSRxGGTowSF5OEGVGSuh7dkFVewpq/Gu7Xvy
	 lWkLsXm3WZCYiZ5n5ABnGDr07m0P4Rw9jEV1cNXaF27ikm0/YObd2Dw2pLxu7qMqx2lbq
	 t1Hih/5V3eBy1pQaTwnyWSf8s9dTw9x8V26ewgmlqEI89kKJaAz2hpOFqF1bB9a+sPYhw
	 v8y/zin+fK15hwVg3q23IvDB2PmXrFF7lGhr8+ASjkFg5OJTwO/o3P8SaabYITPLDtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=atOe2YCa;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B3606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8B3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=atOe2YCa
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1421719a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428668; x=1796033468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=IN4Y2O6poUavdK67Zqi7DLsZYYEbKqL9gg7hWqSVXvtMasvqm1xU2HyJpjRyJ9VnD9
         Xr+aSBwesBteMJg8iLcwfiRvXOnnhZmgX4T27Fy/KRzFFzabdtJXvZ6Xp/tZPH7QTeLj
         heqCxq+W5zUvym5w5xv9kfUB8om9wFDq28x5wdwV2WMTGqUrHAIwbkU9ddV89AvIgrb1
         3EztRTvZ6QNc6czURxNm98Z3YNTopJ5X1a9HmsOnG2rr/hvSINBB0lhoeLl1ksMqPzcD
         u7MQIH8QpUIuTkqJqr/Xbt6FugiinApayF9SWnejgCfd/6ERcieC633VEziY3ChMrDZp
         WZPA==
X-Gm-Message-State: APuU4Z8hF4roN6BsaaMeeYv7ltVBwSW0VsD0tH2+VVvgkQg70zH1JlKg
	Y7rHmY22mfUdlKUMhvXdoA/QHs8VUgEEjysZ2/qgbnPsMgC4CAt+wzxX8MeJeSUTgX9nQz76fCy
	2SqCQyY9xVqqCmX2h1O88DWjgadXTcgAkTCeO7v/jJI26jb7CqzkWRM2J3zYcXJuWbjJi/iKevf
	prai85CnP43LeNXaZVoH3rfq/ZMfd/37Qbr4uTp5mTFUO6vJCKFyXhVS8+eTIzSRSmpJ/Ot2kDt
	L7yn+XwvQ==
X-Gm-Gg: AZFdTZeWwvWCCk/B1m2x/fPRB6J7VXD3yuueH2OAZi7871WxdMsP6Br00SgFGpMirg5
	LgQHcl02d7R4QN+Ep6ghS/xFawz3QgQLnIuwpnb48zRC/WEYJVJZFAK/2JLDoCRSgOUw9q84RAO
	8SJXcZRqrcaqaCnoBBIRrs6bDmoew7AalkeHdPtRR1qR0TyJYx0Q/UuBDg5kSZQvVbYbSW4JRzo
	rThNyKkMO6Z53HLk38P580Z1iR3lAT5Cg8IsRI0ZmD2D1yKTm7j/eyZx7ezbwKVE4eFQXYdgS7y
	a1o1duyZ8xTjYM35GC4N11OEPUkx59ge/FVXEcngqZ5Bh7PfmwqjNzsojt4bRoPQP0WhNfC3E69
	c0wl/OD6XBnHEjLnW+fydfyg43zlBnQ1Kj4n7w7NPLYk29WB1TgtsJ/PtXdhr/ze6LjDSvPrCKP
	GBqBo71Tb2cxwB4BhSEyHAnYNQrkfuW7S/SQ==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr9699087a91.17.1795428668394;
        Mon, 23 Nov 2026 02:11:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42001764esm2816246a91.4.2026.11.23.02.11.07
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:11:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so1589304eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428667; x=1796033467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=atOe2YCa29+s9EF0d4UQ+9tN7K3Trir2J9P84ytCDug0SW9J5lK/2dTfjVBisewM5G
         k9WSqXc2+fwKjei5kbU45hHqnnTZjKfJ2IPxA4GXA2twWhZPrrTqad0RyYN9OZS6bjI6
         ZX7JYXvgvWxl4NyjwF5FGIWfMFt0YfmCOD3p4=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr11088266eec.1.1795428666614;
        Mon, 23 Nov 2026 02:11:06 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr11088237eec.1.1795428665918;
        Mon, 23 Nov 2026 02:11:05 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:05 -0800 (PST)
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
Subject: [PATCH net-next v9 06/10] bnge: remove refcount from L2 filter
Date: Mon, 23 Nov 2026 15:37:42 +0530
Message-ID: <20261123100746.1975030-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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

