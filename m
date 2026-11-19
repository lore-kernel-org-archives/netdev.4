Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049622;
	b=4Jh/axPEOyh5sbjjBPzfUiqGhpABAgnZGkyILDV94IwkDa1SvPwBM0ykbMScPbdn6YGd
	 SahU/090jp1yhu81i3/iKtqKWuI7SzGFLPsxZeDAelV4DLQCUhjrHVTYdfV1pNX9xs8xH
	 QptM0AR+tuPrG8QB2eof6XUAfGao52oYeZo7fg19HZBGbb2YXtBK/3/Hb8Q99Q5RSYUPK
	 Am4Bp1+xw7/JyfA4rICvj3zB5AByPHKY4Xp0l5zMan/b5CE/umvA3izLnCaKYjCRtEErM
	 kFIGlA9L9hdxYPrq6NZLMP0GKA8QDUzl6kQBI/0XZjbzHjAzKvy5qeDXJ/4g0APggAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049622;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
	b=WIhzY1f884DQbPSaDrxy89G03zGJh86MhlIc6vguVs2yzRVyGeKbX98phczYBiAlfKip
	 UOUmSO6LrFVB3HzwmeKBsW2vJiIQ+uM9HgIcgnExL34rrUKTW/frCGaQFdB6nBwT0PocX
	 xigWcucRLYbF8gDephPSsnUSFcX9FIrsG85VjpHW+38bJIBwPruEUcINnpKR+lyrrO8AF
	 DYCOrlyaSYYNm7xxQ2OewHAvipRL/QCH+g22wxoNIqzJDavgDIFj8vpHJ8SOU3eNQ6FeO
	 tNoE28lX49g4rh+Gea+aRcnOFlTHuuCNZOKQ0bx8iC5oggcNPOH6+XMZTu8KDobyc4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YHlHfMXm;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE4606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BE4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YHlHfMXm
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1238395a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049621; x=1795654421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
        b=piBRDuSX+CAzingHVTgsZS8KeTFh1jOm5r7Lvagvt3S8ofAmjetqbjcxb1JgRaUe2R
         UT2m9H6oEQyI1VSNLu2JVgkW6djWgy8bT83MBsYykbEm3e45B58i2Gq3oTDnyrIW0vEl
         kVaG55xYl1CvquZ2nugOXulAZlXTpT93p+qBiHYuCRw4/VVcJz2GNTI5uv4+X0e9CDKX
         nX1VGi6hCJ7GtEaK9VPMP/ZcTJNOMMFU6TNYIvuYvKE6To4r8DadsB43Xsoa3hMpv+Ib
         0JbazKOLjjHT7T5ng+v2N6f4ISCq7W96kCPaOMSNN3TOPomV+Tqcvjx2hdfolMVEg0CQ
         dt0A==
X-Gm-Message-State: APuU4Z/DZCa/ZOmIALKp6vF+1Dv37I3kXCkjqGiqIxL+NxhmyrrUwWq+
	m63A+Cc4mXe9tobxkqNZObGjzNzjFEEgGSIBa1OSdm0G1zc63Zh8vWaGwJIS46rjVXCBa11GYY4
	xAfdofR9IwDAX+DkVuxU1cjGtj964nymGY2M/WWmOOAdfhfEm5W/ANs5QYWjwhCgGnRVfLJVMvR
	hX+OTHGEGXsVjFhqX1h/94yp8j/T6stu79SrLXWTQr+JE+EhRUbXaM+2pnsVjRbV+e53W6DIt0V
	3UMlYA24999SCiT
