Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665523;
	b=fHZASATHMaRci/A6RlqZ2IDLk7pvTffB+th3Skq49/s/kS+e3o1WTqKfMYeghyBIYMyp
	 MySS5n3RddwER/Pq0SUJV+WVYsB815rBKfjgIjuOPa0UI/YGocL1nfBd7goa/7LCoAOsN
	 VLmTF3+jeWh+913hzskW0OAqY+dLrRP8+RaJTRQmqYR2OU2IzUDpCH5mCWL6VQ8qhyGCp
	 faT1qskzVSte7o4Y1r4bhk+ZZQjbKDMng0kLIfYqD0sBcq/Ihlil/1j+7Qmkokm7vINvo
	 EuL6wwGuHNOCOoXZNiAhcUr1TvnRjwuD4MavD8kf+KTkqhNIHeVRk+ppZbEiDzX5ULQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665523;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=SSdAMFmYjKhW0Vnndgpluzm+aSjz54H3b9il23oofj0=;
	b=RfocE2PovGin3vK8fhdC+fLzuHwGkAKTuakCDOliM6fQmyLmwWVcUc1bNRZtq5JrH1Zt
	 yp9hBgGBYox0900k1JF/+12UV4VNsNefRUjiC6LuhLhf28rWEjcO5pRZazHeryEv5t/sZ
	 HvBzDMRqlugezcohxtAQ8gI0CVRXzBT5VKwseqW+Xa+bDxn7TTmJaolSxtI3d44oZZw6w
	 62CKTpVl+2TPOwB3YfVUMMyiQ2QAfxQ3dlNmQQFCOlW+8BQj7STBSlgQDVqsRvk/wSiuG
	 DzKzR/Qy52WMs5rfjsdhJdxKqW5OdpUEpqSGuZ/ZTqaDwX3X1zir9xgupSyFdsWHHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UUjqLU5u;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A77B606A31C;
	Thu, 26 Nov 2026 03:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A77B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UUjqLU5u
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SSdAMFmYjKhW0Vnndgpluzm+aSjz54H3b9il23oofj0=;
	b=UUjqLU5uE3Kx2EGRpLTMcrCie3lUv6EiOJKZpOTfCbYWM9lF1cVjvgDFnY4Kltjgjmc7e+EZY
	YekKeeZEcN3eZinnDZ7iYUh0/+UZq+EG0fPjSlElM77VQeK7QKwy1gQaaUkdXQ1+sOV7L+vIkrr
	h072KXuKRQPzKEgyzIu/sXA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jZjSg5ckTzRhQT;
	Thu, 26 Nov 2026 11:58:11 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id E47C040538;
	Thu, 26 Nov 2026 11:58:30 +0800 (CST)
Received: from [10.67.121.233] (10.67.121.233) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 26 Nov 2026 11:58:30 +0800
Message-ID: <5ea6843d-14c9-4c0c-be1a-4e7926f771bf@huawei.com>
Date: Thu, 26 Nov 2026 11:58:29 +0800
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
	<kuba@kernel.org>, <andrew+netdev@lunn.ch>, <shenjian15@huawei.com>,
	<liuyonglong@huawei.com>, <chenhao418@huawei.com>,
	<yangshuaisong@h-partners.com>, <ningwei15@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
To: Paolo Abeni <pabeni@redhat.com>, <netdev-bot+sashiko@kernel.org>
References: <20261118130330.3026625-4-shaojijie@huawei.com>
 <179535384062.3135.791733868582964041@kernel.org>
 <a727a596-2718-4aaa-8baf-69b1aee9df43@huawei.com>
 <3766f988-9ea9-4ead-870f-fab0549e15b6@redhat.com>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <3766f988-9ea9-4ead-870f-fab0549e15b6@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo500018.china.huawei.com (7.202.195.199)


on 2026/11/25 22:31, Paolo Abeni wrote:
> On 11/23/26 08:33, Jijie Shao wrote:
>> on 2026/11/22 21:24, netdev-bot+sashiko@kernel.org wrote:
>>>> @@ -4489,10 +4519,15 @@ int hns3_clean_rx_ring(struct 
>>>> hns3_enet_ring *ring, int budget,
>>>>        * FBD number with head pointer
>>>>        */
>>>>       if (unused_count > 0)
>>>> -        failure = failure ||
>>>> -              hns3_nic_alloc_rx_buffers(ring, unused_count);
>>>> +        failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>>>> +
>>>> +    if (unlikely(failure))
>>>> +        hns3_ring_set_oom_state(ring);
>>> [Severity: Medium]
>>> Can rx_oom_cnt be incremented twice in a single NAPI poll here?
>>>
>>> The commit message says the counter is "incremented for each NAPI poll
>>> that hits an RX allocation failure". When the fraglist napi_alloc_skb()
>>> fails in hns3_add_frag(), the path looks like this:
>>>
>>> hns3_clean_rx_ring()
>>>    hns3_handle_rx_bd()
>>>      hns3_add_frag()
>>>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ */
>>>        return -ENXIO;
>>>    goto out;
>>>    failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>>>    if (unlikely(failure))
>>>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ again */
>>>
>>> -ENXIO doesn't match the new err == -ENOMEM check. But failure can 
>>> still
>>> be true, either from a failed exit refill or from an earlier failed
>>> in-loop refill. Under the memory pressure that caused the fraglist
>>> failure, the refill is likely to fail too.
>>>
>>> hns3_ring_set_oom_state() has no per-poll dedup, so in this case the
>>> counter goes up by two for one poll.
>>
>> The second increment only happens when a second allocation actually
>> failed.  hns3_add_frag() counts its failed napi_alloc_skb() and returns
>> -ENXIO, which doesn't set `failure`, so the exit refill still runs and
>> bumps the counter again only if it fails too.  Two increments mean two
>> failures.  I agree "for each NAPI poll" can read as at most once per
>> poll, that's just imprecise wording.
> I agree another repost is not needed here. However patch 1, 2 and 4
> are net-next material and only patch 3 is borderline net material.
>
> To avoid a repost and splitting, I would apply everything to net-next.


Applying the whole series to net-next is fine with me

Thanks,
Jijie Shao


