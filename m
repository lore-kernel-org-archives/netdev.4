Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049289;
	b=449YkA7luMw9WcnNAcl4F34gf1rUlGNMw7+rxmf4YhrzJ+GzuM2DjUMUefpaDYuM1fp9
	 +JcrdsTv7DXiEkTeaKLpWXu4c7o0yp/ff7c/mmNMRRMYP+tFw/iomLtJ7GSgql8P/d9sq
	 rNCi8UDLG1zMCJSePEi/GnlGsgXnouu4gPDZzqKepHVUU6BITWBI1ncQlNuSkHkD9+p7/
	 /8GqKq68D7UqR3riL9fzWHncAcXqOX8vVSyfJVEuP1Psda7MWUYnZD39Zmq8sderKX7xu
	 Sd/oMJTRZuSZp/M0QOQDMp/ul/mooTncIZTbaI8zwwV5n8ALvqpEPzBAGsgXuO+CEsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gBbPmdztzomulyuAItY+J9C/pXguZmjUxpV8/ldLzyo=;
	b=c+wHT52WmP5qAY65r2rRnWAVn7gKU1XJseFBTaWmBssb40DiPt90CjikOm/5rFbdzG2Z
	 mM0Q4v8NDAxFvceg8yS3yU0KYQEcuN5vSmKELN726I9ANYiUdoMEMvbigRChRQ7eP6H6F
	 T0rRHDs+XFzP3e1NWVo6nBnzdjqEDo24gFzypGuyP+UnGB2dzkGVmwoyy/t+dk1nNu/qq
	 M3DoL7P1ZPfjT3/ppVPCp7+ETvfrB71wpk+SK4VQqNUdVfJxP6BellMAu2KgE5QwzLYG4
	 y23qEP/FuAsYEw0WlHmCF0QGi6kSfRemMNxrfhpyZhUs4N/M41bpCUfzV6CFJsq3qAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lr75jsiy;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D1606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lr75jsiy
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so123167a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049288; x=1795654088;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBbPmdztzomulyuAItY+J9C/pXguZmjUxpV8/ldLzyo=;
        b=zpUmyzinNFWwkK24xMm5//Xns03k3lrTb3ulntwzivSlWvVvjGo9hWCDxnYKB1UFWN
         y6hTk6ZEX8+32TZwLk7IdTHJByvR11nrUgUQbSLp1dY2OhRwQ6WDer+Y82TgyBwhlF2v
         1IzFuLjqmzedF/KZ4sPTNnRhbN9QnPsOwXcToOr6Iasppld8AJdLIEAy17pNWUyunOH7
         PzPzJK8FdzBLLqLALNS9Ffq1CcGBYtbULL2IrPa297mus2zS/ZiE96dNfX7g6LYEJWJt
         InWEEaFb6CSpTvp4f7r7RRpNGFE0M6Bhb7x6QtD+GIfKZBSrrWIctGZwz2vPJUmizfSr
         ruaA==
X-Gm-Message-State: APuU4Z/7IB3mf6LR5um8Q1PSpLFbOwe/E6GxTh3MRg/EZGeCpqBn5fx+
	c7gbdYJyZzE5SZ+MOOANcgzmIQxNj1D37Zx26SI5KOHVebo2gQ9NhP3wtLUiHwwHYLh+Q3+B5+n
	tcl1fcVi0CaKjW/lUS0y+S9ULocDzxeZCs2Qv7rUniF6bD+d6yy/H2cU+qOeVU4ytkuXmYWMVpQ
	QUjREuTGV3qDmQ2czOauNizdDweEirfvH8W+Xy69CpozYgoEbx3BEuYPnhSfDPpKdtXSZ4K5RHp
	IgXdbTp1oerucIB
X-Gm-Gg: AZFdTZfhxrzlrCx6edwEnMNvN3dMqVL2xg7M/Y5OpsrKjQQARRiCsID+g5atD0hwy+i
	zoFjFWYua5HNi2IG6yTFOyuu9HCxiE2pvGOYlbOCIzVdpI3Rv0n6no9avnuwBa6oH55tWiP9PFo
	2CjIkiJaMbwAqC12pbtgk0y2o8DcIexVlERGyfemEllXGW2XymQxTsKLq1h/NTrsmGCXoqWOi/q
	JP6l8/0ycRFc87YcUl/IskTITcaIOa99c2J4RvE6bIZmae5nNHOrWENLgIpnq1lAH0DatgCWb8B
	SihNFEseNtB90kIvTCAkM+hXlqBP+vvsQ04xUwumjn+u7CG8T22hnx3NmwHt663YX9zSvj1s8Fc
	ILzbWu3oSUdDPjbjj2xKhZp8vjeMIpJXvd1ThadfkfnHMtSwYepFuUrcQBtr7n+kC/czF7C4ECK
	EsqqvvG4WrHZV6mNaUPDVWSuMl/iLgVZXxg8PxLxuNegc=
