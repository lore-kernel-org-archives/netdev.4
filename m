Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415587;
	b=xQl584jhnLZIwiATyjAOH+8H94BCtDNF+ZOGHwu3kq80dNpy08ur+6BzuELmlKFs6f5F
	 L0dcdgtZD0h+98kDZbdSfX9bhzHiOzIujisthPhshJNv6bdw030XzZVb/PE1unwavGaSl
	 OJ/XxTUMBwfjUimm+V74iDwzcAMM+VScSqaDW4eBzp0iShPx8wMqjuYpwSKq4CIDCZU8k
	 Fv8Z0paYszNk4Yf6vhAJweq0xJ8CcaN1i9Qex0JBCSpe0jaESB0zdxv6N7VtJmiu/3bmK
	 kJDqOAWiiizr7UcMpPihh6y/vT2HNLl1CiYZJDi9zibw6kzAlo5OyPY6smF5nHjPyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415587;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ht97CK2F6lXhrybpSQlJXorF4sNM+WP3fFW0RZw919Y=;
	b=B/qdD4gIr4QARMRoypNpuVvvhnr5RPfoeTQYSWIEifK1nLLuHLueYSk29yJMghoXtNRN
	 iNIqRKmMFdwu0TgASZ3qdIkPvRZQrR4iewnfGveFkOCK5Y1WpINOw5Z6f8KhKReFCI9aB
	 GewSUYnLO6G4Vzykh6QU0wVbW/L9IxhcHHGxj1C9l7YgnGAdVVDLWLUTqVbyXqfnDdvi2
	 mnu7S9x6Bzs8yBM/n4QOUeriJE3I3vz6XgmUzX5aSsFP25ZBDWKICuWKq036Dwl/QNhQO
	 vtLsoGZfuBdjJU048200ogAZhJk0mMTVMvclxsQTyyEbAEEGKnaEnZY91ifgO6QFJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1hlQBxSg;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443F1606A31A;
	Mon, 23 Nov 2026 06:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1hlQBxSg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ht97CK2F6lXhrybpSQlJXorF4sNM+WP3fFW0RZw919Y=;
	b=1hlQBxSg0hgA2lTNac2LPI6yYs+xEGGV4y8H6OvP8i4rWpbVEjLWxNAoFdQsI9njVgxSs/Z1e
	7Y3gT7Ko+CF9ri1PwtjLUYvDhDnSOt9x5bCKZYxP/IYFpq1VV5Ciar/LzqyyMr0lgHHd2+5n1m0
	BYo0Ne+6kARuHr81lHRcFdY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jXx295s3QzmVYV;
	Mon, 23 Nov 2026 14:32:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 47B4440588;
	Mon, 23 Nov 2026 14:32:56 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 14:32:55 +0800
Message-ID: <0e15bc66-3737-4e6e-92dd-3b54e95e224c@huawei.com>
Date: Mon, 23 Nov 2026 14:32:54 +0800
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
Subject: Re: [PATCH net] net: hinic: Don't fail probe when firmware lacks
 rx-vlan-filter
To: <cai.huoqing@linux.dev>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261116021858.273519-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261116021858.273519-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Ping.

在 2026/11/16 10:18, Jinjie Ruan 写道:
> nic_dev_init() calls set_features() with force_change set, so it
> unconditionally sends HINIC_PORT_CMD_SET_VLAN_FILTER once
> NETIF_F_HW_VLAN_CTAG_FILTER is advertised.  Firmware that predates
> rx-vlan-filter support answers with HINIC_MGMT_CMD_UNSUPPORTED (0xff).
> 
> hinic_set_vlan_fliter() already distinguishes that status and returns it
> without a message, but set_features() treats any non-zero return as
> fatal: it folds it into err and returns -EIO, and nic_dev_init() then
> bails out without printing a sub-error either.  The only visible symptom
> is
> 
> 	hinic 0000:29:00.0: Failed to initialize NIC device
> 	hinic 0000:29:00.0: probe with driver hinic failed with error -5
> 
> and the device stays unusable although nothing is actually broken.
> 
> Treat HINIC_MGMT_CMD_UNSUPPORTED as "feature not available": keep probing
> and drop the feature from the advertised set.  Write netdev->features
> back whenever failed_features is non-empty, not only on the fatal path,
> so the cleared bit really takes effect.
> 
> Fixes: 2acf960e3be6 ("net: hinic: Add support for configuration of rx-vlan-filter by ethtool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/net/ethernet/huawei/hinic/hinic_main.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/huawei/hinic/hinic_main.c b/drivers/net/ethernet/huawei/hinic/hinic_main.c
> index 34ed5ea9e46e..e837140f7c17 100644
> --- a/drivers/net/ethernet/huawei/hinic/hinic_main.c
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_main.c
> @@ -1098,16 +1098,26 @@ static int set_features(struct hinic_dev *nic_dev,
>  		ret = hinic_set_vlan_fliter(nic_dev,
>  					    !!(features &
>  					       NETIF_F_HW_VLAN_CTAG_FILTER));
> -		if (ret) {
> +		if (ret == HINIC_MGMT_CMD_UNSUPPORTED) {
> +			dev_info(&nic_dev->hwdev->hwif->pdev->dev,
> +				 "Firmware does not support rx-vlan-filter, feature disabled\n");
> +			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> +		} else if (ret) {
>  			err = ret;
>  			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>  		}
>  	}
>  
> -	if (err) {
> +	/*
> +	 * A feature the firmware rejects is dropped from the advertised set,
> +	 * whether it was rejected fatally or not (e.g. rx-vlan-filter on
> +	 * firmware that predates it).
> +	 */
> +	if (failed_features)
>  		nic_dev->netdev->features = features ^ failed_features;
> +
> +	if (err)
>  		return -EIO;
> -	}
>  
>  	return 0;
>  }

