Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691060;
	b=aErelq+UtBok5f8LH/EMnSlA2qmQ83VFJmz4Iq5DZuuYj424QSt4a9jOv4Kqg3S2Ufxu
	 XRXAWYQ7F4qPyIJbFttZ6U/ApsraQnw2H+FDWGKTioFPnetYSg3TzgcWN4yT7oX7v4xjE
	 a70IexT0+8t4ryeudVULrkti4/5as7l7G0Oiyj6d+4WMmAL3RfvDZK0HhbwQmGX+dVFlh
	 qOHJBiu6x3CUS6UMlufaSVc5GFb1CiWrYMD2qDJXxkYZrQ2UgPYLCeu134KlLr3oS5CLQ
	 CkM73uQJGiWnEE1HGFNTzZn0NizE6QXZtWrG3WgiTcF9X002m502YeMsANxrcP1zfBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4g8tXScGXzQfVP5JUp90iPpsGlXFkWs9bJKRigx4BaM=;
	b=1rViEIVv56mhOfRcuFxVxHvwgcmnbqrKIj3q+Sj1Lpyc96X2n3gbc7bVtLTI1ZA/GCK9
	 tDUnWXEhtnvVNTZjqLV/K9emr0HRgKSYxqj9epTIS40/2vpCiPFRdTq2tZKd7/NEHa1KV
	 aNlgV7L8UTbwE1MjR1TA1VC2AkHhBiPr38BHM7fAGhXP5qc/qI0o0EsCDPueBdD5iN4E4
	 kojN84qDuC602I/v6HAGkVy1/AyS885X0m3xLf+Tqjcjd94RVuwYN6c5VBD/14iSbLe5e
	 pH3+/lOEPGN/uCpg92MGuM15sSHW1/N0GRTbjSQaS2Gs5MPVo8IWF1nb99k4G1APxuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zulk0/U8";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278EB606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zulk0/U8
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f02ee04378so54682685ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691059; x=1796295859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4g8tXScGXzQfVP5JUp90iPpsGlXFkWs9bJKRigx4BaM=;
        b=zulk0/U85+Hfyu1Xfyup6GZ3a15nISHQU5tQZZnVxTCtdLkZ+VEh3jwZ16PDHSX3J8
         MGqIFqZrsObMMLeF1Bb2OkxacOV5CsH/iwm0Jb2E84ILHJXv6qZ/HjNTuvdX/yDmmfBk
         JUx+F/RfEoBa0L2ztexdyKL+pmaumyKSQGtycecFJLMGBH4ND7ed+5OLr0AsS57lKheS
         XgO7wniphQzxesk/tsBZQ8NqxK/c5nd68Vf4F0JV+BMArGl0miEsSSmxglKVnTR5E9Z7
         YGURNwKqlhBob2WsKdI7aKVNn+O6iJK9XumJOXtSo0PHeGY2u5bCweHzd+joMc7jFJKs
         Z4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691059; x=1796295859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4g8tXScGXzQfVP5JUp90iPpsGlXFkWs9bJKRigx4BaM=;
        b=avTYsJVd+OxkP9G+mbbYrrEi5ev6OrrnY2Cjwu/Kt8IWwaSYA5V9CtIlW7Nnmo+kPn
         S+OP6txD16juNLoi+LMpe2IxFfvMy8tTkG5KONA+tlWZvc3UAP8pYEJCdm0A/Dvrf+0O
         jNsG0qbJGoxNAtTEJTcBouS/f6ZlCiUbC8jsk5mK0KWL7CyYuRhNgi8A4GwO2ZdZn2LH
         +M+XHvQL4Fnjrl9e4GOA8v2kDLjzgUjba0R3BAdjzR2I7EgNhm2muDUB9h4IqhS5BFSs
         bvxdcRX8GGzdSO2QCP3xKfrZAD0PL0qrNlzJTljHMPsIeZV4s2Mb1cSOhtHde+lNsHZS
         NwTw==
X-Gm-Message-State: APuU4Z8wEiJHcknI4sdNtoMS/oahLdl298g+9OstVomxCWasrwGt3mj7
	h+bk4Y12P9AP1QIEHh+O3y117jXgXgSzQ6lpK3QjjfWMwT99OLe74cyN+tBcEXps
