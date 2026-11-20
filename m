Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151011;
	b=YaScxiNJ6VuHgx6dtk1bSwb68wan0tnxtzVwWWBhu2m2s9tfqNDV1dv86pmw0eQ1kAUr
	 xfm05eZenLUyxaWdwU9m/kMDFpuwtupC70nEmi9WdYeHcKtcZcg1fK9+vSKvbGCtjHDGH
	 MtSD+vIPQwmnlPa1DE2DETo3PKF1XiW7L+vulwBKYY/OKaO/DacL+WKX4xDDFduVv6r+k
	 3eBdwKGlVquIB8K86dTqOynIEdx4LpM7q0APRszIkJ5MG8NkHiiRxCcEuyc+Ctm+fQ5H+
	 e2fV4hUrUlKQHcFCmbV3Mbhus2jfiEqangY2My3Ct/UBWd7oNnjO1IB9bPd/5XGrpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=RbQQ9/O/jzxCSMeRinvmgKMm9hFLEWA5A3AHN/iae4I=;
	b=TIiqJRqF+1EFprBgeJMN+MWA6y9lKIMgurIeq/Z7xenGPjXIZ4YHO836zs6+I5KLzEU6
	 QkMc2HhC6J2dMPqjKpIsEiXlEF55XyEVqpPd4gX0stksYgHwpC5DIRqzeLJQIFiwlL1wb
	 MkxQtn+VrlidAsn6UfxKc+4z9H2LBd3+zXgnpXK1eabCMu8zcZMHWRnH9N+aoJLBk2qXz
	 Hmw0Hr7wiEvbarbDzIIBIJpEso98gUbadBRYpfksR8DTRMS7Vy9+5TSsyYczv3fB82JDp
	 9/VFjNs2ZsSZtRNyjAj3nw5YmwgNbcLwM0oLfCxrl/pRE28pSreJfZQYWLZVQHRBt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JUaRwmAa;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658C606A334
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7658C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JUaRwmAa
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b413997581so459579a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151010; x=1795755810;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RbQQ9/O/jzxCSMeRinvmgKMm9hFLEWA5A3AHN/iae4I=;
        b=lNL41pQRJDDw08H3mq806Lk4cqdZOUxUIt5mMMnyaKKrhZ/waEx2tJok8CtrHeAAC6
         16fylZGvPwNm8mrJrFlRwykfuvD6XMzIUa/0oMLDoDZX2DMndrSRQsVhz6ytokSU+ThE
         IccftSEXNyN9a9gUXqCdEeUOB21HvAl+5+kfhZISC5bC5aVwBg87gUxuW54FDA8khjp4
         eHCIVU79Rea+NmSWYTmhjh12SEW3QzXtioUPLaCeANFFFNgL3MEpNZPTUp+p4KCFDxlC
         mONMovR0QHkSbfy1OaRzPZEd8x3/tODT/ouWsegKenrvlaSG71tb+maGSW6WGlxkc9pN
         OWqA==
X-Gm-Message-State: APuU4Z+Zw5GBY48yeEWqaEV3UibvFSPgVV7PpqJI6QuEF/Ha4ZFRsDat
	TyJ+QmdUBx55/VSp5NaUcJTmGzMxW2TkO3gh40SvE3xeMeUJJqsDRLY3HMoEJPIuYOzOaNl/aua
	TclFwV94HRwrRfvdc/eDsFWWs/LWx5s+QiLEmhngok14t3FejYi0kyjhQosXlUMvy1CabBgt3EC
	IfGWlchiRSy4TPPNBPmC27ADM3EVjV1WoFvOlT6s33wvCG78QQU2cX0W0b2C12OCnaO4jvdv5tR
	aZY80WXQfiPFnmR
X-Gm-Gg: AZFdTZe9EcwXyLBIag8BuF4qyuVrgihhu6e5r4eXMwggQPWXcjHsrPkI+8PtNpI2f7N
	SuKkyGIYdwD04pKrMnEiy7u5zZ237izmAgePBcHjQW2ucqWcQ7frdhktf0yuAjgO4M0dDjxYDbq
	bnbNbzKTji2PuE4p3VcuEcVm7vzU/OVKz8h2U2muMKS2mGRLIPDhBA/YqVFvtsLajji3y5kcq+W
	DQ2G0xbo630vfY8fquveC+dK4KlIM7UURWhjRKuUg5ZEqcGOsdWK4td91W4eKilJkrI9yeWdPrY
	vnNvZU12ybm1TgzLMXS+Jl9ReArBXOZAcux4/5ukRIA5xXlyCQP+WKP8LxpDdpq/4U+RBw7aqHJ
	LCrXkvhM1ttE+xg8M5DnbvRH3n5hnLCfYW1avFt6iZ7l7t9+fRhKs7qKmIvt11GGoJadetedW5W
	kyZNP38zqnDAHH8lY9Hka2/2rBR+Q1K6EKEW9Rwg67
