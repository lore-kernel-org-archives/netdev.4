Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776354;
	b=4ohi9jnQHExG2X+baUGgtpiqIHCCv/PPhjfFu8SGxsSaAP554P+mkkoFsTMo/R628fr0
	 XWDw0v96vOdp6iz39fqOcWGPh5FEkXQxxqBlLj93U2NhELDDrPJk4Zj6kE9klmXpiJiMY
	 EiprLQ3+wd//V9bXCmZTwfjmwcYG0cMei1ZkSvUHNJIfeOaDhunvzljb/TICIB6fW7GUl
	 ibRIo58IyNuRxZhiNEk4BJGGHMotwa988wDknBoOs791u54qTvM0lxj/aVpSKMJLW15Oh
	 kbZMwOxDy2JgVSNxb002mEmFAUPgYjkErkWljbDtzhE1xf+yHLy2dSW1sHTZEwyp+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OSA4KWND5TQ05YE5/BgdoX8/OyyIe/X6PGTfGzhUEYU=;
	b=TufhSCwxqeJBhuJG+A5BOqG3tOROhrTaukpDM5TbTA0mVBbyUi80XRMGWY5MoTC7XDr+
	 0iJFRsljgNlr7CFCbr6DX5VKqHSsLkp86U/GbF5haL83FoQKuS5x0YDf6v0L98jijMBYb
	 w8lW5UiRb/hzYhiKGyqzItznvd17CmWsNuqpXpjjgXfcW9G9dWiQSF3SfHH3HqQDP3W8A
	 5z6tFpvazo3J81GlWfbyJrfMpsjFOx2VhMrQNS0h7U1m0wvWpeB8CA3B6x06uIahSf6d6
	 e28qs9qmFasfjG3rJ1pIzl01j1XhioeI1ee1zN+J+pmuAX49biGgioondVnzQ9VlkWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJZICFu;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716A606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3716A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJZICFu
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b3402105b9so20169857b3.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794776353; x=1795381153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSA4KWND5TQ05YE5/BgdoX8/OyyIe/X6PGTfGzhUEYU=;
        b=QhJZICFuCX0Ir7QVkDno0a5nNP6Uh0X662PROz4NaQBihwFiAtqR40VMSOdjyjvcve
         FEo2d4WPi6qku6sr0xseKPsx/w+BfEQFiG6x5a86WNbtkVtT2Ker2LRKzmJ/0VtnMbET
         vtrp8f0U929gP3WovWTJw9+FC5NK16ZkCYkgB6IIBg6Pd3BR5PgY0g7Vedg154Kj9ydP
         Aoni0QRV0ImTmMmeDWOdX4+x43z0wXE+/w8nxPOBIqOI6kXgB/ab/YghlZOYRoxZQy45
         HB1qqwzSKgh59VWQCah//MzurjwIM3V56juArcgxpYfeUxA5qJMKX25q/zDOzz+z+jxL
         sabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776353; x=1795381153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSA4KWND5TQ05YE5/BgdoX8/OyyIe/X6PGTfGzhUEYU=;
        b=qsd+/RR2npQ66ns8EZDRgydfA6125uIyAnx91Tt2OBNV9i5kSLppeaOOQgqvAlJJzx
         +33HWT1gWRvYLS8UIYIGh66oUD3qtnOB43GLq7yTPcSOcPR5R5yGfQY0PffrsEsm8ZqF
         NFZIFEKJkR/eqzYk/EkF8pFhfTXIbFb830p6Xzi4xEuBzazTqxVY2MbiSQw/xmDgys0i
         /2T/JapXAA/ebCRSTZFLBAjrlEFpayBdoIonCOnQS4vu91IJHrLrJYqSK+5qQ5a4ltVr
         i8BsVDc855K+HvP0SQ1rpxMR9HBV3jDzIHmklIhaPz2G9aQe/gRiMAv4Nucos3ylBcPm
         BRnA==
X-Forwarded-Encrypted: i=1; AL+hErERmwZqjxYktPgvjkbx1q9Re7guZ0fQHCc6cHnSFC050x6h/L7Fgldw2PZUa/ks0Q0gArDDI+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kIdjL4P+31jyW//izLP+mu3riSq8cZd2Zcz+arM4dPLvKSkWd
	Uzgf0te5YmJtRILzKEMxMUx6HYazs06dE/hX2y1fA9LTp7xspStZVaqc
