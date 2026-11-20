Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151708;
	b=4Cuo78DPahzHCvHvhJCe61QvCpZ+hDsdulgbZAgquRvLnAU/yBmorYNLaTZ5JD95eYic
	 GPeCXx2j7q42R5GF1fGjKcwsbby6YtKa6nOT6Ja81AGskuiIIL1WdQsn8vWn+j9pSv/H6
	 gBzodfNK2rAV0A6AnvxKWeFHUwSX3nsMK3Z+2rAeNPa0wgDmOD4pMyxoZ5cWzJCGTBNC1
	 UrJn0SZtLJLbghqK4NzVqWgpNrqo3H3coGnrq6IRUcKFkoAirhGy8qsNJKS0STdq5nu6x
	 Su8d5QMxEjMWmKMcqaMVQB12SdygfLWpO8SIFqZGXmQhLlfFbFvTnRmshw2KCpy8HeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151708;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bFE3Eo2DvuaZ1wTJc8DxEMPAXv4+iklEyrldQBupXXA=;
	b=fT9690jAX+XWgz0YP6xyuSEGo1cOgZLLndcTq3Jn3wZ4OmzJKWFXRSlH5YrBJiudVqZO
	 2JwsROp9Q2fKinm9bdPS9SA65iEN5Fd2w8eIJ/Er38F8VFrXF0J40ay8yg77QJabTmNYq
	 CewWnxVA37576Q9EN3BI0/J92ri8kqPS8cFpRrvLr2RRCheqOwimHeOzLcAH93hhsvosz
	 rK0adbPPA2jUq5Ag1WmS9Mcnzap0ohGGQkVmHrQeW4WiK0ZNr4KTxwNFQg1d3jIXn2Rvq
	 qzp8sP0D9tDNv3gYJ8PlOsO2jugjeaSzL1vwrpqPq6Fil7Oe751obf6RtrJzLhTW0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WGvGFChH;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD960A2601
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDD960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WGvGFChH
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-949657a20d7so70555485a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151707; x=1795756507;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bFE3Eo2DvuaZ1wTJc8DxEMPAXv4+iklEyrldQBupXXA=;
        b=Ft8O1/4ZELa/r/U0XPyHIJ5kiQXiSawZghQbPHBRvAwdHwxrdqe7SrzMBAKOH95omy
         lkOPI6TRgeOeEy4zXxRBcdHYDpCwEbeNdkgUcHUcHo0LvYx8fKU1S7DdxyiCmSBSgzKe
         CUdfwuO4DIehsDsN32fnPwFioorRRhl24dDNLOFy9PgSTlIf3LEbkh1Kq/HyWK7dILPP
         Qf4iTuChGh9zTYoVbPVpYUwudcsA1le6oxzxpe2B0MttUS2Ndqgllb8+N/0vJo8qMSCb
         QZ1UslMBuoyb6cd/4dMUnqSi2FkNZAiSab5HeB6XNydqzyzU2c01JcW1RNTgZEsmkvGp
         MpEg==
X-Gm-Message-State: APuU4Z82aNrruoSCj/GIzBS7yTFj77propMiqO/Q5uLzu58limsYpeX5
	KO/++K7ogCLaYrbA9AWByUrhFkEn0OSsDRQamR1F13kCUtUcxBu/u8gAxWd2F2OZ7P2hOg0agrT
	2K5HPWDU0azH6fNnaYu2yyNm1UAMBhK30jQ0e3ppsuk54eVO45z1NpABp2B51g+pjC4c0o7P+IE
	x/lt073S6IqMRevW08X1nR7GTLVh50Qcol95MQ0S+7UF3zmWzDvEO0JZaa7c3QDYrPMRttg3rX8
	CrZPCEJPlB8oKqw
X-Gm-Gg: AYBFou0N5m+xTs6aisFYlmYnmdI5MLIj6dTnsKJ/rF2LJAH4fRWRhBm+3d3dpEv35VH
	zITr2kT+KAKA5+nd36yVEl+J/1hNbdcMI1le+VfTbRLZxJlh6k37ee1V+nQN9ACoA0zVasyzE79
	FgJspYNtExb4GGJN/HQ8qYaIy7dqBbCZrudm5mROuZNecgKRbcNvjOxnYY5B3wO57KqOWtvlM4s
	YCU6uWFN5btVur5N0zZenK7VnZWMu0ZlIUJVgOdVOe+JhSahsXzOZNPjiJLoyBTniItPyLmHwoX
	4ePqh0blvbIPnGSFMCHPHXbLxm9EO9I4ZhGOiVWIlD5c6BYKvff7zTExLe+cjImQupc8vrTJXDf
	Vn2ClzhlNgu1y9tYJLKpVB9hsCB6nPupPnH9zbRpMwiWwXhmmv2xYMwT6taG8mWb1trUBuqsoan
	aa52IHKKftzygzYBZ/J1/zmUvGAqYNIE6PamvZ04kPrIs=
