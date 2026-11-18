Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032060;
	b=L0qofdDIRHrKOo7W+z+HQQU3b5/7tEulHCaK012Z4+DF5iKfHkbQUxPW6BGANovDg9Qs
	 rno7zZ1I/QVrDh1tHQBDefS1wQS3nFqKysOU07esAtsB58484Cd/1yREtLqDDemgiN3cG
	 DWTnU+ykq6asDOd40gkILa+COqyV30VG5N66xs6Fhfa4m4d+PYd18WRwRmhVpNU54ah1v
	 laEGDcyW/G+9S8RBPgLjQc4mx4U/veqqBXbfZSjE4feGEySYYqjaBaeE9yosQgu/CD7Vu
	 3714Yljd5Mqzw3fqYeUTMz8lrphhjhq9mcnNczJhdDRT6if2nwm8olDEiJWJBdvdiSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032060;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
	b=nnYTED2h/BaSLwmIqkGKeWmHm43N+lYPIPqp7A1XwL/gnsG872wwypy1x5XICGr27dKo
	 6V6fypLJ+jm0YY06iCLrlsyk3tzw+xq1UKDfTrB8dvfO/XwztQ5xdv2lkFp3UEdmwdSUo
	 2UdhHPWLGUiBMfrk7PsGBSTveDsfVKCTODtgIo58ozGi/y1vtA2OmIo+PfqM9J6R+puGG
	 I3uXVcRNiaR4LSeBrxqY2yS56Ie2FBu99n7I8xux/oyAzn6MWbgCbiQvSkqmDoaTyL7Qy
	 R0rPa095gddrd0AE09pUJRP5RxMRgFxevmm/t77ELNBg94x1kGBgr447Ej3BtEVx1fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e15EBQ3U;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB3606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e15EBQ3U
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso206195eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032059; x=1795636859;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
        b=cZ3VML8b1+CTc8mu9f/5mxpx9Ho8Qvx2Oz+Nc638rBaVz7eOpkaAPSb+Wwi7vnDpXu
         e4NdjlbbojUQRPzVK1ANCC1QHjWHCXxY9jEPI5q0h746L2oMGICwtNc/ZpCV9u3TPn3l
         zdaSRbwUGoeR1Om8MMAX44PMhfquXU0sbvgXUaZoNYl4mCNtcsiOmx0DOr1FQd8YwzOn
         PjKxR9OpkTpBYpayUcj7E/VvdA222+JNgtKHNdCAXqfOqdIWRgQEHj3t9iMsJ8gVzW4i
         Vl4qNnDy90CN/c92aWcyxfFFccAHYcnTLrPkQfVODl9K7bsWtPUBzGi2NqG8C+knSGgg
         QoiQ==
X-Forwarded-Encrypted: i=1; AL+hErFDW6othzaSvuEXacNfYAcTiDjm+az/+U94W/XXug4hP8gvKH0O+Os64QGnUrt48zttJBidP2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjwK+mdWCW3rf2CquEtKaUuii6HrdL2bHHPtla5OjCSxpIdGD
	mTbwiOkJ9R0g4On8MUEO8trlxF5W+E7d92M95OrbTfg6iIQrDzszrSyFWfeJWoFwfs+X8/ZV9wi
	xwuf84lVThvRLpa4jsFS7gysYb+g8njxexCcHxYGXrrlPqQ3i/0CfUuDRJTyBCdjR2yVJquxV87
	MaEcXmizVzRKcducQk/X1cg6XH0mmVcd5dYsMX4LMLviWAcxgZnDk0bqbVfuUZlxQye2BQW8Csr
	FtMKf/aoJGGH0hc
X-Gm-Gg: AYBFou2c8IO3pDd7egqsoU3NM92NwMTxjiAnjEf1ykxceRY8K86uE/ftGm5AQmgByd4
	rJgyOWSzfAUBlWRn8Rz09UzGjq26wf+598bux83jgc/GnZA+QLXHqCtMqsYVV2Eqged/cbMoouZ
	LPlP61r3uwHXI8/p+MojqswtYTOOsz7Wm7UvHm5nSKUKm/V1bTVQ250OUcFK7Xe7FseqjGOd2Nf
	vMQpBxfJbROS3Wk/xnBn4PlGcQWN3r6S7Y9OhyIk5IfAfH3Wo+Nw8B2KizfX4cbYxt5GpfqdB6p
	bUTDvpKuSJtPfywt/06qvyX5n6BNqQxlA89Lrz8N8ESpcLTli7+0FVWjFXT15n1zMp+oiINfBk9
	POTvCxb33m1pXO3AF0CnwOoPlWezpWVVNnkD0fIsH5f041UR+iTubPgRyRxyNxa79dUTYosL2w3
	GueCAAIMlEoi/6ER8qvfDLSFL1SZz/3e4o5w21XAm7
X-Received: by 2002:a05:7300:691a:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-383edb2a07bmr607258eec.4.1795032058274;
        Wed, 18 Nov 2026 12:00:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-382a67fe73dsm131947eec.5.2026.11.18.12.00.57
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd97f89731so101951a12.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032056; x=1795636856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
        b=e15EBQ3UoNNXVBpTdS4QcJcevd9RfRZKjIhE6DdrSm3ui/p1qY0GRYsm42YP3jws3O
         o34ySgfh8+79WGhFV/TPgDACmLS02OTz6OBL3SvjhZc1K2fau6yRiM6fmvhTkYQlCFDe
         sD0EKI01+rehPETTzLu1bIl1reiHVM+0kDtWw=
X-Forwarded-Encrypted: i=1; AL+hErFyDvk4ygHJSmY0zwmNPZoD3mHPFdsg1E4T5jfk0Y+WrxxGXWI97EpFUr3+plvAKwmew7PCEDA=@vger.kernel.org
X-Received: by 2002:a05:6a21:4ea8:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fff55618f3mr355220637.22.1795032056059;
        Wed, 18 Nov 2026 12:00:56 -0800 (PST)
X-Received: by 2002:a05:6a21:4ea8:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fff55618f3mr355180637.22.1795032055461;
        Wed, 18 Nov 2026 12:00:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534de506sm459932a12.27.2026.11.18.12.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:54 -0800 (PST)
Message-ID: <01ed7754-886a-4372-8b67-499e8585aec0@broadcom.com>
Date: Wed, 18 Nov 2026 12:00:52 -0800
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
Subject: Re: [PATCH net 4/4] net: systemport: accumulate the DIM packet and
 byte counters
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
 <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> net_dim() computes rates from the difference between two samples and
> needs running totals, but bcm_sysport_desc_rx() passes the counts of the
> last poll. Adaptive coalescing then picks profiles from wrong rates.
> 
> Accumulate the counters instead.
> 
> Fixes: b6e0e875421e ("net: systemport: Implement adaptive interrupt coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
