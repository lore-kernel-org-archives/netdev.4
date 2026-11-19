Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073812;
	b=Nz03nInr8IjHwEJbfrWg17nftIHuf+munMy0KIZb57jk9kAKhjyOk0HW/GiwPC+NJEFv
	 c4xXA7SXQsjS/j+6lnFEzpt8XBm0UEJBpY3BzFw2t4kFg5q/Hyz7H0QXZpZx3588GfPKT
	 VOWNatdnUrs/DYs5pCku3Tjqpnr/1exGWukpOSNR6OHn9RcS6VCgUCJbXt13xHLQG3KAa
	 C1dS7Bylm2hKfYXA0BpnLOPz3xHLj+nNMpZCtzkwTUpJrG7dv6ws81P7WY0F9z0Xdm5t2
	 fpms8sB1qVzTMeO+hmyqq9RcgSKIJGrhFxx5o3xbGiEY+Tsp2YwHrDY4Pz5JLyWr0cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073812;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Xz9x+nu8iFDsD3oN41PdfcdXcq5+MFZLlOOhZlyWh6I=;
	b=yKYB4+eXOcmOkpd/sH4mg1RNYdHsO6diGpUy4iq63G9X+qUd0kLAdy9C3SggMxobhkyg
	 48+Y5mAsagnahoMRfQdiQQ/ncTvuSahvgUBQUfRWgNrZ6MuYkIjTVh2wdQj7bWCYYVEJe
	 Pxp5+Ikp7JydUJqpvOq1JbzqSM6Z7EwICWeaNDEhdDKGS5F4HOJD1q6XzJQDpiMThVJ7n
	 w4KBmbtrOucS8O40OclkpVyS4VB93dS50ko/jNOm1iUE7C204lrX5tNWc70B8Zz1S2zqS
	 i4VcYDHqHGezjACCe2JxTKM1ZrgTxYt7ag5sosdifpJlF25rp1yGuACujP0g/S/KkSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fsCZGmzt;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C601606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C601606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fsCZGmzt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DE154E41659;
	Thu, 19 Nov 2026 07:36:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF9C60237;
	Thu, 19 Nov 2026 07:36:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAABA11BC2D6A;
	Thu, 19 Nov 2026 08:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795073803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Xz9x+nu8iFDsD3oN41PdfcdXcq5+MFZLlOOhZlyWh6I=;
	b=fsCZGmzt+fC0fzp4kR6Qre+ME9xwJCzkqh2RMfEnsYfUQKcvoDvE8tGbXLrlkh55jKY0wk
	5aSIs3r14a2766AwiOGXKd5X8Esp0S3LdhNw5H0O+KcHGY7t9NUxsm/9sU8eyuFiAK+0X/
	RSfYX2BTfMqT2n1Fx8aT0dE6hI2by+F8Ei3o1j5gNHWVByze0bPXtho48ya36PMQcmiuLV
	LkYm2qBpXPafvuJjzwLpwY7JciQMJlyDNALWWuSx2mUE/be/meyTvzvQ8Baj0LHGZYFp0f
	VBzZZRVNttSVa0sSGvlDUJZUm2vxcs2Jtr2wlPfKjGd8zBKSz0TW2hb0ciWArg==
Message-ID: <c811598d-28e9-4d9b-9929-b434878b90ff@bootlin.com>
Date: Thu, 19 Nov 2026 08:36:34 +0100
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
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Joseph Steel <recv.jo@gmail.com>,
 Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

HI,

On 11/18/26 21:09, Nicolai Buchwitz wrote:
> Hi Maxime
> 
> On 18.11.2026 17:21, Maxime Chevallier wrote:
>> Stmmac's double VLAN handling hasn't been working great for a while,
>> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
>> it was found that the tag stripping hardcodes the 8021Q tag type for
>> XGMAC while stripping the tag, while the IP actually reports the outer
>> tag type in the descriptor.
>>
>> The tag type can be one of 6 different values (note inner/outer is
>> reversed in the macro names):
>>
>>  - XGMAC_ET_LT_VLAN_STAG       single S-tag
>>  - XGMAC_ET_LT_VLAN_CTAG       single C-tag
>>  - XGMAC_ET_LT_DVLAN_CTAG_CTAG outer C-tag, inner C-tag
>>  - XGMAC_ET_LT_DVLAN_STAG_STAG outer S-tag, inner S-tag
>>  - XGMAC_ET_LT_DVLAN_CTAG_STAG outer S-tag, inner C-tag
>>  - XGMAC_ET_LT_DVLAN_STAG_CTAG outer C-tag, inner S-tag
>>
>> Report that tag type through a dedicated desc ops and report it to the
>> stack.
>>
>> We keep the 8021Q fallback when we don't have the ops, as we don't
>> set NETIF_F_HW_VLAN_STAG_FILTER on the cores that don't support that.
>>
>> This has been tested on AgileX5 with the vlan.py selftest.
>>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Isn't this a fix too? I mean xgmac advertises STAG_RX but still
> reports S-tags as 802.1Q. Then again nobody seems to have hit it
> so far, so net-next is probably fine.

Yeah not only was this discovered while working on something else, it
seems no-one noticed and it's always been broken... I wanted to avoid
spamming net too much, both options are fine for me TBH,

Thanks for the review :)

Maxime

> 
> Anyway:
> 
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> 
> Thanks,
> Nicolai

