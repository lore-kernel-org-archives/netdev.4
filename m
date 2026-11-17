Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957399;
	b=ByN+r84jsoL63Uu26732t6DTJGnbG4Chq4SgBM5Xc0QPgsLqt5Svp3ItGej61Ca5NaQ+
	 QVPPIMHYVIV73Z+wxKmet5xM64nMKP62rjNOx3F79+u13sEOAcolu5GCIPcxWt4UIO+wY
	 +RzYdcbm1Dz5x1ordmQ3e4Az6LH56PoX8GUuC+sSeR91r0y843EviBbq6dkYyhSpE8LP4
	 A6QiAYOJc7yDiaIUp74AC0li2/4x+k8EbjMkUJSdJ8pntNhyypwJPP1ERMW2L1+wLDUcT
	 5GNbn+X1CogjmTErtnbHCP46FO+IuRqGeyccl97ZItWm+h5Q6P0cw5lRIatnkdniM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957399;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=C+Sk/8E0tupwYPTQMyI7HC4ANiqqhNWRgGKfgii2jGI=;
	b=fp9LndhbK2mBXOWcM71qzxLj/8eES/Ngtf7t2ymmheGPBIG4dab1VqZdXYapnjn/29xR
	 XLqHusW569VFxoXDTIda9gPAX5LuPGPmBldUljKsAl2KAfEbFoogo7l0yq88p512hhmV1
	 Tz7LXkMWVjMOtZ6hmVLk9o+SSRHED4AZQ8mP1OKesT+W350HDBNt56zYiaGpGOsZdBVmm
	 jBKw6cQeuiDKGwB15SxFHYVDafxgYSruatvQ+sLy5LE4IoiQ/55jiN3rHqDZGiMHw+5IF
	 xMzVd3eX+jGIiLQutG0fzrfevngtaSanARN0QlAm64DpQO3zaJBcJuOSs3mfqyln3Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OcUgIhbD;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EC606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OcUgIhbD
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso224461a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957399; x=1795562199;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C+Sk/8E0tupwYPTQMyI7HC4ANiqqhNWRgGKfgii2jGI=;
        b=NjhgNL/QZnrASgve2fZIczj/lSLSkLMZ9n4orhgqHKpJ/d0x3VVExHrfJwEUIZ+eDp
         68KEvHX9i4se4Gi8rlZ2vvD6utm+okZ5Lv/i3j/+F/iYGvnY3dtLNIZ6pYGiMji5L553
         D9HADZHb7tIAZw0J5zKMd7CfBOu3QhYn4UBR6jp5BP0X6FlVL3cg4OOKd2/eWL7VXLUn
         p3sjq6CrEL+Rj2HM+pd2CSnFscPhSrd1Hf/Vx4uDH5HA/pT09LVE9KDvpKU5izYYqUuT
         4RD58cNejlpvvQ4bINrqFFaroBz4xQVvXhkSR1I+i/p33h4wKmGJ7FtKY0YAIwuHbvHd
         nL5w==
X-Gm-Message-State: APuU4Z9WhCQRA/b4JnXx+tPlZo3JcvEOFhiu0qc3XmFvnQ50hw2BXJJh
	tW6gaXk1hsyRBsRreCYQviG3B3bQlKYFYqj+b/yuXwWiDlPENyxo6gWOyvmdIE7hzNNFtEsWB1t
	tvvVZnbcS3z/nUgC25XZkT3IJivgfRiQ/rxZSmEOcN7p2c7BhT3MjN4AHmzuO4YHIUSE6Zqz885
	l+bSdjIdysi/x5OLkqXzRIP/yH+S6BQ2Yej4DH+FzZBjCX/B0pF8OyHl6H81icdHI36f314CfV6
	+TAaEAd7dKM/bcS
