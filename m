Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450224;
	b=q7UbiHxNMo1lynbUjyj9UHrCMIJbw0Z1Q/oGWBvES+X7RppSeo1P6Pjspxm2ne492Ii3
	 BLWFsXl3DQUf8edyg4LQMTM8ZSSmPi+gLps9iaP5IqrZ1zXSkl29EL+U6x3WSZ6a2KRgB
	 aO2xwXTH4/XsIoZaRYkdLzEAU3fTrAct5wqLzcxFyMPXdgBT3zuFigBNhg1pJrTxGksRl
	 OHnXcn5hkttBhGk3jfRLCwqUfGZZ3WJJFa5eiusccQuPADu8BnJXcU3pAc3NAWbody+fY
	 42i/AZ0PeCzcfECgwwzY4tNWZC9yPmbgom/fIE2d5Fldoyw9PL8k6cxBhxW6WtIHKgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
	b=Jlkt7vbqsBmk1o+nXG7aLwAo3bSM5hpp65l3OLhL0aPp2qQrcfpCT6lZAc0GVuJkcMEW
	 hUcBgEIKSkIH5nmWsXQb/ojLr29TUnbDLYF1rZD3xy/DLcgPJ6tDg6bWxCEEap9x3PZic
	 hNmKeLEV0PKMTuv3jSa0VyseXPzvoHn6bBwNteym0Jn/v9uROV8zrJjGJfg/GxmqgjBfQ
	 J8zbPKEKm0m48P/I4b71igXsrvEUKMtEFgDVubkHHnvUteq4ZRo7PlTlqBfK5R5UWardR
	 W7ugjSRFrtwEJBAHjXB3vyCoCgK0hoi1Nh1l5y1cv5yNb0cZUPUL5pFdjNL7rr6PXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B5606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gM81qaTc
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1808599a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450224; x=1796055024;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=k/rtaTbi3qPmOeQm4KqbyXFHzUdtAKKzu5l/mZFcUQ7ZYOCZtZNhCYvQPuGP7J8rB9
         HeK5wFiOHSJ5yUCBW8qmYcg97DaF2yJZeFMt9o5ad3WiifHbphVQL+g14t+ApTqVHJfw
         pLZMRNO2ndQ11uskA2HFcF5H2iadSUAwzkZJY16E9FYgDM2M5uT4KHbpi2vTFD/94ZV2
         dqu6TWxBYTTvC6MYD/49ephPcyu6aidiu2bfRPuzKuN9SlUFUl2xz9E/P5PXBPMJcrMK
         phSAhmBuRO+KECoGlzWSJYeINqpAT/YcLexfb302dW025aJvojSdbGIlZvk5tgW6yHVj
         YmnQ==
X-Gm-Message-State: APuU4Z/ARRnVjkUBXAzhrF1JSACIv7cYaAeTsTUXw+b7lAgA6qLF+qSb
	wGkTNbQJQl9eBnnbWwS+0fR8TVnEsPzdoj7B1ewosSm4uYOlwjtzfsvDTL5KrawS8Kqb4PAu7ER
	+8rtt3tjw8jBXmxHxhRJjlCTMLKAie6gTL+a2FpXWHuR/c1foPNKJzkYyTmC8FZjRoGG2Kvrd2N
	/7Bo+sCNbZAWfblcFtInt70jfJ1DadMLEUFRpAe1J1BrBZhLAj/63zdA8ZwhXhSjuRa1zbMCrOZ
	Y8ZcYrbz8Xgz/y+
X-Gm-Gg: AZFdTZftR28h0uiYGjvaNdsyMDK9lsm0P37VjZtSOqpoFt43OA2TYpXYEhObzKqFv43
	9dEPjM27UlN803cFMOahewIo3Al2jTQwB9EiNiZ9LIsuq53RPTsbaAgbHCc51k/3GDzUfzgyMEC
	v9+BSh3p1+aqsk1ufTj7I1kxtnWycXim+BCxeN27bEH4iRrBiEbo/C/Ex7psQPmuXkawfFDqLT/
	wYGlZjAED1VFpadPaQALIv4kBlaC57sJlBFWEmpKBn9wk2O/znHmKsrsTMk7i4cFJVqRRPl3htK
	fWmXcyUldsRPNXHUpIRzYUJPpUt/HL052n/YyYPwOHOi30266y82pBViwq+J+NVNu/h4N9fvVyo
	V00lf+0q8PlioIwSHmC50Tnag1x3ATfE0D1lwEkvoPQeB36YBL//X42Dfj1UgZTjB8TZVw7rElt
	2nKmCV5wFNR2wbvOQfK6QbVDCIOc1FFs3OsPnDlcdlqWA=
