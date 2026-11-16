Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861763;
	b=c8iv1Hw1wKiiqHmWXAHwc0W2kPATLSgAcH+vaUmPEB2+GnfyOl2uhB1dMf4/ZUBJMc19
	 x7Id1kphl/oxJHrSfOMHQ084uJxxS6QXSKZWXbUX5+BgMorAzTL7wkDCPWnEMJMfxca8b
	 hdfyaejAUKwyJgXKG+CFKuovVciG9Z/D2bUVlguDeyZUVL2B6kTZv7VeLNgpzzkfBYm25
	 aC3YM6IfrF9UGxmBiFjNLoDKkv0rssP6QE8ZwF7M1tzmHznZanHiomC5KQUrmGwhrnG9w
	 6c6+qLw9tfjpBnmnYgh4jdZKKumc7T62eyNqQiqtOdjY4Ubybs7KF/9Wh0DSmARYzTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=irPZEl3t/JSF+eLmhOBqTx33ejVFwN9InSM10ZVO5BY=;
	b=JrBZH2HseafqMZWbNCiPQU6hLi7JAzIoHS6FZDhdXzMEMaudlNoaxK7jqnII7s0loakF
	 1Y2OPgNSe1q/xb0FiR9FMd5Gl61wiZbtyP4K5mynHZvua52kWaGvUsBkBjJhUWG2gJAjR
	 NEbkxOTgfzSv+04IREe9E0u3ttbHMPTUzcYv8MnuFjl3K/3CdosIVrqwrMyCXwkOS/ZBO
	 7kzA7XPyafC0abXhcmCx20kxIHSo1LW+NumK7K60YS8njZ8cqWwisESzGkd/zULfaT/uF
	 +gneD57yFP8Apfn1LG0yNlJELlJRGDi9O3yhiDDVA2LwyiHSsN/RFSoLeaBqdos/UfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UuKQt0Vd;
	arc=none smtp.remote-ip=209.85.222.100
Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD8606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UuKQt0Vd
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso851750241.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861762; x=1795466562;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=irPZEl3t/JSF+eLmhOBqTx33ejVFwN9InSM10ZVO5BY=;
        b=TJ6W98ra09cvz9bI/thY2XwgJz4l/ak5F5GOLMvsX2L7nkZeC91uSWFeHj1iTF4UfF
         ll3+eylMwhxC3tEUqZyClARf7drx+mNPasbCIy82dtY2H+wX0unf+YY7i3V7xrjLn897
         XVXXFl1YrHNYozTHrQJttr0tcTXWXJgE76BZivjFlB1FKYMF0iJZUuSjWqka7RmGj1YQ
         MXIppGBNH+1FBgLjU/Im0ccfyZCJj6jvCrOiTw+puQQMbL1rQWuOw85H1KHEYQsKHxpi
         C5lY6PLph0RV3KXsAY+RgCIY0VJBnkYsixO19dIgqvCMYNTsvbvHSUzFzYpMoqIZzas/
         6fSw==
X-Gm-Message-State: APuU4Z/cSKC20hLf7eQM/6seSudR5wCx9fSHblDSZXzYG0HyrAkpDQ8P
	3aRZluoJqcPBtcs+9u8nrZ2QtE8InWXVrnQR0PJ5lioy1F2EpbaFKrnKR4ZIk9vH1TdhqUzkaec
	8aYjUrityCrmctAbnwEywI9ePIVEsKWAmtiRxlBX90rJNWHvaUGeRHuoUWD7qisYRwpkHjm7siF
	l5hEk5GiBIt0++IIINlq4dtrYckIblUWw4o63cApU4UwCZ0he6NJweqgM4F14UN4J8zycdTsjN9
	Zl2XUK+bjh7Ifuq
