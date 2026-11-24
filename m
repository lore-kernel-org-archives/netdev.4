Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489802;
	b=IiMVoNWKWY26KfVT4Q+Py4aNm5j+6KuKCO0McHLXdUz0hlnE/s0CkZSIBwQtkccKtosd
	 JLcx8dRjrOkTgt0vjF5R6pFy5xqxEZ0dSUkrcZO+DTfST/SqSQHW25hJ2Xb2PmfsFVOQP
	 +PpFAt3TnQ/3j55pLPhD2R41m0M9XuM2vHzTp3hT67IbLsYEymNWD/dOFMGIsTqTMSU7M
	 USAVWU2kDs6ll5wy0/9AC1jMlCOv6Tk5qkE7x0qonxzMTJflk68ciR7okNWXa7FGVklVQ
	 vPyq5ewdwtSyRVWyLa1LAB3QZ0tfBW9XXclO4i03RDf0kJGWWi2f6XsvicJxjH0qxpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489802;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=W81H+TE49/3IgkadsaNJ+lmJwBEtLVh0c4H0G361Jws=;
	b=s5iuTro0TOkNXIU9ohJZUYAjVoDxAiLJpfA38qyEgI3RcjIEOd/La7De8Y1ZigkcDKJy
	 TVB6sCMVIKR7yVV1c99nz8NZtmUEbn2G7yxNXR+xBYepodOdXNiMkI5C6U+SIibjFW1IE
	 b2m1NJrAVbtsyyoMsg1wzMlW9FHsoogzFZBoUBcWYS/mGN67xXHAy3kr65iSxdeSY6yQX
	 NbOV90GtoPduoYxuCtsRv8rLtlIhTql8AK6INov5tt0yOB9gIb3wFLHMD7v2aN1DTdH52
	 Awqg+h+pPPss3bIVgZEgbUL9lFi/c6HVhY9SFnW0OCOz5RNtZHlI01QM5UF6udnk4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="yW5vl/oT";
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1E606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yW5vl/oT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W81H+TE49/3IgkadsaNJ+lmJwBEtLVh0c4H0G361Jws=;
	b=yW5vl/oTVhbdB2KKqlncFTAGw5qeV3RSnElOFCOCXZFrxLbWHI2/4MIjb7ihKV2elYJVDIPuU
	wV2JpJRxx6ms62GLtkeVPFR55E188TH/Hf38amLrkr6GvZNlm6C125dC3u36HoX4SuJLhUxzD1O
	FYYfcdamqVKDH7wD8DrzfDQ=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jYSTQ5ts7zmV8H;
	Tue, 24 Nov 2026 11:09:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CD28D40572;
	Tue, 24 Nov 2026 11:09:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 11:09:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <cai.huoqing@linux.dev>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net v2 2/2] net: hinic: Zero-initialise the VLAN filter request
Date: Tue, 24 Nov 2026 11:09:46 +0800
Message-ID: <20261124030946.1229396-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124030946.1229396-1-ruanjinjie@huawei.com>
References: <20261124030946.1229396-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

struct hinic_vlan_filter is filled in only in part: func_idx and enable
are set, while status, version and both reserved arrays keep whatever the
stack held.  The whole structure is passed to the device as buf_in, so
those bytes are sent to firmware.

Initialise it to zero.  Requesting a VLAN filter change is rare, so the
cost is irrelevant, and it keeps reserved fields from carrying garbage
across the management channel.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_port.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_port.c b/drivers/net/ethernet/huawei/hinic/hinic_port.c
index ad271d7aa52b..dda545aba1c7 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_port.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_port.c
@@ -452,7 +452,7 @@ int hinic_set_vlan_fliter(struct hinic_dev *nic_dev, u32 en)
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
 	struct hinic_hwif *hwif = hwdev->hwif;
 	struct pci_dev *pdev = hwif->pdev;
-	struct hinic_vlan_filter vlan_filter;
+	struct hinic_vlan_filter vlan_filter = {0};
 	u16 out_size = sizeof(vlan_filter);
 	int err;
 
-- 
2.34.1

