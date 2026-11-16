Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870064;
	b=uP6wY628ZjpF09ptWxg3hv8ewNz5fhqB8nHR6PlfxIznneuik6DPzm4PlCOgTNuTBCAx
	 2PBgBtqEcd7BmAF79fFMm5VnoW5QCjgy5QY5t67ytU4x6/hJDmOnWm7Yx7aIpvkcm2RGq
	 yngn5m7CY/fwhhwS5EZQ4QJPo7VcYx6euQv5+h38fLk1QDH5mGZgOdzA15A+F9s8xl7BO
	 /sey2ftTyEOpno9KbN3p4hV5Kx1LfTXFdumi5jRgJ3L7yRehdJf3zKv41UQIK4VlWpGZf
	 G/tEkqujbyPqEF2eDolpNJORcSwxggo6kjfQbCn5T4tL7tYLTodm0GS9HqKIZpJ0XEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870064;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
	b=lcKt9L6EAtAkJe86j5au3kVYS5/S/rSr31MnretEPL3Fb+kEYMM9+n9MOY/KKBHHCYRg
	 E9Sh1dAmq2YlWih/XaQaekW48iaktABcbi6LV+6i2wt842UCFAhb0pgfkiYLBoIbF3IK7
	 /4T9oH+fDwWYN4M4oYBtYzQP12yOeCAmvGhHz68Tq/b+b75lK4cHaHtJo2jQmOnqoLMej
	 CdDjnVxZNo5n045NgH9TM4DVJ3sBwJETp3Ftj/VK5dOB7TTAxUr0TVkhiJiBMp3JIBMkg
	 eEBK62MnE49XIsaRCcY2ypwDQKut8gMRAuNZDs1/mHT+FR597KeldO5311deWAnzybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VMFGzylH;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE924606A33A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE924606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VMFGzylH
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3905623a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870063; x=1795474863;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=WI1BkP1FXQe8bBFVlh7jnuoI9xU82N1u6t+mzC1BUdjq1HuXVPegwwQXwzA0ENqmm2
         q9OgAMEaqSAmRPcP4cCMV3JEK1ZUQ4N3iDBHxFNt7pIKb4JxmajNWH1U+dxPhAFfxdMu
         c+739XpRJgEUkd7/IgHZ/wBa9NdKZLWHyohQyv5ZZWN2OMBnBhGORB52p5M5yg2Nwbzi
         UJpCoJ6K131o4k6csdJNakWeMaClMUrJd9N20DP0zN8DXThueZT3km4kOa22sgkMrCFD
         8PRiI0x1ZDSH9TWfWVyppNB4aQqr8glez//X5P+QawpXgMq1L2Q6DNvahAdDmCGXLjpw
         wibw==
X-Forwarded-Encrypted: i=1; AL+hErFN5nLuMptXZhVeCnNByiXDhniejYuLytFV8bE6QOK3PYAJlg31XcsQRv7LDJt0+sHq4nm/OMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+roKsdbCxccyVaoYoE+YPUHwRwh02azK6+PwioZ38xEiQUAZ85
	c+LCpix7eyqJ+HpGhak9Ifd1aN3L2ftxJhh403wR9GXLw+94O/j+x1hnvd9J1Drfh6i3ynTARRt
	eYiMrYI2Sdxu2P9oPFDIHceQyUxj7KglI9DvemHMQGuJG9YxNVcTxQRSb7DLX19e4H4R1nEl7OM
	4FsQDfKEBkEqyGLeJ5mB5BnkzvgstFO9qeUKipFAFRhxY1HlTs6nMdD+EpRDDFuuNRkO0iSsLiQ
	Js/swgH0DTY7wu6
X-Gm-Gg: AZFdTZeeVdF6Ek4ny9rYN68bh5h86mvImxcovcUHTjuVoQDKGg8BlkW/XX+lIdvm5+t
	09kUVRKzi1OaWg7mvkvfVHvNcLOfgu0dW3t4LlVWQxPLuNm4qvc1ldeKtwpC2sCI0f7EsozFnKH
	y4+SWGIuVDru0veuUBDB86JnakQInKyrZyTJKFoGv685hpsBXCik8K2bZxAa8Jz9nuGQNaMbbZw
	wB3HmOWBVJTYf8ni386LuwfjOZgi0GeD4mAeE+LTWPapUMW3P1bIUXfmTm2zVrNEo6w3Z6k81mX
	xAdB9QcrKXKRZcajLw5+VQNTQ6JBv7YACs2S4yHvCUR/Cfm5rFtopxIPFMAKXBJgUUIz09dp9G+
	E7gVCOyK2mqsRvNZmMHJSCwQLR+mZyHTsr3vuF9SY10FnBwIC2FYWueAsF6dHceLyZYf1+nKCXA
	1zq38LnqY9ywspkUdW9HZqqLnUuzDAfAPetM5hOAs9
X-Received: by 2002:a17:90b:3ec4:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b1b09e5ed0mr11321110a91.20.1794870062725;
        Mon, 16 Nov 2026 15:01:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm583418a91.0.2026.11.16.15.01.02
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so5706347a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870061; x=1795474861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=VMFGzylH3ZtWokwNrEfwF7sqpJCZo9YMu0baqmxZDGGuCxhIay7dGBWbL/0/RP1+2a
         m8RYmxR+hCsrPcWC2BpF9jAiyUizVxatq241oyDJhC4HLFfCJHCdS/bfVAsyroHyTfN7
         7cQaIHu5sXYGTYEzwsL8lcGUF1QNz58rz38MY=
X-Forwarded-Encrypted: i=1; AL+hErESlrAcAQjZEfzdBera0o1sktahvgDV7cuokm78CrQN2NctKdJZ17aYwB2ZD1p65/I+LR0s8fk=@vger.kernel.org
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853199a91.14.1794870060911;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853156a91.14.1794870060381;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:00:58 -0800 (PST)
Message-ID: <d2942f59-d421-4aec-80cf-4c6ac52bac0a@broadcom.com>
Date: Mon, 16 Nov 2026 15:00:55 -0800
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
