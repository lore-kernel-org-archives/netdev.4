Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863490;
	b=IRLPW57labb3C8SGcRaqPnCR8CmdSw/rmGpOOuglZbJSk1ErcHhbIFrTMbLgT1flFZ+1
	 7tqXVte0iYvTs7vw2wEwizTemfE+pq2MJ6CqVS3nrI42gLJjMhvzCR3lRUJovDHBZApvZ
	 WMooH9gAFP6tYlsP/6IR8D7pHdpJiVMLZFcqbPBAC0C8frPFVVmXPK/0QmMJFSC6NRPF4
	 uRs1oKpFXHCnqx3pVwH+vGvPoWNDVX+MavpMEQkD1W5BhPXP7R81V8wStG4OE9Re3qs1H
	 Tgr80yCKIFl+Yu03qo0cy3f5Cson0q2knyoRwKRbdjgrn+mS+ir/M0YaKK5zpzwr8mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
	b=JA2am9M+Jom/Rabb4b8Fp0JPTIkKVCrIeuLTpw2MyY4i5tQ4qs8FJ67tcRFqpNbJcUri
	 AwuJZynk3zhjg2ijxINGHdX3lc2UpKok554OVR3r77ovcx7ZNPyvgUG2SnD74EvklpuQZ
	 vy16mrXseW4TCpxlgXuLWPEtZBpSK0RpgqA5pnco5YOtXGCwt4ANDjFdekMoS5RDItq5J
	 Og9hSfC86RjvUrpZvZOEnQwVCPo1xOCATvpAdTWvdXP+Nsi9sCt8B43clTGHJ9qpqsSjr
	 wcjHmGhBvvIKHJsfmbByOE7R+FmVLIej8WEg71Mzx9u4ewZeNfmI+kew/1FFdmscG6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwiJRvNe;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0286606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0286606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwiJRvNe
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67921b515a7so4116127d50.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863488; x=1795468288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
        b=kwiJRvNev4471ye1RW9FpIzr3l1WG//BGK063QqcoHv/okw8i+7Ux0RBQKdyxzsqD2
         15geBwdHn+pcgMOdb0O7mhywiWEWLxZKtCiR9VYpcf5YyfDZqJncDmpc0kyzJY8Lohok
         VDKjzSzfZTKdHTQAp7q1Xu4CUyEd22q7/Hl83CqdsOR48JsT4rN25EIYS1Ew0rd2ci9f
         JQdbrZ26kKyYRs30JzV8EwSu8vtekzMFzc7CEeR4O5qRkh4skBQVcIOA6Sigi5D3pR7S
         gzIov3vKf2SDRKuwHApz0B5e4yJiiL5fSg6KtHY9Tdk3dJ3V8DBcc5H+xPz0795pLE87
         q/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863488; x=1795468288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
        b=Hwtwg4TtEX/Nj78/Li1eGb3EKtVY3BMPMEf2wGqf98jSpAc+hlsbFFZDfK8mE9lJjx
         w2tfQa55SoKWjDqIR/HgHmFSrD2zuJG7NwmF4ta06NJk+qVjt5AjwYVcdmg+Cly/X0/S
         eR3ajjMT1BuG35LIyPTflYZKdctaWHMrET1ojWkhrYrmZ01McgEfM8no6qu1o8xJCfzH
         wsa5kGSbDb2IV/ZVscoTwwGrzzdT0/PMwZJOk6zlGOZh76BmXGamxh19zGXpuRTZekbY
         2SB1x8D2wlQUZ/+Zp70H3J5Xa8EYRqrElMnCH6RFxF6k/WXnQbCpZpLIm7cMXv45+8gb
         8P+w==
X-Forwarded-Encrypted: i=1; AL+hErF6vUKkzVYdZ/3Zje3gic5b+dVc/xYStksJjWM8f9chBkc8e3poElMrP7Vx8Y5+ZszpdTJiKLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dIz5BA5KH511rJl9I3vcYDCFVMKG5/oR50p6kgdph6nk+yU6L
	HOzWHVBr5FKl6hxyNAc8XScp0mPyI/rLmVEFzpx28A6L8ewbMbJBiscN
