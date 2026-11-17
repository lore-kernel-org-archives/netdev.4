Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910614;
	b=gDbe2ugbm6iw/X/H8lPYjumNEpiFZZbnE03/zCgB0EjbHxb1OEjck+/AA4XB+wletrh7
	 toaS2y/p0XMCAN2mHTtKphpJGX1Pnes7EGCOGXrEHToEuyCc/JzcMJeilveR3faLZpOIB
	 4dZghn4Lh1tUUz4TVLGh30apoWtBJMsrI3kBF4eLgmmwzgtbUW0TuBpNFsB19/a4y1DBq
	 IphCeD/Bwl9aOMFhrs0qw7nExQa7Syaye6oiv17OrG++RtScJae7IfEQk5Moal5ok6VL8
	 7EMF0mQYsgPVXoMuh1ST3weMV4gLafpRBMKQbGirYTU+pDjGwtgO87vjVQQb17y2OMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910614;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/yULjHrkb4hwM4FdkPiZ2o9LDpu8AeCzRvhmR///Mq8=;
	b=wKXgUhWa6k8svALF79TYtxipfQDopg+yugQW/lXFV3KJksLpzOKNGbX77KNQgqVegL6/
	 iYdq1hK7u+lQ0dqYX/nTIY1t0OSI3aNe7YMekWmWqVFmmRPgkaWVCzbPJYMJ8N684D72F
	 YPzd0AZGD5F1KCnqEqeKMawsmEspT89nylttuQ1tRNiLs6RIRSAQLqkdAUERGjLA6Ce2l
	 4Wrd+EEDZKR4hR9nsYlLNKeD1YztM1V345WLC2bQMjjroD1SevtHqELwnblN1WhRAxdCf
	 aHQkG2RJ6GOs/f52uHmnaM9ubAUkfSEbqwU946anMchXiCow7taQh0y9gD3XbbswkVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yukzvv8i;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F2606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yukzvv8i
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 252154E41471;
	Tue, 17 Nov 2026 10:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C80F45FC81;
	Tue, 17 Nov 2026 10:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B922C11BC0493;
	Tue, 17 Nov 2026 11:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yULjHrkb4hwM4FdkPiZ2o9LDpu8AeCzRvhmR///Mq8=;
	b=Yukzvv8iX5tIxIesYK4K66Yczzr2qBqS/BGaI+miClApiU0uedkLgaLvlUeUAO9W3wIaK7
	RsOfdlO+Tuy4LmL9Q0GvEu/Lqpjor7nO3xo8qW8Van/hknyIFykY4RCm1tzjAwhkWfZBdG
	eT0WzPTnhTz2jqW7SIaXGVxMlXmKmRDjCxMrnPvsHNGFI8aRgMFRHJgvqFH+ztCye2JfUq
	5DvhNtgOsSXtf8e83izlYU8gh5S+A7ALy8IJm7lqNoQddMOBVvpzTbKpYUKOB9qlYCqGjS
	rnCFUsJdNjC5ys6J4mbx63EZ6flNVrdRm2U4cNgmQI2xXv6Srvb0wE8IZ/4B7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui Peng <benquike@gmail.com>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,  davem@davemloft.net,
  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ieee802154: hwsim: fix edge allocation leak and netlink
 attribute validation
In-Reply-To: <87v7809ivq.fsf@bootlin.com> (Miquel Raynal's message of "Sun, 20
	Sep 2026 15:01:29 +0200")
References: <20260919223434.3882824-1-benquike@gmail.com>
	<87v7809ivq.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:16:47 +0100
Message-ID: <87qzgjn4og.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 20/09/2026 at 15:01:29 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> On 19/09/2026 at 22:34:34 GMT, Hui Peng <benquike@gmail.com> wrote:
>
>> In drivers/net/ieee802154/mac802154_hwsim.c, clean up allocated edges
>> and phys on error paths and validate netlink attribute bounds.
>>
>> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
>> Assisted-by: LLM
>> Signed-off-by: Hui Peng <benquike@gmail.com>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

The commit message is incoherent, I would like to withdraw my tag.

Also, this is the fourth time we receive a similar fix. I already
reviewed this one:
https://lore.kernel.org/all/20260627235805.17310-1-alhouseenyousef@gmail.co=
m/
For which I wait for a v2 which never comes. You can take the feedback
sent there into account (still applies).

Thanks,
Miqu=C3=A8l