X-Received: by 2002:a17:90b:2fcf:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3b3d07b9254mr3603848a91.29.1795049287901;
        Wed, 18 Nov 2026 16:48:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40266feddsm49383a91.1.2026.11.18.16.48.07
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:48:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dcefso19401086d6.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049287; x=1795654087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBbPmdztzomulyuAItY+J9C/pXguZmjUxpV8/ldLzyo=;
        b=Lr75jsiyBTz7EJTngMhsE4wtTYUFJduomBE9/c+bRM4R5V49anWnQJxijH1U+ny8bg
         a95GXSwJr5dyFrTaaey6wM+7P03zecRa3zcg9DkMvIIcKkkq0pmEd5DiGiDF6okXGRd5
         T726giqYGNqSmnQKfEQV6mt1GLTcD5huj/yJg=
X-Received: by 2002:a05:6214:568d:b0:91c:359a:3263 with SMTP id 6a1803df08f44-92114d3e8femr65297986d6.7.1795049286531;
        Wed, 18 Nov 2026 16:48:06 -0800 (PST)
X-Received: by 2002:a05:6214:568d:b0:91c:359a:3263 with SMTP id 6a1803df08f44-92114d3e8femr65297406d6.7.1795049285830;
        Wed, 18 Nov 2026 16:48:05 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d88c55sm35280976d6.36.2026.11.18.16.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:48:05 -0800 (PST)
Message-ID: <4ad5124e-c063-48cc-97cf-ac1acc54351c@broadcom.com>
Date: Wed, 18 Nov 2026 16:48:02 -0800
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
Subject: Re: [PATCH net-next v2 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
 <179504864618.3136.11725933579190133133@kernel.org>
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
In-Reply-To: <179504864618.3136.11725933579190133133@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 16:37, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] In get_phy_c45_ids() (drivers/net/phy/phy_device.c), the first
>    MMD loop (lines 859-862) now returns get_phy_c45_probe_err(phy_reg),…
> - [Low] The patch fixes a real, user-visible failure but has no Fixes:
>    tag.
> - [Low] The kernel-doc of the exported phy_get_c45_ids()
>    (drivers/net/phy/phy_device.c:1091-1096) still says it returns '%-EIO…
> 
> --
> 
> net: phy: Map C45 probe read errors to -ENODEV during bus scan
> 
> This commit makes get_phy_c45_devs_in_pkg() return the raw bus error. In
> get_phy_c45_ids(), an -EIO or -ENODEV from the devices in package reads is
> now mapped to -ENODEV. A C45 bus scan can then skip empty addresses on
> controllers that report a read from an empty address as a bus error.
> 
>> Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
>> mapping as get_phy_c22_id() to the two places that look for a device at an
>> address: the loop over the MMDs and the MMD 0 fallback. Errors from the
>> reads of the per-MMD identifiers, which only happen once a device has
>> answered, are still reported as -EIO.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> [Severity: Low]
> Should this carry a Fixes: tag?

Agreed, v4 adds:

     Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider 
-ENODEV fatal")

> 
> Commit 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV
> fatal") was meant to make the C45 scan treat -ENODEV as non-fatal. It only
> changed the phy_c45_probe_present() call, on the assumption that this was
> the first place a read occurs.
> 
> In get_phy_c45_ids(), the first read for an address is actually the MMD 1
> devices in package read. phy_c45_probe_present() only runs for MMD 30/31.
> Commit 6f533abe7bbad2 already fixed a related problem in the same mapping
> and carries Fixes: 17b447539408.
> 
> This can be hit in mainline today, without the rest of the series.
> orion_mdio_xsmi_read_c45() in drivers/net/ethernet/marvell/mvmdio.c
> returns -ENODEV for an invalid read:
> 
> 	dev_err(bus->parent, "XSMI bus read not valid\n");
> 	return -ENODEV;
> 
> Take a DT child with "ethernet-phy-ieee802.3-c45" at an address where no
> PHY is present. Before this patch the path was:
> 
> fwnode_mdiobus_register_phy()
>    get_phy_device(is_c45=true)
>      get_phy_c45_ids()
>        get_phy_c45_devs_in_pkg() -> -ENODEV, returned as -EIO
> 
> __of_mdiobus_parse_phys() treats anything other than -ENODEV as fatal and
> unregisters the whole MDIO bus.
> 
> Without the tag, stable kernels that carry 17b447539408 and 6f533abe7bbad2
> keep the half-applied behaviour.
> 
>> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
>> index b39e945cebd73..4071041e1051d 100644
>> --- a/drivers/net/phy/phy_device.c
>> +++ b/drivers/net/phy/phy_device.c
> 
> [ ... ]
> 
>> @@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
> 
> [ ... ]
> 
>> +/* get_phy_c45_probe_err - map a bus error seen while looking for a device.
>> + * @err: negative error code returned by a bus read
>> + *
>> + * Like get_phy_c22_id(), report -ENODEV when the bus read failed with -EIO or
>> + * -ENODEV, which is how a controller signals that nothing answered at this
>> + * address, so that bus scanning carries on with the next address. Anything
>> + * else is reported as -EIO.
>> + */
>> +static int get_phy_c45_probe_err(int err)
>> +{
>> +	return (err == -EIO || err == -ENODEV) ? -ENODEV : -EIO;
>> +}
>> +
> 
> [ ... ]
> 
>> @@ -845,7 +858,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>>   		}
>>   		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
>>   		if (phy_reg < 0)
>> -			return -EIO;
>> +			/* returning -ENODEV doesn't stop bus scanning */
>> +			return get_phy_c45_probe_err(phy_reg);
>>   	}
> 
> [Severity: Medium]
> Can this early return skip a device that is present but does not drive
> the bus on the first MMD probed?

