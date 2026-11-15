Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709575;
	b=Wr5PvXofmIQrPl4izRykVHk8SxL9xteHtrfDK2Ek7k+l03UqUh/u/frM5l9Mu4CPNGws
	 IwXSIjiv5gvRWT7dZAT2fmCMcHjve+b0dgp9aAvDMC0SswzzHLfozqMKBA7wnA746n1IQ
	 01Owe/p1oRlshOCoGY6u6GgkAG5wQe7EGZOCNHI/6da7ZOAjb3FmbEwOODvvD25eERk2G
	 izbr5Jyo9My1cTT0xGYeHukjDE6XuJOK9hQ3qbGoiILpdpnNryGdkzpQ2Uaq4/AR0y/3r
	 J3GTfRGouSQBvMwhS38aymvBiTUz8z5g+RMyhpvlwK9XH/HFPSFIRKIp+prs1X7QH9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
	b=f6GTjsACX5BmFjH3hVTg+FSuCUOUZHLADPDttger2IUXShTH70nO1KH8iZpQz7IJY7Nh
	 Tsby8MzS9posfeQHxPCNTULYrh9xebQY5wdi4R/gIFUw0Y2fbSeDI+xRr7Ok2pO8yNDu8
	 9bV4RD0HZKLe7tv3V6ksIJ7BwmakOpukmIAVQTVoWJPwZ+nayJMKUcwQQxGS2iT2mR8V3
	 DI2P17PGE+4Yn31J/+/12Kc7zrZI9GgL7zAtdxYvBAP0p3c4l+nXJUmbSMt1L9mOW3O0X
	 dW6HkWUl8aaYctUEEBpn7bimtZxlYxMMmUU0c66lETpwPOgsKXUg23mWk3eRfNHnFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pub0yup6;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7560A2625
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D7560A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pub0yup6
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3598748eec.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709575; x=1795314375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
        b=Pub0yup6CsBlbvEv3wRoBo5cbn8eknsw4N708Ff2JZ8HBdGAJp56fsxlkOWxjLK/kH
         UzBSiZg4ZJq0OeynVe4Qa9SZZGJSDsUxjjvqnF0sXmAvoY/o3R9UV/bkzRMKZGjvnDiT
         txtJ7EK2gRlZdhmLrj6TJgEaMe1d+vz7XVS4q+1IxxZ4B3qurRVWzFsCjve/SXx8zLYT
         Gbdegl2HvEVpLNVbc3SuMsHXNy+/ktkgOY3eNiZkIEhoDvy7Uk5ruAo44Ye0TxEV3owH
         /hEQ7SoYQuwZz8dEvsrSGxZEP3Voaql+aIeaHne6tus1eSTsQj+xkRmoinEzq0KDcG6p
         81bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709575; x=1795314375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJSTKyjGMSQLHICDuqZKjfmE3DjU7eSvQQbceB4t8TQ=;
        b=iCcoe/fuH99LYfL3u2hLFW+e7YykyuukADU5AkNVI9HJB+HmoriseggRPF40VeKMXU
         C5rIT6gzgzMGnjc+a32x6nxKURulORDKQmoyQiqYmFMmtftEp+j8zVUnVYhkYfk2K2aW
         2y2PhaTlMrHZuWaW1f3m0eJ0THWV/5NTe/CGk99zdEguO7DhKEcybbCM8UwFrOdrPXdu
         jrwm0LTnZBKrk6IR/rL5SarHVm/VbelbKC63I4xhKd8zp+7wU0Ks75yooozoSywxhRGD
         0qK/TjB0ENNUTmSQaTWvWEeuESgga0tBkdqhHoDYeshvqhdfctUYPTVYTWn47p4K57FG
         XgOA==
X-Gm-Message-State: APuU4Z9qqEddlalLcUMoo5hHmqtJ5lURn06sLOzZMVWGEoQZA9kltdq8
	ZX5XbiPrjU1AX+yjzadq8FvrkkUX19+/mU2kbgvNm5UATNecjFEeshP+jyck5XJZzc+cUM0UufS
	cTWzITvO2+EXjonChSFvqyYhQhusqUEDDQ3bd5PZ9Ae+J+/W2MhEZXFwTlBWIXtb9e6Rha0XkYT
	SgjXe8u7fMDvrGUWtfONfZ6xv+qdSWrQTOHN5EXC60GOSqltsGEbC90Jl6Z7jD2wo=
X-Received: from dycaa9.prod.google.com ([2002:a05:7301:5409:b0:36d:d73d:fc3e])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1a0b:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37965ca86fcmr6555223eec.9.1794709574090;
 Sat, 14 Nov 2026 18:26:14 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:06 +0000
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-6-almasrymina@google.com>
Subject: [PATCH net-next v3 5/6] net: devmem: resolve physical map_dev for
 leased RX bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Stanislav Fomichev <sdf@fomichev.me>
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

Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 11 +++++++++--
 net/core/netdev-genl.c | 19 ++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index a17ee27dc7cef..31ef17641ef19 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -267,8 +267,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 				NET_DEVMEM_BINDING_LIVE);
 		xa_unlock(&net_devmem_dmabuf_bindings);
-		if (!netif_is_queue_leasee(dev))
-			net_devmem_dmabuf_binding_unmap(binding);
+		net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
 		WRITE_ONCE(binding->map_dev, NULL);
 	}
@@ -323,6 +322,14 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
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
index 9e56c26fc65f9..442362f23fe88 100644
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
2.56.0.611.g1030f0b940-goog

