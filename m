Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629716;
	b=yNyvlMDOeNFrZHvzyLNLzeU3wjs4xi4niFL+dC6C8ffE04ISMnjax0AyzJh21uilafYT
	 aJ20KtdwrCN46u8rKI9Cc8jYCXD7rJP3SpVWHp7N7kCI/RJkSBH2u4pGIg8QiVVzSGmd5
	 VVbpY1JrCweRqFvsKaI2wM0xvIBJgO3W3Lx1zgh/J/YTZ3IlXnYPtyg2swwaI+BuufA/R
	 L3mjr+WeoaWRm9ia+lNkhu6kqaoJn4dDEtvx0Pvlc2auO48fQN5G4CQHM+7T+Og6ZpCef
	 /6BTG0J2MTZJ3wbYBId6AZ3lNyAPiWBXz1GGH88d5uC5TvhpIsXgCNURaAIsUiuRM8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
	b=h6b/0d8sPZAtaD9r+Q0OssnlArU/Uboe53KQbmJ0FWQVXHxucwL3ixsp3SaG9XPX79//
	 gM7375fopTv0DXM80pdUCYPIXA1CwWc9pO6cugZGc03mKrxto2/XbZdLo5O9abEeJco0U
	 qYxBaIKOMFYbxK8vLJiyc3oafkZarTAlqLazKSrmP3ZKEBQyoCA+dCliue0fRMRGe+lnu
	 gBtZXfycrlc4CPlLEqvEk3g6bZ7hh/uIyBQ4c2tfZh90ymONhYvTvrvyBRFBCMx7zWmAr
	 5SD5AS4MoBrcFc6irsSWJB/5E8FpiwGy7KD8tK/YwCP8LpMmlEPbZsSpv4nsgk0HoxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457E606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7457E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c511c0e2826so701580266b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629715; cv=none;
        d=google.com; s=arc-20260327;
        b=bdBCgs3pcuykOz/S9omGM065gcey56mkRWLN37qrZoEINeXTfr7ID45HlBOc0PhQy3
         4l6oq9uvL/cI9AQCTFDTNfLDMI946a5aSCeO9ZWBroZlDd0oH7KHpPcvpwA/M2oF1VV2
         mimtO3VkxBwKf4xZ7U2cD+HrxU6P/MBLxfXzW68gBRMirpJ8btAxKkoQDoQyTof9HfUd
         obhzjIaB4GuyzUiSKvMxBy3XwNZ5fp5l2oJqzeCKWG9TDIVltzzuRlIotY2L4xSMNGje
         98/WhcZ7864NXBlZy5lBqzzLKU3Wrgg70KiyOkp5ZUL1sH+TzAoBTbA2vP35jfX1BLlr
         GCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        fh=/MEzEGzr3wHkmdItvEl7OvNn8k/x7s8a2XSo5/sPuYE=;
        b=UrAj+Di6lmFVYkQLFydBxMcYhk7kg9FdQ04rn1w81JGArxz/ehTGtAjFGu7ZZm53MP
         6ehgeHr50RJUUMTkeVZaek97/K60otac/2e3IZGJPK/iI2RMYWm2/AJF+Dncna1U2jiC
         KOT3DrThbtEOVpi0+8MQ2/UrRan19RFqBys//agt83JBVBYIwNDwR4cTqJYaQsiWska9
         Z5mXLWLxgBK8GxEUuxSPnXUBpKC/KvYRHlLeEFWn/M6wnTyQwD76ect5znXhmM4kZAmE
         qekrpMBCEPMWJZTaxeDlc4a9xv4CXNEG89TLRtFK11ar/PYJ6MxS9CHr8lfX0HsKE/CR
         fVsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795629715; x=1796234515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=1AqyQGAv6vzNOGgyTFy57snW4o9MHPbh6PVD20GCOIDqqla4H5Xj8jdM6bYO1leusE
         2mp+XMhR/FKdsAuBX0p/3OHWwu7RNsfkfIzdMpFiDHK595hc//oXEYUIrpvvqL5WpUVO
         jAyhWBT8DyonHOSVtxH/BlFAXUHwx5/D639tu7i9xAMGKzj2w43x9OEJLSxenJTlRUKn
         MUr/6UR5LpXcQ6gLYSbTiEtXiu/ubRrYEmAKVXs4URYv7JkSehXOuC8/L+pEqAxzzkaV
         W/I+oX9Ww2JLF8g9gJOmscxkLb3ckyB6CdR09xndpPt3j/vbKQwpJ58eQYfmBMB+LVB9
         ARwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629715; x=1796234515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=ftxAwFnZpVjsfVokjaIl8VpQF+ZwhSwUBplfDmsAXKPcc81VbjtVS61ePF8fyoHpYi
         Dy3OzLtQt3mGMvdiWYX/mdCN1jjEn8whn6wY+WQzN9s4v+nKmG4KJu7GA1p5p5oxjIWW
         bmIkoxjf3Dkgt5udc6xoFUPlNL5PBsMaI1gr6++zFYhH+5jqVJeZ6+vLK5dc5/uyUZ5v
         rO9QLKtfifbDKjAr9hcGrJATenvBczuf53b7asszsoOSQanVn8xGUqwVi3iA37h2Di/9
         viRaUdz4JM1lv8k8RzxA5VUyc6ZyrBcxZ+vaTK6OeRHyWx/3Nn8MpyQvzinZqMwEWykF
         PZpA==
