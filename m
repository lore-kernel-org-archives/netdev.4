Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771341;
	b=HEqrhXv6WaHxPDBWUENKNU3yHJZ7tyFv0D1QcYt3i7ihWj8ONRpwROWgzrIVZVxjn907
	 X/vIoSgOS5fwi3lzwSoPP/atspoegOojLbCApyRwJlT6rrKDtpVwhXcXY/Can2oauYhkT
	 K1Q4tOLvPkB3KGYWXW8tijd3YjORsXhrBRTKQfB0PmDcm6M1eOUVnG2sJlcZn5RbSt1SS
	 nOKY5Lb5QW7oTJKOEwp5FXYs3Lv/nV7tXzxlfqIscS5rfU9FM+5b0tuamoWRyMxCB6G+Y
	 2HBWbciaNqBgRk2KBfVgGBEFCcH0oP3ib6svWUSZ3oGotbR/b9ZYvzPRgMEzvNIA5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZVU6xv+T14ZKDfxOofvpOuiEbg6b2Fd8QVJxSG+63go=;
	b=aB4MBORbjgVjm9PK/IXLSkxqeBVvi9a2GjE7p9v9f3Ckl0HTqx5ncoe3Uukz58v8eXwO
	 5MK2/W6UvcE53VWRp7kD/sp7gfCyMRIIOWXQ5y8zG9+TspdwbHI6bRVKdebEwy94AnAW5
	 MW6PqqI+jmeNGIoSliQbW9uITLn9f94+pgnW1uu9LnE/6G9YkKie7jQJL9MbspvT3QckG
	 W1CggkQsAqmiZt9jb/Zt1n2LKOhIxE8RR5+iSjHSbchMbTmUrtMwRJmFtZ0ovKDmRZJ+Z
	 7TYgNF8TccveLn43x1DDohRYS/lnHXlUGkFbN3A6fPkUNdZp2MCzLGw2bRKqYXc+2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="b/dXQsaz";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BD606A88E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388BD606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=b/dXQsaz
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so552455966b.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771338; x=1795376138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVU6xv+T14ZKDfxOofvpOuiEbg6b2Fd8QVJxSG+63go=;
        b=b/dXQsazpdOE9d1QdqIF1NCjnTe5NoE8MIKpZL1WyFkamGq3fHgmJetd97vcgCSZbu
         A9OE8x7PAlKhB/zjwRsxwIrEvIzDmsYSoyWSMSEZBTvBC/nquqmc23Uu6dx48hb3Dzl5
         Nj8nvByw/7iq16Z9gdDXS/BSVoJNUVQzf29Q2FKayTHneHU8jJK7y4jozWP4af6/6X7w
         1D81mSeKLOxor+437iwqKjmZaLE0MvFmonSC6FaBk1R0ZZjdD2HXljoP+l7Q19wBcBbI
         V9tmeUXowOO3DkGWDDYOPIw/4s+pWFUEJyWbbhpOAfchzMVpuMcCGopllmFp+bH5AD3o
         PxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771338; x=1795376138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVU6xv+T14ZKDfxOofvpOuiEbg6b2Fd8QVJxSG+63go=;
        b=HDT2Gn1UElLrSC1lc+NIkVh19ht7sltPAn9oqom+pksKBRirhpOfy6P3oIZ1oXp206
         yXZDY3nHPzE+hdkQg/6XgdRvpXVPcxNZhfCMbfy9vJz/GZu7FUDOJRb2w67h7YYNNCmx
         hIUpaDqZ5bHjtO2d/Dl+1ky5QIJ3vzn1siP4H37Oid4RxyTEkxo6R+DwmI6ERuvzMUVP
         oiatkvh2Cs+3OBkaSqreYguxYQdOZW26FwYNDvH4SsIjRgm7i/+9/x3DbNIRRcMKhNX+
         9r4Xsqx6EGbZYgKjtAHlD+s/lk5dKrGOLoZ41anTh9LOaTBGgwzyppzfx8wNiqgWq5hS
         XgLw==
X-Gm-Message-State: APuU4Z/AndlTIGidgtLM16/tSmKhb5N8PAAbFSXLLgPMxVQJSeW1YGVD
	UxzLKge7bgKP3OiOT1w4SdVOXynUcerIefBZBNuZSE/lR4/Vuy+OU1tNFU3CJ2HuIR7ANqVA9PU
	p8Z6uq80=
