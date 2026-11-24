Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544920;
	b=oNiNY6CZFgGyuwpmavNtdtWhL9hyJF57oYEuDFDXojksMtNSylcfekr+zfexKIcyxRWc
	 hi211J6dzowr/scDkhqYFPBB17T9/Yx5P425eZhjILa7V2JmEoCPvSIrWA3JYg+/CStQk
	 pdR2bBJ6heu+wDNt+pPrm1Qx6eEZjcT9SJ5BLZjADBFRoxSILScPGYMLjqLXuZRSjMHro
	 z6j9CalVckML+SY2jAAZFbIoXrGt/USlJF2Nu/I2HnmQ/s/vO9QI1X2BDx7MXU2FsOYq0
	 opSa6Aem5vUu5eSnbP/MV+na2oTFPh1490tInE8a0NEdgdwq9zOxwUG+nlUhCAgRwpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544920;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=DMtJ637Jfog3YFE4AY12NMq7z345TwA2MwABaesdV88=;
	b=08K5ZB9/fUZpGlAzF7405gck4v7pQKJXsUcnlasLjd4karGP9hAaG+W5Qk7qwjTFZvBD
	 1UA9qau01oX1riNmzPUrO2G6BJ3Ge6kmzAq9oe6TGW4aQSeVlWxNPzuSyFX1bjNTUW3Cu
	 tSZXSeq2xBM44xHu89gBB+t3rtiejf31eHRU/eLzs9FfC8FE3aakkvFF68RsCR1AUSXhI
	 joVR/ML4ctsUwZz1AEVYOzMncH14JRdY2/yTnHw9/ptcf9TecUqxNOlVgyp2bqfTHtWLR
	 oHiDHCiIP/tN3TOA8LcAtxO5vecBvtuCmYHAEqJu5hgAUu8VG/Go+EshaWSTkYqVtZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fwQHrovs;
	arc=none smtp.remote-ip=209.85.161.99
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADD606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FADD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fwQHrovs
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-71ad047710aso3021767eaf.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544919; x=1796149719;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DMtJ637Jfog3YFE4AY12NMq7z345TwA2MwABaesdV88=;
        b=WSNYo4XzPMO0GoxWOtQxSCHrZlhe3gJTaOM0yGr6BwBV66LXCrHYQHk55Bz6nFfT4Q
         9I7gizsCgBOGvwL8q7fmg0UE6O/xr7r22Lqg3GFbgIPmoFzGsrci24GeEZJEBFKcecGN
         hfzPDPog3trDQAM9OhFltp17aqNg8g+QIDYHhftsUrlWeJeTxplS7Y7Uo7PO5qCUXkFv
         tTjsXUCdILTHIMQOVuF6DBNCYLqO8McvkkPaPT5YYZk9HEa/E/zVgqhUkCRul45KwpZ2
         Bxm9u+sZS6TQ0GZUVl2BLt+NdDpvAfMjpdKnF2xfVluLGNYIkaJQ2U7v0l87WZcyQ0i4
         MJPw==
X-Gm-Message-State: APuU4Z9on/f2zKWvQlsUKB6qCbZLlUVk7QdZfnLZZ7rPs+YkFPP0JQgv
	axib+wrW15LviNj01UDyj5lyAg5h2g9lu7vxtIfN9o2ylq137YGdogezzLGXVyI31v1FfBZgNqX
	LpGiEqz28C6XuvXUUcpse/KDl6YIFK6OdUHlpCaAvsdxb9y1Jcx+snJriakAw7HxKq51PliKVAY
	GioKcfGh4x+BpWdYRLaVpATGKIZ+1LGPRabyrrdyiMq0oQOX71kMEOo8HGUZ2gLg739GStARgyk
	R+/oaS2UTQDXvBQ