X-Gm-Gg: AZFdTZdiq8oWVRqqX8fuX3vakXtw1q7twcrhLP3zCsMSOpLrP7fA5dDBvMMX7z3PTlu
	VWmQj6VwSbpLUuHmblbKKX29CzQp1mLiE4sbRhOHxr3+5nV+yQzHWkuqjzWHT/R+ZS86EPCffUI
	FCfTD5gRvwAvKTARGRr4GQW5Tc90GYWD5A9zwfiOtPi0O9xF6aElRSKy4+kAuB4r+lw6XQLhwdi
	yQs703qMBsXrfDZxwmmRfEq4Z4K3v9EnMbgCPGCmeC5dSLpMHOEMMSx7pWGzTSS6ICiTw50S7WK
	9LmylHBE6HulT+CIbWI+v52a/3uJoyDjzj+d7PzBBembYKo6ki33NzK2DWCILPOLigpLPIZTvH5
	auuQUqhXD+f3P2ZJwpiDDiVz3NL7/4pOSWhsMkoaJCywVRRVWPlUXMlkS/CfgA+37s5IBZoxNEf
	uY2tJXcff3jcb7KX1rYzQXPieUYT9qZa5WzDNtcgJu
X-Received: by 2002:a17:90b:5290:b0:3b3:ab75:c940 with SMTP id 98e67ed59e1d1-3b3d0759a9emr3872169a91.18.1795049620884;
        Wed, 18 Nov 2026 16:53:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b401f75ed9sm63275a91.0.2026.11.18.16.53.40
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:53:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so387167385a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049619; x=1795654419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
        b=YHlHfMXm1gCcK9Xjn2VKmBN/Uh5g/LqMHtKiajoXM04yhXJC7ddY3n0wfX2ohiuIfD
         icGaQNkfP7neVm9vz6t7G78MhexfhUgzaDs4l29x9y5+tMl1ODKK75bfgvnf3ao1EXHz
         AUe49Kby8QYQzquf3uTpJA6qa+W/USqF4T/aY=
X-Received: by 2002:a05:620a:2a06:b0:949:6fd4:354d with SMTP id af79cd13be357-949994b40f7mr829487185a.8.1795049619264;
        Wed, 18 Nov 2026 16:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:949:6fd4:354d with SMTP id af79cd13be357-949994b40f7mr829483285a.8.1795049618678;
        Wed, 18 Nov 2026 16:53:38 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b774087sm313093585a.23.2026.11.18.16.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:53:38 -0800 (PST)
Message-ID: <4fd158ad-eafa-4627-b763-688aa9888132@broadcom.com>
Date: Wed, 18 Nov 2026 16:53:33 -0800
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
Subject: Re: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
 <179504864758.3136.4762946821848645256@kernel.org>
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
In-Reply-To: <179504864758.3136.4762946821848645256@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 16:37, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new C45 sequence issues an ADDR frame followed by a
>    READ/WRITE frame through MDIO_CMD.

This was a real problem for wait_func implementations that return 0 
without the controller being idle (bcmgenet_mii_wait()). It is fixed in 
the next version: unimac_mdio_addr_c45() now polls MDIO_CMD for 
START_BUSY to clear after wait_func returns, so the READ/WRITE frame is 
never started while the ADDR frame is still on the wire.

> - [Medium] unimac_mdio_set_clause() (mdio-bcm-unimac.c:126-138) adds a
>    read-modify-write of MDIO_CFG to the MDIO access path, and that RMW is…

Also valid, and fixed in the next version: unimac_mdio_resume() now 
takes bus->mdio_lock around unimac_mdio_clk_set(), so the two MDIO_CFG 
read-modify-writes are serialized.

> - [Low] This patch changes behaviour for existing users of the non-DT
>    (ACPI) GENET path more than the commit message says.

The C45 scan does run there, since that instance does not mask any 
address. It only probes addresses that have no C22 device, so it cannot 
take the place of the C22 PHY that phy_find_first() returns on those 
systems. The commit message now says so. The scan is also cheaper than 
it was, since patch 1 now stops after a failing MMD and goes straight to 
the MMD 0 probe.

> - [Low] The comment above MDIO_POLL_DELAY_US/MDIO_POLL_TIMEOUT_US (mdio-
>    bcm-unimac.c:45-48: 'A C45 access is two frames, so a 1ms timeout…

Reworded in the next version, along with the comment in 
unimac_mdio_poll(), to say that the timeout applies to each frame.

> - [Low] The driver now enables C45 on every controller it binds.

AFAICT, all controller HW support C45 and have the definitions for the 
bits we are using.

pw-bot: cr
-- 
Florian

