Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519593;
	b=ahC1Sw99IqnDz8fOd6/mocbAHcCc62AEa0S91h2hzKHlpOFwnO1rPC3v78TLD6U4BxvD
	 SVtmcMbSUJRgRHFd1B234oR/iOud4RKo7yRaD1SIIGc8cZ/s+9aTHpQnAxVRUQu2cW+jZ
	 3DrNJuExxP+RmBi1VMPUQ9FILYulVUNhZxB+KBspakKz+Fmasqofxh6Hr11Pe1TGEqpoV
	 lJnoVpctx/9AxD+tMBopTvw4F9iH+3gB76ltAQPRdiHZ/v/ODmXDYXfZaP1UZlVw2284K
	 IFPB4NfrbqnEKYZJfJ076ytxkFMh/2QHynjPC4YPwAW1xro82w9t5y6x2x3P5S1/YlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519593;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
	b=SWK4goJmVoEaWRC1yPH3gduh94gMY4Si+NYCEDnO/LHspMqIHrQXZ72m0HqvDzMbdFU9
	 YN4I47vEp1aT8OBiSohwYSKmLQALShZimV9MV6iqjYXl6FzIC6ETb6/S/+cwFX2hGOiiD
	 7H5LYaLu5BWfg7rWRydxBRiz4sZ4xc3Af9rc9S7lyxss6it+RnJn5YjdFfZBEB2eXSCUE
	 Azc/et7uAsu2mGdQ7P8HDms5EGUl5OX/t0ysSNX+73XIa+vK489/9dXDH1Yl3M7Zn0oot
	 bqakiN/KR+NrTPCKwWPptt8ksZbopTknCP8EtZN6CiFizEiYnQd4YeNlctLYB20hngQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZKg8aoa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kuIE650C;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598B606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7598B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZKg8aoa;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kuIE650C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795519591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
	b=TZKg8aoaZZS5w0OUmaAH/lN4D6N+Xt5gI5/YQLO4vJFy4pj7F3jxjWEoMvur4wHzVg6OOZ
	bQMCgjIgIRZPMoZNWT5n5t9+lgm/tKT9DZ6IVyeSLlI8ijOgPLFOmk7ZSVJ8uZbulHAZsP
	edGm32f26vRc+IcmB0UWcr2IUNY11p0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-V5et14xgOpu1KvXLnrEPHw-1; Tue, 24 Nov 2026 11:26:29 +0000
X-MC-Unique: V5et14xgOpu1KvXLnrEPHw-1
X-Mimecast-MFC-AGG-ID: V5et14xgOpu1KvXLnrEPHw_1795519588
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so3602586f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795519588; x=1796124388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
        b=kuIE650CMBpg7TQOLbDu0lbpR9m9UuLhm3UEt+kfvdx32LWbfOOGj8IX3S2XhULHwL
         uJHY3qGJXbK1dBbBlKRiTymslcLaysSgxBUHCiUZCCjdin6sX8Xh3H0Cbkv2+Qv+3QIb
         IDe+yz2nHzK9Za4N5VQL7G6lkeLMza58P7hOqshJYE2DI+C0psBhEFQvgtGcrLJiTZYU
         PDaCD2MIC/Hqxkme/fNtrZ/kVmts8uRber+1Zx86fVcKLlILyljxe3tES6EK/5Gpbldf
         dfvcDX89TaqY0uznyyDNenvAgaoEwJDdIme2Hq1ZxTYPdwURsKzW3R8hROCE5dqMBQ+j
         w/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519588; x=1796124388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
        b=NW22Lzm46+JpA/+KYMC/hzXXhKs6xQ4VGdxmOjc0umvgZekrs2O1AxBBSfpj/7VBK8
         WkRjFMW9QoAvrLkDarkvv4lqFdE4BnVV61La7fP1vtcr3jockKvs1M9Tydd4C+VgY2lZ
         +6HSzh4+VZ7JRbWiH4UOFAK9r/I7SFSFC2xCZgIWdsnhi4lHbKn1xAyhqSO7ZT5DehZe
         ENY5SeKOA+j0tYdzjOWKsPa/U3wWaRLJQfuYktHAzZvc0J0lbIvL84Jm0viGxoxNMXFl
         EMoINzOT5S/kQ0aQuduxgeIXWFkzwFjoCQidpMJ6WHlgeHwcLCGlr5lrcwG5lL50bH4V
         caNg==