X-Gm-Gg: AYBFou2Jo7EqyLPj3hSzaeJ8JwrR5CxAPf5gQDSP6feU9V0BBHivAyVAJrnJpDGc5De
	tF9vFz1+dmoeAaIJqi2BRfUzcGt+veGxHj62ViQabWAXOVph6r8udw+PZjDoT3o4Gu/EZZa0KbF
	d1EqQcOZyJnjx9v/9kRxo3BHuQPe+LLxc1Ikei+JxagGVDKsJrdxQn5ZMtx80hsB9dInlX/Wxa3
	QG9IFofHUcxTg4VYTIUj0/glfCNcCEXg5gMzfVZEdu0tfb6rw8o7453A0EVFuFTvnaIPaGzDngy
	3z4M8zuPuQgrTyGBvSqiXkblBhHPZmgehDq9EHJU29pylGHyvpzM4WLFQqD0PJzUipB+UJND8b5
	uckjvSodgWHyytrRyo5+ywjwK88BFqjWVq0ZEhlGexJSYz3Fmu1mBxZt5KbhEgix1KyQZE1TKRd
	hBb258SjeO7oRko/FyouMj2RAjJ/1cqGJPIhKbL1zhTUHArOH+3MAYDMCjPA6WIp2RLaVyKKpMe
	MCW3WD3aD/ub5BXFpkvgtHUtYstQJVr7MF6pZ1y4cSuV9iUlXuhq//kFZVJhQS37t1R03FdZnHR
	gQYSQPEr6DbBC/97lwCYKhtKWlTlJY+2nEYN8J3i644ns3RbnGpOZR9HJQ==
X-Received: by 2002:a17:907:3e06:b0:c50:5186:a429 with SMTP id a640c23a62f3a-c50963c2b24mr725995866b.37.1794771338583;
        Sun, 15 Nov 2026 11:35:38 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:36 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 1/5] veth: refactor NAPI enable paths
Date: Sun, 15 Nov 2026 19:35:27 +0000
Message-ID: <20261115193531.57679-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115193531.57679-1-tianyi@cloudflare.com>
References: <20261115193531.57679-1-tianyi@cloudflare.com>
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

veth_enable_xdp_range() adds the NAPI instances itself, only to pass
rq->xdp_napi.napi_id as the napi_id argument of xdp_rxq_info_reg(). That
argument is unused in __xdp_rxq_info_reg() since commit 5ef44b3cb43b
("xsk: Bring back busy polling support"). Pass 0 instead, as ena, bnxt
and fec already do.

veth_enable_xdp_range() then no longer needs the NAPI instances. Move
netif_napi_add() from it and from veth_napi_enable_range() into
__veth_napi_enable_range(). Add the instances after the allocations
that can fail, and before the loop that enables them. Drop the
napi_already_on and delete_napi arguments.

veth_napi_enable_range() and veth_napi_enable() are then trivial
wrappers. Remove them, and rename __veth_napi_enable_range() and
__veth_napi_enable() to veth_napi_enable_range() and veth_napi_enable().

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Sashiko [1] pointed out that v2 added and enabled each NAPI instance in
the same loop, so a failed kthread creation could leave earlier instances
threaded and later ones not. v3 adds all instances before it enables any,
as the old code did, so such a failure turns off threaded mode for all.

[1] https://lore.kernel.org/all/179470883254.2199510.15270739408094114749@kernel.org/
---
 drivers/net/veth.c | 82 +++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 62 deletions(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 0539b3661793..3cbedb8bad53 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1037,7 +1037,7 @@ static int veth_create_page_pool(struct veth_rq *rq)
 	return 0;
 }
 
-static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
+static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int err, i;
@@ -1056,6 +1056,9 @@ static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
 			goto err_xdp_ring;
 	}
 
+	for (i = start; i < end; i++)
+		netif_napi_add(dev, &priv->rq[i].xdp_napi, veth_poll);
+
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
 
@@ -1079,9 +1082,9 @@ static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
 	return err;
 }
 
-static int __veth_napi_enable(struct net_device *dev)
+static int veth_napi_enable(struct net_device *dev)
 {
-	return __veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
+	return veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
 }
 
 static void veth_napi_del_range(struct net_device *dev, int start, int end)
@@ -1122,8 +1125,7 @@ static bool veth_gro_requested(const struct net_device *dev)
 	return !!(dev->wanted_features & NETIF_F_GRO);
 }
 
-static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
-				 bool napi_already_on)
+static int veth_enable_xdp_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int err, i;
@@ -1131,9 +1133,7 @@ static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
 
-		if (!napi_already_on)
-			netif_napi_add(dev, &rq->xdp_napi, veth_poll);
-		err = xdp_rxq_info_reg(&rq->xdp_rxq, dev, i, rq->xdp_napi.napi_id);
+		err = xdp_rxq_info_reg(&rq->xdp_rxq, dev, i, 0);
 		if (err < 0)
 			goto err_rxq_reg;
 
