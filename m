Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428689;
	b=2vOnyeDBe3UbTq4Ed03XTeDQW7UYFCsY3ASm3wBiky+Xean6OL9QZGC58mciZeo8RG5l
	 pkSajl3b4kgQvDFvaqh6Gjki94P6S75AEBOLY0K7by4Ob0O8ZZNyOb+B7At4L1sQ5rTEm
	 TwUCROmxHZNSXD4PfxN2skKnW7iw6uFx+2diNPc5OlRGwTapZ4mQeHLnI1y+0QSJTMDJd
	 TGUhbTQj9Y5WgN2mSfl/Ga8yV4iX3Ox7F6muC9uW2ZuqQowxV5ncJ6DsInlL5RQLPdtjQ
	 rDHlP1wEKzxu7oIPOueJEWqKTpoLjrgecImmpLMzhRraczob+LyNOW30wUO9ZkV1vUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428689;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
	b=lqYpbR4IlynE+las4S9LQ0riqrREzo7r+p+YTTsff+CkziaAKsuL3HCB7W7cqUdtzjww
	 6EnwDyoIOtiX/8Yk9N6cIH290ch49RlfUMQLBqI38idg/6hbVGqArv+iFojSeQxcXREYo
	 l/6Kmaev9w9EI6jUs9h3vY78Qt45swJ9Z59xbpZgTdIYryb0eMH+0rQ+Rp5QeHwsEx8g9
	 EWlo4lll/4G+n6AtOr34shcvutP/igClu8C7uxy/aXUYABA/PpxeV/DKB3HaSeLUiMcIn
	 rnoOhYhWgFOsAe0XaHC58k53hNFFvMLDt5rbWxgRyIhuqYpwTHFHbAFv1+p+OzH4FLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X+tdNFYv;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D00606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D00606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X+tdNFYv
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1193488a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428688; x=1796033488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
        b=c7R3UmI60tYdMMaIkoAAP1tvVJdIn/DSiiPIbHZ01iEixw2WUwkKfGbJrn7lwwSbno
         JCrSeOzoqTN3nCu6amvcNNNTB48ewJV9jnp4/XJMYbZLcR4MUGESr60qJYWQ2SvkRTkL
         kOj8GOiv4+KC0+ABzgpgNUSiXq8HkU1pAYmT7YsFjirpi7WO28lH4XxeaZ59RQGqch/x
         +ffVrdI36bjzU2Om1ORe1lsZzSYfkMb0N5/d9NjN/3HtrUGbRm4FHRFP0wXxfWbOCArq
         BnFmboWunqfXV7R5VA7b3raM/BrlhicB8AmG/POIw2dSruuEluN/px1LmTJ9DAQHnwOy
         OnLA==
X-Gm-Message-State: APuU4Z+2kX4etVQg9EabuZSMiE6CKpOMTEqTr9VKztc6sFAKhiCWUIb2
	a7ZihlOIBHXTeOucS5ERFm6c3yUMeqcfWaTZxbx5HcI+6YtPvhPYMfluyfYzB5PbU/pqxdXyIU9
	V8B/jO6yfikM+H1K740p4a4+z9lPtD00w74xfLDz8G/IyA3EepdRfd1T+kDvwBr9SVM9zRTHdKk
	lEhnqO9cKjg5ShtX1YRYF/efTOB1M/Yfm5zVmCdzNrWK9eKwu465ANiQ1HMhvBxki9W71nIK/Yd
	bLEYFMxcg==
X-Gm-Gg: AZFdTZe5ctBUMnnrQhpV1DZrmKNEjfT4iuzVU9SLdfkA3iftCcjdF/noayZQgqd5Ezw
	szPpPml0/vuf/sSkUEfhoiOP+H41qIVv6g5ddF96ky0g1aiC8JWnhmq+oN3HO1Pm3xYKj06w8BC
	fG0rb/mK4IlscVgIrsFfsfaPXYa3IX/L9r5JPiPNSB8nF+xUqxWu6Xg+EUwK36sn6Qqjb667Wlp
	P7JKPkjAkgD1SEYEOSg7xK8VQiL9YUXymicruUPxwwye8kfl1361upOXFvFNejRBOZBuQpPUTDc
	RRtaYhXsBpzo4nJRkXEPueIUqcaYCeYvb82RsptfZL2XehTcPVjw+l13IFs+zAA/J9Ckc4fqzK/
	PZcN8mREc5cND40pARYzzZq0e3k/IxeZTYsfNVhQ36UU63rqaaN8dnD7K1TYAi9F/ngClNqqsNq
	l4gM76g5yZGZMurUZ+iu82YsDpHEZS+MREK/S8
