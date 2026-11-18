Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007145;
	b=WInfcLdgsqEJZS23e72UQDOgAw31zZYzvVG4ih4cZht1tfO+NizLUChjXjRm+Aucn6Ix
	 Brjre4UypA6YJHo3zLzMcSF+tVov4Von8OYHrbvf3JZT7nujwUbgS7oRKu5ckQLXcoTEf
	 8KsS/uCgZYfwqI5UtEEVGZrkWDurLNyM40tPaX/pM7r4pqxC+8xMgt5Sf+k9LzK8WVKYF
	 WZIed+NRxZF/6byG93lNrYQO/hJ4DDwG0QLI3Y8x3XnMz3BHUOEy184iRNfVgxqiu63Y1
	 Ecgto/H+4HVVV/V30SYK24/kcwrYO7DZcgaBOK8mTVWvq+xLLxgpwToIw+nd4c7SdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007145;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=naiBqHs068Zxv5V19PUf8j4ZVdFJjxSgOON42GHeBeg=;
	b=hlU1WcQluya90tyHJbHK2buJB+0Ce6K3fSyJIYTRJMlDK7xCEn8iqw4rLXeYYA+7xfjF
	 teGUzIH39PynnHOYfn6TQZ7dQB/TrdyxoEzdFazh2CcGxuXNj6E9zM9PA0b78EJcCRq7j
	 1K7lyDwMK/eWtX1ISoHtA8fY4geycq/trm3HsDChnu1MXSn7NGVDqUdHNsivNmw/Cv7Te
	 o4mSvUn/GDvUJvH5p1frbmIVqQPIcCvg/UJYPgGdVQti6bO+q4/El3MSCW06WFXWPiYtL
	 zJQyjyevQsEoXhBxCDEwM2l+i9KUq2x9z1LnuAFEyk7EG2TXqgFUuFZdoBi52HJBdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="GB0W/tIk";
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D19606A325;
	Wed, 18 Nov 2026 13:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D19606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GB0W/tIk
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=naiBqHs068Zxv5V19PUf8j4ZVdFJjxSgOON42GHeBeg=;
	b=GB0W/tIkMohQ9KbXwYB//oqZtq/F87LPkcRCg3lxmIXDapRRxKYZki9hzQEDoiMgxkwnRNfLf
	ylNlUMb84Cb2+oqu6pdDoiMOFJN+pssFqSqDqLjbprd18ioQbNNCk4HXFcAtJuA/QhuiN2S/U3y
	qB8PV3TuBJzlSfCGUBj/jk4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jV1zh4nB6z1cyPx;
	Wed, 18 Nov 2026 21:05:20 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 999E040565;
	Wed, 18 Nov 2026 21:05:40 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 18 Nov 2026 21:05:39 +0800
From: Jijie Shao <shaojijie@huawei.com>
To: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>
CC: <shenjian15@huawei.com>, <liuyonglong@huawei.com>,
	<chenhao418@huawei.com>, <yangshuaisong@h-partners.com>,
	<ningwei15@huawei.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <shaojijie@huawei.com>
Subject: [PATCH v5 net 1/4] net: hns3: fix vector resource leak in hns3_nic_alloc_vector_data
Date: Wed, 18 Nov 2026 21:03:27 +0800
Message-ID: <20261118130330.3026625-2-shaojijie@huawei.com>
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

When devm_kcalloc() fails for priv->tqp_vector after get_vector() has
already acquired MSI-X vectors, the error path returns without calling
put_vector() to release them, leaving the hclge/hclgevf bookkeeping
(num_msi_used, num_msi_left, vector_status[]) inconsistent.

Call put_vector() for every acquired vector before returning the error,
and reset priv->vector_num to 0 so the count never describes vectors
that were already handed back.

Fixes: dd38c72604dc ("net: hns3: fix for coalesce configuration lost during reset")
Signed-off-by: Jijie Shao <shaojijie@huawei.com>
---
Changes in v4:
  - Correct the reason for resetting priv->vector_num.  Sashiko pointed
    out that hns3_nic_dealloc_vector_data() is not reachable after
    hns3_nic_alloc_vector_data() fails, so the reset is not protecting
    that path; it keeps the count from describing vectors that were
    already handed back.
v3: https://lore.kernel.org/all/20261030095633.377289-2-shaojijie@huawei.com/
Changes in v3:
  - Simplify commit message: drop the accumulated-leak consequence
    paragraph and clarify that the vector_num reset avoids a NULL
    deref in hns3_nic_dealloc_vector_data().
v2: https://lore.kernel.org/all/20261021121426.3096838-2-shaojijie@huawei.com/
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index db4f584c4ce1..e2fb5899bba1 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -4851,7 +4851,7 @@ static int hns3_nic_alloc_vector_data(struct hns3_nic_priv *priv)
 		devm_kzalloc_objs(&pdev->dev, *priv->tqp_vector, vector_num);
 	if (!priv->tqp_vector) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_put_vector;
 	}
 
 	for (i = 0; i < priv->vector_num; i++) {
@@ -4862,7 +4862,13 @@ static int hns3_nic_alloc_vector_data(struct hns3_nic_priv *priv)
 		hns3_vector_coalesce_init(tqp_vector, priv);
 	}
 
-out:
+	devm_kfree(&pdev->dev, vector);
+	return 0;
+
+err_put_vector:
+	for (i = 0; i < vector_num; i++)
+		h->ae_algo->ops->put_vector(h, vector[i].vector);
+	priv->vector_num = 0;
 	devm_kfree(&pdev->dev, vector);
 	return ret;
 }
-- 
2.43.0

