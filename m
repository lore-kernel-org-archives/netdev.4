Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146759;
	b=wpZyaNapfo76tpJIF5ELyHqakuGZwKYj0sEJosQtUq4Z7Djx+LEtI78nRPWvWu/LQrlE
	 EYhmk3YC31s7pi43AdQ2GfyD0JAVRCwUSIu4GKoYn6XMYHnC5YgcXnSsQRSRhtaSKjghM
	 1t8wBKgyB1AyeBkTrv53fVhKSp4RDyY/6qqBAGmD8Cn44wfbuyJL3rmeCxBBPVsRDxbfY
	 FmmxRcOJQdYWB0AZqUPomxhy6XPT2di9hCEh1rZTomcsPQ1qNPfdAPjj3IIDqKbZovvZY
	 5tm2KXAx39hdllpVl5n78wScGYjOxCEtcMjgl1Lo3+Nm0Ih5yKnW5/kYl1+WBkAWIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146759;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=avsKKgY1+4581o9u0sfUvJp4BcQTMrN8ViiHcgRJ1UM=;
	b=KXibQj8SFi07KzpiwsYjupamsfR7K4FRzwHvfAB9ePiQV1PU62bg5KM5ipFTJTSRoAoM
	 A3Z9EYKGdGLywyrgtArUn7+G6nJzsDXX9beAtJhRYCGILJOlMp+SaLbrZTZyS1R9aZG0Z
	 NTwHeHQ2KwLh15zUX6mPgnYx/fiZ8o1gFClJwQDaqx1Fbs/SoNpCGv0mddf3MK1DgMWTJ
	 UniZF/5oM+rvMSo0UskrTtOpyvt6ltPat2MCQ56+ZAf92zvtftuzGsD0hieGKT130F5H2
	 ZHI+vsN9rA43098SUQyjHHc4TktW9JEltUznSLtZgndduupMml+JkvX5ih109qVVxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lidxUl+k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC960A2617
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lidxUl+k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FA41F000E6;
	Fri, 20 Nov 2026 03:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146759;
	bh=avsKKgY1+4581o9u0sfUvJp4BcQTMrN8ViiHcgRJ1UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lidxUl+kUwKzNNOEqRGVm+i31Jyk2PhfSxOvwuapDCAlGyWDklhel0NDzIwIbKDmJ
	 CDhx2+9p9BI4RcqjxvIUJllX/vOjabumKLiMYoLxC7OfYEdgkUxc7UeC0FK7DY9Nl4
	 LTPSazG6wip/cQXYMJBPOxBzpESHe043XX2SbG5BiGq2dG65GwmSBMB4IcuSgyBtBo
	 0BrTed+YJVUBFsgos/oSIiRbHugT2INBNMILSYIANNkA1psSUK1k30zfcY57/xni/w
	 dSwFxgqNZ9XNLNIV5yuQNpMNhPm//Vqatb+PYPf+KMn9p5rDjQu1adTR4sE0Pg0f38
	 5StbT1SQ1m3mA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 6/7] eth: bnxt_en: add a local bp variable in the IRQ affinity notifier
Date: Thu, 19 Nov 2026 19:52:13 -0800
Message-ID: <20261120035214.369158-7-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035214.369158-1-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
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

bnxt_irq_affinity_notify() refers to irq->bp in almost every
statement. Add a local variable to shorten the lines, the next
patch will make the conditions at the end of the function more
complex. No functional change.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: new patch
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index a74599c1447a..2c80a39eb8f0 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11949,13 +11949,15 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 {
 	struct bnxt_irq *irq;
 	unsigned int cpu;
+	struct bnxt *bp;
 	int nid;
 	u16 tag;
 
 	irq = container_of(notify, struct bnxt_irq, affinity_notify);
+	bp = irq->bp;
 
-	cpumask_copy(irq->bp->ring_cpu_mask[irq->ring_nr], mask);
-	set_bit(irq->ring_nr, irq->bp->ring_affinity_set);
+	cpumask_copy(bp->ring_cpu_mask[irq->ring_nr], mask);
+	set_bit(irq->ring_nr, bp->ring_affinity_set);
 
 	/* Readers can't access ring_cpu_mask atomically, so pre-compute
 	 * the info they care about (NUMA node, TPH tag) and store it
@@ -11963,32 +11965,31 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 	 */
 	cpu = cpumask_first_and(mask, cpu_online_mask);
 	nid = cpu < nr_cpu_ids ? cpu_to_node(cpu) : NUMA_NO_NODE;
-	WRITE_ONCE(irq->bp->ring_nid[irq->ring_nr], nid);
+	WRITE_ONCE(bp->ring_nid[irq->ring_nr], nid);
 
 #ifdef CONFIG_RFS_ACCEL
-	if (irq->bp->dev->rx_cpu_rmap && irq->ring_nr < irq->bp->rx_nr_rings) {
+	if (bp->dev->rx_cpu_rmap && irq->ring_nr < bp->rx_nr_rings) {
 		int err;
 
-		err = cpu_rmap_update(irq->bp->dev->rx_cpu_rmap, irq->ring_nr,
-				      mask);
+		err = cpu_rmap_update(bp->dev->rx_cpu_rmap, irq->ring_nr, mask);
 		if (err)
-			netdev_warn(irq->bp->dev,
+			netdev_warn(bp->dev,
 				    "aRFS rmap update failed: %d\n", err);
 	}
 #endif
 
-	if (!irq->bp->tph_mode)
+	if (!bp->tph_mode)
 		return;
 
-	if (irq->ring_nr >= irq->bp->rx_nr_rings)
+	if (irq->ring_nr >= bp->rx_nr_rings)
 		return;
 
-	if (pcie_tph_get_cpu_st(irq->bp->pdev, TPH_MEM_TYPE_VM,
+	if (pcie_tph_get_cpu_st(bp->pdev, TPH_MEM_TYPE_VM,
 				cpumask_first(mask), &tag))
 		return;
 
 	WRITE_ONCE(irq->new_tag, tag);
-	bnxt_queue_sp_work(irq->bp, BNXT_TPH_UPDATE_SP_EVENT);
+	bnxt_queue_sp_work(bp, BNXT_TPH_UPDATE_SP_EVENT);
 }
 
 static void bnxt_irq_affinity_release(struct kref *ref)
-- 
2.56.1

