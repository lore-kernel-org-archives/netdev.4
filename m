Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896319;
	b=XUEuOB0x2SrbsjZ+EA/L07xuYrfHuYcEH0IGqnjJhaFg4VSUchqSF8q41bDRpoKWnQKc
	 Td5ANHaIL/CA9rizWXEaTU3abQdC5omjCvlUA/ECYA1guAk4oRGyRrplSF5r+wlTK2ub9
	 cPgkmxMWya6S0yx6o3ZjDFKJgkoZWWqPAEDtfl3Q12PE3NrNsdJbcOd/EYv/uylwANGOy
	 ZYBwz6/VsszzR04nQuw/IrtPsQRqsXDUqzW6X1FJagMqq4veMVw1GTJ/TRJ7/DIlz54cl
	 nlI98ZtlYSgYp0oP90E4NyCelx4TnG9pedmE09qQ3eXPY53/eRcvXHJr4i2bseEM8HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896319;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
	b=L3gcDmwl6LYfvU8ub6DwUuP/DHkRgUntjb7oY6js8nv7nq5wDGA7xL1kYOpiyJBtn78l
	 9UGvn/tIw3RaAqaH12JXP3+slP3n6vSY0IqIVMpyH3Z+m9Dht5lOMT2rsn8/ryP0twKxl
	 x8iyN2/QDsfy6mjpaS3/MujjnCrSZr7WmY8dhJKO1GM/26dPrv81oXGDcKIypIDVup8Pp
	 kCccWBmVzAIIMdfe0xf44d08IGcGo+CI8k5FfpU8ZKQZqdRvn0vkO4edGAWa98heex+k3
	 9Cc518YLQ+DVBcfFng1JMlF4Nf6xQXxtY1BlL7K3k3O8qVPFUGvpvYUTro+qhxGKBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZWAaJN8;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BFA606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BFA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZWAaJN8
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b179528d56so2056713a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896318; x=1795501118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
        b=LdXqMqlQqWmAHlx1L8OP3P3WIjKG6c+6RrfCFmmstUijStRldyzIW9bH4CaVova57p
         Hdx1pgBBSWu2C4ZZUh1d8NDOVT+klTCAuW5AI+d+BraVc348auNKNwToxVpD86b59Jcp
         He2FctFEItGvnOg1/ijU8fMkcNyEHrCjhPb3ZPf677mycqyeXS2fjluSbIWeM00gVwPx
         IOyNL+/55xXOy97dE6LJYwxVwdPKBs8tp79ZNz6pyxxadVDTNLBMgmyoFrFboK6pgCa+
         e1YMP/s8JEFhRCdfVrkl+K7l97yX9JFt/vmkv20z8Bz53cBoOtsEeZatDGnv+S9PmZNW
         3tTA==
X-Gm-Message-State: APuU4Z+vgOL7t7UCDPq8RqI1Uqa7iLMe1/BGtlbnozybIAQCcy6wHSk2
	3AcK4luiMXiaj+m5qvUA/9XV0cDaXBpPHBv8ioYQZpF0p1pPqAu9Dss9c7HN/CBGQZBG7SLs4+n
	SJhymSxw+3vBesJ8aB7rn1lvpzTPfS3rB/C/zdinW6r6yHBMFaJndY0W2wdOYy5F3ChmnWIFXGn
	2cHZ1OQC4mhp3jq/p2gpWQon7HW6RevTE5x9EIB/PasSEB65OlCnVC3r6s4e9WBLXwAlmmbYzmz
	YFOavyFllNdz093Hg==
X-Gm-Gg: AZFdTZfBHs6rs3k8lVB/jdJ3z1afKij+9rKe2L4HvuXCUUZfH2vO21IgvECxFQgz4ta
	pIhB1AeTPv4KfuH61gp0Qo1QHsqnGRf5ZU2I36v3a2rfHp0uzlvKOXnG6sPa2VQwyX/G+m+5SlR
	EDPHIMak4LbntmsjEX0EwsAe+udAwF37IzCgNMRi98siJ7Sf6hJixAr7OkYij4vgQQ5eyrkVrfw
	LVz7ys/IweLBNftRsgwHtqliv/DHnsrc7qH/fzG+TgE0aA+/dJY68wy+umogt2AWfGhlifhhEAe
	yBIPJVWv7NnVdxR8DLp2NeW6TMrrdOjUD6Kdj78nfcTxv+tarhS8m+eum2Wnr9AztrXBXrBeRaV
	kW0ewytzOsvqFyQamB93k1UlwPIvcCceUOXBbTrr3ldlHY/8ZBoKdXrC1WA62uOR4iJzG6beLUU
	lTVwyRhz8E1d/S/eusacHos3pBvbqY3XtKJVOgnqboG09K
X-Received: by 2002:a17:90b:4c05:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3b1b0a47cf5mr12466186a91.41.1794896318456;
        Mon, 16 Nov 2026 22:18:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceecbasm1136278a91.3.2026.11.16.22.18.38
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so36613005ad.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896317; x=1795501117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCKiASahuIrw6Fbc7uugzxhsMl3udZMIRE/MrjfigHk=;
        b=IZWAaJN8I9RsD0iJHuHu1+vVmARQhVz1b/m747MPpdlXxPc3BtqadxqZX7ILF8CoE8
         WtKjhUEzixHxKSzZ93MuaWqWRhf7mLzs3OfZWGHfkd3vZDCfPQbjGoXhLYprbwjiSfXM
         KJzcIhA8JiiBtveQype2BH8Ebte127E6+gdHE=
