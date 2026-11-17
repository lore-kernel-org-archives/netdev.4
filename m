Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932670;
	b=ypVZsA2LeVAq4NvlA/v3xPtdCdv4gU5L/D99mYVK9x2s2gMdaF7/ovsyozDhHbAEvK7s
	 OW7vxNKHgHRikkrZzuXP/3fkcFYgIOFHeYcweFQKQxVfdCZ1gGPg9MREOtHFpVKyO/5rA
	 P/Aci/+6DIfbBRvtBiQLVaJ2JetxvG1O/yoMDn2HVQ5JvPhzM0sUN66E+fJsUZbaC8zPw
	 +QMIXFmmJZs6jya/GiMcyCwW8RxaVhpENr7lS/z4ha49yFOHo3P1HS627V3v/b+0l7/hI
	 t54QHc1wdmzGHsObY0meTXKi/V9PExJZukKlhkqZ0dgnYilb2RjaygkQhxT8IcKf0kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
	b=vsQ3vO96nFf923svtl6dSclVcpLHnsq2y2Y61K/t/aiJw8k58fcU/77hy4FgQeYatkgd
	 7nQpvdD4XPMniPT7jFvwyY5z96ckO1Xajwn7E1a5zZhAhOKXUmy/zt7LcT/oC8yOVGPk5
	 2I5MbKyg13tgan2PZljgoilQxTQVbtN4PdtDZWkH3VsuU50tjrveZ5bwl41ofozdAa68f
	 nZnIYE/pDrxGr8++OIxDjKQDHmd0Ne+36Bseag+h8Xzvz+sdYvGuALK6OduUt1O1K2WNY
	 AKPyl59HxgXb1zS8IPGe8X0Er8FJ5Bvj7aFHAtsrsInphjdrt3jze9L/+iVN3kk21yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32D606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE32D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cdqQd8jv
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so800075166b.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794932668; cv=none;
        d=google.com; s=arc-20260327;
        b=DlnsvitUISBEzrY6l+p8v2/UELR3RdaApFd/cgWUCDLSX1MyOh3EE2cwjZrvTUg09+
         jxj376qwwge5LVfEVtUbyX2qkB+H1ErQ1i9Memh0UkPOaI40Hl3QHAsnRuUeeDS9aCLK
         7nCWH7/mc6Yp7oRZkODlrFxpigTIT0DZ/jlC10QGBQgOFVfDTLV3Yi+YuLyO1HUNXlM7
         oYFBjNTTZ+EWGnGcptoBnuf1eqTdPz09sPUC/3MsDhZeyC+4Vh+EcvgT/I/lAfKR59WL
         eb5n68zIAuDLiSHxe1AWf9kYIm+dPxcExqdRGI1VFCKEcvq1jBS5f9ckJXJFoRrLnNZK
         ho/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        fh=ViMy/N44bf0bu6DWPdSZhgc5ZJRfu8qVGZ6QG5uAcuU=;
        b=KMU0pZ/W9S/6gY4FxdMSvb8Q9H6NEl8njmDJp5ZfU1dRs1LLFxGjE/9VLE8Dzv3BAC
         Saaul5IqN89Afkx9/CeqDefxl7CvZMM9o258PGZ5NiHZEIcw6+qxZZoSUet3Fqlm0zvQ
         GVW9KhtJ0050mbHb/p60onSWUfdBTeNlEP6qhq7XTHmEVUfSanfD/HJFCaKQrC2Fbw9g
         WnRRv5yRWQr0TXpnKisXsHlh9T5l62uZMBiHtd06dJKR9XcfZiQI9lCLLqMfYd9FFexq
         r/2PNyG38NpvQgT5HCX+MsTvdC0j8EFWkgi6JChZgHb/zlB2Kxm1hcZLjBy0nGO9RMy8
         jfeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932668; x=1795537468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=cdqQd8jvojBdqf5S+ZlBYnRBB0iv9NrxVYWGKdwsf3qISFsmdiLHOpl+UNMQAzU5Ho
         liy/ffvLgOjWoCC0QMtIRtCSaVqYHa8IArufbSdRmDatd8CHbeYDI8B2a59M2Wrb8O29
         5NvqLtv4LgJz/k1d6g/ZfQrzTO47WvsKobB2eTGboiH6qTmucj3NIxw06T+MZKY4mOTH
         seB2ppD/Pobdk//WYyirPBedKHZ3i6zq8BB2cxTSK/1zF1XG4JeHqeQQ/WrdtMt+RNK3
         5yuPyjkXC22spPcEmapMTeUxRVzMVVw38Bm3+Ce+ODpNYfXU3pJjuC4IOnDK36O1bFx8
         gTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932668; x=1795537468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxewv3rmU3Q16rUyybTo0MlmIExqFujl8iHouonYjT0=;
        b=v/Fdv9CEtO/tsey30DpeXKiWH2K6o/utLgVFOhrMSKrgHqaApzDzgItWdehbF5CdZE
         LvaF68D1xh08QBYLB0MIHAbgZzH3BXCXowshx+SvrqZ8+4n8ORXzHPkKs56gmRd5wwXA
         nowMPBIMvJl6QKbq+wNNLEkB7/fRMBe60IdrmHxd8aTDEToaTHFtCqi6/AXEdFWOaJ5B
         EmgiRlXOLxCg1VQBRbaVqKPGTsXl8b1lXV784IUfH8o79vZyrrtKmrZS8MSVjk0DSvcu
         abMDQvUfamUhuzjHLToZRy+HbkRv4eQeXIYsdcG0apd5k+X4zLeWwu5Xk62SlqfMxxDK
         vxKg==