X-Gm-Gg: AYBFou3bI9WDqHY0M7KcAJgj1VGx73WwtkH/N55Rjrpy2tf3MYkoAsbMPHvihHEuudX
	+U/r28MpoVdQctexep5/B/fbONdPeikkMQqhFB+4YXZJxsCoX2bTMy+Ag+HI/VMKMaNUzLuFroE
	eN7IG/Jo0HafCe4dOSfw9cRDdD2lq4fdIm+cVi7NipxsP6QFfW1Sup/aCz18yLxBsLQVZhr0EDL
	o5pEt/h5yh6AepEKNvEOPdBx+44m+hrmbJdOVvEaLsgVW6gAAixkTtpWbCR4g6+H5/mW90u7ll/
	Dw6FZF8Xa02lTc1zutV6CpONBOLc7cCWvRKrEx7XVLdYyET288nhA7mEX1OuWXgTOlQJYSfPggY
	dkwEek8Lg6vXeoBg4VpWY01yBkoFa9d9Cllhlj5GZcRaZEEeV6EFECzSGvTOOcaoyiUH4FZfGRb
	FvMpQhjVAs29dgex8GcdTOGpcRYN2/TlO1gjwIVF78
X-Received: by 2002:a67:e111:0:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d64d47dc72mr2912253137.1.1794861762041;
        Mon, 16 Nov 2026 12:42:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e338ef021sm86005241.16.2026.11.16.12.42.41
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:42:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea5866643so33199066d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861761; x=1795466561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irPZEl3t/JSF+eLmhOBqTx33ejVFwN9InSM10ZVO5BY=;
        b=UuKQt0VdebYNQm4b76jUIt6wqZ6C9x7QjZWboX5jNtk+1dkjBug45Sxnc/EGxehFGY
         /3RDE19XumHbfkgcXwRXmc9tqPLUctPkao3aA6AiFOlXkwv3E7X21wuSqKLeZSIRpL1f
         bOTe/6/XviUsjuK5mdxI0Q0yFcKZEECg0CXfw=
X-Received: by 2002:a05:6214:518b:b0:91e:77e0:fc0e with SMTP id 6a1803df08f44-91f2426e5ebmr176353216d6.57.1794861761255;
        Mon, 16 Nov 2026 12:42:41 -0800 (PST)
X-Received: by 2002:a05:6214:518b:b0:91e:77e0:fc0e with SMTP id 6a1803df08f44-91f2426e5ebmr176352786d6.57.1794861760660;
        Mon, 16 Nov 2026 12:42:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920ff0c7668sm1263576d6.3.2026.11.16.12.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:42:40 -0800 (PST)
