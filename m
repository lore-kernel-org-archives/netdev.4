Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504135;
	b=r7m6NZDPFzVklYbYh33O+0z7UWNQGipCeF2DFnAQOfisoPNPWHfnlnqQBPHjQVsZyBGy
	 mi/XkTnZ1uB30C5+n7pC0P8eFGaz27SQbBPEPJTaum53v7W7nnusRb8c+T1VwyzMjJtWw
	 kzDi1HOVODTMfqGE8ffOOby/Ucv4VmXjXUFvoWrjkH/74ANniXBSUk7QTt1xO1zdh7+1S
	 OBFm6x+pDSxcYuWxmArH6Eir4NRKvylypJr9lxiWPtRF+0/l44/NyiQVlzbSBwtzdr9G2
	 iFwoejffk5CpuSHadGc/AT2ZHFIyM3ZgTeHWvyBxj8nj/UTX944qtJu/5EA+KBymsxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504135;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OPp83t4K0hyYy88DdN1+rPkmqqDCpOJB1km+PXS/1Ik=;
	b=Qhek2R5VLe0PMDyDSbjPfzkWS0gMtyi+t+8ghJEW/jgVM8XyBXNrH29XGbZvb9Dwl77g
	 8eWDb2mUhUjQKdmioD4P079A/wVYjHtHgUTvJe/1CuLCz9D3964H6LJQIcQ742KNCE8oZ
	 Jq5qXauMCtAfz8rlWlVJLIo3jHNKyXjzeZC3DvYKBK4Q9UBcEebmunTWmdAd5pkgMWeQE
	 ScNIhn1h1m4l7KnRNkbkPfEmnpxhPSD4TXnAWn61v82WoKzETp5YRHvtMY5+VrDeuruS2
	 YvMrYq4BhgBJFre1xH3RO5MBPwZrL6R4yhK/LA3FpAUXtfQZtoaXNKXmatD/wJo1T9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hl0yU0EE;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DA606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6DA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hl0yU0EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=OP
	p83t4K0hyYy88DdN1+rPkmqqDCpOJB1km+PXS/1Ik=; b=hl0yU0EEjn3oGLvojo
	znIIwkPbnGLzm/u7lY2pqr/kG8uLXplttVE5SxytIq8o5v5ldEPzz2ep/xX1vVa9
	Iq8/Qopk3GuZAnes+YsHtXNB31NIVqSx643X1ET54oJrqJwRlFtbNqJZoOE4tP/F
	61jMONibF66ocPT2RdAD0Fecs=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnT1XPNwVrw+49Jg--.33029S2;
	Tue, 24 Nov 2026 15:08:00 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] net: phy: avoid synchronous module request in async probe context
Date: Tue, 24 Nov 2026 15:07:53 +0800
Message-ID: <20261124070753.25972-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDnT1XPNwVrw+49Jg--.33029S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur4UGF43Kw4fGryDWr4fAFb_yoW5ZFW5pF
	s8Ca4YyrZ8Xw47Wa1xJrWjyFyFgay5Cw43Wrn7Cw1a9a97trZrAFyDGr4YgryDJrWkJFy0
	kFyDXrWrGFZYvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJKI_UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BAewWsFN9C2BAAA3Y

phy_request_driver_module() calls request_module() with wait=true to
load a PHY driver.  When the PHY device is probed from an async worker,
such as a PCIe host controller driver that sets PROBE_PREFER_ASYNCHRONOUS,
this triggers:

  WARN_ON_ONCE(wait && current_is_async());

in __request_module().  On an arm64 board whose PCIe controller uses
PROBE_PREFER_ASYNCHRONOUS, probing an RTL8126A behind it produced:

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

Use request_module_nowait() when current_is_async() is true so that the
PHY driver module load is requested without blocking the async worker.
The PHY driver will still bind later, when it registers and the driver
core attaches it to the already-created PHY device.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/net/phy/phy_device.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..a634b8b0c5b2 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/async.h>
 #include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -639,8 +640,12 @@ static int phy_request_driver_module(struct phy_device *dev, u32 phy_id)
 {
 	int ret;
 
-	ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
-			     MDIO_ID_ARGS(phy_id));
+	if (current_is_async())
+		ret = request_module_nowait(MDIO_MODULE_PREFIX MDIO_ID_FMT,
+					    MDIO_ID_ARGS(phy_id));
+	else
+		ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
+				     MDIO_ID_ARGS(phy_id));
 	/* We only check for failures in executing the usermode binary,
 	 * not whether a PHY driver module exists for the PHY ID.
 	 * Accept -ENOENT because this may occur in case no initramfs exists,
-- 
2.43.0

