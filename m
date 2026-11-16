Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863491;
	b=U0jj4B6jgM7KjWUxizi1k3XHR4V+N0QSGJN3+a7uAXNQuOHg4aAbeoEZwSEyBUoqrinS
	 DOczOHhvBTGhxqBOMuqzZtlqI5426hKD6i5wMQZl3bAxZc3Xyjw9QjhapjwRJOPMfd/b7
	 n+dRQufn7ThQNjaL1l+V3oTxBQMRSHxdlNZhsOg9Y1pou0xi2iAnWsMKF0f+ny7HsU8VJ
	 G03eqvBhl3s0hUeTSBnS/fUHcXJrGY4HKXCTfv651uW8pKm/oc6K8/Cd9DeJ81g/yeu0L
	 gaefpL7uQXPOq62a2pN2Iu6RDBT78qAqm29bwrX02FHhA58bB9RwWT/6KKWY7ffrYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
	b=LEpsZrEIpP59k3Vmauin0nIvjzGkHotMQEDzj5fL6ErRfG91muWbeaU2Mgu3LMZISLEv
	 EdVLTudLHzHVaWIAoYswXcirqoxyNQ8tJWFC7jQlhVc8A3IlGg7SH0afQCnViHeHu96gq
	 o6KwulkPS40yR0dNWONeIdUazaYTW+NFV3PRHLgD/x9oD/f23bOng5Xj4ddSYWJAvK2He
	 TuQAWjJkf3ISnrsHw4akR21vxOyCKQeEIylU1XJp3PM9ymzQxS2O0k7CG3pIuxi5BHXP6
	 cPW+x1fA1tX97V+L/k0jE+K9OBMBHN4CyhkPSUcPcGV6Mbw8knMD92D7VPeC17CVzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH7jMt1b;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B6606A895
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B6606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH7jMt1b
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3927760d50.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863490; x=1795468290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
        b=WH7jMt1bPFZVCeRRjIX5Il0nBOKog9UGD1qDR2Quf1mbzlN6NNK/2zwQi+UsTBhoUT
         hVF/4jlLPElfHMc51sPneNlkQ0HPn/wvoRG6g5Tm/KlCljq06FEhxkli6gcUDUeyWigW
         vffseN85eCMhY517KPB3jY0r+SJNGl7kculkQOMqp/VYgwWsBR45/qZoGjBt4OauPqAL
         YmXICyFXYmHH9CtSylptaAwMxmRIp2oXfKWiIv+K8LpTZLvDnoYvdszZpli/+Bgu+EMF
         gZfsqet4s+obHx7vdMg+RK3z1OcOg25P5VGV1KFqZ2M+N+zuUrqKQbpqYuZHZsMDMOHM
         J5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863490; x=1795468290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
        b=QRcqjQvuCUN0YhQUElpXJttXI218bYelt8fRgasa6u/jKsgmlOL+TIZLW2HvWD/i6L
         bMoB3eKn79+OeINF7GQAzT5/u1g5ccs+tuHutt1SjPxczOtRpsjEmFTX2bbfpcqtswX4
         U5pmBE1qLJLU7XSbLo9GtRYhFJpZXPgGdbfQCdfefhGTG57DH4OBs/Xe28l8nPfRu3Su
         XILPkH55koIwLQ1FG3Ob73lIbYPyKUDiWxoJTgBrzHBRW+wCUiYixRiXRz+5/DTIOvQG
         U8sWSL7yRX98KOWq6CrcXRETorJaUszrPzGFOtzLbH8UajOKxzaw44vmEJduk1mZj4Wv
         2cAw==
X-Forwarded-Encrypted: i=1; AL+hErGVSVIt9TAJCdJiTXwPVE4thUb1MXq16bQtxvyES+IpUotU/bo3996QgWkrHHYTWtFTVWJ+u08=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M4QX6SyE1p7Q6MVRanxuQrUcE3cVVr0PMgu8eOC+1x8X0rAfe
	hnrwL4Hu+N/nMhgvtsQNGDsTBE+7bjdDn7AI/oqQRHP7sA2xQZ/jgmpS
