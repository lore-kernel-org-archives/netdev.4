Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500428;
	b=OatLj+MVdX0Xldo3vQxvO7rhnXc+EnEWBpJk/KpknWuJzVXPVZ59E6UvXrsQHCAPbSlx
	 Oj/AN0wv+QiH0xRRmfzscQ56UAKJlmGwKVcNab6hM1de5yv67EGlWx2SCzn5EnamNzf88
	 yMbdC40wPog8NRi9chj4zSE+85dldulYtO0bictnJZBnzqP74aTxM0srbEXTJLiaPj+nm
	 8U2beUw4nwyl4uvTeacb6xrkPXMCgZc1OJhlBhNFzt4608/nMD4F7WLhV/uDibJDpOX3n
	 VOCIQq0GGGtJmgTxpMf+3fg+ZO8kj5OpC52b8YsIGUCveH/RPNDMbziXl0Pdr3ygXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500428;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=FQ6JJAXdTKAV+XGc1CCUz3dbYUIZ1O2QBMcSrAbJX8g=;
	b=HP7B9WN4WiPlvbtA56tzx+pd6VG01Lphq0GA5oog8IjpMx0lAi+au4MRICDOU9MacrqM
	 dby6GumD1Ij93TqsJilSbO9i6P3e7sImxhq/Wuz8uYjNCqvpnPLd7VN7x3xKePVhgYegF
	 wgfW37QkFSUqpkqGZzrCQTRithv+cBJQpaIavZ+F9g9z+UgTg1fuSqufSM8lZaMs6ZXkJ
	 EWFAFpxept8SSOoC51rxpyOkWyatapyToAszoVQWVex++qlLeZXvRwqTiDqdc+q4iy7O9
	 OU6FUqM3YYthQk10hzKDgLqXc/n8cBVtTWbsRYRL4KQM2iGqSSnKQfEVyrK1Kk19r5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704D606A321;
	Tue, 24 Nov 2026 06:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9704D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz7t1795500350td1cc229e
X-QQ-Originating-IP: O/2sEY9xgm3ZD22nmMM63fdFKvHJxNp/osyBBQ4sdms=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 14:05:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15308342797315026879
EX-QQ-RecipientCnt: 10
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
	yaojun@mucse.com
Subject: [PATCH net-next v3 2/5] net: rnpgbe: Report link settings through ethtool
Date: Tue, 24 Nov 2026 14:05:46 +0800
Message-ID: <32E4A50B05876D23+20261124060546.411262-1-dong100@mucse.com>
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
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MZIGq93qkLWzZKkhJxqDeQGFW2PyYZoruAGx7jxx+GPgj/CIlWNqSh2/
	EQlgt7wISD3LEwrEXu30FORaD8Pe8rzbLGdUsG5W/ADJ9mK+pULEoaisDgyMQcaJ1IBQ0Vr
	X12ZXjXKF+skuRANP+5ygubObsxL8xldW4TOkJstoJ70+cad4fn3FcV06+8egF0J3mY20pD
	2cfnWV3QXavBSBvPsD0xZRIUh3L/bdFZnr0Ebucls3MaVVrZs1l6uo63uDfom98zrrGwiXo
	Q+irAjdcnEqepQXhIcbxQ6Xq1P5XprtpaDIBLe399OtQI4kljbPMTkcxhVRYMXM0vUUkNeR
	FwDItHMwGTP953rA2EcEf+vq0gZfzdO9JHmzQZ8oCOMwcVGXhCo+dhnePWXsyGrx2IZC1mZ
	xseufrv4N0druvewPsav3+twWIPBEg/aH5f/94BhGDpnpCu4NOuhToB4s/wpYahAfgUxYMh
	Yf+I0tjJKzNsrY3oywEjFA1PBw1RCoY55sXSaSZM3/7wKHX8cSL5M9LJDqTJ4o6rLgnNM1l
	a6us/3mY+zhIxPcf+z13lQBbc1xXsb+7fy+9yyG58KkiBKgKSw0PT3nuljEEnHstN6/u2yi
	Kbc4p1FV8Sxa/3OWbcRqT38Z1edgzjv8jXwz+Omi4OIjqAhLwEgmNbrlqIkotG9NoiIAU5O
	oWcxP7y6A6doXw88C5OGNFWyyUCfJMNvL02kJS0tSxE962VLjfFdtkWoRT0RTsgv6eHjGrk
	bk2Kbrf76dQ07cCmy4RGmagH6y5f7JHZ15y7gtB0/0QpN5Lgwif3i3MB/JEVTR7LYCnrK+J
	xYXzmiy/iL2mWtOd4nTPwDojeSHozWC7YaNqcidBFrDKRQlc8Zo2BaHDvlNXV8WLJ3Mgx5G
	aOa3+yj+ePEVMxNDodNJqG4nzGzTFqMEsY4y2DmZiKYxvYJnDfkKnLwj+JfuPYPwWF9vOxe
	03LYswGUZ1LYlYF06nctWDCFUuT4/Bm7+RCz7Cr5vCXXGBbSStrXV1lH1+f+srLQjvLGzuy
	RkwkjRCPMu8E+QAUFsDtrJkm3HAZSpd/rxU8wG4PcQrLGSuZ6Yg9y14EA5DAzeT1cKrA0cO
	S6PdvcR+N+IL9ysa41eGtg=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Add get_link_ksettings support to report supported and advertised
