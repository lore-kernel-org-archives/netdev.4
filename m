Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862037;
	b=uOspbtP4/huq3AOzAXhUdg23J6Yk8ip2mYC7IC4cY7Eyhduk5tgzOah1Kek4i//PEJuP
	 bpMtAU28Ld6/HwypWJiP6Q668RgsAWQWSoxIstUVQqAx9U1ahCDykW5FIdJ9OWh/xUl9P
	 WVtNvAgd74guMZaZv31FSoqAmSMzCmEdhZw9QKuMczsoBp+1KBzXcDtRC9tzLk1ijL4zZ
	 1fGz6qcmcOl9dVc+TSOiayR6Wrv38oWd1Ff+w6H87gAxFzBOQqE6VtrEm/1l9MVcV7KjG
	 9TilTTJsrGbJZDosmrZds4XZiwMlCm5VQNCA8kYzxtEVSF+cUuOmvyRlk4qDErXmAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=e3nSQTH0rYIVnYRuHrr8Tvkk1NUhFraw3OHV8sk/uYs=;
	b=yk8FtNP7CzzAGyslb04g0VJuymTf1n0FAR1dtiw++pDSIpHpeDUGvqmW/TUq9zd2YPeB
	 dyaF7GWzdy5HeZrsrrwHgZYCB7q09h8OovuVYZ7oS5AUNWEm7nO+/TB5rm4DME672n34I
	 p9fS+sqwA9EERwOoQENnZeZnoRkwtXPQtivT82sk3i6DEEw8oQsbKojUw/NTo22aoxSBd
	 Dl0Fy/4IJqAb7sI8pTiQyeRit735E0PtCeCzu6YVUiEmLks/YoyEJ+245eY3bb3nOjOti
	 iKhp5+aXLaX1/PyQPwnrshduzVnB7pfvWKOveDx34rcIri6aIgqSSf+t6bFwbLasGAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gEfpBXON;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66605606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66605606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gEfpBXON
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1887414b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862036; x=1795466836;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e3nSQTH0rYIVnYRuHrr8Tvkk1NUhFraw3OHV8sk/uYs=;
        b=jnFeTw6+Vnf28qf8L8HfcEj5tzpykkjTXahhpmwLYgIkX5IE46PK/mbjuDimjDc7A7
         WXaM++eykDr72o46lHEZoAqTGdaDStsXIVDtwo170+4TJmDHDt8ny1uG28l5FQsvMs53
         PzvDtNROO3ht6QMUt+dqBGUeqH+kRuWt0IKpKUZTCxTdyKY6XUq6jvSVLG/HjW1rynhf
         N5qG+0FO1Rmb8HOADnn0gek2QKSykUM7wRPIQRsj2dVa2dD6kg/BimmbpnAumt1QSSts
         NOQRgi7Pk96BFL9fZrZO2LZYph76azywDPFCVkJv+x6UPxkE7AWtkNbJSevZ1YSzuWEH
         UiOw==
X-Gm-Message-State: APuU4Z8IrKqUcXxHaYHbffuUjMRIjYWRPaYMurK4cjm2BnH9VzX5azS2
	PuDLhX7p87RU7ci+zdS4zjzmjtLIzFgk7P4VQ6ENq8IlGHPXFJGWEvRq274rd1fQPhfmK0FGC3E
	slWDjZiexc4BU8Oa6DRV9CgF39NRnjzESQic/triYcgnQYL2GplmO+k/a3VXMQQlEprSTkcUn6T
	/2PGcGIDQ+TQ/+8gQgwoIbzoW625r0p3nZsWf1Mv3copq5AycY1IRf3254ykf01LMmwil9GEpAC
	ORsjd4KBLzq4iI0