X-Gm-Message-State: APuU4Z+JQFUsNg/1JnMc/wsd38hXlvzfvyzE9735khzESq0NxTlpBfTm
	bV+N7f3Wcj9WzC/TNT07NfdwvSAeYRNBiCbfNpBkpryqQbeSTY3vWnxq9YT8ZNE62iKWTpkSxpM
	Yu+TDhmBISXrB/FCbrY4imTebDdpnIHIXM66yzn1JwEQ8/MOiC8iOKru4lg==
X-Gm-Gg: AZFdTZcBPk0N73YJEl+oAmN8Nui93NSV8HlOVEka2MIJjueZd9Mja5g8dY9R3ZYKrvr
	vZnU3eITVqlHewb/dZEP+s4Wj/CUdEQmvaZ2NYp2BIcWwqpRc1Htn2f90wVCJtatlDJKDu1SsRa
	ySsqloE4Ht3CKmn/kTqM1M2TJEmCV2/0GjLtttWCMna2q3gYVMWZ9HV6xz/6/qq+gmqLdjurOLc
	GqZBfXkKg0PI316d08coeRIrDO8SK834SRTt0Mg24AcpS3Locd2f/53gdWJXWTUNEpLSlsCjTyv
	Yc2VQSRiIaawCCC7KauY1778FUTKoP+aSz6c6oRHWehr1HxbXophcH7QeswTAoViqtmdJguaPHm
	yrYujv4Y7MP3DvGaH0opq/uavM/3vSK9r36oFiG7e5GlsU6wqi6yyIib8uGUNIUJHJ+03rzMQf2
	cGHDzv28HIMGc4WFFURXMDCe0mA6gmORWU9ucfgbJLfVCr
X-Received: by 2002:adf:f009:0:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-4abb44d3428mr20501162f8f.35.1795519588073;
        Tue, 24 Nov 2026 03:26:28 -0800 (PST)
X-Received: by 2002:adf:f009:0:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-4abb44d3428mr20501124f8f.35.1795519587587;
        Tue, 24 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm27131081f8f.38.2026.11.24.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <0ccdfcf6-84c9-4b65-b3d0-b2cae7e8e559@redhat.com>
Date: Tue, 24 Nov 2026 12:26:25 +0100
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
Subject: Re: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
References: <20261120045918.1239746-6-almasrymina@google.com>
 <179540996620.3135.3612533688050456273@kernel.org>
 <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 16:09, Mina Almasry wrote:
