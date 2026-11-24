Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500413;
	b=o6cV8tMMU8Jy95J/i4PziSeXOleBNwB1GrfhmouGVGOKjdlRgYEGycK0qxJ+ipxaFF9M
	 1i3QmTtFwljHzAWxgNtbmXvml6h9ndTNFP6l5cWUzJxN3HP5sqQGRY4/0Xsobg1L2oKvL
	 d4gsz8u/8GvfAsBesZanekixns2ejC7HV/FkpRewCw2UrVPcKRaAMXNjqaWmbhq6EPbxK
	 CcOK7nvjnHsBvCsbbk/rO27wp5//PUYgP/YCYuZnMcpc2bRECfbHTnoE+tvqghkIdn0iD
	 Cg6P0U3GYVX0ReyNdQyw1cz51qLK2agzBQHXWBbzWKPES698n5USAwWyB6VRnv0vItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500413;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=4yGSDUVSCpEF/8TBNQb2RmwdpCR8BbWQEQ690B58QaA=;
	b=ecvhnUXvTzyRwaI2F9sjDngSJXIxlM3EtFGcZ9iuqJAcDsjzCEItQU3XIqaBxUxK3X5V
	 cUtsE0VcDh2wZHd81l9ANdzhooCsl4E0J/oDgeB7QWxMv4useBquYM6jBjLF2GxnWfBx1
	 M5Newzfxg5XE1eUdntcjK0bp8GLB+NTe84DqZwYoArPKtHnZJay5x6wRuLrgPhEvHjqYS
	 MXkzgclPKdE2jcwE9O3wmptmOd1xIyW5AOTKOzYBEanYv4rGiG/fbxWpHXtoTLEgo72Oa
	 oHo12sRz2WVBRySYtEnjDm/+jaRmy/eYJJnT4kHMhkS/zknJyB+sfK2FdGAYFu5RuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB91606A31E;
	Tue, 24 Nov 2026 06:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB91606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz4t1795500365tafe77e17
X-QQ-Originating-IP: pLGzaiS//fpeqt+nSbgIMbjib4q3dO2Aw8vlx/8hFFY=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 14:06:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13374569658044546354
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
Subject: [PATCH net-next v3 3/5] net: rnpgbe: Support copper link configuration
Date: Tue, 24 Nov 2026 14:06:02 +0800
Message-ID: <C0071FBC8B693BE4+20261124060602.411328-1-dong100@mucse.com>
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
X-QQ-XMAILINFO: NtetnP++zcg+005FlBHgVuFvuShZobLWzXc7XoIydvFbAAu9BQqPcvO3
	0TeCnLef8xwsnrO98h571pvUBAuK0DCdCubfyDBwDohRwPtn0EBfnO5daiuESJ5Du+9GOUe
	ezsixpJfdINxeY873WwDilFcUDPNKg3QwGoF80QbmsCPVzAf2vBapC6uGP8jmyA1lkGPJrg
	rEM8CljTQhp6Nva6ERwWLufXZ0f8SeCEb4c9wISZB8UcPFcfH4iZMXfOTw/Ji72dI9KZIDT
	Zlwm9RXsYBpvgmG0kwZb+slp0zwrigodoNXbl6MVz/7sShS8O+yDLzzbDcoFLHgZXOmC7y9
	wbNxvY4YEyMNvvV9mQqQ217SaNRtGL1d4ReBRCAZJZB8k9KJTmN+1Y6KzTEe+Zc6wY+YS9L
	Dkh0UeNKQU8a+xmXYv/F27KMRFwLyFQSzsjyHfnvnGkqb8Jrg1D3urvBTYyL+zgYiWHpkBG
	d+7GC4zPKXKefSe2y1yd5zfiKUfE64qsPndJyAWON9Fv5fhY3IxQoMTfhPK3tWyxpwOfjDe
	hnRdCbVEX162RpoK/FuH7G/ICbW3lPgV+t/zKZeDfdKGjIoPHSwcM5M7NFRYRBx4u5NI619
	XtuwhpbimOa+0/HKlnS44ZbPyu92EP0On7aUkUjkgXih98/t5QRBmOGSrLHfTMh8st9ukFT
	C+18bRZxJa9vNt6zxvGGqHgFmo2KMIKiS+GyDAz4h7Td8jGlPnEbpXBhFU5c3Bxfj0vUbHZ
	PKr2fo35cHMxJv9CqAdIcyZ3J1Nh9Rn/8zGmCpPf4+kycm9q6ox9GD7Ezi6MW3IK1oJmA04
	Ocwb0eaWnQT02horMsHZPqU5VeY54gn7XX+0h/RHfTzCn53cenoCWkJU6eBBuYEh5rGs8iS
	/XlxTUj4OKq6kCmS/J4CdWLpEAivpDwbIpzFS5u+gT/Ohhv/2jmiUsa8Neb3iecQQ4GfWLK
	JoLcApTKVLITkMrP+ZwCBzAThZzug0YVk4N4Vp7WaEgaYcGXoajD5pMKh0EseBKMjxBumi2
	6QmFNpbZsDZYNE/ctTdTRYWlcVSdpQcFzcK7yRvf1WFi8hfD2yLXFkjQX0V3KJ1hGFpBg14
	h4h+gtKmI3kGbwy2sMEG1srBg3EnUgCGvhGdp+ydt/A
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Add set_link_ksettings support for copper ports to configure
autonegotiation, advertised link modes, forced 10/100 Mb/s speed and
duplex, and automatic or manual MDI/MDI-X selection.

