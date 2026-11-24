Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500385;
	b=1bkCiMcRHELueIAzhGKiggcaxiPvY6v7EBdsatvvVLeyxi+Qk+IUiw7hIrkvas6eUtuh
	 NpTKYezmGT5+M7keJ8Ke4c5knGHFJQ5YNv/ERHxwVu26iPiFF9OJElX4vKcDWTNsdtLzl
	 KzVppS4ht9ZAWcy2De1fGJmeHMXfw4aH+tahVzpli6B2vQZAnxBVJFrvwhKFIPkKDFDW8
	 WDFRanruGICkS+z2EM7I3LXYvw52x/sduJcdXJ2OFVy+FsS9ZudO0S/sBuuJv0712NgTb
	 r1OcuTnkwDK/EcZ1k0ZCLHvoXBPKlTPy4gQgRgg6qPpOZt1g/hiVYQ7H+4Jq2klmFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500385;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7dcwnJj2vA9bhQKn9/gRxbwaSZ3/ZpAApP3j+tALvFU=;
	b=hu+EVZDBhKMJEz/jr2N7pcRmGqISckYnf1+Q8uMwtTEwNBMKjJabJCGsluhj9V67mSdT
	 eBgFvszK3NKrbhUHxqJekRhehASNrLft6fqb2jMtIBrVmgFj5frbyIUy05uKr95v7Hkfn
	 ICgcR2TIcw+cOa37O60ZT6nWYYF0Exa0VFQQKI85PYPnafssJnz2fH/yMxVBhmwvSkM/C
	 mw1jvJaTDhnh3EYGJmQkdchLGfgupUi7/+Z6YbI2CSKkqfK0tcI354XCSvS16dtyR1C5i
	 tyxd6Z2VDe/ikzwmWM2ARw7frVNfjdl8gP0R1s8Y8REEi5KyIIsNecJnOUwFWLSAt6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFBA606A31E;
	Tue, 24 Nov 2026 06:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpgz12t1795500340t572047e5
X-QQ-Originating-IP: 1G7FQ294Ju+jj0ZPOMHVGH42tIXfu3JRxNTEKxvkyZ4=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 14:05:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16629439110718088455
EX-QQ-RecipientCnt: 11
From: Dong Yibo <dong100@mucse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dong100@mucse.com,
	yaojun@mucse.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 1/5] net: rnpgbe: Add basic ethtool support
Date: Tue, 24 Nov 2026 14:05:36 +0800
Message-ID: <DC930E9F232222FD+20261124060536.411208-1-dong100@mucse.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6C54E9FB2E95869E+20261124060436.410989-1-dong100@mucse.com>
References: <6C54E9FB2E95869E+20261124060436.410989-1-dong100@mucse.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: N4Ea1gjV/5VWaJBv0KFM7oPFQgk/XQ9ZPop5VHCoRIsyWIprtC32siXr
	NOjvEzVxDA9GVmDd8Hd/Yd7XUzfndP64ouWgksX18E/NdpwkW2K4PuggKPkVNtGKp1pLdDT
	iLO2phtfpfzjpC7XzPg5WxvR4I6glcKCsS7oO9sNgd+2TzCyf0V07mfbeovs5IUcfCx+vz7
	RnBfVGw5bdMpI75WdWTmk9o7X3KlXTDkDSdu/XQYcjox7F+LnLHZ1e19ORjcTAl44kOq+M0
	xwC4q9ESsE1gJgCg40nyFH9I0FtRsLkDINU2APvvGw2r0lAEYqBkK71sW8WRoL9liXuTNdZ
	0oNslQYYdvIB8/tHAETjnbUGFd6AuMvOY19xQxEr9uhqzkt0RMXp7m9vCvDQ2uHUDB2c5na
	Y6wdE85lH3blC7375pufExxgOhxviLy/o4QFUloxdvP8piA20uBlj4qMWZ8eiNtbNoIwVXu
	oJ4cAdjdFGJ32VkkrqREKOFbLQcpFi4yS/aam+0xqsvVyWn1DpYS3UeQbr4TIIAmPdjH1mT
	0JuAcrNVn4eyrmhBjIJi8F09kBfoWclRMIsLcPyy6Ou59zDzDW1w01FtU/gl5Xn9TG1UjsK
	I+x/nfTeN9Skkktgdxofec4fg7Q1Z5Ehm0xZi9ww+Ihj8qsj3FOVYFbrfs4bJZRnxolOTOU
	gDthteNbuUDY7SjYL7ppx82Zokd2rNBp0VhGS8XKB20CKBv5mikTqRdlcuzGf3roFwTzg01
	uFFJzmKKHreiMG8rTJ37iDVpSZaQhU8KCYPS0vYIMdAgA0icnnrdpnmds2hoLoNw0ff1PJo
	kXHBMyLZhAvilp608KlipAe0bHSp27bMm67ROzwazFUGLOIftokcOCJZf2kjQ5NefJTZfoM
	/VfRXHzakYcJ316GfAts0GcMabvkdmVjX3UpXG4floM1xLhGDEvbZtUiRg+J6gbeDA7qIit
	1wub3sQlY79D+iDchfear6pfCFmFmjN5N5OIaJJ+snxvNa6nRlVNA5qWuUn090lpFJpxf0W
	UzlddO+P0VnMOcmji6WCtafmrHVlVnZ4kzeep6YcMLnFIvcfeRvcBtSn96Uv60o9LmbtnIz
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Add get_drvinfo and get_link callbacks to report the driver name,
PCI bus address, firmware version and carrier state through ethtool.

