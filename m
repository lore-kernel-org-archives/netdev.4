Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795194980;
	b=lrDficNksqqSgNH1Ja2I/9gNFc28Zuf43xowLcXPrbeHHDR74h2sOQwM/vphfuLZXivU
	 dknd9cOshcySfBLPunKD+lSLS3b5omziAVf50/YJl3HNpTjwXFUj2sw0m4+Zyd/hZ59+f
	 WvpiAQWgqZSYAB2UqmeiaRYMxvalq6W0aduDiKAaLajTENl29vK8jm/UZJXFekxSnyRQi
	 KU70P05/+yauNYDhhcQhzB1D9ST4vBHQOPGySVCjgfZNB4LSsRXEPm8nx4vbi3ZJljQo/
	 2C8YBQyhnKvXW2hW51eCWqIi+5lWfKtGl3a3UaO9+GTHd9HuryRqDhppFetABiodjkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
	b=GE4rSPxljSWCQ8na51s+vjEnn3IzaL1E1lYsia4J/TIxewFvHCwImy13Fr8gEgO3kMDS
	 2oNYHIRq6elTk2oLZQRDiO6fs8BZEUZVl0QBP7HQwokr2MzHA5D5e/jaPqMr78zWKqMgz
	 cxLNJ1i44nTbBLOOB8hYjswyDk4dEX2Wtk7bYCj5GEw7lz5c20Ti54YCpqaKKARwVQ7uK
	 ljdgRJEZWklevE3pJ8tvyHBqsvxLT3F2pmrirbrAXyfrEanV6wDcSx+Gt5gHchreIm2tU
	 0X0UqReO7dNWchImoJs8KixmNIiJmqndRRklNov+aw29qGUCsFzlcgLaSgTG59MEkcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QjPEm/jY";
	arc=fail smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D445606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D445606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QjPEm/jY
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so367491cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795194979; cv=none;
        d=google.com; s=arc-20260327;
        b=Qu2JWwXik9OPVOf5LOIbSRdvhDWk+ZkmvCSzoNX9HV3AlmMilstQDS+OJaqDJk4dVl
         llt49Zb7opKVo8zX85ktnjifzguIvmcL45ffzTe+W1jum1W2fMl9Y8dKCsC8pXUHkmOQ
         0X2F8AWGtqkJ8E5mJrdEWfiX3TXXd+oQTYB+cydj1qZSa4D0Q6L1QGtgSL8jOI4GlQ9n
         Hrm64ypjj1uUxrpS9iaErzs2Z3o0jLL+BVtweLqUhEJRY5Ebj8Jm/2J9lUDSPr3nhFXU
         28UqQhYoXLhiBmvjoDjacSl6ZR2oNdyJuY1WqFdQRLvechngxt9qqOGDqzKT8wQ7s4Qf
         /eRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        fh=pj0sIwAjGS/XzwHzqQS3e9CbwK3ldwuThUYzF9dYH0U=;
        b=rI4h2knNo55vsrUfZtSKXaMcrZMVjH216UlSAYKrwgQv4Hn8URDs0i543rnDWB10hn
         Av6fD4RMdE7W44Lf14IKtE1f+F9IxaY1gArAG0eCuCypN2JPYh1fe/QmRPLUcXBHoMcE
         Y/3nc4i7gck8zjfWFOeM8yWuP5XL4iAZHx7GvxqQpGHwQup0bZfAnPu/I9UmhDBxjf5s
         wATfrbogMkUbGfozThVWMequu27kkR84dwaViUyoS3dkKi4nY4XmVS3/K1OjANDbGK4Q
         TsMIsSsl5QnygD3iQkFpTWYFNmOZAutEAi+mYNTUc2kUM22iS953Xv0l5lv/LRboQvPs
         SmJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795194979; x=1795799779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=QjPEm/jYv7v5rK8laDVsh7i53DW3G6IExbAR3o8TpbRfwBMNNfxIf+FgL2MBlQXeFt
         QFDDMUF9M4BHGZF8L54/vY313d1QPJdu9OTWo5anjgafVFBCq3wYclPnL7i5xGlB3UWW
         P2mEu2Qzkq65B85940lRCMB5TCLuhmDYLQCuJ4TvZ63vG7FJl8dBFFjFSsgj/w6Ewx3g
         fQaPInJ/dH4H32egwRtRH+JFpw/+ywaSC+QLpvR5YX/n3dvyxh7+0gXu9Tjzhi4jEq9c
         DKUgsnZko1fKKooQ9w0R0y72E6TEsl0xREQnkA5RF2A8hKfMuufhRC/mP1xvc9jO2vEA
         IP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194979; x=1795799779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4IajQ4X4VQv6WpLtpAM/AdQqaCCgwex0v9UfQQ6Tfo=;
        b=EffYvE69kF5d0lz+SLJXNl2O5pzBDertvdvVRZ9z4mDcMF1HoPe+/ivygPTvmH2TIu
         PQt0qG52oaeiyLbIX33eb5LvrFOw+4/n5EU/4hjsQQK3WUAOvmXLEld+Mm/HkwKEUiqC
         LRvsC7BWJrLUw82iDKNT0uFW6GPXY4pb8WSqnTK5/ij8h3n2jMdr/N1FvjNpPMt/PU//
         lIMx7+hSHbgVaNFMeRzqJkEbKV0LO0DmegsGhIpBmHszoN0jYSHer8AqqGeOgRbNTnFI
         sXQbOmRJadcu4pJA1mGVGSebd74CqvuCrTW1WWBvYbc1+vC3lCxsg2CoBADu7+TZJSNx
         iJnA==
