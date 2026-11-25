Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607701;
	b=mZeCleSETLndmfaIOHzGBWboq4n3/Yqs1jrCm9fxB5+HpvVACf26QsV9R+zqxXKCAF0v
	 +zdeLoFadRqUo5iaJ2/G5N8nQKiUC0tnk9mpTSZHU5Vrls6JHScq61BHXCaaC7F+qreE8
	 ZD0wP8SicELXK8aMRMP0quNWt7xPufnW8zb35n/lif/0ZVdE7S+gsYhEYP5q4OxMci3fp
	 gKNt4pbXG4f5PJRLtjsS61Ivhp5m178XBxqugK49KsXgrriugqEeRS1x59owMFFX+fVFL
	 tetJ8SFgF1rf2ELapAza4rFFRLe9F/5lv3qzk9JmDd8NJ0b2DRsvB/TSUQCROmhEQnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607701;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mbvL3v9xitudIPXWyeH2ku+y2nh35yR2K9Tkb/IhZnM=;
	b=HOHVvnMMbokg9u2Q+JuI6fiKk/XoPLUufVg0G1ntVXACHrOIQb8+hV7p+YePsfgq42E0
	 mrLvn60J7MHuDxrY844mxn9p2L34ePlZ/7G50KI16wMgEX+2Mz0/xXbXBkuNTdz/WSoEc
	 0i92JwUnDUgCsf8cf3ENesv5v8ZtSXjkMVyYXrEyl/juz+F2McM5F1/ZKnznj3N5paUfs
	 G085pRAQIc/mWC94B0Zg62ckET6hHf+wlRvm7//QSvNMshJPaig6XbWISz+C7DV4oSIKT
	 y5kn3WkNHlS2Qq51crQSgOzfS+pvLdxdO0BPmWo/lNF5wKxpXqNWiW+HiAFBT0e3yZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ShyMqXdu;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A8606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ShyMqXdu
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso2956878a91.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607700; x=1796212500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbvL3v9xitudIPXWyeH2ku+y2nh35yR2K9Tkb/IhZnM=;
        b=GCETVtpOxUCZgg7FOYkY40uxx0VJsYX4IBt43MYmGNpjmHAFA2I3QvCdcWATXFDmtL
         CFmaFeEcQtieHKEujdUj3UFFqJ9ew7XbweaJNks4FB/vtprDDoPFe76LH0U6OMMRVpWU
         vvACw3Y4EHb4acnKRvwXKEWANGTb/ss1RVSgZjs8tvfcNis147AJyXxrmpzOjngzHOff
         rEwy3KnOprshURudEAxChs/dF9+eJOHsfEnUox2gUINLKRIjOI2fjKFbXo9u76CcV88t
         np0fnNm/KVk9WB5qVzF2l0qx3YZRJnAl7MCoTDDH+/uThZ5oG5ts5ApvUTKhllNK9J38
         dQCg==
X-Gm-Message-State: APuU4Z+Pl3pIso/z0kv+aG1iDDy6aDDAc5TnWHE45203LbnSRwDq0/bC
	cfm3NiKv91unQ6Yu0wEL4kAqWkoDedWLcfkwWDUax4vL28levvjYEBbdysvxOz0tVY5/QCBn+ig
	J5tlNYLf+UKgDwb84nJ0gt6/qtPmD39lhnsWLunphRO4Il5W+BWW/ByS/tHIRrPR44UPwweS102
	ZKxrvE2qC3tvsRDdreK3nmlDmqPQXdVAuIq8qWQ4oT0bdHGD1xLCUSriMURt2wwtrYA2c2NLHlC
	9i/IE5hpQ==
