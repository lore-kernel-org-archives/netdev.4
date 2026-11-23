Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795403528;
	b=OR4ZfMqw5UR04R4+k8GRMbrHwF0B/aqs2X9vqA5I3fiENN6xW/v2cWg8fGbsASb27oIP
	 o/CSCrQB8h2UJCrOx7+Eu1zXODTKIJ0qu13PROPgWRzl9N2ptx9+3BUYMdJHUmmzPS3gY
	 nZykrqMf5AXYKCkvhB1uIaevPBUxOxw9foJmRuE0ME0wRwNRxBo7A/pJe/n5xLDYNQ9us
	 ejE7T8l2w2HYSLeEHLP/APPdaWB5LtjCy0qRy+h1gXG6UI/s1xbJDpni4yAIPUkBBrCGv
	 A5ljlW5Pw9p6kKfeYv1kqt2fFuekudzSYi74dU9rQ5BRdDcvqqOxBAylMHaYNoOzqFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
	b=qvlkKQt3BN4y6KoE1c2LJ7hPdxIXHQq/tmhwZwxkvAv22Yog2Dtp3HDPF8nI6Xpoxcu4
	 6lwwT0SqsU6iiGCwLzQvObYULc5sb73sCiH9MxBqev55E6RnrFaeU+rOHT8X624s1xKYm
	 mQ6QjUXoIAA6W84uL+iOfOzgFAHnH2DtfhgwF246XD75jKGsC1rcjRa5ZFtG94+atvDtk
	 X4vS520EKudqYuszjtnPAmT7e3dOzXAWMkYNX9EGLXOBqkvTv09sNJ2SLc/6T5aQHMyYS
	 /zU0mxXrE6VwRtIR6LFhj9jDKrnXQsgujW0ZfSyrr/Pm2lLKRw9cA9viHTiVSlKQ4Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+;
	arc=fail smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145C606A320
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4145C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jARPTXN+
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f1fso2340479eaf.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795403527; cv=none;
        d=google.com; s=arc-20260327;
        b=DpxknEWPu4yPi82ScrsBinH+ILGn5MdH7HQ+RCyt8g/pA7WoJ6Dewnl9EVjo4fAk2q
         ZKyDx3xk96l9jrvke1kB8ROG5dvLFK0jZhquD6aCGMdaZ2Fp3iTRFa9Fjaq6azcIBw2T
         lgodjFaX/soz1L8WdNyXjC92Ey2Ba4jvlGebrkNBe3J0B7JI5GLCjZRG8EMpToMwfTOp
         SkKU5W+PLTxHnpVmUkmlSxYwDyoDvcS3xLzH0lvVJObM2+g3GSonmaUckILROreduUho
         RLabDNTW9Jl6Fvy9CWPOuQryoMw/M1Ta28XDZ8ER8uv5NHPe0CejFqqBUDdoUMQLhlS7
         jXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        fh=zCbKMPTG7e53VVStjoSwo5Kqpvh2TDsx86mtuWKZaK0=;
        b=iqCukoGJ3VGNblw7l+4VAuIrx6TR1yf+Z6nmrAnT/AnwelAUMsIEX9Apmx/0wEraF9
         HWohNFT/1hx8cFNq8Osms2GwLhfOUDJqoyH809brFKwpNJPZANP9vmvX76YGARlosVa7
         HCLeX+S/EREbcywufNntjD/VgLg1vP/n/TDMhE5m+5ODjAd2b5RbYOhAsVkaiTmxPvKG
         m4iSc+Z7WrO6OXO9cKR1QLwE8sn9vojgUui3zawYaAoif1wZuOtj1z5SdxgxtcdnEfaK
         Y23AxsRHobxBdq44CTVktWy+CeStAP8Z3s4PjhSr5kzRjJsO0dVf8pX7PVr0SDl4BtMW
         d3aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795403527; x=1796008327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=jARPTXN+jk/1Wht2ZzTp8EPu1BBNoMz8Qsz7W+XMEPM4qSPogqmAhgHzkL3bS3CdKw
         1kHeeRhiAkiYQo4Z+K/Z25frEAf/LavMCOkJXzpO31iKPz5HzqF5nmHu/qcU6t3ESDsn
         Z9CaV0FKSVnPjA9srIhsNTPdEN0OQCKAQT3iZvIjsuFXgpsnVHfL0Z9rEHcHp9moy8Ez
         nVnTp0fXXEZbfbN2PlDtbnFmwWp3wDXlA+bnCUC/B4Tf0MwAk3qRs0qSkebtH1UpKJt0
         iCveyniyziPI5rq5Vli46XCg4DJH6uNLrKEcoUpsIJCpabtQgkBAW9v6TH6yxKbwqv36
         tnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403527; x=1796008327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUcUnSTExnCl7Fk8S1+uLx0OJdb3KlS0YttK9oHwo98=;
        b=arESsoBZvKUwvojbCe8laXZW8cnOOkcgWFK834QMSr3BpSo2+HCn8bS7GlJ4PPnyJn
         roxD9l1RDt7jvR+wySIjp3Lj33cxzqjKXlXVTg7EFu9FSrd+26fBSgphgAI1Au4tyClV
         /glqhdjHv+DRr6MwZiT9Jfb2U8zcU1Cauted8IxfjKgDJpp0Gk8CA++Ch32hXumuFWXY
         Kq3wzArBCPNfFbhN5Ds1/PHks7dV2WRvVtbqgZq8s+dmtxWHAkUPCiK3xXMug5aN3qrf
         IPUe/OHz2WY90oeNpsassgJr9PJ1C05SGrOnS/Y6qUXxHIIq8jlc7L3mHxUWov2PEFWo
         VDJQ==
