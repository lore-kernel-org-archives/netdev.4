Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930856;
	b=zSB/wxxQodLvKWy0TagZl6XZrPBbTFRwGqO4sAGi0jbNA+2IRWua+ShEdC0evqhfPrcw
	 uwmAUqF63WWelLoALl5tHa1AMM0mfucfZFDdqE/u1aDCEtRoRe0CT4C9VE4vomdvnVrRc
	 zIvgpEoOIs3zmkVFj8wYhkAbV77Z9KpdkHYUFShZjtC6Its1LuAXICAa8HgTcGsvWHrcG
	 tmAi9gDLiN+SlzcvbQ8JGlSH5gCBbZ2yYpknI2Xiyjjqk56YHa/5IUdEp72TWbmBT/lmo
	 eYQSWeiigGfzoWwM7DQWMFw9TML57/fUNAFqcgSouPAXUM+x5e2gJO/w+EN63tZ3Rqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
	b=Ug30pvls99XQzseZxQAm7lHZxIi0xqZvWWrUDejegu5B/PNdo9Q0pyMyjhBGwN0HxEBQ
	 nmMvveAHxNGRCR7ORZU52YdwH+bp+EQ4fqEXsvSgmlQ3WdJI+AEIFXMp3bzuB8FXFQxZ0
	 ME8amucFHAJiPuOVQu9F8AODz+A20USignL1V5lzPic61lv5yuzNgEdBvJuL/Mb8skUqn
	 AILjSSIVEFIhSE/xwCs0G+uvuiFv3l1aEkHslxIF4PtTXBLGhG6ZQzllwrAC6t2+lhB+G
	 mndyZbx5AUh7+FJSKT+27Qyide5P4l7QlyuBdmBNqiVrPBPHpNospdkkcHNozKPOKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pmrIdfuj;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5180606A88B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5180606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pmrIdfuj
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso30222035ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930855; x=1795535655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
        b=pmrIdfujPycQm+s7tQOqOFxlhHo+pwbKAtJ5JxxY2qRS+4l7e/cZ4QOcCIZXos85IV
         Y8ws+IrsuDgvjQeTct4VzZs49xxqyyAzumSE3x0RQAQi7UbRAQpIQv4f/Ij8+v+C5vk3
         lp5aMveOZudQunCgabz1/n9rEMI7OMy+75cya5hWWYmSkRBRu701yqtR2qbhsa+9BSov
         B7p7WTeMXrA1la4e/jxbsGjo2YpSydYedd0fnzhxF002FK0QYyPF3QQFRP9jTfsvH6vf
         T6MHOG+Slkq/2jZZH/9MrGP/aRdfrVddpi49BPd+UXYyQwW0pEP/U+bpuPXB3GePq49e
         w4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930855; x=1795535655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5dvy/hAScMAJsju1oorwW3+RHfVmuWNsVasJTGPYS8=;
        b=1X9S6LYS1JbI+68Ig864vM7LFdXA1wvpLFZQ78NwHpVkw9NGyxREAVJzNbVM6QkWx6
         hYRxNr8J62tUGz1vsMMbT1dKHxHv/0h/Ug6xZ9r9Mduw1IFfti8/XHrTs07PrKA5ZrE7
         g+awQT9slTfBqgkcq1B3dRCCb15mkxEhPfcEu6o8eOdE6ITVzwyp7pAi99XYJ/JobEY8
         dwYmbUhZN6b2avn8MijbJpKA49st1buuXbADTpWHTNiugY3Azf9dX1eS70ZOlypFZMdP
         EHv5/DCvsXA0r1ldWW0x4XTHCr4iZDEqVCyT2xdxjAtXN/gf3Lu9M5p8reZ/uQyFjKzI
         aPXg==
X-Gm-Message-State: APuU4Z+nj+XgD1BS23pbYm0RNgbG5gLVFWo5/dtwPfDDrip1C6Zq79aI
	QT3P2+Mu3YYavWGq0VThUEYfkOP87XZJpzA24MZbesBVg4i/2cwzDrGaYW4nlTuuSZIz9ZkqwE2
	+yf9L
X-Gm-Gg: AZFdTZcSSsVdwJOv8UxIb8wQD6EC1ms6dh6A0pVcppEZDigJOlvl+rHf4uC5hieB5uO
	5qppPuhWShW5k/mcUUrHMNtpWqeoVeh8L0jn7BEhI41GwuypbpA4xppHegvujffhl4vXFbf6NKi
	mP3gANVOqpLsm4w9ofJ97IQMOieKvT0MApY5WPpzToaycVrJmfPWKmTV9dYyuU1gKaCU1xd3Kay
	Jd581DQO5UDg3mVLA8J/p4VVj2ig5XVL4fzbMvaK0Kh39jSY6YYPTjRgH3j9Th5Bi5H3GHiFa+G
	MjysUgDiAkQAIjgsO3NCwgtuA0iby899IjqcQhDBkCa8MIIp0+0yJ4/3G8YnFn+p0kO1ygY4dIn
	K6ppFnjHyEIh0Tz530lqUd/+GMaKEfd/jI8+CYUr66fJTgQdBRrxUkWS0T9cVMDD0+cdRZ3JI8v
	FTo26xU3r8NIZL09W8ThQKaz7bF/INl5nCIgBZuBicEi6HJDrsIExIuMeh6q4hZ+ssUo+N5DwUX
	rs1E0yPrDgUoZzswiQZtWC5XXZSaRmYOXghi/FJGS8bihdFhaWNMzleMEMQ53Kr24VUMOtvuBbn
	KverQVr3f0SeC9nofwxFjClQ0n4kvi0RjT/xhHtAfbM=
X-Received: by 2002:a17:903:1109:b0:2ef:dff3:47e7 with SMTP id d9443c01a7336-2efdff349edmr23311925ad.33.1794930855228;
        Tue, 17 Nov 2026 07:54:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a54576sm18951695ad.40.2026.11.17.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:14 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v2 5/5] net/mlx4: flush pending doorbell when dropping a TX skb
Date: Tue, 17 Nov 2026 07:53:50 -0800
Message-ID: <20261117155353.2250540-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261117155353.2250540-1-joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
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

If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
that skb happens to be the last one in the batch, the doorbell for the
WQEs posted earlier in the batch isn't written.

The queue stays awake, though, so those WQEs are eventually announced to
the HW after the next TX, but that depends on traffic and could induce
latency.

Avoid all of that by writing the pending doorbell in the drop path.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 123071a47bed..3166837711be 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_drop_count:
 	ring->tx_dropped++;
+	/* an earlier skb in this batch may have deferred the doorbell */
+	if (ring->doorbell_pending)
+		mlx4_en_xmit_doorbell(ring);
 tx_drop:
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
-- 
2.53.1-Meta

