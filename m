Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134851;
	b=Lvyhpn7g8YYJWpkGcyXcp1paLIFx8tKe5nuw7OKCS9oPyjS7O1phi4gLmziNqYc2KU83
	 29wkY7SaETJTkTaRM8XdudW3Wof24llTdyAcwuQGFRv8kncvRtCgCWHkSCBJw2XvJnAsF
	 u5F260TGiV3nlR1tyFeQZ9/eJeQvwA2nS4iZFmznmVzgZlxx3zAxjoWPnq99V9nJmB1Hz
	 n7KwjH+KsaP4ZqFY5Vziyq4V26QBYbuTI3GHX5FjoUUXftlNvtaBjhJ+Jv8Likc0OSDwh
	 blEqM666GWU1TLIHVYB4vDyfaLMRTlguyKOm6NXMrk/d/82b7vizgan3DkERcEBBM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134851;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
	b=PQhe90cZGWaT8I1PshE23huX0uR7oE6TB1OuMIG+VokEiGpc3MrqKBRG0FhLJbBpk12n
	 9XKir8LB4swGs71+aM1Pb/IWZbKClzLnf8CU2HdX1UciTDAFUJGYq+i4lIW9XdryxuX7a
	 3Oitvjg86jDYUV4KUbeo7n3oGRYCAZhotR2uqMkqOaLpEfX92mpKQlfVw1x+mr09oU9H+
	 JPYes+mnkoUK6cHcJgi0q36057F8LLsA+xlPDrU0GnPOalbQ+otL0NCIbGKlXOQcO3m/Y
	 pKLS6rvlQALq7GYJ6GfJyXU1m5GqPg1+d5BFiLs2ZMK3xN4iDSSE+Z7QUWmqVgWHqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J1sHKXZl;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7717606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7717606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J1sHKXZl
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso219306a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134850; x=1795739650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
        b=LDH1U6VbzxKrYvyFq5vSLsSRecuNVxcW1BhVAbv6I0vGV/42RMzVtaIfvTCaIDkBIl
         5e4v5/SpYLfYk02pEzzrg2uMkSmQP8kjGFP+Yn+YzIbgbyL+8lSQTyiy1gsjjh6w8gsf
         bn4tg8ktGRfCLDLLGwHr+0RPgzp6ICEvFMm3auR78Up4WW+KBXvh23iM8zE4wO5Ackz+
         mWrDOkRZk4gNLPsliZe46lkdEUODvHL8ul9IeW6p9xzDCFrg0xxcfcKh9X/dJeOnzrgc
         spgNPFaHFBF8Pm8A3OMVCMwxZPCLBvRhGTGInAJtaJhWv0zveWXpwM2rQ9hiKeYmPI6b
         nqlA==
X-Gm-Message-State: APuU4Z+axhxdnRsjcx8r5DG0GQpCXpQyptWb/D3gT5CGd1ZWFEHVJjzC
	PzMwEyyD4OJ6Iy0kDkUNxLGFyJ4NCaPt9soE48Gm6yk0sI1+uFL71inDolymk7FEvQNEVsduG0q
	4zLGZKT+VkP2IgCGOEoaGGnTmlyCAEaqrDe2FlcFnveX5luKmKxvd37vwbnt9iql2SJ4a6niz7M
	LoFGrbAHHo+Hb8X6OptVZkqYV4VCSRmEWWQoSC4K/4zDQj+mysHFotQorTiv1IQtdb3NmC/Lxmc
	pOCHMd1/njOge35
X-Gm-Gg: AZFdTZfdTQMy0Z68J45iZtMWDjWxY+OmpWNshqAIjXK9DnGgSsOPVVScUHZ2mMDFqpL
	ZRymTDaxueCqW96RRKWSzXo2XcSsZ+6leB+JddtQuv67XbmjlSY+DfQd8MBPVDM8BttRLfOJqaU
	PQ3bs/OJzVgciljVamSoQ8AGVsCzjhW372xdVEFZGhK6HLFgKJ/upP1o4uB2RQBEu/OaZNxQvY1
	C3SQv/W13mwd91Jo41a3PWUb+oDjOSCnVozH0BqSKACFoTEErMPa8bShN1JRXnOJ7Vi5kiW3hUs
	0fuauN4/y+XTgU+3dCVUL+D9gISu/vVUxz6Uy6bm3BiQoe+/bNYevI04ZhQ7SUkz33Gs2x01m2K
	S8dzECM9n69hPixxdoWcsspg/u6dZo2kMlfhl0BvSq6kP63SWFjCQwvnGtEmjobr2/cCLVteI2J
	XZ/wGjfib4VFeWoiwRCfI85BClwudTqlDKcqzf/h0Th9o=
X-Received: by 2002:a17:90b:2fcd:b0:3b3:fa20:f83b with SMTP id 98e67ed59e1d1-3b41c954553mr975428a91.40.1795134849892;
        Thu, 19 Nov 2026 16:34:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm2020179a91.6.2026.11.19.16.34.09
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:34:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso974128eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795134848; x=1795739648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
        b=J1sHKXZl6P5SrmOJD7HkI1+EncTJ67m+hzwu2dZF2Y+xFofY8VaETkiyJ8g7Ow7gXd
         KBslTz0HebEg1W6KHM37J5DhDSpsb0nyNn1S1BbtcxmYXvlqrUhviPy2tK4k0CDVQc1v
         5/mGPoqAXB6lusK2XU5KOqWc2ObzMM7aQNfms=
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr1680203eec.35.1795134848132;
        Thu, 19 Nov 2026 16:34:08 -0800 (PST)
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr1680164eec.35.1795134847415;
        Thu, 19 Nov 2026 16:34:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385675c9a3asm1867163eec.19.2026.11.19.16.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:34:06 -0800 (PST)
Message-ID: <8c5327de-5765-4f58-8ef3-2d09e1841048@broadcom.com>
Date: Thu, 19 Nov 2026 16:34:05 -0800
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
Subject: Re: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure
 and removal
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, rosenp@gmail.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
References: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
 <179513476984.3291.1559548469790216407@kernel.org>
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
In-Reply-To: <179513476984.3291.1559548469790216407@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 16:32, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

This was discovered by a LLM as part of the larger review of the flow 
accelerator support. It was not triggered because it affects an error 
path and the driver unbind/removal path which is hardly ever exercised.
-- 
Florian
