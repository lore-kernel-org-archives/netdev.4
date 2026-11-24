Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541198;
	b=FZgz9TE92cK8arRd9MT0T2Go36obsag6D+QkFyyJX1hv7ghHX8doAKZA9PlYU2XQ0EF6
	 tcw4uu4P3jKIA589/GUNO8y4pP/luC8RrJXpEZOgA/Ay/wBnJOXoxACDsBVBhCOelL3YJ
	 XlEdE3tVyrBqs0ImnWyM3fJ8nhq5E7TVprGE8yfwJxURAQVbJItNdbuIqWv/opUB36OnP
	 azz2NPgQN/+FSiUxDkqcBrk+ylO1zatMG5QA1dh9+FvkUwgJx6Bn3gnUfhpG/kkeuDqJz
	 n69d31lFGa2srBmaBsDIfA5uNaJbjiABqxjAiIVSmOCvQRDqoyCaQDcIAngXN5x2JXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+yADFEnKhCRj13BMS3gkhjgRDcHeMbcQxtCPlY+NPLo=;
	b=Af54nOsOqaE37bWp+mzUVIv1XVxlGS4Itat+ffnWeJwa+qKF5KsSwvP0m7g2XKXzt9CQ
	 0tj1oMkTgA18GxhwwpbM406we39oBchCstOBUUeuhDI0rZMUzZYrKb2OnTNA2BBckR1/g
	 wMyQnaIwDJb5JRcz2cCXjynqTVWSXB21Y3BwddAK5f6JV7bkgo8OlT23bP96sX1kLbTPX
	 icpnGRpz+hZO/Bs6ODIqPXv4PtTa+lLCG8xlpXXvtSk864I82Pf+DeUC7QzRxYiuv8tmV
	 DrPBx4vwCop8FV9EOvWJAgMVXkYKrFWWJ7XchCriBRoHX7a3uu+sg12xX82w6C+vvwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRJYqfAA;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D758606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D758606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRJYqfAA
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f01f296937so37241535ad.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541197; x=1796145997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yADFEnKhCRj13BMS3gkhjgRDcHeMbcQxtCPlY+NPLo=;
        b=QRJYqfAA9h/avDxwXRctoqmocX5zq31lj/wgTDOkQcnktxOegk4rc5U3lB+ekDtHM8
         Ei6D8pT5bkMxoIpfZFPABv3Rq3YWB8l/KO4hRyFaYwTMC9qEkgJyo0WVP/mBl9SitLaq
         kr7lyIiiQxWiQu/g9qywCtlyvBPVCmlsMaIoPlYXgqXYEuGwJxVKNh3bFTMEwnxlTsH7
         /cgSHXoEddDTWxtNrVnSGftxtXHfnE8Pn7n4r1v1ZuzHzTicbOaSeLNWSBEAWuOZDQHA
         AHbOd//9XqycNHFv/fkbOhzMB4GcNGFfvvD+ErY9gPa1c9DNjfddrbZ6FA29kqpqVmDy
         I6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541197; x=1796145997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yADFEnKhCRj13BMS3gkhjgRDcHeMbcQxtCPlY+NPLo=;
        b=ykO4LQmGT1kXTGQusfSDYISQIsS8M4fYFg3DoskuSyyuHkdHTlg6CMesjUIZcVFFoW
         hb8QJYuTYLJ18SkUEuohvGwoJowjxCyi8Y1jYoobr1YmBpX9lT2ChluTTf/twWw930hW
         oCTExU1ZC1ria2eEhniaP28L10UWv1tvTKPOBmmx5xxhhWZK29etqNPLYil0OXq7AdmO
         Vj9NC0+NYJWGIZwGHARfPKxCDnyA7WFug7wP7dP9jPDdZ1F7uFW7cVj9pzGcvXaR2ydj
         wdr0tRvC1wNalLIIfcTa+Nf0JmT3WZSgysBx0AVNauHh2cmSj+4Z5uxLRDIqiagcfc6+
         Qv7g==
X-Gm-Message-State: APuU4Z/mcqDcXjd7XPST1BEvN7TQgcqxLkmMh4+6ft/4Gjn1pCQlBbFY
	7NoSkL1V/XWyug3puit/h+PtPqZGjfAiuJnZHQhkLq1IZskB6bzYw3m+i8aK/9UdwMQ=