X-Forwarded-Encrypted: i=1; AL+hErGxttZt9jfdg2heDNyTgW89MvJxgHwSbA/6+ywbaYTicKVImtV7E7ITTHRFPhU5lJ8CvhBOHVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lq3yKeAVj4NvMPUoR/jU/nAhcg8w++yvvJjMMpwNH05fTgMYH
	oVvh3toAkAoR/EZv9f005yWzrdycRhYONZ3yUzvrs+L8rzTbbSbisNkDbFLEhIxCURIaP2p+QQS
	/pV7pHgLUHRw0Lmh89THyo47wo55Sn/T5LjGt
X-Gm-Gg: AYBFou2dtpUoZYIArq3zf1s43zGBwaW18Xtx3m57NV8qnkaoqXb8WYDVqV+K+sYe2iQ
	/C8O1BbAwSOappvhrRzcs1lWxBCU9e5EVFShntQcAnP6qewlpduiClZOG2hq9H6p4y1qOdPG0nq
	s5JoGiwttZWhzrKxvGV9X5/LWZduM6NNhRKlkRy2ZqDCckQKjrmhe5TuhtryriJPTtHcNpRZ27g
	E3z4ZwUJRZBJ7BYAGxhQXbsGTgnAy6QvCCd4ZUYPzA/oFi3ikTWTFiPWHDiAQ0Wv17I/762NIwB
	EsB6nkHePdGL77LgTR6ZKcSazaUQb/pdOwSr6VWXt9jaOzQPopVYiIaoXAURqVLRqfTzIk9NPQM
	3cnqAskTUPHYaXmSH1HOuctBTPQqJE+Bkn474oDm8IujwbFNB5XGCMsFarJkJ
X-Received: by 2002:a17:907:d308:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c5096110ee7mr1203048466b.6.1794932668009; Tue, 17 Nov 2026
 08:24:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
 <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com> <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
In-Reply-To: <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 19:24:16 +0300
X-Gm-Features: AclHuK_kxuMbS-JfA12If6aJeq6DU7qmi51H7ZrXORdCaUCFkepguGc-ovdSkpg
Message-ID: <CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Sashiko said only [1]: Sashiko has reviewed this patch and found no iss=
ues
> > For some reason it replied only to me and linux-leds.
>
> There are two different bots. The netdev one send emails using
> netdev-bot+sashiko@kernel.org, and it gets the reply addresses
> correct. It is also more accurate, less false positives.

Oh, okay, nice

Will wait =3D)

--
Best Regards,
artem
