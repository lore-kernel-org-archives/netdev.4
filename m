Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112264;
	b=Pgw5n4KJoMeDQGqGfSC+tr/Wja9i2ldgw3ViltIyauL5Md6c8MOlGzEni0wvWTMabjHq
	 5EJE0CLAvhyIPT4tpf9GApOc95KGgqROsOsPbvR6mk1iETHx9OIbJHKmoma/vNl4Zb/Q/
	 YfUQ3UI1nAnbr/UgQO3Yw8vDzODatXTLAxsCNF1rR7EZ2sAsSyV+VQv3BoYnVIZ0NccPO
	 t0eBwTBm+Kb042M5pd8d0Xz1hxd8Nhs2dR1eq6fb/PE12RE3+L+AieApWFrCYJ8bzErya
	 czVx5i7b8l6xvz4+jNXRCSq4gZ9uZTQ4yoGUq0v+hh9peUvU7EzSN+RcISjc7otzmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112264;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xJcIroYk78znmre8LpSsIQKiA5kw3o6lCqjydTzxj+E=;
	b=VjsqYvfyKhxNwxzF+mCXkXhZRx7SdrAbaYmJopj7vI3KfQXqb53q0o9CmSYtIANlzE0g
	 lC/f7omtkktcwuqWf6MKjO8/pBMKyca9pnMmceuJIM5uhWexSxWa9bE9v0BdQBl6CI6fF
	 bwpJD+McgX/xHDDqLQp+GozOQjx3npUE9EGwsEpLG12sR11dJYA3zaA/uFNnP15giA9Z+
	 PmpI0hLN+bNwjBLOIxRobID7GjLtB6Ndo6ngUd6O/paaaosJVXj0E2Fsl/izFOU2sj3xL
	 E7Uh0GXqZa7xee3WgJjNclNo8VvYcaybR89cy3kG/0lfpQn7gG1YaX20Vc338I6t4Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZOpvViPl;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A4606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZOpvViPl
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7d6554d96d3so24143137.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112263; x=1795717063;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xJcIroYk78znmre8LpSsIQKiA5kw3o6lCqjydTzxj+E=;
        b=ZXo9owapszStfs1ZiWVamHyMzrZbbD8FFLFHqobm4KFdRcPlIuPwDxL3/3admReqal
         KIiHsp+V/eX8DEdSEBAmFWeQ/c66cXQEdM8dyhTzELM+2wtyS87JWp1e64kYa8fl/Byd
         I3yV470fhENv3YCXAAkDkJCT4IXuqIsvtsKiKZ/3Biy0AZMhSlY159H3xTVflCKAbZNP
         2kM53y6Ij5qttRV8tiMAwFcdvmOZ7AKxvdmcu1QGb0bSXcgMay5PQ7vrSinqR3JkNezI
         0r1rxQxciEApVOV2fqyV8ceQOdcd69iv/CbFnR8rNYkWTJzteZwyKdG3RfhLNkzMgwZQ
         BWGg==
X-Gm-Message-State: APuU4Z9+iUc2AZPdAcYm861n3rQJA6L3E6RZxddYvCn7zzwLxrl2RQ0w
	ib85pwV1tZT+J+z7lgTLj3U7Kwx6XmDwPJgN6FT7C2rlNvnOmLSYoNceHunadpIuSDThHhQmG+d
	m3I4vHOQdUaHfvBw5wvpSCTiQV56TL8da/q03ZJnVf8+oM63JZszbc2pRWzsV9UDvtT+JtTlF2t
	WNL+smW2y8TA2EKQYjVPeq2Ao4gtdtOVQykdsja4F/oGls6dgJIVuN83rYgl6bW2f0UKo7tjtOQ
	6fT9Om7a3JNqZDM
X-Gm-Gg: AYBFou037vAh982JbuY/if/KkcZd10zuytqZd8xqWiH1qt9QPA7fl+UaiGQWTAeqr7b
	Afx8yQhd/Gb0aB1LzSp7YrLU/vdRlWMR8VFJcxKs8bwaVYhB0kVsViVZrWEFyB/rosCcjNtn7c7
	aF2nRPjAH0qItzPGstXir6YSoo9hLKRMYqhcA5KSHg51lnDCY8BAhnI3b52/S+JZ5xnAsklirc2
	ONFYNg0Ps3BthU0Sxx5kmkuDVhXY+KoCAxvzQ45tRfGlOIfc+ggGWysNLFf2KwYj9kaYNY1bJ7I
	Xy0k0pM7nkvoh1e67GwSv/zNHpToH4fJ9oA4vwNmugOU7G+lSjRRsKcQfLAQik/3A7j56zKwSXS
	yIh85O02cQLZIITUfkcAGWaTX5jR/YecoszB3/JgnJC1B5KvWvTWvseu+b1XyObPEhGiQdAfvhj
	wOVp6MnA39HhZENru7WCjVkmTdQdB5ZGx4lXlCXVEv
