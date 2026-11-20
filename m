Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153806;
	b=U/UlzT+HpP3BIHDlkltNKgR634NmVDUrDB6atBPV9lpqrgt1wgF0S+9c1gaWecXUFa+i
	 bdk3m3w9t6L1Vvy0B4pLrqjoEeai5/pgKsnKqdHHa7h1GqhAJZR5t+OrPuLeoK8PQJgkb
	 B2CyTLefKYXCm33AkTc+xPvdglTuXdMSN3F8BTeyT/2xeIsU0MkyYIp4cHeNOLHVaEHHK
	 TY3+fvvbU8kmwECEC+0on/YPaaJ6IjN3mC298R1Jq9ja/0gnWRLlRzBhNhBK+YGB2xpEN
	 b+GHob7reUfQe3jQgh7H5ZNueAEjxa/67lNNfiDBmzHJHaW/aFKK6d6hkLEh2ZDku3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
	b=h9YOfyIRDoNvogKN5gotuu5X1GdzdD0+KrCdCngoyLj7xFkvGGDrBtXRW4mt8BCcWlmX
	 975Gj7h3IoF6uytNJ0tmAWVpuVrmz5QiaTVxDIhXiI1o0EYJ8mfC4LVfbbZVg7R/ENG0h
	 Qgc/gaJcAZqscNM5YgMNnr0n/KnFcAgXuqhlzEWWMn3Uq+u+SgiTRfGFtmUUqyBnX+2ag
	 V9/9r5rl7h8iV7o1DlXpJoXg+xk4YzE2O36173almGOtDTBNOsShLuMziUQxu11iiw6CM
	 FNPN440URchxa8K+bCMCchkcGoeQwuyt7usS2AvErABznvWXFQ1P3ZNFf/7VpDRUuaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R1uP9cRg;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E12606A334
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E12606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R1uP9cRg
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso629841c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153806; x=1795758606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
        b=R1uP9cRgXlEaSRch68spkO6BQvqorGrXgTeM7ftZ+/qvEH00fPwIpy1qx7LnRTgIJx
         mnGtOLH9gYcL5CxySvPf4TNH7ieK3STsduUd5KGRbCHvZfmJM2YL3PQ9Rlia9ln7bH6x
         p91N9FnmWzYk6ipPyqo8uglwTtULNKcEPVjuBB728mltxGWSrcJw5dJmeEFWC6L/tNDv
         q0kxul3/9ooWtKxXQRtNKY2oF5+AHy/ZSMGvU/7RU4n5qMbf6nIuG/a1UlbObo7tFgVk
         RjGDOY0OLERXbXHCUVgvvWykoM1Z/GrNDQW+ZfoGRX0a5bLx4n9Ljs13rX1FknaspQ7x
         7UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153806; x=1795758606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
        b=nEPVk6POhZLqF6cneWdmqes/kLbiSGYuVaw8Tgnd3CENaFiyorDaX6q1m11fuFuRIi
         svDmATkf2Zjb4DXm5c40l+NKjCXrnzch6pIofMlSVL7bR9Sx5PqpqoekayGJv76BSLEF
         r12j1KtNJcGHvbCoKMcV6XqjaMFafZOt5U4R+LROf2dpO5JIW6xlP9K0Q3kgny4AaKqE
         fDA8QozTkoqU/ey382s0j0drhllU2UheFw5Q1F9KS7jXVrKPikZJ2oeZ1EULwXHT/9bb
         hwmKGZaI259s/uaL9CksbqAjnQ/MUZ9F8T/4aHfK2jfVqlVuD4XtrjAzvJJWuBYEdi4z
         1nxA==
X-Gm-Message-State: APuU4Z9b9KYHMKcU63YVQP9CtGVrF/7qcU2FNNaXXR8pjLLTHuMWVyxM
	pjQ+MqtH8hjyPchNeN/Dm9HEYm0pKBpD0KkkmDX8u33bpRjMmBZSNMedcF+HLpYDYic00LYmwCK
	i9HE311O2y41th2qYU5cOgQFdBiiuu1xV6iUPDC/OnwnVNcytx9oC8LRTFXLA2dwVIdFvbULozD
	+DoNwrZfWWlkrbvnjcv4NkTrkqqiIqTMwmBOL0K7Dwv1cRg5pgkK7mJfByf9oib7Y=
