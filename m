Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841166;
	b=apcGEZ4bYsEt1dv+ZNLTxsSvnhFWuofXCoRsj1XG49CVYiNrUKMS4WeNG4aIeugJ8IIY
	 Dui+XWXTZthVGndo6FYgMoY3eG/j6NP0CktldIBgc/615Mn7A66m0uA+sh6Sb57gxjo3M
	 P6aRczP1lRe0cmgCHC+d6gSizWKRDqdAvS/8SYztMJRC8HgayIp8FCE7MQ5CzyoTUONeV
	 001rfvsGb4zasQg7vHsIkNlRDtAsQd+nZqAItJacxHF+Rnm39qWEHVrrFU3XvIZqgVVee
	 w073EPTrwTWCwae6oJ6tM9rNdHe8MJdTtBQnk9iyPCSkCZa7McDnHp7VA1LiaYqawcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841166;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=k+z1e8ZYHmpUCjSLI93JX1rRkKOX03qgDSkkP9m7sJM=;
	b=vMKBAfRxPZVU98remSUycBUrB100W2Q0MYrFrF1trNb83QImWqlALhe64ux5Muq2ECV/
	 l4w9jC8fHX8T7ZDsZO/zYCfsyY0AV/w14WxLeXAoXseHJvFTtCaGhUXedwx3jTZKW8es4
	 1lGuD6giSjWS3msLg5eH6xijmzE+IS9e8rFwJP8LD1BTwdsH5ayfoHnv6CzVRu4HsFGdL
	 ktBuR/jtuBhJi7Xm4LQpjd+NP5jC4HsFNpl9D1jRnv9UYxcabyKH3KgF3G1v5UZf7wCsZ
	 goP16rgiuqbgUVArQd9AficddkbkjWS0SLMcn71WR0s4Iex0vBR8QZrb/xHDxRI3X+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b7dwUYkY;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305B606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B305B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b7dwUYkY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4EADC4EFE1;
	Mon, 16 Nov 2026 14:59:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE9F86023F;
	Mon, 16 Nov 2026 14:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B7E611BC146D;
	Mon, 16 Nov 2026 15:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794841162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=k+z1e8ZYHmpUCjSLI93JX1rRkKOX03qgDSkkP9m7sJM=;
	b=b7dwUYkYBncloh3qf///PWv/FCi82wnJRMnDsiFy6tRyanBxT+0HFmm/Vlr0JJpHuBBvz4
	X3Gyqd5Or/le63nZuammyJqDBqmZuxdufszUfHFHGDjEPDI4Xjy0NslQiDmfKr0XWcdZmN
	x8SEbMWNRls/gJnQTF1zpN8hmYzsE+htWV+/FCVpZC7io56+cOrr75yNLKWfwOFU3r0Un8
	My8OC73w5GOHgHYcfVuKgPn1uWwGS+gD77+WiVrd1NbCUW8nJ7HauPvXFc2Z1QQ+Ifwb+6
	wIBOgS+FDEcTCssTR+BsRsV364Mwu0sIf9ebrzkLtOkXfKVxE5WHxktrznAEAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Alexander Aring <alex.aring@gmail.com>,  Stefan Schmidt
 <stefan@datenfreihafen.org>,  Andrew Lunn <andrew+netdev@lunn.ch>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@kernel.org>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] ieee802154: fakelb: release platform device if driver
 registration fails
In-Reply-To: <20261103102854.1340581-1-vulab@iscas.ac.cn> (Wentao Liang's
	message of "Tue, 3 Nov 2026 10:28:54 +0000")
References: <20261103102854.1340581-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 15:59:17 +0100
Message-ID: <87qzgkrfei.fsf@bootlin.com>
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

On 03/11/2026 at 10:28:54 GMT, Wentao Liang <vulab@iscas.ac.cn> wrote:

> fakelb_init_module() registers a platform device and then registers the
> platform driver, returning the result of the latter directly. If driver
> registration fails, module initialization fails and the module exit
> function is never run, so the platform device is never unregistered and
> leaks.
>
> Check the result of platform_driver_register() and unregister the device
> on failure. Also check the device registration result, which can be an
> ERR_PTR, before using the stored pointer.
>
> Fixes: e1e49b641387 ("drivers/ieee802154: IEEE 802.15.4 loopback driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

I don't think it is super useful, but it's not wrong either.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
