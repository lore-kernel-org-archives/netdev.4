Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542193;
	b=34JMGm/zoRtWPo/i9lUxXcJX4aB30yoWS6/naanTe7v0u5V3VmCucyoqi0MBBVmr/cQj
	 nOt/jcTboCkUWacAAUoLckvqcgoUrQPmwVv2H0mcd4iIipcxi4nn/iMEhuHiOu0svh0nm
	 707afUXk7+Fi8luYEQ3vaPFo39eY3sA9BRvKpAh8tjXl9Xm0bS0FD9WPBL7TUhMqYDPDo
	 g2smULFNqmJrKH9Nt8N0sCALgH1x6E6KP+JlWEb+XJxSngQ232BCFb51XIxJBtmUkzM4o
	 hI1zKkqFgKDx9qd8WlQ0ixIlL6RBjr4PsrpLoTonBllk2KuySNQNHeClRnrpD2IewUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xf7+cxVSKPM2QfTjbLKjCF2toHqdxNlQK1uMknroaKI=;
	b=fDtmlIkfHHBKdA35WrAYIbEijYg19sr60M2KD/6XcaTIHL823S2v4ZF7padTYfE/FUGF
	 0wy55rCZsAwG1P4ZPu25VNCi71+X0HF9pdPLF86Vy04kN/F3CsfXyJ2Ff5DlY9LvnipWS
	 iKz18VxCLVIRx4SDz2+kBKRaewempE2bMQF3UZRBXKht35nPEIb98cPrhmCwT20s3xm5M
	 pvR/+Hn4j79hz7J9zXJCb7+8f+URoQxfuOkPlliUxc8a9j9jNQ5E1AYxIOwyNUZ0sLx3O
	 P6Alb7gGUNuJszDAA+AmucI3z7lKWflWnaylXQqqGsOWlqNuVScxXEu1oWnBNlS4vOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fIt/ZARi";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C1606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650C1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIt/ZARi
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so6105199c88.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542192; x=1796146992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf7+cxVSKPM2QfTjbLKjCF2toHqdxNlQK1uMknroaKI=;
        b=fIt/ZARideSOcZVprOCE+tjFg0lXYd46179JTXE/7fY8f7P45KZS/17ZNc9Q14PXS4
         Uag2WRlSAaSwU4mDrbf/udBd82WEha4JHovzLtvgJIxje0GQulD6UVuSr5WdZ88Yr8Fv
         WfhBAZyS5JqkRravt05wVHFJQZB2ErOeBkiRj2BIlFp40vzZjmWobibOeHqiLWUbm1as
         a6dPk/osU0kC4ZucvbS/DufuhpxNbKPgkhLaypUcTBUmPxoz+M7dUizOjag9O3bOocs/
         wiG40vh5Ys1eybXFcNrFFai1HkEpXeokFRVNP5NNAI27P3hWgZ+UgJxHFglsjPMYlQIA
         woxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542192; x=1796146992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf7+cxVSKPM2QfTjbLKjCF2toHqdxNlQK1uMknroaKI=;
        b=C5MEXPP7JG6Ky4t6waFxnvvsKrySRXgMYYSrK/cCS/YNojnCBwILADTt80//EEzVXJ
         KcoBphfF8dg7sWlvWPJVPmgf2wOJe+kyUy7yPzo8+YDqWv6hSwdo1kYrvdB0IOQgUhcI
         8WETDS/oRLgfDaKr1vnQr3xRFxYYSrEiv0hwN6ZyfJyuyV3JQQNco+xDqIfDuYnGffAq
         hd8blyjplS46NkNXWEqlDZq3yYBt/I7U9JOAQQNRBoIEveK2sTy36YUKT0VUmpUp0T2W
         74C+ZS3Y4FtiFjwOGVFDPMXFZuYmzduYcseMiMWof6mElyLlYsOSEJ+nYSzmjCQ5u2XY
         QS5Q==
X-Forwarded-Encrypted: i=1; AL+hErEzgjpUO4yGePY95NGkEBKFWqGIwPwcPUEdp5vVaIXl7w2GHKygcLKackql2/e6o5nCbh04944=@vger.kernel.org
X-Gm-Message-State: APuU4Z98q73WkrKXQa1dbYugxeJmry8orBigFF/43UcFETsc6giN2QFJ
	vsdRuPA1kSGBLoVrVsK/lrEWg6tj9jIRuzZ8I7lsWNFUXZzLk7WIwINY