X-Forwarded-Encrypted: i=1; AL+hErGgrIXOA3EwzZhOhAT2rRH0Q2DcFDB+PO+EtLfNxSUnLxdANgcUa/ivkAb8bBFRlaATup5TLr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/oHTTouu53j5lkYoPFayQ0fE95NaOOfqbJPIpFPWMxWFws339
	jWpiPUcMpk8W7kD4DI6sMK+erTajYTFYALWF7n5R4eIn4GW8nJUeHBDHvdkRk8LAqWVnIFkGVHm
	o2TGBws5MYM02cSfc/LyUZcyEmvHGNQc=
X-Gm-Gg: AZFdTZeJ8KsHBmgb1vzhDCUL+v163w5XOYK2blQyg2PH464q8Gmh121WC8eHo6LD4IB
	xs9UBND0Ous9z/XVw7qQ542N06yg6p5ce9KProuJCL5v/y6LLsEMZmi0HzzBzImhgL6GDzGkS9W
	mAXVISE0PUvobQQ+q1fxhCHzP31MdboRuR9jnQLBRUFx+tXaaJAlCsYfpjZhLMvAiQrrEOzn/9c
	zvAw3+ZfOzF6ivPWczqePGRSk3W7zlKIn3By4BVJ7oFCzz6W3KV3Mz/U8G/7VeI+mpBFE+Di78N
	7/upoER0BipEDPTcev7HvSRpZ2gy3cyIMMZvJHeuVM+/QYn4pHVMFQ4Mm+E3/5kwULs9LpORRX0
	luf5D3eNfr2gReLv0UZwGMxxLmHajkIq93K6rLuMvf90DDB+FlGYMnlzA8qpVr4e7SVQdeHawTn
	IwY6qsauilzi0eA7pukkekwUbKnKg1qcTri3gSMQG7qCq0h9shT5bdpx1p
X-Received: by 2002:a05:6820:809:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71b39400ef8mr8589110eaf.17.1795403527106; Sun, 22 Nov 2026
 19:12:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com> <179513866237.3136.3197734576083995986@kernel.org>
In-Reply-To: <179513866237.3136.3197734576083995986@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 23 Nov 2026 12:11:55 +0900
X-Gm-Features: Aa3M54ounNdHIeJr4P5hKagxZM-CAo0cFkrf6E_mlmmljBCkgRjNgLAoGrLJ10M
Message-ID: <CAGAB667HcHxS-XboSz559SG3tT-RhVmZKt5McWoez8iwuUGq5A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over
 a lock context
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 20=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 10:37,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:


> [Severity: Medium]
>
> Does this SAFETY comment justify the from_raw() call?
>
> The new Locked invariant says that no other thread accesses the
> lock-protected phy_device state for the lifetime of a &mut Device<Locked>=
.
> from_raw() now also requires the caller to be in the Ctx context.
>
> However, this comment and the Locked docs above both say that
> phy_mii_ioctl() reaches this callback without phydev->lock while the
> state machine may be running.
[...]
> Would one of these work instead?
>
> - take phydev->lock around phy_init_hw() in phy_mii_ioctl()
> - weaken the Locked invariant and drop the accessors that rely on it
> - give soft_reset a context that does not claim exclusive access

This is why the Locked docs list these exceptions. Taking phydev->lock
around phy_init_hw() in phy_mii_ioctl() does not look safe as is:
vsc85xx_config_init() takes the lock itself through vsc85xx_mac_if_set(),
so it would deadlock. Fixing that race belongs in phy_mii_ioctl() and
seems separate from this patch.

The other two options would change drivers: ax88796b_rust's soft_reset
needs genphy_soft_reset(), and the Locked callbacks need set_speed() and
the other field accessors. Documenting the exception is the minimal
compromise that keeps the abstraction usable without changing driver
code.

This series only separates the methods by lock context. Other contexts,
such as the device contexts (Bound, Core) of device::Device, are a
follow-up.

Best regards,
SeungJong Ha