X-Received: by 2002:a05:6102:5707:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d739639ec9mr166128137.31.1795112263058;
        Thu, 19 Nov 2026 10:17:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e11f276sm66105241.9.2026.11.19.10.17.42
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:17:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so83790a91.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795112262; x=1795717062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJcIroYk78znmre8LpSsIQKiA5kw3o6lCqjydTzxj+E=;
        b=ZOpvViPlXswkwPrdGRXRnoPKVSP4EfZM+LMWNs/k1zaGdxKk4qR6LWUWsYiK4x2z7t
         GfSZaTEpHLvqVjAM/RRW0ZXlhZzjqwLm4JDvc2eQA21weFplg82mGUiU1rZhtTYWNa3m
         wlYnMrBboNGfeVJWFIAvrlHwq0IoNyU0FlU7U=
X-Received: by 2002:a17:90b:5407:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b41cb3e5e0mr115254a91.59.1795112261687;
        Thu, 19 Nov 2026 10:17:41 -0800 (PST)
X-Received: by 2002:a17:90b:5407:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b41cb3e5e0mr115237a91.59.1795112261163;
        Thu, 19 Nov 2026 10:17:41 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm2082962a91.3.2026.11.19.10.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:17:40 -0800 (PST)
Message-ID: <89b39817-2e4c-4aee-953d-b84cc075bb14@broadcom.com>
Date: Thu, 19 Nov 2026 10:17:38 -0800
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
Subject: Re: [PATCH net v6 7/8] net: dsa: b53: harden mirror register
 programming
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261116210943.1352656-8-florian.fainelli@broadcom.com>
 <179507941634.3136.10463696917464189508@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <179507941634.3136.10463696917464189508@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 01:10, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch fixes a regression that an earlier patch in the
