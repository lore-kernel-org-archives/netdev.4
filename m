Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201862;
	b=mwoH1tnl6gPv2u9rEZfV6T1L362k+y1gENCgcYm+Sdoy93z4Ri1P3jnWrBo3O6h69V4y
	 i7T2AaMnl2JIKFeAPBjGKM17yZjU9cfyxDk4EfYcSQPBvwI3PFz8S+KZjkwJpPGAoN3wV
	 KeNmCGaKe0SuAWkUcbe5wo95u46KNbEl5T/WLlpdwwORD5cW8cdBYeOmfBEruGULUfH1T
	 VB7MXrEaZKbAGTkPcbHaJsOuP09cQXyTsJxyVAhps0KMFu0pKsBAoUA6zwePGhKneCutk
	 Vfki0nPd+0xhLwWMefC4OzLg5fC27/Y2vm9S5CilQCgG6F8jo/lYH4aECFXK75l5acw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
	b=Db1unYDGOiqvSLNn7KK4Vmn3f5cledfh0E5VpR7d3zDa3MSVEQ0lO1s/GE4C2T31eulP
	 Q82qpPWpb+3D5FRASe83+r4iHCnC4AUMRTgapc3yorsL+MCFAXKRWTq8z3lyhyH4VxM/2
	 YoFWUGq6uGTUNFnpkhce7h8jIxxxxNJwfICD9fJTGoFMhrTuoiM+BBbQb2bEJ/sFQ8rIm
	 lKfHPZcTDqcfENZHlNwkhTRUTfXqNvUAAwblW8AFzvKykZSloosXxS+ICGN9jZaGIhc5M
	 y7jrBYgZHievU66Z1vrf4ajbJn3rsLDvzy+wSdwCgA2G5QoB5v1xswX1OkJgC17//QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P1GXsIfW;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD92B60A261B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD92B60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P1GXsIfW
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-92119da3d37so11749946d6.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201860; x=1795806660;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
        b=VVXUncCQiuUfJTWl+6d2QLe1mqgUpan0yFwl5k0Bmwb8jJ7qFWUhDAXnHLkUTfqMSe
         r8ybZ5luvZ/t/nSFYMfKD5w4YT3+e+xQFcOIVmC/ypS0mYaZzQSj/LQhtLkNA9KuGMA8
         a9P8fgoOo9XnF1/9MOvFTiuSjwlMrkbwM4uHfDHzGNxNnalqVYycbOEhGuErKtI7SCKJ
         1b6TOhNzyASvAc7ypcqnjVOoH29i4KGhTUTakEl9SBv0sJK1RjEPAzLyuyGC99B32N7u
         fdjaADX0918xNf8+hVIcNOo/2W02EYtFeAV9SFIMEviBOvG8Hm5Q/wx7RWdiU0+Yqxn3
         IDbw==
X-Gm-Message-State: APuU4Z8tXdVD7Ek+nkpvl1vznVBgm3wmaSkbUW9WmeHwDj5fOzMLAaXg
	MsXFwiV5oNCFlwrUQy1BesTQSmkRiPzB6AabbyTqjvrVAITZ0KMCsVBWSk1UCFf59B4wqXc10s3
	CwjWRKm8I5D/hTPO1OGdrXUaA4WgxcfXlnl4M5koiTFTxj92rfwDE1SWLICdQ6wJ/tMR4/0M9Y2
	BmNdeTOv/w9RP5ZLvFK9G2j1BIJ+gw+yS/vnTZ6OdpwPzk57ANVghL1oludoTHJclrN+zFfbza+
	GazZ9HuTIzgT3sg
