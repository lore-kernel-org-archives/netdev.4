Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032023;
	b=TT+ozQm9wsVvyJbF+no93u9G3q8OSd+Zkmk3uxqWHC5jbkufAyRJX7ELYDTAdqRQfm5q
	 N5SkEIMW0fdYOjlyPmpKSEtpPUh+JHUoRutUOsohiFDKgABebFYwDfuIkTdGC7ilB+FH2
	 S5XcjxhAu9Rk/NWhRw2W/KqivzB4vruqjCxb3hmBuAgvxV33HwasmY4dwvatuP+fEuH1m
	 hI+PB3TF+yE6DfiOoQeSVsDknO5+r9+j6CR4rTWzeLW2DkGF18WIp7aLgsaYruhbHRoFs
	 2t4/Y1G5be9feMyuYvgaQnm9UXMVmurzt1ftof+mwmNbED/aOne626PcosIpz0gopYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032023;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
	b=ntCzVzc0oPjbOG51zejRwrwIvHxA6GwLKMaaBkWOY7BlzHB1TdCdBG30TBex0jkkEQR9
	 joRRmp2sX0giCJyb3CW7YMsic4bx/8IkOHS3rsvxGeytWMXtIki+eqF7i7NmeXY+Ovgn1
	 qY+dNWNDOgL7zgXtFSxlmu28hPRKKeF7LOAuMahMs6YNnS7NqFV+48vGMbD3vMFwNyCwW
	 0EtthWy0OA2qScVcdBXKgUjO3tsJ55j8o5yivtZunJfJGVf4OZ9KIAkLPOtqZpLPyVYsX
	 jbLuxA1r4A0XYVSW8gN7zJDkQNcld8/LslmJvleHrRdXaCfymYa4Wq2HYWfM2S5uMLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKPSQ8Ef;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B54606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKPSQ8Ef
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3c9820789so872204a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032022; x=1795636822;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
        b=ycOpQnNLuRACsHmpyTkad6QOGgVhJUQg1glz8XgEb+wrofJGiyhGC0uPEcI1HuNkVJ
         nIISEZjXdb6mdvbp+oQzO5B+QH6IwmRECXsQpmYJu5vX2dSxEouJGyvftw44EZjmMnX9
         yxtrdD36kxkS81+H5tG2Gm774kDxu98godJ7ijyJXl2f9z+M148XzQvoGKvqaJb07DRg
         wExcoSbJN8gsk2EO/25rnSJbJXI6Kre3CHFQvBqMg/oEaZUHxwRm1Y01MIhWhXPguxpW
         N0HwI2XPVPEuSW3V4ik3YnZ6ROXtVWGV47xsGMaxCQYELiYXdIAyWuJ4L67h7aG8hLkT
         T/SQ==
X-Forwarded-Encrypted: i=1; AL+hErEhPHgONV7r0Ky8ZRWkN+Hz2hKqtNB152XtHi3+s+F5NRLp4Lt98R5X7JzkL1RTRBv9F2zrX0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z82fT8XS+cH+rmvL7GZ7rNhDCy4oJkgSH3lWclJ+pgDG3WalNns
	uU5HE3qi6cb039XKI7LQ2iFBGYOZ0LoEriC/qQtqRToOOP6dZA5UOtKjroYha3Kz7K+avjL86x9
	jFhnhM3eWFz5KYVCyXRlI62ZxEwXwA4+Vq5d+sg1BSFi/ZA1lG3rKRUaCsdJXz5eoDhdma2qL0J
	zLHtwonTHFl0GwxChQaI71iXJqs3KqVEREv6hRxVeORp1ePZjTVJHCdpzECd7ikYAWs2zNjaoRH
	M8ObyqJxIKObhZe
X-Gm-Gg: AZFdTZch8Zudeo187Wb0wIaBzx8Ay6RPsJ1Ng9l7u3eUFGgQdXawE0OhP2zM/1kvHB6
	ylLJFZA64SA0R5i5bCtnQmGThlZimpJFswq+SOOT5eWwA5lKx+zLpemHt6oNWcJX2eD4NiSLQ2p
	cNfvp88rz/aosx/LRw+ODAb9CGnR8CE7zWiwv6kRYaIlHtxjn3ig2H1PbDJveQDbPRLpVpSyvFl
	lm5jMSee5oQCdsBw5wsYEH762nKfWPnaxB+g4J/pna6hoEfQvdR7MWrXw/+Y9KSnr3FpWHIex9p
	JgJJEYYdqW4eVtqcWCImKgfdemVKi4+LPiSjT52wp67xx+0NAjgLG1ABveVclnNbHXfw/VSMHfm
	B2MqHwFcVtiewTD0nlXP9QYIiP6wXRZPNEtkmTgZRkEFBK/tHTDO1mZGGbOGlGzl+CkUppcXmZT
	1kXMTG60ttCI3OaOmT53+cjUfsGdk4nuTlWZ7I+bB/UNE=
X-Received: by 2002:a17:90b:2643:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3b3d07cd4b0mr3528179a91.61.1795032021957;
        Wed, 18 Nov 2026 12:00:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6e01d7fsm354045a91.3.2026.11.18.12.00.21
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1042486a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032020; x=1795636820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
        b=VKPSQ8EftpMNvunM1XpeII69+MY4OsHbZbeeICKK2MOXyouIJXHJnQ0m9N63ZmNBNN
         rIAPOIU7VP75sH9rUpjKJYv3bbQxe64XKHLpwg+MIxkefQdBUyXJke79Fz7uchzgevCd
         v9FMoaysr0X51/i8RInxyAdVejn7tK31pnMV8=
X-Forwarded-Encrypted: i=1; AL+hErHPFnAAbvAkxhmvt97nFUtelQFmx/KK6Ye6wu6sFPOM+tDhUuLjZUxiIY1PetLo8LTEIYqgJcA=@vger.kernel.org
X-Received: by 2002:a17:90a:ec86:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b3d0759ae9mr3438171a91.12.1795032020132;
        Wed, 18 Nov 2026 12:00:20 -0800 (PST)
X-Received: by 2002:a17:90a:ec86:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b3d0759ae9mr3438142a91.12.1795032019619;
        Wed, 18 Nov 2026 12:00:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6a94c8fsm734504a91.1.2026.11.18.12.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:19 -0800 (PST)
Message-ID: <1cc13fc0-b56b-4859-9364-f4cf7e3a04e4@broadcom.com>
Date: Wed, 18 Nov 2026 12:00:16 -0800
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
Subject: Re: [PATCH net 2/4] net: bcmgenet: restart DIM from the default
 profile on ring init
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
 <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> A close can cancel the pending profile work and leave DIM in
> DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive coalescing
> then stays stuck after the next open.
> 
> Reset the DIM state on ring init and start from the default profile,
> which is what bcmgenet_init_rx_coalesce() programs.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