X-Received: by 2002:a17:90b:2c84:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b41c8fe256mr9380196a91.17.1795428688048;
        Mon, 23 Nov 2026 02:11:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm8983718a91.3.2026.11.23.02.11.27
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:11:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so865659eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428686; x=1796033486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
        b=X+tdNFYvoBrwfr+QvUNbidrVK/HCwD5jDppwBErWVOvrpR/47stY53IUhdL9dwe/uI
         BI0pYbN1XSJlF7Jusl7niGJPK60SenAgA5jXW5/FmUby+TCrV4nl/t4SFs7KdRAtV7Z+
         3xVelZsTv04A1UNA7J2Mi8WNWQpI6geaZTWwg=
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr3653886eec.36.1795428686435;
        Mon, 23 Nov 2026 02:11:26 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr3653853eec.36.1795428685710;
        Mon, 23 Nov 2026 02:11:25 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:25 -0800 (PST)
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
Subject: [PATCH net-next v9 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Mon, 23 Nov 2026 15:37:46 +0530
Message-ID: <20261123100746.1975030-11-vikas.gupta@broadcom.com>
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

When CONFIG_RFS_ACCEL is enabled, allocate and populate a cpu_rmap
for the RX IRQ vectors so that the kernel's aRFS infrastructure can
correctly map flows to the RX queues serviced by the nearest CPU.

This ensures that NTUPLE rules created by the kernel steer packets
to the optimal queue based on CPU/IRQ affinity.

Also, This is the patch that turns aRFS on. Before it dev->rx_cpu_rmap
was never set, so set_rps_cpu() took its early exit and
bnge_rx_flow_steer() from the previous patch was never called.
A failed rmap allocation does not fail the open; aRFS stays off.
If adding an IRQ to the rmap fails for one ring, aRFS is turned off
for all rings, because a later ring would otherwise take the free slot
and map to the wrong RX queue.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index de7320521a3e..dcd073d8bdfa 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2539,10 +2540,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
 {
 	struct net_device *dev = bn->netdev;
 	struct bnge_dev *bd = bn->bd;
+	int rc;
 
 	bnge_setup_msix(bn);
 
-	return netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	rc = netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	if (rc)
+		return rc;
+
+#ifdef CONFIG_RFS_ACCEL
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE) {
+		dev->rx_cpu_rmap = alloc_irq_cpu_rmap(bd->rx_nr_rings);
+		if (!dev->rx_cpu_rmap)
+			netdev_warn(dev, "Unable to allocate the CPU rmap, aRFS disabled\n");
+	}
+#endif
+
+	return rc;
 }
 
 static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
@@ -2569,15 +2583,53 @@ static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 	irq->requested = 0;
 }
 
+#ifdef CONFIG_RFS_ACCEL
+/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the pointer and
+ * wait for readers that already loaded it before the rmap is freed.
+ */
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
+
+	if (!rmap)
+		return;
+
+	WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
+	synchronize_net();
+	free_irq_cpu_rmap(rmap);
+}
+#else
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+}
+#endif
+
 static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
 	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_irq *irq;
 	int rc;
 
+#ifdef CONFIG_RFS_ACCEL
+	rmap = bn->netdev->rx_cpu_rmap;
+#endif
+
 	irq = &bd->irq_tbl[map_idx];
 
+	if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
+	    rmap && bnapi->rx_ring) {
+		rc = irq_cpu_rmap_add(rmap, irq->vector);
+		if (rc) {
+			netdev_warn(bn->netdev,
+				    "failed adding irq rmap for ring %d, disabling aRFS\n",
+				    bnapi->index);
+			bnge_free_cpu_rmap(bn);
+			rmap = NULL;
+		}
+	}
+
 	rc = request_irq(irq->vector, irq->handler, 0, irq->name, bnapi);
 	if (rc)
 		return rc;
@@ -2602,6 +2654,8 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
@@ -2616,6 +2670,7 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
 	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
-- 
2.52.0

