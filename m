Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197022;
	b=oRKWdA98hr0jpFoPwmSCMQsG2Aaw0+nlXwpwyZHKmJ5ncTsBlw2tBoYO7Ev/u7aGkefn
	 b1svHL23fgK41o1fkLPCn+KfU7c1y7g3rD5l9ECuXpDoyOp2jQ39wxJKFq2iYFeB0OR59
	 N3iu0eva9UNQYe/SUCjkVV9EGV6r3n4mBBz1D5icDN2RJXYtEwt+BS25HE2C8N9vY3Xh/
	 wwSvMy+t8T3MkRrT3/Y77IdmY0PQgVdrDVdKq0SpyiktkygTCdLIQ0FolqBorjPFedbXG
	 XYqWPvz9wcWVdAyMyqmXewykTpAjYR1nH87j6eTkhLygAX6YFFKHWIm2UQD+88botbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197022;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
	b=OVhFzBEBk9tcGPyTfNgPnZKHSoK110G2oATEuOXvPicVJUmGxnDdNPPS1W62o9xk9pFv
	 WmeXQ3TdQ9sdpTx6/r9jr1dtjpuDUgVyC1V+knRtTZx4QOQS6tUms05Gm7RPpJXfX+Lhe
	 ebeznA1V2NUbRIxLDcT5smxooaPc2dh1jQay+2+ZI+fqqTTrJHXjDceFNz6zokyfqHkMi
	 3IQY0YJF0W2ssE891FCTdqA1YGOSBrhTin7IrdUiSehMlOcEQdVVKh+FM/prCy70Lk8AL
	 xr5WnwndQxPKPxWFs/F8V84CU9xAH8y6ffxAdFCUJ6PqkXWJ2jDL0nAd2GMHDzD70NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMsSNk2X;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F87606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F87606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMsSNk2X
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so741002a91.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197021; x=1795801821;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
        b=fW0KWk/xkW/KHB+butQoO4CCzIS5e+5N8Aj17jUJBCshMWfmseUrED9lgtxtBufGFX
         NCzhlpVrR9aK8rMGCeIu+qIhIDanGnPJ08RIAo6S2REvu3FeFdKiuPKk5wLc++PCZHCm
         G+Zjq7aHcRT4Yh6XTbSX1yEBukNmZIEGZY7+L2Ho6aaVfRgxUbvKidHH6Kq7EwXde4vJ
         HRtniDNigF548igBfiDBBYIg7tz74NRgtOAPa60sUJGZ37l+Xy3BSrRL4advGqPVZXNR
         dXgK5+/F6Z61N0LJ7Gpkl/CMcoQLBRjo8K4XXD3+Rmj5psriNjrRzgmPtcFgxFmssFI/
         fMcA==
X-Gm-Message-State: APuU4Z8EGR5DOA6A/RCPIQ4GT57qjk8xEGqvLQdmJ/m5d5txK5ayHNIY
	auS63HDf6mhxHJcOAgvtsU2vyWHnw4D3olQlc1vRdidEDz9sXoVvYCWEIgTp9NVr8qV9hFdEuGo
	5ZEKEd9zYe5SqWiL9lJzKZo7oPUnMYM+6k7p0sNdvzUsb77VoDnvtT0/EL+bth3eqUqBcQXppmO
	WWQoE2TzUSRw5GgfkLx2W2/+VexcBGkuuD+VXLiWE9rREIuvbVLqsh42E8Kz1OpLLu/zo//Yw7J
	nr6wRWfWejESZf7
X-Gm-Gg: AZFdTZcDPK+5FbuJFwfB1NUJ8fg/h4HS5sySNBSmVOkk4ChFF0UdfmEOYxCPd3XZ/Sf
	+RD9ddGiKV9gSLgSEIr0J4W5r+HHZ3/wWXf+mE6Q4JO38jzrjKv67nfCjTgAj9kCLPDzgdD3/3h
	RnAhtqFfPDoAPhQ6sx8MpLMDQrW0pnXz5OfD2+mkG5iHa93tuK8UCrpOlrdJp/7hHVFap48KK0f
	YgmvI7OM5fB0DCOvwao/QnwggEV+vv5KMnycYOI0FS17iY+BEbvL8I0WnsA2UJJYdoseS0kyJsk
	DdlL6qDTc3ONBS13nL63Y/pCBhsc1OYtP9TSYoX+WM+smSUltlAsY6lK9FYE3IipY+kGbEbTAfV
	uD8AeI9tcj4hLW3Tcd5XX44Cvg6Uv+Zejy5i2lk8U5OCJwcZwHfPnRT7Rna5i18aAsLVFGU95p+
	GPa3Hm/7SGdPqYAIlnRXxXLyEv3kivP5j5abZGFDVf74U=
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr3926762a91.5.1795197021344;
        Fri, 20 Nov 2026 09:50:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm3129270a91.1.2026.11.20.09.50.20
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so324441241.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795197020; x=1795801820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKW+vOqr1jPXPg8DxRcHCdGrEQ5Sm3HKeBZH63LQ8h0=;
        b=HMsSNk2XO+KQehiPXxsZWKlllRrOerwyaSexbSyUdYfBgXE6jaGAYWHZMjQHlO6DJ6
         NCXOACB5cBCNK/YIzLsHJRHd9giK/cjWGh9X+JuzXe44nzseK0LUWZjPq3gWfgakDIZi
         MiC1l/PdPVrVsPzkgTXqEB3JA57OTzCc4i2g8=
X-Received: by 2002:a05:6102:c0a:b0:7cd:3218:362e with SMTP id ada2fe7eead31-7d7397fcfdamr1786572137.29.1795197019979;
        Fri, 20 Nov 2026 09:50:19 -0800 (PST)
X-Received: by 2002:a05:6102:c0a:b0:7cd:3218:362e with SMTP id ada2fe7eead31-7d7397fcfdamr1786549137.29.1795197019256;
        Fri, 20 Nov 2026 09:50:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm3625504241.12.2026.11.20.09.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:18 -0800 (PST)
Message-ID: <122aba51-c972-4b9e-8b74-4a48f8b5188e@broadcom.com>
Date: Fri, 20 Nov 2026 09:50:16 -0800
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
Subject: Re: [PATCH net-next v4 0/4] net: mdio: Clause 45 support for
 mdio-bcm-unimac
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
 <8a4d3925e1476061d23bc463453285e3@tipi-net.de>
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
In-Reply-To: <8a4d3925e1476061d23bc463453285e3@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 00:30, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 20.11.2026 06:16, Florian Fainelli wrote:
>> This patch series adds support for Clause 45 MDIO operations within the
>> mdio-bcm-unimac driver. The series breaks things up in this way:
>>
>> - make the C45 bus scan done by the MDIO core carry on when nothing
>>   answers at an address, as the C22 scan already does
>> - scope the existing defines to make it clear what is C22 vs. C45
>>   specific
>> - rework the polling completion loop to be a tighter loop
>> - add support for clause 45 operations
>>
>> Changes in v4:
>> [...]
> 
> Isn't this the same you've sent already? v5 would be the follow-up?

Yes my bad, too many on-going threads!
-- 
Florian
