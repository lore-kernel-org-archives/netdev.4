Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069120;
	b=KYy5bLmIb1B9yumh8U8WzkftK7KQZsm5BKyjRXTJLpHOcb5v9tzRN/TSXECr70MpOBmL
	 TZ6l80F2thwM6Q7P+6b4VmDd3kYK8zHfV/cYTVO4w22g6iZFf2TqRwpWvVwXLgrrntcGY
	 M7pNL/I/x3uTef44rG3um2zw0u509pmqMnsCj2XxzLFv18b4We94fIaZcjAVnQjSmOwrs
	 es9SIB+Sl86I4dX0fltzV4vzmJpn02JUctH2gHSm/WIgEEgUcBnZQE5RHI0V8KF4dL6Or
	 d1nVehhVRQI2VDGGYK9stzR0H9bNc+YbuSDJ2g39YUlVB8TnMNdilrh/IUBTeGq+pcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=qDQ6WlP711Q/jCEkUc5CQRrOlFFN1qRMn8UE+suO7Mw=;
	b=ZI4dyFIEePkO4Tu8AvXX0Lzz9oE4LIB01E/4+se31hgPa5C53HKuLo8zha/SSTYHoy6/
	 r3pZ+0vb0G3cdB03gwC9LB3l8VT6XXGtZxVqC8+Rts5jrKbmGAiSixKgUZYd0Wcw0A5mB
	 JFCAZFx+hXVQJy+F3N1UjkTck/QfH8bkuSQlwHYCyZslHo5qbl0ODOcVbS2nQnkFlkpF8
	 IctTjicVDuIu7VXAcZbt/LtJXcrENWU8QTikm9rdzrVW/i6EkAX9phzvbQ4HQz7hRjc21
	 kYmhW4wlUwmskMEFlul/6rqA8P7b3/G1rc15mlE1BlFHCFUMXHyBQFfxkadmm5siuvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erYcQVUg;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55321606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55321606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erYcQVUg
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1056171a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795069119; x=1795673919; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDQ6WlP711Q/jCEkUc5CQRrOlFFN1qRMn8UE+suO7Mw=;
        b=erYcQVUgiSS/KVBMQR3L0wxQkrOLnyaPhBZQMiLtyVQ1B3EQhWgD/QxPn3yhTLtSlX
         0AI9O0lKN8vVx0og3QfwxsOeiEmBtDyPPh9tjgw90X4QMQdhLgD/Xi4FgsiRJX6fi57G
         buGHY9kgJwE8p4HEkK07/BCXNTOh11YzTUjNEVtTyhFoQEdIbJH/Q0HQcakEHhCfx8nC
         RWAihWDuKrOmQuW238WJFod4DH0LJuf1XkBk6L/n0ku7tdCh9j+FJvxafGu6U6dhB+iY
         40p8HCCemB+URgZgC3WTzYchKvU5c+ThgE+zYxPXKKKSGllOswKQJQ425hy0iIohi1sC
         hE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069119; x=1795673919;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDQ6WlP711Q/jCEkUc5CQRrOlFFN1qRMn8UE+suO7Mw=;
        b=E21/6lwy5CmGVufbLfw2cmGFIi9CzQl4MO6v4mOO2AEc5Fm/YvfR+cjOdzp6rsP7l0
         lWqt9RmZRMqb4b6ao79A+0AEvN1Tfi7iqWXwFjNIP3NSCLLoR5V1/SBAPQQMdV2O5Bgc
         YiPxDIFLKGVL4DXW4om4ZD8bTkx5oheMmfKhUJ4rq1bUtfJZstAnsisuXy408Jxe38qi
         hONhrA25VSVHkoO0gMpnmsSS0rNZ4MKwlPj9Mnh7okwYd6Es7OGbcCq0R2zQBZXLLgq4
         y2mQibe8uCVRznvVZHN/3on2R1xCBIQqgjLDLApg1OX5yJdTqJav0rqSAE/mNDem6DJS
         7nOQ==
X-Forwarded-Encrypted: i=1; AL+hErET3sNbi6FdA8QO/DGa8YRV7NNuWmDVH9+4h62DXZsIchFOfAv5OiCD09h0vjmoDg6jjhphQVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XzaygcILAniowHHHJ9oZaHWotS3BgWf+PnccuuS27MPWeaxnz
	w+MsekYPiPEcPkR3+zr3aJsMNkrLMUSfTqu3jZh/EcCqmFAWC3Ab+w11J4L1bA==
X-Gm-Gg: AZFdTZffGPJDGbBxiWFvVzASZNzZ6E/yTAFcuxfcI+ye6kU8RKIKjKjeB6J0dTjMVie
	waZoBakuy8cnJnRYhwi5muFnMJmlapjAE2FYeJrBmg558UnkPLtMeZwVUQ7t+WvrJOa2SfODvPP
	K1cEo0hS0a69drRC3LOMuqN8p4A7p10EAXcideDoOy76ututFZkhBZsvhwm8cfsMe3mCxrXNAN0
	KbHDKFYdPB6wlBh2bSC4zpKTavXn0v27OrHppin1ANRtEZJOVnhf7zJLfY6fz48c1p5zjQZZ5gs
	704OWrpLSadPffHY/DtEYWYsE3bQqd9ooQjSKD+oJBzdr4qv2d5/cCDsrLNILxupSAk18Eu3Npc
	RHmfhMUJgM8keIylIUgz8GjqwG8+15XW4ub5QQvLFvDKO3APRER0Drvhi07X3tPfbLa0g24OrJ7
	FK2oypybaZL0fUq0Uz4rMV0cmf239YNloBZhN8izd+9cTx4Ul+Y863AWiaYTa4ZcbpBQiqW9mKb
	NkbQYt9HuJ+u7sPLKj6EkI3XI/58h1u3Pu02YTR6uCtevsFuqz1QyfklBvgwm0FYsa4YI85nF5t
	0HM8tNf83Z59LHD6DQk/DgQvbH8QFfVW0V6hyEar1ILitDWiMuG0sfxOyrqk45jn1ErtHJ7AxVa
	90w/FqSJI9SK8AYemFJSK8rKUoTrTKv0LCNo=
X-Received: by 2002:a17:90a:dfc8:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b3d07d410cmr4080335a91.38.1795069119423;
        Wed, 18 Nov 2026 22:18:39 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405a7e577sm943712a91.15.2026.11.18.22.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:18:38 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 06:18:38 +0000
Message-Id: <DMYYW8MYVIHB.3D78GEWAD6OSX@gmail.com>
Cc: <willemdebruijn.kernel@gmail.com>, <jasowangio@gmail.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <kuba@kernel.org>,
 "Rongguang Wei" <weirongguang@kylinos.cn>
Subject: Re: [PATCH net v11 1/2] tun: run the socket filter from
 tun_net_xmit()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Rongguang Wei" <clementwei90@163.com>, <netdev@vger.kernel.org>
In-Reply-To: <90640d84-0c13-4004-b3df-1a11e4321fae@163.com>
References: <20261119032242.71919-1-clementwei90@163.com> <20261119032242.71919-2-clementwei90@163.com> <DMYVOCRSECAR.1WZZONX4K3PYF@gmail.com> <90640d84-0c13-4004-b3df-1a11e4321fae@163.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 09:42 PM Rongguang Wei <clementwei90@163.com> wrote:
> I see the export removal as a separate cleanup rather than part of this fix.
> This series is a -net fix with a Fixes: tag, so I think it should send the removal
> separately.

Disagree.
The two exports exist for tun only.
This patch removes the last caller in a module.