X-Gm-Gg: AZFdTZefVFMLJnLsI14+88CgtWK6mikJSALYpJS9nGkOojtLF3JkSmXiob2nhgZQ94q
	eICy36J6Mu4GKJAKtg6y+P53o6xIBz1KcYuCYl5hQdIj4mCUeurmh4jQEHlsmMrSI8jW/JeWBzU
	EQiB9EsoXoLAFoiYqCQ3QURBeWd7ZpsKjcyO5qS9IkPl1SlwGVvdwoSugxu5tNYlvOc6Ezy92FG
	MrxLqPELphANDifks6prjCBHZIAK2/E49PLo9ej7UY9Yf6OfcMzL+jMxg/zzvC8NzMm1e8IspSw
	nIrXHoPKPrZJBD+v+vPExwRt5FZ8Gb+szIw2DAoalCG61UlGMzvL0xUWamYZRnbYhu6N3riMLmm
	vb0Lo4tS41Hd3dn7lIXMqfZ2skQzVJotjmrtyupmNRvh9QF7+2THOoQQ9GHC+SsowZJHoTNRp4Y
	5vXz3egNBg6x3rcI6S5tex0i4qxc+CT8xyRFIFyiGRFZVoNkwQ5sQ1xCYb+XFB6ZaiVnw/WI+B4
	+/hoKos29V07JKDqE0y10tdqOHpAjED72Kg/jYg7d3g04xp/2NAwxpvWUTPPGeZRXOb6WGf7EE6
	MTkuNu6kSrreLODHVWB0yzS2ViXGA+Ua
X-Received: by 2002:a17:903:b0e:b0:2ef:f2b9:d1ea with SMTP id d9443c01a7336-2f03f248b50mr152263575ad.39.1795541196864;
        Tue, 24 Nov 2026 09:26:36 -0800 (PST)
Received: from x1.hsd1.wa.comcast.net ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm63052795ad.38.2026.11.24.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:26:36 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: mail@maciej.szmigiero.name,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v2 3/3] net: wwan: iosm: always send the host sleep message on suspend
Date: Tue, 24 Nov 2026 09:26:27 -0800
Message-ID: <20261124172627.41847-4-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124172627.41847-1-davidlwesten@gmail.com>
References: <20261124172627.41847-1-davidlwesten@gmail.com>
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

The driver picks how to tell the modem about system suspend from a
BIOS RTD3 setting: the ENTER_SLEEP and EXIT_SLEEP host sleep messages
for D3L2, otherwise the FORCE_SLEEP and FORCE_ACTIVE doorbells. The
doorbells don't wait for the modem, and the PCI core may put the
device into D3hot either way.

On a ThinkPad X1 Carbon 6th gen, whose BIOS has no WWAN _DSM, the
XMM7360 doesn't survive the doorbells: after suspend-to-idle it is in
CD_READY ("PORT open refused, phase A-CD_READY") until an ACPI reset.
Keeping the device in D0 doesn't help either.

Always send the host sleep messages, and remove the doorbell path, the
BIOS setting and the suspend flag that only that path used. MSIs that
arrive between the suspend and resume callbacks are now processed, as
they already were with D3L2.

Tested on an XMM7360 with suspend-to-idle, not on the XMM7560. On
kernels that don't unbind the driver around hibernation yet,
hibernation also switches to the host sleep messages.

Fixes: 7e98d785ae61 ("net: iosm: entry point")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_imem.c     |  5 --
 drivers/net/wwan/iosm/iosm_ipc_imem.h     |  8 --
 drivers/net/wwan/iosm/iosm_ipc_irq.c      |  3 +-
 drivers/net/wwan/iosm/iosm_ipc_pcie.c     | 96 ++---------------------
 drivers/net/wwan/iosm/iosm_ipc_pcie.h     | 14 ----
 drivers/net/wwan/iosm/iosm_ipc_pm.c       | 14 ----
 drivers/net/wwan/iosm/iosm_ipc_pm.h       |  7 --
 drivers/net/wwan/iosm/iosm_ipc_protocol.c |  5 --
 drivers/net/wwan/iosm/iosm_ipc_protocol.h |  8 --
 9 files changed, 6 insertions(+), 154 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 4405c8531888..e9e630f52451 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -1036,11 +1036,6 @@ void ipc_imem_pm_suspend(struct iosm_imem *ipc_imem)
 	ipc_protocol_suspend(ipc_imem->ipc_protocol);
 }
 