Yes, this was a legitimate issue. A PHY that only responds on MMD 0 
(Cortina CS4315/CS4340) would never reach the MMD 0 fallback on a 
controller that checks turnaround (UniMAC, mvmdio XSMI), because the MMD 
1 read would terminate the probe of the whole address.

In v4, a failed "devices in package" read in the MMD loop (-EIO or 
-ENODEV) is handled like an all-Fs reply: the loop moves on to the next 
MMD and then to the MMD 0 fallback, and -ENODEV is only returned if 
nothing answered.
Any other error code is still returned as -EIO immediately, and errors 
on the per-MMD identifier reads are still -EIO, as the commit message says.

For a device that answers MMD 1 with 0x0000 and then fails turnaround on 
MMD 2, the probe now also continues to MMD 0 rather than returning right 
away. If MMD 0 does not answer either, it is dropped with -ENODEV. That 
device violates turnaround, so I think this is acceptable.

> 
> On a controller that samples the pull-up, an MMD that does not respond
> reads as 0xffff. The loop then moves on to the next MMD, and after that to
> the MMD 0 fallback.
> 
> On a controller that checks turnaround, the same MMD now ends the probe of
> the whole address with -ENODEV. Examples are UniMAC, which returns -EIO on
> MDIO_READ_FAIL and gets read_c45 later in this series ("net: mdio:
> mdio-bcm-unimac: Add Clause 45 support"), and mvmdio XSMI, which returns
> -ENODEV when READ_VALID is clear.
> 
> A Cortina CS4315/CS4340 style PHY only uses MMD 0:
> 
> drivers/net/phy/cortina.c:cortina_read_reg() {
> 	return mdiobus_c45_read(phydev->mdio.bus, phydev->mdio.addr, 0, regnum);
> }
> 
> On these controllers, can the MMD 0 fallback below ever be reached for such
> a PHY, given that the MMD 1 read fails first?
> 
> A device can also answer MMD 1 with devs_in_pkg == 0x0000, which means it
> drove MDIO low, and then fail turnaround on MMD 2. That failure is also
> mapped to -ENODEV here. This seems to go against the commit message:
> 
>      Errors from the reads of the per-MMD identifiers, which only happen
>      once a device has answered, are still reported as -EIO.
> 
> mdiobus_scan_bus_c45() then swallows the error:
> 
> 	phydev = mdiobus_scan_c45(bus, i);
> 	if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
> 		return PTR_ERR(phydev);
> 
> So the device is dropped with no message. Before this patch, bus
> registration failed and the problem was visible.
> 
> Would it work to treat the bus error the same way as a 0xffff reply? That
> would mean continuing the loop, trying MMD 0, and returning -ENODEV only if
> nothing answered, instead of returning early.
> 
>> @@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>>   		 */
>>   		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>>   		if (phy_reg < 0)
>> -			return -EIO;
>> +			return get_phy_c45_probe_err(phy_reg);
> 
> [Severity: Low]
> Does the kernel-doc of the exported phy_get_c45_ids() still match after
> this change? The doc for get_phy_c45_devs_in_pkg() was updated, but this
> one still says:
> 
>   * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
>   * the "devices in package" is invalid.
>   */
> int phy_get_c45_ids(struct phy_device *phydev)
> 
> Both call sites in get_phy_c45_ids() now go through
> get_phy_c45_probe_err(). A real bus -EIO on a PHY that already exists
> therefore comes back as -ENODEV.
> 
> phy_get_c45_ids() is not a bus scan. gpy_probe() in mxl-gpy.c calls it on a
> bound PHY and returns the result as its probe status:
> 
> 	if (!phydev->is_c45) {
> 		ret = phy_get_c45_ids(phydev);
> 		if (ret < 0)
> 			return ret;
> 	}
> 
> call_driver_probe() logs -ENODEV only with dev_dbg(), as "rejects match".
> -EIO gets a dev_err().
> 
> Would a real MDIO bus fault during gpy_probe() now turn into a silent
> failure to bind?
> 

It did not; v4 updates the kernel-doc of both get_phy_c45_ids() and
phy_get_c45_ids(). On the gpy_probe() concern: a bus -EIO while looking 
for a device is now reported as -ENODEV, the same mapping that 
phy_c45_probe_present() already gets in this function. gpy_probe() runs 
on a PHY that the scan already found, so I don't think this is a 
practical regression and I would rather keep one mapping in 
get_phy_c45_ids() than split it by caller. Happy to move it into 
get_phy_device(), as the C22 path does, if reviewers prefer.

pw-bot: cr
-- 
Florian
