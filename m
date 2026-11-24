Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489798;
	b=GKBq3xmIsmW5F0UCFxcl1H/P+5bch54eMEzLC4D5LJYP2DGi+ZFlKXb+r67z5VIAKsDo
	 HvNI6fdFihXwQtY0evjb79S3eKhYrKgE3gyX71kKj/+K81P2+k8pLCvajIwTwFSrmqEwb
	 qLK8u5C7AMSMKMsXZExoM5NGxgiRZNVgh6NYLWo4o2p+lr/leG7y/q87jqtaDKGcg65rG
	 Q3usQ5EypGYlCILVQERm4uP+RU/AUuT1sunIeAbRuFdf043nq413mF9NYakWaQPxgOaqa
	 rqmK49fTUv+CnBz5V4L0aMwFShItvv4FqGBeZivRVrzn+z07LpDJN7KiZXB85akehxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489798;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=iaxJ2sd7BQERA/spM7MAzW69k655Z4/XP+sxG79D8DU=;
	b=1R+/pmhV7skr7qHj0dm6rYg+Z9A65mTkSS/1iWT2+vTacFtA6JQsVnhpC9NAfD57yLVH
	 LcEAXbSTzP1OdOpSpWs7t9y1oWd54Ah3Gc8kYOV50clLPukNhKt4x4P7bFy+U2sXQFA0A
	 IIdlm3wbwUwfjJRs5BXl7lBLZWfpKct2JWsZLGR186UEDLK4GUwNdDKrRHnM6QF3+p8ac
	 fCTOPq+3fHV61k+l6ywa6H2n9vjBfzcWHR+cq+2ApWjjnfKZFyV0gijYtanLPWs+1/pRB
	 mZSLA1EW2ULleWNTj4+SuYmx5hzjTDfU0YstbrapbDZCSw38E8PCVp6RWy7OgzoWJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=muHKCS2o;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC0606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CC0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=muHKCS2o
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iaxJ2sd7BQERA/spM7MAzW69k655Z4/XP+sxG79D8DU=;
	b=muHKCS2o3PvqxoHTMW98Bn9XZoDi3B4VOn4dyMnxhDvowpYZs1X/+1T/xoFg6AmQ3FpdG+C6Q
	QvgCS61StU+s4UY9XON1Eomj6w47Lhpt5NCYKS9WCDIrrX2vhWw1joK/IOodZeyPkVBkw5Iqinl
	YN4iGRaD213webN4IMFVZVc=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jYSTW3y0dzKmVC;
	Tue, 24 Nov 2026 11:09:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 765554057C;
	Tue, 24 Nov 2026 11:09:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 11:09:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <cai.huoqing@linux.dev>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net v2 1/2] net: hinic: Don't fail probe when firmware lacks rx-vlan-filter
Date: Tue, 24 Nov 2026 11:09:45 +0800
Message-ID: <20261124030946.1229396-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124030946.1229396-1-ruanjinjie@huawei.com>
References: <20261124030946.1229396-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

nic_dev_init() calls set_features() with force_change set, so it
unconditionally sends HINIC_PORT_CMD_SET_VLAN_FILTER because
NETIF_F_HW_VLAN_CTAG_FILTER is advertised.  Firmware that predates
rx-vlan-filter support answers with HINIC_MGMT_CMD_UNSUPPORTED (0xff).

set_features() treats that as fatal: it folds it into err and returns
-EIO, so nic_dev_init() bails out and the only visible symptom is

	hinic 0000:29:00.0: Failed to initialize NIC device
	hinic 0000:29:00.0: probe with driver hinic failed with error -5

although nothing is actually broken.  The bit is not in hw_features
either, so ethtool cannot turn it off.

Keep the feature advertised and let the probe succeed.

Also make hinic_set_vlan_fliter() trust the reply status only once the
command has been delivered and a full reply has come back.  On a send
error or a timeout nothing is written to buf_out, so the status read back
is stale stack contents, and a stray 0xff would now be mistaken for
"firmware does not support this" instead of failing the probe.

Fixes: 2acf960e3be6 ("net: hinic: Add support for configuration of rx-vlan-filter by ethtool")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../net/ethernet/huawei/hinic/hinic_main.c    |  5 +++-
 .../net/ethernet/huawei/hinic/hinic_port.c    | 28 +++++++++++--------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_main.c b/drivers/net/ethernet/huawei/hinic/hinic_main.c
index 34ed5ea9e46e..3c5d5c7de307 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_main.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_main.c
@@ -1098,9 +1098,12 @@ static int set_features(struct hinic_dev *nic_dev,
 		ret = hinic_set_vlan_fliter(nic_dev,
 					    !!(features &
 					       NETIF_F_HW_VLAN_CTAG_FILTER));
-		if (ret) {
+		if (ret && ret != HINIC_MGMT_CMD_UNSUPPORTED) {
 			err = ret;
 			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+		} else if (ret) {
+			dev_info(&nic_dev->hwdev->hwif->pdev->dev,
+				 "Firmware does not support rx-vlan-filter, feature left enabled\n");
 		}
 	}
 
diff --git a/drivers/net/ethernet/huawei/hinic/hinic_port.c b/drivers/net/ethernet/huawei/hinic/hinic_port.c
index 7bb6eb2a8917..ad271d7aa52b 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_port.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_port.c
@@ -462,19 +462,25 @@ int hinic_set_vlan_fliter(struct hinic_dev *nic_dev, u32 en)
 	err = hinic_port_msg_cmd(hwdev, HINIC_PORT_CMD_SET_VLAN_FILTER,
 				 &vlan_filter, sizeof(vlan_filter),
 				 &vlan_filter, &out_size);
-	if (vlan_filter.status == HINIC_MGMT_CMD_UNSUPPORTED) {
-		err = HINIC_MGMT_CMD_UNSUPPORTED;
-	} else if ((err == HINIC_MBOX_VF_CMD_ERROR) &&
-			   HINIC_IS_VF(hwif)) {
-		err = HINIC_MGMT_CMD_UNSUPPORTED;
-	} else if (err || !out_size || vlan_filter.status) {
-		dev_err(&pdev->dev,
-			"Failed to set vlan filter, err: %d, status: 0x%x, out size: 0x%x\n",
-			err, vlan_filter.status, out_size);
-		err = -EINVAL;
+	if (err == HINIC_MBOX_VF_CMD_ERROR && HINIC_IS_VF(hwif))
+		return HINIC_MGMT_CMD_UNSUPPORTED;
+
+	if (err || !out_size) {
+		dev_err(&pdev->dev, "Failed to set vlan filter, err: %d, out size: 0x%x\n",
+			err, out_size);
+		return -EINVAL;
 	}
 
-	return err;
+	if (vlan_filter.status == HINIC_MGMT_CMD_UNSUPPORTED)
+		return HINIC_MGMT_CMD_UNSUPPORTED;
+
+	if (vlan_filter.status) {
+		dev_err(&pdev->dev, "Failed to set vlan filter, status: 0x%x\n",
+			vlan_filter.status);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 int hinic_set_max_qnum(struct hinic_dev *nic_dev, u8 num_rqs)
-- 
2.34.1