X-Gm-Gg: AZFdTZeMKSVBtr+OEzvtHrEQmvY2I2zH501gFPLKhVi40uMSF5tU3XIKo6X+a1dENEc
	4F9yhIQXNDbbp2pU3c1DAheYjZTTiFrz8PgsXJssIgWYeXr/7oEgFx3SNN8/EsVk+R7xb4wQATH
	ZhADLZRb1JH1e7lNbyd+JDa3C9+gphwOISPEztk9eceWfhb+pO6Ux16+d6igBABDN5oaQUAnLCd
	iI9RP+6h7OUFKjqljTSEIT29ZhUedso6epnPoGU71G9AS0K2JE9+QvIQB6WEOjrc2jW8LcDw5bA
	hYAz4BgrcqOMq4kZu6AGEmMP583JSMWRr10bsOokgJ4/a/NadAE10TspJ1NJYFICUKb/uLgnE7H
	lXhLi/Dtqlj9CCGGJTwUO2hMhbVPvnFo13GBsGUHDCHK++1xpV3hAtqFjTbPHe0505pFMbYpmay
	DOoGb+DKq+eJ0EIwtp9iM1ZVrZgs01rAbl2nvH0LrXFzY=
X-Received: by 2002:a17:90a:5d03:b0:3b3:a1fc:136e with SMTP id 98e67ed59e1d1-3b3a1fc7422mr1115414a91.58.1794862036473;
        Mon, 16 Nov 2026 12:47:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm349882a91.6.2026.11.16.12.47.16
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:47:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4602573eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794862035; x=1795466835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3nSQTH0rYIVnYRuHrr8Tvkk1NUhFraw3OHV8sk/uYs=;
        b=gEfpBXON/SuCLdte723HfNNSonNHs3uVxs9GUjaRaPc9mmNg6RBKtgMTrCGIeTyYwI
         czpIUjrMGDpN02k4zVNxrMYE7EaPv8sDRps8MWBGf9A8eigJC/9hCwoMqlKdu2ioTXcf
         p56oige8pLsynWH8u26IffmKk7H6RARN17FU4=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr9973399eec.10.1794862034607;
        Mon, 16 Nov 2026 12:47:14 -0800 (PST)
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr9973358eec.10.1794862033600;
        Mon, 16 Nov 2026 12:47:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm72210794eec.20.2026.11.16.12.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:47:12 -0800 (PST)
