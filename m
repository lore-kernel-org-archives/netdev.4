Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795420914;
	b=c1YtfGHE2o8PbT7j2HXGT5Ephdfdtt1ZMzu3MwRX/x66oOjbyXnhy0qBPBR6fWEYf/LG
	 CY3fSDT15l43mil/VR3ur400GUvtmAQqU3G8l13uE2vBglnAvqOo9c/lefeKSekn34Frr
	 sBoCT+N8z6yy7xcE3olU7hEAZXJeA2NCfxLMta1hTuQyNlnns/+ypIxUeCpPJZvufbVKe
	 VpQTbp1X3KTgQTTfqc5V1qZigtPqFln0qbUgVCSChOryyJx3Fz++Q+CgikKMeLsp1Wg68
	 mBnSYgx5xAB18UTFj/X3ev2varEAyKjHb9cXr5pI4V01tXzcTA1kRC59K559JD+mlDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2Oe8xtm7pow8VC4d7i9frDEEloTRb4wcG8wd5PhVyJc=;
	b=HoK8sAf882sjLP1V22uikKZ56z+4hbeUwVrbzCTRqrFj8SqFMNb0eUa1vrwCMZztZSir
	 uX5D7GDV9QMYTJWZ1GEcNpqTa/T98nq4Y8ObreVODr/KuV9dzza11r5lxIylpnv07kMNr
	 08qclzZNaCupR5W5R67qJsb3BYTnAr9nF7QLW+Ja9GrNDlyrfJpjmbRWi37pQvvqg/RQt
	 3daCSrIs4J3omjNkCwN1G2JGEo+OD3ePnRVBtiNg7RorHEwY+svMxx3j8KWoXaO+dTo0a
	 8qLylVs4qKAIpghbSSTmLK9Qv97QlLL25kUCIBu4oOEdGpgMspp+TmFAPpPY6DFuJTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ni5u3a1q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92D606A31F;
	Mon, 23 Nov 2026 08:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B92D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ni5u3a1q
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D119C2007F9;
	Mon, 23 Nov 2026 09:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795420909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Oe8xtm7pow8VC4d7i9frDEEloTRb4wcG8wd5PhVyJc=;
	b=Ni5u3a1qu5ZXUsOLAA04P6YF4iV+WrFmKIrAxYNoRmbYZ8ojo8wDRVjmTXpISJjeDKO7TX
	yIdFBYAxWcVPq50Un1UDnwrASe9DL4K7PH2qN9p4LZ6Q20Zilf9qGhVUUrOga+L5Tn9FVj
	Z04t0EBjLpSHkNYLr3khzTbQR79sHuZMpc9soVbzlIXdEVtw2G5NvDzwNt02GVrPdIAUAK
	3b4M40b6/morAcjISryarB3BH6Qun19FgUocetZwQxTFj19QbB8YcOmWVljgXhkRmZwJ/M
	bOT6OC9EDwVhOxBo1VGmETXibOXq41qMJiPLqbFFMXOXHPXxT5Hgjq7pw4ctRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795420909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Oe8xtm7pow8VC4d7i9frDEEloTRb4wcG8wd5PhVyJc=;
	b=JINlDwnJTFRSn72f4PG5V0rxB+TBsAMVkudQj3NBAno57mfjTd7pPmitaW9y+/xqj9YDjT
	LkBF5zQhVbMuqmES4sHZFpl20jA4sAtTN3Mdd5FML4TpcT/nXtPe6u5tMtiwSC5NT2D6Lf
	gZIu3RHUcct36i+hqoMo2LJOrDNuD3zfaIxfhsy38UYSfQW2yCewVdFM/qKnHtOMCXTxJh
	GouvqM60wjCjJjlUTMiU8ef89DSjAjqkbXkgxIkVtq+gTSOifCO3YTCyCDAzNZvapKIvQV
	f2iXVfGZKg9a48NY6Q9YrkvckKYIkdQ937/BVxFJQI6EsxVVH+iicL7H/Ak8OA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795420909; a=rsa-sha256;
	cv=none;
	b=QlWyuq/LbLFrnDOxziWgNExz5muwm19RuRrEUL8GkksVkQ3RDSRH5TwhLEr/htfSE7hs9k
	GAP3VXOugmpAa9q19RsFsbiaB/CaZ/735OO7ZMyZg7Pa/1AxbOSuxzKSnh5iGGFjXrONHK
	kXU9ZZoyyc8JHi7k5oHTjHqB9Wg5MDU7iq0oSQ/4qnAphIywBiKOR2JKBsymcwYrM3WFu6
	hbuH/q7ceay2BuuSscBCZTEcHukNrcGdgV2QkgwH8qcq5HGvbh5IxG7x3TwObk3aaEbuMe
	YmIDpf1mu4E9Mp+9zB1MJCaut2URTMFXCucPYi7sS0/VMZ2FNpSj5cFxGkPSXw==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id B8B301BF7B8; Mon, 23 Nov 2026 09:01:49 +0100 (CET)
Date: Mon, 23 Nov 2026 09:01:49 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Gustavo Foletto Mora <gusfmora@gmail.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>, linusw@kernel.org,
	andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux@armlinux.org.uk, luizluca@gmail.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com,
	kuncy7@gmail.com, fabianotassotti@gmail.com,
	gabonpivovich@gmail.com, contact@c127.dev
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
Message-ID: <awPy7Wxq-_ukUNfG@pengutronix.de>
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
 <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
 <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
 <CAK+kzgxmgdFoBhzNhfxB29yS_Hz13LOm7rZvKb6fpyVKb8kwdw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK+kzgxmgdFoBhzNhfxB29yS_Hz13LOm7rZvKb6fpyVKb8kwdw@mail.gmail.com>

Hi Gustavo, Mieczyslaw,

thank you. I have no family D hardware, so only some pointers from
family C.

On 21/11/2026 Gustavo Foletto Mora wrote:
> On 21/11/2026 Mieczyslaw Nalewaj wrote:
>> 1. Does a non-zero value written to 0x0851 on your board change
>>    anything (PCP of untagged frames, or the register reading back)?
>
> Not yet answered: on my test image the switch registers are read-only

On family C the added tag takes its PCP from 0x0851/0x0852. If family
D ignores that field, the tag probably carries the internal priority
unconverted.

Other places that can set this PCP on family C, in case they matter
on family D:

- remarking, bit 12 of 0x000e + 0x20 * port (off after reset)
- 0x093a bit 0: when set, an untagged IPv4 frame takes its PCP from
  the DSCP table

> [...] so an inverse table would also turn tagged PCP 5 into PCP 0

Agreed, without PCP trust that table would change tagged frames too.

Family D is not merged, so the DCB code has no bug in net-next and
needs no Fixes: tag. I think the family D part belongs behind a hook
in rtl8365mb_family_info, like VLAN, PVID and L2 in v12.

Regards,
Oleksij
