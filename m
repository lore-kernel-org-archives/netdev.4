Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220383;
	b=YvTewPfHya9WGTXaLi2Wyh/DCV97BLuKX6VImrlfp847NzZTB6nLtegsTgN/bvcaAw7i
	 362QiXlXqd94zjl4NCZYzeYHhxs22Np1GqY060LJkyznwDh+0KALJx5MYo0iHwW9jPG0A
	 tDlwaAZI/I4wQxUQRfUl+PCwDgx9G0rGWouYDys+h985oLPS/ZqSb9+1wiFd+mJtyUgVm
	 ti8xUdoY5I3Y2yussFtcMSxveSdHQEj632mge3vNglzDjLQvzRoQFtcltiTF4IIjhmcsj
	 r6H5vxBlckD3S9XyXxEzD7li9l+bvk0z1goZ0YZ2fIzf+YBwD7yBhjWrc8u9YqrhDjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
	b=XnOv8aXAyzxIsNzTwWTJLUE/aLY4u3w/svqpYIm1Jebg72JjXUdXHOFaibqqw7Dyvwa7
	 5VFmDSzvevkZy/+bBxo3QxngwRSGrH3nbBUIy+sHtmtW6LkI2miGUpq3Nery3Av5xZWmr
	 gtmBpbZNUUzF1xV4QKZ0mQDgUbaVWO4tmclxsGZ78cbC2y7B4awkKEecPkzHn9/PEOSpo
	 l4PG/q0M2l+kk2hI6uLbDB2AKblHKsLAP57rq7UbvqB1kuUwfZcYUgsZ1UH0YazHIacBp
	 66v1QJBISUxoYf2Hyk58g7XUw3A3TTK5Dt7ttHIUrcvi0AQR5kDurljuskNKQ2AcHFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WmzJNeQm;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F9606A6AF
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7F9606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WmzJNeQm
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso766448a91.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220381; x=1795825181;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
        b=lU+Zqnb8Wrud/LoM+5VFbdbPFlA45x5WP90myt2PJP5GgK5dU0sHsDxwJRc8FEdzV3
         Fiblpn3tvOebr7KXTvy7ZweovT3BA9l66c1GmOZjFRfbulMSYnzg8lDmwP5bp3myzsAW
         WGpd5os0tCgwRk2WqBaLshzEqpjMkvBC1Bsz+UxDpn+5S9H1XJZx/h0hKONIYK3G3uQp
         ZRW9DEsjzJf//7aG0qULfuHuH50WDj//GRN/ddLOPPVb3xTRjooLbren3pUW05Y8XVVs
         63kxnioZirNmCodkUqriKJ9D1tkgO3E13mgogyr3FM6TVBQnqDbUoklXdiO5wQCFio31
         jsVQ==
X-Forwarded-Encrypted: i=1; AL+hErGyEKqz5GwsTk2+BVfwG1JCenL/+W1Irm9uMwPjtyaEmO6sWiVWllK0dDWKpaSz2C8T3umhUAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/96VJnxJGc+T99mSFJg8TcoZVFcxqBvkztTrw72tErSViBOtkD
	7vZ1jIsMgM71wg2jjD39cxg8Yp5WAZby3a7ZYNGJvcWKKni7G1gSk+qDG52gYKUwxfmriiYwDJq
	Sbbamb4sPZgU43dT2uH4w4drZRjkwN2diAhiQU41jwRCluhcmz0xlFpEfuXQ8uKDrg44dVBnTB6
	rPNsGihiK3TmozkuLUVboeLg/Tnc8AvB4i8jPWG1Srna8apCLS6vvV8D39wIstTSDXr8Em9gi8C
	FvPezTkJXJKftfj
X-Gm-Gg: AZFdTZcL4wqkeVuay8E9pgRMOrs8+LbDj8HlFxRRrjUn3npNXYAQHmIVyRCposbXvDw
	YdlLswlHVQN8umSg9c5XF5r33rAUlpRNOuqez5Aw1YYIGANlfJj8jmQm6nJ/FV+RM3bnFceRcTN
	Waxo7aLWtj+GwcSn0wHi2MtkS5n8AFUm1Qo7VGArTin9p/t9Vvcwg2l3q9RiesxXS+VDTw/i8zu
	JG+yIeDzoE1U7vMfxro3JD9Uye5i/9By0oCmQeoaB0FVKWzzQaghq2XYFNHetMFi3x/hqPtP5tS
	ujRZ91TwXNupzpZIxqu1Olg4xK2lGQMBnf4reuU7TM5ghMCPmncoYst+FTqBS1HZAjY7KmVujbC
	z+Gml+zLEgc0rJo4VYItgOpFuGUI6marOJe9mDVb7HWnjNUdAWq3JHdATUiEXd/siVOm1WCUM4C
	J8201V+25ucTlEPgehP9+h+Fh/PSzGUKjGAUryj/X5wO8=
X-Received: by 2002:a17:90a:e7d0:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b41c8debe8mr4459575a91.14.1795220381114;
        Fri, 20 Nov 2026 16:19:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm1496769a91.2.2026.11.20.16.19.39
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:19:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso1634735eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795220378; x=1795825178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
        b=WmzJNeQmdyfsssVVFQlwZeJlx388Ct18rfCFiIhJ8+EsHyMG/TYow1Ye2OuExnyLh6
         k9n61ECxEHijWIoHitdzHMYmfa7TA0GVOaPbvfqQxdOlSkHI1HL1jp41su2VxaV9UV2U
         16attZ9ryJ6fMrhd18YXJbWOjrr6OCYj6zSEw=
X-Forwarded-Encrypted: i=1; AL+hErHpkQsWKyRsTJ8fn/Nc1cTiXa4iuyq5zZQBH5fnjFJDL+ijExuo6JcKI28UnZ6qoSYjZerhnpo=@vger.kernel.org
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr4338954eec.30.1795220378292;
        Fri, 20 Nov 2026 16:19:38 -0800 (PST)
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr4338914eec.30.1795220377609;
        Fri, 20 Nov 2026 16:19:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm11314248eec.9.2026.11.20.16.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:19:37 -0800 (PST)
Message-ID: <de8e6289-9c2d-4c99-8f20-680e05397929@broadcom.com>
Date: Fri, 20 Nov 2026 16:19:35 -0800
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
Subject: Re: [PATCH net v2 1/5] net: bcmgenet: keep DIM from getting stuck
 after close or suspend
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
 <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
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
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 14:42, Nicolai Buchwitz wrote:
> A close or WoL suspend cancels the pending profile work and can leave
> DIM in DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive
> coalescing then stays stuck after the next open or resume, and the
> profile index no longer matches the hardware. The poll also calls
> net_dim() after napi_complete_done(), so it can queue new work after
> napi_disable() has returned.
> 
> Run net_dim() before completing NAPI and flush the work instead of
> cancelling it, so the pending profile gets applied. Also reset the DIM
> state on ring init and start from the default profile, which is what
> bcmgenet_init_rx_coalesce() programs.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