X-Received: by 2002:a17:90b:3c07:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3b41c8fe351mr10778948a91.24.1795450223529;
        Mon, 23 Nov 2026 08:10:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm8184232a91.0.2026.11.23.08.10.23
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso3597110c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450222; x=1796055022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypOSzkfJxIBRiqRs4/JLRl10BT/rd5hCCDRvucj2Z1Q=;
        b=gM81qaTcVbNLppi4ERhQA+iFdyvhxyA786MlSXuu3iNrSvd4cnB56s3iPQjEE7BQM8
         0y/lgC9jhTwcgipShOESHGZbMmHHhnRRNiKna5v7KEfhutwTlaq0K8by6QaPfnxuoHgq
         gA1Q2PRZOkAygqHKS+wSuND+r/V3zOC37D5/U=
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257224c88.28.1795450221763;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr12257183c88.28.1795450221034;
        Mon, 23 Nov 2026 08:10:21 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm22003793c88.11.2026.11.23.08.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:10:20 -0800 (PST)
Message-ID: <b5a899c1-c1b8-409e-8b50-ca722c229f5b@broadcom.com>
Date: Mon, 23 Nov 2026 08:10:16 -0800
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
Subject: Re: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate
 and invalidate cached paths
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jonas Gorski <jonas.gorski@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Westphal <fw@strlen.de>,
 Phil Sutter <phil@nwl.cc>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:NETFILTER" <netfilter-devel@vger.kernel.org>,
 "open list:NETFILTER" <coreteam@netfilter.org>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-7-florian.fainelli@broadcom.com>
 <awI-mtwn3ohPw-fF@chamomile>
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
In-Reply-To: <awI-mtwn3ohPw-fF@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/21/2026 5:00 PM, Pablo Neira Ayuso wrote:
> On Mon, Nov 16, 2026 at 02:25:16PM -0800, Florian Fainelli wrote:
> [...]
>> +static int nf_flow_offload_validate(unsigned long cookie)
>> +{
>> +	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
>> +	unsigned int dir;
>> +
>> +	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
>> +		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
>> +		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
>> +		struct dst_entry *dst = tuple->dst_cache;
>> +		struct neighbour *neigh;
>> +		u8 mac[ETH_ALEN];
>> +		bool valid;
>> +
>> +		if (!dst)
>> +			return -EOPNOTSUPP;
>> +		/* This is the actual route selected with the packet's policy
>> +		 * context, including mark, DSCP and the reverse lookup's oif.
>> +		 */
>> +		if (!dst_check(dst, tuple->dst_cookie))
>> +			return -ESTALE;
>> +		if (tuple->xmit_type != FLOW_OFFLOAD_XMIT_DIRECT)
>> +			continue;
>> +		/* A stacked path may have a different final Ethernet neighbour.
>> +		 * Do not mistake that unsupported context for a stale owner.
>> +		 */
>> +		if (dst->dev->ifindex != tuple->out.ifidx)
>> +			return -EOPNOTSUPP;
>> +		neigh = dst_neigh_lookup(dst, &other->src_v4);
>> +		if (!neigh)
>> +			return -ESTALE;
>> +		neigh_ha_snapshot(mac, neigh, dst->dev);
>> +		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
>> +			ether_addr_equal(mac, tuple->out.h_dest);
>> +		neigh_release(neigh);
>> +		if (!valid)
>> +			return -ESTALE;
>> +	}
>> +	return 0;
> 
> This validation to catch for stale entries looks very similar to what
> I'm working on. I guess there is a chance to consolidate all this in
> common infrastructure for both software and hardware modes.

Excellent, happy to point you to an off the shelf device where you could 
be testing this on, if you would like to?
-- 
Florian

