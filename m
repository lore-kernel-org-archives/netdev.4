Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007145;
	b=Q2I4WHHCR3sfiNBFi17ERp8jX7G2y11eZF9mIvmQTJOKKE1dnkI9RP3lp/JdIUFYwuu8
	 U2zXrSm68e7opyd5FQQtns3+MZQ2iPgjHVolEs8d3TKmToSDUJpuqzkLy3wYS7aoFMFQ3
	 lSl5lPwEs8Eizxup0yzrnIurYocYs07WD7Ec5dgFuiZWzvqzN/txVFC/6yvQrXQr7bPkY
	 A/Uo4zbOy5b0WZFWfV9ZYHzfHzqwCcZqxE8b+hwIpt4bytHnNbC1uBbaAzyfjk5MY9kT9
	 z78JQi3voVNOfKUdSNTIWyRKKP6CSwcE4soXbopXiaaPkep4RsORRYGwUEkjfALQZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007145;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VeOCToQhXXAcU/itWlymf0wSgjZWlKTMxry9VxrV/i0=;
	b=TQACYjHSGjxkkekW3d/3++05iILTSTFECl1co9xZ/Tn0OpU07zPFDgi+lDyQgY91PkQj
	 cWAnJvF6a2iO2tlugaCAsF8W8JSz4P1oqrpjToSste0SrsaZmIPdqEkvXXs0B5CyrjTwC
	 1K2GCN/JWfkc8wT5T9zuF80KwhbSiDh24kei8YynmQ9HLFgk+Zk6CLjokiO14wWYBrchE
	 1rFUUNNZ2TYp3hzPlD3qUMSCoifUahhOTKkJGUmCFEAlqsrsMd5jNMFjVYT+mhWVx1Vrd
	 0Qk3hsiDInjWWbWrkb+SBAp2x7zubql58nuPX0F9+Tww5sBtsOARYMP/6b8h3UhGPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VBs8mY9b;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABA606A31C;
	Wed, 18 Nov 2026 13:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6ABA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VBs8mY9b
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VeOCToQhXXAcU/itWlymf0wSgjZWlKTMxry9VxrV/i0=;
	b=VBs8mY9b4vv4gqVdcht0HsCpLPabrnMZw11+HT+trDcCbC6XOqGAxMk3G76623Ez9pkHtLXg4
	nJGIbg7UqcGI7Lzkcf4GsUfCT7fOaBbvKbrHJtwM3gEFU9Z5jbz948Y4Ar5NI72CHI/pGNAJAMu
	Xd1x8TyjKE+SCBhPEd3U5xc=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jV1zj3vqvzmV6w;
	Wed, 18 Nov 2026 21:05:21 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AE704056A;
	Wed, 18 Nov 2026 21:05:41 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 18 Nov 2026 21:05:40 +0800
From: Jijie Shao <shaojijie@huawei.com>
To: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>
CC: <shenjian15@huawei.com>, <liuyonglong@huawei.com>,
	<chenhao418@huawei.com>, <yangshuaisong@h-partners.com>,
	<ningwei15@huawei.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <shaojijie@huawei.com>
Subject: [PATCH v5 net 2/4] net: hns3: fix page_pool leak in hns3_alloc_ring_memory error path
Date: Wed, 18 Nov 2026 21:03:28 +0800
Message-ID: <20261118130330.3026625-3-shaojijie@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118130330.3026625-1-shaojijie@huawei.com>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo500018.china.huawei.com (7.202.195.199)

In hns3_alloc_ring_memory(), when hns3_alloc_ring_buffers() fails for
an RX ring, the error path jumps to out_with_desc, which frees the
descriptor ring but does not destroy the page_pool that was just
allocated by hns3_alloc_page_pool(). The page_pool and its pages are
leaked.

Destroy the page_pool in that error path as well. The pool is torn down
before the descriptor ring here, which is the opposite of the order in
hns3_fini_ring(); that is safe because hns3_alloc_ring_buffers() has
already detached every buffer it attached, so hns3_free_desc() walks
descriptors whose dma is zero and never hands a page back to the pool.

Fixes: 93188e9642c3 ("net: hns3: support skb's frag page recycling based on page pool")
Signed-off-by: Jijie Shao <shaojijie@huawei.com>
---
Changes in v4:
  - Name hns3_fini_ring() instead of the non-existent
    hns3_free_ring_memory(), and drop "mirroring" because the destroy
    order differs.  The pool is destroyed before the descriptor ring
    here, which is safe because hns3_alloc_ring_buffers() has already
    detached every buffer.
v3: https://lore.kernel.org/all/20261030095633.377289-3-shaojijie@huawei.com/
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index e2fb5899bba1..5677e32fc3da 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -5075,6 +5075,8 @@ static int hns3_alloc_ring_memory(struct hns3_enet_ring *ring)
 	return 0;
 
 out_with_desc:
+	page_pool_destroy(ring->page_pool);
+	ring->page_pool = NULL;
 	hns3_free_desc(ring);
 out_with_desc_cb:
 	devm_kfree(ring_to_dev(ring), ring->desc_cb);
-- 
2.43.0