X-Gm-Gg: AZFdTZfhdugkhwe8KMDpKDkv0O41lBOMQtk55S0o829Al9nNIMV8CGKQWyVIZOhrbz6
	k9ZQomccndZPpcDq3hUvAuuW2BduWC2il5UqPyEkBA/gZPv1/Wks8kJs7SiUJHQzlCfDwIJJ4bb
	5Z9xlzP7CW30GenCp2BM0bjzKddh9pYtmmDkwAvZZgBOXIzFsVHY4+9m5J9GnSLzzzcXLKHAy8n
	rI0ViOjiMqy+i695wTSynuoQg/gyBvJvFyxReyfMWcoyHAqJwerFCd+wzM+v+pQmZpdoqHUjNw9
	PFuOfy3roveB1hmsHRWMdlqjnROv7OfBpz4I0UOoi4RkxKemXT1SO16v9nGkrIluM7TOxhAprfs
	4OWRMTt8PR8TOEaXy+gK5+Kjy8VwPLHGqdE8D/WZ7pRLXmCbk7SmbNsPZF1qtRdLtJBXLplgB/+
	iRc5pmoAkMrzonG5h5NjwkbgWqfUGmA+oa8SEmWwVx3b50jwIm8Ltrcv5MIxyo4gwrnAqtxPH9F
	vF9cvFSWA4TsfYHk3SaYDYJ0td4jP4WIi3LGZjtgpGxwBiAY8GfLnuyWZrKMTdtuHy2h96DJmnt
	c/B3khiAUWWxiDJN4Hn5euo/g2QcnTknJwAwZXkGOofbYKTP
X-Received: by 2002:a05:690e:150b:b0:679:afc8:9d2a with SMTP id 956f58d0204a3-67d896ab292mr5836269d50.54.1794863487763;
        Mon, 16 Nov 2026 13:11:27 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5b3b62sm10848957d50.13.2026.11.16.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:27 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:20 -0800
Subject: [PATCH net-next 2/4] eth: mpnic: add promiscuous and all-multicast
 filters
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
Message-Id: <20261116-mpnic-l2-oot-v1-2-8dc6eb3582b0@gmail.com>
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

Implement IFF_PROMISC and IFF_ALLMULTI with the last TCAM entry, which
matches either every address or only the multicast bit.

Change the default action on TCAM misses to drop frames. With the
device, broadcast and promiscuous entries in place, frames that miss the
TCAM can be dropped instead of delivered to the stack to drop.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  5 +----
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 21 +++++++++++++++++---
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 27 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  3 +++
 4 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
index 889555eb4790..0c2878c18c54 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
@@ -199,12 +199,9 @@ static void mpnic_txb_init(struct mpnic_dev *mpd)
 
 static void mpnic_rxb_init(struct mpnic_dev *mpd)
 {
-	/* Accept all packets that miss dmac tcam, until l2 filtering is
-	 * implemented.
-	 */
 	mpnic_wr64(mpd, MPNIC_RXB_PORT_CLASS_CFG(0),
 		   FIELD_PREP(MPNIC_RXB_PORT_CLASS_CFG_DEFAULT_L2_ACTION,
-			      MPNIC_L2_ACTION_PASS));
+			      MPNIC_L2_ACTION_DROP));
 	mpnic_wr64(mpd, MPNIC_RXB_PORT_CFG(0),
 		   FIELD_PREP(MPNIC_RXB_PORT_CFG_FCS_STRIP_MODE,
 			      MPNIC_FCS_MODE_STRIP));
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 16611813db55..43547a7d6e5c 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -12,8 +12,10 @@
 #include "mpnic_netdev.h"
 #include "mpnic_txrx.h"
 
