Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841494;
	b=nf+7iljnArPLwmEzIpZGfFm/9V246S6VrB12sqQsYhxZIo20dLkmkYU+uQmuJwJKwMPX
	 8r/o1cURwgSVKJg2gEak/ASC/zENmWo4Ata5++HhGKpm/N2YL2abpy3ZLnnn/OUhwflR9
	 FTotzEqzNOxd/Aa+Zuj/NDPugRi3E4xFXO/8qF9E0F3lQM5T7TVEdGz+qPZ/fSqwnMS++
	 bHoi5UPEDaxTPxJNfGCv97vEt+l/uwktkleI28q+s786/jaiFAOg0H4qBOhD3mGXHL7L8
	 iLWi5NC9sJtOFNgdI7fso4B+meASxIyAA6QIChhC6wzpls2qDlqnhvhN8wyAnW4pP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841494;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=hS2mlsRX7vR2gya912wSbaDcuwZlM7TZjUS9hCdfuB8=;
	b=r2oHnZAEPC16SjeRAzMqUmz+OQdD3HJxG1KV82w9A3bB1Bw3BIdiWUJIKXd7F7/OvFY9
	 scpnxY0SjeXou5hx2YH+2WRC+PvgNzWAUuWa+Qo3JWGWGRwKmectlWC24Zil2Lj5UTTAi
	 vhRezV4mb8HuRASphSk0F8fumBBzKdH2EEthJQQxGvChkoD4avQgkLlP/BJZmy4T8NtNt
	 D7eIJ/SB9LM3gxnch7ltnXxFJseAjoQYprhjDEk6XQGG2lESKNvmfVOeZkwNFojeCSfMl
	 kmnDKoqj3Hs0t8BA2Bg8DD0Mh6Ftt1nYn8OeVfah24oIO++xSMoQB6/ovpC/ITMdYww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UW27Knme;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D4606A894
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2D4606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UW27Knme
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 396914E41602;
	Mon, 16 Nov 2026 15:04:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B6756023F;
	Mon, 16 Nov 2026 15:04:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D40511BC146D;
	Mon, 16 Nov 2026 16:04:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794841485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hS2mlsRX7vR2gya912wSbaDcuwZlM7TZjUS9hCdfuB8=;
	b=UW27KnmejuONG95BDLRyME8YoHfOW6pnHBw5A+/7MXd2VVOGymGXkqPPJQdhyGnvTuvN5T
	wsvCEg8qSWSuV7EJBwha3C5rkuOnMnEVrHV1HnHpUeS0GDLOJlyXRsj7v/lPd2CzcCxOYS
	VfY3QEDuN0oC/8VGR2wmNVtXvoy2jO6rfx/zVEYKsGzbuW55BtQ7inOoMEXa0OISWyb4Og
	IbmlpEr9pLxnRjmeAiJLqapoaS+mN6BVj2+D+Cr1sYRncD7Nk1y5N1Qli6G1vIMUhJ1Ik7
	RXgwR5+YI4S0Ogh9TMp0CqEoRJrcdxYEiYIDhSWLxAgNaZko/ixQJU5KogmAEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Alexander Aring <alex.aring@gmail.com>,  Stefan Schmidt
 <stefan@datenfreihafen.org>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH] ieee802154: drop the extra phy reference in del_iface
In-Reply-To: <20261104022809.1484165-1-vulab@iscas.ac.cn> (Wentao Liang's
	message of "Wed, 4 Nov 2026 02:28:09 +0000")
References: <20261104022809.1484165-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 16:04:42 +0100
Message-ID: <87ld6srf5h.fsf@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 04/11/2026 at 02:28:09 GMT, Wentao Liang <vulab@iscas.ac.cn> wrote:

> ieee802154_del_iface() takes a reference on the phy of the interface and
> then looks up the phy named by IEEE802154_ATTR_PHY_NAME, which takes
> another reference. When the optional attribute names the phy of the
> interface being deleted, phy and phy2 are the same device, the lookup
> reference is not dropped and the function later puts the phy only once.
> Deleting an interface while passing its own phy name therefore leaks a
> wpan_phy reference.
>
> Put the lookup reference in the matching case as well, leaving only the
> reference taken from the interface.
>
> Fixes: bb1cafb8fc41 ("ieee802154: add support for creation/removal of logic interfaces")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
