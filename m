Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599645;
	b=DOXX9NgwMbsMEkXN9hcE0VUzPjff7AQQrNhwCaiJy6Dt+XYRxBQEtgPKkcoirSyLuirb
	 JI4+y5E3edXAe1e0TClhzSJJIGr6Is/YhHSZsFwXxJm095kVq9KN9hhH0dijWkpyRkLMJ
	 GgwaRnMgAra8VQIph3Y4QdayhKtEtkpFguCCYUIaqh/5FMvnHGopwHxiPiCOHsPa1erzN
	 os+I8K0My3voN071/fL7vMc0nED+Qg6n29h0aLdmAvLTLGcEC7nO8Fbl+FUpHIxs0FP95
	 EajifiamL9VXtWUMX2jN3Eebw4TRHRAi4pEkvNf4RG7t2JPsiRaloU7hrt1yeMdxWRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
	b=dC6bJSYV91Gc+/wm74WNsIiTKtygvOUl0KWPPzHZS/hjf0paHM9J1uQV9C8S1CJ9AC2G
	 PZ12zwHl2tdqRYB1X2h6bLmPaZ33QZfFvZpwaEyMDCOZfroFNPsCbARje3mJb35XJwg0Y
	 00kKmTpcmMmHHkQKg3BB/639W7s0PUDiWkZrsvvFFZN6aB2itqXqfeAr7oBUVG3j6xXp4
	 qhbtgtnrmjsh6PC5bQZXMTsePGg6ZHAPP2/IhxAJJjX6L3QFKeMAsSym5Vtg9LDj1MQ/L
	 3MzqBjzUGuCMTWovHFnTJHRSCLAlYjRJ97ygOiCjLjwlR/7yy0yW0btArJYC9PZ9mxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB120606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB120606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USogZ0T7
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6e560e00a86so3635409eaf.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599644; cv=none;
        d=google.com; s=arc-20260327;
        b=e21KsB1Tlb4URD5MfjjkfnmukjcolJT4YUQ+iFcrh7SDuSoESPTfAlQ1SN4+v34BDz
         1OHz8y/8r0LQZU9T3UBfmWu+crBHaNTEcsfxCRQmQn8UJgTOPKRNbSE6DfoUszAtLUNR
         U3CP9+IqNyShoJacUwXi8BIHJ7ho72PYRPzV7ey6VQ2hrI2A5uR6VPbu7rEuIANjOQ1r
         bVwLek/F+Accycgkc2sKIVTv60ppH7FG1sWv90Bm9cT4lVZseaqzmS13jQQeUK0EtQ1R
         SdWThjPxkhDACgh6cdjfFZTTA5jUs2xRe/DaR0EduXAM2rIJgPzxfwJAQXcSYW7UVVz7
         96Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        fh=vC0ircawusynUPLqLYqV6zmqa7rvAnNmLIv4Yzj2814=;
        b=iucmfrtxQNuGShJNygvD/9lLqnuPNaJPXO+LdjLzdPlu1St0abJWzXzxNc1icvZTij
         YwPKceJBQW3IaktkmNHozhmNHhTnRfAobhL4A/KM04oBIcH9+JPNWu1SWXjSHTSbSSKT
         ppGob5HuH1L7J/6ruEiux5FwzxRopTvQDtLBXrYphijgUZhO95p8DK2vFs42MAyOK4vN
         HPrjKKoQFma3F3GiGjIxbyVlv8zEAchQydpM/ulj8nE0Q6NoRtVzxFngGamAbb3M+Jml
         FsNp7MBqX+EKiCbmZQ4FX6bme82fDL1uZdG6mhs+rF+MUQH7js7wQa4nB451ObvJtuqa
         WcCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599644; x=1796204444; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=USogZ0T7/+oVKbbiq10JBY6QO9BLjWfuL//cJGrm69dZzwe3xcxXYfejWFRKMykHAk
         JLbCM7dWn1b62yVI8kDtdjJ9tarlF05DXeEiA2BQyimghQfJ3fuol6EWB2R5Eoa6bUzM
         C9i36emuQHVamCvtmNtmFGKA8PGlc0pCFIHgvGVazJO0/a1o9s8WiLhfpIn3J7wWSQsc
         aew+7tayon+TGltP3Ort73UMToKHA/YL1b3IIuT/dXMd68X5mCt3ATymsx8R+q4YMvMR
         BCvRazhZYOuJ+MBQmEsw05DReJlUv3y8mSfzpgzDpJBVLz74ZGhYl55Xks0vpitxlOw9
         G2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599644; x=1796204444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pQwGXJSXqljBjagDccQ7L1MMOs3fUlkutet967RTyHA=;
        b=BQAaM0DXsOeU4AdpL4eAojJPwahk5m4CfundFX6j/5i8OASWIh2Hk0fX8qse14j1ls
         j7eQfSi9nlwPXH651IQ7quEIT1e1VfVup40XXDwbakfN/U+dE/nyCtsE/1HBJ1z46pqd
         SbY8BaVecZfCYhIhMLF0Y05qaaOUalFj5GK5sNC/Kx3SEOzUGWJy6H719o9NCKoCt8U+
         nEUR0iMsH1Ai76oFeFS1+fFRMagcpkMDaf/pJhlUG46EnJUutSdsL3ZxitiyL/EpZv7a
         XvPSAoTqyqblOotpalwK21H8pMo4TE4eRcgZvt7NKyKLohivZCxCzI7mVmg3Lp51L3Dx
         HSzQ==