link modes, autonegotiation, port type and PHY address. Report copper,
fibre and backplane link modes from firmware, with autonegotiation
support on copper ports.

These devices support autonegotiation only on TP ports. Configure TP
ports with autonegotiation enabled and fibre and backplane ports with
fixed 1 Gb/s full duplex.
Report no advertisement for these fixed non-TP configurations.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  13 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   |  34 ++++-
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 119 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |   7 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |  29 +++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h |  26 ++++
 6 files changed, 226 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 2fe76c95da7c..83267d475257 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -39,11 +39,21 @@ enum {
 	mucse_fw_link_report_en,
 };
 
+struct mucse_link_config {
+	u32 supported;
+	u32 advertising;
+	u32 speed;
+	u16 status;
+	u8 phy_addr;
+	u8 duplex;
+};
+
 struct mucse_hw {
 	void __iomem *hw_addr;
 	void __iomem *ring_msix_base;
 	struct pci_dev *pdev;
 	struct mucse_mbx_info mbx;
+	struct mucse_link_config link_config;
 	int port;
 	int speed;
 	u32 fw_version;
@@ -51,6 +61,8 @@ struct mucse_hw {
 	u16 cycles_per_us;
 	u8 pfvfnum;
 	u8 duplex;
+	u8 mdix_ctrl;
+	u8 mdix;
 };
 
 struct rnpgbe_tx_desc {
@@ -249,6 +261,7 @@ struct mucse {
 int rnpgbe_get_permanent_mac(struct mucse_hw *hw, u8 *perm_addr);
 int rnpgbe_reset_hw(struct mucse_hw *hw);
 int rnpgbe_setup_default_link(struct mucse_hw *hw);
+int rnpgbe_init_link_config(struct mucse_hw *hw);
 int rnpgbe_send_notify(struct mucse_hw *hw,
 		       bool enable,
 		       int mode);
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
index dcc8233e024e..3a2f62f0630d 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
@@ -64,12 +64,42 @@ int rnpgbe_reset_hw(struct mucse_hw *hw)
  * rnpgbe_setup_default_link - Configure the default link settings
  * @hw: hardware information structure
  *
+ * The default configuration relies on GET_LANE_STATUS reporting at least
+ * one mode in RNPGBE_DEFAULT_ADV for TP ports and RNPGBE_FW_ADV_1000_FULL
+ * for fibre and backplane ports. TP ports use the supported subset of the
+ * default mask for autonegotiation. Fibre and backplane use fixed 1 Gb/s
+ * full duplex.
+ *
  * Return: 0 on success, negative errno on failure
  **/
 int rnpgbe_setup_default_link(struct mucse_hw *hw)
 {
-	return mucse_mbx_set_link(hw, RNPGBE_DEFAULT_ADV, true, 0, 0,
-				  ETH_TP_MDI_AUTO);
+	u32 advertising = hw->link_config.supported & RNPGBE_DEFAULT_ADV;
+	bool autoneg = hw->link_config.status & MUCSE_LINK_TP;
+	u8 duplex = DUPLEX_UNKNOWN;
+	u32 speed = SPEED_UNKNOWN;
+	int err;
+
+	if (!autoneg) {
+		advertising &= RNPGBE_FW_ADV_1000_FULL;
+		speed = SPEED_1000;
+		duplex = DUPLEX_FULL;
+	}
+
+	err = mucse_mbx_set_link(hw, advertising, autoneg,
+				 autoneg ? 0 : speed, autoneg ? 0 : duplex,
+				 ETH_TP_MDI_AUTO);
+	if (!err) {
+		hw->link_config.advertising = advertising;
+		hw->link_config.speed = speed;
+		hw->link_config.duplex = duplex;
+		if (autoneg)
+			hw->link_config.status |= MUCSE_LINK_AUTONEG;
+		else
+			hw->link_config.status &= ~MUCSE_LINK_AUTONEG;
+	}
+
+	return err;
 }
 
 /**
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
index 506233f62698..bebbfabe74e8 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -2,9 +2,127 @@
 /* Copyright(c) 2022 - 2026 Mucse Corporation. */
 
 #include <linux/ethtool.h>
+#include <linux/linkmode.h>
 #include <linux/pci.h>
 
 #include "rnpgbe.h"
+#include "rnpgbe_mbx_fw.h"
+
+static const struct {
+	u32 fw_mode;
+	u32 ethtool_mode;
+} rnpgbe_tp_modes[] = {
+	{ RNPGBE_FW_ADV_10_HALF, ETHTOOL_LINK_MODE_10baseT_Half_BIT },
+	{ RNPGBE_FW_ADV_10_FULL, ETHTOOL_LINK_MODE_10baseT_Full_BIT },
+	{ RNPGBE_FW_ADV_100_HALF, ETHTOOL_LINK_MODE_100baseT_Half_BIT },
+	{ RNPGBE_FW_ADV_100_FULL, ETHTOOL_LINK_MODE_100baseT_Full_BIT },
+	{ RNPGBE_FW_ADV_1000_FULL, ETHTOOL_LINK_MODE_1000baseT_Full_BIT },
+};
+
+static void rnpgbe_link_modes(unsigned long *modes, u32 fw_modes)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rnpgbe_tp_modes); i++) {
+		if (fw_modes & rnpgbe_tp_modes[i].fw_mode)
+			linkmode_set_bit(rnpgbe_tp_modes[i].ethtool_mode,
+					 modes);
+	}
+}
+
+/**
+ * rnpgbe_init_link_config - Cache firmware link capabilities and configuration
+ * @hw: hardware information structure
+ *
+ * Query before port-up: repeated GET_LANE_STATUS commands can prevent
+ * firmware from completing forced 10 Mb/s link setup. Runtime link state
+ * comes from link events instead.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int rnpgbe_init_link_config(struct mucse_hw *hw)
+{
+	struct mucse_link_info info;
+	int err;
+
+	err = mucse_mbx_get_link(hw, &info);
+	if (err)
+		return err;
+
+	hw->link_config.supported = le32_to_cpu(info.supported);
+	hw->link_config.advertising = le32_to_cpu(info.advertising);
+	hw->link_config.status = le16_to_cpu(info.status);
+	hw->link_config.phy_addr = info.phy_addr;
+
+	return 0;
+}
+
+static int rnpgbe_get_link_ksettings(struct net_device *netdev,
+				     struct ethtool_link_ksettings *cmd)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	struct mucse_hw *hw = &mucse->hw;
+	u32 supported, advertising;
+	unsigned long flags;
+	u16 status;
+	int mode;
+
+	status = hw->link_config.status;
+	supported = hw->link_config.supported;
+	advertising = hw->link_config.advertising;
+	ethtool_link_ksettings_zero_link_mode(cmd, supported);
+	ethtool_link_ksettings_zero_link_mode(cmd, advertising);
+	ethtool_link_ksettings_zero_link_mode(cmd, lp_advertising);
+	cmd->base.autoneg = AUTONEG_DISABLE;
+	cmd->base.speed = SPEED_UNKNOWN;
+	cmd->base.duplex = DUPLEX_UNKNOWN;
+	cmd->base.eth_tp_mdix = ETH_TP_MDI_INVALID;
+	spin_lock_irqsave(&mucse->link_lock, flags);
+	if (netif_carrier_ok(netdev) && hw->link) {
+		cmd->base.speed = hw->speed;
+		cmd->base.duplex = hw->duplex ?
+				   DUPLEX_FULL : DUPLEX_HALF;
+		if (status & MUCSE_LINK_TP)
+			cmd->base.eth_tp_mdix = hw->mdix;
+	}
+	spin_unlock_irqrestore(&mucse->link_lock, flags);
+
+	if (status & MUCSE_LINK_TP) {
+		rnpgbe_link_modes(cmd->link_modes.supported, supported);
+		rnpgbe_link_modes(cmd->link_modes.advertising, advertising);
+		ethtool_link_ksettings_add_link_mode(cmd, supported, TP);
+		ethtool_link_ksettings_add_link_mode(cmd, supported, Autoneg);
+		if (status & MUCSE_LINK_AUTONEG) {
+			cmd->base.autoneg = AUTONEG_ENABLE;
+			ethtool_link_ksettings_add_link_mode(cmd, advertising,
+							     Autoneg);
+		}
+		cmd->base.port = PORT_TP;
+		cmd->base.phy_address = hw->link_config.phy_addr;
+		cmd->base.eth_tp_mdix_ctrl = hw->mdix_ctrl;
+	} else {
+		if (status & MUCSE_LINK_BACKPLANE) {
+			mode = ETHTOOL_LINK_MODE_1000baseKX_Full_BIT;
+			ethtool_link_ksettings_add_link_mode(cmd, supported,
+							     Backplane);
+			cmd->base.port = PORT_NONE;
+		} else {
+			mode = ETHTOOL_LINK_MODE_1000baseX_Full_BIT;
+			ethtool_link_ksettings_add_link_mode(cmd, supported,
+							     FIBRE);
+			cmd->base.port = PORT_FIBRE;
+		}
+		if (supported & RNPGBE_FW_ADV_1000_FULL)
+			linkmode_set_bit(mode, cmd->link_modes.supported);
+	}
+
+	if (cmd->base.autoneg == AUTONEG_DISABLE) {
+		cmd->base.speed = hw->link_config.speed;
+		cmd->base.duplex = hw->link_config.duplex;
+	}
+
+	return 0;
+}
 
 static void rnpgbe_get_drvinfo(struct net_device *netdev,
 			       struct ethtool_drvinfo *info)
@@ -22,4 +140,5 @@ static void rnpgbe_get_drvinfo(struct net_device *netdev,
 const struct ethtool_ops rnpgbe_ethtool_ops = {
 	.get_drvinfo = rnpgbe_get_drvinfo,
 	.get_link = ethtool_op_get_link,
+	.get_link_ksettings = rnpgbe_get_link_ksettings,
 };
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 46981ef2542a..31871b244882 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -2,6 +2,7 @@
 /* Copyright(c) 2020 - 2025 Mucse Corporation. */
 
 #include <linux/pci.h>