X-Gm-Gg: AZFdTZeFaV8nETKBiv86wWKpSGmGlcO3BwP5pb/AwGDELRMSwg3O73WbDZ0RJtw2Gp8
	wlNht/BVp6nvy8nbL2NeJNmORd3EXLi62Vc4Vax0L+gscQCZ05EMA34bYK5BwcwAoIFqDsm+fUp
	DYoaNOFbxhXoYTKpsG0NL4pC3D4iymeetjiU96oVKCtdSkRChSX+a7xTajXMW5C5skUvVKcGBe2
	0/BLu6BOTPE49cYE+B9uwS8EdvDFsa920juRSkeGh+A6FWHkNPZvjCLSO4vBBdwKnI9+Mp40SAQ
	B0r82urKdRH/bxqFA7zg/unoBg9dBAE/mQB4axMfQT+Rs18AR0gH7zD6C+lHlvMiL2NhI/b9XMf
	vqEJurTTJDK8TiUmp0ktFSc4U6EP1eEyXWFLWJNnuDA73aBEzvhVpeEQI6LdcrfKuZjKHAYmPkQ
	bllWHVJQMJPDB/wmGexW0yNIC93XfqeoXjS6zUhjQ7
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr848945a91.21.1794957398906;
        Tue, 17 Nov 2026 15:16:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4bf2056sm148055a91.3.2026.11.17.15.16.37
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:16:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55bf3e01e65so9299021cf.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794957396; x=1795562196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+Sk/8E0tupwYPTQMyI7HC4ANiqqhNWRgGKfgii2jGI=;
        b=OcUgIhbDqrKOZSHuNsDh3o97Rt0R57Whdjqcrm97HBe7Zl15Wyqp7FftFMNAXEad4e
         PHkWpEb+qQQTaCx3snWOybrlYz8eI243dzxtG6NkFvrReLqVjSZB6bqs9LcqJskdkNvB
         /JCK6wzHX2U4F4HdO6aFDuJd3zdsZt/0IPXb0=
X-Received: by 2002:a05:622a:34e:b0:536:83ab:68e7 with SMTP id d75a77b69052e-55d5a323d3bmr14768471cf.7.1794957396311;
        Tue, 17 Nov 2026 15:16:36 -0800 (PST)
X-Received: by 2002:a05:622a:34e:b0:536:83ab:68e7 with SMTP id d75a77b69052e-55d5a323d3bmr14767981cf.7.1794957395654;
        Tue, 17 Nov 2026 15:16:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5903fbb5sm8018351cf.15.2026.11.17.15.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:16:35 -0800 (PST)