@@ -1151,21 +1151,13 @@ static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
 err_reg_mem:
 	xdp_rxq_info_unreg(&priv->rq[i].xdp_rxq);
 err_rxq_reg:
-	if (!napi_already_on)
-		netif_napi_del(&priv->rq[i].xdp_napi);
-	for (i--; i >= start; i--) {
-		struct veth_rq *rq = &priv->rq[i];
-
-		xdp_rxq_info_unreg(&rq->xdp_rxq);
-		if (!napi_already_on)
-			netif_napi_del(&rq->xdp_napi);
-	}
+	for (i--; i >= start; i--)
+		xdp_rxq_info_unreg(&priv->rq[i].xdp_rxq);
 
 	return err;
 }
 
-static void veth_disable_xdp_range(struct net_device *dev, int start, int end,
-				   bool delete_napi)
+static void veth_disable_xdp_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int i;
@@ -1175,9 +1167,6 @@ static void veth_disable_xdp_range(struct net_device *dev, int start, int end,
 
 		rq->xdp_rxq.mem = rq->xdp_mem;
 		xdp_rxq_info_unreg(&rq->xdp_rxq);
-
-		if (delete_napi)
-			netif_napi_del(&rq->xdp_napi);
 	}
 }
 
@@ -1188,14 +1177,15 @@ static int veth_enable_xdp(struct net_device *dev)
 	int err, i;
 
 	if (!xdp_rxq_info_is_reg(&priv->rq[0].xdp_rxq)) {
-		err = veth_enable_xdp_range(dev, 0, dev->real_num_rx_queues, napi_already_on);
+		err = veth_enable_xdp_range(dev, 0, dev->real_num_rx_queues);
 		if (err)
 			return err;
 
 		if (!napi_already_on) {
-			err = __veth_napi_enable(dev);
+			err = veth_napi_enable(dev);
 			if (err) {
-				veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues, true);
+				veth_disable_xdp_range(dev, 0,
+						       dev->real_num_rx_queues);
 				return err;
 			}
 		}
@@ -1220,35 +1210,7 @@ static void veth_disable_xdp(struct net_device *dev)
 	if (!netif_running(dev) || !veth_gro_requested(dev))
 		veth_napi_del(dev);
 
-	veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues, false);
-}
-
-static int veth_napi_enable_range(struct net_device *dev, int start, int end)
-{
-	struct veth_priv *priv = netdev_priv(dev);
-	int err, i;
-
-	for (i = start; i < end; i++) {
-		struct veth_rq *rq = &priv->rq[i];
-
-		netif_napi_add(dev, &rq->xdp_napi, veth_poll);
-	}
-
-	err = __veth_napi_enable_range(dev, start, end);
-	if (err) {
-		for (i = start; i < end; i++) {
-			struct veth_rq *rq = &priv->rq[i];
-
-			netif_napi_del(&rq->xdp_napi);
-		}
-		return err;
-	}
-	return err;
-}
-
-static int veth_napi_enable(struct net_device *dev)
-{
-	return veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
+	veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues);
 }
 
 static void veth_disable_range_safe(struct net_device *dev, int start, int end)
@@ -1260,7 +1222,7 @@ static void veth_disable_range_safe(struct net_device *dev, int start, int end)
 
 	if (priv->_xdp_prog) {
 		veth_napi_del_range(dev, start, end);
-		veth_disable_xdp_range(dev, start, end, false);
+		veth_disable_xdp_range(dev, start, end);
 	} else if (veth_gro_requested(dev)) {
 		veth_napi_del_range(dev, start, end);
 	}
@@ -1275,17 +1237,13 @@ static int veth_enable_range_safe(struct net_device *dev, int start, int end)
 		return 0;
 
 	if (priv->_xdp_prog) {
-		/* these channels are freshly initialized, napi is not on there even
-		 * when GRO is requeste
-		 */
-		err = veth_enable_xdp_range(dev, start, end, false);
+		err = veth_enable_xdp_range(dev, start, end);
 		if (err)
 			return err;
 
-		err = __veth_napi_enable_range(dev, start, end);
+		err = veth_napi_enable_range(dev, start, end);
 		if (err) {
-			/* on error always delete the newly added napis */
-			veth_disable_xdp_range(dev, start, end, true);
+			veth_disable_xdp_range(dev, start, end);
 			return err;
 		}
 	} else if (veth_gro_requested(dev)) {
-- 
2.56.0

