Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722111;
	b=yiDYaD+uJhGFQdtrV2k1m8LigsqRy6nhu3BDO0+jsSs7q6BqSEtApXVNGRO9yxnWJ1tO
	 7oG8CaTZUHolWmxIMQufCFnRW/xYLp1UIKA4Qo8hqoKhiesGHjji5hlka4SRNDmjLzwfy
	 WNzpRqguZ+IG2Xaijv+ivJFd6seS2ZUtETRBCibv4FxSv8v9B60RncFryihWw+6EcNFYG
	 K/t6jIoDNUdDMMrqJQxXfSOlULPYB92lS1bH8WCzhTIEjN526+MV/U48R7Csd/xmcz88b
	 URFZYwmKSNlFYcIZKDVPrejU59urV69JfijwK8R+C/+YQ8h6AIN/Y7U77NmSh2UCusA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u7bMR0NH97UysFgcHpVxFEkH06XWepp/spUciEW9m+c=;
	b=NtNN8cz2HzGt21B71ft8rhQ0/gk1vkd6wG4z7sfK9Dz+44k1IhCZ1IcsnA8u6Sk6ajBF
	 uXUPimqEhdPOyG3LqProEMKqIMtbIog31Pn6sdQjqyqldKEmXDuBmBoP2OBjZFNytUcNO
	 RA/jPpBb3vCLxVNlOae/xwxRI87IvmlFx/Jtpre2S+RCtsfjlwTBmxJVw2gAmi8/cH74Q
	 txgQmt+mnnw7JCuCp4ITPv/hyKeh2/rxEsbWmK3L24ckhPie9mEJFsmA9uwh4DeB1VtIq
	 2NUMwxr/VGfGudB8ql9HoFbXqWIJnT6OQE2lJGK8drsGPsQzgRPJCcgRNxMQzFXbiTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBSavDW2;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8F606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBSavDW2
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89d6bd67045so3409420b3a.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722111; x=1796326911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7bMR0NH97UysFgcHpVxFEkH06XWepp/spUciEW9m+c=;
        b=DBSavDW2tSsJzfsGTn1C+MnP1hyGoGH03O1OwpV6O9qdYItjlpMaWO94OJwwIliWYz
         LANz9y/t8Pjl0Ndzm1s/ztrUgV73MtQ6rmx2XDK2VzJK/I4U6o7Wag5cpPNf5MAO8rNX
         H0hrzoDzHk8PPsbesRYrHUVKYqXecmTAKCDmrM5nXCmY9zdv3dOrKa8RFwAIRPVsF0uq
         DmIArc/xG0hpys2Ul2BWGWA8mkVpH5oJvE8KvTJE4UVCWdjVTCvLTq2WsUVUwnEts3my
         Oz3VmqzXJPVwh/ZzAVaBpQi4UBmJ8BDhOvDgEJ/LZVf5JN3zq+X/q8gj4DwgmydAtmg/
         GQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722111; x=1796326911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7bMR0NH97UysFgcHpVxFEkH06XWepp/spUciEW9m+c=;
        b=yizf5HRe9O2BIR+oEmPFAKZSRRop4f9cNl/lM5mXvjGUeV2svYKO1Jxk4/0LwWnXh6
         Q6OmVQNXP+BBIlB3zmrJUR1Fy5YTA83QvX3OvbxTo0DWq/wuu1U/O6nOEkNy04FZLFHn
         zEzXEcwnVfvcqFlv8wYnUOBrKWa79dqIhUHlxhWVJV3EVoNbM69CWHzQe9izbataVps7
         R1B9N9kZP1QHc042+oFbMI3ghmNNQOw9vsOlHPjxIyL1kmHJ0xOsHjjt4n6MjoG3POss
         OugOsodFQ2hcQxyUwluC6p40XlaMMFSHzatoCfbdc3ctsRqRcaSNjkL+tOGR6h1o5E73
         x/6Q==
X-Gm-Message-State: APuU4Z8PeMzTn14DiMFQlpt4pi/d4mqgUWNRYED8zclJbGQlurZLcknc
	LYG0t19HaMhug6halFOp1gRfwuTCigKCIvk3HjIn0ZRCTPaF1KDghis1Z+Fw4xG4qx8=