X-Gm-Gg: AZFdTZdBNj+Vq7+7uDeoVRB2Ir6pHaFheYZCScLNXZ19anZJ4Tn8XCnzjzOJUUCNGAs
	WqaS/rgPw2XampuZxB9RGByLC0nG+bfNn5M+rppvNaEneAdlWldv9qcJacoq3vGDaG6puemTCH8
	PleFisDKVXOtJhfIgIkEHOSUIE99Wd7BrXbwixidSvc8znMb6IsyWQe2hnQ7SZkbD9+deSzBL7Q
	m4fyjbj4d5QgQNvYYsvLxktcQEFVLbVs8SBjFMlyLNPfjl+VKh7wDu9xLV9vomT1Yp1sh0npPA7
	OuulYeIINqVLACCUbNTyTRvgfJIGtfHxpuSWQQju9gUgIRP+RvZwhmY71zcnS/BRNUk5/pwOeGO
	l0Py9TvBSUhQigvXKE2tEnW1n7CYl1s0upGlhxrHvNKhLDmSyZhpKogRL0fKo7B7lHn7Rc13WE4
	yGqKu6cfRDKj2tOSxFgNqFlmfHcwTdgE/WGsYt9DRcHvvf8wjxEck/j2KujnHpVQ8BaKIoV/iuB
	/9T4QkE36tV919fNH6kjQ6AL2Hwm1wAK4Eb+JCSVDvTnMmIIFd2+actL9o1fdvI62tKAfLY5CrR
	Se3KPhF23Gt1OHLpXG94sXuYTsR7z2bLLSClCrnx75BzhbepuwiZhiQldNcVtVd5aIB4Owlo2cA
	ccV2Q+FH7kNeXEydL
X-Received: by 2002:a05:701b:4594:10b0:1b5:17c5:9f61 with SMTP id a92af1059eb24-1b55df5ab00mr12145648c88.0.1795542191731;
        Tue, 24 Nov 2026 09:43:11 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::4:a974])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm35604485c88.15.2026.11.24.09.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:43:11 -0800 (PST)
Message-ID: <78dbd822-291c-490d-9f4f-15de0b44de78@gmail.com>
Date: Tue, 24 Nov 2026 09:43:10 -0800
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
Subject: Re: [PATCH net 2/4] net: add netif_disable_subqueue()
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org, bjorn@kernel.org,
 bobbyeshleman@meta.com, almasrymina@google.com, daskald@meta.com,
 netdev@vger.kernel.org
References: <20261121033215.1020506-3-dimitri.daskalakis1@gmail.com>
 <179552362454.3135.13950803840518714648@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179552362454.3135.13950803840518714648@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/24/26 4:33 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message for "net: add netif_disable_subqueue()"
>   describes the patch as only adding a new helper ("Add a helper like…
> 
> --
> 
> net: add netif_disable_subqueue()
> 
> This commit adds netif_disable_subqueue(). The helper stops a single TX
> subqueue while holding that queue's xmit lock, so ndo_start_xmit() is no
> longer running on it when the helper returns. The commit also rewrites
> netif_tx_disable() so that it calls the new helper for each queue.
> 
>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>> index 435be7880d7e5..e716b98e8b4c8 100644
>> --- a/include/linux/netdevice.h
>> +++ b/include/linux/netdevice.h
> 
> [ ... ]
> 
>>  static inline void netif_tx_disable(struct net_device *dev)
>>  {
>>  	unsigned int i;
>> -	int cpu;
>>
>> -	local_bh_disable();
>> -	cpu = smp_processor_id();
>> -	spin_lock(&dev->tx_global_lock);
>> -	for (i = 0; i < dev->num_tx_queues; i++) {
>> -		struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
>> -
>> -		__netif_tx_lock(txq, cpu);
>> -		netif_tx_stop_queue(txq);
>> -		__netif_tx_unlock(txq);
>> -	}
>> -	spin_unlock(&dev->tx_global_lock);
>> -	local_bh_enable();
>> +	spin_lock_bh(&dev->tx_global_lock);
>> +	for (i = 0; i < dev->num_tx_queues; i++)
>> +		netif_disable_subqueue(dev, i);
>> +	spin_unlock_bh(&dev->tx_global_lock);
>>  }
> 
> [Severity: Low]
> This isn't a bug, but the commit message only talks about adding a new
> helper:
> 
>   Add a helper like netif_tx_disable() (which drivers commonly use
>   when stopping the interface) but for one queue.
> 
> It doesn't say that netif_tx_disable() itself is rewritten here.
> 
> The old body disabled BH once, read smp_processor_id() once, and used
> __netif_tx_lock(txq, cpu) for each queue. The new body uses
> spin_lock_bh(&dev->tx_global_lock) and calls netif_disable_subqueue()
> for each queue. That helper does its own nested
> __netif_tx_lock_bh()/__netif_tx_unlock_bh(), and it takes the queue
> index as u16 rather than the unsigned int loop counter.
> 
> As far as I can tell the behavior is unchanged. Still, every driver
> calling netif_tx_disable() on its stop path picks up this change.
> 
> Could the commit log mention the conversion? Something like "Convert
> netif_tx_disable() to use the new helper, no functional change
> intended." would be enough.
> 

If this series needs a re-spin, I'll address the change in the commit msg.