X-Gm-Gg: AYBFou02pJq7vLqiR3FE2h3BrqjF+Tv6jqm19QDDshEGWsOzgD2cQjlLUau8f1i+UoO
	id5kIWp2laVlUT+oAjXQkloNC9ZXPQl+eABFnl3mdn/yUkDc3WsGh6UKam/nVlxSWt0kRQKdDXf
	6dacySNyQwGlFoxl+gk/oIxh+fg/Z/6TB91TcAQy2CsGnhzbiB5MhUfT1VlGyCgW6bx5NOQ5Z9j
	gDGJjXdCXRSR6LSZOP8AvfXqqvT20otYciKqVsKZCqXtvh/q1vBST8I2Ke36F0Uktcm2o0xqqgP
	rD+NSG9S31WiuvIj3g1OfDdQnpdoS/7Dmu2lxLDeUCoMOFTJ/baDmkcfkuW0W7gQLRfrBGG/JRM
	+5+cvz3JX+PdZmSUIpvOtsqumM0NSfxfbgfye+1aIFwrFHuIxXzrcRDMZxbGNvDWprXENJmoBVp
	DpyX1BfJi8xMiPHtPk4k0pVWwnmdGuPr3PA92BQx65z2ClSeCt0AiYb6Dwo0SjdysSKrekwqc0A
	zMivdMi35wPUd4KtKu83avx+UNZ9xraBKXnGZISmScjV3ztsclbkvVU1URhmXhO3AaPue0dTHlS
	JxxgOk4yJm4ZppLWjqG7DlBulFN8UZiEacLoaFdvMAlVATOpLIrLOavNyL/eXk85mnD6Zm6YuOt
	TvuXILJH1RJPWhbJV1LLC2ud5WlbJyV8HSHzNntoPU2VyBCZlm8Ig
X-Received: by 2002:a05:690c:386:b0:8b0:f116:1200 with SMTP id 00721157ae682-8b4aa35a461mr43071707b3.85.1794776353242;
        Sun, 15 Nov 2026 12:59:13 -0800 (PST)
Received: from [192.168.4.64] (76-224-22-216.lightspeed.sntcca.sbcglobal.net. [76.224.22.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa933d5esm71793097b3.19.2026.11.15.12.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 12:59:12 -0800 (PST)
Message-ID: <cc814750-79f5-4eef-9c9b-e7bda86acc78@gmail.com>
Date: Sun, 15 Nov 2026 12:59:10 -0800
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
Subject: Re: [PATCH net-next v4] net/mlx5e: advertise tcp-data-split support
To: Nimrod Oren <noren@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Gal Pressman <gal@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <20261111170558.1654691-1-dimitri.daskalakis1@gmail.com>
 <baf3a990-c9a7-4bf1-a1a7-a2b8976591bc@nvidia.com>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <baf3a990-c9a7-4bf1-a1a7-a2b8976591bc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 2:39 AM, Nimrod Oren wrote:
> On 11/11/2026 19:05, Dimitri Daskalakis wrote:
>> Changes in v4:
>> - Nimrod and sashiko pointed out that not reporting DISABLED for
>>   tcp-data-split makes the feature look unsupported. This conflicted
>>   with my attempt to block users from setting DISABLED, locally sashiko
>>   found several scenarios where ring changes would get blocked.
> 
> Can you please share those scenarios?
> 
> I think blocking 'disabled' was the right direction. Allowing it doesn't
> give users anything new, only a way to pin HW-GRO off, at the cost of
> another dependency between the two knobs in mlx5e_fix_features().
> 
> We can still report 'disabled' when HW-GRO is supported but off.

I should have saved the review, I reapplied v3 and added an else to 
disable tcp-data-split if the merge type is not SHAMPO, here's what sashiko
reports.

 [Medium]
 Does this reject a value that get_ringparam reports?

 When HW-GRO is off, mlx5e_ethtool_get_ringparam() reports DISABLED. That
 is accurate, because SHAMPO is not in use. Before this patch,
 "ethtool -G eth0 tcp-data-split off" was accepted in that state. Now it
 fails with -EINVAL whatever the HW-GRO state is.

 This affects any netlink client that reads the rings config and writes
 the same attributes back. The whole request fails, including any ring
 size change sent with it. The changelog does not mention that existing
 users of "off" will break.

 A narrower fix may be possible. mlx5e_fix_features() could clear
 NETIF_F_GRO_HW when hds_config is DISABLED, like it already handles
 ENABLED. That would also fix the mis-reporting and keep DISABLED usable.

Netlink users that call get then set with the received parameters will
get a failure. This generally applies to users who save the current ring state,
and try to revert back (via netlink or ethtool). A subsequent sashiko run
highlighted the manual use case via ethtool.

I recall sashiko had more severe feedback, but those cases may have been
from the incorrect feature updates I fixed here [1]. The feedback is technically
correct, though I'm not sure how much it matters in practice. v4 implements the
narrower fix sashiko suggests, so it works for users who write back stored ring state.

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20261017005401.1582755-1-dimitri.daskalakis1@gmail.com/
