Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031897;
	b=BEE9N4xZVEhPM5lMnvLn/MpQRRvyaypn0ASEsfZsD+9zDBmzOHxDEW+u1ZHAwwFci8h8
	 QxFF1kzE2qB5x7Ioyc9fUpaEdKCH3+pN2uQeQp07PO54Uy46hoH72Kv/ms/8+gsZC4aO3
	 I3Q0RB5jaws18nHyTAHF5dyVic2D8KHxgwfGscsmtsVDApC3W1IIaEqw4hwdRmYhFUp6B
	 fLHFX7vQjyUkYxceAvX6SGrfn2Iiagliw8fKdjnZDbyI6R2ZQ/urlvR49TmzCtEMwzesc
	 oAzLKsLPTVIjwu+O5MM2qlsW5XpAvBxQbDvDVOFTUVBBiwpNdCHlYxj71coX38p79xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031897;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
	b=rKorZNUzAEW22tIxWD6a5YWLPOoI/y+jRDOQi4i7c7bD+hzyaXVkZvdTehFBHjwIt5Cp
	 2KhOzHAcRunsrDNI0fgLjoA2szD0735cgqcokxmrdaz/ONk8zpr/oqHYYXQmZuANk/R6F
	 7hpxcxJ56QxWAX058UAszAFUGBBezZ2u8M6ewvGDKjKIyUpdHD6WmQxy4uB5rHaEdeyeR
	 kW3bgynJOkjgBWIKSSajN8ztu3kdPxCFLeiB/E8wzem/IS748WNc60QE24LKlapN8bAv+
	 x2HKRaCdIVrLbcOr454lmBzwJD0vGiqnvhFGJPB4m1Dr/JN6YgQENS9o70BOaO81y8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VS5YUASb;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD2606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VS5YUASb
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso841928a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031896; x=1795636696;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
        b=RtWJ1fRrT+JqSxS/nzcS2fRP7eQo5FSdDg8+pSW3TS2d1CX50HsdX9BpGitcKX/7W6
         fyUF7WghLnkFIDASh4mqydUbPrPpr+yGwaMoRBK5YVzEXyVrioObH3dKLT76hom8TQKC
         qEKB1IFKcYqciu9wWxEye+TEJbvgRBS+rxxaJDHCItNkPB0ouIjor5aG1VWWsZV3NDkq
         XCRnsTlDt0IaJ7AjBEfIGtO7nw5iCbhK3noneq/Zv+xopzYlETW/Bzig8TfoABn0qZcr
         0xakEDwlXJs4hMcEWsPcfyf54Y8d2hLcC4+LY3smybCAPLTrVhbQ+lQlC2FkAQ18Xs+9
         R6OQ==
X-Forwarded-Encrypted: i=1; AL+hErHS+5b0r7qvTTQN7Ot8Z6TSEYLqvbT+YMWWMfZ5a0lT7uzj50eaBpfNfdy4+nEGwPa2FoRvr48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hKiU1fw0U5mpu+3B+KMOeSqNxG5ccMFNZccujbf3F6u3bB0OD
	11A1FhYt6+hQRJrflJHTofoq5abHcPXdqU8A6oHRHTHSWHHiBJod7DqYplE3Axt6786wJrnzrWg
	kuZ+VRJmqmg7335wNdHNKGJAC7/xk4FX/lJu1Ublpf7ZQCuVLy/6/nA8EJwRZPpbBFWd3n/sV8g
	/1fw1zuXgFZygYYmP3eGh5+f0YCSiE3xBzBxswaCSwt0klF001UohkoPj4BnbaQw1JSer71qLLu
	MqqzZKokqbPGjmO
X-Gm-Gg: AZFdTZd31PTe8ADyqykwRSfNEKgw6Mxcd7Iy8g3Yy8W0Ttu/ArRg50iZ2hNO9R+yLKQ
	1RjxZum65EnxO3WgZqmpUtABflshfbC0+f6vHeHlOEqS/iXAxXgWOgsHn2e3oNVRD1No5ozBQn2
	9D6TAybvkrPiqMxqtLUXn6cPiRvrz0G1Be4BR3JywRoi3jRc9WBDN7zq/LsOApPQshpk9HkQsUZ
	7r/MErRXz94usbV0KoOccnrV0NYyPaaOJcWj8G1R2xnDgpLWMPJy/xaVnwnMqHnb/9GGmeZoN84
	868WqXs3qugtMy1sLF8MVf1pkJz+cag/VTNBEcBPDBqswxzPrRj2h4LeNIT0TN3UfhwrbrR7Tth
	zzxBBbIiG6HU88lx24XQuw/wGK7d06iFvLBS8quyQE1wK05auZICVQp/CG5egBJibDQZmmUrW5X
	vLQp6v5AQfaodrNKl3m0k21uH+EEqCZiQAcIMS2h6O
X-Received: by 2002:a17:90b:2dc5:b0:3b3:b36e:8c3d with SMTP id 98e67ed59e1d1-3b3d084c2b4mr3276296a91.62.1795031895906;
        Wed, 18 Nov 2026 11:58:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6a9aed7sm370296a91.4.2026.11.18.11.58.15
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:58:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c13273dso24071181cf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795031895; x=1795636695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
        b=VS5YUASbilzD+XvZHNfrpXhY6nnTAFSycHncgtrUb2z3D1lTezNivDaUoUNpmpc5Dp
         3TTgVhkYP2Y1F5E7jA/NZPHoIZ2hWHOXzHBXQSyrBZLuM5t5VrwIC5/Ak40cen+Z6Mdl
         9ix0pBjUSqHAFvBNgV7nHj1YEKKoC0Z+/XZQM=
X-Forwarded-Encrypted: i=1; AL+hErE2mcM6+G7tmaDk6Q0RHnW912V340kTtnbD8w/MWPZ3bGoXJWJkMvBuaezyCsH1VL+Rj3abdIc=@vger.kernel.org
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr57244971cf.77.1795031894687;
        Wed, 18 Nov 2026 11:58:14 -0800 (PST)
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr57244611cf.77.1795031894077;
        Wed, 18 Nov 2026 11:58:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d669b7075sm7489411cf.2.2026.11.18.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:58:12 -0800 (PST)
Message-ID: <51a77e64-3e08-44f5-bc28-6fc110945653@broadcom.com>
Date: Wed, 18 Nov 2026 11:58:10 -0800
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
Subject: Re: [PATCH net 1/4] net: bcmgenet: accumulate the DIM packet and byte
 counters
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
 <20261118-nb-genet-dim-stats-net-v1-1-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-1-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> net_dim() computes rates from the difference between two samples and
> needs running totals, but bcmgenet_desc_rx() passes the counts of the
> last poll. Adaptive coalescing then picks profiles from wrong rates.
> 
> On a CM4 at a steady 300 Mbit/s UDP, DIM changed profile about 1000
> times in 20 s. With the fix it settles, and Rx interrupts drop from about
> 4500/s to 2240/s.
> 
> Accumulate the counters instead.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

