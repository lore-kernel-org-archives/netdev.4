Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198713;
	b=ZmzBuCd//meZOSf4ombgNlK/n13crWotYOzv53MRPIPtBKLHnQ2q94eDnYzCUy2CDHct
	 7jI4uauId/v4lx1a/xzIgbMEm8xTdY+ueHX5Ep+Mgr9FavPkXLG1loB8vBbqrOmYcx+Tb
	 hEl+ATpUsTr7b1M+ZEAaEMFxZTceYSuLiRFPNIg63zmhIrcB//UmNpqtZACOq45cxDoNa
	 vGOzBsoVl+1eRG0jh2pbn28iFVuOFZKFkyPz8UDjFFACWhFhRw3PTfoZ17DcIM6GoJXoA
	 PcxVh+OOe7/U/RR6/uEWKboWNcEG9ZkB787nJ3vEgKHfBBCi3wuvhthzBjGoTaiC8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198713;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=jj+be5aqhSTcU8zL0FKiTltNkxQe/jmWn4PrkeOOYo4=;
	b=yka+Maw3fiiiWIWjyl6nyo/D2abtg42hD2z2ZixLfbxXPevEzT0RgpIaN8OE5l0NEDKc
	 pvITbUqPzuxm4iCi7DoFPw7TD8KAk80Fd32Eht8uVcWVqyR3DesGWJEI6M9eHJNH2vaSc
	 EtPsWWO2PJ5rETtCuEqqS3UwYHirM4YOJrIObpvqOQPoQgs0RF4BumhdN/qeyXqYNjhOc
	 UGsHYiIN6L/avVwpTvc7MNjdmIFvx+ROcMpCHH2q0Um9C15TyHhferPakPuoiJUd4DGo4
	 HcEkMoZ97pab2N1kMq7VJ52ZCGzCkwJBOWSzpgaPWYXPEzTIMJsU3nX7soNrJLuMM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D2c7TCeb;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B6606C6CF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109B6606C6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D2c7TCeb
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b413997581so1171897a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198710; x=1795803510;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jj+be5aqhSTcU8zL0FKiTltNkxQe/jmWn4PrkeOOYo4=;
        b=s0aoyK5OzG6x4eJR0pzzT3FtHdNsDrn0vG4SqKQxsPFTZQTOpslNgFeUnwKSSCourw
         R5BoCWso46F8yRzT2iKj4oCEeov0UfWU7ZMOjgNqm7Z4GeaOIbyOQm5UsdhGUW3PtcaN
         8MSTSILkAi/M+3KAM2srz0A44gz/1S6VTQ63MqWyFbwtlAaskcart55ektzG5L4Ru1zR
         W9u22luvfimiIGzSyb70i15iRv7k/RlKMPuQD0TyxtaylDVZ7F/xStGy5+fNFC6OzT+9
         XLtOin1VbX+H3FNLq0mqugV8UJBx2DMYMtuTMWBGIVrl8RKEO+m8JRV7hGOSPoHR+lZw
         W9xA==
X-Forwarded-Encrypted: i=1; AL+hErFJq1dd7424jGYutFrnfmsfLoKUfJwrfFf+CslP/Bu/dqNvIsj5WgNwBm8fiuaCz0zuvY5DKRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bMBlxucCszBbBPWvzDNd0zejEuEpitLZBK0iz2uhcxB9wnbfQ
	b4PjiQ74Jg/66B4F/Gh3zLPKY+yYbVf+xOxDugLhqkzZojLG+RBxb4BuLPIIWT72gpBlZYE84BG
	zjEOC24URsEJPXJQmGjv322SKfnGHOkFeQMnNn8lGgfNH6127MKXBZbr4IRz6+SGa54Y3ijtj3K
	y3FWpnmuWcNTzkgm5RSmN42gmQCtH4KIOxKi5IG4RdbbSA5M/3B3yD6OvZx7wK1AOQsNMrYqRh3
	ObaTKLE91QAxkg0
