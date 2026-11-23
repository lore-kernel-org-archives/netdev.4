Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419825;
	b=VkfprUNVPiDoiHkgKBpTa2SDyn7d4L/Wpy84Ltgo+hOj0wgK+BQGnz6SxtxBpgIJdFVf
	 0XGYY44rGZyxp3rIRvZW8pLkPrE20xU63h2pRWI7eXwN5/MJW0rbtyPYxCz6tYluNBsxO
	 +IOTsonMSkywkb+3CFiEXCtLssrjCI3o0VIriLmOlLbQkHuu+Ja/uw0/oJGAjeFKUIZUa
	 P6j3lvLp+zycbYH8dsN3YmFGmxIMxWHZXN0S13MLSkcw6S13LTP7/Q43ZPmVKfXHuuOP8
	 oclt7Ogvvmhfz1ykpXddEpvyStM2RVsc0hCRvMAeCvHvVQTQGg8Qo0h0CfrHKqtZUxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419825;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6j9uy6DpUm+FCCeQ0QSmVenyXc1ejPJ0OyDcAi7hXiA=;
	b=vUj8hCuRoe/jFz1TW/vG1hY69blsdJhr60JfjNyfNACUk5Wv0Ru16NuehNCaqK5CV8w0
	 6EmWaERYbYJ11izyNM7clDCLTbtwZEDI55WHFSVnSCLO/gCN/WT//m8T1uE1WU+vq/wZn
	 7iZh4ouShPTTm76Fvl6fnaORnAt/qMV7kMRhbSrkQGFYAa9KNtdd5Y60lQDeLhVh/+2HS
	 KTNk+ueSv7BwqYe5l47bN0xAHe+1bCnWOIT3Fe0UrOYYm01ZOejsvUhJBM5ZBgNw45JxW
	 eA1gNfNKdkfYP1/d2TDxRYsGDKkTJEZLl+oyFPws06ccyLocuErgVs63jstwF+0v+Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BSMKH+a5;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07726606A31E;
	Mon, 23 Nov 2026 07:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07726606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BSMKH+a5
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6j9uy6DpUm+FCCeQ0QSmVenyXc1ejPJ0OyDcAi7hXiA=;
	b=BSMKH+a5Oe1r9ZTzRbMJt/CRzzmm36loU/chsZd9oX5OSLT5yGFoPznBXlJSTe5CbDz2t5JwN
	4YTEx+HTMOoSV2Jb2ENWbahGUTxSi//No8lmvTMFlqyxr2h57JVW/G9qnLOzj9c3Bc+UwsJzYLa
	cpQM+HH0T8O7+sTOaGt7ddk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jXybk31LjzKmTk;
	Mon, 23 Nov 2026 15:43:14 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id CFC604057C;
	Mon, 23 Nov 2026 15:43:31 +0800 (CST)
Received: from [10.67.121.233] (10.67.121.233) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 15:43:31 +0800
Message-ID: <d62f3532-5bc5-45aa-98c6-90a253c7bcb7@huawei.com>
Date: Mon, 23 Nov 2026 15:43:30 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <andrew+netdev@lunn.ch>,
	<shenjian15@huawei.com>, <liuyonglong@huawei.com>, <chenhao418@huawei.com>,
	<yangshuaisong@h-partners.com>, <ningwei15@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 net 4/4] net: hns3: fix use-after-free in debugfs read
 during reset/unload
To: <netdev-bot+sashiko@kernel.org>
References: <20261118130330.3026625-5-shaojijie@huawei.com>
 <179535384216.3135.13172932788054177257@kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <179535384216.3135.13172932788054177257@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo500018.china.huawei.com (7.202.195.199)


on 2026/11/22 21:24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The comment on the new `struct hnae3_handle::dbg_mutex` field in
>    drivers/net/ethernet/hisilicon/hns3/hnae3.h reads "protect debugfs…
>
> --
>
> net: hns3: fix use-after-free in debugfs read during reset/unload
>
> This patch adds a dbg_mutex to struct hnae3_handle. The enet-layer debugfs
> show callbacks take it, and so do the reset, driver unload and ethtool ring
> resize paths, which keeps the readers away from priv->ring, priv->tqp_vector
> and ring->desc while those are being freed. The readers also check the
> device state on every iteration and return -EBUSY when the device is busy.
>
> Closes: https://lore.kernel.org/all/a0853cd9-cab5-441d-b181-8ba97f2f58b0@huawei.com/
>
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hnae3.h b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
>> index 4286af9239b01..e94cc33da8643 100644
>> --- a/drivers/net/ethernet/hisilicon/hns3/hnae3.h
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
>> @@ -944,6 +944,7 @@ struct hnae3_handle {
>>   
>>   	u8 netdev_flags;
>>   	struct dentry *hnae3_dbgfs;
>> +	struct mutex dbg_mutex;	/* protect debugfs against reset/unload */
> [Severity: Low]
> This isn't a bug, but is this comment a little narrower and a little
> broader than what the lock actually does?
>
> On the writer side, hns3_set_ringparam() also takes h->dbg_mutex around
> hns3_init_all_ring(), the memcpy() restore and hns3_fini_ring() on the
> backup rings:
>
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> @@ -1252,6 +1252,7 @@ static int hns3_set_ringparam(struct net_device *ndev,
>>   	if (if_running)
>>   		ndev->netdev_ops->ndo_stop(ndev);
>>   
>> +	mutex_lock(&h->dbg_mutex);
>>   	hns3_change_all_ring_bd_num(priv, new_ringparam.tx_desc_num,
>>   				    new_ringparam.rx_desc_num);
> Ring resize is neither a reset nor an unload, so the field comment does
> not mention it.
>
> On the reader side, only the enet-layer seq_file callbacks take the
> mutex (coal_info, rx/tx_queue_info, queue_map, page_pool_info, bd_info).
> The hclge-layer readers that hns3_dbg_common_init_t2() registers through
> ops->dbg_get_read_func() live under the same handle->hnae3_dbgfs tree,
> and they never take it.
>
> The commit message says the mutex is "used by enet-layer debugfs
> callbacks", but this comment is the only place in the tree that
> describes the lock's scope.
>
> Could the comment say that the lock serializes the enet-layer debugfs
> readers against the paths that free or rebuild priv->ring,
> priv->tqp_vector and ring->desc (reset, unload and ring resize)? Then a
> future writer would know it has to take the lock, and an hclge-layer
> reader would not assume it is protected.

It states what the lock is for.  I think a struct member comment isn't
meant to enumerate every path that takes it, and covering the main cases
should be enough.




