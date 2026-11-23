Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453779;
	b=fJDZk/GDv1AMh7UrcSK9dz/nfjsAlh5l4pmE5xKFREb+Ffs3rFX5iOFIALNsdTz7Ae2X
	 AXoJPd2yl0hm/I9AeRZA/pLdNMA/A25Ygt4gPdj9RhQVIj+EHpzAyigPzr9RgVOC5BO3v
	 Upft+KziR/5ynjbf7qLn/BkgoM2+j1/yq1kECUGelmLpeCZG8y8fpiqtsKYJZENQE8Pf2
	 gs7kgnvIg4eNDjMbtE99zq2E40u6rbmEVazmq94nutUabKSVBVOBaXyvkFkgQSYpJrrgW
	 Tatr9RjpByBIM0qXxPhpOoTB8EvkmHEhVvKfHys8ifzGVCenvHHjxRw06041ejQoazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453779;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=7qldxPAZLjy7Hbt4PvGuzNXW434qO1ZZ02jA3/UgZYo=;
	b=i+dm6TRMLmsqf6l3CkdWFCDqnlNuntMfPtbdkYTRTkYyh2gsTbG4Fn5wTG8OrhHSXwLq
	 iO9yz/yJL5XaQh2ojHqQp4insqKnwi1qLtK/9e6RBWqRbFVwMbPxm6QxNbGsa89poTMOM
	 hJht9pBLV+WaS34e6Zmo8cffQ4w0QdBnxc/Pu8o1/deeXZuCm/Uqi+0dnLF2YwSmghPbV
	 emM73kDfpxc45g8T0H9haETWmUwtmiJWH8R4um5U6n9i9WdiOZm5Wy60pC9XR16luG+/l
	 ctZ4azp9j4xLmlhnn+jAr0FHIqCs7rboGdPWlIBg3sjtnZEt1TzpeqJ+yXkN67CebHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=STSwwKKe;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB9606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FB9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=STSwwKKe
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDC224E416DE;
	Mon, 23 Nov 2026 17:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B16D9601E1;
	Mon, 23 Nov 2026 17:09:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F167411E6A79F;
	Mon, 23 Nov 2026 18:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795453774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7qldxPAZLjy7Hbt4PvGuzNXW434qO1ZZ02jA3/UgZYo=;
	b=STSwwKKeP0xtU1dwl8dQpafSuY+u/f1074EyiU7ZghlGKNw5ISRy86nDpEXNHUBdstAFhk
	i71j/dnKDKUERwDeVAZoVnkA6AwoPgy02NDzVTFiNaSXXOtARz2lm1yhjmomW6u83wX+ET
	HQNbcGCAiMz86EbK/zXnPXZM0K3HzykoY0UYannccFO7EwnWO9jrkVNu107Hu/HjFMTAJQ
	sznAZ0hOLn6fm1Kp/8eysUdILlAQhg62wAFmkdBvnDHG1DIZDU/HbK637lRlTOyPrt26AV
	Nx+/+oAcA3ttjUiLbNloDK5+OocAwBOqi3MxD7ePGlywFXNSpuL/4sr09Z2Hwg==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 18:09:30 +0100
Message-Id: <DN2R8R6SGV27.DU4IEVFTHBC0@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net] net: macb: don't disable an IRQ wake that was never
 enabled
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Sergio Prado"
 <sergio.prado@e-labworks.com>, <netdev@vger.kernel.org>, "Dom Cobley"
 <popcornmix@gmail.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-nb-macb-irq-wake-net-v1-1-ccdd60a9a1bc@tipi-net.de>
In-Reply-To: <20261123-nb-macb-irq-wake-net-v1-1-ccdd60a9a1bc@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolai & Dom,

On Mon Nov 23, 2026 at 4:38 PM CET, Nicolai Buchwitz wrote:
> @@ -6589,7 +6590,11 @@ static int __maybe_unused macb_suspend(struct devi=
ce *dev)
>  		}
>  		spin_unlock_irqrestore(&bp->lock, flags);
>
> -		enable_irq_wake(bp->queues[0].irq);
> +		err =3D enable_irq_wake(bp->queues[0].irq);
> +		if (err)
> +			netdev_warn(netdev, "Unable to enable IRQ %d as a wake source (error =
%d)\n",
> +				    bp->queues[0].irq, err);
> +		bp->pm_data.irq_wake_enabled =3D !err;
>  	}

Your error handling is surprising to me: if we get asked to be a wakeup
source and fail doing so, we should refuse and error out. This will in
turn abort the system-wide suspend.

The risk is that we might be the only wakeup source. We'd sleep for a
really long time.

What's the behavior on the platform you noticed the issue? I can think
of two reasons that still make it work:
 - you have another wakeup source or
 - some other interrupt (PCI related) is your wakeup path.

In my mind, we should instead propagate the enable_irq_wake() error in
macb_suspend().

To go even further, we could move the enable_irq_wake() into
macb_set_wol() to report early to userspace that WoL isn't supported.

Lastly, if this is indeed a PCI related topic, then we need to
special-case the enable_irq_wake() call. From my LLM report, many PCI
MAC drivers only call device_set_wakeup_enable() at the set_wol
request. Then everything is handled at the bus level at suspend: a
pci_enable_wake() call made if the device is on the wakeup path.

What do you think?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