>    same series introduced.
> - [Low] The series is split badly around b53_mirror_init().
> 
> Pre-existing issues:
> - [Low] At this commit, on BCM5325/BCM5365, the mirror source masks and
>    capture-port field use the newer-chip encoding.
> 
> --
> 
> net: dsa: b53: harden mirror register programming
> 
> This commit clears and rebuilds the mirror registers during b53 and
> bcm_sf2 setup. It also checks every mirror register access in
> b53_mirror_add() and b53_mirror_del(), and only increments the source
> reference count once programming has succeeded. Whether a destination is
> occupied is now decided from the source masks instead of MIRROR_EN.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 98696bce368fe..deb331b3629a7 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
>>   		return ret;
>>   	}
>>   
>> +	ret = b53_mirror_init(ds);
>> +	if (ret)
>> +		return ret;
>> +
> 
> [Severity: Low]
> The commit message says this patch will "Clear capture control and both
> source-control registers during b53 and bcm_sf2 setup, then rebuild the
> source masks and capture destination from the mirror reference counts".
> The diff, however, only adds the calls in b53_setup() and
> bcm_sf2_sw_setup().
> 
> The previous patch, "net: dsa: b53: reference count shared mirror source
> bits", added the body of b53_mirror_init(), its EXPORT_SYMBOL and the
> prototype in b53_priv.h. That patch's message only talks about reference
> counting, and the function has no callers there.
> 
> Could b53_mirror_init() move into this patch, or could the earlier commit
> message describe it?
> 
> As it stands, cherry-picking this commit through its Fixes: tag without
> the previous one would fail to build because b53_mirror_init() is
> undefined. The "must be applied after them" note doesn't say that the
> dependency is a missing function body.
> 
> [ ... ]
> 
>> @@ -2654,14 +2658,25 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
>>   {
>>   	struct b53_device *dev = ds->priv;
>>   	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
>> -	u16 reg, loc, cap_ctl;
>> +	u16 reg, other_reg, loc, other_loc, cap_ctl;
>>   	int ret;
>>   
>> +	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
>> +	other_loc = ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
>> +
>> +	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
>>   	if (ret)
>>   		return ret;
>>   
>> -	if ((cap_ctl & MIRROR_EN) &&
>> +	if (((reg | other_reg) & MIRROR_MASK) &&
>>   	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
> 
> [Severity: Medium]
> This replaces the (cap_ctl & MIRROR_EN) check that "net: dsa: b53: reject
> conflicting mirror destinations" added earlier in this series. Is that
> earlier patch a regression on its own?
> 
> At that point in the series, nothing in setup clears the mirror
> registers. The baseline add path always overwrote B53_MIR_CAP_CTL.
> b53_switch_reset() only soft-resets some chips:
> 
> 	if (is539x(dev)) {
> 		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x83);
> 		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x00);
> 	}
> 	...
> 	if (dev->chip_id == BCM58XX_DEVICE_ID ||
> 	    dev->chip_id == BCM583XX_DEVICE_ID) {
> 
> Take one of the other chips with no reset GPIO, where a bootloader or a
> kexec'd kernel left MIRROR_EN set with a different capture port. The
> first valid tc matchall mirror rule then fails with -EOPNOTSUPP.
> 
> If stale source bits were also left set, b53_mirror_del() never clears
> MIRROR_EN. Another destination then can't be selected until a power
> cycle.
> 
> The earlier patch carries Fixes: ed3af5fd08eb and a Reviewed-by, so
> stable tooling can pick it up without this one. The "must be applied
> after them" note only guards the other direction.
> 
> "net: dsa: b53: reference count shared mirror source bits" has a similar
> problem. It increments mirror_count after unchecked writes, so a failed
> first programming attempt is recorded as success. Later adds for the same
> port and direction then return early instead of reprogramming. This
> patch fixes that ordering too.
> 
> Would it be better to squash the b53_mirror_init() wiring and the
> source-mask occupancy check into "reject conflicting mirror
> destinations", and the mirror_count reordering into "reference count
> shared mirror source bits"? Reordering the series so that no single
> commit regresses would also work.
> 
>>   		NL_SET_ERR_MSG_MOD(extack,
>>   				   "Only one mirroring destination is supported");
>> @@ -2673,19 +2688,17 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
>>   		return 0;
>>   	}
>>   
>> -	if (ingress)
>> -		loc = B53_IG_MIR_CTL;
>> -	else
>> -		loc = B53_EG_MIR_CTL;
>> -
>> -	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
>> -	reg |= BIT(port);
>> -	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
>> -
>> +	/* Select the destination before enabling the new source. */
>>   	cap_ctl &= ~CAP_PORT_MASK;
>>   	cap_ctl |= mirror->to_local_port;
>>   	cap_ctl |= MIRROR_EN;
>> -	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
>> +	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
>> +	if (ret)
>> +		return ret;
>>   
>>   	(*mirror_count)++;
> 
> [Severity: Low]
> This is a pre-existing issue, but is the source and capture-port encoding
> right here for BCM5325/BCM5365?
> 
> The source bit is written as BIT(port), so the CPU port uses bit 5 rather
> than hardware bit 8. The destination is compared and written as a raw
> port number under CAP_PORT_MASK, but these chips expect a port bitmap.
> 
> b53_mirror_init() uses the same encoding (cap_ctl = MIRROR_EN |
> dev->mirror_port), and so does b53_mirror_del() (reg &= ~BIT(port)). The
> hardware can then mirror the wrong source or destination while
> mirror_count and mirror_port report the rule as installed.
> 
> The encoding goes back to ed3af5fd08eb. A later patch in this series,
> "net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365", fixes
> it. That patch adds b53_mirror_port_mask(), b53_mirror_capture_port(),
> b53_mirror_capture_port_mask() and CAP_PORT_MASK_25, and uses them in the
> init, add and del paths.
> 
> [ ... ]
> 

Agreed. The conflicting-destination check can reject the first rule 
because of stale mirror state, and the reference-counting change can
retain a reference after failed register writes.

I will combine the destination check, mirror initialization, reference
counting and register error handling so these intermediate states are
not introduced. This will also keep b53_mirror_init() and its callers
together.

The BCM5325/BCM5365 encoding issue is addressed by patch #8; I will
move that fix before the combined change.

pw-bot: cr
-- 
Florian