X-Forwarded-Encrypted: i=1; AL+hErFB25sHN9+0ImutTTp5xSMZQWFyKYawHrF8NpW3uQjKfomQ3XnBCn5bx24YI9Sp8bPQrpUO8Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z853zAX6U0ZZywjNRjUtyWqqGhCRf/tCwEk3iAn5GtbGxfphjJ9
	e9sB69YCX6CIVjz2o4rYyvnmRtcJX6UqR3GLgeEG4EGt5FTZZJbXRSmxg53U9npVKEeaEdSYAuw
	I0hKZ6Be3jz232m3sKfdKmpg4ovusHogaDLBJ0S70
X-Gm-Gg: AZFdTZeFglqK98fgVzXSsYXW6xo0Kru/XcIHQut40//qEgs+ZLgt4wkCBh3wrm05ruD
	PDbLGZ+SQcIQxlM4s8gJ+gWiy2Z/RuzAw6xTdzfDK6Qg3nmUEhkCTSDI+SIhc3V0Vh8m7TKSGhJ
	8zv4+jZJPSEm/7u/GB3hAFAc1+BrweQ0/YyUPCdmcnsRBy21AoJm0rPq8d13lijYOhrtDRknqZI
	gXHf8jwSN8kXeb0gcfDOc7c/OmBhfD36q9cFuASY+MlGc2f3VzCgZah1sV7+87RydgeRKCq3GJy
	o3idnq2+3dgr+JvEvrVPRX/gfReV+yFJfGDVcMWtKpWzDoiQuv2x3hCYoU5bmMvSpgi668f8DPB
	Oy9r60rPpycRb4y6LyTIDCzSki5UGDSrFgEVO5J4Xk7MJHiuLU1V1OoldaQ==
X-Received: by 2002:a05:622a:5145:b0:55d:74e6:e03 with SMTP id
 d75a77b69052e-55d78c75bfdmr24228621cf.0.1795194978630; Fri, 20 Nov 2026
 09:16:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119171021.1535172-1-irogers@google.com> <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
In-Reply-To: <d925c794-579f-4b7a-9ff9-8502d79b97ca@lunn.ch>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:16:05 -0800
X-Gm-Features: Aa3M54riczv_KPXhd05XtH3JpnS1jtD7HRpnVfSKMpo6JVR0xKjJT_2YvUjV8_k
Message-ID: <CAP-5=fX3AE_XyUbiZx+7umZGH0ER_hjJwGs+g+Afxk4A8JuyLA@mail.gmail.com>
Subject: Re: [PATCH net] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Nov 19, 2026 at 09:10:21AM -0800, Ian Rogers wrote:
> > In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
> > return value of both tg3_readphy() calls on continue and never checks
> > err after the loop terminates. If MDIO reads fail across all 10
> > retries,
>
> If it fails 10 times, the hardware is dead, and there is no
> recovery. The best you can do is make the probe fail.

Agreed - propagating err out of tg3_phy_reset_5703_4_5() does make
probe fail via:

  tg3_init_one() -> tg3_get_invariants() -> tg3_phy_probe() -> tg3_phy_rese=
t()

rather than falling through and passing an uninitialized phy9_orig to
tg3_writephy() (which is an 'i32 noundef' UB in Clang -O2 IR when
CONFIG_INIT_STACK_NONE=3Dy).

> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> This clearly does not bother anybody.
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Fair point - sending this as [PATCH net] with Fixes: for stable was
wrong. The motivation is cleaning up Clang -Wconditional-uninitialized
warnings across allyesconfig so the warning can eventually be enabled.

Would you take this for net-next without the Fixes: tag (or a minimal
'phy9_orig =3D 0' initialization if you prefer not touching the old
control flow), or would you rather leave tg3 alone?

Thanks,
Ian

>         Andrew
>