Signed-off-by: Dong Yibo <dong100@mucse.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/mucse/rnpgbe/Makefile    |  1 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  3 +++
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 25 +++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  1 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |  4 ++-
 5 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c

diff --git a/drivers/net/ethernet/mucse/rnpgbe/Makefile b/drivers/net/ethernet/mucse/rnpgbe/Makefile
index 17574cad392a..4d768324a82c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/Makefile
+++ b/drivers/net/ethernet/mucse/rnpgbe/Makefile
@@ -9,4 +9,5 @@ rnpgbe-objs := rnpgbe_main.o\
 	       rnpgbe_chip.o\
 	       rnpgbe_mbx.o\
 	       rnpgbe_mbx_fw.o\
+	       rnpgbe_ethtool.o\
 	       rnpgbe_lib.o
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 4e9776b28bfb..2fe76c95da7c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -46,6 +46,7 @@ struct mucse_hw {
 	struct mucse_mbx_info mbx;
 	int port;
 	int speed;
+	u32 fw_version;
 	bool link;
 	u16 cycles_per_us;
 	u8 pfvfnum;
@@ -257,6 +258,8 @@ int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *mc);
 void rnpgbe_set_link(struct mucse_hw *hw, bool linkup);
 
+extern const struct ethtool_ops rnpgbe_ethtool_ops;
+
 /* Device IDs */
 #define PCI_VENDOR_ID_MUCSE               0x8848
 #define RNPGBE_DEVICE_ID_N500_QUAD_PORT   0x8308
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
new file mode 100644
index 000000000000..506233f62698
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2022 - 2026 Mucse Corporation. */
+
+#include <linux/ethtool.h>
+#include <linux/pci.h>
+
+#include "rnpgbe.h"
+
+static void rnpgbe_get_drvinfo(struct net_device *netdev,
+			       struct ethtool_drvinfo *info)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	u32 version = mucse->hw.fw_version;
+
+	strscpy(info->driver, KBUILD_MODNAME);
+	strscpy(info->bus_info, pci_name(mucse->pdev));
+	snprintf(info->fw_version, sizeof(info->fw_version), "%u.%u.%u.%u",
+		 version >> 24, (version >> 16) & 0xff,
+		 (version >> 8) & 0xff, version & 0xff);
+}
+
+const struct ethtool_ops rnpgbe_ethtool_ops = {
+	.get_drvinfo = rnpgbe_get_drvinfo,
+	.get_link = ethtool_op_get_link,
+};
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 708a7297233e..46981ef2542a 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -250,6 +250,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 	}
 
 	netdev->netdev_ops = &rnpgbe_netdev_ops;
+	netdev->ethtool_ops = &rnpgbe_ethtool_ops;
 	netdev->priv_flags |= IFF_UNICAST_FLT;
 	rnpgbe_sw_init(mucse);
 	err = rnpgbe_reset_hw(hw);
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
index c6ce9dbee3d0..4a1893792751 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -72,9 +72,11 @@ static int mucse_mbx_get_info(struct mucse_hw *hw)
 	int err;
 
 	err = mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
-	if (!err)
+	if (!err) {
 		hw->pfvfnum = FIELD_GET(GENMASK_U16(7, 0),
 					le16_to_cpu(reply.r.hw_info.pfnum));
+		hw->fw_version = le32_to_cpu(reply.r.hw_info.fw_version);
+	}
 
 	return err;
 }
-- 
2.50.1

