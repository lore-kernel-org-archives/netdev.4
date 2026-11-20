Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214597;
	b=JwZzbriNYP9BhAGhOf4h9OzGpTcRgcBf/DzJ3rF5TGK4vRSSStA/9HHvBgt2Kh2fB6ys
	 Eq4pjs2Vd8x51sOviZVuaHHI8WZvElDMprzg8ummQA2jwZsNl12u8SecxesHPQZJTPzg0
	 YUZ/4d7BDpzFEJYTChyiMMjmRJoajgPNxTZaURR9w4V/29okya5K4TVKQZkVfwX2tKqK2
	 /SfedP7+0Jl89hMe5NAvYd13k4gSS7UkEEdELSyGlSAVMHD4y6wCOV2xI7A5C3LbIZ0cT
	 uPzNne2D4jKEqyvUEKEo+e24OsiOteAOQcC0BFsyS9y8YuJHKOradZLNl1ojOs9Cvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214597;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=/jxiGLmfmKTjgadYTv5ZC0oOROfd7E+9MLG34StbnE0=;
	b=aVMkT7b0Nv5KAeZzjAzB/6fiAAdZpTrnMzIX1i6xM2mQnwDFlpZH4XpmPchMST+mgEmB
	 IIx2aVpm+7ju0nHe1KOoGF5itws/Ufc1OF5ABH5hRw6DMlQe68HCpbXvbUq3t3NIdEgtP
	 44OoeVzIvcm/6+S2yeE1Fy5EpYsKZrLBBJtf3qNMyL/JUdo0LhcMH+Z2QgCp+E4EJrxzf
	 MZscWwr0qxlb1iRJx69rzSV7ROXtnyxEM3oxyS27eWxfm5gi1A6k/02MoB579SyxsWgaF
	 EnbuMkVKt8gfUbN9DV9faOShO9WMjwGFNaFXUQBdo+1RB7gFMNiTg0q5e2zEvTjbL9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yEP1fyUY;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBF606A333;
	Fri, 20 Nov 2026 22:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CBF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yEP1fyUY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62FFBA4C38;
	Fri, 20 Nov 2026 23:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/jxiGLmfmKTjgadYTv5ZC0oOROfd7E+9MLG34StbnE0=;
	b=yEP1fyUYZdSgqUz/8CCXbaDqAxnrYW/AaLqfWxov43J1aFVgaAH8P/IgHUCtw2pzCCjLn0
	xyAnQh3mGE6NOGVYG84N0WFM5SfMRN7nq7n7JcROkxzoxMKkyVNBRDY/nC8FnXu2p0S9FH
	BkOTyhMVoklScNnyegj418RNA5kweh6FyDOdMOvm0ilJZAMKah596uRiUzJl+M47qUxD8R
	F/yKtvzygj6zcMy/ZizhDNHoImu7FdKWmvbfmgAa8LpgCKx2dbB5JYwC0ctXCLQjVx1GCw
	9SV0Grg6EWw18sqajlunuyFqkjZL7cHpTq/qtsrEv3TpS6yaA32hhWq43MxnQQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 20 Nov 2026 23:42:37 +0100
Subject: [PATCH net v2 3/5] net: bcmgenet: reset the Rx discard count with
 the ring
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
Message-Id: <20261120-nb-genet-dim-stats-net-v2-3-1a7cece7dd1a@tipi-net.de>
References: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Ring init clears the hardware discard counter but not
ring->old_discards. Discards after an ifdown and ifup or a resume are
then missing from rx_missed. On a CM4, after an ifdown and ifup, 3666
discards showed up as 0 in rx_missed.

Reset old_discards together with the ring.

Fixes: d26ea6cc48da ("net: bcmgenet: collect Rx discarded packet count")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index f9f38445568f..b81408e6293c 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2826,6 +2826,8 @@ static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
 	ring->read_ptr = start_ptr;
 	ring->cb_ptr = start_ptr;
 	ring->end_ptr = end_ptr - 1;
+	/* Zeroing RDMA_PROD_INDEX below also clears the discard counter */
+	ring->old_discards = 0;
 
 	ret = bcmgenet_rx_ring_create_pool(priv, ring);
 	if (ret)

-- 
2.53.0