X-Gm-Gg: AZFdTZemkpYq7a6T1vf2VFKRG0yZsm0tGXbY3lHKd6bkLpNc09wYF8ZFKQPVruHjCaw
	3i6xC8y3XpiyRLLppW/pSkFbyo3vqmWkRgJPYBDLxZv4Wgm2X3ZTM4fPRbSWKgzhkbu1+LsQ9E4
	1Pb6MTkWKY7aVCRQtx3zdOZXSrIse91xwuA4kQ7C0SviDdgt8S+k0iHnbTilWyeRlMpcTdL8j1k
	cpcEVxqZmI0VZZ1i8MXXP4DVwY5TUGUUuKIigXxi5QF14D9IkkO7sRl2vyxBn2UvZqJy3wwIJ9q
	9BsewygfKykmXLXCwOi5C0Qf7LSRWG4TlesyWQNkgqYmZp4aF2vMWlkE+hDjr63wGGsc9Q0chgG
	Qbk7pkr/QBJ4yjLNKUXcWZUKoe1P5uXM+Ki5yyE+WlzMCsByWS0Wk8OmfahTkgS+vQkOuxE2sD1
	8lqjtJUeFItzLtMy0e4vC3GtTVkUAefT3rKD59PCvbPTBnTrNA8L1MTmXJGMGVuJJu6XduEqxiS
	pzBV34B16sKCoV2821MBMm9bsAg+uWvrDMhaAwuwYuh5cFCIK0efn7NMmN5WFXMFNy+FQkWF3Bo
	GbSOoxOjKihFVCXU
X-Received: by 2002:a05:6a00:39a3:b0:8a0:22e0:a3ce with SMTP id d2e1a72fcca58-8c7db1eeaaamr15590669b3a.4.1795722110622;
        Thu, 26 Nov 2026 11:41:50 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm11370474b3a.43.2026.11.26.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:41:50 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v3 2/2] net: wwan: iosm: re-bind the driver when the modem rebooted during S3
Date: Thu, 26 Nov 2026 11:41:43 -0800
Message-ID: <20261126194143.32283-3-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126194143.32283-1-davidlwesten@gmail.com>
References: <20261126194143.32283-1-davidlwesten@gmail.com>
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

On platforms where S3 cuts power to the WWAN card, the modem boots
again while the driver still treats it as running, and the first port
open after resume fails:

  iosm 0000:03:00.0: PORT open refused, phase A-CD_READY

The driver takes this from a stale stage in the shared memory: on an
XMM7360, the modem writes CD_READY there before it loses power. The
modem itself is fine.

On resume, read the stage from the MMIO area. If the modem booted
again, mark it as gone: the driver then neither talks to it nor waits
for it, and the cleanup only releases memory. Once the modem has
reached the run stage, re-bind the driver, so that probe finds it as
after a cold boot. Nothing changes where the card keeps power, and a
crashed modem is left alone.

Tested with S3 on an XMM7360 in a ThinkPad X1 Carbon 6th gen, with
KASAN, lockdep and a strict IOMMU: five cycles, also with wwan0 up
through the suspend.