Firmware reports each port's fixed media type (copper, fibre or
backplane) through GET_LANE_STATUS. The host cannot change this media
type, so requests to change the reported port type are rejected.

Use the event-coalescing mailbox transport for PHY_LINK_SET because
runtime configuration can overlap firmware link events in the shared
mailbox. Acknowledge a pending event without updating its snapshot so
firmware can report the link state again after the command.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 107 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |   9 +-
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
index bebbfabe74e8..b76086ac9468 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -124,6 +124,112 @@ static int rnpgbe_get_link_ksettings(struct net_device *netdev,
 	return 0;
 }
 
+static u32 rnpgbe_fw_link_modes(const unsigned long *modes)
+{
+	u32 fw_modes = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rnpgbe_tp_modes); i++) {
+		if (linkmode_test_bit(rnpgbe_tp_modes[i].ethtool_mode, modes))
+			fw_modes |= rnpgbe_tp_modes[i].fw_mode;
+	}
+
+	return fw_modes;
+}
+
+static int rnpgbe_set_link_ksettings(struct net_device *netdev,
+				     const struct ethtool_link_ksettings *cmd)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_modes);
+	struct mucse *mucse = netdev_priv(netdev);
+	u8 mdix = cmd->base.eth_tp_mdix_ctrl;
+	u32 advertising, mode, supported;
+	u8 phy_addr = 0, port = PORT_TP;
+	bool autoneg;
+	u16 status;
+	int err;
+
+	status = mucse->hw.link_config.status;
+	if (status & MUCSE_LINK_TP)
+		phy_addr = mucse->hw.link_config.phy_addr;
+	else if (status & MUCSE_LINK_BACKPLANE)
+		port = PORT_NONE;
+	else
+		port = PORT_FIBRE;
+	if (cmd->base.port != port || cmd->base.phy_address != phy_addr)
+		return -EINVAL;
+
+	if (cmd->base.autoneg != AUTONEG_ENABLE &&
+	    cmd->base.autoneg != AUTONEG_DISABLE)
+		return -EINVAL;
+	autoneg = cmd->base.autoneg == AUTONEG_ENABLE;
+	if (!(status & MUCSE_LINK_TP)) {
+		if (autoneg ||
+		    cmd->base.speed != mucse->hw.link_config.speed ||
+		    cmd->base.duplex != mucse->hw.link_config.duplex ||
+		    !linkmode_empty(cmd->link_modes.advertising))
+			return -EINVAL;
+		if (mdix)
+			return -EOPNOTSUPP;
+		return 0;
+	}
+
+	if (!mdix)
+		mdix = mucse->hw.mdix_ctrl;
+	if (mdix != ETH_TP_MDI && mdix != ETH_TP_MDI_X &&
+	    mdix != ETH_TP_MDI_AUTO)
+		return -EINVAL;
+
+	supported = mucse->hw.link_config.supported;
+	linkmode_zero(supported_modes);
+	rnpgbe_link_modes(supported_modes, supported);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_TP_BIT, supported_modes);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, supported_modes);
+	if (!linkmode_subset(cmd->link_modes.advertising, supported_modes))
+		return -EINVAL;
+	advertising = rnpgbe_fw_link_modes(cmd->link_modes.advertising);
+	if (autoneg) {
+		if (!advertising)
+			return -EINVAL;
+	} else {
+		if (cmd->base.duplex != DUPLEX_FULL &&
+		    cmd->base.duplex != DUPLEX_HALF)
+			return -EINVAL;
+		switch (cmd->base.speed) {
+		case SPEED_10:
+			mode = cmd->base.duplex == DUPLEX_FULL ?
+				RNPGBE_FW_ADV_10_FULL : RNPGBE_FW_ADV_10_HALF;
+			break;
+		case SPEED_100:
+			mode = cmd->base.duplex == DUPLEX_FULL ?
+				RNPGBE_FW_ADV_100_FULL : RNPGBE_FW_ADV_100_HALF;
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (!(supported & mode))
+			return -EINVAL;
+	}
+
+	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
+				 autoneg ? 0 : cmd->base.speed,
+				 autoneg ? 0 : cmd->base.duplex, mdix);
+	if (!err) {
+		mucse->hw.mdix_ctrl = mdix;
+		mucse->hw.link_config.advertising = advertising;
+		mucse->hw.link_config.speed = autoneg ?
+			SPEED_UNKNOWN : cmd->base.speed;
+		mucse->hw.link_config.duplex = autoneg ?
+			DUPLEX_UNKNOWN : cmd->base.duplex;
+		if (autoneg)
+			mucse->hw.link_config.status |= MUCSE_LINK_AUTONEG;
+		else
+			mucse->hw.link_config.status &= ~MUCSE_LINK_AUTONEG;
+	}
+
+	return err;
+}
+
 static void rnpgbe_get_drvinfo(struct net_device *netdev,
 			       struct ethtool_drvinfo *info)
 {
@@ -141,4 +247,5 @@ const struct ethtool_ops rnpgbe_ethtool_ops = {
 	.get_drvinfo = rnpgbe_get_drvinfo,
 	.get_link = ethtool_op_get_link,
 	.get_link_ksettings = rnpgbe_get_link_ksettings,
+	.set_link_ksettings = rnpgbe_set_link_ksettings,
 };
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
index 469818b83d70..70eef8ed7f5c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -210,7 +210,12 @@ int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
  * @duplex: forced duplex mode when autonegotiation is disabled
  * @mdix_ctrl: MDI/MDI-X control mode
  *
- * Firmware ignores @speed, @duplex when @autoneg is true.
+ * Firmware ignores @speed and @duplex when @autoneg is true, and
+ * @advertising when @autoneg is false.
+ *
+ * Firmware acknowledges the request when it consumes it. If the ACK
+ * wait times out, firmware will not apply the request later, so the
+ * previous link configuration remains valid.
  *
  * Return: 0 on success, negative errno on failure
  **/
@@ -236,7 +241,7 @@ int mucse_mbx_set_link(struct mucse_hw *hw, u32 advertising, bool autoneg,
 
 	len = le16_to_cpu(req.r.datalen);
 	mutex_lock(&hw->mbx.lock);
-	err = mucse_write_and_wait_ack_mbx(hw, req.dwords, len);
+	err = mucse_write_mbx_coalesce_event(hw, req.dwords, len);
 	mutex_unlock(&hw->mbx.lock);
 
 	return err;
-- 
2.50.1