X-Gm-Gg: AZFdTZddo7wan6mcfbAvE27hctN+Qf+9J3uNu4eHpQw3rJSPWdO//g1pI5yxMX/JI4a
	/DVcWRR+p/NvOgdRpdTDF/zuf8mu1eOmM6+l1VHNDMbRpZS+O7JuyVvFB/eup2aunJx0X0D+CBR
	hz5iSC7LSKyAaXpgKJjdIDZ7W6JLCwy9a7tuY+jLclKomLKalYBHw52Zk436d7tKHFPwI1e2ZEZ
	sJXw9/Xu9WeZf+KoJ4/iONxxBO7MNEyyUm5DbwB/f6VJa5v7edfQiU5GWpCOCUREKD7bLGYOFL/
	JXrIWofTZ0Ex1lP9ZW7SI1ENk35byMtqQc4H02eClH3Hj8t8taMyycGwIWJcgwXlEWc5S5j0o67
	r6bQnkocavQDBcPH29TC6yQ7vxLUkUUV7qGUP772duNKQGHRgyjw60vBtvKusOfN46AMvMZEq3w
	HJIGT5eU9djlGTh+sy51Z9famGX4mVL3DXKRGmHNohp9sA6JpthLeHDCETwv2UpLhGoUXjE9LWW
	W46qMkwZimZ1lzn2JMf15QKuQ4Rg/pLO0yqKLcNAhT72Q9xMRK1INjqx6NeyWbCxHl0ck5drUZR
	Ggv5qhT1jkD0nFhRPFKK4rdt+FzygE29MCx1Z2XLqAxLSz2HMBd7xEoTduqvDos2bGdELsPq9sP
	08w==
X-Received: by 2002:a17:902:db11:b0:2ef:eb06:387 with SMTP id d9443c01a7336-2f03f246dc5mr219198225ad.47.1795691059376;
        Thu, 26 Nov 2026 03:04:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm104525725ad.12.2026.11.26.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:04:19 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Dongpo Li <lidongpo@hisilicon.com>
Subject: [PATCH net 3/3] net: hix5hd2_gmac: keep TX/RX queues alive across a close
Date: Thu, 26 Nov 2026 19:03:05 +0800
Message-ID: <20261126110310.344521-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126110310.344521-1-mmyangfl@gmail.com>
References: <20261126110310.344521-1-mmyangfl@gmail.com>
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

hix5hd2_net_close() frees the buffers while the block still holds
prefetched descriptors. On Hi3716cv200 the descriptors consumed at the
next open carried the previous session's stamps and the received frames
came up as slab garbage, indicating possible memory corruption.

Do not release the buffers at close; keep them until the device goes
away. The sibling hisi_femac had the same defect, and was fixed by
commit d54b21d82430 ("net: hisilicon: hisi_femac: Stop the receiver
before releasing the RX ring"), which resets the port before freeing
its ring. This one, however, has no equivalent: the interface reset
leaves the prefetched descriptors in place, and the reset that clears
the queue state also resets the switch-fabric port the MAC feeds, so
neither can serve to quiesce the block before a free.

With buffers retained across a close, completions of pre-close sends
reach BQL only after the reopen, so drop netdev_reset_queue() from the
open; resetting there would report completions of bytes it never
counted.

The release reads the scatter-gather descriptors as well as the hardware
ones, so the hardware queues are destroyed before the SG queue.

Fixes: 57c5bc9ad7d7 ("net: hisilicon: add hix5hd2 mac driver")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 0d4701d1e173..0df31a2ec3ad 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -860,7 +860,6 @@ static int hix5hd2_net_open(struct net_device *dev)
 	hix5hd2_hw_init(priv);
 	hix5hd2_rx_refill(priv);
 
-	netdev_reset_queue(dev);
 	netif_start_queue(dev);
 	napi_enable(&priv->napi);
 
@@ -878,7 +877,9 @@ static int hix5hd2_net_close(struct net_device *dev)
 	hix5hd2_irq_disable(priv);
 	napi_disable(&priv->napi);
 	netif_stop_queue(dev);
-	hix5hd2_free_dma_desc_rings(priv);
+	/* the buffers stay owned across the close; both rings are released
+	 * with the queues when the device goes away
+	 */
 
 	if (dev->phydev) {
 		phy_stop(dev->phydev);
@@ -990,6 +991,9 @@ static void hix5hd2_destroy_hw_desc_queue(struct hix5hd2_priv *priv)
 {
 	int i;
 
+	/* the buffers survive a close: release them with the rings */
+	hix5hd2_free_dma_desc_rings(priv);
+
 	for (i = 0; i < QUEUE_NUMS; i++) {
 		if (priv->pool[i].desc) {
 			dma_free_coherent(priv->dev, priv->pool[i].size,
@@ -1268,10 +1272,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	return ret;
 
 out_destroy_queue:
-	if (HAS_CAP_TSO(priv->hw_cap))
-		hix5hd2_destroy_sg_desc_queue(priv);
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (HAS_CAP_TSO(priv->hw_cap))
+		hix5hd2_destroy_sg_desc_queue(priv);
 out_phy_node:
 	of_node_put(priv->phy_node);
 err_mdiobus:
@@ -1298,9 +1302,9 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	mdiobus_unregister(priv->bus);
 	mdiobus_free(priv->bus);
 
+	hix5hd2_destroy_hw_desc_queue(priv);
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
-	hix5hd2_destroy_hw_desc_queue(priv);
 	of_node_put(priv->phy_node);
 	free_netdev(ndev);
 }
-- 
2.53.0