Message-ID: <25bdc879-a0f1-4e68-a8b6-60998e0eccda@broadcom.com>
Date: Mon, 16 Nov 2026 12:47:11 -0800
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
Subject: Re: [PATCH net v5 7/8] net: dsa: b53: harden mirror register
 programming
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-8-florian.fainelli@broadcom.com>
 <179485574238.3136.7987059479392278091@kernel.org>
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
In-Reply-To: <179485574238.3136.7987059479392278091@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Speculative; needs datasheet confirmation.
> - [Low] This patch fixes a regression that an earlier patch in the same
>    series introduced, but its message says nothing about that or about…
> - [Low] The commit message says the patch will "Clear capture control and
>    both source-control registers during b53 and bcm_sf2 setup".
> 
> --
> 
> net: dsa: b53: harden mirror register programming
> 
> This commit calls b53_mirror_init() from b53_setup() and
> bcm_sf2_sw_setup() to reset the mirror registers at setup. It checks
> every mirror register read and write in b53_mirror_add() and
> b53_mirror_del(), and only increments the source reference count after
> programming succeeds. It also uses the ingress/egress source masks,
> instead of MIRROR_EN, to decide whether the capture destination is in use.
> 
>> The mirror destination check can reject a first rule when a bootloader or
>> previous kernel left mirroring enabled. Not all supported switches receive
>> a hardware reset during setup. Unchecked register accesses can also
>> corrupt mirror state or report an unsuccessful rule installation as
>> successful. Reference counting must not record a first source reference
>> until hardware programming has succeeded.
> 
> [ ... ]
> 
>> Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
> 
> [Severity: Low]
> Is ed3af5fd08eb the right commit for the first problem described here?
> 
> Before this series, b53_mirror_add() overwrote B53_MIR_CAP_CTL and never
> rejected a rule. The check that can reject a first rule because of stale
> firmware state was added earlier in this series, by "net: dsa: b53: reject
> conflicting mirror destinations":
> 
> 	if ((cap_ctl & MIRROR_EN) &&
> 	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
> 		...
> 		return -EOPNOTSUPP;
> 	}
> 
> That patch does not clear the capture state at setup.
> 
> The same is true of the reference count increment that runs after
> unchecked register accesses. It comes from "net: dsa: b53: reference count
> shared mirror source bits". That patch also defined and exported
> b53_mirror_init() but never called it, so this patch cannot build without
> it.
> 
> All three patches carry the same Fixes: ed3af5fd08eb tag, and none of them
> says what order they need to go in.
> 
> Suppose "reject conflicting mirror destinations" is picked up for stable
> on its own. On a switch where the bootloader or a previous kernel left
> MIRROR_EN set with a different capture port, would the first tc matchall
> mirred rule then fail with -EOPNOTSUPP?
> 
> Could these fixes be folded into the patches that introduced the problems?
> If not, could the commit message name those patches and the required
> ordering?
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
> [Severity: Medium]
> Are the mirror register offsets the same on every chip family that goes
> through b53_setup()?
> 
> With this call, b53_mirror_init() writes zero to Management page offsets
> 0x10 (B53_MIR_CAP_CTL), 0x12 (B53_IG_MIR_CTL) and 0x1C (B53_EG_MIR_CTL) at
> every setup, on every chip_id:
> 
> 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, 0);
> 	...
> 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, 0);
> 	...
> 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
> 
> Before this patch, these offsets were only written when a user installed a
> matchall mirror rule.
> 
> The driver already treats the BCM63xx Management page layout as different
> in at least one place:
> 
> 	#define B53_AGING_TIME_CONTROL		0x06
> 	#define B53_AGING_TIME_CONTROL_63XX	0x08
> 
> The mirror registers have no 63xx variant, though. Nothing in the tree
> confirms these offsets for BCM63xx either way, so this may be fine.
> 
> If BCM63xx, or another supported family, has a different register at 0x10,
> 0x12 or 0x1C, would that register now be silently zeroed on every boot?
> A write to the wrong register would still return success here.
> 
> [ ... ]
> 
>> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
>> index 98a4a62ca73a2..85ea32fb501db 100644
>> --- a/drivers/net/dsa/bcm_sf2.c
>> +++ b/drivers/net/dsa/bcm_sf2.c
>> @@ -1063,6 +1063,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
>>   	unsigned int port;
>>   	int ret;
>>   
>> +	ret = b53_mirror_init(ds);
>> +	if (ret)
>> +		return ret;
>> +
> 
> [Severity: Low]
> The commit message says:
> 
>    Clear capture control and both source-control registers during b53 and
>    bcm_sf2 setup, propagating initialization failures.
> 
> b53_mirror_init() does more than clear these registers. After writing zero
> to them, it rebuilds the source masks from dev->ports[].mirror_count[] and
> writes the capture port back:
> 
> 	cap_ctl = MIRROR_EN | dev->mirror_port;
> 
> On bcm_sf2 this also runs on every resume:
> 
> bcm_sf2_sw_resume()
>    ds->ops->setup()
>      bcm_sf2_sw_setup()
>        b53_mirror_init()
> 
> So with this patch, active tc mirror rules are restored from software state
> after each resume. A failed mirror register access also makes resume fail.
> 
> No patch in the series describes this restore behaviour. Could the commit
> message mention it, so that readers don't expect resume to wipe active
> mirror rules?
> 

[Medium] b53_mirror_add()/b53_mirror_del() are already wired up for 
every chip handled by b53_switch_ops, including BCM63xx, and they use 
the same three management page offsets (0x10, 0x12, 0x1C) without any 
per-chip variant. b53_mirror_init() touches exactly those registers and 
nothing else, so setup does not write to any register that the mirror 
callbacks would not already write. The mirror registers are at the same 
offsets on BCM63xx. In the BCM6368, BCM6362 and BCM63268 register 
documentation, the Mirror Capture Control, Ingress Mirror Control and 
Egress Mirror Control registers are at Management page (0x02) offsets 
0x10, 0x12 and 0x1C. These are the same registers the existing 
port_mirror_add/del callbacks program on every b53_switch_ops chip, so 
zeroing them at setup does not touch an unrelated register.

[Low] Agreed on both. v6 describes the restore of active mirror rules
(bcm_sf2 runs setup again on resume) and documents the dependency on
"reject conflicting mirror destinations" and "reference count shared
mirror source bits".
-- 
Florian