X-Received: by 2002:a17:902:fdaf:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2ee0d6654bfmr118905655ad.1.1794896316590;
        Mon, 16 Nov 2026 22:18:36 -0800 (PST)
X-Received: by 2002:a17:902:fdaf:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2ee0d6654bfmr118905465ad.1.1794896316065;
        Mon, 16 Nov 2026 22:18:36 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:35 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Kumar Mudide <kumar.mudide@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next v5 3/5] bnge: add bnge_for_each_open_nq() iterator
Date: Tue, 17 Nov 2026 06:16:39 +0000
Message-ID: <20261117061641.122942-4-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
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

Add BNGE_FIRST_OPEN_NQ and bnge_for_each_open_nq(), and use them in the
loops that will need to skip the NQ that is created at probe once it is
split out. The "open" NQs are those whose IRQs and firmware rings are
created in ndo_open() and destroyed in ndo_stop(), i.e., all NQs from
index BNGE_FIRST_OPEN_NQ on.

The loops that create, free and name the "open" NQs are converted: the
NQ and bnapi allocation, the firmware NQ alloc/free, and the IRQ
setup/request/free.

The following loops are intentionally left alone, as they cover all NQs
(including NQ0):

  - CP rings and per-NQ stats: NQ0's completion structures remain tied
    to open/stop.
  - NAPI registration (init/del) and enable/disable: NQ0's NAPI exists
    only between open and stop, like the others.
  - Interrupt arm/disarm: NQ0 is armed and disarmed together with the
    other NQs.

In bnge_hwrm_ring_free(), split the NQ free out of the completion ring
loop so that it can use the iterator, mirroring bnge_hwrm_ring_alloc().
This changes the order of the firmware commands: previously each NQ was
freed right after its own completion rings, now all completion rings
are freed first and all NQs after. Each completion ring is still freed
before the NQ it belongs to.

BNGE_FIRST_OPEN_NQ is 0 for now, i.e., every NQ is an open NQ, so the
macro expands to the loops it replaces. Apart from the firmware command
order above, no functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kumar Mudide <kumar.mudide@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  8 ++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 19 +++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index e76ba4e063bb..5cc08177ff86 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -238,6 +238,14 @@ struct bnge_dev {
 #define bnge_warn(bd, fmt, ...)	bnge_log(warn, bd, fmt, ##__VA_ARGS__)
 #define bnge_dbg(bd, fmt, ...)	bnge_log(dbg, bd, fmt, ##__VA_ARGS__)
 
+/* Index of the first NQ created in ndo_open() and destroyed in ndo_stop();
+ * lower NQs live from probe to remove.
+ */
+#define BNGE_FIRST_OPEN_NQ	0
+
+#define bnge_for_each_open_nq(i, bd) \
+	for ((i) = BNGE_FIRST_OPEN_NQ; (i) < (bd)->nq_nr_rings; (i)++)
+
 static inline bool bnge_is_roce_en(struct bnge_dev *bd)
 {
 	return bd->flags & BNGE_EN_ROCE;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index d95c3c1469da..c2f1f517348e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -549,7 +549,7 @@ static void bnge_free_nqs(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_free_nq(bn, bn->bnapi[i]);
 }
 
@@ -563,7 +563,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	 * so every NQ gets a distinct irq_tbl index.
 	 */
 	aux_msix = bnge_aux_get_msix(bd);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_alloc_nq(bn, bn->bnapi[i], aux_msix);
 		if (rc)
 			goto err_free_nqs;
@@ -571,7 +571,7 @@ static int bnge_alloc_nqs(struct bnge_net *bn)
 	return 0;
 
 err_free_nqs:
-	while (--i >= 0)
+	while (--i >= BNGE_FIRST_OPEN_NQ)
 		bnge_free_nq(bn, bn->bnapi[i]);
 	return rc;
 }
@@ -1255,10 +1255,11 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	bn->bnapi = bnapi;
 	bnapi += arr_size;
-	for (i = 0; i < bd->nq_nr_rings; i++, bnapi += size) {
+	bnge_for_each_open_nq(i, bd) {
 		bn->bnapi[i] = bnapi;
 		bn->bnapi[i]->index = i;
 		bn->bnapi[i]->bn = bn;
+		bnapi += size;
 	}
 
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
@@ -1976,7 +1977,7 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 	int i, rc = 0;
 
 	agg_rings = !!(bnge_is_agg_reqd(bd));
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_ring_struct *ring = &bnapi->nq_ring.ring_struct;
 
@@ -2615,7 +2616,9 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 
 		for (j = 0; j < nqr->cp_ring_count && nqr->cp_ring_arr; j++)
 			bnge_hwrm_cp_ring_free(bn, &nqr->cp_ring_arr[j]);
+	}
 
+	bnge_for_each_open_nq(i, bd) {
 		bnge_hwrm_nq_free(bn, bn->bnapi[i]);
 		bn->grp_info[i].nq_fw_ring_id = INVALID_HW_RING_ID;
 	}
@@ -2628,7 +2631,7 @@ static void bnge_setup_msix(struct bnge_net *bn)
 	int len, i;
 
 	len = sizeof(bd->irq_tbl[0].name);
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 		char *attr;
 
@@ -2713,7 +2716,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	for (i = 0; i < bd->nq_nr_rings; i++)
+	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
 
@@ -2727,7 +2730,7 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
-	for (i = 0; i < bd->nq_nr_rings; i++) {
+	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
 			goto err_free_irq;
-- 
2.47.3

