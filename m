Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353843;
	b=W8zxcYHc2MRDFRWBPRkBKRw5iEnTr+WmhBngk4V/MKNqx15JhdXKWRaMrf7OMSMiHQLC
	 c35Cj4Xo5k2ax4D7CmuJzlZGbL4jfcwwxpS0Bt3crtB+RcllYO55qxekXsTqqsH/82nU/
	 YUr/i4tuTXb34+v+iPXwiJKQl8Igo1b5Mw6pmd3TSr8ijcHgIE54QOSZ4+yrDvgog6HmN
	 mcVjbZSAmlVRvs7HFKKNH8zPA9rpathtn0WGQzqDLbxAhUwrvbxOse+d8BPHq7L67aKRK
	 Q8sNYMZV9fAi4U0Jl25tzUwPDoJ2L8BS9yMQxTm1As0U7DSVg3AjOoMaLWamwkpttPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353843;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LX1er8W69gZNUPbY/pjrjgdNZyTT7gzY53mg2yQt6WE=;
	b=B0ea35cqhLujNEQYiD1yPLjv6VjQ07w3Toon4yhiINH1177T+FUBQmaE9jEIRgzNZdFc
	 N6Zv/mB/YqQMJOU0RRXB+aCFhHd35i5laOj5CZ0CLOcLPtV+5HSIxrEqVrVbV+uOgSBZY
	 Hsw3UZ77elCjhCSCIwe2Q9K02Wi5Zt5e4Vygb6oOU7U+c6Qtp7Og4Fl6aGo+y1g4YG52J
	 VbpMdlsmVUvd1woy0IZJRxoWbEYk2ShhpuxWxZX099EjlCWGH+jdyZuqBT7W9l9NQalXm
	 ADruG1nxPvd/40QxqVq28oDCc3eTrhnWvJxeYLXhtHRHCuut76IKGp0V9H9zkOxMQWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw67LtmK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF631606A33E;
	Sun, 22 Nov 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw67LtmK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972EA1F000C0;
	Sun, 22 Nov 2026 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353843;
	bh=LX1er8W69gZNUPbY/pjrjgdNZyTT7gzY53mg2yQt6WE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qw67LtmKJYCm1KNf4wobrqCnjN3Sq6JXdFKCGKWb9g1dVaOghe6vzsuebugpsn0tA
	 a8kxJvBKL18Z+ZR66Sv5NZ9bDUg0a/OADpdMKtHJh4cy9+jEA+oXQFg+EcEGn5aIqa
	 LHFCaSbzcxu4tQDT/+Z1Yao0S/5byPs88FyMLkxslOx7W/6v2RVHZ3G9EVmVhcz71g
	 8YCVzsqaP+GXGxa2hm4aC9CtdvgXyfhQtcZU+Qs5Pi1b+R4K/aQhdrjkWQNSr97lUt
	 yVWPXC5jJZI1dHEaCvzAIViHYrSV70QCgt2ObD4xGPQu4MhXMv5VfekDN3kbo+AVOn
	 P6WIBMqOcNcZQ==
Subject: Re: [PATCH v5 net 4/4] net: hns3: fix use-after-free in debugfs read
 during reset/unload
From: netdev-bot+sashiko@kernel.org
To: shaojijie@huawei.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
 liuyonglong@huawei.com, chenhao418@huawei.com, yangshuaisong@h-partners.com,
 ningwei15@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 13:24:02 +0000
Message-ID: <179535384216.3135.13172932788054177257@kernel.org>
In-Reply-To: <20261118130330.3026625-5-shaojijie@huawei.com>
References: <20261118130330.3026625-5-shaojijie@huawei.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The comment on the new `struct hnae3_handle::dbg_mutex` field in
  drivers/net/ethernet/hisilicon/hns3/hnae3.h reads "protect debugfs…

--

net: hns3: fix use-after-free in debugfs read during reset/unload

This patch adds a dbg_mutex to struct hnae3_handle. The enet-layer debugfs
show callbacks take it, and so do the reset, driver unload and ethtool ring
resize paths, which keeps the readers away from priv->ring, priv->tqp_vector
and ring->desc while those are being freed. The readers also check the
device state on every iteration and return -EBUSY when the device is busy.

Closes: https://lore.kernel.org/all/a0853cd9-cab5-441d-b181-8ba97f2f58b0@huawei.com/

> diff --git a/drivers/net/ethernet/hisilicon/hns3/hnae3.h b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
> index 4286af9239b01..e94cc33da8643 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hnae3.h
> +++ b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
> @@ -944,6 +944,7 @@ struct hnae3_handle {
>  
>  	u8 netdev_flags;
>  	struct dentry *hnae3_dbgfs;
> +	struct mutex dbg_mutex;	/* protect debugfs against reset/unload */

[Severity: Low]
This isn't a bug, but is this comment a little narrower and a little
broader than what the lock actually does?

On the writer side, hns3_set_ringparam() also takes h->dbg_mutex around
hns3_init_all_ring(), the memcpy() restore and hns3_fini_ring() on the
backup rings:

> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> @@ -1252,6 +1252,7 @@ static int hns3_set_ringparam(struct net_device *ndev,
>  	if (if_running)
>  		ndev->netdev_ops->ndo_stop(ndev);
>  
> +	mutex_lock(&h->dbg_mutex);
>  	hns3_change_all_ring_bd_num(priv, new_ringparam.tx_desc_num,
>  				    new_ringparam.rx_desc_num);

Ring resize is neither a reset nor an unload, so the field comment does
not mention it.

On the reader side, only the enet-layer seq_file callbacks take the
mutex (coal_info, rx/tx_queue_info, queue_map, page_pool_info, bd_info).
The hclge-layer readers that hns3_dbg_common_init_t2() registers through
ops->dbg_get_read_func() live under the same handle->hnae3_dbgfs tree,
and they never take it.

The commit message says the mutex is "used by enet-layer debugfs
callbacks", but this comment is the only place in the tree that
describes the lock's scope.

Could the comment say that the lock serializes the enet-layer debugfs
readers against the paths that free or rebuild priv->ring,
priv->tqp_vector and ring->desc (reset, unload and ring resize)? Then a
future writer would know it has to take the lock, and an hclge-layer
reader would not assume it is protected.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118130330.3026625-1-shaojijie%40huawei.com