X-Gm-Gg: AZFdTZdXqWxnViP4FKQVnpIkCmiczj7dpEQepNd2uD1dcezxiKR/mTvtCbx+WjHtYsr
	N4vHxKqiwMmuZfIz2cJ5EO7ihEJJiWaRyH3H0WQJ6RfEDL1/9Uzd8spHz62HiYYepM9aDs7Jg/D
	LQ/hfproXf86TgP1/Be6NADfm3PW/MyQoicRemmh8XVRqfENphgrtls+QByBBI9pS2uF3oVyoV4
	X6fvLiqEvZrSMnCHnFbj7RBxTvDbGBJR0Yl9luQ+nZoPa41+lTKL+zCXxL95HzfupyHIic92QjR
	M2AnDZOJ+C4MY4WAMmuwXlD2bmremzJIxMEznMuXb6AaAUR5lkpYNYsEoWz5ePOqQWAAyjKsz+S
	dsIaA07iT94igZKnIrgio79jvUOp05UiSb0NqeKqPtlK/Jd/kbAqpO4HwqEeouqAfFszblbntOx
	CkRO7yXBRnNmYK9cxRLolgmwokrL0QQqwC5sKpa0ICKAw=
X-Received: by 2002:a05:6820:4403:b0:71a:fb85:d06b with SMTP id 006d021491bc7-71b39585c70mr10964302eaf.60.1795544919056;
        Tue, 24 Nov 2026 10:28:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71b3805f642sm100377eaf.15.2026.11.24.10.28.38
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:28:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so4269934eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795544917; x=1796149717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMtJ637Jfog3YFE4AY12NMq7z345TwA2MwABaesdV88=;
        b=fwQHrovsdISQ6PZ+Kar8Kc6n+CGB6pzWtJaeQqzo15c+p60kcHq6a2cTHZTXdTO2lZ
         wK9/dd0Jsnr4c1CKB/vlFOmxetxXoTNx1VTbc4LfMtXjKR+e5E8KApMkEI60fFSK/K1U
         vwhmo7d6Y4vUkpMJ10UjqJ0ci2wM0nHG/mQag=
X-Received: by 2002:a05:7301:53c3:b0:380:f8fd:d19b with SMTP id 5a478bee46e88-3856fb693d7mr17169015eec.38.1795544917442;
        Tue, 24 Nov 2026 10:28:37 -0800 (PST)
X-Received: by 2002:a05:7301:53c3:b0:380:f8fd:d19b with SMTP id 5a478bee46e88-3856fb693d7mr17168980eec.38.1795544916671;
        Tue, 24 Nov 2026 10:28:36 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm45529078eec.15.2026.11.24.10.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:28:35 -0800 (PST)
Message-ID: <be288244-9f14-41d4-a699-f666ce354158@broadcom.com>
Date: Tue, 24 Nov 2026 10:28:33 -0800
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
Subject: Re: [PATCH net-next v6 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nb@tipi-net.de, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261123164835.1733304-2-florian.fainelli@broadcom.com>
 <179553896595.3135.12489762291979495707@kernel.org>
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
In-Reply-To: <179553896595.3135.12489762291979495707@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/24/2026 8:49 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message describes the SFP impact wrongly.

Agreed this was wrong. mdio-i2c reports an absent PHY as 0xffff so only 
a Rollball I2C transport error is affected, reworded in v7.

> - [Medium] get_phy_c45_devs_in_pkg() reads MDIO_DEVS2 and then
>    MDIO_DEVS1, and returns the raw bus error from whichever read fails.

Agreed, only a MDIO_DEVS2 failure is mapped to -ENODEV now, a MDIO_DEVS1 
failure stays as -EIO.

> - [Low] The commit message says errors from the vendor MMD presence check
>    in the identifier loop "are not mapped, so a PHY that fails midway is…

The vendor-MMD error path predates this patch. I dropped the "not 
silently skipped" claim for it rather than changing its behavior.

> - [Low] When a devices-in-package read in the MMD search loop of
>    get_phy_c45_ids() fails with -EIO/-ENODEV, the new code breaks out of…

We are not continuing the loop. The vendor MMD presence check would 
return -ENODEV at MMD 30 and end the scan before the MMD 0 fallback, 
which would break PHYs that only answer on MMD 0. I noted that in the 
commit message.

pw-bot:cr
-- 
Florian

