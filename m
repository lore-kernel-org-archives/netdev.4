Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044769;
	b=urf2Tf7szlMcEuSrqME/UBo8S3r+p2vniOuT0/Y6nnCEWXTYStGaBX831BRLBS73Urho
	 zr9Z2WgkvpBa7OeZVD8JiBzKRgqwzfEdMkmnVEmC0C4fCoa2AUaKMUqngWappd2nBRv03
	 CwJSZuacBl2Y2DwW6uUm4UB79V3Ho7j8vNhYqPa2lt350biQkbyNc7xyAXl3KpQq/akXu
	 WpXuhPJBY9FqHpSaAZFx2bedtzBOGhh8UOST//K6M3nrJP9+YWv7P6gg50NyeZu4cHKgf
	 VDd2p9t9sOwBeVqb1cfBSXYNqXBEjGXxx+JRzZNclYlzM4yi4qP08WJ1Dy6Uap5dv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=Ce9EvMaYUdu6tS+9FZ9jmif4ZETGfZBuC/IDLqeY2Y0=;
	b=Bfd8fnTZC6a0HW6QGz3bOzreop6uqNC1ALy6bx6/67ZHbeqqH7y6NXEd3ujh3B0qP9xi
	 +8RJU/KUfTQ80JeW+SMeiboW/h2nGB4zgaDJtLZC/hf3ORif+Vl/Vm0klHL4hWXDdXM5I
	 4g3UrapiL/QoeHK9YFY0iPhq2D76PgIUZGTip4jGKFO5nksQgMAsxj+2aSxPhII7IDOdQ
	 acCnYIwO3kevBWycXCFqu4N8/4mILMpDMXa4//mxjs2u0M2b16HjDuF+FNYNuGkd+wXC8
	 9p6AI2Z2re6DAoR0vrlTxp1XQYPyPH4kLLQhAFB3ydY/31dM9VtL42u1te1CA1Wv5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=gNFGtlAf;
	arc=none smtp.remote-ip=173.37.86.76
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF460A2608;
	Wed, 18 Nov 2026 23:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFF460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=gNFGtlAf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=49313; q=dns/txt;
  s=iport01; t=1795044767; x=1796254367;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Ce9EvMaYUdu6tS+9FZ9jmif4ZETGfZBuC/IDLqeY2Y0=;
  b=gNFGtlAfiE/4dy5UckoqBFutvNr4IyTEq2pp3uWbDhuqi2+IoJIWnwG4
   qeey+WqCNGSl8XIQ/1OxMGSBFI5UcBePhAc85iKJvvWNyQVomW8I40LmX
   e+UTYoKJlr0TactIcZjmQTbBdnqcufnnRqcjefMu8Ueez9wFHOCXVKyfQ
   zL2HwcmIr2I8A+Zc02pQ3+psm7cHykyMHYezynE6QEzgzaWYod3bZxWfV
   zA4npyx1Nwe9q/Oi4IIV9h7uWoc+pwSYWfA3gOjvblBXltGoj2l8n+THG
   vOhtZe8x/QVvTN/4OFX/maxF2BAk+XuGJEkqB2o25IqD6c9pAoYYwebYV
   Q==;
X-CSE-ConnectionGUID: gVRJbigoSZ68/8aZyg+OEg==
X-CSE-MsgGUID: 7CE3BitgSBuAXNvTHLA39w==
X-IPAS-Result: =?us-ascii?q?A0BJAgBDNP5q/5L/Ja1QCh4BAQsSDIIFC4IYP4FVQ0mEV?=
 =?us-ascii?q?49TgiGBFpA8jFkUgWoPAQEBD1EEAQGCEoJzAo4gAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZckBMCAQMaAQgEQBIQJQImAgJGEAYBE?=
 =?us-ascii?q?oIqWIJ1A7lden8zgQGEftlLgWgBCxQBgQouhXSCbgGBcYQIO4NHeycbgUlEg?=
 =?us-ascii?q?RWCWRt2axoBgxAJC4N1gmoEgiJ6EoFSgQSFOpAvCT+BAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?WNSMwMgCgsSEhgVAhQdEg8EFjIdcAwnEikXL1gbBgWBHHMUBBOBEoEDXYErK?=
 =?us-ascii?q?F0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?wgDGgVAAh8IAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CChgNSBEsFCMGDxkEP?=
 =?us-ascii?q?QFuB5NLgiAGATkYDhEBAQYHCBcQGwEiCQsHDAgwJgoELQQMCSkKBBcFEAUDB?=
 =?us-ascii?q?g4ZARsQGQOSYAkBg3WNXmuBNZ9chCuBaKAQM4QEk2aTCJkII4I2oG0nBg8JA?=
 =?us-ascii?q?QJNhGqBaDyBWTMaCBsVO4JnUxkPjisDCwuTHQG9ACYyPgEHAgcPAoFzkAAED?=
 =?us-ascii?q?Rd2YAEB?=
IronPort-Data: A9a23:4DOcxquJaMxmCy55SlIK0/cuKOfnVIRfMUV32f8akzHdYApBsoF/q
 tZmKTyOP6uPNGqmcoh3bdy1o0JXvMDRx99iSQNpqio1HyhGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva+Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9dhNI2tP+
 vsjGm5dKUCKtfO5g5WWRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtJYH49tL/Aan3XaDREqUmVpqof6GnIxws327/oWDbQUoHWFJkNzxrE+
 goq+UymKTxBHt2DxgGv71ucoPHzvQfSA9MNQejQGvlCxQf7KnYoIBEfS1a+ifWwlEO7X9VRN
 woS9zZGhaU+6UmiXNThdx61uniJulgbQdU4O+098gSW4qnZ+QCUAi4DVDEpQN87vsYeRjEw0
 FKN2dTzClRHubuZU3+CtbGZsT+/JwARMGkEIyQEJSMd6tPupoAblB/DTt9/VqWyi7XdHTD23
 iDPryUkgbgXpdAE2r/9/l3dhT+o4J/TQWYd4AjLUm+7xh12aZTjZIGy71Xfq/FaI+6kokKpp
 nMInY2aqesJF5zIzH3LS+QWF7bv7PGAWNHBvWNS81Aa32zF0xaekUp4ulmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:neHl1qCVnMBMxVHlHela55DYdb4zR+YMi2TDGXoBLSC9Ffb4qy
 nOppomPHDP5Qr5NEtLpTnEAtjjfZq+z/FICPcqXYtKNTOO0ACVxcNZnOjfKlbbdxEWmNQtsJ
 tIQuxSBML9CF5igd2/wgWpeuxQueWvweSEifjTynF1QRovUaFv6A9lFh2We3cGIjWufaBJc6
 a0145guyeqf2gRY4CQA3kIWPWGmvjw/aiWGSLvw3UcmXOzZfTC0s+ALySl
X-Talos-CUID: 9a23:zYNPAG5YutojDLTiQNss+3AuOMokfXrm/imAZB+xO3dmC5q4RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AitRicQ50VtKnImfJ8yV3iDmfxow3yIn1IkERnq4?=
 =?us-ascii?q?spuC0EzJMGxO012WoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="549409444"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:43 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id ABE5618000594;
	Wed, 18 Nov 2026 23:32:42 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Date: Wed, 18 Nov 2026 15:32:29 -0800
Subject: [PATCH net-next v3 3/6] enic: recover V2 VF mailbox after request
 failure
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-3-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sesidhar Baddela <sebaddel@cisco.com>, 
 Aravind Dhanasekaran <aradhana@cisco.com>, 
 Reese Faucette <rfaucett@cisco.com>, Satish Kharat <satishkh@cisco.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=51022;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=11IWnr2GyPzOGHRXbX52oLGMrLa1BRXIzahGkVWWuDA=;
 b=HoyoBLfVynxEozhOipZSmpOmlvyzJJgHnu+kW2S8wztH8+wRHGFQ1YIH3adKQRuLnDVXl5Pom
 yJHJcB50rciC6HTC4V74BaXjHslzK5oyDsfZcWflh/EpPkTePyoLyhj
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

A mailbox send can complete and still lose its reply. The VF then cannot
know whether the PF changed its state. A send-completion timeout is
different because the admin-WQ descriptor may still belong to the device.

Reconnect after a lost or inconsistent reply. For a posted-send timeout,
retain the mapping on the admin WQ, block sends, and start recovery after
releasing the sender lock. The prerequisite admin fix releases that graph
only when both admin queues stop; a retained graph cannot be reset or
reopened, and a final remove-time recheck may reclaim it.

Use the hang-reset worker for V2 VF recovery. Deployed async PFs permit
the hang-reset pair for VFs but deny soft reset and its capability query.
Issue the known V2 pair directly. Keep other ENIC functions' capability
and fallback behavior, with INIT deferred until soft reset completes.
Skip HANG_NOTIFY for mailbox recovery because it reports an actual Tx hang.

