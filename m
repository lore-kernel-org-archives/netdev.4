Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034454;
	b=q1nfu4GyUQ8r0UVLb5PYPOGqrStWXHUp+vzQVPGkmf+kMH195J/5qXsAk34jkU9XkUPC
	 w/4aA56fD7x2P8yq7G2VSrbyDl4h2TPg8scvGrLsDbAga+pKwj9Buv2E1zFjUVABUOY+1
	 jv6ky12gYVNBxTJ/EC+hMsWZngG/Ue6JgUwbi2yHxnjOopfxaLc+Z6D/A1Y3TUw0XT7UD
	 DbeO1/UdLQf9mdFFZcj9rSvT1mia1x2LKGzVZPqaLA73jDKBdL6HxrtDAKJlZ/pd0/f5t
	 zjC8/SoJ41rMg54WG9BugkTOR1oKPu2k6JOtq/7u+JrDjzGEqw4Sh58k4g0pUYwMKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034454;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=BY6HYl1AxSl+ePwD84qKblrWwkHUABln7+0huJrgIQo=;
	b=ljhz7a9ASmyow1KKV3Ixhm8FtcYAxWvVJvvSb+rZfCpHwuaSUAkniVJQ/BdE1TvTwY/U
	 7vIeQBXhiBf21R05KodLONYaapxKgpwIpatVXMcYwO5R2Y2uEmEjp6csqKvN+53FvEl6x
	 UerFzf5C0Vq23s4s951Iruiw7KWuAQ/aOr/lcOoEL0PeNK2UGqFBBAg/qmc/xXhCMk4RQ
	 rx4mDUC4Un3k8u5Zu9YwQTRRJJYFoFk3yrmnKhBcn785qoM9rWwSURaHPN4X8Cnsb9Xai
	 xpuZ6SStjH1S3qBVp9sJ7lbyRd4J6KD9XgSoiTvVwCMuE0Zw42yhBz9qDPHdimCnLuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=FNoXAjkV;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C5606A320;
	Wed, 18 Nov 2026 20:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4C5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=FNoXAjkV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C847CA023C;
	Wed, 18 Nov 2026 21:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795034450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BY6HYl1AxSl+ePwD84qKblrWwkHUABln7+0huJrgIQo=;
	b=FNoXAjkVMUd/5dAexCdc3vR1/WBQak2q65M1eQXCHXjMllAcra5LHdzbGM/DyUgL851KNX
	2YYztU5Mu//gO8rxYTP0vhzpGADD7d5cc8GsWQ4hDDqLZ+/EPP4N88T6jljCeigKa9Faw7
	XcJdLRRYWkrZQN/+3UzeZOnl4JOW8l7edRd/cwNldQXn2hhfwTlZrAvUeoIUAXHw5V+f16
	PmFAHEf09D+b9ssg4E99HiRRy/WX4JTz+CZqV6RD2CpjljBe7LXrb08Rg7+657L9nqBP7a
	jRpQ6dmsxWE1VfyolfoG2CBziroE7HTvsJnOd0n0Vwhn10roiKzkWCJOeoo1kg==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 21:40:39 +0100
Subject: [PATCH net-next] net: bcmgenet: write the Tx producer index when a
 frame is dropped
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
Message-Id: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXbBFCLRq4gPbTqpa3FbklQCp
 Xc31cefYb6NEqIg0a3ZKOIjSWatYU4N+WenI1iG2tSe24sxxrH2PEKRubwl8xDnhSfxE6uyu3b
 Wh846G0AVWCKClB9+p+OiKJke/yWt/Qs+Hzbt+xf/b8JriAAAAA==
X-Change-ID: 20261118-nb-genet-xmit-drop-kick-nn-89a5cfa585fe
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

With xmit_more, queued frames reach the hardware only when a later frame
writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
and the queued frames wait for the next transmit on that ring, which may
never come.

Write the producer index on the drop paths too.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Another bug flagged by sashiko over the past few months.

Writing the producer index on every exit is the correct way to handle
this, but I could not reproduce a stall. Thus net-next it is.
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 61f5a4c2f0cd..6545caf3232d 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2254,11 +2254,11 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (ring->free_bds <= ring->stop_thld)
 		netif_tx_stop_queue(txq);
 
+out:
+	/* A dropped frame can end an xmit_more batch */
 	if (!netdev_xmit_more() || netif_xmit_stopped(txq))
-		/* Packets are ready, update producer index */
 		bcmgenet_tdma_ring_writel(priv, ring->index,
 					  ring->prod_index, TDMA_PROD_INDEX);
-out:
 	spin_unlock(&ring->lock);
 
 	return ret;

---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20261118-nb-genet-xmit-drop-kick-nn-89a5cfa585fe

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