-static void __mpnic_set_rx_mode(struct mpnic_dev *mpd)
+static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
+				struct netdev_hw_addr_list *mc)
 {
+	bool uc_promisc = false, mc_promisc = false;
 	struct net_device *netdev = mpd->netdev;
 	struct mpnic_mac_addr *mac_addr;
 
@@ -33,6 +35,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd)
 		mac_addr->state = MPNIC_TCAM_S_ADD;
 	}
 
+	if (!netdev_hw_addr_list_empty(mc))
+		mc_promisc = true;
+
+	uc_promisc |= netdev->flags & IFF_PROMISC;
+	mc_promisc |= netdev->flags & IFF_ALLMULTI;
+
+	mpnic_promisc_sync(mpd, uc_promisc, mc_promisc);
+
 	mpnic_write_macda(mpd);
 }
 
@@ -43,7 +53,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	struct mpnic_net *mpn = netdev_priv(netdev);
 
 	if (netif_running(netdev))
-		__mpnic_set_rx_mode(mpn->mpd);
+		__mpnic_set_rx_mode(mpn->mpd, mc);
 
 	return 0;
 }
@@ -54,6 +64,7 @@ static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 
 	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
 	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
+	mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX].state = MPNIC_TCAM_S_DELETE;
 
 	mpnic_write_macda(mpd);
 }
@@ -79,7 +90,11 @@ static int mpnic_open(struct net_device *netdev)
 
 	mpnic_enable(mpn);
 	mpnic_fill(mpn);
-	__mpnic_set_rx_mode(mpn->mpd);
+
+	netif_addr_lock_bh(netdev);
+	__mpnic_set_rx_mode(mpn->mpd, &netdev->mc);
+	netif_addr_unlock_bh(netdev);
+
 	mpnic_napi_enable(mpn);
 
 	netif_tx_wake_all_queues(netdev);
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
index c96aec4de3e4..ebbccf8ec723 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
@@ -7,6 +7,33 @@
 #include "mpnic.h"
 #include "mpnic_rpc.h"
 
+void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
+			bool mc_promisc)
+{
+	struct mpnic_mac_addr *mac_addr;
+
+	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX];
+	if (uc_promisc) {
+		if (!is_zero_ether_addr(mac_addr->value) ||
+		    mac_addr->state != MPNIC_TCAM_S_VALID) {
+			eth_zero_addr(mac_addr->value);
+			eth_zero_addr(mac_addr->mask);
+			mac_addr->state = MPNIC_TCAM_S_ADD;
+		}
+	} else if (mc_promisc) {
+		if (!is_multicast_ether_addr(mac_addr->value) ||
+		    mac_addr->state != MPNIC_TCAM_S_VALID) {
+			eth_zero_addr(mac_addr->value);
+			eth_zero_addr(mac_addr->mask);
+			mac_addr->value[0] ^= 1;
+			mac_addr->mask[0] ^= 1;
+			mac_addr->state = MPNIC_TCAM_S_ADD;
+		}
+	} else if (mac_addr->state == MPNIC_TCAM_S_VALID) {
+		mac_addr->state = MPNIC_TCAM_S_DELETE;
+	}
+}
+
 static void mpnic_write_macda_entry(struct mpnic_dev *mpd, unsigned int idx,
 				    struct mpnic_mac_addr *mac_addr)
 {
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
index f6e4f60180d6..0eec09df7642 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
@@ -31,6 +31,7 @@ enum {
 
 #define MPNIC_TCAM_MACDA_BROADCAST_IDX	0
 #define MPNIC_TCAM_MACDA_HOST_ADDR_IDX	(MPNIC_RXB_DMAC_TCAM_CNT - 2)
+#define MPNIC_TCAM_MACDA_PROMISC_IDX	(MPNIC_RXB_DMAC_TCAM_CNT - 1)
 
 struct mpnic_mac_addr {
 	u8 mask[ETH_ALEN];
@@ -38,6 +39,8 @@ struct mpnic_mac_addr {
 	u8 state;
 } __aligned(2);
 
+void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
+			bool mc_promisc);
 void mpnic_write_macda(struct mpnic_dev *mpd);
 
 #endif /* _MPNIC_RPC_H_ */

-- 
2.52.1