X-Received: by 2002:a17:90b:2ecb:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b41c989fecmr1375359a91.49.1795151009564;
        Thu, 19 Nov 2026 21:03:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffad038sm381080a91.3.2026.11.19.21.03.29
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:03:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1070737c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151008; x=1795755808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbQQ9/O/jzxCSMeRinvmgKMm9hFLEWA5A3AHN/iae4I=;
        b=JUaRwmAaklAGxVZjTXWp1+n5bYmB8BmOHz9VxW9DQ5VSYqy9OpCBFsKiADmEvxPJ64
         qsul2MqZ1ksa+igpvmOsodS4PHiWEKrg4w+0c1N2XJhdw8sIHhXjGK5uiE4NgC2Z8bfc
         kP9klmCl2ucJRIA5GtJD3n/ECqWeuXmvhHLjQ=
X-Received: by 2002:a05:701b:2313:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b5568b31admr1617066c88.9.1795151007551;
        Thu, 19 Nov 2026 21:03:27 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b5568b31admr1617028c88.9.1795151006816;
        Thu, 19 Nov 2026 21:03:26 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm3392373c88.7.2026.11.19.21.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:03:25 -0800 (PST)
Message-ID: <3d4bb44c-906e-4f77-9601-ab4b1f47879b@broadcom.com>
Date: Thu, 19 Nov 2026 21:03:24 -0800
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
Subject: Re: [PATCH net-next v3 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nb@tipi-net.de, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261117233149.1693881-2-florian.fainelli@broadcom.com>
 <179514208109.3136.8422011628328621271@kernel.org>
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
In-Reply-To: <179514208109.3136.8422011628328621271@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/19/2026 6:34 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 3 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] On MDIO controllers that flag a missing turnaround as a bus
>    error, get_phy_c45_ids() now treats one failed Devices-In-Package read…
> - [Low] The subject says "during bus scan", but get_phy_c45_ids() is
>    reached through get_phy_device(bus, addr, true) for every C45 caller,…
> - [Low] The patch updates the kernel-doc of get_phy_c45_devs_in_pkg() but
>    leaves the return-value docs of get_phy_c45_ids()…
> - [Low] (Baseline: judged a false positive, kept only because
>    requires_validation=true.) The concern says the commit message's…
> 
> Pre-existing issues:
> - [Low] (Baseline: dismissed as a pre-existing low-severity issue, kept
>    only because requires_validation=true.) In the second loop of…
> 
> --
> 
> net: phy: Map C45 probe read errors to -ENODEV during bus scan
> 
> This commit makes get_phy_c45_devs_in_pkg() return the raw bus error. It
> maps -EIO/-ENODEV from the devices-in-package reads in get_phy_c45_ids()
> to -ENODEV, the same way get_phy_c22_id() does. The intent is to let
> mdiobus_scan_bus_c45() move past empty addresses on controllers that
> report an unanswered read as a bus error, instead of failing
> __mdiobus_register().
> 
>> net: phy: Map C45 probe read errors to -ENODEV during bus scan
> 
> [Severity: Low]
> The subject says "during bus scan". However, every C45 caller reaches
> get_phy_c45_ids() through get_phy_device(bus, addr, true). Does the new
> mapping also change behaviour outside the scan?
> 
> For DT/ACPI nodes compatible with "ethernet-phy-ieee802.3-c45",
> fwnode_mdiobus_register_phy() calls get_phy_device() directly:
> 
> drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy() {
>      ...
> 	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
> 		phy = get_phy_device(bus, addr, is_c45);
>      ...
> }
> 
> and __of_mdiobus_parse_phys() handles -ENODEV and -EIO differently:
> 
> drivers/net/mdio/of_mdio.c:__of_mdiobus_parse_phys() {
>      ...
> 		if (rc == -ENODEV)
> 			dev_err(&mdio->dev,
> 				"MDIO device at address %d is missing.\n",
> 				addr);
> 		else if (rc)
> 			goto exit;
>      ...
> }
> 
> Before this patch, a failed MDIO_DEVS1/MDIO_DEVS2 read made bus
> registration fail. Now it logs the "missing" message and the bus
> registers without that PHY.
> 
> SFP behaves the same way. sfp_sm_probe_phy() passes -ENODEV through.
> sfp_sm_main() then retries, eventually reports "no PHY detected" and
> starts the module. Before, an -EIO from mdio-i2c sent the module to
> SFP_S_FAIL.
> 
> Real controller faults reported as -EIO, such as a timed out C45 address
> phase, will also look like "no device" now.
> 
> This matches what get_phy_c22_id() already does. Could the commit message
> mention these callers as well?
> 
>> MDIO controllers that report a read from an empty address as a bus error
>> (e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
>> with unmasked addresses therefore cannot be registered: the C45 scan fails
>> on the first empty address.
> 
> [Severity: Low]
> This isn't a bug, but at this point in the series mdio-bcm-unimac.c does
> not set bus->read_c45, so the UniMAC example cannot reach
> mdiobus_scan_bus_c45() yet.
> 
> The later patch "net: mdio: mdio-bcm-unimac: Add Clause 45 support" adds:
> 
> 	bus->read_c45 = unimac_mdio_read_c45;
> 	bus->write_c45 = unimac_mdio_write_c45;
> 
> and its C45 read path returns -EIO on MDIO_READ_FAIL. So the premise
> holds by the end of the series, and the sentence above is already
> conditional on read_c45() being provided.
> 
> Could the commit message say that the UniMAC case is enabled by that
> follow-up patch?
> 
>> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
>> index b39e945cebd73..4071041e1051d 100644
>> --- a/drivers/net/phy/phy_device.c
>> +++ b/drivers/net/phy/phy_device.c
>> @@ -780,7 +780,7 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
>>    * Description: reads devices in package registers of a MMD at @dev_addr
>>    * from PHY at @addr on @bus.
>>    *
>> - * Returns: 0 on success, -EIO on failure.
>> + * Returns: 0 on success, or the negative error code from the bus read.
>>    */
> 
> [Severity: Low]
> This kernel-doc is updated. Should the return value docs of
> get_phy_c45_ids() and of the exported phy_get_c45_ids() be updated too?
> The phy_get_c45_ids() doc still says:
> 
>   * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
>   * the "devices in package" is invalid.
> 
> and get_phy_c45_ids() still documents "%-EIO on bus access error". With
> this patch, a bus -EIO on the devices-in-package reads is returned as
> -ENODEV.
> 
> The only user outside this file, gpy_probe() in mxl-gpy.c, returns that
> value directly from probe():
> 
> 	if (!phydev->is_c45) {
> 		ret = phy_get_c45_ids(phydev);
> 		if (ret < 0)
> 			return ret;
> 	}
> 
> A real bus -EIO there now becomes -ENODEV. The driver core treats that as
> a quiet match rejection at dev_dbg level, not a logged probe failure.
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
> On controllers that report a missing turnaround as a bus error, could
> this skip a real PHY whose first probed MMD doesn't answer?
> 
> The loop depends on its condition to step past unimplemented MMDs:
> 
> 	for (i = 1; i < MDIO_MMD_NUM && (devs_in_pkg == 0 ||
> 	     (devs_in_pkg & 0x1fffffff) == 0x1fffffff); i++) {
> 
> The MMD 0 fallback below exists for PHYs such as the Cortina
> CS4315/CS4340. Both of these assume that an absent MMD reads back as
> 0xffff.
> 
> With the later C45 patch, UniMAC checks TA, and unimac_mdio_do_read()
> returns -EIO for any (addr, devad) pair that doesn't answer:
> 
> 	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
> 		ret = -EIO;
> 		goto out;
> 	}
> 
> So if the MMD 1 read fails, get_phy_c45_ids() now returns -ENODEV here.
> No later MMD and no MMD 0 fallback is tried. mdiobus_scan_bus_c45() then
> treats the address as empty:
> 
> 			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
> 				return PTR_ERR(phydev);
> 
> The DT path through fwnode_mdiobus_register_phy() reaches the same code.
> 
> These cases look affected:
> - a PHY with no MMD 1 (PMA/PMD)
> - a PHY whose MMD 1 reads 0 and whose next MMD doesn't answer
> - a PHY that only answers on MMD 0
> 
> I haven't confirmed an in-tree controller and PHY pair that does this.
> 
> Before this patch the same setup made bus registration fail with -EIO, so
> no configuration that worked before breaks. With the patch, the PHY is
> left off the bus without any message.
> 
> Would it be more robust to treat an -EIO/-ENODEV devices-in-package read
> as "this MMD is absent" (devs_in_pkg set to all ones) and keep walking?
> -ENODEV would then be returned only after the MMD 0 read has also failed.
> 
>> @@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>>   		 */
>>   		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>>   		if (phy_reg < 0)
>> -			return -EIO;
>> +			return get_phy_c45_probe_err(phy_reg);
>>   
>>   		/* no device there, let's get out of here */
>>   		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
> 
> [Severity: Low]
> This is a pre-existing issue, not one introduced by this patch. Further
> down in get_phy_c45_ids(), the second loop returns the
> phy_c45_probe_present() error unchanged:
> 
> 		if (i == MDIO_MMD_VEND1 || i == MDIO_MMD_VEND2) {
> 			...
> 			ret = phy_c45_probe_present(bus, addr, i);
> 			if (ret < 0)
> 				return ret;
> 
> The MII_PHYSID1/MII_PHYSID2 reads right after it return -EIO instead.
> This path can also return an errno outside the documented 0/-EIO/-ENODEV
> set.
> 
> The commit message says reads made after a device has answered are still
> reported as -EIO. Should this path be normalized the same way?

Because this one is a pre-existing issue, it won't be addressed. All of 
the other comments incorporated into v4.

pw-bot: cr
-- 
Florian

