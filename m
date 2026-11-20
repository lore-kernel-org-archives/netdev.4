Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196246;
	b=ZO1oIMjdwyRN61yMGcXGLH2ja2Z7Bu5PBAx7iQuvTTQpFfPJnbc4oxn2OeCy1xZ8nAJ4
	 fjENrMSZaMigCf9GrxVOJmr1I2aatzwLOCmIO6128Jo84fEKfqKOIsAOEgVNfAJikbiMK
	 zKga7nkoZ7HElr/rifxZKu7URoVd0r1hpry9L0CnyTt0WNtN4LmUuLGCFG681vHpZozC+
	 cLs6w3eR+YJsZ7Y41W0tfvAzwOkgRDw7AmZ+CqrGPYc4dhxxnIN4Q7EZBbSzAY+nscoEt
	 EfQfk+DbMMi303fgyLOyDFAZwBG5+EM0G1WSlQBlerPxlGODFnesLNxGKED78Vefzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2pQ/nw5caVi4RbK1CcsBfPp7aScPNttl9DankhCdcO4=;
	b=GLsK6jyAQPiziGJFvRYDAYx8LM7zPv3Ajqe8/Y7NTABzRgpr6P32aJ8imqh/dTf6WASe
	 oJCph8N6oxL+r7AuMNzc2vHrQsZvyxNJ0QCXNvPkqDfI7crEmEfQRlFbzfXgHLqOdskHo
	 kt2IgdQHvnsJjKa0WdN+gEaHI+yUL3JjP114Z+6pAMvzpOjT5uDa9S/6kzvjN1LgnEX1g
	 cTw7hA86Wsku9m+PIFlcNTW4OhM1Ybp8MgmsX+rnOwBHPScUjltMnxIlNaSvDZrAeO1nM
	 ygzcSotQzqECNveJ2bAqpRHBq0B3AbBJybq0SxNPO3EiekOOs8YXGL4S6qf8O877mWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBs2GTH4;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0E606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C0E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBs2GTH4
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-886e61fa30fso521809b3a.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196245; x=1795801045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pQ/nw5caVi4RbK1CcsBfPp7aScPNttl9DankhCdcO4=;
        b=SBs2GTH4L8M6Rb3Jxgh9y0QVbTov6iGvVd3DR49NC6s9S08jVl74nb1GLcO6K0JVJU
         sTM0P0mcCw+V0jB0osrRwu6gKBN0NzZPLk4s0iltsU4bG897u6qvjehhROtlzjAwGjqF
         A0SUUdE3OYJSXQnXeKotKuZjWZx5joSo9uFFE0YfG2BLwFL4GnRm0bcYYuWERvOZfz6L
         AI2AK9jkAlzdBZWqseJTZztDIMfxSXtzOeB0/F4FhkJD2J/OQOx5B7lWdyaBZ4BoWs+b
         CK1/UK85l84CX+80sK0sT9jmzeIOW9NYRioDQLJoy17gJ9q/0/QgqRVGJRRa1uVsRu71
         +aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196245; x=1795801045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pQ/nw5caVi4RbK1CcsBfPp7aScPNttl9DankhCdcO4=;
        b=gtIzn//A/1SQiSmotDNRx5jFsYPwkrI+i6kZlwK3ToReSx5ye0rFt4T5VSe/Q91zxL
         odyHJ4uy78mAJofknu45chyctFAWSnAw8J4tmEzWX/F4kqrKcG7Hbtn9HqNa3WO88kNm
         Gr3Y/cZ1cOVHkwD65GyBZacXj/KLpJdmiocRZvAGLAripSrZhw8ogQPCf2y3cE+b7RbI
         ks+/JbJ9hxPF6+X7xaqfoqbtC/T357+Q3k15AQA3S1+ryQjH5KeXRR6XjQryU0MvSjra
         jbxTWVIC8G2XqoqrUOCCDOWsQp1q38zfHh+iQZtq10a0k0MuX/MgK4fIzS3Jb91fnjdy
         7/Xw==
X-Gm-Message-State: APuU4Z9vyh44jtfCfej60xLP0agqku/yuaGwTgaPchVkW34JKa7JQR+t
	WdoorsWjioFCfrIPc3k/4kHTXNYnDPsICHDKLrxL1J4zaulKg+dR0lI12dp3+x+G