X-Gm-Gg: AZFdTZehLQMS1SNjsbxq4pHVZz7ztAnowBw2QbEJT3mf9TmREsNlrUxZFiMDAopqMQR
	MLLQwys44G2DezBP+D/JfTTOAqIthETG6crtdpOD7sSYbJHGJC7FKJ062sDN7Z2E65Elk+GpOO9
	Kxg0MM8rNJA63QqqINRSqShZN7ncNeXMZNKaAde54JS3gK0O0svvf3T1GPHcECDdSKlFGCJJjVV
	ZlU62aUiOgM5MLdwK/868EkhgxU0T5LlNsmfBqy9GpL9yjBaSmtaz4aAfTO8QNqkxSsf/7+eTC0
	pr1H9idskocqIfNl6tmSkLAQ1PQRfYkKQw7wOwZ6IhPVt9DDhat9YXu1fHVro9lF7SmwU5Mv3lB
	fQD7DNl5/bNjy+Qc9FL/+iyA5mO2s+YYjRSIp09tJaRVTjZ8wDgW4jMMrwy6E5qNBWMEpS3uxk/
	f+j8N5bn3ub67sa+8B0Hiy86fzAFnbHfyykd38
X-Received: by 2002:a17:90b:17cd:b0:3b0:bc3c:3e7 with SMTP id 98e67ed59e1d1-3b41c8ffaaamr16035465a91.10.1795607699857;
        Wed, 25 Nov 2026 03:54:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae532fesm13162657a91.7.2026.11.25.03.54.59
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:54:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so6829093eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607698; x=1796212498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbvL3v9xitudIPXWyeH2ku+y2nh35yR2K9Tkb/IhZnM=;
        b=ShyMqXdujD9WAzeASdP0KymGJHrpyPpYrvNF5J4gi/j4BXpf+q8xrtbiJ8QGcEgaoJ
         hkIpFw4xi+vVhC8CXY5VMt5Tjus6gvyTBfWhRVElosZFwv01vZUYtn9P2viZVJNiwMGk
         SqQN/DH0NL/+PxKR9Ng7JpZqzUQMBPTsyyjHs=
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr11023223eec.11.1795607697608;
        Wed, 25 Nov 2026 03:54:57 -0800 (PST)
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr11023195eec.11.1795607696855;
        Wed, 25 Nov 2026 03:54:56 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:56 -0800 (PST)
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
Subject: [PATCH net-next v10 01/10] bnge: restructure VNIC and filter code
Date: Wed, 25 Nov 2026 17:24:25 +0530
Message-ID: <20261125115434.2080590-2-vikas.gupta@broadcom.com>
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

Move VNIC and L2 filter code out of bnge_netdev.c into dedicated
bnge_vnic.c/h and bnge_filter.c/h files in preparation for multi-VNIC,
RSS context, and NTUPLE filter support.

This is a code reorganization with no functional change, which helps
centralize the functions into their respective modules.

The move comes with a few small cleanups:
- The BNGE_FLTR_TYPE_*, BNGE_FLTR_* state and BNGE_VNIC_*_FLAG macros
  become enums with new values. None of them reaches firmware, and all
  users are inside the driver.
- struct bnge_filter_base members hash and list are renamed to hlist
  and list_node.
- bnge_rss_ctxs_in_use() is renamed to bnge_get_total_rss_ctxs(), and
  bnge_get_total_vnics() no longer takes the rx_rings argument.
- bnge_fill_hw_rss_tbl() and bnge_set_dflt_rss_indir_tbl() use u16
  indexes and temporaries; the values fit.

Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/Makefile   |   4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   7 -
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 113 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  58 ++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   2 +
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   2 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 170 +-----------------
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  72 --------
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  31 +---
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 100 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  63 +++++++
 11 files changed, 350 insertions(+), 272 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

diff --git a/drivers/net/ethernet/broadcom/bnge/Makefile b/drivers/net/ethernet/broadcom/bnge/Makefile
index 8e07cb307d21..d0a3cb24dc1d 100644
--- a/drivers/net/ethernet/broadcom/bnge/Makefile
+++ b/drivers/net/ethernet/broadcom/bnge/Makefile
@@ -12,4 +12,6 @@ bng_en-y := bnge_core.o \
 	    bnge_ethtool.o \
 	    bnge_auxr.o \
 	    bnge_txrx.o \