X-Gm-Gg: AZFdTZctWu/vA8RH22C6leO4KSHQPga3gtDxN9NchyuXEe02zwPHp93/aIb/kcOVGid
	CU03xNIXGyhXcM2o6c/Gg9mNje553QoRMP0Ja1vSxCm/LVOwT2IRGUJVzdO/RDlkyHWGwbSezJX
	GXV2eP6mqvRyAGPy23l767Ny8JM00ryyBi1zlLVZof/UNjpXAkDvD3CQwvEtfPQQsmk9ORxOri/
	N7vSaXtnqKq5dhcfqrKC/yfNF4XL2+p/le7tR3SEfl4v9X116055nilRS5rMu+sb1wbTrfSxW0e
	yTDDJy6DXiNruqmbMhXiojuKsRW3M02tEXlnmFsMPof96WgSboFck3FVPuElpLHOGaoFBA4dTsl
	krSr9k8R8XmIP9S/+qFxBUDLcMUGQuISmUYkF977CKj8LklIajrsL18xwAOGm+MhgrYdwH86rNJ
	COi643hQTebRCw2UN0eE2gekFFZ/79hnDS8VEjzolbESY=
X-Received: by 2002:a17:90b:3810:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b41c9bc27emr3649911a91.53.1795198710225;
        Fri, 20 Nov 2026 10:18:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b405960cd1sm3546372a91.2.2026.11.20.10.18.29
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:18:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so687410a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795198708; x=1795803508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jj+be5aqhSTcU8zL0FKiTltNkxQe/jmWn4PrkeOOYo4=;
        b=D2c7TCebYxrPNS2zQM64/b6vL3IEnfzGuvAMefq3V74uV6/OR2sdqj9IoviGeP6YMr
         NjqdfbLzEJMJgIz55qyAXCq0TBUphZ7rAcNMaxOE2NXlCNj5tBjaCk5utYRX0MEQ/jIh
         Yu4e+YmxA9FYx9+BdLnM0tSzDE6Chm8oNm2Wg=
X-Forwarded-Encrypted: i=1; AL+hErGEtb4s1SXgOFn6g80ykGbuiS2bYHKcf9kQ53p6yttDir+xl0x37a8ma47fNicRSqBw3aEyKEg=@vger.kernel.org
X-Received: by 2002:a17:90b:528c:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b41c93f8bbmr3512847a91.35.1795198708476;
        Fri, 20 Nov 2026 10:18:28 -0800 (PST)
X-Received: by 2002:a17:90b:528c:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b41c93f8bbmr3512833a91.35.1795198708060;
        Fri, 20 Nov 2026 10:18:28 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm108261a91.3.2026.11.20.10.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:18:27 -0800 (PST)
Message-ID: <0139ac37-fbe7-49fc-ba25-7b32df081920@broadcom.com>
Date: Fri, 20 Nov 2026 10:18:26 -0800
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
Subject: Re: [PATCH net v3] net: bgmac: fix RX frame length check
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261029173122.29636-1-rosenp@gmail.com>
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
In-Reply-To: <20261029173122.29636-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 10:31, Rosen Penev wrote:
> While reviewing commit 77dac783f113
> ("net: bgmac: rate limit RX error messages"), Florian spotted that the RX
> length sanity check compares the length reported in the RX header against
> BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
> space reserved for struct skb_shared_info. The data area handed to the
> hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> BGMAC_RX_FRAME_OFFSET bytes into it, so at most BGMAC_RX_MAX_FRAME_SIZE
> bytes of a frame fit in one RX buffer.
> 
> A corrupted length between those two limits passes the check, and the
> following skb_put() runs past the skb tailroom and calls
> skb_over_panic() instead of dropping the frame.
> 
> The check has no lower bound either. A length below ETH_FCS_LEN wraps
> when the FCS is subtracted, so skb_put() asks for almost 64 KiB and hits
> the same skb_over_panic(). A length that leaves less than an Ethernet
> header makes eth_type_trans() parse bytes the hardware never wrote.
> 
> Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
> BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.
> 
> Only compile tested. Not tested on hardware.
> 
> Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Rosen, can you address Sashiko's feedback and resubmit? This patch 
conflicts with one I have in my tree to support flow accelerator and I 
would prefer to get yours in because it's a tad more complete than mine, 
and yours has precedence.

Thanks!
-- 
Florian
