Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540255;
	b=k6GTiKQSbnkWFL7TaFbsdYEjCqDiGC3sKcEe4ONDCKG3ivai2s1AeUbJtdSId5Q4olQy
	 /4KWM7FWz7YvOlfEKFic8gGEoziRHObB/bZydShasMXdHgUbSVUFxrFCKXi5G3KM4YyXp
	 4RTNbeGaFwJTOAU3pnIOO6EUbFa4g5sk6bU3QRExxvgQB1Bqg+u8jlAJzrO6b2DWvaS6S
	 hA9A5Cs6XIJ3Mw6WGfmWLzKIWgvTEcdxun/8r1ng9Tn0K5+GgMM4VTyfq3OHESEkrWh50
	 Gdx+AIl2fw08QiYIc31Mb8vXSw8spUO5i7P7tqZ1nUKDHnNfpbs8UVzbczW+Soqv38g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
	b=QonZpJpsrJksZAVmysnOiV7RAwPD+eSFaBZzuPWgT8WmHOR5cztFw2k/kjzg0udeDpwL
	 J2bBPGw1F1lmRGB9IAQlcE5O3qAy7c9NZXaWUMXd0rtrjDGEkxc3cl/vw2ojtWmGuVRxs
	 9SdqPExSEHsuQV/z09cIyEwGvspmOmkjy2wimcABxdHNyiU6BW3HdjVpePEtQs/ucplum
	 fzesINGtGW8ruTj44ZaCJX41WzuiTBiYJnx372/E1eMF3rglAc/xEYts7p2Mw7OZqA5jc
	 bQg+RiUEdVqtVUz340M18HpiYw9LRV53SUK/vnfkuWGw48JsnQW7O9FOelaJ3xZNwVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XGZP1B9e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0404606E141
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0404606E141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XGZP1B9e
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1888627a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540254; cv=none;
        d=google.com; s=arc-20260327;
        b=NYWBrpQoeXZ/8qdkVpPNLaz6eSEjGmWNF9wTgQq8SQFZwJWLsHtTW6DIVIrVH6Swnz
         qWnM0ICdBnk9SmhsAFNIjFwAoXTm0UN10Sz/58Tm0uAFmpxthaoOYgi6bvcn3f02+uHY
         WjdeMUcJDk0HxBIoHjp0sjGV5oZkIc4347Gh/KfpZ6BY0DcIzT/cWPIjjKSJ3kvBZuTb
         Zcrw4JTiIy0cH+svAHTKN+91dTIriSOlG3c8K95E0WiYYZncAd3EfMjGN2NQIIth9A2k
         VfsSDX4AAWAuYaOKY6nUTe7xUnZe0cGcgG5JcQuuq5zhqqL/iHrW7PAsnE7mQlz5cZP3
         GVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        fh=Jb8oGeNy1ADk1jreCZI5g8tZqqaGTstE/98e/F6IPfk=;
        b=bJK8E/Z7kF0g4r74RoEhqh00h9Y45pY6KuBj04lLXhgCZxeXvbWHyUjU2HzS43fRof
         9/I/TGjBuf6AiwI7KfDCONQ2PYTGX8ogJfvd/6wB9zF/r96cAvHbE2N3vfuzivf1suBY
         OcnRkcPLBiEahpDeDp0x3329W0uAOBFKqBZke1is1ioV3EZtz3PB8LYL4rWuxPtITEfB
         MHMicaSnXFZzQ5s1T+uL9CbHLUc+HYhmHjp3vilVU9OootKh2pmpGtCCHjxOtKEW5Jy3
         V56NN8FpN33/GV14wSDj031+j8FeoTymCR5WVTSolqqAQ5pb4mrgrbg0Ek2dGa1Yg4+l
         Qohw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795540254; x=1796145054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        b=XGZP1B9ebdkS8ePIk89ZuzQ1iCcHMbjCNYVdkW1Ikavfb7BfPm2cIFvIY/wrKRe72B
         sgtUsrG0y94ks58sAPWoPUZbaXTVzgig7BodyAWi6buZ0/NCmjX8E7Xfnq/JXDVG1uOG
         gZmhWdPv5Y4dY390ZwAB3s+ccss4ZSLw2/FwNYsfSGt8q4qrX7ZMBdKbJIYEOW8LtS7z
         Npr7U/WjzZAIMnhBXhD2TiYX3sPVYyxAi7D7cu4ltg1q/lUVnLTeEwduU2vlu+2Pccuk
         wuolouFPHsPqHmaPGaztToyeO/jvTkDu6eHV/VvaKPn2hibcKXvDCckQQZ30iZidEfwA
         ic6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540254; x=1796145054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD659iZbhB9OAfnpI+8tlGtmEiCdl2kb0qCNC7Yp8ls=;
        b=NXYIzJAq6odFBR/vTYUx0NFeAK0qb5tpbOvpqIyT4X+ZSyXwdOV7um1w0a4ARKTDVz
         jgJE1Og3a1mTBZw4VLq2gUCeQcZmjB6XHv583SEETVoR/wManqlfdTCv7L4lMoWUOoxG
         HZm7xNshgyE2Fb7nkFnRyNZ8wJ1L7+BnJQ+wue5V6KZeCj6jppQlawWQAovClhEYdZG+
         WOL4bHd7aGxO+Ua8SikwWKvHx55wvov9fJ+c4TNZ89uTu78JZbDf/AArx+wUX7NIRlUX
         F+bpky8wH3OJt6zxNmCqd18qLew0gMSzuAZP8janM+gPVPB4QpiHPVl7dhKXxWkvoyxy
         4jBg==