> On Sun, Nov 22, 2026 at 8:59 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] Undisclosed user-visible behaviour change for leased TX
>>    bindings.
>> - [Low] The commit message presents this patch as fixing 'issues' found
>>    by AI review of the earlier devmem unregister series, 'confirmed by…
>>
>> --
>>
>> net: devmem: always populate bind_dev and detach both devices on unregister
>>
>> This patch always sets binding->bind_dev to the device that bind-rx or
>> bind-tx was called on. Socket teardown, queue close and queue uninstall
>> now use bind_dev, and net_devmem_dev_unregister() handles bind_dev and
>> map_dev separately, calling synchronize_net() before unmapping when
>> map_dev unregisters. net_devmem_get_binding() also now requires map_dev
>> to be non-NULL.
>>
>>> diff --git a/net/core/devmem.c b/net/core/devmem.c
>>> index 6f85b90950f8b..80c3e149cd762 100644
>>> --- a/net/core/devmem.c
>>> +++ b/net/core/devmem.c
>>
>> [ ... ]
>>
>>> @@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device *dev)
>>>
>>>        xa_lock(&net_devmem_dmabuf_bindings);
>>>        xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
>>> -             if (binding->direction == DMA_FROM_DEVICE) {
>>> -                     if (READ_ONCE(binding->map_dev) != dev ||
>>> -                         xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
>>> -                                     NET_DEVMEM_BINDING_LIVE))
>>> -                             continue;
>>> -             } else {
>>> -                     if (READ_ONCE(binding->bind_dev) == dev)
>>> +             if (READ_ONCE(binding->bind_dev) == dev) {
>>> +                     __xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>>> +                                     NET_DEVMEM_BINDING_LIVE);
>>> +                     if (xa_empty(&binding->bound_rxqs) ||
>>> +                         !netif_is_queue_leasee(dev))
>>>                                WRITE_ONCE(binding->bind_dev, NULL);
>>> -                     if (READ_ONCE(binding->map_dev) != dev)
>>> -                             continue;
>>> -                     WRITE_ONCE(binding->bind_dev, NULL);
>>> +             }
>>
>> [Severity: Medium]
>> Does this change what happens to leased TX bindings when only the virtual
>> device goes away?
>>
>> If bind-tx is called on a netkit device, netdev_find_netmem_tx_dev()
>> picks the physical NIC as map_dev, and bind_dev is now the netkit device.
>> When the netkit device is deleted and the physical NIC stays registered,
>> this first walk matches bind_dev == dev and clears
>> NET_DEVMEM_BINDING_LIVE.
>>
>> After that, net_devmem_get_binding() fails here:
>>
>>          binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_id,
>>                            NET_DEVMEM_BINDING_LIVE);
>>
>> So every later devmem sendmsg with that dmabuf id returns -EINVAL, even
>> when dst_dev == map_dev.
>>
>> Before this patch, the code from ede1618064a9 ("net: devmem: detach TX
>> bindings on NETDEV_UNREGISTER") only cleared the virtual device pointer in
>> this case and left the binding live. That commit gave its reason as "only
>> clear binding->vdev so no new TX sends match the virtual device while
>> allowing in-flight TX packets on binding->dev to finish DMA safely".
>>
>> TX bindings have an empty bound_rxqs, so bind_dev is cleared here anyway.
>> net_devmem_get_binding() would then only match map_dev. Does correctness
>> need the LIVE mark to be cleared in this case?
>>
>> If the change is intended, could the commit message say that it reverses
>> the earlier design, and why? Right now it only says "first walk the
>> bindings to clear NET_DEVMEM_BINDING_LIVE to stop new lookups".
>>
>> The same goes for the synchronize_net() added further down for the
>> map_dev case. ede1618064a9 said a grace period was not needed there.
>>
>> This behaviour is still the same at the end of the series. The selftest
>> added later in the series (devmem_lease_bind_tx_unregister_check with
>> remove_virt_first) only checks the dmabuf attach count. It does not check
>> whether sends through the physical device still work.
>>
> 
> This seems like some kind of hallucination? AFAICT after this patch
> we're making the binding not live anymore, so we don't match it
> against new TX, but in validate_xmit we're checking against map_dev,
> not bind_dev, so in-flight packets should be fine as long as the
> map_dev is in tact.
> 
> Also, I'm not sure we care so much about what happens exactly to the
> in-flight TX packets when the binding is being unregistered. The
> application is probably ending tx anyway.

My reading it that clashiko complains WRT tx transmissions failing
after netkit de-registration, while previously completed successfully.

If so, I think it makes sense to rephrase the commit message outlining
the behavior change.

I must admit I find all the commit messages here hard to read, with
too much code description and lack of clarity about what the
addressed race(s) look like. A commit message rewrite would be likely
useful in any case.

Thanks,

Paolo

