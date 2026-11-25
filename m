Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594267;
	b=2EYoMsOrRVzU7RmBDnSDrRDlvECsSe8fbqzVNe4Gt7Er3F5CZaeVcMdRzegfcIVoZ+SW
	 s9CVNMq05jPCXjPzPab2RuMg8o02dgTyi57F75lL5jv0KPMhunaq5xsMNOn3yBOIPRuGB
	 2lpc8s2bXO4fpICDi7bpX3pugPpVs9Xx5H3G6HpmABm4a2FGtqwgLDhrh2taLuZKjh0cA
	 KduHEflAD0Q9M+e3yz6tPiS/eUaUmJswCbpjkBnT6OaxZUePDKc4XjTxHzwtyh/UCrHp3
	 EnjbNrF61X32u84lsEgXgMQf8UkgxAPU8etbIiicRXlLdXwJkQEFsq6bO56PBa4UmnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594267;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=MEXl7E1meHY1GYwQbEY2+aWshbsKUuiLBog0ysXIUbY=;
	b=3KAimAZt84cpMbAyrhSxsX/S9oYc2aGAD8ue0/G8qrR70pAAFi15ZTljY4g+Rfj/YzZA
	 7Vnm54wWhqQZTEoxtrmb0H8rVaRsxIKwKG5+/N+S8Y1EO+lcJmxuv3bvcmbYRTZQDE38Y
	 naqjlsLDnDniELaAo7Ktc8O2QUvelGvf4E1M7lV95isBjrFtb1AMh9tRBoDU1g9Ct3YRN
	 KEvBMOqv+wfBkpPeIvzKGMr5tGs31Bx5U39Cvr2jDVyPRHejsK0K8rR71foTQFuTsB+5I
	 Q9SfCcSm4GxlnXevsmvD1crWtqbC63YOx7jfwGF6bAo0lZ7Su+YsjZ6j6EIug7InkuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N6Z+P02y;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED4606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ED4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N6Z+P02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ME
	Xl7E1meHY1GYwQbEY2+aWshbsKUuiLBog0ysXIUbY=; b=N6Z+P02yOAojmtNt1t
	+sjkhJAgqMcJv5++uvpftHuVx2zdrStMU6BA3PgyUNVed/smjE1ifK+P7TNpKAt8
	wCUqYxQAa9XyJ4gugzjRsVv4Bajfbpj5bWCMkIKG6Oz5JefRa6y9Tev6uXLNSAB3
	4CiwWEwhYawl5DctfBkP+menY=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnb8vflwZr_PagJQ--.51381S2;
	Wed, 25 Nov 2026 16:10:08 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	Hans Zhang <18255117159@163.com>,
	Kai Xia <503536682@qq.com>
Subject: [PATCH v2] net: phy: defer PHY probe when running in async probe context
Date: Wed, 25 Nov 2026 16:09:39 +0800
Message-ID: <20261125080939.176096-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:_____wDnb8vflwZr_PagJQ--.51381S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF18KrW7tw4DAFW8ZFW5Wrg_yoW5Zw13pF
	s8AayYyrZ5Ww47Wa1xJrWYyFy0ga98Cw47Wrn7Cwna9a9rt3srAFyj9r4jqr1DXrW5Ja48
	CFyDJrWrGFZ8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMGQ6UUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wB6HmsGl+A6KQAA3G

phy_request_driver_module() synchronously calls request_module() so that
the PHY driver is loaded before phy_device_create() returns.  That call is
not safe from async probe context: module init may invoke
async_synchronize_full(), which waits for the current async worker and can
deadlock.

When this path is reached from an async worker, return -EPROBE_DEFER
instead.  The parent device probe is then retried later from the deferred
probe workqueue, where request_module() can run synchronously and the
guarantee that the PHY driver is loaded before device registration is
preserved.

This fixes the WARN below and the possible deadlock, observed on an arm64
board whose PCIe host controller uses PROBE_PREFER_ASYNCHRONOUS while
probing an RTL8126A:

  WARNING: kernel/module/kmod.c:145 at __request_module+0x198/0x200, CPU#5: kworker/u49:0/77
  Workqueue: async async_run_entry_fn
  Call trace:
   __request_module+0x198/0x200 (P)
   phy_request_driver_module+0x11c/0x17c
   phy_device_create+0x234/0x260
   get_phy_device+0x74/0x150
   mdiobus_scan+0x34/0x114
   __mdiobus_register+0x1ec/0x450
   __devm_mdiobus_register+0x70/0xe8
   rtl_init_one+0x1350/0x16b0
   local_pci_probe+0x40/0xa8
   pci_call_probe+0x64/0x174
   pci_device_probe+0xb4/0x144
   really_probe+0xbc/0x298
   __driver_probe_device+0x16c/0x19c
   driver_probe_device+0x3c/0x114
   __device_attach_driver+0xb8/0x118
   bus_for_each_drv+0x84/0xe0
   __device_attach+0x9c/0x194
   device_initial_probe+0x50/0x68
   pci_bus_add_device+0x6c/0xf8
   pci_bus_add_devices+0x3c/0x88
   pci_bus_add_devices+0x68/0x88
   pci_host_probe+0x90/0x108
   cdns_pcie_hpa_host_setup+0x300/0x684
   sky1_pcie_probe+0x230/0x360
   platform_probe+0x5c/0x9c
   really_probe+0xbc/0x298
   __driver_probe_device+0x16c/0x19c
   driver_probe_device+0x3c/0x114
   __driver_attach_async_helper+0x58/0xcc
   async_run_entry_fn+0x34/0xe0
   process_one_work+0x180/0x2dc
   worker_thread+0x188/0x304
   kthread+0x110/0x124
   ret_from_fork+0x10/0x20
   ---[ end trace 0000000000000000 ]---

Fixes: 0fdff3ec6d87 ("async, kmod: warn on synchronous request_module() from async workers")
Co-developed-by: Kai Xia <503536682@qq.com>
Signed-off-by: Kai Xia <503536682@qq.com>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/net/phy/phy_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..9f88da87df97 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/async.h>
 #include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -639,6 +640,9 @@ static int phy_request_driver_module(struct phy_device *dev, u32 phy_id)
 {
 	int ret;
 
+	if (current_is_async())
+		return -EPROBE_DEFER;
+
 	ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
 			     MDIO_ID_ARGS(phy_id));
 	/* We only check for failures in executing the usermode binary,

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

