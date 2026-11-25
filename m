Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607753;
	b=SW4FzfXNjW8b3AlY9gVtRjgPEubt7QhiEgmMiMKZb+7fdffYyUJQ63t2p6D8O/No1dS2
	 Yx2ziTTGjyZTOw7HGAqvEu41T7CFOTLPPZodvGxPf3ro8RGuFi7T18Ub6+inYVyJo6UoK
	 c0yGStZ8wuYzeWSXYRJ4UJV0fAOFfdwXk6Cf0Eq6pA9CZtjWXp80LZDn/AmJaiLxmgJVQ
	 +Etm1EftOqEg1YyP+iPVuMORgB9maolpYk2lPKdItRZt5yAjtwqbXs++hU3HsyQVhymq5
	 /xc5rJeOVXrEqj+HgaCfgmCbmewNA3zrTQG9mORYWs5MTT6VoqCbt1ji2coBllYgU0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607753;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
	b=onZweEUbFSj3sH7JbldhDjvmlL3G6Wpe1gnGdek2ctY8Ty14z97JbV2F4XrDjUD/rbVS
	 I5KWYKPQnLtboo8QULcUM7vWeP/ReHqjdanGkxj8F3fQgcyMXR5REcdJ5+5vNkRYJQMch
	 KgWIEmwU7AZP9N74zJCsI4aKZkQSOTHWh1G83CY6GKsHzcFzg8WfR7qJoUzXihKsKTrYx
	 ChQpf/I6h/Pqmx9YammthASc/nr//DmWjumWBwuRtUmogDuTgYU8BgCs7vjtu6W91odWf
	 WTcTXnuausaOVAAYeXLMBMhCk6sSzNGHJ2hZdesRfJL0uX54JVUEiY9kApBU9gYep7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T5ah+6hk;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC93606A336
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC93606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T5ah+6hk
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-38190551625so11258540eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607752; x=1796212552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
        b=u8aBhdp259iYRUfCvOzo4wmlYHL9kqARGIuYdjHsXEzCYkjsuTMnVaFHASFY5ollrO
         CSwo1psrorWz4LsQj8xYybt8sA2y79zMR16vhONWeH3x1wC1ziY830b7Ns8Q2fpNkA7p
         agVuM/WH23FQoSSDiO2oospQM5/HseG8QP9ZbexADaFBGeAGY7387l+hdQMpAByeDYCi
         ACXaYVZn6OGwHk+/ED9v3MbfZpTrVnybhyHDmdC9/xkhN/rNufQI2OhlftVYCESObevC
         NY58jenbrKyOqjedMimzB44oi092XxIylbjUC/XYckgY5uIWpICEu8SkYZ6A+V/qB8gy
         zVBg==
X-Gm-Message-State: APuU4Z9/5D4YUVzxzWGS+2lQk48uj6k6NCz5IAi+uqgZBF249te8YjvC
	PACySXybSlXX+JiLUdEyJMchtdmK4SOmRpOKl469xuk/b1gE2D3JihYihvNJTP6Nujhx1XV0dC2
	RaKH6sgE0h795FanldDkxgWZEJYEpKtiJwhJzUaF+em0dk1zFwZgFh3Q2/aEL51HObloZxrk261
	G63dp3HdoBgfEJBX5+2P+kkZLGnU6M5rTPCgr7BeaeINr00CUdYqmJBKXtnW7iYrFGulW0rn81U
	wMdPSnLaA==
X-Gm-Gg: AZFdTZc3Acd4nNJ5InFtJ/9zuEIg0MaTmdt5/peA3sYzO6tV+J3Sa5dZfFKeXoyb3yZ
	VU33hk7YnDvUZ0MJDdY28L05s1fV76nSD0iZqgn0aJubdKFoE7B9iWYKxYzaLIFy99AigzND1X/
	eyNu2hpbxWNGi+azSmONeXM7WGbFxfSr9UG7A4zaFRbAJ/1DaBg3jXfCzSiC57tCPw9IU9aqUvd
	uhqvXm5rerh1hUo311kLl7eYub33s9bjUaqm6Lq04Iw589NiX+1vFIRkBMvWOTwHCNmTgaQoKAH
	GnB5bPVQ406vV3iRCDDf4RANe52J15r3hDL2cbFB/cwwawbJV4D1hH/c9q7eXp8ECyBQafL4rxL
	c/GjM7ul+TC/94ZDTHooera/2lhge4Ff/h2Q1a5dlydPWJd/PjQBnuOrOZDJjjMjZgDe9prvL4M
	R7vxk/9ibas8mV3XoH0t+9lrGC3gkxLmdKYg==
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr17407498eec.29.1795607751770;
        Wed, 25 Nov 2026 03:55:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567cad5a7sm2616679eec.24.2026.11.25.03.55.51
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7515761eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607750; x=1796212550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
        b=T5ah+6hk40cTO2+ojvuyHUpKH8BOrZdqSHcAbWgAAqc/jsmRlqZPceG7zlHDZlllbt
         DC00D/TM/eiqw/H6s7pxjeuos0GdZSVlUDt4CdfoJYM+7e9oFNkWCkEWycDvrcTtXzR0
         /C+YzXZeyR/b8E+diO2mga+H3/ohgHg32Wu6k=
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr16140552eec.35.1795607749348;
        Wed, 25 Nov 2026 03:55:49 -0800 (PST)
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr16140512eec.35.1795607748615;
        Wed, 25 Nov 2026 03:55:48 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:48 -0800 (PST)
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
Subject: [PATCH net-next v10 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Wed, 25 Nov 2026 17:24:34 +0530
Message-ID: <20261125115434.2080590-11-vikas.gupta@broadcom.com>
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

NQ0 is requested at probe, before the rmap exists, and is not one of
the open NQs that bnge_request_irq() loops over. Add its vector to the
rmap first, so that the index of every vector in the rmap is its RX
ring index. Otherwise each vector lands one slot too low, and aRFS
steers a flow to the wrong RX queue.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index de7320521a3e..b031b3c0af0b 100644
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
@@ -2569,6 +2583,50 @@ static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
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
+/* The index of a vector in the aRFS cpu_rmap is the index of its RX ring, so
+ * the vectors must be added in ring order, starting with NQ0 (ring 0).
+ */
+static void bnge_nq_add_cpu_rmap(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+#ifdef CONFIG_RFS_ACCEL
+	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
+	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
+	int rc;
+
+	if (!rmap || !bnapi->rx_ring)
+		return;
+
+	rc = irq_cpu_rmap_add(rmap, bn->bd->irq_tbl[map_idx].vector);
+	if (rc) {
+		netdev_warn(bn->netdev,
+			    "failed adding irq rmap for ring %d, disabling aRFS\n",
+			    bnapi->index);
+		bnge_free_cpu_rmap(bn);
+	}
+#endif
+}
+
 static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
 	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
@@ -2578,6 +2636,8 @@ static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 
 	irq = &bd->irq_tbl[map_idx];
 
+	bnge_nq_add_cpu_rmap(bn, bnapi);
+
 	rc = request_irq(irq->vector, irq->handler, 0, irq->name, bnapi);
 	if (rc)
 		return rc;
@@ -2602,6 +2662,8 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
@@ -2616,6 +2678,13 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
+	/* NQ0 is requested at probe, before the rmap exists, and is not one
+	 * of the open NQs below. Add it first, so that the rmap index of
+	 * every vector is its RX ring index.
+	 */
+	bnge_nq_add_cpu_rmap(bn, bn->bnapi[0]);
+
 	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
-- 
2.52.0