X-Forwarded-Encrypted: i=1; AL+hErER+CgsW9cDYhQsI05OX37lp5WYTnf4jVA31aqzNWfkoZPWXUlv6nWkws7g5+b0UcCvEqhNvp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wAVg+YUf/rtnscGdAcoZpbHPW0/BzMUABYP8cAwOyvfmnsh/p
	zLTNoVEDFA62+ku5sDLcT0zFDD+M1XJOw1Ce+u1UpRd+Wm0C8Ae8nVDX2OAI3/ugy5weYEfl8m5
	x1tLDYf017sIeTCPZvyyrmrcW7y9HCGHLb0MGfnXS+Q==
X-Gm-Gg: AZFdTZdK4E94CAOQJDhLds9WgEgZ+Bv8tWLvP4HS7vgyF5ZsRrU3+apX5pOI9SazYIQ
	GZk0JWILNkN6kQtYJaTgq/nTO1CLTobe3u1zfBOz8MKiua26fgWf4ZJN6ri8sm+4+7ZoLgcswM8
	42Rcn4cSMDCCF8Ix9GctubZg8J/4mk+0B86hUDK0TJBhfOFZtPCs6PW0qoF9MsHZJ+ur3iTHYeH
	BDa1fx8uhkX9kQBw2oJviQX/5Jz3k6x0rDNREjE7vSAie6pkIIunjmIS6eU/fF0eJ2bNpkGcaqa
	LBqwsk06eCDm4rZ5DaIcco2GUyWS3xWUTetYIMHKMic50PpnJRvZqdJMDyc0eg9JwpCmVWmPefw
	KApTqOdmNAyBkDwSc6bGvvznCJbvYtej2FzAr2M/HT+9R5oidPvDfmYFPfTgDD9znipNC
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c513ac496d8mr1123543566b.44.1795629714600; Wed, 25 Nov 2026
 10:01:54 -0800 (PST)
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
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch> <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
 <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
In-Reply-To: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 22:01:39 +0400
X-Gm-Features: Aa3M54rXKAuPqQg_Ygp0o8wODv5WUBqheLR9BXAdmhPLGte_-jSen4aa0CPalg8
Message-ID: <CAKTNdwHugVHb7hBzKHdorrCNmBanZ+k21GdMJieD7=_Z7446bg@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 8:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > That way of_get_mac_address_nvmem() just works, so the MAC driver jus=
t
> > > needs to call of_get_mac_address() or of_get_ethdev_address().
> >
> > They still need to relax the size check as done by patch 2/5 in this
> > series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> > prior version of this series that attempted to return cell contents of
> > different sizes depending on the use case. Currently any cell size !=3D
> > ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.
>
> Ah! I had not looked at the whole series.
>
> Having to change the core like this is an argument for doing it in the
> MAC driver. It asked for a MAC address. What it got back is not a MAC
> address if it does not have 6 octets.
>
> Please throw this all away and do it in the MAC driver. If there are
> multiple RealTek MAC drivers involved, you can put it into a little
> library and share it across the drivers.
>
> It is actually an interesting idea. Maybe it should be placed in
> of_net.c, so other drivers can use it. How generic is it having a CPU
> ID in the OTP? Are there other vendors doing it?

From a quick overview, Allwinner does a similar thing [1] by reading a
"SID" from its eFuses, and Amlogic [2] by reading its secure-monitor
serial number - so it's a reasonably common pattern. Everyone uses
their own derivation functions though.

I think I could try and add another branch in of_net.c to parse an
NVMEM cell called e.g. "unique-id" with platform-specified derivation
functions selected by the cell's compatible string. Then derive the
MAC index from the OF alias, so that the phandle argument can go away,
and the numbering cannot drift apart. Will send a v5 with that
approach if it works out.

[1] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/board/sunxi/board=
.c#L783-L828
[2] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/arch/arm/mach-mes=
on/board-common.c#L79-L107

Best regards,
Alexey