Message-ID: <10d589b6-67af-4ff8-b2ad-5bb79537acbb@broadcom.com>
Date: Tue, 17 Nov 2026 15:16:31 -0800
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
Subject: Re: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261113211554.2058181-4-florian.fainelli@broadcom.com>
 <179495158559.3136.13854046342906426133@kernel.org>
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
In-Reply-To: <179495158559.3136.13854046342906426133@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 13:39, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] This patch sets bus->read_c45 unconditionally.
> - [Medium] In the new two-cycle C45 sequence, the only completion check
>    for the ADDR cycle is the return value of priv->wait_func().
> - [Medium] MDIO_CFG now has two read-modify-write paths that share no
>    lock.
> - [Low] C45 callbacks and the MDIO_CFG clause switch are turned on for
>    every compatible in unimac_mdio_ids: brcm,asp-v3.0/v2.2/v2.1-mdio,…
> 
> --
> 
> net: mdio: mdio-bcm-unimac: Add Clause 45 support
> 
> This commit adds Clause 45 read/write callbacks to the UniMAC MDIO driver.
> Each C45 access issues an ADDR cycle followed by a READ/WRITE cycle, and
> MDIO_CFG is switched between C22 and C45 mode as needed. The BMSR
> workaround read in unimac_mdio_reset() is also skipped for children
> compatible with "ethernet-phy-ieee802.3-c45".
> 
>> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
>> index df267bb826966..6059b32580c54 100644
>> --- a/drivers/net/mdio/mdio-bcm-unimac.c
>> +++ b/drivers/net/mdio/mdio-bcm-unimac.c
> 
> [ ... ]
> 
>> @@ -96,7 +102,43 @@ static int unimac_mdio_poll(void *wait_func_data)
> 
> [ ... ]
> 
>> +static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
>> +{
>> +	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
>> +	u32 new_cfg = cfg;
>> +
>> +	if (is_c45)
>> +		new_cfg &= ~MDIO_C22;
>> +	else
>> +		new_cfg |= MDIO_C22;
>> +
> 
> [Severity: Low]
> Do all of the IP revisions in unimac_mdio_ids support the MDIO_CFG clause
> bit and the C45 opcodes (ADDR=0b00, READ=0b11)?
> 
> The C45 callbacks and this MDIO_CFG read-modify-write are now enabled for
> every compatible: brcm,asp-v3.0/v2.2/v2.1-mdio, brcm,bcm6846-mdio,
> brcm,genet-mdio-v1..v5 and brcm,unimac-mdio. They are also enabled for the
> non-DT GENET pdata instantiation. Nothing gates this per compatible through
> match data, and unimac_mdio_set_clause() also runs on every C22 access.
> 
> If a revision lacks C45 support, C45 accesses would put undefined frames
> on the bus. Those accesses can come from the core C45 scan on an unmasked
> bus or from SIOCGMIIREG with a C45 phy_id.
> 
> Could the commit message say whether all of these revisions implement C45?
> 
>> +	if (new_cfg != cfg)
>> +		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
>> +}
> 
> [Severity: Medium]
> Can this read-modify-write of MDIO_CFG race with unimac_mdio_clk_set()?
> 
> unimac_mdio_set_clause() runs under bus->mdio_lock. unimac_mdio_clk_set()
> writes the same register with no lock held:
> 
> unimac_mdio_clk_set() {
>      ...
> 	reg = unimac_mdio_readl(priv, MDIO_CFG);
> 	reg &= ~(MDIO_CLK_DIV_MASK << MDIO_CLK_DIV_SHIFT);
> 	reg |= div << MDIO_CLK_DIV_SHIFT;
> 	unimac_mdio_writel(priv, reg, MDIO_CFG);
>      ...
> }
> 
> It is reached from unimac_mdio_resume() after the bus is registered.
> Before this patch, bus accesses never wrote MDIO_CFG.
> 
> The GENET parent resumes first. bcmgenet_resume() calls
> phy_start_machine() (or phy_start() through bcmgenet_netif_start()). With
> mac_managed_pm set, the PHY state machine work can then issue MDIO
> accesses while the child unimac resume is running clk_set.
> 
> Two interleavings look possible:
> 
> (a) clk_set reads cfg, set_clause flips MDIO_C22, then clk_set writes
> back the stale clause bit. The next ADDR and data cycles go out in the
> wrong framing. For example, a WR_C45 becomes a C22 write of val to
> register devad.
> 
> (b) set_clause reads cfg, clk_set writes the new MDC divider, then
> set_clause writes back the old divider. The restored MDIO clock frequency
> is lost until the next resume.
> 
> This needs a "clock-frequency" property, otherwise clk_set returns early,
> plus mixed C22/C45 traffic so that the clause bit actually changes.
> 
> [ ... ]
> 
>> @@ -107,8 +149,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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
>> +	} else {
>> +		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
>> +			(reg << MDIO_REG_SHIFT);
>> +	}
>>   	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> 
> [Severity: Medium]
> Is the ADDR cycle guaranteed to have finished before MDIO_CMD is
> overwritten here?
> 
> The only completion check is the return value of priv->wait_func() in
> unimac_mdio_addr_c45(). For GENET-instantiated buses, that is
> bcmgenet_mii_wait():
> 
> bcmgenet_mii_wait() {
>      ...
> 	wait_event_timeout(priv->wq,
> 			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
> 			   & MDIO_START_BUSY),
> 			   HZ / 100);
> 	return 0;
> }
> 
> It returns 0 even when the wait timed out with START_BUSY still set. With
> HZ=100, HZ / 100 is a single jiffy. That can expire well before a ~25 us
> MDIO frame completes, and the same happens if the MDIO_DONE interrupt is
> delayed.
> 
> In that case unimac_mdio_addr_c45() reports success while the ADDR frame
> is still in flight. unimac_mdio_do_read() and unimac_mdio_do_write() then
> write the RD_C45/WR_C45 command and set START_BUSY again without checking
> that the controller is idle. Could this corrupt the frame, return data
> from an incomplete read, or send a C45 write to the wrong register?
> 
> bcmgenet_mii_wait() behaves this way independently of this patch. What
> this patch adds is the dependency of the data cycle on the ADDR cycle.
> The "if (ret) goto out" after the ADDR cycle can never trigger on GENET
> buses.
> 
> [ ... ]
> 
>> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>>   	bus->parent = &pdev->dev;
>>   	bus->read = unimac_mdio_read;
>>   	bus->write = unimac_mdio_write;
>> +	bus->read_c45 = unimac_mdio_read_c45;
>> +	bus->write_c45 = unimac_mdio_write_c45;
> 
> [Severity: High]
> Can setting read_c45 unconditionally make bus registration fail on the
> non-DT GENET path?
> 
> With read_c45 set, __mdiobus_register() runs mdiobus_scan_bus_c45() on
> every address that is not masked and has no C22 device. On an empty
> address, a C45 read sets MDIO_READ_FAIL, and unimac_mdio_do_read()
> returns -EIO:
> 
> 	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
> 		ret = -EIO;
> 		goto out;
> 	}
> 
> get_phy_c22_id() converts -EIO to -ENODEV. get_phy_c45_ids() does not:
> 
> 	phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
> 	if (phy_reg < 0)
> 		return -EIO;
> 
> mdiobus_scan_bus_c45() then aborts on any error other than -ENODEV:
> 
> 	if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
> 		return PTR_ERR(phydev);
> 
> On the non-DT GENET path, bcmgenet_mii_register() does:
> 
> 	if (dn)
> 		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
> 	else
> 		ppd.phy_mask = ~0;
> 
> That leaves bus->phy_mask = ~pdata->phy_mask = 0. With np == NULL,
> of_mdiobus_register() calls __mdiobus_register() directly, so all 32
> addresses are scanned.
> 
> The C45 scan starts at address 0. With a PHY at address 1, as on ACPI
> systems such as RPi4 BCM6E4E, the first empty address returns -EIO.
> __mdiobus_register() then removes the C22 PHYs it already found, and
> unimac_mdio_probe() fails with "MDIO bus registration failed". The MAC
> is left without a PHY.
> 
> DT-described buses are not affected, because __of_mdiobus_register()
> forces phy_mask = ~0.
> 
> Should C45 read failures on empty addresses be reported as -ENODEV (or
> 0xffff) instead of -EIO, or should the C45 callbacks be limited to buses
> where the scan is masked?
> 

The clause bit is present on every GENET v1–v5, ASP and UniMAC block in 
the RDB (register data base), and that C45 is only functionally 
validated on the the ASP/GENET and 4908.

Regarding the other findings:

   - High (read_c45 set unconditionally): fixed by "[PATCH net-next v2 
1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan" in 
the v2 posting. It maps C45 probe read errors to -ENODEV, so the 
empty-address -EIO no longer aborts the scan.

   - Medium (ADDR cycle completion): valid. bcmgenet_mii_wait() returns 
0 even when wait_event_timeout() expires with START_BUSY still set. I 
will add an unimac_mdio_poll() call at the end of 
unimac_mdio_addr_c45(), so the data cycle never starts on a busy 
controller. The C22 path has the same weakness today, and I left it 
alone. Making bcmgenet_mii_wait() return -ETIMEDOUT would be a separate 
GENET patch.

   - Medium (MDIO_CFG race): valid, but only in the resume path. 
unimac_mdio_resume() now takes bus->mdio_lock around 
unimac_mdio_clk_set(). I didn't lock inside clk_set itself, because 
probe calls it before __mdiobus_register() has initialised the mutex.

pw-bot: cr
-- 
Florian
