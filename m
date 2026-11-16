Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794795576;
	b=o8HbdJ39vPdWAg62lXCjPTwIhUP46OPgIdjsF4EzZxLbgJOin+e2+CsshmRGAgW2CTLt
	 8QU4jkP66iL1RsI+fzAlEaqPPdQZnDN9XP8sWvUFBn2XBTgRoGbLEEWAd8JDU9t2F+3az
	 FhN26g5R3DnKB0+ewMPjaFQL+VdRrp10ZOxaVSWGh5oue3E3qAls30ALZz4pJkiCmEJvV
	 vvmm8idpC/4sV8kzI8GS85KTBuEImRb6x66PNzKSJThiIMuFfNTKMy0xOXQUXj/SmS9xP
	 K26sWYKViXJBdrbMNfk+BIaRoAYHPxI6J31BNI2Hj0xFvEGeUMzFaF7b/w3l1QAKzfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
	b=izDdYIx4jq+YJSuUzgHNZWXdVLcbepGcJJ5TR0kBVmM+I5e6xRY3V14bYWOutcoDn6fF
	 zZ+JP6+fInK0IqnaNgy1L/QLdLMfApmh2I1Fh2QgkreXsqUKajZwV5MPzxTYfjG1K3h9u
	 RnLlIDI63mw7ltM9MXajIzz8FtwBa/PaOF0YWJ2yBTXjFZERTlX9f/cj3UgBhMGUQx4uE
	 GSV3SfNQUQcxu02UBaGGCmtuJtgr6rkBB8mpDFfeNc+gdvU/y7U+3s2gfNaqZFXLqG8d8
	 TdU3EmIzvQ/pUEgKkmD4j7LTBwqdFfzskhKwq2EAn43eeUVgANCiIDfczpWpHr0qKWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+aKieXX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E05606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+aKieXX
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso3048619e0c.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795575; cv=none;
        d=google.com; s=arc-20260327;
        b=KcnaIGMOKtqA1nETQ2iDO2IOu2ZZW/6DXX+zzzeviVHbwFHcTxiG78+Cx6aw8Tu6gI
         sEfUzqSKoUOOdYNzRuT0LoLymDcwBkf4cGRrFOQYvB4S3zAAfUHADBdSFO3SCrwDzxVw
         PvnuoIvbe1/0qQAyNcBKUj98Pj8J8umb3OqKuKRMg5U/+Oxe9SSzq1MogjAH4WdP7x1b
         MfVRAkibnfxiiUO6+6XCsjgiYP/FWAwRS9ASDHngR1L0ON+CCiFoE5zadvBdbG7g7ynZ
         kMuoCh8AfrFdYEsOqAaRZQdBB2RLooRk4P+bN2CML8aWqLOV2NFwNwsAlFYzx8DAtQR8
         7MFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        fh=WzQAcg+js5PRHBZczwSuQZLlhLGXMyZkQsus+tNc41g=;
        b=e5hUKYVSHkO0MbpdWxUeZv3OXt8yJUAWciskPyLZJSQ8L6TkNIUJHs1zekrmNUWCB5
         w0SoXx3/bwKT0cB7yjWQdnrwWwOdUZpebRPEqw7S8nSZAx/SIZ7HdDsuQq2AzDj8gZdS
         LiuMyMdRMgw5OOC9ipE0mMDNHmdqQkXc5S7Z2tqSuEEHIHSu37DYKGmdK68rcFcNtpld
         kYSp3faKjeRODyM1OeG0EW2/Jf/7/fYLoTlh6z0HZ/KaQY49E9aZ8DPxvOwUYgW5P7Ge
         mAaODIeO97v53HjDpAXBbd9funKMpC3GGIXK26xoYiZNLxRLuGcXRhxh7vaSsEcP02Me
         k/Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795575; x=1795400375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=e+aKieXX28wy1z90SvvDUEfXG40bdUCilhlsbWWtTSVtxr5Y5PS9tcVYFQ1wFiAp+0
         YzM8FEk1gj97v3jGqqDApXL8b/Iim6PxB0Yipbwvu04BHckRRlrzuGO13wodnsQ8sA4s
         Lwcw1wQMlYWTUDYnLqDd3UWwuBlYjjl+cyTrUmGCO/ycrtG06sh3/3ZQFsmvXR4uGRuO
         iFL2eykTbnoKHLNzlD0ByvodwSIGaQ3f9VoEKuP1Rt/Au1gX6LTQBgRdsM0PA4K14lXy
         PwBifVLntfO5qVwJ0pi78vyqqmrxP7ZuOfs40bXQEdinRoDCVJN26M908SDujOm6edYy
         Ayvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795575; x=1795400375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLHg/bPQc7nmGVUQ0fYMmT5qdFdLgHhxo+4OoJyT8w=;
        b=xtO+543kEEawy7th3VeazJh4Mn33tR9dRK1A+nIT5yK7EY+3NZq3T2M/Ck7yT3vdAr
         INRpmWWLJuGLZ7N1NLNsLPo4KJhw/QaLx3MKuYT1/o84wpwyK4Xxj7BII0Xc4c66Ttgt
         RFjhwLYap37YGzV2ggjOKQQuGFKMZvFZj485sIdNzwDYieKWo05T27Dh/Gyp8CZe3aoD
         nTJWOtms9b/6p7z/Bt72FSvqp/u+FG0WbpLl75PFXvRlTuS+qZ68CbiZKJ7c6ST7nN1t
         QWF+lsOZ6ub91/OQTTMRwxPHVJSc9+EP0Gk4N2gkT/B3eqVkXlAjdN7ki7sec5Lv8j9p
         k8Yw==
