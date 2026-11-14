Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642524;
	b=UFp/knFUYiM6tqF8T6mdJDEAcy6D/BB9gBfTrw3cNoSFftrdQLY1EXs3eTbSvfohGAUk
	 5LEVIpO3nvs6XNdHA+1iD9c/GBpUADYMu0jFMb5+27ddlNfHRrhebLuIPHNMTwtu44yHE
	 Ni9rTURbCOwWPJFT+uff2UVAlyWN5YS1cYvkAN0QaBbC4nquSHH503IUlISsZBTRf+WDU
	 UOvruuhFTu93XhP1Bi4OQ1oSK13eon1FmEk/p/L2lRrats0xZJ+f/sx3TppzvzJXFbLxR
	 yKEAXw+2jmDv7EiF8/AyKq30wxQIzOR8uUgXmz7n0DcEUE6Iv/ijnM3TtGedzScwnrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642524;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
	b=MHo860/BSM08qsdgzxmu4fUKmjIEuv4gEHL0HwLSy09L14v0jVO71ZW58fjUQJQeMx2X
	 CD6LyHx8ez7apKwVF4WxpFu/b0mnmswqHf/eIufjQU0/s6QAH5JVfvMocW7/y1MviVBht
	 s7k5+BGAibDLt0+kKb04PCLdavuc1IjeDWD2XUltErZ/e2WpifK2cQ0aBPFPCy60witzd
	 j2c8FOkd7cuYNng92gQmvxQfbn6vGyL/MbMkfOVUFqM3I+4QUX2PspPMsFqcUlnd79NHa
	 cN0jtNqzlsqtTGXV588pFrzMkWD7KHJY+ZVv4UIh/YMMLcZ0wzVGxb1/8pYgdM/kYWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UTvbitmP;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDFA60A2629
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDFA60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UTvbitmP
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2317437a91.3
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642524; x=1795247324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
        b=L6s4Gdxu/ABnIQ4jyqrP+w3PGOiy3UZU7EDlCYLlGzkm4kBZjxHhtEK0y/1lWhCDbU
         cV7B4paqMYiKBCgsQMczhsUk8gvWXO6tZDEM0C9EuUr3g4B1g9X4tTvqYb9Su7XgRI1t
         oKfCNc7M+owpzhnUARtiwmf5jgGkxUTlhKSkBy9e8gsSc+mTGrAOLLEQz8Mdn+Ok7B6+
         UBTht6M4PDHQBb71q+3SFKpW2DQ5KmlWDIcrqyVZzQaCOWSsRsX0Ouw8SijtqfdWHdsl
         GM4GaQ11AJu+x4+bGiBjd6Hta+Zp15sOW3ssFd53yqWKwbtF80hmfPbHpa9oFTu6YPGE
         aVLg==
X-Gm-Message-State: APuU4Z9TTdMZ21RHQai/QyFhdz625Z8lpOtCuxlncm7puHICdIGwTzAR
	JF7zag5zMbDEBb0aL+V4bAf2Dp3ajTt8jFJv00yIpjrAxbPOcXBDAZ40VEQlifMG5Zl0ObVMUNK
	OfpL1h5dG8Ts2whkeFdII9X4DyhNF5bRkatxfwLuZcPU/VEANgEWJ+ErfPyzx25axhJsc34RPWP
	R3Cr4QL4rbsToTsqR9Ig9GBZxNPbWbetHGxeuIh0aMXKxTKRjfYg/cqECwkNMpW7bsH8gvAwpok
	A0ke2m+TQ==
X-Gm-Gg: AYBFou3f8YG2whjFLjBklvecYTm4YriX9S90U7Jvxp0knqWKaSd8+E+KF2RtzrGbuxs
	TpmCqk7brZHPsVrM3TvQJq37IYSovUvaG8KkhqIFRO/fV2evr8q3WdDEHMMm4JBstjy67+LD7X9
	ozMFfoUxJqobGvFSMhp24i1gIL2Y2TuI9p+o6aJwmXyS2Du99NzEiMwvi7W0DAX7FFirgIj+qw0
	w51HUNq+bJ2/r8TEz1ShOReQTCtZMtcJhjGWdA9JFbnaHWNBwLPAfbxGXLEWgWIFusJ7IJ3T3Yg
	CcXRk0LqZ8EJ4o1YFLRGD8BQt8/Fh5ZAXMQOLp9JkR1Po+TB0VBlFhHngoFiFy8tI0BUS+WRM7j
	uMZ60NV0L6/yX7C9NSPU3jeb07uQtFvkV0YhsgE3rzjCQ4JlHj9Zm0xFnjsXy8FMUXB+rldx+3v
	UMg9koPTLBXjwEoD/n1AhBX4X6SwCUtAtcTg==
X-Received: by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr4782024a91.0.1794642523557;
        Fri, 13 Nov 2026 23:48:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca680sm9748863a91.6.2026.11.13.23.48.43
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so2058863eec.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642522; x=1795247322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
        b=UTvbitmPWMp+HKq3rbKQP0XIUJTlrRFYebofIJCgEmgljKAkk4KuJhyTmpRVDf49Fb
         jc2pwXOEQ+LaRRyCr8Pf4oCgYYu5AWaPRYqQXto96/9mvIqWE2ialoWiORONU5zVqtHx
         ai/s3yfq5YfHwBEd9kiIfOS65GVuVQxsPvYdk=
X-Received: by 2002:a05:7300:d115:b0:36f:29bf:4326 with SMTP id 5a478bee46e88-37960384a9amr4085879eec.0.1794642521734;
        Fri, 13 Nov 2026 23:48:41 -0800 (PST)
X-Received: by 2002:a05:7300:d115:b0:36f:29bf:4326 with SMTP id 5a478bee46e88-37960384a9amr4085844eec.0.1794642521030;
        Fri, 13 Nov 2026 23:48:41 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:40 -0800 (PST)
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
Subject: [PATCH net-next v7 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Sat, 14 Nov 2026 13:17:42 +0530
Message-ID: <20261114074742.1484603-11-vikas.gupta@broadcom.com>
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
index 4a6df8cd9067..f55a2f18cbb7 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2483,10 +2484,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
@@ -2496,12 +2510,35 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
 	bnge_hwrm_stat_ctx_free(bn);
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
 static void bnge_free_irq(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_irq *irq;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 
@@ -2521,6 +2558,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2529,10 +2567,27 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
+#ifdef CONFIG_RFS_ACCEL
+	rmap = bn->netdev->rx_cpu_rmap;
+#endif
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 		struct bnge_irq *irq = &bd->irq_tbl[map_idx];
 
+		if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
+		    rmap && bn->bnapi[i]->rx_ring) {
+			rc = irq_cpu_rmap_add(rmap, irq->vector);
+			if (rc) {
+				netdev_warn(bn->netdev,
+					    "failed adding irq rmap for ring %d, disabling aRFS\n",
+					    i);
+				bnge_free_cpu_rmap(bn);
+				rmap = NULL;
+			}
+		}
+
 		rc = request_irq(irq->vector, irq->handler, 0, irq->name,
 				 bn->bnapi[i]);
 		if (rc)
-- 
2.52.0