-	    bnge_link.o
+	    bnge_link.o \
+	    bnge_vnic.o \
+	    bnge_filter.o
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 64c792b278ad..b175d63021aa 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -163,13 +163,6 @@ struct bnge_dev {
 #define BNGE_L2_FLTR_MAX_FLTR	1024
 
 	u32			*rss_indir_tbl;
-#define BNGE_RSS_TABLE_ENTRIES	64
-#define BNGE_RSS_TABLE_SIZE		(BNGE_RSS_TABLE_ENTRIES * 4)
-#define BNGE_RSS_TABLE_MAX_TBL	8
-#define BNGE_MAX_RSS_TABLE_SIZE				\
-	(BNGE_RSS_TABLE_SIZE * BNGE_RSS_TABLE_MAX_TBL)
-#define BNGE_MAX_RSS_TABLE_ENTRIES				\
-	(BNGE_RSS_TABLE_ENTRIES * BNGE_RSS_TABLE_MAX_TBL)
 	u16			rss_indir_tbl_entries;
 
 	u32			rss_cap;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
new file mode 100644
index 000000000000..a8bb441ebef9
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2026 Broadcom.
+
+#include <linux/kernel.h>
+#include <linux/dma-mapping.h>
+#include <linux/jhash.h>
+
+#include "bnge.h"
+#include "bnge_netdev.h"
+#include "bnge_vnic.h"
+#include "bnge_hwrm_lib.h"
+#include "bnge_filter.h"
+
+void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
+{
+	if (!refcount_dec_and_test(&fltr->refcnt))
+		return;
+	hlist_del_rcu(&fltr->base.hlist);
+	kfree_rcu(fltr, base.rcu);
+}
+
+static void bnge_init_l2_filter(struct bnge_net *bn,
+				struct bnge_l2_filter *fltr,
+				struct bnge_l2_key *key, u32 idx)
+{
+	struct hlist_head *head;
+
+	ether_addr_copy(fltr->l2_key.dst_mac_addr, key->dst_mac_addr);
+	fltr->l2_key.vlan = key->vlan;
+	fltr->base.type = BNGE_FLTR_TYPE_L2;
+
+	head = &bn->l2_fltr_hash_tbl[idx];
+	hlist_add_head_rcu(&fltr->base.hlist, head);
+	refcount_set(&fltr->refcnt, 1);
+}
+
+static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
+						      struct bnge_l2_key *key,
+						      u32 idx)
+{
+	struct bnge_l2_filter *fltr;
+	struct hlist_head *head;
+
+	head = &bn->l2_fltr_hash_tbl[idx];
+	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+		struct bnge_l2_key *l2_key = &fltr->l2_key;
+
+		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
+		    l2_key->vlan == key->vlan)
+			return fltr;
+	}
+	return NULL;
+}
+
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
+{
+	struct bnge_l2_filter *fltr;
+
+	rcu_read_lock();
+	fltr = __bnge_lookup_l2_filter(bn, key, idx);
+	if (fltr)
+		refcount_inc(&fltr->refcnt);
+	rcu_read_unlock();
+	return fltr;
+}
+
+static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
+						   struct bnge_l2_key *key,
+						   gfp_t gfp)
+{
+	struct bnge_l2_filter *fltr;
+	u32 idx;
+
+	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
+	      BNGE_L2_FLTR_HASH_MASK;
+	fltr = bnge_lookup_l2_filter(bn, key, idx);
+	if (fltr)
+		return fltr;
+
+	fltr = kzalloc_obj(*fltr, gfp);
+	if (!fltr)
+		return ERR_PTR(-ENOMEM);
+
+	bnge_init_l2_filter(bn, fltr, key, idx);
+	return fltr;
+}
+
+int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
+			      const u8 *mac_addr)
+{
+	struct bnge_l2_filter *fltr;
+	struct bnge_l2_key key;
+	int rc;
+
+	ether_addr_copy(key.dst_mac_addr, mac_addr);
+	key.vlan = 0;
+	fltr = bnge_alloc_l2_filter(bn, &key, GFP_KERNEL);
+	if (IS_ERR(fltr))
+		return PTR_ERR(fltr);
+
+	fltr->base.fw_vnic_id = bn->vnic_info[vnic_id].fw_vnic_id;
+	rc = bnge_hwrm_l2_filter_alloc(bn->bd, fltr);
+	if (rc)
+		goto err_del_l2_filter;
+	bn->vnic_info[vnic_id].l2_filters[idx] = fltr;
+	return rc;
+
+err_del_l2_filter:
+	bnge_del_l2_filter(bn, fltr);
+	return rc;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
new file mode 100644
index 000000000000..ea1acefd70b4
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026 Broadcom */
+
+#ifndef _BNGE_FILTER_H_
+#define _BNGE_FILTER_H_
+
+#include <linux/types.h>
+#include <linux/if_ether.h>
+#include <linux/refcount.h>
+#include <linux/jhash.h>
+
+struct bnge_net;
+
+enum {
+	BNGE_FLTR_TYPE_L2	= 1
+};
+
+enum {
+	BNGE_FLTR_VALID,
+	BNGE_FLTR_FW_DELETED
+};
+
+struct bnge_filter_base {
+	struct hlist_node	hlist;
+	struct list_head	list_node;
+	__le64			filter_id;
+	u8			type;
+	u8			flags;
+	u16			rxq;
+	u16			fw_vnic_id;
+	u16			vf_idx;
+	unsigned long		state;
+
+	struct rcu_head		rcu;
+};
+
+struct bnge_l2_key {
+	union {
+		struct {
+			u8	dst_mac_addr[ETH_ALEN];
+			u16	vlan;
+		};
+		u32	filter_key;
+	};
+};
+
+#define BNGE_L2_KEY_SIZE	(sizeof(struct bnge_l2_key) / 4)
+struct bnge_l2_filter {
+	/* base filter must be the first member */
+	struct bnge_filter_base	base;
+	struct bnge_l2_key	l2_key;
+	refcount_t		refcnt;
+};
+
+void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
+int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
+			      const u8 *mac_addr);
+#endif /* _BNGE_FILTER_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 227de771f2ef..d613587086cb 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -15,6 +15,8 @@
 #include "bnge_rmem.h"
 #include "bnge_resc.h"
 #include "bnge_netdev.h"
