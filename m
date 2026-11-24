Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500416;
	b=EP1p4uuZ+hrLqL0TaMgkLleGZwU+XidDf61hu5qa3V31pU5JAkf0lTkc7WMqJ/oX2w+t
	 w1zM+8NLKcrp1WhSZraTI1uQwoyjP29ms6T23l3CwlbyioMB8w8AILJ7+X2Ylbpp09ssr
	 AyJwCsn7IsBGalqfkZ3Y8Hpnm98BnyB32Z5OfkHxR3Q3akEIks5v3/UXf6FowicTkHJPT
	 y6lfLmGGbgRi61fNMafV3D180t3eg871k/3LYunArEcpZPQcJRgiuWCq0Magh9rL0nwP6
	 Be65wcV+qk9DIK4w5Irr5yrgbp568eogKcxNgGYcaU7CFromhzNVvN5lMDHRB29mGdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500416;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=p2F+RfDNPhWftTfLhBG7OD70QcT1Fk45I1VWPQOhOls=;
	b=ZxjyWAnS75Yz9UVby5R0QVJ5SSumV2+8nWREhm70nD3HWkj3TsGY0gUZllCIVOJYgrb0
	 jUA8BpBhgfe7m7GoFSuxZwIvxPJxY21OxvvhaYc0WzOd5pqkVW+gx2bkaxk8AnBn/TVvk
	 exAEBpHGj0HvPOktC4bYSvL16b5+GTELHoXHbf28xbDnoYX9Uv2YCm+QyXAwRyCxkRiyg
	 nrlI/+w/cax/bta/AiUl7aoh6Qyq7WMNyNbhaeEwzvK06DfJKwl8JxwaszWo9vi0w8mhM
	 /n276jNZ8nCtImDx4vdaiaXL2HNzedp8484yoWTRLimozTlvbxf1KSnEcC2UAxmnB3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD487606A32C;
	Tue, 24 Nov 2026 06:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD487606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz1t1795500377t38fe0198
X-QQ-Originating-IP: FPxedCgjIoWh/Vhie3lBkdtXjrMfspCfaCQN/y1kNa0=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 14:06:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10505136690187769570
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
Subject: [PATCH net-next v3 4/5] net: rnpgbe: Allow changing the primary MAC address
Date: Tue, 24 Nov 2026 14:06:13 +0800
Message-ID: <4EBB27E12BC81D8D+20261124060613.411393-1-dong100@mucse.com>
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
X-QQ-XMAILINFO: NRRC+m8+BqHImACg9s4U1ioR3yF8PYPE9iAubFlAuUkWfHfuge0Aa2kZ
	bXqklR2vo7XZn0thloCLWm2TkqacsmDylTYQDenbS1LXu/TWs5mZWSfmQtysj6cJyRW0A3L
	Qdl9BvbTYXSvpZJ45njZHDlfB45lwGrpLcp8z3KcPKEeHBMaGpTuakxrivYYvY6XCg1cPOn
	n43c23xR9iXlNj11pWS+ahUtrUBaPfKqpFezLS1VWGcmHxMfqkBobyTMy6L3Y1AXeAPFBIL
	urp637/+nuy6XpRYi72qeFLWhSMpeIBLHlc3Cx4f716qebjQR4pz5oZa7PDMvC/o9QG70aJ
	vIvgBshyXf69U0sg6lTTuuD/MN3uBffGx/oFDQ4U6xm4jovXZ4OEAi8OHXv6Eg6ZiSY+hoy
	ITi9WDGL+S7qqmAWqtXJcWknwWUPj5hbpbhODLkNub2ZwGJ3m2GlGa/dASolkQAWayAz8xW
	9SRNBGUeJJvaoJR6/QR3SFZ5NjjQmDnogATpDD5PFp2N/Kt9NHEgr/qPS0i6ReEv3h3HYHC
	QF0HYiY7hUpe+DnuM/rqyj5BO2hU15CScCFetN5P7ofIB8zYbeN89R0c2ZIQEJM8xD/9SQF
	XUiOeplU/IxbJqXm1JTdHHnsntqsUtDEqkYhguciWdk2cea/DnxyWCtWzMJ/5ogfWmvFK+O
	Pfm4J1V2uGiEAh8KNmbRNgufuVh35T6ZJqgYN5cIxalZlKhErqy+BgMYp3t3zOCbhaAF0nT
	ixj9//UQxD5z3WfiWVAE5jgBU9ttPm+uJ2+bV9ILP00QQFxsjfUuz2GZPUpz5YOVmMNZ/69
	ZyG50q+VyYm5Bu0Ye6yN4ybdnaquXGs51K1SIZxUvY+xdalm1/L7FjddJ1vEB0iVlYTJZCg
	1Ze1sY2Ll6Bsl8XswYezcikYFkT3zh8uJt72v4/+PLBBa6vXkocRtXoYq4SPyVI77DiB/tv
	BFRUUebSk/iIjCLCYpSShEIToqNANNF8bGHBrnSWrwRB0+hETCfME6lrOHB76R9jwvgKMVW
	W6w2ZpU5kgvbcqTA6aL+Qh1haHRTYgZh8TutIKqLklJtLPXItjznJkad0FE6ZpjP7VtKEhy
	f5N9LuahNO2O8ZIg0RwmAb+KRAXSMssLfkieDwgrH0ttEbv0UsCjr8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Add ndo_set_mac_address support to change the primary MAC address