X-Forwarded-Encrypted: i=1; AL+hErFpEum50PToHVapa3cypAx6fw+s3XuWlbfoVFhj9mnXFd6oNEDG3pTKahlHYaTvlkz/DAwP9P4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Mbu6cfPhz92kYZAwxAtNvbiuJ3wo3M3/YzIsP13w3IDMPu9T
	qhjaynv7McU49YUBlMeOLjgZEdCC9ASb8bjWNVIHe0Y3LABsvdt0RfraR9bl2J04UJ5JPvtMxXp
	bKdjBdkVsAzNDrP0XAI6mRJrhwp2q/NnmwktSZCak
X-Gm-Gg: AZFdTZe1oWc/anKQKCcwieG+XVCBhyIV0DQGgfjCcYycQWzdhFoHRSUIPLI9eZGTQMo
	Y+ijctf0VYKiqJkXRijj21AaxwKhqSpBGt9u5UaD/NDEMtgBcoFzNKe4sqQQb2sTMLDhmjaOsT2
	cZXSjjCer0nLB3JaNJcjohaQjOuH9QJsPC42XxIr2yHJgKGX/28ziyKvFQeUCO+JmZQmpL549/B
	xY0E2Dqx9sJXAz1pd5PK9cFJMylb9B/KsQ6IHGABLGbm8sIKxMtl9UYxl1uzvPDFHGCSc6XiOox
	YzR5qlyFwZmNZQ2N4sNIZvdtEcRzOkoYtYDnejpBqj5VhAlI+a0nIA32BW9MMTzIGr6HeSV7yse
	Zx59dN0q53h3cMDJXKCxv7MKCwzsT0rDyI5n1lEPoo4UzVgNODNtCmJURKwSxHdWYIBDW
X-Received: by 2002:a17:90b:50:b0:3b0:9e2c:9b5f with SMTP id
 98e67ed59e1d1-3b41c7b6044mr14858398a91.2.1795540253878; Tue, 24 Nov 2026
 09:10:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
In-Reply-To: <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Nov 2026 12:10:41 -0500
X-Gm-Features: Aa3M54pQl1423xvicd2W8eKUxg-iwZ3pBcyz1tFldZ8tVNfr4v2hJioLBtMFymY
Message-ID: <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Martin Schiller <ms@dev.tdt.de>
Cc: shyckless@gmail.com, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:44=E2=80=AFAM Martin Schiller <ms@dev.tdt.de> wr=
ote:
>
> On Mon, 23 Nov 2026 01:31:20 +0100, Suyuan Wang wrote:
> > x25_make_new() creates the socket that accept() returns by copying
> > fields from the listening socket, but it never clones the listening
> > socket's LSM security state -- there is no security_sk_clone(osk, sk).
>
> Thanks!
>
> Acked-by: Martin Schiller <ms@dev.tdt.de>

My apologies, but I'm about as X.25 ignorant as possible, so a quick
question: the x25_make_new() function is called by
x25_rx_call_request(), which as far as I can tell is on pretty
analogous to an accept() operation, is that correct?

If that's the case (x25_rx_call_request() acting similar to accept()),
cloning the listening socket's LSM data makes sense, but if it's
something else we may want to leave the new socket as-is, labeled by
the process performing the operation.

--=20
paul-moore.com