-void ipc_imem_pm_s2idle_sleep(struct iosm_imem *ipc_imem, bool sleep)
-{
-	ipc_protocol_s2idle_sleep(ipc_imem->ipc_protocol, sleep);
-}
-
 void ipc_imem_pm_resume(struct iosm_imem *ipc_imem)
 {
 	enum ipc_mem_exec_stage stage;
diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.h b/drivers/net/wwan/iosm/iosm_ipc_imem.h
index 5664ac507c90..2628c0655271 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.h
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.h
@@ -389,14 +389,6 @@ struct iosm_imem {
 struct iosm_imem *ipc_imem_init(struct iosm_pcie *pcie, unsigned int device_id,
 				void __iomem *mmio, struct device *dev);
 
-/**
- * ipc_imem_pm_s2idle_sleep - Set PM variables to sleep/active for
- *			      s2idle sleep/active
- * @ipc_imem:	Pointer to imem data-struct
- * @sleep:	Set PM Variable to sleep/active
- */
-void ipc_imem_pm_s2idle_sleep(struct iosm_imem *ipc_imem, bool sleep);
-
 /**
  * ipc_imem_pm_suspend - The HAL shall ask the shared memory layer
  *			 whether D3 is allowed.
diff --git a/drivers/net/wwan/iosm/iosm_ipc_irq.c b/drivers/net/wwan/iosm/iosm_ipc_irq.c
index 702f50a48151..3b0576a54d5c 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_irq.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_irq.c
@@ -40,8 +40,7 @@ static irqreturn_t ipc_msi_interrupt(int irq, void *dev_id)
 	if (instance >= ipc_pcie->nvec)
 		return IRQ_NONE;
 
-	if (!test_bit(0, &ipc_pcie->suspend))
-		ipc_imem_irq_process(ipc_pcie->imem, instance);
+	ipc_imem_irq_process(ipc_pcie->imem, instance);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
index 49052eb511ba..15563d4986d6 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2020-21 Intel Corporation.
  */
 
-#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/suspend.h>
@@ -16,9 +15,6 @@
 MODULE_DESCRIPTION("IOSM Driver");
 MODULE_LICENSE("GPL v2");
 
-/* WWAN GUID */
-static guid_t wwan_acpi_guid = GUID_INIT(0xbad01b75, 0x22a8, 0x4f48, 0x87, 0x92,
-				       0xbd, 0xde, 0x94, 0x67, 0x74, 0x7d);
 static bool pci_registered;
 
 static void ipc_pcie_resources_release(struct iosm_pcie *ipc_pcie)
@@ -229,34 +225,6 @@ static void ipc_pcie_config_init(struct iosm_pcie *ipc_pcie)
 	ipc_pcie->doorbell_capture = IPC_CAPTURE_PTR_REG_0;
 }
 
-/* This will read the BIOS WWAN RTD3 settings:
- * D0L1.2/D3L2/Disabled
- */
-static enum ipc_pcie_sleep_state ipc_pcie_read_bios_cfg(struct device *dev)
-{
-	enum ipc_pcie_sleep_state sleep_state = IPC_PCIE_D0L12;
-	union acpi_object *object;
-	acpi_handle handle_acpi;
-
-	handle_acpi = ACPI_HANDLE(dev);
-	if (!handle_acpi) {
-		pr_debug("pci device is NOT ACPI supporting device\n");
-		goto default_ret;
-	}
-
-	object = acpi_evaluate_dsm(handle_acpi, &wwan_acpi_guid, 0, 3, NULL);
-	if (!object)
-		goto default_ret;
-
-	if (object->integer.value == 3)
-		sleep_state = IPC_PCIE_D3L2;
-
-	ACPI_FREE(object);
-
-default_ret:
-	return sleep_state;
-}
-
 static int ipc_pcie_probe(struct pci_dev *pci,
 			  const struct pci_device_id *pci_id)
 {
@@ -303,12 +271,6 @@ static int ipc_pcie_probe(struct pci_dev *pci,
 	ipc_pcie_config_aspm(ipc_pcie);
 	dev_dbg(ipc_pcie->dev, "PCIe device enabled.");
 
-	/* Read WWAN RTD3 BIOS Setting
-	 */
-	ipc_pcie->d3l2_support = ipc_pcie_read_bios_cfg(&pci->dev);
-
-	ipc_pcie->suspend = 0;
-
 	if (ipc_pcie_resources_request(ipc_pcie))
 		goto resources_req_fail;
 
@@ -340,43 +302,6 @@ static const struct pci_device_id iosm_ipc_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, iosm_ipc_ids);
 
-/* Enter sleep in s2idle case
- */
-static int __maybe_unused ipc_pcie_suspend_s2idle(struct iosm_pcie *ipc_pcie)
-{
-	ipc_cp_irq_sleep_control(ipc_pcie, IPC_MEM_DEV_PM_FORCE_SLEEP);
-
-	/* Complete all memory stores before setting bit */
-	smp_mb__before_atomic();
-
-	set_bit(0, &ipc_pcie->suspend);
-
-	/* Complete all memory stores after setting bit */
-	smp_mb__after_atomic();
-
-	ipc_imem_pm_s2idle_sleep(ipc_pcie->imem, true);
-
-	return 0;
-}
-
-/* Resume from sleep in s2idle case
- */
-static int __maybe_unused ipc_pcie_resume_s2idle(struct iosm_pcie *ipc_pcie)
-{
-	ipc_cp_irq_sleep_control(ipc_pcie, IPC_MEM_DEV_PM_FORCE_ACTIVE);
-
-	ipc_imem_pm_s2idle_sleep(ipc_pcie->imem, false);
-
-	/* Complete all memory stores before clearing bit. */
-	smp_mb__before_atomic();
-
-	clear_bit(0, &ipc_pcie->suspend);
-
-	/* Complete all memory stores after clearing bit. */
-	smp_mb__after_atomic();
-	return 0;
-}
-
 int __maybe_unused ipc_pcie_suspend(struct iosm_pcie *ipc_pcie)
 {
 	/* The HAL shall ask the shared memory layer whether D3 is allowed. */
@@ -406,14 +331,10 @@ static int __maybe_unused ipc_pcie_suspend_cb(struct device *dev)
 
 	ipc_pcie = pci_get_drvdata(pdev);
 
-	switch (ipc_pcie->d3l2_support) {
-	case IPC_PCIE_D0L12:
-		ipc_pcie_suspend_s2idle(ipc_pcie);
-		break;
-	case IPC_PCIE_D3L2:
-		ipc_pcie_suspend(ipc_pcie);
-		break;
-	}
+	/* The PCI core may put the device into D3, so the modem has to be
+	 * told with the host sleep message first.
+	 */
+	ipc_pcie_suspend(ipc_pcie);
 
 	return 0;
 }
@@ -427,14 +348,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
 
 	ipc_pcie = pci_get_drvdata(pdev);
 
-	switch (ipc_pcie->d3l2_support) {
-	case IPC_PCIE_D0L12:
-		ipc_pcie_resume_s2idle(ipc_pcie);
-		break;
-	case IPC_PCIE_D3L2:
-		ipc_pcie_resume(ipc_pcie);
-		break;
-	}
+	ipc_pcie_resume(ipc_pcie);
 
 	return 0;
 }
diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.h b/drivers/net/wwan/iosm/iosm_ipc_pcie.h
index 844cf1fed994..ed67dcbddb14 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pcie.h
+++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.h
@@ -31,16 +31,6 @@
 /* Total number of Maximum IPC IRQ vectors used for IPC */
 #define IPC_IRQ_VECTORS IPC_MSI_VECTORS
 
-/**
- * enum ipc_pcie_sleep_state - Enum type to different sleep state transitions
- * @IPC_PCIE_D0L12:	Put the sleep state in D0L12
- * @IPC_PCIE_D3L2:	Put the sleep state in D3L2
- */
-enum ipc_pcie_sleep_state {
-	IPC_PCIE_D0L12,
-	IPC_PCIE_D3L2,
-};
-
 /**
  * struct iosm_pcie - IPC_PCIE struct.
  * @pci:			Address of the device description
@@ -58,8 +48,6 @@ enum ipc_pcie_sleep_state {
  * @doorbell_reg_offset:	doorbell_reg_offset
  * @doorbell_write:		doorbell write register
  * @doorbell_capture:		doorbell capture resgister
- * @suspend:			S2IDLE sleep/active
- * @d3l2_support:		Read WWAN RTD3 BIOS setting for D3L2 support
  */
 struct iosm_pcie {
 	struct pci_dev *pci;
@@ -73,8 +61,6 @@ struct iosm_pcie {
 	u32 doorbell_reg_offset;
 	u32 doorbell_write;
 	u32 doorbell_capture;
-	unsigned long suspend;
-	enum ipc_pcie_sleep_state d3l2_support;
 };
 
 /**
diff --git a/drivers/net/wwan/iosm/iosm_ipc_pm.c b/drivers/net/wwan/iosm/iosm_ipc_pm.c
index c76cb9663039..1d7538131440 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pm.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pm.c
@@ -238,20 +238,6 @@ bool ipc_pm_prepare_host_active(struct iosm_pm *ipc_pm)
 	return true;
 }
 
-void ipc_pm_set_s2idle_sleep(struct iosm_pm *ipc_pm, bool sleep)
-{
-	if (sleep) {
-		ipc_pm->ap_state = IPC_MEM_DEV_PM_SLEEP;
-		ipc_pm->cp_state = IPC_MEM_DEV_PM_SLEEP;
-		ipc_pm->device_sleep_notification = IPC_MEM_DEV_PM_SLEEP;
-	} else {
-		ipc_pm->ap_state = IPC_MEM_DEV_PM_ACTIVE;
-		ipc_pm->cp_state = IPC_MEM_DEV_PM_ACTIVE;
-		ipc_pm->device_sleep_notification = IPC_MEM_DEV_PM_ACTIVE;
-		ipc_pm->pm_cond.link = IPC_PM_ACTIVE;
-	}
-}
-
 bool ipc_pm_dev_slp_notification(struct iosm_pm *ipc_pm, u32 cp_pm_req)
 {
 	if (cp_pm_req == ipc_pm->device_sleep_notification)
diff --git a/drivers/net/wwan/iosm/iosm_ipc_pm.h b/drivers/net/wwan/iosm/iosm_ipc_pm.h
index 5f14d7932af9..e43a65686366 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pm.h
+++ b/drivers/net/wwan/iosm/iosm_ipc_pm.h
@@ -146,13 +146,6 @@ void ipc_pm_deinit(struct iosm_protocol *ipc_protocol);
 bool ipc_pm_dev_slp_notification(struct iosm_pm *ipc_pm,
 				 u32 sleep_notification);
 
-/**
- * ipc_pm_set_s2idle_sleep - Set PM variables to sleep/active
- * @ipc_pm:	Pointer to power management component
- * @sleep:	true to enter sleep/false to exit sleep
- */
-void ipc_pm_set_s2idle_sleep(struct iosm_pm *ipc_pm, bool sleep);
-
 /**
  * ipc_pm_prepare_host_sleep - Prepare the PM for sleep by entering
  *			       IPC_MEM_HOST_PM_SLEEP_WAIT_D3 state.
diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.c b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
index e120e1e0ba1d..3c3c9b52eaf1 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_protocol.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
@@ -169,11 +169,6 @@ static int ipc_protocol_tq_wakeup_dev_slp(struct iosm_imem *ipc_imem, int arg,
 	return 0;
 }
 
-void ipc_protocol_s2idle_sleep(struct iosm_protocol *ipc_protocol, bool sleep)
-{
-	ipc_pm_set_s2idle_sleep(&ipc_protocol->pm, sleep);
-}
-
 bool ipc_protocol_suspend(struct iosm_protocol *ipc_protocol)
 {
 	if (!ipc_pm_prepare_host_sleep(&ipc_protocol->pm))
diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.h b/drivers/net/wwan/iosm/iosm_ipc_protocol.h
index 289397c4ea6c..12c4aa6e3110 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_protocol.h
+++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.h
@@ -174,14 +174,6 @@ int ipc_protocol_msg_send(struct iosm_protocol *ipc_protocol,
  */
 bool ipc_protocol_suspend(struct iosm_protocol *ipc_protocol);
 
-/**
- * ipc_protocol_s2idle_sleep - Call PM function to set PM variables in s2idle
- *			       sleep/active case
- * @ipc_protocol:	Pointer to ipc_protocol instance
- * @sleep:		True for sleep/False for active
- */
-void ipc_protocol_s2idle_sleep(struct iosm_protocol *ipc_protocol, bool sleep);
-
 /**
  * ipc_protocol_resume - Signal to CP that host wants to resume operation.
  * @ipc_protocol:	Pointer to ipc_protocol instance
-- 
2.56.0