X-Gm-Gg: AZFdTZeG+imbjg5p5erTc7w0+WDg0U1R3Xj50Nplt1OSW+TxBmj5S4hctQNcAKaiMPy
	YWifQ5YhDJgRxxNouAKjylJV4/FMt6EjGPPMlcEjp+NF/st/9oulkkS8ge+xSk5HbBrMwGU2yae
	du9j6hZjVAfMFjrrdwidXYbkQZVk1J4TmBqpnKp4v9IlE4D25rLbvMWfIG2PUDXBnGVios0Y/7f
	GCrrNpCzwAaScN6bsr9sAwmrgYDiwJ1rC41Sk33mxqIBdhVWO2mhBrXAtCRMPmD1qUkIgN1sFAf
	CzumC+cHGwsDsb0sqyOIMysLjH/EXQU6uf+skUN4mlIUlW04GI89fGzb0hGcJfy1hyp7sT3PNOh
	KYAEav3FDlqm5hVG0SImGEaNWPklY9mW6o7NrztYlZvDJQHn9Kmk3c/s9p4YVgozdvDSxFW+OQC
	ThMOcyOoVL7WZ4NnuR2UDxzCV897Slje76d8oWcyVmLkk=
X-Received: by 2002:a05:6214:3216:b0:921:152a:b102 with SMTP id 6a1803df08f44-921349cde0dmr75244826d6.3.1795201859617;
        Fri, 20 Nov 2026 11:10:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-92134a2c451sm270536d6.44.2026.11.20.11.10.59
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:10:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so263331585a.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795201859; x=1795806659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
        b=P1GXsIfW2byvL/pIY0MoTb5D2/1V7/kxdLovQRQY4O+uFL+kJeL7shNHvv1Q5rgOY+
         RwYM5JHxvgBZjx9bM3UNL/BFViT6U+EznQ1JXpx85/mChB78jjVaCm3OBXYXoSLUVcXO
         e7CJZLh5WKkLGgztMR890OlqFbHE9RntuAKXQ=
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr692203285a.5.1795201858833;
        Fri, 20 Nov 2026 11:10:58 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr692198185a.5.1795201858397;
        Fri, 20 Nov 2026 11:10:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm261924985a.15.2026.11.20.11.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:10:57 -0800 (PST)
Message-ID: <53f8b30a-99d4-47cd-9838-85aaa4da6df1@broadcom.com>
Date: Fri, 20 Nov 2026 11:10:55 -0800
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
Subject: Re: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261119005943.999981-5-florian.fainelli@broadcom.com>
 <179515311151.3136.11984816802162340674@kernel.org>
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
In-Reply-To: <179515311151.3136.11984816802162340674@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 21:38, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] unimac_mdio_probe() now sets bus->read_c45/bus->write_c45 for
>    every instance, including the one GENET creates from platform data.

Your analysis is correct: without a DT node nothing is masked, and 
bcmgenet_mii_wait() sleeps for a timeout per frame since irq0 is only 
requested in bcmgenet_open(). I'd rather not special-case that path:

- it only affects GENET probed without a DT node (ACPI/UEFI), and it is 
an one-off cost at probe time, bounded to two failed C45 reads per address

- the C22 scan on that path already pays the same per-frame sleep, so 
this slows an existing slow path rather than creating a new one

- C45 support is a property of the MDIO controller, not of how the 
platform device was instantiated, and gating it on DT or on pdata would 
make the driver's behavior depend on the firmware interface.

The commit message now says that this scan runs there and why it is 
slower. If the probe time turns out to matter, the fix belongs in 
bcmgenet_mii_wait(), which should poll while the interrupt is not 
registered yet. That would speed up the C22 scan as well and I'd rather 
send it as a separate GENET patch.


> - [Medium] The patch's own comment in unimac_mdio_addr_c45() says
>    bcmgenet_mii_wait() can return 0 after timing out with MDIO_START_BUSY…

Agreed. v5 adds unimac_mdio_wait(), which calls wait_func() and then 
polls MDIO_START_BUSY. Every cycle goes through it: the ADDR frame, the 
RD_C45/WR_C45 data frame and the C22 read and write. MDIO_CFG is 
therefore never rewritten while a frame is in flight, and the read data 
is never fetched before the frame completes. The commit message explains 
this.

> - [Low] unimac_mdio_resume() now takes priv->mii_bus->mdio_lock around
>    unimac_mdio_clk_set(), so system resume now serializes against, and…

The commit message already said that resume takes the bus lock around 
unimac_mdio_clk_set(). v5 also says that resume may now wait for an 
in-flight MDIO access.

pw-bot: cr
-- 
Florian
