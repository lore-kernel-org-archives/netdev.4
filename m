Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943103;
	b=2+H+077S7NM/OMjRfV10U+Io5BUXbQ+NE3jV31L+V4pMSsR/pCMGuxpvjpi2aOQeOE0J
	 5GDmXMv9XGQoN10Ci8Qm53SmWbKMDAwXvr+qJn6JVnIRGCeKqryMNybMQELpXduRTZnbw
	 EWYldW/iQaxHkMZSMpToP99sK68MgJMwyhGInz9dVagEMhRrkzkC7pZiAJ4ZEs7ziCBMX
	 gS/6ZQ2G1QFh6oxnjbymRhnjRCHTUklrZdvT2eWbUNfYk4GnWkc/ancf5DTnFBRz2iG87
	 z6HRI2otsdtJp4CG5VDkPxTIrF4yV1mw265j9zdlJBMbeSFnSBwyeASxx31iWF8oIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
	b=EfuX9qMiq41TNY2H5psCxdpIkqv5nV2srjDFyAWeYmZ/IHlREWXcoeRmBVXEtNeQtQoI
	 8HQTrMX6gm8I6Iww1iO20bvQ9thQ8dQHwlCAC4bPoVFVSpOwXFvvYJ4x4SK3EBbvR2sct
	 B+jmEN1/tp3YbeHQLhO+oxBh3mvZfbdONGRlbQgDxPumcE0siD3iutwQqeD0diYt6Xaip
	 SuNovnYqlUktfw1c2t4bCdCp4SNOULy7dvx/gCyruM3ctI1pYJaBKlwScTcKPDKBxK87M
	 jPihBy73RT9Q5EqTxObICzNcxxfJ3n0My4NvHQeIrIcerH1n22DfNXvSVV9aRPy0M6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R2MqpIx;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27875606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27875606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R2MqpIx
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e7af9a67fso160626d6.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943102; x=1795547902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
        b=0R2MqpIxgKWqnVxLLFLn7f6a2ORR8Dlv9evj2spHbYLhN3X7ypfC7lit78GwvNKuKV
         Z7JZXNqmgi47OuXI4o7OQyKFepcm17OwfCiHpagjtQqlvHXZLN2+qpsklhAP40svnczE
         Wj4a50d5bPswncfHYVt2Qv/FHhoWt6aZCt+a7PRKA2nOiPlT1kjfnuBJhzuHKQ1GEB4Y
         YtcgYMEgM2wGHw+lYgajxFRNNgoZrsbhB9pXLZbybKdR6l4/p2Kb8o4UWo6CCBdMqUjV
         iIok+k+oUjzZyN7AhxqphHIdt/Lxlv+SqvXRCb3XCNSkkejRyQoqkByLu8O8xczC57IY
         G9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943102; x=1795547902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Edwp1EcAjO2ABx/cNirsINggYhI4Q4uIjqMsRIaK2c=;
        b=0NbWVV6w6hRF6VPWxgrs1Pb182MsivAZ5H4zh8zkAVXkhuHdbKrC84hySU064Y5U0C
         JtyYooCYjhGsLIUKlptJ19sy057A5FV7rHyoneIT+1bl3lZ8Et0WAQXC0NnlVJSnr4U3
         NWN7H36mfrQhpiLH+xlNFjIEJLfzk8cWGcoAEJ+XXcA11p3cc2lnCn1pC/maL29daufZ
         oEixafN94YV7q8F1FOjyPRFJfs02hfcmP6xlRhitqjmC1a2I/Q3524nhsmFeKJMSBV5c
         +pY2lpK21gTdmtYBXmwks1ty/MZ8biNQXaOi2VFW/O0eHbYfktASD9csVSm/Mb6t2vK/
         aQkA==
X-Gm-Message-State: APuU4Z+prScrxFgmsPm5ZBKGrD+P3kb4PNeVTnGtwiK8lcjbdqQ6hK+c
	rwi/VToNY5LLywJShv0FDNM41TJUTZryNvnyPzutydUOQu5elVQW4NS6
X-Gm-Gg: AZFdTZePixeK7Uf/8zlQSlbWW0VYwcZHne0jijWc5OrXTQhtxdIZ4PUS14rcMUK8UFm
	Wgys3Wbp9E82AoJFWgYCkTY0Gh9cgivET7VcMuWcyKO7pVor49R/m0WRqFnZLNLdr8DpVivzo+G
	HdHluK7biVzO0EkgaCG3r86SVLIVcTt4EOvfzMgCNhZyAFHGG256E7V7cXXzAvtFe7/cnt7cmDc
	WbZPBIr3O3kY9XzrgQaZ63umx+hIJpja7m2qtfrFX1qqkcHnJVKO4cZQEA3/e0peScjQnI2uI+Y
	sM5yHN8suZVP5hM6/T7w+kTXCZYhwhoh/FFK06IAUmqwSaMkWxcpvnPIpUVo2BErFI9vNunlHla
	GCAsW7+LiiPY7LkGg8JbI73NlKQe6LeGYaarCoX3bMzmScs7dEoS3MVp+AHGQ5m98TlQa5vLkbN
	HDqznFF5+3vaNoZQZlVk7GlLSqsWlQV+3kD0WMZREXMhgANv6P/fyWBv0C2bC6MsQoTzaE/xfDj
	u1NFavRyN+w3BwN3l+os2TYDsUK66dt4Eg3KJqU6sKGZaf03esUVgFyvscxY7FQ4dtdCL5IL0Ya
	Vh3hADjIpvMymgcsyBAYf7vyIfjLjM+x3uYjhhfzL3ztqYEjXzwThMqysg==
