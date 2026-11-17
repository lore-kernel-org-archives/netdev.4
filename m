Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936362;
	b=mkMn9urfM4rW8I0F0fOcr7yeJz51mWN8c8FsIL8gZ1qJJKdGyBYFAv7ABlKkn6cYBNzG
	 wRf80rGS1VsAlo62oxwjHvt1OAZJanmMerHy2lyhXddXHudyMtJ6dhKSKyIgcsf/GbOwU
	 pHraeMvLvSMP+dncIaPGkLDT4PaElMbIwRDIpedR16eUiTJlqshDGeG4UYsXWA1A6IhyT
	 JL1wzcLH+CfBdagNuddTFuwehLy6Z6DOQBxkG7PC0yCOOueAgft4OjjnLJmVk2ShqCM69
	 8h8LyeqYxCm6fLe8AfbtThUOdDU817vSkJSDjghzjNUede7pvaHfMECAianVIkQJlDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
	b=XCJyyKWUuiUNnzasTVaceRRH9CQlhsyBe/fDpHeehF2Udji2P8jGnBZi1benCUA7W1f9
	 VxhBanBthc7Zqz0/8Sk9c+diK0bEe+ccSgupbztc36w85K+idBsTp8Q56xG6dk23kVmG1
	 Ipfs9WSdWhdpC2p6L+Jr8vWvpVszffd03X/FUlyYr42Bk3yRzfm9C6T82TmHe0zksr/zx
	 GsyebKlMfi2BtBhvaab8laS5unA+SW48cGm3Agh/jJADgHx41PbtkaaTqKqP1Pnp+K9f6
	 io9HNjDQwuo2srulFBaxfiVm0Fc5PQMyDHxWsdGK/HAgrXb+hKeS1FSkDD3OtkJbqwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/3ahPEi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EE606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/3ahPEi
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c504fffd8b3so245686866b.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936360; cv=none;
        d=google.com; s=arc-20260327;
        b=SjnAW04/69ogiOCQMf4SU4lGqD+qNILfmhd/F0zjoKyn7t91SoRPQLhKVeI4ebOYda
         O1aYRnzNEsG1iSgSMN4daDrJGbR8O4QKwNKFDYkkpjpDDSY7g9zGz6Jv2LrT3zy9chKa
         2Xy4FBvU0a5oBIM/4+KV714v3cLd+WrLDHeFJMOw9kCBny8MQb5BLukU/zA6E5ohZvkx
         CnJ6GTL7Paq6/qjtDzOFFBql7eE1A2FZJtugS/jXfrZcqEdHzMDgKVL73EUgA7XngrPL
         4eGqBdrQutmvBQJ1OTyf9SdRhQKnIecMUIMW7/3U1LUlP4bA13adslbU+LCXS9DjtfYe
         SU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        fh=wcvEU0cawSR4MNPcueFTIexFPvA8/ShvVCFN5S9/Y+M=;
        b=SKwhETUGAScmo+3/9J60GOdBegqyRlUMmUAJI0/7dVUAMYOZRwcn78K2lWpVRK2Ot/
         nQcNfyuSFoalMS5dxpgb+GMg9fxxnqbACKwGdPIVlL75IzrJjXRvAu9zgfeWLktPVICR
         aJx8e9ssngXp/IiN+8ZshJZ3YDZqr3VjMltUxa6uzNB7xarmKD88711EfHXFr0TPqIUe
         /2xqTqyeOMmLMJdmXH3g6+1bXtZF5CGdZ4WAu4I11qT3ZPWXjct2B1SermMhbOeqW8Fw
         DanzhNVJYl+rV53grZwt0nAurVa4xwMu+zXAwe4xk1Dxh1auHIwumrAcy2TFe4Ls37MM
         pJyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936360; x=1795541160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=e/3ahPEi2N7JscSx7JIYQiT+8cj5RAH7fGllIp1T2Wr65wtMRkvaK66n/hFmq64URL
         ux2bNsR+X5gCZwCJpx9GcinbzAMhS4OgumXFCmkWEsYcLQC5FpFrqFwZu12Y0XhmCwrk
         /yVrqGxdQ9y+wIlV1Ib9/SXF/3g2rQIr1R5IueIPnw3bu5jitZq1QYwYIrspvLmYIFcL
         AhiV/octTxWJsSioLWxgsK/023TPSedYZvE7jBUYJbz3wVfCdwNLX6Bqd8El6H1FqWXw
         n55APV8IRc7J9ISdj3Oc7u5ujYoc+jVDlXIPqb5gR07zADC96z35PoldZygSzpKPn9OW
         3ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936360; x=1795541160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=373Q6XKV7D4BGtZOuwgJiXk7Z3A+A6WU4sQOoM0c/Xg=;
        b=OfUzAcPQHW15cHwemacjs4ZHPd+VKMrjA9YJ/rckdJmL3HR+6Cp0zUPz+G2LqtITQr
         b5XuQztv8nHBEThMhBiSu8MWG9H4+1kJY3PH7vdsbWNT8RmPvWq9P+i7r7i/LC2wffPB
         JOKcKl44jcDuS5M48sRzh2jptQxlRS02jCPlIqlnwRM17niXcS/YVv7n3h2hb+qABfo6
         D5s88XPWgRZbRxdMF24rjyxBlkkqfreKL6tqB0GJr4XqsZasd3PP5WeahdoNTg7uwlNp
         6ZdrP0JTUm4x5NCW2kv56Ow3eCmz5T9NhADk274idcrlCSF4OLrSkPaiEt8gvnX33Fxs
         BD1A==