Fixes: 7e98d785ae61 ("net: iosm: entry point")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_imem.c      | 47 +++++++++++++++++++++-
 drivers/net/wwan/iosm/iosm_ipc_imem.h      | 18 +++++++++
 drivers/net/wwan/iosm/iosm_ipc_imem_ops.c  |  4 ++
 drivers/net/wwan/iosm/iosm_ipc_irq.c       |  3 ++
 drivers/net/wwan/iosm/iosm_ipc_mux_codec.c |  6 +++
 drivers/net/wwan/iosm/iosm_ipc_pcie.c      | 37 +++++++++++++++++
 drivers/net/wwan/iosm/iosm_ipc_protocol.c  |  3 ++
 7 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 3ab409166c50..673c5ad403e7 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -208,6 +208,9 @@ void ipc_imem_hrtimer_stop(struct hrtimer *hr_timer)
  */
 void ipc_imem_adb_timer_start(struct iosm_imem *ipc_imem)
 {
+	if (test_bit(IOSM_MODEM_GONE, &ipc_imem->flag))
+		return;
+
 	if (!hrtimer_active(&ipc_imem->adb_timer)) {
 		ipc_imem->hrtimer_period =
 			ktime_set(0, IOSM_AGGR_MUX_ADB_FINISH_TIMEOUT_NSEC);
@@ -1042,6 +1045,44 @@ void ipc_imem_pm_s2idle_sleep(struct iosm_imem *ipc_imem, bool sleep)
 	ipc_protocol_s2idle_sleep(ipc_imem->ipc_protocol, sleep);
 }
 
+bool ipc_imem_modem_rebooted(struct iosm_imem *ipc_imem)
+{
+	if (!test_bit(FULLY_FUNCTIONAL, &ipc_imem->flag))
+		return false;
+
+	switch (ipc_mmio_get_exec_stage(ipc_imem->mmio)) {
+	case IPC_MEM_EXEC_STAGE_RUN:
+		return ipc_mmio_get_ipc_state(ipc_imem->mmio) ==
+		       IPC_MEM_DEVICE_IPC_UNINIT;
+	case IPC_MEM_EXEC_STAGE_CRASH:
+	case IPC_MEM_EXEC_STAGE_CD_READY:
+	case IPC_MEM_EXEC_STAGE_INVALID:
+		return false;
+	default:
+		return true;
+	}
+}
+
+bool ipc_imem_wait_for_run(struct iosm_imem *ipc_imem)
+{
+	int timeout = IPC_MODEM_BOOT_TIMEOUT;
+
+	for (;;) {
+		switch (ipc_mmio_get_exec_stage(ipc_imem->mmio)) {
+		case IPC_MEM_EXEC_STAGE_RUN:
+			return true;
+		case IPC_MEM_EXEC_STAGE_CRASH:
+		case IPC_MEM_EXEC_STAGE_CD_READY:
+			return false;
+		default:
+			break;
+		}
+		if (!--timeout)
+			return false;
+		msleep(20);
+	}
+}
+
 void ipc_imem_pm_resume(struct iosm_imem *ipc_imem)
 {
 	enum ipc_mem_exec_stage stage;
@@ -1204,6 +1245,9 @@ static void ipc_imem_device_ipc_uninit(struct iosm_imem *ipc_imem)
 	int timeout = IPC_MODEM_UNINIT_TIMEOUT_MS;
 	enum ipc_mem_device_ipc_state ipc_state;
 
+	if (test_bit(IOSM_MODEM_GONE, &ipc_imem->flag))
+		return;
+
 	/* When PCIe link is up set IPC_UNINIT
 	 * of the modem otherwise ignore it when PCIe link down happens.
 	 */
@@ -1440,7 +1484,8 @@ struct iosm_imem *ipc_imem_init(struct iosm_pcie *pcie, unsigned int device_id,
 void ipc_imem_irq_process(struct iosm_imem *ipc_imem, int irq)
 {
 	/* Debounce IPC_EV_IRQ. */
-	if (ipc_imem && !ipc_imem->ev_irq_pending[irq]) {
+	if (ipc_imem && !ipc_imem->ev_irq_pending[irq] &&
+	    !test_bit(IOSM_MODEM_GONE, &ipc_imem->flag)) {
 		ipc_imem->ev_irq_pending[irq] = true;
 		ipc_task_queue_send_task(ipc_imem, ipc_imem_tq_irq_cb, irq,
 					 NULL, 0, false);
diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.h b/drivers/net/wwan/iosm/iosm_ipc_imem.h
index 5664ac507c90..3f6d1ccf2a7c 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.h
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.h
@@ -102,6 +102,8 @@ struct ipc_chnl_cfg;
 
 #define FULLY_FUNCTIONAL 0
 #define IOSM_DEVLINK_INIT 1
+/* The modem rebooted: don't talk to it or wait for it until the re-bind */
+#define IOSM_MODEM_GONE 2
 
 /* List of the supported UL/DL pipes. */
 enum ipc_mem_pipes {
@@ -404,6 +406,22 @@ void ipc_imem_pm_s2idle_sleep(struct iosm_imem *ipc_imem, bool sleep);
  */
 void ipc_imem_pm_suspend(struct iosm_imem *ipc_imem);
 
+/**
+ * ipc_imem_modem_rebooted - Check whether the modem booted again
+ * @ipc_imem:	Pointer to imem data-struct
+ *
+ * Returns: true if it did after the driver had brought it up
+ */
+bool ipc_imem_modem_rebooted(struct iosm_imem *ipc_imem);
+
+/**
+ * ipc_imem_wait_for_run - Wait up to about 10 s for the run stage
+ * @ipc_imem:	Pointer to imem data-struct
+ *
+ * Returns: true if the modem reached it
+ */
+bool ipc_imem_wait_for_run(struct iosm_imem *ipc_imem);
+
 /**
  * ipc_imem_pm_resume - The HAL shall inform the shared memory layer
  *			that the device is active.
diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem_ops.c b/drivers/net/wwan/iosm/iosm_ipc_imem_ops.c
index 109cf8930488..8cff81919480 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem_ops.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem_ops.c
@@ -218,6 +218,9 @@ void ipc_imem_sys_port_close(struct iosm_imem *ipc_imem,
 		return;
 	}
 
+	if (test_bit(IOSM_MODEM_GONE, &ipc_imem->flag))
+		goto close;
+
 	/* If there are any pending TDs then wait for Timeout/Completion before
 	 * closing pipe.
 	 */
@@ -267,6 +270,7 @@ void ipc_imem_sys_port_close(struct iosm_imem *ipc_imem,
 		ipc_imem->app_notify_dl_pend = 0;
 	}
 
+close:
 	/* Due to wait for completion in messages, there is a small window
 	 * between closing the pipe and updating the channel is closed. In this
 	 * small window there could be HP update from Host Driver. Hence update
diff --git a/drivers/net/wwan/iosm/iosm_ipc_irq.c b/drivers/net/wwan/iosm/iosm_ipc_irq.c
index 702f50a48151..d9d0e28fafae 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_irq.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_irq.c
@@ -25,6 +25,9 @@ static void ipc_write_dbell_reg(struct iosm_pcie *ipc_pcie, int irq_n, u32 data)
 
 void ipc_doorbell_fire(struct iosm_pcie *ipc_pcie, int irq_n, u32 data)
 {
+	if (ipc_pcie->imem && test_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag))
+		return;
+
 	ipc_write_dbell_reg(ipc_pcie, irq_n, data);
 }
 
diff --git a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
index 0bbd41263cc2..a31f6fa7ea55 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
@@ -150,6 +150,9 @@ int ipc_mux_dl_acb_send_cmds(struct iosm_mux *ipc_mux, u32 cmd_type, u8 if_id,
 	union mux_type_cmdh cmdh;
 	int ret = 0;
 
+	if (test_bit(IOSM_MODEM_GONE, &ipc_mux->imem->flag))
+		return -EIO;
+
 	acb->if_id = if_id;
 	ret = ipc_mux_acb_alloc(ipc_mux);
 	if (ret)
@@ -1525,6 +1528,9 @@ int ipc_mux_ul_trigger_encode(struct iosm_mux *ipc_mux, int if_id,
 	struct mux_session *session = &ipc_mux->session[if_id];
 	int ret = -EINVAL;
 
+	if (test_bit(IOSM_MODEM_GONE, &ipc_mux->imem->flag))
+		return -EIO;
+
 	if (ipc_mux->channel &&
 	    ipc_mux->channel->state != IMEM_CHANNEL_ACTIVE) {
 		dev_err(ipc_mux->dev,
diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..767a609462b4 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -427,6 +427,10 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
 
 	ipc_pcie = pci_get_drvdata(pdev);
 
+	/* pm_notify() re-binds the driver for a modem that booted again */
+	if (ipc_imem_modem_rebooted(ipc_pcie->imem))
+		set_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag);
+
 	switch (ipc_pcie->d3l2_support) {
 	case IPC_PCIE_D0L12:
 		ipc_pcie_resume_s2idle(ipc_pcie);
@@ -532,6 +536,37 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
 	dev_kfree_skb(skb);
 }
 
+static void ipc_pcie_rebind_if_rebooted(struct pci_dev *pdev)
+{
+	struct iosm_pcie *ipc_pcie;
+	bool rebooted = false;
+
+	device_lock(&pdev->dev);
+	if (pdev->dev.driver == &iosm_ipc_driver.driver) {
+		ipc_pcie = pci_get_drvdata(pdev);
+		rebooted = test_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag);
+		/* Let probe find it in the run stage, as after a cold boot */
+		if (rebooted && !ipc_imem_wait_for_run(ipc_pcie->imem))
+			dev_warn(&pdev->dev, "modem not running after resume");
+	}
+	device_unlock(&pdev->dev);
+
+	if (rebooted && device_reprobe(&pdev->dev))
+		dev_err(&pdev->dev, "re-binding the driver failed");
+}
+
+static void ipc_pcie_rebind_rebooted(void)
+{
+	const struct pci_device_id *id;
+	struct pci_dev *pdev;
+
+	for (id = iosm_ipc_ids; id->vendor; id++) {
+		pdev = NULL;
+		while ((pdev = pci_get_device(id->vendor, id->device, pdev)))
+			ipc_pcie_rebind_if_rebooted(pdev);
+	}
+}
+
 static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unused)
 {
 	if (mode == PM_HIBERNATION_PREPARE || mode == PM_RESTORE_PREPARE) {
@@ -551,6 +586,8 @@ static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unuse
 				pci_registered = true;
 			}
 		}
+	} else if (mode == PM_POST_SUSPEND) {
+		ipc_pcie_rebind_rebooted();
 	}
 
 	return 0;
diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.c b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
index 527355a671b6..a49a45ed0b0d 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_protocol.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
@@ -69,6 +69,9 @@ int ipc_protocol_msg_send(struct iosm_protocol *ipc_protocol,
 	/* Trap if called from non-preemptible context */
 	might_sleep();
 
+	if (test_bit(IOSM_MODEM_GONE, &ipc_protocol->imem->flag))
+		return -EIO;
+
 	response.status = IPC_MEM_MSG_CS_INVALID;
 	init_completion(&response.completion);
 
-- 
2.56.0