X-Gm-Gg: AZFdTZdAnYp30EjUjYaQSzuXmN6XiOLvxcgRIrVmYPEl5ISkyWcUOViLBgIy/Ftr4Qv
	6yjXRmVDnoSXB4jQu8pTUPK9LrYtLHm2xpZA3pn7CPZrNi5iiPXYqsIJdJAABYLchxrP3QvPTeh
	SiPieyKmRu2bpgiHoiEoh3OAZMrFgyWYCW+Eu7WCXKzvEYusuYWkOqtj/Z7KTcRUXBna3Suq+mL
	izm8EIX+S6pI2O205Y7E5EItAusZUxRlkImA7oEkHoP3Y90C3YjCwrYClI7Lsyf6Cw9vtrMaodj
	M4aMh65slO8FqYIAJ9Axxi1OkCzgyMRMg9NCTILPPxtapRt9a7PhNpQsafeMCZeLKpIKcGF+Lel
	P6gbHMGc0QjpBtYPwNPjtLnZ5H3pPrGueesg/DGJo4vpikPUAJeDPy6diwrJVp30xRy354adXsW
	28uHvztG906pn1IOHPv6/mejMxDxD9dX4G4iXXLhfCerM41XfFQmQsU72QlnT8q2hnCFK226prE
	zCq3IKb/H3PH5JuyCtNQ/B733pXOUevmJJ2cT6LrKTs76PNJnjK0r3a4H4TA/we3a1mDk+FWzV9
	pt7WLTyHh2wegjXYuULavKI9/Q==
X-Received: by 2002:a05:690c:6d82:b0:8b4:c3e4:9c4f with SMTP id 00721157ae682-8b4c3e4b54amr27268797b3.30.1794863490019;
        Mon, 16 Nov 2026 13:11:30 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm8698197b3.41.2026.11.16.13.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:29 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:21 -0800
Subject: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast
 address lists
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
Message-Id: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Add the secondary unicast and multicast addresses to the MACDA TCAM.
Advertise IFF_UNICAST_FLT so we don't need to use promiscuous mode to
handle extra unicast addresses.

When the unicast or multicast list outgrows the table, fall back to
promiscuous or all-multicast mode respectively.

Track the number of users of a HW filter, because the same address can
be used in the dev->uc and dev->mc lists.

Allow a filter slot pending deletion to be reused during
mpnic_macda_sync(). Document this transition in the state machine
comment.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 38 ++++++++++++++--
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 60 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  5 +++
 3 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 43547a7d6e5c..c01e276c4a74 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -12,12 +12,30 @@
 #include "mpnic_netdev.h"
 #include "mpnic_txrx.h"
 
+static int mpnic_addr_sync(struct net_device *netdev,
+			   const unsigned char *addr)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+
+	return mpnic_macda_sync(mpn->mpd, addr);
+}
+
+static int mpnic_addr_unsync(struct net_device *netdev,
+			     const unsigned char *addr)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+
+	return mpnic_macda_unsync(mpn->mpd, addr);
+}
+
 static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
+				struct netdev_hw_addr_list *uc,
 				struct netdev_hw_addr_list *mc)
 {
 	bool uc_promisc = false, mc_promisc = false;
 	struct net_device *netdev = mpd->netdev;
 	struct mpnic_mac_addr *mac_addr;
+	int err;
 
 	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX];
 	if (!ether_addr_equal(mac_addr->value, netdev->dev_addr) ||
@@ -35,7 +53,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
 		mac_addr->state = MPNIC_TCAM_S_ADD;
 	}
 
-	if (!netdev_hw_addr_list_empty(mc))
+	err = __hw_addr_sync_dev(uc, netdev, mpnic_addr_sync,
+				 mpnic_addr_unsync);
+	if (err == -ENOSPC)
+		uc_promisc = true;
+
+	err = __hw_addr_sync_dev(mc, netdev, mpnic_addr_sync,
+				 mpnic_addr_unsync);
+	if (err == -ENOSPC)
 		mc_promisc = true;
 
 	uc_promisc |= netdev->flags & IFF_PROMISC;
@@ -53,7 +78,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	struct mpnic_net *mpn = netdev_priv(netdev);
 
 	if (netif_running(netdev))
-		__mpnic_set_rx_mode(mpn->mpd, mc);
+		__mpnic_set_rx_mode(mpn->mpd, uc, mc);
 
 	return 0;
 }