+#include "bnge_vnic.h"
+#include "bnge_filter.h"
 
 static const u16 bnge_async_events_arr[] = {
 	ASYNC_EVENT_CMPL_EVENT_ID_LINK_STATUS_CHANGE,
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
index bf452e390d5b..ae03041c36ac 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
@@ -4,6 +4,8 @@
 #ifndef _BNGE_HWRM_LIB_H_
 #define _BNGE_HWRM_LIB_H_
 
+struct bnge_l2_filter;
+
 #define BNGE_PLC_EN_JUMBO_THRES_VALID		\
 	VNIC_PLCMODES_CFG_REQ_ENABLES_JUMBO_THRESH_VALID
 #define BNGE_PLC_EN_HDS_THRES_VALID		\
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 8b184978da23..c8b5d3d6d331 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -25,6 +25,8 @@
 #include "bnge_ethtool.h"
 #include "bnge_rmem.h"
 #include "bnge_txrx.h"
+#include "bnge_vnic.h"
+#include "bnge_filter.h"
 
 #define BNGE_RING_TO_TC_OFF(bd, tx)	\
 	((tx) % (bd)->tx_nr_rings_per_tc)
@@ -2053,174 +2055,6 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 	return rc;
 }
 
-void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic)
-{
-	__le16 *ring_tbl = vnic->rss_table;
-	struct bnge_rx_ring_info *rxr;
-	struct bnge_dev *bd = bn->bd;
-	u16 tbl_size, i;
-
-	tbl_size = bnge_get_rxfh_indir_size(bd);
-
-	for (i = 0; i < tbl_size; i++) {
-		u32 j;
-
-		j = bd->rss_indir_tbl[i];
-		rxr = &bn->rx_ring[j];
-
-		*ring_tbl++ = cpu_to_le16(rxr->rx_ring_struct.fw_ring_id);
-		*ring_tbl++ = cpu_to_le16(bnge_cp_ring_for_rx(rxr));
-	}
-}
-
-static int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
-				  struct bnge_vnic_info *vnic)
-{
-	int rc;
-
-	rc = bnge_hwrm_vnic_set_rss(bn, vnic, true);
-	if (rc) {
-		netdev_err(bn->netdev, "hwrm vnic %d set rss failure rc: %d\n",
-			   vnic->vnic_id, rc);
-		return rc;
-	}
-	rc = bnge_hwrm_vnic_cfg(bn, vnic);
-	if (rc)
-		netdev_err(bn->netdev, "hwrm vnic %d cfg failure rc: %d\n",
-			   vnic->vnic_id, rc);
-	return rc;
-}
-
-static int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
-{
-	struct bnge_dev *bd = bn->bd;
-	int rc, i, nr_ctxs;
-
-	nr_ctxs = bnge_cal_nr_rss_ctxs(bd->rx_nr_rings);
-	for (i = 0; i < nr_ctxs; i++) {
-		rc = bnge_hwrm_vnic_ctx_alloc(bd, vnic, i);
-		if (rc) {
-			netdev_err(bn->netdev, "hwrm vnic %d ctx %d alloc failure rc: %d\n",
-				   vnic->vnic_id, i, rc);
-			return -ENOMEM;
-		}
-		bn->rsscos_nr_ctxs++;
-	}
-
-	rc = bnge_hwrm_vnic_rss_cfg(bn, vnic);
-	if (rc)
-		return rc;
-
-	if (bnge_is_agg_reqd(bd)) {
-		rc = bnge_hwrm_vnic_set_hds(bn, vnic);
-		if (rc)
-			netdev_err(bn->netdev, "hwrm vnic %d set hds failure rc: %d\n",
-				   vnic->vnic_id, rc);
-	}
-	return rc;
-}
-
-static void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
-{
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
-	hlist_del_rcu(&fltr->base.hash);
-	kfree_rcu(fltr, base.rcu);
-}
-
-static void bnge_init_l2_filter(struct bnge_net *bn,
-				struct bnge_l2_filter *fltr,
-				struct bnge_l2_key *key, u32 idx)
-{
-	struct hlist_head *head;
-
-	ether_addr_copy(fltr->l2_key.dst_mac_addr, key->dst_mac_addr);
-	fltr->l2_key.vlan = key->vlan;
-	fltr->base.type = BNGE_FLTR_TYPE_L2;
-
-	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_add_head_rcu(&fltr->base.hash, head);
-	refcount_set(&fltr->refcnt, 1);
-}
-
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
-{
-	struct bnge_l2_filter *fltr;
-	struct hlist_head *head;
-
-	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hash) {
-		struct bnge_l2_key *l2_key = &fltr->l2_key;
-
-		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
-		    l2_key->vlan == key->vlan)
-			return fltr;
-	}
-	return NULL;
-}
-
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
-static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
-						   struct bnge_l2_key *key,
-						   gfp_t gfp)
-{
-	struct bnge_l2_filter *fltr;
-	u32 idx;
-
-	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
-	      BNGE_L2_FLTR_HASH_MASK;
-	fltr = bnge_lookup_l2_filter(bn, key, idx);
-	if (fltr)
-		return fltr;
-
-	fltr = kzalloc_obj(*fltr, gfp);
-	if (!fltr)
-		return ERR_PTR(-ENOMEM);
-
-	bnge_init_l2_filter(bn, fltr, key, idx);
-	return fltr;
-}
-
-static int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
-				     const u8 *mac_addr)
-{
-	struct bnge_l2_filter *fltr;
-	struct bnge_l2_key key;
-	int rc;
-
-	ether_addr_copy(key.dst_mac_addr, mac_addr);
-	key.vlan = 0;
-	fltr = bnge_alloc_l2_filter(bn, &key, GFP_KERNEL);
-	if (IS_ERR(fltr))
-		return PTR_ERR(fltr);
-
-	fltr->base.fw_vnic_id = bn->vnic_info[vnic_id].fw_vnic_id;
-	rc = bnge_hwrm_l2_filter_alloc(bn->bd, fltr);
-	if (rc)
-		goto err_del_l2_filter;
-	bn->vnic_info[vnic_id].l2_filters[idx] = fltr;
-	return rc;
-
-err_del_l2_filter:
-	bnge_del_l2_filter(bn, fltr);
-	return rc;
-}
-
 static bool bnge_mc_list_updated(struct bnge_net *bn, u32 *rx_mask,
 				 const struct netdev_hw_addr_list *mc)
 {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 8c300f2fb5f3..f6fd11de7de0 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -563,8 +563,6 @@ struct bnge_napi {
 };
 
 #define INVALID_STATS_CTX_ID	-1
-#define BNGE_VNIC_DEFAULT	0
-#define BNGE_MAX_UC_ADDRS	4
 
 #define BNGE_RX_MASK_CFG_FLAGS				\
 	(CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS |	\
@@ -572,78 +570,8 @@ struct bnge_napi {
 	 CFA_L2_SET_RX_MASK_REQ_MASK_ALL_MCAST |	\
 	 CFA_L2_SET_RX_MASK_REQ_MASK_BCAST)
 
-struct bnge_vnic_info {
-	u16		fw_vnic_id;
-#define BNGE_MAX_CTX_PER_VNIC	8
-	u16		fw_rss_cos_lb_ctx[BNGE_MAX_CTX_PER_VNIC];
-	u16		mru;
-	/* index 0 always dev_addr */
-	struct bnge_l2_filter *l2_filters[BNGE_MAX_UC_ADDRS];
-	u16		uc_filter_count;
-	u8		*uc_list;
-	dma_addr_t	rss_table_dma_addr;
-	__le16		*rss_table;
-	dma_addr_t	rss_hash_key_dma_addr;
-	u64		*rss_hash_key;
-	int		rss_table_size;
-#define BNGE_RSS_TABLE_ENTRIES		64
-#define BNGE_RSS_TABLE_SIZE		(BNGE_RSS_TABLE_ENTRIES * 4)
-#define BNGE_RSS_TABLE_MAX_TBL		8
-#define BNGE_MAX_RSS_TABLE_SIZE			\
-	(BNGE_RSS_TABLE_SIZE * BNGE_RSS_TABLE_MAX_TBL)
-	u32		rx_mask;
-
-	u8		*mc_list;
-	int		mc_list_size;
-	int		mc_list_count;
-	dma_addr_t	mc_list_mapping;
-#define BNGE_MAX_MC_ADDRS	16
-
-	u32		flags;
-#define BNGE_VNIC_RSS_FLAG	1
-#define BNGE_VNIC_MCAST_FLAG	4
-#define BNGE_VNIC_UCAST_FLAG	8
-	u32		vnic_id;
-};
-
-struct bnge_filter_base {
-	struct hlist_node	hash;
-	struct list_head	list;
-	__le64			filter_id;
-	u8			type;
-#define BNGE_FLTR_TYPE_L2	2
-	u8			flags;
-	u16			rxq;
-	u16			fw_vnic_id;
-	u16			vf_idx;
-	unsigned long		state;
-#define BNGE_FLTR_VALID		0
-#define BNGE_FLTR_FW_DELETED	2
-
-	struct rcu_head         rcu;
-};
-
-struct bnge_l2_key {
-	union {
-		struct {
-			u8	dst_mac_addr[ETH_ALEN];
-			u16	vlan;
-		};
-		u32	filter_key;
-	};
-};
-
-#define BNGE_L2_KEY_SIZE	(sizeof(struct bnge_l2_key) / 4)
-struct bnge_l2_filter {
-	/* base filter must be the first member */
-	struct bnge_filter_base	base;
-	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
-};
-
 u32 bnge_cp_ring_for_rx(struct bnge_rx_ring_info *rxr);
 u32 bnge_cp_ring_for_tx(struct bnge_tx_ring_info *txr);
-void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 int bnge_alloc_rx_data(struct bnge_net *bn, struct bnge_rx_ring_info *rxr,
 		       u16 prod, gfp_t gfp);
 u16 bnge_find_next_agg_idx(struct bnge_rx_ring_info *rxr, u16 idx);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 82895c236ff6..01205b161d82 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -11,6 +11,7 @@
 #include "bnge_hwrm.h"
 #include "bnge_hwrm_lib.h"
 #include "bnge_resc.h"
+#include "bnge_vnic.h"
 
 static u16 bnge_num_tx_to_cp(struct bnge_dev *bd, u16 tx)
 {
@@ -202,13 +203,13 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 		     BNGE_RSS_TABLE_MAX_TBL);
 }
 
-static u16 bnge_rss_ctxs_in_use(struct bnge_dev *bd,
-				struct bnge_hw_rings *hwr)
+static u16 bnge_get_total_rss_ctxs(struct bnge_dev *bd,
+				   struct bnge_hw_rings *hwr)
 {
 	return bnge_cal_nr_rss_ctxs(hwr->grp);
 }
 
-static u16 bnge_get_total_vnics(struct bnge_dev *bd, u16 rx_rings)
+static u16 bnge_get_total_vnics(struct bnge_dev *bd)
 {
 	return 1;
 }
@@ -219,24 +220,6 @@ u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd)
 	       BNGE_RSS_TABLE_ENTRIES;
 }
 
