Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037743;
	b=uM/MTDM7h8RqaevKkbzMnlLkBNtmlMRM/IPj8RgPSYe6Pcxwp+848dU5MfOWH+pWMlx0
	 +4/K/prrzLx8EjkoYImJH2GxCwHuMYGClm33eFiiDLIMYDHmxI+NXM6ry3wfLLZeXjFNt
	 MyrW1S+IHR36uyqEUSgz9Xtc83VqRZSHCIRDKxCO03c9+I2ffnm4m2A0JGnN9RLxWgoBT
	 lVcE5Mzp14jHi1DeArpTcG0BJvl6oGrRaHj3Bezx4Y84nsaS5B7BOJ9Jnf+l+21CTItxk
	 IKl1mc4drcx7IOg5RuStxHjupJO6E0botRZNbIO/xtZf/NR5sbDYJxhenROYwlFxuSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037743;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T++vNd80dzsCHF8oXFfO+D4TWKFK6zVxI/Iq8Osav9Y=;
	b=Xzzr+IYYoxGkd0OGNLZY6PMyN/OpYmQJgO3f/1cKil45c2QhzUOxK80LiWolo4IwLYRG
	 sTRtklw/Rsp/2WubCme8Beyx6x4i/8SbQ/5L6YSjAb2XLW4oJpoL9RtyCiX6X3xasvbo/
	 aKaqoxjjOb018kjrmLS20W2lLP3auz67JqRSokLzhap4Bk/cPqx4VGHR33/ZCt3C+4DIk
	 wjHnuptXP6Zmop4M/VBuIFvw4ZKEDE3SaWbFP1ZvVgBMkCnIGpZ3emAxYZCfRFDoC5x4b
	 nIAybY4fTjF383XBIFuS/C4+zzVBewLi4rpc+0LmDdDysYFE5QKkUq6VYDSCRMRz/Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsNQRDN1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF47606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsNQRDN1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABBA1F000C4;
	Wed, 18 Nov 2026 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037742;
	bh=T++vNd80dzsCHF8oXFfO+D4TWKFK6zVxI/Iq8Osav9Y=;
	h=From:To:Cc:Subject:Date;
	b=NsNQRDN1qphoW91B9LRuJbW0ZZRs9PcRUg04A/FxEfVeUzudmmvI1SSn1WAUP//jR
	 2SvBvcrKaj/tJ8+jyNMI+/9ANiaHnxLkHy6GJDV5phVxVGBbL9+gtUwLfQo18BhEIH
	 zT78VU9U8M7rPUv2Cenpb7xTz5sC2L6Ou8hnGAq7YFypS/wN7YuIX39+jCWb42E9t7
	 g7Wqdwo7mdHJ8Yt58Q7QGBWKmg/+22MtKIFzIoCoBUb/7dXdCFjUqk6TKuEPmT3qi/
	 SM8F3nEaN7GSQVOqUdvyI+NK/INJhAxmSDfn3F0XqydoM9HIMxAMnu97YliWzppAMl
	 sYUeAX3JOwJ9w==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: [PATCH net-next] idpf: batch RCU grace periods when deleting NAPIs
Date: Wed, 18 Nov 2026 22:35:38 +0100
Message-ID: <20261118213538.1485503-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

netif_napi_del() waits for an RCU grace period after each NAPI.

idpf_vport_intr_napi_del_all() calls it for every q_vector, so
stopping a vport with N vectors waits for N grace periods. This
happens on ifdown, and on each soft reset triggered by a channel,
ring size or MTU change.

Use __netif_napi_del() and a single synchronize_net() after the loop.

The callers are unchanged: idpf_vport_intr_deinit() still deletes the
NAPIs after they have been disabled and the DIM works drained, and
before the IRQs are released. The error path of idpf_vport_intr_init()
deletes NAPIs which were never enabled.

Compile tested only.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index b346187bbf301847224cd7d1655a9294b893acb9..d76613310b12a074117662d0558d2467a21e3bc4 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -3864,7 +3864,10 @@ static irqreturn_t idpf_vport_intr_clean_queues(int __always_unused irq,
 static void idpf_vport_intr_napi_del_all(struct idpf_q_vec_rsrc *rsrc)
 {
 	for (u16 v_idx = 0; v_idx < rsrc->num_q_vectors; v_idx++)
-		netif_napi_del(&rsrc->q_vectors[v_idx].napi);
+		__netif_napi_del(&rsrc->q_vectors[v_idx].napi);
+
+	/* Observe an RCU grace period after __netif_napi_del() calls. */
+	synchronize_net();
 }
 
 /**
-- 
2.53.0