@@ -61,6 +86,12 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 {
 	struct mpnic_mac_addr *mac_addr = mpd->mac_addr;
+	struct net_device *netdev = mpd->netdev;
+
+	netif_addr_lock_bh(netdev);
+	__dev_uc_unsync(netdev, mpnic_addr_unsync);
+	__dev_mc_unsync(netdev, mpnic_addr_unsync);
+	netif_addr_unlock_bh(netdev);
 
 	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
 	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
@@ -92,7 +123,7 @@ static int mpnic_open(struct net_device *netdev)
 	mpnic_fill(mpn);
 
 	netif_addr_lock_bh(netdev);
-	__mpnic_set_rx_mode(mpn->mpd, &netdev->mc);
+	__mpnic_set_rx_mode(mpn->mpd, &netdev->uc, &netdev->mc);
 	netif_addr_unlock_bh(netdev);
 
 	mpnic_napi_enable(mpn);
@@ -366,6 +397,7 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 	netdev->netdev_ops = &mpnic_netdev_ops;
 	netdev->stat_ops = &mpnic_stat_ops;
 	netdev->request_ops_lock = true;
+	netdev->priv_flags |= IFF_UNICAST_FLT;
 
 	mpn = netdev_priv(netdev);
 	mpn->netdev = netdev;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
index ebbccf8ec723..509a63c271cd 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
@@ -7,6 +7,66 @@
 #include "mpnic.h"
 #include "mpnic_rpc.h"
 
+static bool mpnic_macda_free(struct mpnic_mac_addr *mac_addr)
+{
+	return mac_addr->state == MPNIC_TCAM_S_DISABLED ||
+	       mac_addr->state == MPNIC_TCAM_S_DELETE;
+}
+
+int mpnic_macda_sync(struct mpnic_dev *mpd, const u8 *addr)
+{
+	struct mpnic_mac_addr *avail_addr = NULL;
+	unsigned int i;
+
+	for (i = MPNIC_TCAM_MACDA_BROADCAST_IDX + 1;
+	     i < MPNIC_TCAM_MACDA_HOST_ADDR_IDX; i++) {
+		struct mpnic_mac_addr *mac_addr = &mpd->mac_addr[i];
+
+		if (mac_addr->state != MPNIC_TCAM_S_DISABLED &&
+		    ether_addr_equal(mac_addr->value, addr)) {
+			avail_addr = mac_addr;
+			break;
+		}
+
+		if (!avail_addr && mpnic_macda_free(mac_addr))
+			avail_addr = mac_addr;
+	}
+
+	if (!avail_addr)
+		return -ENOSPC;
+
+	if (mpnic_macda_free(avail_addr)) {
+		ether_addr_copy(avail_addr->value, addr);
+		eth_broadcast_addr(avail_addr->mask);
+		avail_addr->state = MPNIC_TCAM_S_ADD;
+	}
+
+	avail_addr->users++;
+
+	return 0;
+}
+
+int mpnic_macda_unsync(struct mpnic_dev *mpd, const u8 *addr)
+{
+	unsigned int i;
+
+	for (i = MPNIC_TCAM_MACDA_BROADCAST_IDX + 1;
+	     i < MPNIC_TCAM_MACDA_HOST_ADDR_IDX; i++) {
+		struct mpnic_mac_addr *mac_addr = &mpd->mac_addr[i];
+
+		if (mpnic_macda_free(mac_addr) ||
+		    !ether_addr_equal(mac_addr->value, addr))
+			continue;
+
+		if (!--mac_addr->users)
+			mac_addr->state = MPNIC_TCAM_S_DELETE;
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
 void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
 			bool mc_promisc)
 {
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
index 0eec09df7642..8ed507daaf6f 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
@@ -21,6 +21,8 @@ struct mpnic_dev;
  *
  *  Valid     1	-> Delete     3
  *  Delete    3	-> Disabled   0
+ *
+ *  Delete    3	-> Add	      2
  */
 enum {
 	MPNIC_TCAM_S_DISABLED	= 0,
@@ -37,8 +39,11 @@ struct mpnic_mac_addr {
 	u8 mask[ETH_ALEN];
 	u8 value[ETH_ALEN];
 	u8 state;
+	u8 users;
 } __aligned(2);
 
+int mpnic_macda_sync(struct mpnic_dev *mpd, const u8 *addr);
+int mpnic_macda_unsync(struct mpnic_dev *mpd, const u8 *addr);
 void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
 			bool mc_promisc);
 void mpnic_write_macda(struct mpnic_dev *mpd);

-- 
2.52.1