X-Received: from dleg6-n1.prod.google.com ([2002:a05:701b:4306:10b0:19d:e7f1:171c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea8d:b0:1b2:373c:997 with SMTP id a92af1059eb24-1b5568f3c7bmr1740253c88.25.1795153804911;
 Thu, 19 Nov 2026 21:50:04 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:17 +0000
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120045918.1239746-7-almasrymina@google.com>
Subject: [PATCH net-next v4 6/7] net: devmem: resolve physical map_dev for
 leased RX bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
virtual netdev in binding->map_dev without tracking the physical backing
netdev at all. When the physical backing netdev unregistered while a
leased RX binding was active, net_devmem_dev_unregister() did not match
the physical netdev and mp_dmabuf_devmem_uninstall() on the virtual
queue skipped unmapping because rxq->lease was set, leaving the dmabuf
attachment mapped against the freed physical dma_dev until
__net_devmem_dmabuf_binding_free() triggered a use-after-free in
dma_unmap_sg_attrs().

Return the physical backing net_device from netdev_nl_get_dma_dev() when
the RX queue is leased from another netdev, lock map_dev around
net_devmem_bind_dmabuf() when map_dev != netdev (matching
netdev_nl_bind_tx_doit()), assert in net_devmem_bind_dmabuf() that both
bind_dev and map_dev are locked, and reject binding when
!netif_lease_valid(map_dev).

Now that binding->map_dev always points to the physical DMA device for
both RX and TX bindings (never a queue leasee), drop the
!netif_is_queue_leasee(dev) guard in net_devmem_dev_unregister().

This issue was discovered during AI code review (Sashiko) of the earlier
non-leased devmem unregister series and confirmed by code inspection
(not observed in production or reproduced on real hardware). Tested with
the nl_netdev.py selftest on netdevsim added in this series.

Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 11 +++++++++--
 net/core/netdev-genl.c | 19 ++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 80c3e149cd762..84bb7cebe9a39 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -284,8 +284,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 			continue;
 
 		xa_unlock(&net_devmem_dmabuf_bindings);
-		if (!netif_is_queue_leasee(dev))
-			net_devmem_dmabuf_binding_unmap(binding);
+		net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
 		WRITE_ONCE(binding->map_dev, NULL);
 	}
@@ -354,6 +353,14 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	size_t i;
 	long err;
 
+	netdev_assert_locked(bind_dev);
+	netdev_assert_locked(map_dev);
+
+	if (!netif_lease_valid(map_dev)) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return ERR_PTR(-ENODEV);
+	}
+
 	if (!dma_dev) {
 		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
 		return ERR_PTR(-EOPNOTSUPP);
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index c2b8ec0058a34..74e3f3d89ab4b 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1005,12 +1005,15 @@ static int netdev_nl_read_rxq_bitmap(struct genl_info *info,
 
 static struct device *
 netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
+		      struct net_device **map_dev,
 		      struct netlink_ext_ack *extack)
 {
 	struct device *dma_dev = NULL;
 	u32 rxq_idx, prev_rxq_idx;
 
+	*map_dev = netdev;
 	for_each_set_bit(rxq_idx, rxq_bitmap, netdev->real_num_rx_queues) {
+		struct netdev_rx_queue *rxq;
 		struct device *rxq_dma_dev;
 
 		rxq_dma_dev = netdev_queue_get_dma_dev(netdev, rxq_idx,
@@ -1023,6 +1026,11 @@ netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
 
 		dma_dev = rxq_dma_dev;
 		prev_rxq_idx = rxq_idx;
+		if (netif_rxq_is_leased(netdev, rxq_idx) &&
+		    netif_is_queue_leasee(netdev)) {
+			rxq = __netif_get_rx_queue(netdev, rxq_idx);
+			*map_dev = rxq->lease->dev;
+		}
 	}
 
 	return dma_dev;
@@ -1032,9 +1040,9 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	unsigned int niov_shift = PAGE_SHIFT;
+	struct net_device *netdev, *map_dev;
 	u32 ifindex, dmabuf_fd, rxq_idx;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	unsigned long *rxq_bitmap;
 	struct device *dma_dev;
 	struct sk_buff *rsp;
@@ -1104,16 +1112,21 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	if (err)
 		goto err_rxq_bitmap;
 
-	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, info->extack);
+	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, &map_dev,
+					info->extack);
 	if (IS_ERR(dma_dev)) {
 		err = PTR_ERR(dma_dev);
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
+	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
 					 DMA_FROM_DEVICE, dmabuf_fd,
 					 niov_shift, priv, NETLINK_CB(skb).sk,
 					 info->extack);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
-- 
2.56.1.750.gf70dc682cf-goog

