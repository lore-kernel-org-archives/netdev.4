Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035684;
	b=oP/0OWey9Jan/AWSKtEq/YUTiH5Y6AvO55BmPEwWMWh7mzphuSLua7yne9xDC5Smlosz
	 yfwLokuG1fjWc9dZ5OAUfpWXHLhOCxloia9w7LkeEoLm5w1+z/+VFMqIDTscrJZ/oLJh+
	 f0v4+I2F0HlhObDz1CWw3/gmm+NCfORujqUVAbTqasqJnECwJnT9k/3VQbjQ3ubpL2nri
	 BpBmJ5F2KQa3Yet9BMWoifhqi59/d6PQYrffR+CW13FhlKrG8+/EUOLqKnXG/XREsqnIU
	 49yuMhPWPqEr4Du2EyDvxeWGENoEanHfk27piQbJhC3f7VwpkINlQj8qDYAAPuGmHDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035684;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
	b=KmiPAnMUUsDeZey9+HIw4F95CCjEEf+cyCbfXtykXDhCCHOmuHDVfseo1hqfclPNBzwJ
	 t0jxKYC9a24WGYZY9YP7FQK2buFdc0j0LyWQ8+SdCQtYt7gtsjdAVhuYkOlam6jZjkgTk
	 8BLX0ZIqr/LefgZbdw/MvQS/OKGABW7g7BivJSZB3m0SY66Aoi1lastxB2BMIBTmu0Lcr
	 od5lkqjloptqf/urj8ZL5DnA5aG6Xsg6W6JYQzHR/6hkazvs7LLwak6PzaApm117yCHTy
	 AFLh8Rr6lIoFVT4lvgdCPW1ymP8gobFVB3KAqNAkqcYrqljj1lpa8zPTy7dYH27CA2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=faKY1bDM;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFBC60A2610
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFBC60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=faKY1bDM
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso946288a91.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035683; x=1795640483;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
        b=0P+0rbE6r7ktqZv30ILzWtsoODacsWwksddRArY0PNzNaCP98dJNG871tGNM/N7lMF
         7h9ocs+S+DjnPvdt3DyCYOMgDupf6gqYBv84YS5igSFFw3VYBUsnP1qNx9Oxj+s/007y
         c4b09WN1vwNnHQxjFdhDeOh0IwWJgK0G9BF70jCt1a/avi4RKSRC+zvCp8ggnT+HSI7L
         shTTQRi9WmqfFjNfpD8b4k7xVHGzPS4SiTrnJNuO5OnOpI5Z+ja3TlN4HABqJ90XCnzm
         ee8hJ3PVtmChvXEETIEatK02nOwqJSGXgy2mL8gM1DUR+RjjAFa4mGXlVZSwvXUx8ye2
         3b0A==
X-Forwarded-Encrypted: i=1; AL+hErEE6/i6GUpAK03cgc9St2Dk1v1fP+apoyRQV2RbUl0sN20hzX5XoBfreKTtUEKGMKsemFJVdkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+op9AVqD9h5CvVSMo95VtOrvzDgNv//LA5MpWULItmQO1hj4Ef
	axf5oH3JaqZiT0pDbYlru3VyiDq0rV1IN2ZewDhxY+8jGtxWRPAJ2xrIjhBOoq5JlZx76R/NnsJ
	bn8tVTPksJ1quKGrS2tOqHFj2QOOpkMulDfZvRoiT1ZHq/f6IH+pfCVl95t6MHTutJNMNkdBn5A
	1sXVJsmxer4sP06sF0oEZkdA04t+OXAP2vwA1eZgw6OEaHYW4L3kQbdTqxwCJ73U6trBTS6MUyg
	P4P0xAx+Asn7dcu
X-Gm-Gg: AZFdTZdIqIMz7PT4OYln6XJyDXFamZ7eQa/dOTt3qUOCug1lKgfYkQ+T3WrGI1vRljf
	NqZLRL30oCMsoENBlApHEzzEeHxr0iRETONlNHjafy7ET8/rtKSAtg3eIqsOdXtPaO/DYmwl7UM
	finPYxpdl93gIixAybxFSaGPnVNlMjr6f/smw3Kdf4dB71ZDrCGkHkVgX1MAZo9ejsnkrMz1b82
	cmifBA1DSobL4hYXm1ADeWITzzJ/fRO3+dpCLvAHg27hZOkMt9AO5ov1DQoe+DnA37S+OWvuSOD
	+C/04e89hnej9ETu65bfv5mAgIHgd4lpUKg8vCicPCsQ7ymA4aUdLtaMFhnihV5C6jhLXYqOutR
	rhcyFsnBYYtq9aMVOsv4zJmRYgtx9NFd8P3bpmkUbg6h9m7NvWt5GHUn2qmIUQc4anBGX96rURy
	rhVrfOfUrSaOYpvRlxdWOXOWKNRal28GImZW70Q3MdxkI=
X-Received: by 2002:a17:90b:5848:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b3d07d80efmr3369806a91.45.1795035682836;
        Wed, 18 Nov 2026 13:01:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6bbbf37sm465449a91.6.2026.11.18.13.01.21
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 13:01:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so20755a91.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795035680; x=1795640480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
        b=faKY1bDMm5nBj3NPvjLWhQ2QF2ySyl6b3TIOiFLV6Ol/I9uu35cAL3tMQOz7F6CSoo
         P0T5UX98fJVUUoJOI66T/4qikNYkv3i2fRjIWVDu9lCb1up3RSmhx+NzPGzmgM0X1vyY
         nPqnFaqNEmVgKMGMqZES20JsgXsAdYDsHuNTQ=
X-Forwarded-Encrypted: i=1; AL+hErFM5YewUIeT8ugEItZ9frEQbqyQsau/XDkq4/JpZN5b7v6/PKj2+2p1nqAfd/puhuFmryjjcFk=@vger.kernel.org
X-Received: by 2002:a17:90b:1c8b:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b3d07a848fmr3341314a91.24.1795035679710;
        Wed, 18 Nov 2026 13:01:19 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b3d07a848fmr3341277a91.24.1795035678959;
        Wed, 18 Nov 2026 13:01:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6e1a132sm889887a91.6.2026.11.18.13.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 13:01:17 -0800 (PST)
Message-ID: <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
Date: Wed, 18 Nov 2026 13:01:16 -0800
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
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 12:40, Nicolai Buchwitz wrote:
> With xmit_more, queued frames reach the hardware only when a later frame
> writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
> and the queued frames wait for the next transmit on that ring, which may
> never come.
> 
> Write the producer index on the drop paths too.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