Message-ID: <a8c3b390-2243-442a-889f-4ee69a551ed8@broadcom.com>
Date: Mon, 16 Nov 2026 12:42:37 -0800
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
Subject: Re: [PATCH net v5 6/8] net: dsa: b53: reference count shared mirror
 source bits
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-7-florian.fainelli@broadcom.com>
 <179485574117.3136.2818958695058742581@kernel.org>
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
In-Reply-To: <179485574117.3136.2818958695058742581@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] This patch changes bcm_sf2_sw_resume()
>    (drivers/net/dsa/bcm_sf2.c).
> - [Medium] The new error path in bcm_sf2_sw_resume() gates the switch
>    clock (`if (ret && !priv->wol_ports_mask)…
> 
> --
> 
> net: dsa: b53: reference count shared mirror source bits
> 
> This commit adds reference counts for each port's ingress and egress
> mirror source bits in b53. A bit is only cleared when its last tc
> matchall filter is removed. It also adds a b53_mirror_init() helper and
> changes bcm_sf2_sw_resume() to return the result of ds->ops->setup().
> 
> [ ... ]
> 
>> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
>> index 1747a1f20c78e..98a4a62ca73a2 100644
>> --- a/drivers/net/dsa/bcm_sf2.c
>> +++ b/drivers/net/dsa/bcm_sf2.c
>> @@ -996,9 +996,11 @@ static int bcm_sf2_sw_resume(struct dsa_switch *ds)
>>   	if (priv->hw_params.num_gphy == 1)
>>   		bcm_sf2_gphy_enable_set(ds, true);
>>   
>> -	ds->ops->setup(ds);
>> +	ret = ds->ops->setup(ds);
>> +	if (ret && !priv->wol_ports_mask)
>> +		clk_disable_unprepare(priv->clk);
>>   
>> -	return 0;
>> +	return ret;
>>   }
> 
> [Severity: High]
> Does this make every other system resume fail, starting with the first?
> 
> bcm_sf2_sw_setup() is not safe to run twice. It ends with:
> 
>      return b53_setup_devlink_resources(ds);
> 
> Probe already registers the "VLAN" devlink resource through
> dsa_switch_setup() -> ops->setup. Only bcm_sf2_sw_teardown() removes it.
> On resume the call chain is:
> 
> bcm_sf2_sw_resume()
>    bcm_sf2_sw_setup()
>      b53_setup_devlink_resources()
>        dsa_devlink_resource_register()
>          __devl_resource_register()
>              if (resource)
>                  return -EEXIST;
> 
> b53_setup_devlink_resources() then jumps to out:, calls
> dsa_devlink_resources_unregister(ds) and returns -EEXIST. Before this
> patch that error was ignored. Now bcm_sf2_sw_resume() returns it and
> also gates the switch clock.
> 
> dsa_switch_resume() then returns early:
> 
>      if (ds->ops->resume)
>          ret = ds->ops->resume(ds);
> 
>      if (ret)
>          return ret;
> 
> As a result, dsa_user_resume() never runs for any user port. Without
> netif_device_attach() or phylink_start(), all user ports stay down
> after an ordinary suspend/resume.
> 
> The failure path unregistered the resources, so the next resume
> succeeds and the one after that fails again.
> 
> The clock is already off after a failed resume. The next
> bcm_sf2_sw_suspend() (when wol_ports_mask is 0) and bcm_sf2_sw_remove()
> will each call clk_disable_unprepare() again. Can that underflow the
> enable/prepare counts?
> 
> The commit message only covers mirror refcounting and does not mention
> this resume change. With the Fixes: tag, a stable backport would bring
> this change along. Could this change be split into its own patch, after
> making the setup path safe to run again on resume?
> 
> [Severity: Medium]
> On this new error path, gating the clock is the only rollback. By this
> point the switch is out of reset, the crossbar is configured and the
> GPHY is powered on through bcm_sf2_gphy_enable_set(ds, true).
> bcm_sf2_sw_setup() may also have enabled ports already. Nothing marks
> the device as clock-gated, and the switch stays bound.
> 
> On the next system suspend, dsa_switch_suspend() still calls
> bcm_sf2_sw_suspend():
> 
>      bcm_sf2_intr_disable(priv);
>      ...
>              bcm_sf2_port_disable(ds, port);
>      }
> 
>      if (!priv->wol_ports_mask)
>          clk_disable_unprepare(priv->clk);
> 
> Won't this access switch registers while the clock is gated? It then
> calls clk_disable_unprepare() a second time, which would trigger the
> clk core already disabled/unprepared warnings.
> 
> Callbacks that run under RTNL, such as b53_mirror_del() when a tc
> filter is deleted, can still run and would also access registers with
> the clock off.
> 
> Before this patch, a setup failure on resume left the clock enabled.
> The rst and cfp failure paths already roll back only partially in the
> same way, but this path runs after the GPHY has been powered up. Given
> the devlink -EEXIST issue above, it would be hit on every other resume.
> 
> It would also be hit on any register I/O failure inside setup, for
> example in b53_enable_mcast_snooping(), or later in the series in
> b53_mirror_init().
> 

[High] You are right. bcm_sf2_sw_resume() calls ds->ops->setup(), which
ends in b53_setup_devlink_resources(). The VLAN resource is already 
registered from probe, so on resume it returns -EEXIST. That error is
ignored today. Propagating it would make dsa_switch_resume() return
before dsa_user_resume(), leaving the user ports down. The resume change
does not belong in this patch, so I dropped it in v6. The mirror
re-initialization on resume is unaffected, since bcm_sf2_sw_setup() 
still calls b53_mirror_init() once the later patch adds it.

[Medium] This only applied to the new error path, which is gone in v6.

pw-bot: cr
-- 
Florian