X-Forwarded-Encrypted: i=1; AL+hErEKGR7y1qXbhycbXP5v1kEmIOJqRlp96WdePIbBcMcNMYeoMfiyd18iAqTp3TCeAPJZpouGmqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XBOrNiC7hpNJYtcNPL/Ke9gBkhhCosmRKwZPQV36kLaVudUtH
	iH+oi9u9YsZv70yfCpPjjnpLOhXn8IaEXWvItV9fipiDF5l8LTwHok2W0U9E4gOnIo8m/SqZqUC
	EAlGE9uOMRtVQjuK32qjL9a+EKbJL1bA=
X-Gm-Gg: AYBFou1f7tfvcxsuLvUxiH8Uc7gQvooEqWgMNH02x7bHd5wCoSgWCkmvMV2weWgGx9L
	6ZKRKpfuLcgONLNQkY40jWuFwtFRF2l6NUyss5sBQ9q4izM3K6rZTvklx/qSkyASidKQiNEfcQN
	sE2ETaPNLVU1nLLMZHSj35mwZ+UFg+LnEAFY+Tz0VM1/+3aBAzNYryYXNo+vtBN4COvv6Q3HlaY
	efjG6Gqa6M4ZvsPi9uDMBggMGW/aLNZZmXQTYRFd1kSbbAOepy9XWv9DiMqruKn/10lQEy0mq6Z
	xP3JZCR2hvB55LmT1jgWtaVbc5hguSxm+VVML1NNGMP+w1qTZspmAPORD6CwoWnn1pK+WDvXxNE
	+9z5q+JGiq1DgSwOX0ffOtlO0s28il1XB8OHimHOE1EE0e3PDJrShKyvko0m5fO9jXITvI7W27q
	nsAJf+X6WaJlk=
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c50965421ebmr1292812966b.44.1794936360337; Tue, 17 Nov 2026
 09:26:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110160554.918652-1-coiaprant@gmail.com> <20261110160554.918652-2-coiaprant@gmail.com>
 <20261116183012.11a7ba72@kernel.org> <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
 <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
In-Reply-To: <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 18 Nov 2026 01:25:47 +0800
X-Gm-Features: AclHuK_-ty3BkaDRY6TNyMVy_fEf9UBHYFECA18oX_curJlczmmtv3pUHIwGjA8
Message-ID: <CALj3r0iwtmfZAN9iS8yN9fic0Q9jVnbYP_Hz1VDheVvmh2GcrA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Fabio Baltieri <fabio.baltieri@gmail.com>, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=A5=
=E5=91=A8=E4=BA=8C 22:04=E5=86=99=E9=81=93=EF=BC=9A
>
> > I understand your concern that hiding the init inside the macro seems
> > subjective. Since you mentioned an Andrew ack is needed, and he is the
> > net PHY maintainer (who also looks after the WX driver),
>
> I don't look after the WX driver. I comment on it, as i comment on
> lots of drivers.
>
> > If Andrew also feels this doesn't belong in the core, I will drop the
> > macro entirely and switch to explicit manual initialization using
> > phy_interface_zero() in both drivers.
>
> Using phy_interface_zero() is what current code does. I would also say
> using explicate =3D {0, } is O.K, but i would not hide it in the macro.
>
>       Andrew

Hi Andrew,

Sorry for the misunderstanding, I won't make assumptions about the
maintainership next time.

Thanks for the clear guidance on the macro. I'll drop
DECLARE_PHY_INTERFACE_MASK_ZERO() entirely.

In v5, I will use the explicit initialization directly at the
declaration site in both txgbe and the XPCS driver:

    DECLARE_PHY_INTERFACE_MASK(supported_interfaces) =3D { 0 };

This removes the buggy macro from the WX driver while keeping the
initialization completely explicit and visible.

I'll send out v5 with this fix and the lore links in the cover letter.

Coia