while the interface is up or down. Validate the new address with the
standard Ethernet helpers, then update the primary receive address
filter and the netdev address.

Also validate the Ethernet address before opening the interface using
eth_validate_addr.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  1 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   | 23 +++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  4 +++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 83267d475257..8574377e3a22 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -269,6 +269,7 @@ int rnpgbe_init_hw(struct mucse_hw *hw, int board_type);
 int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *uc,
 		       struct netdev_hw_addr_list *mc);
+int rnpgbe_set_mac_address(struct net_device *netdev, void *addr);
 void rnpgbe_set_link(struct mucse_hw *hw, bool linkup);
 
 extern const struct ethtool_ops rnpgbe_ethtool_ops;
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
index 3a2f62f0630d..f25cca98878e 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
@@ -238,6 +238,29 @@ static void rnpgbe_clear_rar(struct mucse_hw *hw, u32 index)
 	mucse_hw_wr32(hw, RNPGBE_RX_RAR_LOW(index), 0);
 }
 
+/**
+ * rnpgbe_set_mac_address - Change the interface's primary MAC address
+ * @netdev: network interface
+ * @addr: socket address containing the new MAC address
+ *
+ * Return: 0 on success, negative errno for an invalid address
+ */
+int rnpgbe_set_mac_address(struct net_device *netdev, void *addr)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	struct sockaddr *sa = addr;
+	int err;
+
+	err = eth_prepare_mac_addr_change(netdev, addr);
+	if (err)
+		return err;
+
+	rnpgbe_set_rar(&mucse->hw, 0, sa->sa_data);
+	eth_commit_mac_addr_change(netdev, addr);
+
+	return 0;
+}
+
 int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *uc,
 		       struct netdev_hw_addr_list *mc)
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 31871b244882..09d499dc10ee 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -160,6 +160,8 @@ static const struct net_device_ops rnpgbe_netdev_ops = {
 	.ndo_stop		 = rnpgbe_close,
 	.ndo_start_xmit		 = rnpgbe_xmit_frame,
 	.ndo_set_rx_mode_async = rnpgbe_set_rx_mode,
+	.ndo_set_mac_address	 = rnpgbe_set_mac_address,
+	.ndo_validate_addr	 = eth_validate_addr,
 	.ndo_get_stats64	 = rnpgbe_get_stats64,
 };
 
@@ -253,7 +255,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 
 	netdev->netdev_ops = &rnpgbe_netdev_ops;
 	netdev->ethtool_ops = &rnpgbe_ethtool_ops;
-	netdev->priv_flags |= IFF_UNICAST_FLT;
+	netdev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
 	rnpgbe_sw_init(mucse);
 	err = rnpgbe_reset_hw(hw);
 	if (err) {
-- 
2.50.1

