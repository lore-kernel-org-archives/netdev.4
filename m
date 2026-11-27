Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789510;
	b=I8s22yMKndBpNXZ2md8Rk8+MkCdbksguJUEZnekfgPcK3Od+9kQyBCmr24Tmn6izdJ7e
	 DVQA5RjisVzjT1MMK3iVOpEdtrQTa7EIHaD1baYNd4IpT5u+Fp6RICGGamtZ7aHWssKg6
	 hwrGiIuzGYBw4Q2W3ncbtLqkbBFlKDV4JL7H/Ock0BtN77pNY4abQZQ9ofukZjdEWXZ58
	 WFMgrESAVpcg6Fyf7lUZOeWtnlJnj3tqwsCZ/AZqGP0qmfPlWSVnOiBq410dUV3htkHP5
	 RO6/Y7ByJez6uuuTroD5P/jZK2c0kk4qgWcxizqepRrLUvp86ap0jlOZwgw58EyQLpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789510;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=mj9EtvWS3Ow/aZvN319iz78THo4O/k9I1rmU+S5bwfbNuvuB3m3ef57QIRLN7lLzF0hi
	 KXerHhTSdH/QW6ntX6eelOCKf3uAKfd/UpZKpNRMFsF2pjnyNWOjv5umliPs3EDpNEOjM
	 FhHIkB4mc8UHCCtBU55NFIxGteaFnT/PA6kndwrDXwDmg2ijSXmLdlZXZPiZS2OTGKxe+
	 LgW5KSMDGNG67w2SW+jmKKeFOhGcu3XIDYnwPoy4imQe069FT5Qkrnr5QX6mmReM+v/rt
	 fbEIb1x8i68m4bHwO6WBkLzvG6iHr1bcHQy2XRcR7bM1R9IofnP6IMLiJYAsMDAt6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C1606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3C1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D5D34E417CA;
	Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B156049C;
	Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37EF711E69006;
	Fri, 27 Nov 2026 15:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=QIryK6YPTIgydwV4pC7EccY920APC/caDdInW75e99di7b5N5q6nalwfbeM6A54FBoZAur
	+lgMtkrmsr5ahz1MVU53wRcfR2doH80Y968uVo608aDISbm003902nqDVEs2S7N3fOZMnU
	OOmFkapoF0wwZLh4KEL/OK1xeK1YbY0DKetBHBNvXiqLPXbf0ysfizLCjFbvOnPsb0zP9i
	dzpFw/D15adauAkNOV8RZ/TDr86lNw3BtvO3wss0HXWP5KMk45AKwyg4NJdbIZrL6uUZx4
	RrKIvEXMKcOtCrbsXfVmhLF1D6Gg5BAxynVUybydS+p7vsqItDTRCxm9Zj9wZg==
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
Date: Fri, 27 Nov 2026 15:24:58 +0100
Message-Id: <DN628YQ8UFG4.PF85CG1FNM2@bootlin.com>
Cc: "Vladimir Oltean" <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Jerry
 Ray" <jerry.ray@microchip.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bo Mellberg"
 <bo.mellberg@se.com>, "Pascal Eberhard" <pascal.eberhard@se.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next 0/3] net: dsa: lan9303: add LED mode
 configuration
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
In-Reply-To: <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 26, 2026 at 3:52 PM CET, Andrew Lunn wrote:
>
> Sorry, but NACK.
>
> Please use /sys/class/leds, with the ledtrigger-netdev, and offloading
> to the hardware.
>
> 	Andrew

Understood.

I will send patch #1 separately also.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