X-Gm-Message-State: APuU4Z875TrmYQFb36yWdQ+vrl9o2EoApe1aaXZrr6BmoFb6AhVaEkHS
	1eXvEUMpzxt0iEPAGwQPmu/LjvRMXnyKglbppJVL2F/nmdTaPlyL2yCQwX2M/9RgbjKFVLUjWWr
	MddghRYWLZppZ4n0lAeUjVS8QkVuj+Qk=
X-Gm-Gg: AYBFou2ulCc28y9UI5B1ag5v4ihq1XwCZrzIJkQcaL3MdJ/6hc3yd5z8um5m2OCOskv
	Y3d2veDZIFmBs9FcDx4joofOWfjLm4ALc6BdGzeWGzkNu+0hk6jcMRbIRmRqyhnmWTgMX/h8CGW
	jfsGR0AFGu27J+ORgwCBHytU+jlri21XjvJcBvzMsFM72LE1F7Ywsgtyr5MKPNkvqFaGiYAL1Dm
	1cZxgFZe6YWMKx4hNwFf9Kb8ncw4EPpUcfswoYMfvQelFPSTVmMPrgpVinbZbUAovbZKZj/trSh
	ACDgKohn5vOGOH8nCpGB8iTzd5BgJc2QCH6cpgtp6/hXH6tj0EKtfSMAjm48tgr1O3cXk1DvtgS
	iInpRPv95EMVOPIvo1xQZDmipU1I2BSftj/9PLi/bzkBTRPlfB9JN+TY11f0XoElLCRbbZqst7k
	4Owq7i95hKWmDW8vcTJbUsZM+KV2LUcj9HR7s+vHtPTygq0KgDGuNUxc9X1LDinO2FzgL5y1YEk
	X5RQQam9sA/fGFVPSnm4gXMJbqL7A==
X-Received: by 2002:a05:6102:2c8d:b0:7cc:828b:421b with SMTP id
 ada2fe7eead31-7d64d6ca4dbmr3337958137.6.1794795575374; Sun, 15 Nov 2026
 18:19:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179479100276.3291.7162632058743254408@kernel.org>
In-Reply-To: <179479100276.3291.7162632058743254408@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:19:24 -0700
X-Gm-Features: Aa3M54oUIJGqhOxY6fZncLdECG4spZRJMb8V-mVzn2dq9iEZ8uyZ_G6ksg29zgg
Message-ID: <CADvTj4rK0Ew7WDKoxmYhf1FMKx-xZwkhAKc-ABJ3EmOkaSHLPg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:03=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
