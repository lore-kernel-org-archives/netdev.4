Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617716;
	b=ruGj/DH3Y0VTT99shXi2OkVn7iRNG3lS0FA5U09q6VuF0luaCTN/m9WJSaL1/r4UzZFm
	 LpAdnLA3tN9NDWuvz6z50iLfZQZvX3+xBvw4L4HoWNCiYiW9cMlJq9rivnaRf1dW4mPtV
	 RyI/emhI/WM5TiTYO5KvfE2NMbO6hOEewa3cvCz+2B4xFC778Z7QhD32GgnfuyNO5vxG2
	 tQ2hmbZ/uu8ZizMZobE0m/lLLl2BdHBccXOEDJxsCYXRbSqRscDl1bUFu278G1pRabB7k
	 zUggqKTqaILBGxKyOUMkqcx+UXMHe79STNY3FDszw6VD/TLnTsgSbukkP5FS4R2SeeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
	b=AmnetQNkRus0XQO/qT3LyukO1x85yozQ+71lZ7I3N9CiAeWc70cRpL56lQ8ahIqarLS6
	 NVDn9FDrsr8AsvtdK4OF2tRahB7O2PktchiqQY5ILvN33KLx9NFj/Q+XzJO8iVleeAb3x
	 CTl97CmP4kqNQD6sDWlIzUU+LS8ieLac86+013KZ99lb9kO89WTBTfP6RL+A/PzgUecZl
	 Xa1Re+jZoufGPU+p8CrGXyok7cvP2odH929uDncdtpL9yaRovAOz43Oi3VDyLKVmE4cTy
	 IO0QAl27bt/sp+wRnzKCA9JUAq1KfX+QeCukBvKTT081WoNTz2ZLnFlhNin6WiqhCjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D36606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D36606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=odAjoK9l
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c515319dd89so83592266b.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795617714; cv=none;
        d=google.com; s=arc-20260327;
        b=J2oyDsHqv37vmD5CB/CasHxUIVbl6cmrTe9PwIkC7ZaDiCoDyaCsa0g9B69xmlH1D3
         22+03SQr+DODgB5eInvBeEGYbLr+1i00s3vbJEtWj66XJkaClazSeyEANrERlrKIn4fV
         xYu//Kq7VVcX/fYfJJl8wa0FNaUKCk+RrTSblZ2q946qfK/6eubsiEZfdwCP8m6GHvP2
         xsT7h3XxyXbAheS83SDGpNSCexk6k75aS0I7jYedWhw2jUYqbs/w7G4hR5zSCY0RQ6po
         iNMv/EnBtC3CBiPvRIkDplESBt1e/V7SBrKbeeKu0PLEqDpezoo4lwTfdHlmT7+JFmMi
         Gnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        fh=YzRnIjTaGJaIlZjHXeCBgregWKDKQMOh4LGJL6LlDm4=;
        b=VgeRBTC1MXT0WoMg8cc75c+erUmXr31NwP+gZdu6zOotCW9wSQEWXdzBTOpscnY9cH
         BhmGW29DOTGJPG1h5cTwPRVe8sTRS8c9c6DZu4oC5UECZitMiXajX17pew0NXk8cL58U
         otNoaD6Rb+lRCMHJFY/jqrXrF3e/BPsX4lRpork1x29ObVTjIHkkfPkxfwliAeUiqwiY
         HUF8di8KOJrTjqIjTaE72AGb1NNAI7qyIsMJrmfQVjQSbZmm4CRmPraoc6r/xeEUjZ2H
         kxgdqGjdXZLEN1LvYWsu9lb69ZIRQta/CqYJwppGKVAmPoc69D79rXtpJ+cDLodH+E9/
         bS+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795617714; x=1796222514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=odAjoK9l/53NSwRmFiM24jvPCeeXxp/4vOc3k3GMNxbsBQBZi6TJxTLdHUroGvseN3
         vK+7WVGukF1Pw8D8F3SHepUtK9+iku92Ic62HRdxe+CE1Xt6C1n/QKzfSoNlyVrD/HHx
         1XBF76bqvwnNeSYplJwR4LfoEdgs8W2rAbHYNLe7KCxulvyoD33XQpFdv5HkF3lHN/pR
         c3KGrr1LXL6Th9ppIfY3ZwS7hLZJYIqUSXgBaNWlnvK/lDcgEGoMz9BQ1z74C4UAPLic
         dN9BXhAuvPxQNHoogynsDFop0FHAmOfWCSunp+TpXx0NdRPykNVSHPUgQ4abiLX9lPax
         0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617714; x=1796222514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLjx3CTEUXIT2f/3aLm5eAmD1Nrm0DwEfALNNSAoscU=;
        b=0MRPSQNiK70r3nUOKNezx4X/9entPJENJFFe3mwor4eTxw71DXL8l3j40xaMWTpEd5
         hyZQ12nW7jc9z01a1/aC6IV+VEnm8ZM8Z4By7pgPOKO6OYNSSfRoxo9DJUv7H4lY+yNM
         gQ5qlFu2spcFv5RmPHRdme5bja5FuyFF+rikHvGt9D3OSWlhmv5EBGKhlXlSIt/KwWSc
         pSeOb4wD/TFY1PfUHO4sn/t/JXQxnmrEiPQhRz0YshCLzHY80kzgY1zMOYurKPkeo5pg
         HynJPofjJrbIpjlPpWmmtDHNcXckQirXT081o/k/hIE4Tcvq4eIZ+0Tzc/CkLxzcj/Ov
         ecBw==