X-Received: by 2002:a05:620a:44c2:b0:93f:2d52:613a with SMTP id af79cd13be357-949ba95dba9mr332563585a.29.1795151706954;
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb22c72dsm12630085a.6.2026.11.19.21.15.05
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383f2d05c73so1536467eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151705; x=1795756505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFE3Eo2DvuaZ1wTJc8DxEMPAXv4+iklEyrldQBupXXA=;
        b=WGvGFChHssk/0ReJvDMeZ9M2Zgtp9hJr0PnLvYSvuEViftF46fgkaUTNe7EA65lzhZ
         sLXpZUHqu33xfCVFZPYqyTlVE1DqLFt+cH6DAMUSKuGkev9/6svQx3/JDn/Lay5DR1qj
         /Rl9RwKxEFfAooI9wLnuXz2+yunQ2NfGMbblA=
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr1599341eec.40.1795151704823;
        Thu, 19 Nov 2026 21:15:04 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr1599298eec.40.1795151703967;
        Thu, 19 Nov 2026 21:15:03 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm2235717eec.24.2026.11.19.21.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:03 -0800 (PST)
Message-ID: <700b62af-5d33-49aa-844b-53d63aa2e52f@broadcom.com>
Date: Thu, 19 Nov 2026 21:15:02 -0800
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
Subject: Re: [PATCH net-next v3 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nb@tipi-net.de, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261117233149.1693881-5-florian.fainelli@broadcom.com>
 <179514208239.3136.3516165434506848044@kernel.org>
Content-Language: en-US
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
In-Reply-To: <179514208239.3136.3516165434506848044@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/19/2026 6:34 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In drivers/net/mdio/mdio-bcm-unimac.c, the patch's own comment
>    in unimac_mdio_addr_c45() says some wait_func implementations…
> - [Low] The commit message does not mention the change to
>    unimac_mdio_resume() in drivers/net/mdio/mdio-bcm-unimac.c.
> 
> --
> 
> net: mdio: mdio-bcm-unimac: Add Clause 45 support
> 
> This adds Clause 45 read and write callbacks to the UniMAC MDIO driver.
> Each access does an ADDR cycle followed by a READ or WRITE cycle, and
> MDIO_CFG is switched between C22 and C45 mode as needed. It also skips the
> BMSR workaround read for children compatible with
> "ethernet-phy-ieee802.3-c45".
> 
>> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
>> index df267bb826966..ec0f2e8070eeb 100644
>> --- a/drivers/net/mdio/mdio-bcm-unimac.c
>> +++ b/drivers/net/mdio/mdio-bcm-unimac.c
> 
> [ ... ]
> 
>> @@ -96,7 +102,53 @@ static int unimac_mdio_poll(void *wait_func_data)
> 
> [ ... ]
> 
>> +	/* Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0
>> +	 * even when they timed out with the controller still busy. The data
>> +	 * cycle must not be started before the ADDR cycle has completed, so
>> +	 * make sure the controller is idle.
>> +	 */
>> +	return unimac_mdio_poll(priv);
>> +}
> 
> [ ... ]
> 
>> @@ -107,8 +159,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>>   		return ret;
>>   
>>   	/* Prepare the read operation */
>> -	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
>> -		(reg << MDIO_REG_SHIFT);
>> +	unimac_mdio_set_clause(priv, is_c45);
>> +	if (is_c45) {
>> +		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
>> +		if (ret)
>> +			goto out;
>> +
>> +		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
>> +			unimac_mdio_c45_devad(devad) |
>> +			(reg & MDIO_C45_REG_MASK);
> 
> [Severity: Medium]
> The comment in unimac_mdio_addr_c45() says bcmgenet_mii_wait() can return
> 0 while MDIO_START_BUSY is still set. The extra unimac_mdio_poll() runs
> only after the ADDR cycle. Can the same early return happen on the C45
> READ data cycle?
> 
> bcmgenet_mii_wait() returns 0 every time:
> 
> drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_wait() {
> 	wait_event_timeout(priv->wq,
> 			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
> 			   & MDIO_START_BUSY),
> 			   HZ / 100);
> 	return 0;
> }
> 
> At probe time, the GENET ISR that calls wake_up(&priv->wq) is not
> installed yet, because request_irq() happens later in bcmgenet_open().
> On v1/v2, UMAC_IRQ_MDIO_EVENT is not enabled at all. In both cases these
> waits depend only on the timeout. With HZ=100 the timeout is one jiffy,
> which can expire at the next tick.
> 
> The RD_C45 command places reg in MDIO_CMD[15:0]. After wait_func(),
> unimac_mdio_do_read() does this without checking MDIO_START_BUSY:
> 
> 	cmd = unimac_mdio_readl(priv, MDIO_CMD);
> 	...
> 	ret = cmd & 0xffff;
> 
> If MDIO_CMD[15:0] still holds reg until the hardware writes the read
> data, could an early return give the caller reg as the PHY data? This
> would also happen before MDIO_READ_FAIL is latched. For example, a read
> of MDIO_DEVS2 would return 6 and a read of MDIO_DEVS1 would return 5.
> get_phy_c45_devs_in_pkg() could accept that as a plausible devs_in_pkg.
> 
> read_c45 is now set, and the non-DT GENET path leaves bus->phy_mask at 0.
> So __mdiobus_register()->mdiobus_scan_bus_c45() issues these reads on
> every address that has no C22 device. Could get_phy_c45_ids() then
> register a bogus C45 PHY?
> 
> The write side looks similar. unimac_mdio_do_write() returns 0 after
> wait_func() even if the C45 WRITE is still in flight. Could the next
> access's unimac_mdio_set_clause() then flip the MDIO_C22 bit in MDIO_CFG,
> or write its ADDR command to MDIO_CMD, while the previous frame is still
> going out?
> 
> The C22 data cycle already returned early in the same way before this
> patch. The reg-as-data result and the MDIO_CFG switch mid-frame are new,
> though.
> 
> Would it make sense to have bcmgenet_mii_wait() return -ETIMEDOUT on
> timeout, or to run the idle poll after every cycle and not only between
> ADDR and DATA?
> 
> [ ... ]
> 
>> @@ -336,8 +437,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
>>   static int __maybe_unused unimac_mdio_resume(struct device *d)
>>   {
>>   	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
>> +	int ret;
>> +
>> +	/* MDIO_CFG is also modified by the MDIO accessors to switch between
>> +	 * Clause 22 and Clause 45, which run under the bus lock.
>> +	 */
>> +	mutex_lock(&priv->mii_bus->mdio_lock);
>> +	ret = unimac_mdio_clk_set(priv);
>> +	mutex_unlock(&priv->mii_bus->mdio_lock);
> 
> [Severity: Low]
> This isn't a bug, but the commit message doesn't mention this change to
> unimac_mdio_resume(). The resume callback now holds
> priv->mii_bus->mdio_lock around unimac_mdio_clk_set(), because
> unimac_mdio_set_clause() does a read-modify-write of MDIO_CFG, the same
> register that holds the clock divider.
> 
> The message covers the C45 accessors, the BMSR workaround skip and the
> C45 scan. Could it also describe this locking change in the resume path?
> 
>>   
>> -	return unimac_mdio_clk_set(priv);
>> +	return ret;
>>   }
> 

On the Medium: this one is valid, thanks. wait_func() implementations 
such as bcmgenet_mii_wait() can return 0 with MDIO_START_BUSY still set, 
and v3 only guarded the ADDR -> DATA transition. A C45 READ that 
returned early would hand back MDIO_CMD[15:0] (the register address) as 
read data, and the next access could switch MDIO_CFG or rewrite MDIO_CMD 
while the previous frame was still in flight.

v4 adds unimac_mdio_wait(), which calls wait_func() and then polls for 
the controller to go idle. It is used after the ADDR, READ and WRITE 
cycles, so the idle check no longer depends on the wait_func() 
implementation. I kept the fix in the unimac driver rather than changing
bcmgenet_mii_wait() to return -ETIMEDOUT.

Side effect, now spelled out in the commit message: C22 accesses use the
same helper, so a C22 cycle that times out on a busy controller now 
returns -ETIMEDOUT instead of silently returning stale data.

On the Low: the commit message now describes the locking added to 
unimac_mdio_resume().

pw-bot: cr
-- 
Florian