X-Received: by 2002:a05:6214:1bc8:b0:91b:9536:21af with SMTP id 6a1803df08f44-92114eabcfcmr2276646d6.46.1794943101894;
        Tue, 17 Nov 2026 11:18:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d537bcsm1263596d6.24.2026.11.17.11.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:18:17 -0800 (PST)
Message-ID: <ddf29c30-de9f-486e-b6f1-42f06200eb55@gmail.com>
Date: Tue, 17 Nov 2026 11:18:13 -0800
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
Subject: Re: [PATCH net v2 11/12] net: au1000: keep the MAC stopped until the
 PHY link is ready
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-12-f.fainelli@gmail.com>
 <179483704995.3136.5707920157509018990@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704995.3136.5707920157509018990@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message and comments in this patch don't match the
>    code.
> 
> --
> 
> net: au1000: keep the MAC stopped until the PHY link is ready
> 
> This patch stops the MAC when the PHY reports link-down. On open, it now
> calls phy_resume() before au1000_init(). It also keeps MAC RX/TX disabled
> in au1000_init() until au1000_adjust_link() has seen a link-up.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 8b7a88ceb3c5e..d60430a3795ed 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -691,8 +692,8 @@ static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
>>    * When the device powers up, the clocks are disabled and the
>>    * mac is in reset state.  When the interface is closed, we
>>    * do the same -- reset the device and disable the clocks to
>> - * conserve power. Thus, whenever au1000_init() is called,
>> - * the device should already be in reset state.
>> + * conserve power. The device must be stopped before au1000_init() is
>> + * called, but may be out of reset for MDIO accesses while resuming the PHY.
>>    */
>>   static int au1000_init(struct net_device *dev)
>>   {
> 
> [ ... ]
> 
>> @@ -928,11 +934,25 @@ static int au1000_open(struct net_device *dev)
>>   		return retval;
>>   	}
>>   
> 
> [ ... ]
> 
>> +	/* Restore the MII clocks without starting the PHY state machine. */
>> +	if (dev->phydev) {
>> +		retval = phy_resume(dev->phydev);
>> +		if (retval)
>> +			goto err_reset;
>> +	}
>> +
>>   	retval = au1000_init(dev);
>>   	if (retval) {
>>   		netdev_err(dev, "error in au1000_init\n");
>> -		free_irq(dev->irq, dev);
>> -		return retval;
>> +		if (dev->phydev)
>> +			phy_suspend(dev->phydev);
>> +		goto err_reset;
>>   	}
> 
> [Severity: Low]
> 
> Can this error branch in au1000_open() ever run? au1000_init() has only
> one return statement:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
> 	...
> 	spin_unlock_irqrestore(&aup->lock, flags);
> 	netif_addr_unlock_bh(dev);
> 	return 0;
> }
> 
> au1000_enable_mac() returns void, so nothing in au1000_init() can fail.
> That makes the new phy_suspend() rollback look like dead code, even
> though the commit message describes it as:
> 
>      if initialization fails, suspend the PHY again before cleanup.
> 
> The commit message also says:
> 
>      Initialize the MAC before phy_start() so the PHY worker cannot access
>      MDIO or enable traffic during setup.
> 
> Didn't au1000_open() already call au1000_init() before phy_start() before
> this patch? The diff shows that order as unchanged context.
> 
> The actual changes seem to be the new phy_resume() call before
> au1000_init(), and making RX/TX depend on aup->old_link. Could the commit
> message describe those changes instead?
> 
> Separately, the au1000_init() header comment now says the device "may be
> out of reset for MDIO accesses while resuming the PHY". The comment in
> au1000_probe() was not changed and still says:
> 
> 	/*
> 	 * The boot code uses the ethernet controller, so reset it to start
> 	 * fresh.  au1000_init() expects that the device is in reset state.
> 	 */
> 
> Should these two comments be reconciled? They now give conflicting
> preconditions for au1000_init(). Neither is strictly accurate, because
> au1000_init() always forces a reset itself through
> au1000_enable_mac(dev, 1).

Agreed on all three points. In the respin I have:

• Removed the unreachable initialization-error branch, including the new 
phy_suspend() rollback, since au1000_init() always returns zero.

• Updated the commit message to describe the new synchronous 
phy_resume() before MAC initialization, while preserving the existing 
initialization-before-phy_start() ordering.

• Reconciled the comments to explain that au1000_init() forces a reset 
itself and that preceding MDIO accesses may already have enabled the MAC.

pw-bot: cr
-- 
Florian