X-Forwarded-Encrypted: i=1; AL+hErG9aQtptQillE6sjg8S+x23eoMIZhLlUnwoHh6Mmz+UkUNK7kJslXVIMyvkbCyZuzJEhrOduzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90xafLIHJ5Rdj3/o7LypqF3xWtB/yxpCqkOqXAJKLVUwrWK9xk
	k8K0cTcy8Dr93AIJJiaNR1/8iU1OiuV10p1PB5L62+iDo8r4+4PU3ENJ9qFSGokJa0DPXjJNQiZ
	5PKiX06kEP5keFY9KSE0swEtfNvmsFOHrQTi9r7XVFA==
X-Gm-Gg: AZFdTZdXU0v01sSbvFACXpDeOPJPw4aC0y6ObwIPADRoHZUxTx3M5MUXZJVEKr6Z3r5
	HphBVzOF5b15jZhS7Nc4d9TLj7AvNBXrhI9tQFsqqgIdBZZf+d43G3Dj4Th1r+9FGP6UTYUYp5p
	b4Q7mFDQLmv1uEFM1PcZ1mtusnJ5H0CsUPAPCwIpqE/4+mr32GpfalJ7ARW8aXuLpj1bmTzGxv8
	DoJ1PG0EFBJoWUBf4JPJ0v0u1Frnv4mf6rML/Oxgs1YMmAOfgC4bUlQkFxsR7TKmSyQpkmfzvML
	b5Yn966IP9b095ZAab8wmlhk5WSHT2Mv/nMhYERankJKzxygdkSDXpQoRxOunoX6L48WJhH1hy2
	A7qOnAX2Yh8kJLqMqGqg6aQc73kpORK2B0JpKcNaLELesrD7k01IbLLGtYDDvDkLhYC/odextrJ
	/LenB9/rRSvBbUuA==
X-Received: by 2002:a05:6938:e04f:20b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c513ab1349cmr1102866166b.42.1795617714171; Wed, 25 Nov 2026
 06:41:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
In-Reply-To: <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 18:41:42 +0400
X-Gm-Features: Aa3M54p30Iatdogoy58JfnAd55Gl1tkvrMVT9GbSbV-cJhdMvMKH6OgZsz2cLWQ
Message-ID: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int ind=
ex,
> > > +                            unsigned int offset, void *buf, size_t b=
ytes)
> > > +{
> > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > +   u8 *mac =3D buf;
> > > +
> > > +   if (!id || strcmp(id, "mac-address"))
> > > +           return 0;
>
> I don't know OTP drivers. But to me, a function called
> rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> architecturally wrong.

There is precedent for this at least in IMX [1], [2]. To me the
interpretation is "Rockchip CPU ID used as a MAC address base with
offset X", which is exactly what the derivation does. IMO, this is
less clunky than the alternatives (e.g., a custom NVMEM layout which I
used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
returning the processed one, which Ryan proposed in v2 discussion, or
caller-side processing).

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p.c#L224-L238
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocot=
p-ele.c#L115-L129

> I would probably not mangle the CPU ID in the OTP driver, but in the
> MAC driver. The MAC driver should ask for the CPU ID and then hash it.

This would then tie the address derivation logic to a specific MAC
driver, rather than to the platform, and it won't work for boards
using other MACs (such as PCIe connected ones).

Best regards,
Alexey