X-Gm-Gg: AYBFou1QJfYITjT8mN3Miv6XvmRKmsO92HBWftUFIqw6DhlZKQfiF2Pad29zm32GAUq
	AERnFGacj/Le9WG4FKBCO0QOlcJu4n5zVYnVqcfckQAUByFIK+y20KfqOjn1ssATcgFXKe1orQY
	Akf1FJ0N+OSxS65VgkyrbnW3/t+G8gmhF8Ukx985mcVrrVX8C8IcT1upT6y6qSeCFe08o71iLyU
	3ILfKc/R+cDEwdLzOPCjNUdv22ii69gied+q78UFSldzO6frd5PzY9lFd3m41gsVedqTPTu1aXn
	KWINbQJzGsu+P0fVirGwuHDmCQ+JIL2WRKyVhn4wGPf3nHqkaSyj1OodAdlC7rqp5NL82SVtHdn
	35EWt0GrJ8mi6m5d8mPa3borkFj+goOdQ7FbnUS9X1V6ATs1Jn8oVgLI3z7z+WrmaBGR62CBfCL
	2fRGy6iHBuU+8KehDA5DWYgQ3ucvz4sHPlUWEMouZQOXGnE1b9hPJbYEbGG4fye0wUcLt+iZ3Rj
	j4EyBMqmZSefGs54HY0kDBP2PRQb6NRPFlxh26jHIFGqf3zr3PwtkrcENMe3KbEbpOT3a3IwZLG
	JPxOujLkk8BRDpLMF2bSw3z4DJUa2gvldM0LK6vqEWN8Ybn3z8Oc
X-Received: by 2002:a05:6a21:4d8e:b0:3fa:10b3:c8f1 with SMTP id adf61e73a8af0-4014d25ddfbmr3224637637.41.1795196244659;
        Fri, 20 Nov 2026 09:37:24 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm1853608b3a.53.2026.11.20.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:37:24 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	stable@vger.kernel.org,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH net] net: hix5hd2_gmac: do not release the RX ring on interface close
Date: Sat, 21 Nov 2026 01:36:56 +0800
Message-ID: <20261120173702.1551838-1-mmyangfl@gmail.com>
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

hix5hd2_net_close() frees the receive buffers while the free queue still
holds the descriptors the block has already fetched.

A port that keeps receiving then DMAs arrived frames into buffers the
slab has already taken back; on Hi3716cv200 the descriptors at the next
open all carried the previous session's stamps, and the frames received
then came up as slab garbage -- six parsed as LLC, the rest with an
unrecognized ethertype.

Do not release the receive buffers, their descriptors and the queue
pointers on the close, until the device goes away, so the block keeps
ownership of every address it prefetches.

The sibling hisi_femac has the same defect and resets the port before
freeing its ring, as in commit d54b21d82430 ("net: hisilicon:
hisi_femac: Stop the receiver before releasing the RX ring"); this one,
however, has no reset feature and has to keep them alive across a close.

Fixes: 57c5bc9ad7d7 ("net: hisilicon: add hix5hd2 mac driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..8c67a0670cbb 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -792,7 +792,7 @@ static netdev_tx_t hix5hd2_net_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static void hix5hd2_free_dma_desc_rings(struct hix5hd2_priv *priv)
+static void hix5hd2_free_rx_buffers(struct hix5hd2_priv *priv)
 {
 	struct hix5hd2_desc *desc;
 	dma_addr_t addr;
@@ -810,6 +810,13 @@ static void hix5hd2_free_dma_desc_rings(struct hix5hd2_priv *priv)
 		dev_kfree_skb_any(skb);
 		priv->rx_skb[i] = NULL;
 	}
+}
+
+static void hix5hd2_free_tx_buffers(struct hix5hd2_priv *priv)
+{
+	struct hix5hd2_desc *desc;
+	dma_addr_t addr;
+	int i;
 
 	for (i = 0; i < TX_DESC_NUM; i++) {
 		struct sk_buff *skb = priv->tx_skb[i];
@@ -873,7 +880,10 @@ static int hix5hd2_net_close(struct net_device *dev)
 	hix5hd2_irq_disable(priv);
 	napi_disable(&priv->napi);
 	netif_stop_queue(dev);
-	hix5hd2_free_dma_desc_rings(priv);
+	/* free rx buffers when device goes away, not when interface closed;
+	 * the hardware prefetches rx descriptors and cannot be expelled
+	 */
+	hix5hd2_free_tx_buffers(priv);
 
 	if (dev->phydev) {
 		phy_stop(dev->phydev);
@@ -985,6 +995,8 @@ static void hix5hd2_destroy_hw_desc_queue(struct hix5hd2_priv *priv)
 {
 	int i;
 
+	hix5hd2_free_rx_buffers(priv);
+
 	for (i = 0; i < QUEUE_NUMS; i++) {
 		if (priv->pool[i].desc) {
 			dma_free_coherent(priv->dev, priv->pool[i].size,
-- 
2.53.0