X-Forwarded-Encrypted: i=1; AL+hErGEqiUax4FbpyRrMTNs8mzi4Uqyxv57J1haB/1C2Zp5r1md6tBnZ83LgxW7yb5hV3EoDL75ZDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yOxvb/PTDMDStKJ9ZXRwaxOho1u3DUVz6eJU6HGPE0SB0SQZZ
	Ol3pLMzBZ/KwH6TJeT6bpXfyXUBCugiQoctDk/jb/KHW4jp8QcB0HKYpvrGp5UTkHASOSeNd38u
	pAql1gKYFFfVt4IhAkY7Z1mKMcJtIuYs=
X-Gm-Gg: AZFdTZcvV37gDnnZWUBCumEr5Lb1xd7bWDfJ0ESAwtQOwwmXxj1sdBKWKnICXgRrZ/+
	ZIy404BTyg0I2Mc5Bvnr0WDF+CUsltXiUDxry2dOFB8JC1X9z1cU6cltBw1LEnODC8Huvuw2IyU
	ZNhfa0okU76RY9UOTJukWjJ87L92BPmYrxpdzRCUElpq9qIBTCL8HFiO6jteZKXSO6HzkisoCiG
	l7SgndhFd5U+x+4B16j5V7x1ASpciIYsqzQN9HRNlbTmfXFdeBbacioKb79/hYCDAfzOdOMipWh
	yUaxksLkmbidrEJCvcN29z69MYP19JBtGXzuU2IbJqs2suCX1UhsrAx3doj3SA5YAC9Pve3Wrwr
	52SxXGXAe4Sc9uxLs4/BqDWIONeZBvDyl0jFIQZ4vq2sBMYuAEfpRWSZKjMUaMNO+gpGT9S3ZtB
	Y+tLOT7aYq0F4ShEwZ0fT0NG2FsmtL2ZEDL4pgArA+Ln9aZ5GBGnFflZSC
X-Received: by 2002:a05:6820:740b:b0:71a:ff98:1734 with SMTP id
 006d021491bc7-71b395674efmr12396945eaf.45.1795599643823; Wed, 25 Nov 2026
 01:40:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com> <20261124.215747.1090155063373507910.tomo@flapping.org>
In-Reply-To: <20261124.215747.1090155063373507910.tomo@flapping.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Wed, 25 Nov 2026 18:40:32 +0900
X-Gm-Features: Aa3M54pIN7Z7-kOVJu80h62SthWObgtP2wcxlpS5G_JuF9aGWICvZzW1W-c0JhI
Message-ID: <CAGAB666qnAjFnf41PQmG5kWWSb+Au01OgspPhvREotLGXTYwXQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run without phy_device->lock
To: FUJITA Tomonori <tomo@flapping.org>
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com, tmgross@umich.edu, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 21:57:47 +0900 (JST), FUJITA Tomonori wrote:
>
> On Tue, 17 Nov 2026 19:36:18 +0900
> SeungJong Ha <engineer.jjhama@gmail.com> wrote:
>
> > Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
> > the same claim but are called under other conditions, and have no users.
> > Patch 2 makes `Device` generic over a lock context and documents when
> > the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
> > the `MaybeLocked` one.
>
> Can we use &Device and &mut Device instead of the new context types?
[...]

Yes, that is simpler. I will do that in v4. Two things to check first:

- genphy_soft_reset() reads autoneg and writes suspended, so I would keep
  it on &mut self. soft_reset gets &mut Device, and the SAFETY comment
  says that the phy_mii_ioctl() path is outside the guarantee.

- read() and write() take the MDIO bus lock, and &Device cannot say
  more than that the phy_device->lock state is off limits.

  In read_mmd and write_mmd the bus lock is already held, so they
  deadlock. A test driver whose read_mmd calls dev.read() hangs as soon
  as the PHY binds, and lockdep reports recursive locking on
  bus->mdio_lock. The path is phy_probe() -> genphy_read_abilities() ->
  genphy_c45_read_eee_abilities() -> phy_read_mmd().

  In match_phy_device they reach a device that may be bound to another
  driver, which the netdev AI review pointed out on v1  [1].

  Do you still want to keep these callbacks with &Device and document
  this, or wait until they can get accessors that fit their context?

Best regards,
SeungJong

[1] https://lore.kernel.org/r/179454612500.2199510.688554972467066283@kernel.org