Close admin and stop the datapath before reset. Check stop, reset, INIT,
registration and reopen results before proceeding. Close an admin channel
opened for a VF when its datapath reopen fails. Keep recovery bounded by
the fault generation, allowing a follow-up only after committed success.

A QP_DISABLE error can be returned after both admin queues stop and the
old graph is released. During VF reconnect, use the resulting DOWN state
to permit reopen; keep a quarantined graph blocked.

Track committed software open/stop pairing with datapath_open. IFF_UP can
remain set after failed internal recovery, so later close must not disable
NAPI twice or program a live station filter on an actually closed VF.
Free existing IRQ callbacks before fallible queue-stop polling; on failure
detach the netdev and refuse open, reset and ring reconfiguration. This
bookkeeping does not prove DMA ownership or add generic queue or page-pool
quarantine. The generic queue-disable error path remains separate work.

A V2 VF can receive packets after CMD_ENABLE succeeds but before the
final mailbox-state check completes. Without late-unwind cleanup, a
failed check leaves completed entries in data CQs which a later open
reuses. On this late failure only, mask and synchronize datapath IRQs.
After the existing disable passes report every generic WQ and RQ
stopped, clean TX buffers, data CQs and interrupt credits. Do not
perform that extra cleanup when any queue fails to stop; this
change does not establish ownership of DMA memory for a stuck
generic queue or its RX page pool.

A test-only mailbox fault after a real CMD_ENABLE left 4,080 RQ
completions under directed VF traffic. The late unwind cleared
them; a guarded reopen on the same allocation graph saw none and
traffic resumed. A physically stuck DMA engine was not tested.

Keep VF receive traffic stopped during registration and initial open.
Later patches install the station address and initial packet filter before
traffic resumes, and schedule secondary address-list replay after open.
Defer ACK transmission off RX dispatch, authenticate PF completions from
CQ metadata, serialize runtime INIT, and update address-list counters
under their synchronization lock.

Assisted-by: LLM

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
 drivers/net/ethernet/cisco/enic/enic.h         |  25 ++
 drivers/net/ethernet/cisco/enic/enic_admin.c   |  37 +-
 drivers/net/ethernet/cisco/enic/enic_ethtool.c |   5 +
 drivers/net/ethernet/cisco/enic/enic_main.c    | 567 +++++++++++++++++++++----
 drivers/net/ethernet/cisco/enic/enic_mbox.c    | 184 +++++++-
 drivers/net/ethernet/cisco/enic/enic_mbox.h    |   2 +
 drivers/net/ethernet/cisco/enic/enic_rq.c      |  11 +-
 drivers/net/ethernet/cisco/enic/vnic_dev.c     |  21 +-
 drivers/net/ethernet/cisco/enic/vnic_dev.h     |   2 +
 9 files changed, 750 insertions(+), 104 deletions(-)

diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
index 15f17019c076..22a0ff71a43c 100644
--- a/drivers/net/ethernet/cisco/enic/enic.h
+++ b/drivers/net/ethernet/cisco/enic/enic.h
@@ -314,6 +314,27 @@ struct enic {
 	enum enic_admin_chan_state admin_chan_state;
 	/* Blocks sends throughout close, partial open and timeout recovery. */
 	bool mbox_send_disabled;
+	/* A send timeout leaves WQ descriptor ownership unresolved until channel
+	 * shutdown proves that both admin queues stopped.
+	 */
+	bool mbox_tx_poisoned;
+	/* After a lost or inconsistent reply, the VF cannot know whether the PF
+	 * applied the request. Reconnect during the next open or reset.
+	 */
+	bool vf_mbox_reconnect_required;
+	/* Suppress self-requeue while a reset worker is already attempting the
+	 * reconnect. The fault generation records a fault arriving during recovery
+	 * so one later generation is not lost. A failed handshake remains
+	 * quarantined until a later external recovery event or close/open.
+	 */
+	bool vf_mbox_recovery_active;
+	u32 vf_mbox_fault_generation;
+	/* One slow-path-owned predicate keeps the RX hot path fail-closed while
+	 * VF registration is lost or receive state may not match the PF.
+	 */
+	bool vf_rx_quarantined;
+	/* RTNL protects software open/stop pairing; this does not prove DMA stop. */
+	bool datapath_open;
 	struct vnic_wq admin_wq;
 	struct vnic_rq admin_rq;
 	struct vnic_cq admin_cq[2];
@@ -346,6 +367,10 @@ struct enic {
 	struct completion mbox_comp;
 	struct mutex vf_mbox_request_lock; /* serializes VF request lifetimes */
 	spinlock_t mbox_state_lock;	/* protects expected reply state */
+	spinlock_t vf_ack_lock;		/* protects vf_ack_list */
+	struct list_head vf_ack_list;
+	struct work_struct vf_ack_work;
+	unsigned int vf_ack_count;
 	u64 mbox_expected_msg_num;
 	u8 mbox_expected_reply;
 	bool mbox_initialized;
diff --git a/drivers/net/ethernet/cisco/enic/enic_admin.c b/drivers/net/ethernet/cisco/enic/enic_admin.c
index d4f3f58a0ec2..8b36dadb6463 100644
--- a/drivers/net/ethernet/cisco/enic/enic_admin.c
+++ b/drivers/net/ethernet/cisco/enic/enic_admin.c
@@ -134,14 +134,22 @@ unsigned int enic_admin_wq_cq_service(struct enic *enic)
  */
 #define ENIC_ADMIN_MSG_MAX	256
 
+static void enic_admin_rx_lost(struct enic *enic)
+{
+	if (enic_is_sriov_vf_v2(enic))
+		enic_mbox_vf_require_reconnect(enic);
+}
+
 static void enic_admin_msg_enqueue(struct enic *enic, void *buf,
 				   unsigned int len)
 {
 	struct enic_admin_msg *msg;
 
 	msg = kmalloc_flex(*msg, data, len);
-	if (!msg)
+	if (!msg) {
+		enic_admin_rx_lost(enic);
 		return;
+	}
 
 	msg->len = len;
 	memcpy(msg->data, buf, len);
@@ -154,6 +162,7 @@ static void enic_admin_msg_enqueue(struct enic *enic, void *buf,
 			netdev_warn(enic->netdev,
 				    "admin msg backlog full (%u); dropping\n",
 				    ENIC_ADMIN_MSG_MAX);
+		enic_admin_rx_lost(enic);
 		return;
 	}
 	list_add_tail(&msg->list, &enic->admin_msg_list);
@@ -167,6 +176,7 @@ unsigned int enic_admin_rq_cq_service(struct enic *enic)
 	struct vnic_rq *rq = &enic->admin_rq;
 	struct cq_enet_rq_desc *rq_desc;
 	struct vnic_rq_buf *buf;
+	u16 sender_vlan;
 	u16 bwf, bytes_written;
 	unsigned int work = 0;
 	void *desc;
@@ -186,6 +196,14 @@ unsigned int enic_admin_rq_cq_service(struct enic *enic)
 		 */
 		dma_rmb();
 		buf = rq->to_clean;
+		rq_desc = desc;
+		sender_vlan = le16_to_cpu(rq_desc->vlan);
+
+		/* A V2 VF's only valid admin-channel peer is its PF. Drop any
+		 * other sender before malformed CQ state can trigger recovery.
+		 */
+		if (enic_is_sriov_vf_v2(enic) && sender_vlan != 0)
+			goto next_desc;
 
 		/* Decode the actual number of bytes hardware wrote into
 		 * the RX buffer.  buf->len is the static allocation size
@@ -193,11 +211,12 @@ unsigned int enic_admin_rq_cq_service(struct enic *enic)
 		 * beyond the actual DMA payload.  bytes_written_flags is at
 		 * the same offset in every cq_enet_rq_desc[_32|_64] variant.
 		 */
-		rq_desc = desc;
 		bwf = le16_to_cpu(rq_desc->bytes_written_flags);
 		bytes_written = bwf & CQ_ENET_RQ_DESC_BYTES_WRITTEN_MASK;
-		if (bytes_written > buf->len)
+		if (bytes_written > buf->len) {
+			enic_admin_rx_lost(enic);
 			goto next_desc;
+		}
 
 		dma_sync_single_for_cpu(&enic->pdev->dev,
 					buf->dma_addr, buf->len,
@@ -212,23 +231,22 @@ unsigned int enic_admin_rq_cq_service(struct enic *enic)
 		if (bwf & CQ_ENET_RQ_DESC_FLAGS_TRUNCATED) {
 			netdev_warn_once(enic->netdev,
 					 "admin RQ: truncated message dropped\n");
+			enic_admin_rx_lost(enic);
 			goto next_desc;
 		}
 		if (!(rq_desc->flags & CQ_ENET_RQ_DESC_FLAGS_FCS_OK)) {
 			netdev_warn_once(enic->netdev,
 					 "admin RQ: bad FCS, dropping message\n");
+			enic_admin_rx_lost(enic);
 			goto next_desc;
 		}
 
 		if (enic->admin_rq_handler) {
-			u16 sender_vlan;
-
 			/* Firmware sets the CQ VLAN field to identify the
 			 * sender: 0 = PF, 1-based = VF index.  Overwrite
 			 * the untrusted src_vnic_id in the MBOX header with
 			 * the hardware-verified value.
 			 */
-			sender_vlan = le16_to_cpu(rq_desc->vlan);
 			if (bytes_written >= sizeof(struct enic_mbox_hdr)) {
 				struct enic_mbox_hdr *hdr = buf->os_buf;
 
@@ -726,6 +744,11 @@ int enic_admin_channel_close(struct enic *enic)
 		enic_admin_teardown_intr(enic);
 		cancel_work_sync(&enic->link_notify_work);
 		cancel_work_sync(&enic->admin_msg_work);
+		/* admin_msg_work is the sole VF ACK producer. Drain it before
+		 * the ACK worker so no producer can race the final purge.
+		 */
+		if (enic_is_sriov_vf_v2(enic))
+			enic_mbox_vf_ack_cancel(enic);
 		enic_admin_msg_drain(enic);
 	}
 
@@ -771,6 +794,7 @@ int enic_admin_channel_close(struct enic *enic)
 	}
 
 	enic_admin_channel_release(enic);
+	WRITE_ONCE(enic->mbox_tx_poisoned, false);
 	mutex_unlock(&enic->mbox_lock);
 
 	/* Firmware rejection does not undermine the WQ/RQ proof. */
@@ -797,6 +821,7 @@ int enic_admin_channel_final_recheck(struct enic *enic)
 	}
 
 	enic_admin_channel_release(enic);
+	WRITE_ONCE(enic->mbox_tx_poisoned, false);
 	mutex_unlock(&enic->mbox_lock);
 	netdev_info(enic->netdev,
 		    "Admin queues stopped during final teardown; releasing DMA graph\n");
diff --git a/drivers/net/ethernet/cisco/enic/enic_ethtool.c b/drivers/net/ethernet/cisco/enic/enic_ethtool.c
index 61541fb8db7b..d69963755b6b 100644
--- a/drivers/net/ethernet/cisco/enic/enic_ethtool.c
+++ b/drivers/net/ethernet/cisco/enic/enic_ethtool.c
@@ -381,6 +381,9 @@ static int enic_set_ringparam(struct net_device *netdev,
 	unsigned int tx_pending;
 	int err = 0;
 
+	if (!netif_device_present(netdev))
+		return -ENODEV;
+
 	if (ring->rx_mini_max_pending || ring->rx_mini_pending) {
 		netdev_info(netdev,
 			    "modifying mini ring params is not supported");
@@ -409,6 +412,8 @@ static int enic_set_ringparam(struct net_device *netdev,
 	}
 	if (running)
 		dev_close(netdev);
+	if (!netif_device_present(netdev))
+		return -ENODEV;
 	c->rq_desc_count =
 		ring->rx_pending & 0xffffffe0; /* must be aligned to groups of 32 */
 	c->wq_desc_count =
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index dde9098357d1..e6232927af80 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1038,12 +1038,13 @@ void enic_reset_addr_lists(struct enic *enic)
 {
 	struct net_device *netdev = enic->netdev;
 
+	netif_addr_lock_bh(netdev);
 	__dev_uc_unsync(netdev, NULL);
 	__dev_mc_unsync(netdev, NULL);
-
 	enic->mc_count = 0;
 	enic->uc_count = 0;
 	enic->flags = 0;
+	netif_addr_unlock_bh(netdev);
 }
 
 static int enic_set_mac_addr(struct net_device *netdev, char *addr)
@@ -1718,11 +1719,27 @@ static void enic_notify_timer_start(struct enic *enic)
 	}
 }
 
-/* rtnl lock is held, process context */
-static int enic_open(struct net_device *netdev)
+static int enic_admin_chan_reopen(struct enic *enic);
+
+static void enic_schedule_datapath_reset(struct enic *enic)
+{
+	if (READ_ONCE(enic->netdev->reg_state) == NETREG_REGISTERED)
+		schedule_work(&enic->reset);
+}
+
+static void enic_detach_after_recovery_failure(struct enic *enic)
+{
+	netif_device_detach(enic->netdev);
+	netif_carrier_off(enic->netdev);
+}
+
+static int __enic_open(struct net_device *netdev,
+		       bool schedule_reset_on_failure)
 {
 	struct enic *enic = netdev_priv(netdev);
+	bool clear_cqs = false;
 	unsigned int i;
+	int stop_err = 0;
 	int err, ret;
 	unsigned int max_pkt_len = netdev->mtu + VLAN_ETH_HLEN;
 	struct page_pool_params pp_params = {
@@ -1743,6 +1760,37 @@ static int enic_open(struct net_device *netdev)
 	    enic_admin_channel_is_quarantined(enic))
 		return -EBUSY;
 
+	/* A reply timeout invalidates the current request generation. Rebuild and
+	 * re-register before allocating datapath resources. A send timeout also
+	 * enters this path. Close releases it only after both queues stop;
+	 * otherwise it is retained for the final remove-time recheck.
+	 */
+	if (enic_is_sriov_vf_v2(enic) &&
+	    (READ_ONCE(enic->admin_chan_state) != ENIC_ADMIN_CHAN_LIVE ||
+	     READ_ONCE(enic->mbox_tx_poisoned) ||
+	     !READ_ONCE(enic->vf_registered) ||
+	     READ_ONCE(enic->vf_mbox_reconnect_required))) {
+		/* Re-registration makes the PF discard the old VF-requested
+		 * filters.  Clear the netdev-core synchronization state so the
+		 * receive-mode callback replays the current address lists.
+		 */
+		enic_reset_addr_lists(enic);
+		if (READ_ONCE(enic->admin_chan_state) !=
+		    ENIC_ADMIN_CHAN_DOWN) {
+			err = enic_admin_channel_close(enic);
+			if (READ_ONCE(enic->admin_chan_state) !=
+			    ENIC_ADMIN_CHAN_DOWN) {
+				if (schedule_reset_on_failure &&
+				    !enic_admin_channel_is_quarantined(enic))
+					enic_schedule_datapath_reset(enic);
+				return err ?: -EBUSY;
+			}
+		}
+		err = enic_admin_chan_reopen(enic);
+		if (err)
+			return err;
+	}
+
 	err = enic_request_intr(enic);
 	if (err) {
 		netdev_err(netdev, "Unable to request irq.\n");
@@ -1801,17 +1849,47 @@ static int enic_open(struct net_device *netdev)
 		netdev_err(netdev, "Failed to enable device: %d\n", err);
 		goto err_out_dev_enable;
 	}
+	if (enic_is_sriov_vf_v2(enic)) {
+		/* Commit the replay only if no mailbox fault arrived while station
+		 * and receive policy were being programmed.  Keep the state lock
+		 * through the carrier transition so a later fault necessarily wins
+		 * and turns carrier back off.
+		 */
+		spin_lock_bh(&enic->mbox_state_lock);
+		if (!READ_ONCE(enic->vf_registered) ||
+		    READ_ONCE(enic->mbox_send_disabled) ||
+		    READ_ONCE(enic->mbox_tx_poisoned) ||
+		    READ_ONCE(enic->vf_mbox_reconnect_required)) {
+			err = -EIO;
+		} else {
+			WRITE_ONCE(enic->vf_rx_quarantined, false);
+			enic_mbox_vf_link_state_set_running(enic, true);
+		}
+		spin_unlock_bh(&enic->mbox_state_lock);
+		if (err) {
+			netdev_err(netdev,
+				   "MBOX state changed during VF datapath open\n");
+			goto err_out_dev_disable;
+		}
+	}
 
 	for (i = 0; i < enic->intr_count; i++)
 		vnic_intr_unmask(&enic->intr[i]);
-
 	enic_notify_timer_start(enic);
 	enic_rfs_timer_start(enic);
-	if (enic_is_sriov_vf_v2(enic))
-		enic_mbox_vf_link_state_set_running(enic, true);
+	WRITE_ONCE(enic->datapath_open, true);
 
 	return 0;
 
+err_out_dev_disable:
+	/* The only caller reached this label after CMD_ENABLE succeeded. */
+	for (i = 0; i < enic->intr_count; i++) {
+		vnic_intr_mask(&enic->intr[i]);
+		(void)vnic_intr_masked(&enic->intr[i]);
+	}
+	enic_synchronize_irqs(enic);
+	clear_cqs = true;
+	enic_dev_disable(enic);
 err_out_dev_enable:
 	for (i = 0; i < enic->rq_count; i++)
 		napi_disable(&enic->napi[i]);
@@ -1821,8 +1899,11 @@ static int enic_open(struct net_device *netdev)
 	netif_tx_disable(netdev);
 	if (!enic_is_dynamic(enic) && !enic_is_sriov_vf(enic))
 		enic_dev_del_station_addr(enic);
-	for (i = 0; i < enic->wq_count; i++)
-		vnic_wq_disable(&enic->wq[i].vwq);
+	for (i = 0; i < enic->wq_count; i++) {
+		ret = vnic_wq_disable(&enic->wq[i].vwq);
+		if (ret)
+			stop_err = ret;
+	}
 err_out_free_rq:
 	for (i = 0; i < enic->rq_count; i++) {
 		ret = vnic_rq_disable(&enic->rq[i].vrq);
@@ -1830,8 +1911,21 @@ static int enic_open(struct net_device *netdev)
 			vnic_rq_clean(&enic->rq[i].vrq, enic_free_rq_buf);
 			page_pool_destroy(enic->rq[i].pool);
 			enic->rq[i].pool = NULL;
+		} else {
+			stop_err = ret;
 		}
 	}
+	if (stop_err)
+		enic_detach_after_recovery_failure(enic);
+	else if (clear_cqs) {
+		/* Every generic WQ/RQ stopped; old completions cannot be reused. */
+		for (i = 0; i < enic->wq_count; i++)
+			vnic_wq_clean(&enic->wq[i].vwq, enic_free_wq_buf);
+		for (i = 0; i < enic->cq_count; i++)
+			vnic_cq_clean(&enic->cq[i]);
+		for (i = 0; i < enic->intr_count; i++)
+			vnic_intr_clean(&enic->intr[i]);
+	}
 	enic_dev_notify_unset(enic);
 err_out_free_intr:
 	enic_unset_affinity_hint(enic);
@@ -1840,13 +1934,23 @@ static int enic_open(struct net_device *netdev)
 	return err;
 }
 
+static int enic_open(struct net_device *netdev)
+{
+	return __enic_open(netdev, true);
+}
+
 /* rtnl lock is held, process context */
-static int enic_stop(struct net_device *netdev)
+static int __enic_stop(struct net_device *netdev)
 {
 	struct enic *enic = netdev_priv(netdev);
 	unsigned int i;
 	int err;
 
+	/* IFF_UP can outlive a failed internal recovery. Stop software once. */
+	if (!READ_ONCE(enic->datapath_open))
+		return 0;
+	WRITE_ONCE(enic->datapath_open, false);
+
 	for (i = 0; i < enic->intr_count; i++) {
 		vnic_intr_mask(&enic->intr[i]);
 		(void)vnic_intr_masked(&enic->intr[i]); /* flush write */
@@ -1871,23 +1975,25 @@ static int enic_stop(struct net_device *netdev)
 			napi_disable(&enic->napi[enic_cq_wq(enic, i)]);
 	netif_tx_disable(netdev);
 
+	/* Detach IRQ callbacks even if a later queue disable fails. */
+	enic_unset_affinity_hint(enic);
+	enic_free_intr(enic);
+
 	if (!enic_is_dynamic(enic) && !enic_is_sriov_vf(enic))
 		enic_dev_del_station_addr(enic);
 
 	for (i = 0; i < enic->wq_count; i++) {
 		err = vnic_wq_disable(&enic->wq[i].vwq);
 		if (err)
-			return err;
+			goto stop_failed;
 	}
 	for (i = 0; i < enic->rq_count; i++) {
 		err = vnic_rq_disable(&enic->rq[i].vrq);
 		if (err)
-			return err;
+			goto stop_failed;
 	}
 
 	enic_dev_notify_unset(enic);
-	enic_unset_affinity_hint(enic);
-	enic_free_intr(enic);
 
 	for (i = 0; i < enic->wq_count; i++)
 		vnic_wq_clean(&enic->wq[i].vwq, enic_free_wq_buf);
@@ -1902,6 +2008,18 @@ static int enic_stop(struct net_device *netdev)
 		vnic_intr_clean(&enic->intr[i]);
 
 	return 0;
+
+stop_failed:
+	/* Prevent another open from treating this partial stop as a clean one.
+	 * Generic queue DMA lifetime after a stop failure is separate work.
+	 */
+	enic_detach_after_recovery_failure(enic);
+	return err;
+}
+
+static int enic_stop(struct net_device *netdev)
+{
+	return __enic_stop(netdev);
 }
 
 static int _enic_change_mtu(struct net_device *netdev, int new_mtu)
@@ -2036,6 +2154,46 @@ static int enic_dev_open(struct enic *enic)
 	return err;
 }
 
+static int enic_dev_hang_reset_start(struct vnic_dev *vdev, int arg)
+{
+	struct enic *enic = vnic_dev_priv(vdev);
+	u64 a0 = (u32)arg, a1 = 0;
+	int err;
+
+	/* Historical async PFs allow HANG_RESET for a V2 VF but reject the
+	 * CMD_CAPABILITY query used by the generic helper.  Issue the known V2
+	 * protocol command directly so that rejection cannot select SOFT_RESET,
+	 * which those PFs do not allow.
+	 */
+	if (!enic_is_sriov_vf_v2(enic))
+		return vnic_dev_hang_reset(vdev, arg);
+
+	spin_lock_bh(&enic->devcmd_lock);
+	err = vnic_dev_cmd(vdev, CMD_HANG_RESET, &a0, &a1, 1000);
+	spin_unlock_bh(&enic->devcmd_lock);
+
+	return err;
+}
+
+static int enic_dev_hang_reset_done(struct vnic_dev *vdev, int *done)
+{
+	struct enic *enic = vnic_dev_priv(vdev);
+	u64 a0 = 0, a1 = 0;
+	int err;
+
+	if (!enic_is_sriov_vf_v2(enic))
+		return vnic_dev_hang_reset_done(vdev, done);
+
+	*done = 0;
+	spin_lock_bh(&enic->devcmd_lock);
+	err = vnic_dev_cmd(vdev, CMD_HANG_RESET_STATUS, &a0, &a1, 1000);
+	if (!err)
+		*done = a0 == 0;
+	spin_unlock_bh(&enic->devcmd_lock);
+
+	return err;
+}
+
 static int enic_dev_soft_reset(struct enic *enic)
 {
 	int err;
@@ -2049,12 +2207,17 @@ static int enic_dev_soft_reset(struct enic *enic)
 	return err;
 }
 
-static int enic_dev_hang_reset(struct enic *enic)
+static int enic_dev_hang_reset(struct enic *enic, bool *needs_init)
 {
 	int err;
 
-	err = enic_dev_wait(enic->vdev, vnic_dev_hang_reset,
-		vnic_dev_hang_reset_done, 0);
+	*needs_init = false;
+	err = enic_dev_wait(enic->vdev, enic_dev_hang_reset_start,
+			    enic_dev_hang_reset_done, 0);
+	if (!err && !enic_is_sriov_vf_v2(enic)) {
+		*needs_init =
+			vnic_dev_hang_reset_uses_soft_reset(enic->vdev);
+	}
 	if (err)
 		netdev_err(enic->netdev, "vNIC hang reset failed, err %d\n",
 			err);
@@ -2062,6 +2225,21 @@ static int enic_dev_hang_reset(struct enic *enic)
 	return err;
 }
 
+static int enic_vnic_dev_init(struct enic *enic)
+{
+	int err;
+
+	/* Runtime init shares the device-command registers with statistics and
+	 * other netdev operations. Probe-time init has no concurrent callers and
+	 * intentionally remains direct.
+	 */
+	spin_lock_bh(&enic->devcmd_lock);
+	err = vnic_dev_init(enic->vdev, 0);
+	spin_unlock_bh(&enic->devcmd_lock);
+
+	return err;
+}
+
 int __enic_set_rsskey(struct enic *enic)
 {
 	union vnic_rss_key *rss_key_buf_va;
@@ -2215,12 +2393,13 @@ static bool enic_control_dma_unresolved(struct enic *enic)
  * handshake (the reset wiped the VF's admin QP, so the VF must register
  * again), or for a PF re-push the current link state to registered VFs.
  */
-static void enic_admin_chan_reopen(struct enic *enic)
+static int enic_admin_chan_reopen(struct enic *enic)
 {
+	u32 recovery_generation = 0;
 	int err;
 
-	if (enic_admin_channel_is_quarantined(enic))
-		return;
+	if (enic_control_dma_unresolved(enic))
+		return -EBUSY;
 
 	/* Install the MBOX receive handler and clear pending reply state before
 	 * opening the channel, so the handler is in place before the admin
@@ -2238,31 +2417,63 @@ static void enic_admin_chan_reopen(struct enic *enic)
 	 */
 	if (enic_is_sriov_vf_v2(enic))
 		WRITE_ONCE(enic->vf_registered, false);
+	if (enic_is_sriov_vf_v2(enic)) {
+		spin_lock_bh(&enic->mbox_state_lock);
+		recovery_generation = enic->vf_mbox_fault_generation;
+		spin_unlock_bh(&enic->mbox_state_lock);
+	}
 
 	err = enic_admin_channel_open(enic);
 	if (err) {
 		netdev_err(enic->netdev,
 			   "admin channel reopen after reset failed: %d\n", err);
-		return;
+		return err;
 	}
 
 	if (enic_is_sriov_vf_v2(enic)) {
 		err = enic_mbox_vf_capability_check(enic);
 		if (err) {
+			int close_err;
+
 			netdev_err(enic->netdev,
 				   "MBOX capability check after reset failed: %d\n",
 				   err);
-			enic_admin_channel_close(enic);
+			close_err = enic_admin_channel_close(enic);
 			WRITE_ONCE(enic->vf_registered, false);
-			return;
+			return close_err ?: err;
 		}
 		err = enic_mbox_vf_register(enic);
 		if (err) {
+			int close_err;
+
 			netdev_err(enic->netdev,
 				   "MBOX VF re-registration after reset failed: %d\n",
 				   err);
-			enic_admin_channel_close(enic);
+			close_err = enic_admin_channel_close(enic);
 			WRITE_ONCE(enic->vf_registered, false);
+			return close_err ?: err;
+		}
+		enic_reset_addr_lists(enic);
+		/* Capability negotiation and registration establish a new protocol
+		 * generation. RX remains quarantined until enic_open() replays the
+		 * station and receive policy.
+		 */
+		spin_lock_bh(&enic->mbox_state_lock);
+		if (enic->vf_mbox_fault_generation != recovery_generation ||
+		    READ_ONCE(enic->mbox_tx_poisoned)) {
+			err = -EAGAIN;
+		} else {
+			WRITE_ONCE(enic->vf_mbox_reconnect_required, false);
+		}
+		spin_unlock_bh(&enic->mbox_state_lock);
+		if (err) {
+			int close_err;
+
+			netdev_warn(enic->netdev,
+				    "MBOX state changed during VF re-registration\n");
+			close_err = enic_admin_channel_close(enic);
+			WRITE_ONCE(enic->vf_registered, false);
+			return close_err ?: err;
 		}
 	} else {
 		/* The link came back up during enic_open() above while MBOX
@@ -2271,135 +2482,335 @@ static void enic_admin_chan_reopen(struct enic *enic)
 		 */
 		schedule_work(&enic->link_notify_work);
 	}
+
+	return 0;
+}
+
+static bool enic_vf_mbox_recovery_begin(struct enic *enic, u32 *generation)
+{
+	bool claimed = false;
+
+	/* Both reset workers claim ownership only after taking RTNL. This state
+	 * lock still makes the handoff atomic with mailbox fault producers.
+	 */
+	spin_lock_bh(&enic->mbox_state_lock);
+	if (!enic->vf_mbox_recovery_active) {
+		enic->vf_mbox_recovery_active = true;
+		*generation = enic->vf_mbox_fault_generation;
+		claimed = true;
+	}
+	spin_unlock_bh(&enic->mbox_state_lock);
+
+	return claimed;
+}
+
+static bool enic_vf_mbox_recovery_finish(struct enic *enic, u32 generation,
+					 bool succeeded)
+{
+	bool restart;
+
+	spin_lock_bh(&enic->mbox_state_lock);
+	/* Only a fully committed recovery may consume one late-fault retry. A
+	 * failed handshake remains quarantined for an external recovery event;
+	 * it must not create an unbounded reset/re-registration loop.
+	 */
+	restart = succeeded &&
+		  enic->vf_mbox_fault_generation != generation;
+	enic->vf_mbox_recovery_active = false;
+	spin_unlock_bh(&enic->mbox_state_lock);
+
+	return restart;
 }
 
 static void enic_reset(struct work_struct *work)
 {
 	struct enic *enic = container_of(work, struct enic, reset);
+	bool recovery_owned = false;
+	bool restart = false;
+	bool reopen;
+	u32 recovery_generation = 0;
+	int stop_err = 0;
+	int err = 0;
 
 	if (!netif_running(enic->netdev))
 		return;
-
 	rtnl_lock();
-
-	if (!netif_running(enic->netdev))
+	reopen = netif_running(enic->netdev);
+	if (!reopen || !netif_device_present(enic->netdev))
 		goto unlock;
 
-	/* Stop any activity from infiniband */
+	/* Serialize a live V2 VF protocol recovery and preserve its one bounded
+	 * late-fault follow-up.
+	 */
+	if (reopen && enic_is_sriov_vf_v2(enic)) {
+		recovery_owned =
+			enic_vf_mbox_recovery_begin(enic,
+						    &recovery_generation);
+		if (!recovery_owned)
+			goto unlock;
+	}
+
+	/* Stop any activity from infiniband. */
 	enic_set_api_busy(enic, true);
 
-	/* Close the V2 admin/MBOX channel before the soft reset. Release its
-	 * DMA resources only after both queues report stopped; otherwise
-	 * quarantine the channel and abandon the reset.
+	/* Close the admin channel before reset without sending DEL_MAC; reset and
+	 * fresh registration discard the old VF-requested state. Release its DMA
+	 * resources only after both queues report stopped. Otherwise quarantine
+	 * the channel and abandon the reset.
 	 */
 	if (enic_has_admin_chan(enic)) {
-		enic_admin_channel_close(enic);
+		int close_err = enic_admin_channel_close(enic);
+
+		if (close_err && enic_admin_channel_is_quarantined(enic))
+			netdev_err(enic->netdev,
+				   "Admin queue did not stop: %d\n", close_err);
+		else if (close_err)
+			netdev_warn(enic->netdev,
+				    "Admin QP disable returned: %d\n",
+				    close_err);
 		/* Channel close has drained registration replies. */
 		if (enic_is_sriov_vf_v2(enic))
 			WRITE_ONCE(enic->vf_registered, false);
 	}
-	if (enic_admin_channel_is_quarantined(enic)) {
-		/* Core close excludes netpoll and clears __LINK_STATE_START first. */
-		dev_close(enic->netdev);
-		goto reset_out;
-	}
+	if (READ_ONCE(enic->datapath_open))
+		stop_err = __enic_stop(enic->netdev);
 
-	enic_stop(enic->netdev);
 	if (enic_is_sriov_vf_v2(enic))
 		enic_mbox_vf_link_state_reset(enic);
+	if (stop_err || enic_control_dma_unresolved(enic)) {
+		err = stop_err ?: -EBUSY;
+		netdev_err(enic->netdev,
+			   "Recovery blocked after close (datapath stop %d)\n",
+			   stop_err);
+		goto reset_out;
+	}
+
+	err = enic_dev_soft_reset(enic);
+	if (err) {
+		enic_detach_after_recovery_failure(enic);
+		goto reset_out;
+	}
+	/* Firmware completes SOFT_RESET in OPEN state.  Non-dynamic vNICs need
+	 * CMD_INIT to recreate and enable their LIF before resource restore.
+	 */
+	if (!enic_is_dynamic(enic)) {
+		err = enic_vnic_dev_init(enic);
+		if (err) {
+			netdev_err(enic->netdev,
+				   "vNIC init after soft reset failed: %d\n",
+				   err);
+			enic_detach_after_recovery_failure(enic);
+			goto reset_out;
+		}
+	}
 
-	enic_dev_soft_reset(enic);
 	enic_reset_addr_lists(enic);
 	enic_init_vnic_resources(enic);
 	enic_set_rss_nic_cfg(enic);
 	enic_dev_set_ig_vlan_rewrite_mode(enic);
 	enic_ext_cq(enic);
 
-	if (enic_open(enic->netdev))
+	/* A V2 VF needs PF registration before enic_open() can install its
+	 * station address.  A V2 PF reopens afterwards and replays carrier.
+	 */
+	if (enic_is_sriov_vf_v2(enic)) {
+		err = enic_admin_chan_reopen(enic);
+		if (err)
+			goto reset_out;
+	}
+
+	if (reopen)
+		err = __enic_open(enic->netdev, false);
+	if (reopen && err) {
+		if (enic_is_sriov_vf_v2(enic) && enic_has_admin_chan(enic)) {
+			int close_err = enic_admin_channel_close(enic);
+
+			WRITE_ONCE(enic->vf_registered, false);
+			if (close_err)
+				netdev_warn(enic->netdev,
+					    "Admin close after datapath reopen failure returned: %d\n",
+					    close_err);
+		}
+		netdev_err(enic->netdev,
+			   "Failed to reopen datapath after reset: %d\n", err);
 		goto reset_out;
+	}
 
-	/* Re-establish the admin/MBOX channel after the data path is back up.
-	 * It was fully torn down by enic_admin_channel_close() above;
-	 * enic_admin_chan_reopen() reopens it and, for a PF re-pushes link
-	 * state, or for a VF re-runs the probe-time PF handshake.
+	/* A PF reopens its admin channel after the datapath and re-pushes link
+	 * state.  The VF handshake, which open depends on, completed above.
 	 */
-	if (enic_has_admin_chan(enic))
-		enic_admin_chan_reopen(enic);
-	if (enic_is_sriov_vf_v2(enic) &&
-	    enic_admin_channel_is_quarantined(enic))
-		dev_close(enic->netdev);
+	if (enic_has_admin_chan(enic) && !enic_is_sriov_vf_v2(enic)) {
+		int admin_err = enic_admin_chan_reopen(enic);
+
+		if (admin_err)
+			netdev_err(enic->netdev,
+				   "Failed to reopen PF admin channel after reset: %d\n",
+				   admin_err);
+		if (!err)
+			err = admin_err;
+	}
 
 reset_out:
 	/* Allow infiniband to fiddle with the device again */
 	enic_set_api_busy(enic, false);
 
-	call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
+	if (reopen)
+		call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
 
 unlock:
+	if (recovery_owned)
+		restart = enic_vf_mbox_recovery_finish(enic,
+						       recovery_generation,
+						       !err &&
+						       !enic_control_dma_unresolved(enic));
 	rtnl_unlock();
+	if (restart)
+		schedule_work(&enic->tx_hang_reset);
 }
 
 static void enic_tx_hang_reset(struct work_struct *work)
 {
 	struct enic *enic = container_of(work, struct enic, tx_hang_reset);
+	bool mailbox_recovery = false;
+	bool recovery_owned = false;
+	bool restart = false;
+	bool needs_init;
+	bool reopen;
+	u32 recovery_generation = 0;
+	int stop_err = 0;
+	int err = 0;
 
 	rtnl_lock();
-
-	if (!netif_running(enic->netdev))
+	reopen = netif_running(enic->netdev);
+	if (!reopen || !netif_device_present(enic->netdev))
 		goto unlock;
-
-	/* Stop any activity from infiniband */
+	if (reopen && enic_is_sriov_vf_v2(enic)) {
+		recovery_owned =
+			enic_vf_mbox_recovery_begin(enic,
+						    &recovery_generation);
+		if (!recovery_owned)
+			goto unlock;
+		mailbox_recovery =
+			READ_ONCE(enic->vf_mbox_reconnect_required) ||
+			READ_ONCE(enic->mbox_tx_poisoned);
+	}
+
+	/* Stop any activity from infiniband. */
 	enic_set_api_busy(enic, true);
 
-	/* Close the V2 admin/MBOX channel before the hang reset. Release its
-	 * DMA resources only after both queues report stopped; otherwise
-	 * quarantine the channel and abandon the reset.
+	/* Report an actual Tx hang before stopping and cleaning its queue. Mailbox
+	 * recovery reuses the VF-allowed hang-reset pair but must not report a
+	 * spurious Tx hang. As in the soft-reset path, skip DEL_MAC because reset
+	 * and fresh registration are the cleanup boundary. Release admin DMA only
+	 * after both queues report stopped; otherwise quarantine the channel and
+	 * abandon the reset.
 	 */
+	if (!mailbox_recovery)
+		enic_dev_hang_notify(enic);
 	if (enic_has_admin_chan(enic)) {
-		enic_admin_channel_close(enic);
+		int close_err = enic_admin_channel_close(enic);
+
+		if (close_err && enic_admin_channel_is_quarantined(enic))
+			netdev_err(enic->netdev,
+				   "Admin queue did not stop: %d\n", close_err);
+		else if (close_err)
+			netdev_warn(enic->netdev,
+				    "Admin QP disable returned: %d\n",
+				    close_err);
 		/* Channel close has drained registration replies. */
 		if (enic_is_sriov_vf_v2(enic))
 			WRITE_ONCE(enic->vf_registered, false);
 	}
-	if (enic_admin_channel_is_quarantined(enic)) {
-		dev_close(enic->netdev);
-		goto reset_out;
-	}
-
-	enic_dev_hang_notify(enic);
-	enic_stop(enic->netdev);
+	if (READ_ONCE(enic->datapath_open))
+		stop_err = __enic_stop(enic->netdev);
 	if (enic_is_sriov_vf_v2(enic))
 		enic_mbox_vf_link_state_reset(enic);
+	if (stop_err || enic_control_dma_unresolved(enic)) {
+		err = stop_err ?: -EBUSY;
+		netdev_err(enic->netdev,
+			   "Recovery blocked after close (datapath stop %d)\n",
+			   stop_err);
+		goto hang_reset_out;
+	}
 
-	enic_dev_hang_reset(enic);
+	err = enic_dev_hang_reset(enic, &needs_init);
+	if (err) {
+		enic_detach_after_recovery_failure(enic);
+		goto hang_reset_out;
+	}
+	/* Native HANG_RESET preserves firmware's desired admin state and the
+	 * firmware reinitializes it.  Only the legacy SOFT_RESET fallback sets
+	 * needs_init and requires the deferred CMD_INIT below.
+	 */
+	if (needs_init && !enic_is_dynamic(enic)) {
+		err = enic_vnic_dev_init(enic);
+		if (err) {
+			netdev_err(enic->netdev,
+				   "vNIC init after hang reset failed: %d\n",
+				   err);
+			enic_detach_after_recovery_failure(enic);
+			goto hang_reset_out;
+		}
+	}
 	enic_reset_addr_lists(enic);
 	enic_init_vnic_resources(enic);
 	enic_set_rss_nic_cfg(enic);
 	enic_dev_set_ig_vlan_rewrite_mode(enic);
 	enic_ext_cq(enic);
 
-	if (enic_open(enic->netdev))
-		goto reset_out;
+	if (enic_is_sriov_vf_v2(enic)) {
+		err = enic_admin_chan_reopen(enic);
+		if (err)
+			goto hang_reset_out;
+	}
 
-	/* Re-establish the admin/MBOX channel after the data path is back up.
-	 * It was fully torn down by enic_admin_channel_close() above;
-	 * enic_admin_chan_reopen() reopens it and, for a PF re-pushes link
-	 * state, or for a VF re-runs the probe-time PF handshake.
+	if (reopen)
+		err = __enic_open(enic->netdev, false);
+	if (reopen && err) {
+		if (enic_is_sriov_vf_v2(enic) && enic_has_admin_chan(enic)) {
+			int close_err = enic_admin_channel_close(enic);
+
+			WRITE_ONCE(enic->vf_registered, false);
+			if (close_err)
+				netdev_warn(enic->netdev,
+					    "Admin close after datapath reopen failure returned: %d\n",
+					    close_err);
+		}
+		netdev_err(enic->netdev,
+			   "Failed to reopen datapath after hang reset: %d\n", err);
+		goto hang_reset_out;
+	}
+
+	/* A PF reopens its admin channel after the datapath and re-pushes link
+	 * state.  The VF handshake, which open depends on, completed above.
 	 */
-	if (enic_has_admin_chan(enic))
-		enic_admin_chan_reopen(enic);
-	if (enic_is_sriov_vf_v2(enic) &&
-	    enic_admin_channel_is_quarantined(enic))
-		dev_close(enic->netdev);
+	if (enic_has_admin_chan(enic) && !enic_is_sriov_vf_v2(enic)) {
+		int admin_err = enic_admin_chan_reopen(enic);
 
-reset_out:
+		if (admin_err)
+			netdev_err(enic->netdev,
+				   "Failed to reopen PF admin channel after hang reset: %d\n",
+				   admin_err);
+		if (!err)
+			err = admin_err;
+	}
+
+hang_reset_out:
 	/* Allow infiniband to fiddle with the device again */
 	enic_set_api_busy(enic, false);
 
-	call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
+	if (reopen)
+		call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
 
 unlock:
+	if (recovery_owned)
+		restart = enic_vf_mbox_recovery_finish(enic,
+						       recovery_generation,
+						       !err &&
+						       !enic_control_dma_unresolved(enic));
 	rtnl_unlock();
+	if (restart)
+		schedule_work(&enic->tx_hang_reset);
 }
 
 static int enic_set_intr_mode(struct enic *enic)
diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.c b/drivers/net/ethernet/cisco/enic/enic_mbox.c
index d1b6f13c8002..85fed8beb347 100644
--- a/drivers/net/ethernet/cisco/enic/enic_mbox.c
+++ b/drivers/net/ethernet/cisco/enic/enic_mbox.c
@@ -18,6 +18,8 @@
 #define ENIC_MBOX_POLL_TIMEOUT_US	5000000
 #define ENIC_MBOX_POLL_INTERVAL_US	100
 
+static void enic_mbox_vf_kick_recovery(struct enic *enic);
+
 static void enic_mbox_fill_hdr(struct enic *enic, struct enic_mbox_hdr *hdr,
 			       u8 msg_type,
 			       u16 dst_vnic_id, u16 msg_len, u64 msg_num)
@@ -43,6 +45,7 @@ static int enic_mbox_send_msg_id(struct enic *enic, u8 msg_type,
 	size_t total_len = sizeof(struct enic_mbox_hdr) + payload_len;
 	struct vnic_wq *wq = &enic->admin_wq;
 	struct wq_enet_desc *desc;
+	bool vf_timeout_recovery = false;
 	bool reply_expected = false;
 	unsigned long timeout;
 	dma_addr_t dma_addr;
@@ -157,7 +160,20 @@ static int enic_mbox_send_msg_id(struct enic *enic, u8 msg_type,
 		 * or free the buffer: the device may still DMA from dma_addr.
 		 * Mark the channel unusable so no further sends are attempted.
 		 */
+		spin_lock_bh(&enic->mbox_state_lock);
 		WRITE_ONCE(enic->mbox_send_disabled, true);
+		WRITE_ONCE(enic->mbox_tx_poisoned, true);
+		if (enic_is_sriov_vf_v2(enic)) {
+			/* The request may have changed PF receive policy even though
+			 * local descriptor ownership is still uncertain. Fail the VF
+			 * closed and do not turn this into an ordinary protocol
+			 * reconnect; the admin-channel lifecycle owns final reclamation.
+			 */
+			WRITE_ONCE(enic->vf_rx_quarantined, true);
+			enic->vf_mbox_fault_generation++;
+			vf_timeout_recovery = true;
+		}
+		spin_unlock_bh(&enic->mbox_state_lock);
 	}
 
 	netdev_dbg(enic->netdev,
@@ -174,6 +190,8 @@ static int enic_mbox_send_msg_id(struct enic *enic, u8 msg_type,
 		spin_unlock_bh(&enic->mbox_state_lock);
 	}
 	mutex_unlock(&enic->mbox_lock);
+	if (vf_timeout_recovery)
+		enic_mbox_vf_kick_recovery(enic);
 	return err;
 }
 
@@ -192,6 +210,105 @@ static int enic_mbox_send_reply(struct enic *enic, u8 msg_type,
 				     payload_len, msg_num, true, 0);
 }
 
+struct enic_mbox_vf_ack {
+	struct list_head list;
+	u64 msg_num;
+	u16 ret_major;
+	u8 msg_type;
+};
+
+static void enic_mbox_vf_ack_work(struct work_struct *work)
+{
+	struct enic *enic = container_of(work, struct enic, vf_ack_work);
+	struct enic_mbox_vf_ack *pending;
+
+	for (;;) {
+		struct enic_mbox_generic_reply ack = {};
+		u8 msg_type;
+		int err;
+
+		spin_lock_bh(&enic->vf_ack_lock);
+		if (list_empty(&enic->vf_ack_list)) {
+			spin_unlock_bh(&enic->vf_ack_lock);
+			break;
+		}
+		pending = list_first_entry(&enic->vf_ack_list,
+					   struct enic_mbox_vf_ack, list);
+		list_del(&pending->list);
+		enic->vf_ack_count--;
+		spin_unlock_bh(&enic->vf_ack_lock);
+
+		if (READ_ONCE(enic->mbox_send_disabled)) {
+			kfree(pending);
+			continue;
+		}
+
+		msg_type = pending->msg_type;
+		ack.ret_major = cpu_to_le16(pending->ret_major);
+		err = enic_mbox_send_reply(enic, msg_type, ENIC_MBOX_DST_PF,
+					   &ack, sizeof(ack), pending->msg_num);
+		kfree(pending);
+		if (err && net_ratelimit())
+			netdev_warn(enic->netdev,
+				    "MBOX: failed to send ACK type %u: %d\n",
+				    msg_type, err);
+	}
+}
+
+static void enic_mbox_vf_queue_ack(struct enic *enic, u8 msg_type,
+				   u64 msg_num, u16 ret_major)
+{
+	struct enic_mbox_vf_ack *pending;
+
+	if (READ_ONCE(enic->mbox_send_disabled))
+		return;
+	pending = kmalloc_obj(*pending, GFP_ATOMIC);
+	if (!pending) {
+		if (net_ratelimit())
+			netdev_warn(enic->netdev,
+				    "MBOX: dropping ACK type %u: no memory\n",
+				    msg_type);
+		return;
+	}
+	pending->msg_num = msg_num;
+	pending->ret_major = ret_major;
+	pending->msg_type = msg_type;
+
+	spin_lock_bh(&enic->vf_ack_lock);
+	if (READ_ONCE(enic->mbox_send_disabled) ||
+	    enic->vf_ack_count >= ENIC_ADMIN_DESC_COUNT) {
+		spin_unlock_bh(&enic->vf_ack_lock);
+		kfree(pending);
+		if (net_ratelimit())
+			netdev_warn(enic->netdev,
+				    "MBOX: dropping ACK type %u: queue unavailable\n",
+				    msg_type);
+		return;
+	}
+	list_add_tail(&pending->list, &enic->vf_ack_list);
+	enic->vf_ack_count++;
+	spin_unlock_bh(&enic->vf_ack_lock);
+	schedule_work(&enic->vf_ack_work);
+}
+
+void enic_mbox_vf_ack_cancel(struct enic *enic)
+{
+	struct enic_mbox_vf_ack *pending, *tmp;
+	LIST_HEAD(discard);
+
+	if (!enic->mbox_initialized)
+		return;
+	cancel_work_sync(&enic->vf_ack_work);
+	spin_lock_bh(&enic->vf_ack_lock);
+	list_splice_init(&enic->vf_ack_list, &discard);
+	enic->vf_ack_count = 0;
+	spin_unlock_bh(&enic->vf_ack_lock);
+	list_for_each_entry_safe(pending, tmp, &discard, list) {
+		list_del(&pending->list);
+		kfree(pending);
+	}
+}
+
 static int enic_mbox_vf_send_request(struct enic *enic, u8 request_type,
 				     u8 expected_reply, void *payload,
 				     u16 payload_len)
@@ -201,6 +318,34 @@ static int enic_mbox_vf_send_request(struct enic *enic, u8 request_type,
 				     expected_reply);
 }
 
+static void enic_mbox_vf_mark_reconnect_locked(struct enic *enic,
+					       bool registration_lost)
+{
+	lockdep_assert_held(&enic->mbox_state_lock);
+
+	if (registration_lost)
+		WRITE_ONCE(enic->vf_registered, false);
+	enic->vf_mbox_fault_generation++;
+	WRITE_ONCE(enic->vf_mbox_reconnect_required, true);
+	WRITE_ONCE(enic->mbox_send_disabled, true);
+	WRITE_ONCE(enic->vf_rx_quarantined, true);
+}
+
+static void enic_mbox_vf_kick_recovery(struct enic *enic)
+{
+	bool schedule = false;
+
+	enic_mbox_vf_link_state_set_running(enic, false);
+
+	spin_lock_bh(&enic->mbox_state_lock);
+	if (!enic->vf_mbox_recovery_active && netif_running(enic->netdev))
+		schedule = true;
+	spin_unlock_bh(&enic->mbox_state_lock);
+
+	if (schedule)
+		schedule_work(&enic->tx_hang_reset);
+}
+
 static int enic_mbox_wait_reply(struct enic *enic, unsigned long timeout_ms)
 {
 	unsigned long left;
@@ -211,9 +356,9 @@ static int enic_mbox_wait_reply(struct enic *enic, unsigned long timeout_ms)
 	if (left)
 		return 0;
 
-	/* Invalidate a request that the handler has not already accepted.  A
-	 * delayed reply cannot match a later request because message numbers are
-	 * monotonic across channel reopen.
+	/* Invalidate a request that the handler has not already accepted. Whether
+	 * losing the reply invalidates the current protocol generation is an
+	 * operation-specific decision made by the caller.
 	 */
 	spin_lock_bh(&enic->mbox_state_lock);
 	if (enic->mbox_expected_reply) {
@@ -476,9 +621,8 @@ static void enic_mbox_vf_handle_link_state(struct enic *enic, void *payload,
 					   u64 msg_num)
 {
 	struct enic_mbox_pf_link_state_notif_msg *notif = payload;
-	struct enic_mbox_pf_link_state_ack_msg ack = {};
 	u32 link_state = le32_to_cpu(notif->link_state);
-	int err;
+	u16 ret_major = 0;
 
 	spin_lock_bh(&enic->vf_link_state_lock);
 	switch (link_state) {
@@ -499,16 +643,16 @@ static void enic_mbox_vf_handle_link_state(struct enic *enic, void *payload,
 	default:
 		netdev_warn(enic->netdev, "MBOX: unknown link state %u\n",
 			    link_state);
-		ack.ack.ret_major = cpu_to_le16(ENIC_MBOX_ERR_GENERIC);
+		ret_major = ENIC_MBOX_ERR_GENERIC;
 		break;
 	}
 	spin_unlock_bh(&enic->vf_link_state_lock);
 
-	err = enic_mbox_send_reply(enic, ENIC_MBOX_PF_LINK_STATE_ACK,
-				   ENIC_MBOX_DST_PF, &ack, sizeof(ack), msg_num);
-	if (err && net_ratelimit())
-		netdev_warn(enic->netdev,
-			    "MBOX: failed to send link state ACK: %d\n", err);
+	/* Notification dispatch must not wait behind a synchronous request send:
+	 * its matching reply may be queued behind this notification.
+	 */
+	enic_mbox_vf_queue_ack(enic, ENIC_MBOX_PF_LINK_STATE_ACK, msg_num,
+			       ret_major);
 }
 
 void enic_mbox_vf_link_state_reset(struct enic *enic)
@@ -533,6 +677,17 @@ void enic_mbox_vf_link_state_set_running(struct enic *enic, bool running)
 	spin_unlock_bh(&enic->vf_link_state_lock);
 }
 
+void enic_mbox_vf_require_reconnect(struct enic *enic)
+{
+	/* A fresh REGISTER transaction lets the PF discard any VF-requested
+	 * configuration whose final state became uncertain.
+	 */
+	spin_lock_bh(&enic->mbox_state_lock);
+	enic_mbox_vf_mark_reconnect_locked(enic, false);
+	spin_unlock_bh(&enic->mbox_state_lock);
+	enic_mbox_vf_kick_recovery(enic);
+}
+
 static bool enic_mbox_vf_payload_ok(struct enic *enic, u8 msg_type,
 				    u16 payload_len, size_t min_len)
 {
@@ -608,6 +763,8 @@ static void enic_mbox_recv_handler(struct enic *enic, void *buf,
 			netdev_warn(enic->netdev,
 				    "MBOX: truncated message (len %u < %zu)\n",
 				    len, sizeof(*hdr));
+		if (!enic->vf_state)
+			enic_mbox_vf_require_reconnect(enic);
 		return;
 	}
 
@@ -764,7 +921,12 @@ void enic_mbox_init(struct enic *enic)
 		mutex_init(&enic->vf_mbox_request_lock);
 		init_completion(&enic->mbox_comp);
 		spin_lock_init(&enic->mbox_state_lock);
+		spin_lock_init(&enic->vf_ack_lock);
+		INIT_LIST_HEAD(&enic->vf_ack_list);
+		INIT_WORK(&enic->vf_ack_work, enic_mbox_vf_ack_work);
 		enic->mbox_msg_num = 0;
+		if (enic_is_sriov_vf_v2(enic))
+			WRITE_ONCE(enic->vf_rx_quarantined, true);
 		enic->mbox_initialized = true;
 	} else {
 		reinit_completion(&enic->mbox_comp);
diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.h b/drivers/net/ethernet/cisco/enic/enic_mbox.h
index 60409bad2f28..37bc41a900f4 100644
--- a/drivers/net/ethernet/cisco/enic/enic_mbox.h
+++ b/drivers/net/ethernet/cisco/enic/enic_mbox.h
@@ -90,6 +90,8 @@ int enic_mbox_send_msg(struct enic *enic, u8 msg_type, u16 dst_vnic_id,
 int enic_mbox_send_link_state(struct enic *enic, u16 vf_id, u32 link_state);
 void enic_mbox_vf_link_state_reset(struct enic *enic);
 void enic_mbox_vf_link_state_set_running(struct enic *enic, bool running);
+void enic_mbox_vf_ack_cancel(struct enic *enic);
+void enic_mbox_vf_require_reconnect(struct enic *enic);
 int enic_mbox_vf_capability_check(struct enic *enic);
 int enic_mbox_vf_register(struct enic *enic);
 int enic_mbox_vf_unregister(struct enic *enic);
diff --git a/drivers/net/ethernet/cisco/enic/enic_rq.c b/drivers/net/ethernet/cisco/enic/enic_rq.c
index ccbf5c9a21d0..80fe7e819c37 100644
--- a/drivers/net/ethernet/cisco/enic/enic_rq.c
+++ b/drivers/net/ethernet/cisco/enic/enic_rq.c
@@ -330,8 +330,6 @@ static void enic_rq_indicate_buf(struct enic *enic, struct vnic_rq *rq,
 	u16 bytes_written, vlan_tci, checksum;
 	u32 rss_hash;
 
-	rqstats->packets++;
-
 	cq_enet_rq_desc_dec((struct cq_enet_rq_desc *)cq_desc, &ingress_port,
 			    &fcoe, &eop, &sop, &rss_type, &csum_not_calc,
 			    &rss_hash, &bytes_written, &packet_error,
@@ -340,8 +338,15 @@ static void enic_rq_indicate_buf(struct enic *enic, struct vnic_rq *rq,
 			    &tcp_udp_csum_ok, &udp, &tcp, &ipv4_csum_ok, &ipv6,
 			    &ipv4, &ipv4_fragment, &fcs_ok);
 
-	if (enic_rq_pkt_error(rq, packet_error, fcs_ok, bytes_written))
+	if (enic_rq_pkt_error(rq, packet_error, fcs_ok, bytes_written)) {
+		rqstats->packets++;
+		return;
+	}
+	if (unlikely(READ_ONCE(enic->vf_rx_quarantined))) {
+		dev_core_stats_rx_dropped_inc(enic->netdev);
 		return;
+	}
+	rqstats->packets++;
 
 	if (eop && bytes_written > 0) {
 		/* Good receive
diff --git a/drivers/net/ethernet/cisco/enic/vnic_dev.c b/drivers/net/ethernet/cisco/enic/vnic_dev.c
index 92eec1455ceb..a78bd58f950f 100644
--- a/drivers/net/ethernet/cisco/enic/vnic_dev.c
+++ b/drivers/net/ethernet/cisco/enic/vnic_dev.c
@@ -721,17 +721,23 @@ int vnic_dev_hang_reset(struct vnic_dev *vdev, int arg)
 {
 	u64 a0 = (u32)arg, a1 = 0;
 	int wait = 1000;
-	int err;
 
+	vdev->hang_reset_uses_soft_reset = false;
 	if (vnic_dev_capable(vdev, CMD_HANG_RESET)) {
 		return vnic_dev_cmd(vdev, CMD_HANG_RESET,
 				&a0, &a1, wait);
-	} else {
-		err = vnic_dev_soft_reset(vdev, arg);
-		if (err)
-			return err;
-		return vnic_dev_init(vdev, 0);
 	}
+
+	/* enic_dev_wait() polls SOFT_RESET_STATUS. INIT follows reset completion
+	 * in the driver, after the ordinary close has succeeded.
+	 */
+	vdev->hang_reset_uses_soft_reset = true;
+	return vnic_dev_soft_reset(vdev, arg);
+}
+
+bool vnic_dev_hang_reset_uses_soft_reset(struct vnic_dev *vdev)
+{
+	return vdev->hang_reset_uses_soft_reset;
 }
 
 int vnic_dev_hang_reset_done(struct vnic_dev *vdev, int *done)
@@ -742,6 +748,9 @@ int vnic_dev_hang_reset_done(struct vnic_dev *vdev, int *done)
 
 	*done = 0;
 
+	if (vdev->hang_reset_uses_soft_reset)
+		return vnic_dev_soft_reset_done(vdev, done);
+
 	if (vnic_dev_capable(vdev, CMD_HANG_RESET_STATUS)) {
 		err = vnic_dev_cmd(vdev, CMD_HANG_RESET_STATUS,
 				&a0, &a1, wait);
diff --git a/drivers/net/ethernet/cisco/enic/vnic_dev.h b/drivers/net/ethernet/cisco/enic/vnic_dev.h
index 6a4d7ce3b636..ca5a9d4bd39d 100644
--- a/drivers/net/ethernet/cisco/enic/vnic_dev.h
+++ b/drivers/net/ethernet/cisco/enic/vnic_dev.h
@@ -95,6 +95,7 @@ struct vnic_dev {
 	dma_addr_t stats_pa;
 	struct vnic_sriov_stats *sriov_stats;
 	dma_addr_t sriov_stats_pa;
+	bool hang_reset_uses_soft_reset;
 	struct vnic_devcmd_fw_info *fw_info;
 	dma_addr_t fw_info_pa;
 	enum vnic_proxy_type proxy;
@@ -160,6 +161,7 @@ int vnic_dev_intr_coal_timer_info(struct vnic_dev *vdev);
 int vnic_dev_hang_reset(struct vnic_dev *vdev, int arg);
 int vnic_dev_soft_reset(struct vnic_dev *vdev, int arg);
 int vnic_dev_hang_reset_done(struct vnic_dev *vdev, int *done);
+bool vnic_dev_hang_reset_uses_soft_reset(struct vnic_dev *vdev);
 int vnic_dev_soft_reset_done(struct vnic_dev *vdev, int *done);
 void vnic_dev_set_intr_mode(struct vnic_dev *vdev,
 	enum vnic_dev_intr_mode intr_mode);

-- 
2.43.0