+#include <linux/ethtool.h>
 #include <linux/skbuff.h>
 #include <net/rtnetlink.h>
 #include <linux/etherdevice.h>
@@ -169,6 +170,7 @@ static void rnpgbe_sw_init(struct mucse *mucse)
 	mucse->tx_ring_item_count = M_DEFAULT_TXD;
 	mucse->rx_ring_item_count = M_DEFAULT_RXD;
 	mucse->tx_work_limit = M_DEFAULT_TX_WORK;
+	mucse->hw.mdix_ctrl = ETH_TP_MDI_AUTO;
 
 	for (i = 0; i < RNPGBE_MAX_QUEUES; i++) {
 		u64_stats_init(&mucse->tx_stats[i].syncp);
@@ -258,6 +260,11 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 		dev_err(&pdev->dev, "Hw reset failed %d\n", err);
 		goto err_powerdown;
 	}
+	err = rnpgbe_init_link_config(hw);
+	if (err) {
+		dev_err(&pdev->dev, "Get link capabilities failed %d\n", err);
+		goto err_powerdown;
+	}
 	err = rnpgbe_setup_default_link(hw);
 	if (err) {
 		dev_err(&pdev->dev, "Setup link failed %d\n", err);
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
index 4a1893792751..469818b83d70 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -242,6 +242,33 @@ int mucse_mbx_set_link(struct mucse_hw *hw, u32 advertising, bool autoneg,
 	return err;
 }
 
+/**
+ * mucse_mbx_get_link - Query firmware link settings and capabilities
+ * @hw: hardware information structure
+ * @info: firmware link information returned on success
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int mucse_mbx_get_link(struct mucse_hw *hw, struct mucse_link_info *info)
+{
+	union mbx_fw_cmd_req_u req = {
+		.r = {
+			.datalen = cpu_to_le16(MUCSE_MBX_REQ_HDR_LEN +
+					       sizeof(req.r.get_link)),
+			.opcode = cpu_to_le16(GET_LANE_STATUS),
+			.get_link.port = cpu_to_le32(hw->port),
+		},
+	};
+	union mbx_fw_cmd_reply_u reply = {};
+	int err;
+
+	err = mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
+	if (!err)
+		*info = reply.r.link_info;
+
+	return err;
+}
+
 /**
  * mucse_mbx_phyup - Request that firmware bring the PHY up or down
  * @hw: pointer to the HW structure
@@ -435,6 +462,8 @@ static void mucse_mbx_fw_req_handler(struct mucse_hw *hw,
 
 		hw->speed = le16_to_cpu(req->link_stat.st.speed);
 		hw->duplex = req->link_stat.st.flags & DUPLEX_BIT;
+		hw->mdix = FIELD_GET(ST_STATUS_MDIX_MASK,
+				     le16_to_cpu(req->link_stat.st.status));
 		rnpgbe_set_link(hw, mucse_link_is_up(hw, req));
 		/* update regs to notify link info is received */
 		mucse_update_link_status_reg(hw, req);
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h
index 93ce0e796442..221b4fabe163 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h
@@ -15,6 +15,7 @@ enum MUCSE_FW_CMD {
 	GET_MAC_ADDRESS = 0x0602,
 	RESET_HW        = 0x0603,
 	LINK_CHANGE_EVT = 0x0608,
+	GET_LANE_STATUS = 0x0610,
 	LINK_REPORT_EN  = 0x0613,
 	PHY_LINK_SET    = 0x0630,
 	SET_PHY_UP      = 0x0800,
@@ -27,6 +28,24 @@ enum MUCSE_FW_CMD {
 #define RNPGBE_FW_ADV_10_HALF		BIT(10)
 #define RNPGBE_FW_ADV_100_HALF		BIT(11)
 
+struct mucse_link_info {
+	u8 reserved0[4];
+	__le16 status;
+	u8 phy_addr;
+	u8 reserved1;
+	__le32 speed;
+	__le32 reserved2[4];
+	__le32 supported;
+	__le32 phy_id;
+	__le32 advertising;
+} __packed;
+
+#define MUCSE_LINK_UP		BIT(0)
+#define MUCSE_LINK_FULL_DUPLEX	BIT(1)
+#define MUCSE_LINK_AUTONEG	BIT(2)
+#define MUCSE_LINK_TP		BIT(7)
+#define MUCSE_LINK_BACKPLANE	BIT(12)
+
 struct mucse_hw_info {
 	u8 link_stat;
 	u8 port_mask;
@@ -47,6 +66,8 @@ struct mucse_hw_info {
 } __packed;
 
 #define ST_STATUS_LLDP_STATUS_MASK        BIT(12)
+/* MDI-X status uses ETH_TP_MDI_* encoding: 0 on link down, 1 MDI, 2 MDI-X. */
+#define ST_STATUS_MDIX_MASK               GENMASK(11, 10)
 
 #define DUPLEX_BIT                        BIT(0)
 struct st_status {
@@ -87,6 +108,9 @@ struct mbx_fw_cmd_req {
 			__le32 nr_lane;
 			__le32 tp_mdix_ctrl;
 		} phy_link_set;
+		struct {
+			__le32 port;
+		} get_link;
 		struct {
 			/* LINK_REPORT_EN uses its own 16-bit payload layout:
 			 * status precedes port_mask.
@@ -123,6 +147,7 @@ struct mbx_fw_cmd_reply {
 			} addrs[4];
 		} mac_addr;
 		struct mucse_hw_info hw_info;
+		struct mucse_link_info link_info;
 	};
 } __packed;
 
@@ -156,6 +181,7 @@ int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
 			  u8 *mac_addr, int port);
 int mucse_mbx_set_link(struct mucse_hw *hw, u32 advertising, bool autoneg,
 		       u32 speed, u32 duplex, u32 mdix_ctrl);
+int mucse_mbx_get_link(struct mucse_hw *hw, struct mucse_link_info *info);
 int mucse_mbx_phyup(struct mucse_hw *hw, bool is_phyup);
 int mucse_mbx_link_report(struct mucse_hw *hw, bool is_report);
 void mucse_fw_irq_handler(struct mucse_hw *hw);
-- 
2.50.1