-static void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd)
-{
-	u16 max_entries, pad;
-	u32 *rss_indir_tbl;
-	int i;
-
-	max_entries = bnge_get_rxfh_indir_size(bd);
-	rss_indir_tbl = &bd->rss_indir_tbl[0];
-
-	for (i = 0; i < max_entries; i++)
-		rss_indir_tbl[i] = ethtool_rxfh_indir_default(i,
-							      bd->rx_nr_rings);
-
-	pad = bd->rss_indir_tbl_entries - max_entries;
-	if (pad)
-		memset(&rss_indir_tbl[i], 0, pad * sizeof(*rss_indir_tbl));
-}
-
 static void bnge_copy_reserved_rings(struct bnge_dev *bd,
 				     struct bnge_hw_rings *hwr)
 {
@@ -269,7 +252,7 @@ static bool bnge_need_reserve_rings(struct bnge_dev *bd)
 	if (hw_resc->resv_tx_rings != bnge_tx_rings_demand(bd))
 		return true;
 
-	vnic = bnge_get_total_vnics(bd, rx);
+	vnic = bnge_get_total_vnics(bd);
 
 	if (bnge_is_agg_reqd(bd))
 		rx <<= 1;
@@ -315,12 +298,12 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 		sh = true;
 	hwr.cmpl = bnge_cprs_demand(bd);
 
-	hwr.vnic = bnge_get_total_vnics(bd, hwr.rx);
+	hwr.vnic = bnge_get_total_vnics(bd);
 
 	if (bnge_is_agg_reqd(bd))
 		hwr.rx <<= 1;
 	hwr.grp = bd->rx_nr_rings;
-	hwr.rss_ctx = bnge_rss_ctxs_in_use(bd, &hwr);
+	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
 	hwr.stat = bnge_func_stat_ctxs_demand(bd);
 	old_rx_rings = bd->hw_resc.resv_rx_rings;
 	old_rx_nr_rings = bd->rx_nr_rings;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
new file mode 100644
index 000000000000..3a6c8f0a5954
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2026 Broadcom.
+
+#include <linux/kernel.h>
+#include <linux/dma-mapping.h>
+#include <linux/ethtool.h>
+
+#include "bnge.h"
+#include "bnge_netdev.h"
+#include "bnge_vnic.h"
+#include "bnge_hwrm_lib.h"
+#include "bnge_filter.h"
+#include "bnge_resc.h"
+
+void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd)
+{
+	u16 max_entries, pad;
+	u32 *rss_indir_tbl;
+	u16 i;
+
+	max_entries = bnge_get_rxfh_indir_size(bd);
+	rss_indir_tbl = &bd->rss_indir_tbl[0];
+
+	for (i = 0; i < max_entries; i++)
+		rss_indir_tbl[i] = ethtool_rxfh_indir_default(i,
+							      bd->rx_nr_rings);
+
+	pad = bd->rss_indir_tbl_entries - max_entries;
+	if (pad)
+		memset(&rss_indir_tbl[i], 0, pad * sizeof(*rss_indir_tbl));
+}
+
+void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic)
+{
+	__le16 *ring_tbl = vnic->rss_table;
+	struct bnge_rx_ring_info *rxr;
+	struct bnge_dev *bd = bn->bd;
+	u16 tbl_size, i;
+
+	tbl_size = bnge_get_rxfh_indir_size(bd);
+
+	for (i = 0; i < tbl_size; i++) {
+		u16 ring_id, j;
+
+		j = bd->rss_indir_tbl[i];
+		rxr = &bn->rx_ring[j];
+
+		ring_id = rxr->rx_ring_struct.fw_ring_id;
+		*ring_tbl++ = cpu_to_le16(ring_id);
+		ring_id = bnge_cp_ring_for_rx(rxr);
+		*ring_tbl++ = cpu_to_le16(ring_id);
+	}
+}
+
+int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
+			   struct bnge_vnic_info *vnic)
+{
+	int rc;
+
+	rc = bnge_hwrm_vnic_set_rss(bn, vnic, true);
+	if (rc) {
+		netdev_err(bn->netdev, "hwrm vnic %d set rss failure rc: %d\n",
+			   vnic->vnic_id, rc);
+		return rc;
+	}
+	rc = bnge_hwrm_vnic_cfg(bn, vnic);
+	if (rc)
+		netdev_err(bn->netdev, "hwrm vnic %d cfg failure rc: %d\n",
+			   vnic->vnic_id, rc);
+	return rc;
+}
+
+int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
+{
+	struct bnge_dev *bd = bn->bd;
+	int rc, i, nr_ctxs;
+
+	nr_ctxs = bnge_cal_nr_rss_ctxs(bd->rx_nr_rings);
+	for (i = 0; i < nr_ctxs; i++) {
+		rc = bnge_hwrm_vnic_ctx_alloc(bd, vnic, i);
+		if (rc) {
+			netdev_err(bn->netdev, "hwrm vnic %d ctx %d alloc failure rc: %d\n",
+				   vnic->vnic_id, i, rc);
+			return -ENOMEM;
+		}
+		bn->rsscos_nr_ctxs++;
+	}
+
+	rc = bnge_hwrm_vnic_rss_cfg(bn, vnic);
+	if (rc)
+		return rc;
+
+	if (bnge_is_agg_reqd(bd)) {
+		rc = bnge_hwrm_vnic_set_hds(bn, vnic);
+		if (rc)
+			netdev_err(bn->netdev, "hwrm vnic %d set hds failure rc: %d\n",
+				   vnic->vnic_id, rc);
+	}
+	return rc;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
new file mode 100644
index 000000000000..c81d3a64561e
--- /dev/null
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026 Broadcom */
+
+#ifndef _BNGE_VNIC_H_
+#define _BNGE_VNIC_H_
+
+struct bnge_net;
+struct bnge_dev;
+struct bnge_l2_filter;
+
+#define BNGE_RSS_TABLE_ENTRIES		64
+#define BNGE_RSS_TABLE_SIZE		(BNGE_RSS_TABLE_ENTRIES * 4)
+#define BNGE_RSS_TABLE_MAX_TBL		8
+#define BNGE_MAX_RSS_TABLE_SIZE			\
+	(BNGE_RSS_TABLE_SIZE * BNGE_RSS_TABLE_MAX_TBL)
+#define BNGE_MAX_RSS_TABLE_ENTRIES				\
+	(BNGE_RSS_TABLE_ENTRIES * BNGE_RSS_TABLE_MAX_TBL)
+
+#define BNGE_MAX_CTX_PER_VNIC	8
+
+#define BNGE_MAX_MC_ADDRS	16
+#define BNGE_MAX_UC_ADDRS	4
+
+enum {
+	BNGE_VNIC_DEFAULT	= 0
+};
+
+enum {
+	BNGE_VNIC_RSS_FLAG	= BIT(0),
+	BNGE_VNIC_MCAST_FLAG	= BIT(1),
+	BNGE_VNIC_UCAST_FLAG	= BIT(2)
+};
+
+struct bnge_vnic_info {
+	u16		fw_vnic_id;
+	u16		fw_rss_cos_lb_ctx[BNGE_MAX_CTX_PER_VNIC];
+	u16		mru;
+	/* index 0 always dev_addr */
+	struct bnge_l2_filter *l2_filters[BNGE_MAX_UC_ADDRS];
+	u16		uc_filter_count;
+	u8		*uc_list;
+	dma_addr_t	rss_table_dma_addr;
+	__le16		*rss_table;
+	dma_addr_t	rss_hash_key_dma_addr;
+	u64		*rss_hash_key;
+	int		rss_table_size;
+	u32		rx_mask;
+
+	u8		*mc_list;
+	int		mc_list_size;
+	int		mc_list_count;
+	dma_addr_t	mc_list_mapping;
+
+	u32		flags;
+	u32		vnic_id;
+};
+
+void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
+int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
+			   struct bnge_vnic_info *vnic);
+int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
+void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
+#endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

