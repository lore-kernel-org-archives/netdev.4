Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896651;
	b=eLQuSE0oh+g0Fmjl/7eTny54ny19+lKF4+XXZYX25xdhtu3E8vwvC99CEmbOksSR4bYE
	 EwsNpuk7+l0vQhyhCDkijGC26UiayM/n+Lk0OkboJNe6nRqt17DVSnTF3CoOPJKntDMSy
	 DCOVPWgxd6+tq784jDuB6XEsgddJ1WQUVrTtEDJ2dDsuHHGhF0ctdezE3ntI7kD7/ZEDg
	 6vu5cAvalcwyO21FzPhkzHxGH+lUEyYXb3ml5g1Wos0ydNfzl+ztVgQERHADtB6nP3W6G
	 LuZf6/6dH1Ici0/3TkcsuyzAdMSsQR4dpQUns9yEG+g+HOVQ7lC4FzwZvhXxUXUn5Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
	b=xRlRp5KweCVfhPPw2rmBGkbBloz76Ylp7TfRAMprNVp4biC5BVY9dvnMN+By0qd5tAL8
	 jaq5vAT/2+h+ifdN0EFUWXaCtL/OZHM2Yl27RnOIbMdLqDmDnptRbpeGkqhU2vtj71fp5
	 KkFJAjTstNPE8dbrTTMtQUpR9h0LF7aiv+a+lEXe2G8bkJIEdvJyDGYdcaRHLM1Fz1xI7
	 91dWi1+I/ppDEgxB1T1ja2MQWSplJ8ddG58IqG1Lm0e0Ocj3arLx/5eEM3KWKFfP3WXlt
	 zq4/uO/kXPYMKZ7NljkLFGPu2d9fXx70fBi8suPn++k60guYdetejE5nntJPdkEYVRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MGOoJYc/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90573606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90573606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGOoJYc/
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504b4f2b6dso167493066b.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896649; cv=none;
        d=google.com; s=arc-20260327;
        b=MeD0vOHq93g/fFVY5ESR4+uJ+nfWNwF4lYlSMRVsknE5DEqX5h/21HytfN9yfne3bG
         NjpoILSR3Fr0TNxxhgte0/KqY0/wHEdtuZf4KBnNYc/+TmgnStyeUQUL/2ulUsG9AlmQ
         ITzt5GVBsHU5xGJX0M8/NukQFfn2MIKx415yuLFpreHUwmImsei3htpt94yu4KqkTuV/
         u4VcjpDco5rgfVTSHrZnma/PoFFRDDsm1IrBqYXgrA1F+kmHozXY4SKrmOCKqmv28BTS
         OwL8GXeSPjj/zkViOMBIMGXVQVr5A3uY+8GOQgmwExJTxiRdjJyzjUm9saUQDPI72j3s
         YGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        fh=jOSN3Q+fNI2s7KDvaIhVr21B9wD29VbMUMtT0evHPmg=;
        b=TLBHSkCAiUgEWpcD3ofwQu/F2t/+NjiGSnuk62w60UXE+IMPydmwYlUMvSh4YdKRcY
         Celchh2jThRFUt+2IzspdkOI6vOTag90GWwXJomSacfLJIXCSaudf3WJYQ2hYx8ZUQIP
         6qpXkrDYjQLYWzEp/dYrQ/KGx48dlR3fj2e8GE9yzY0HQXlObbpWVShY4zeK5GdOUHQP
         +dPnDxVnO3jB7BcV0POc68WrZFsHzAK3wiEnw+40kWZzENe20v8byWBhCEk+YmrfehWY
         45grB8L++dZc9Gs6RXV/1+IV5GwCuGkecGK1FgBoV/YKMPizuvdeJy7k51YDHztM5A4d
         FS/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896649; x=1795501449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=MGOoJYc/vMPkJIk5+hgWI61vPC8mDN2EPmKg7a3+DdKw8J8CmAtLpBlLhYvXNoLYNQ
         wcceMykdIvsbZ3xU8KwTyHb2jj2CPbE5tRRKMTvKPFSHUkjYE9sBvRf9Q/phY6yXdvMU
         LwePJR15bLB+OUdBbZ/a4zXsQUO0A6R2ZKA47fJheUhzPw8tkqQRw6VC5CmkDGtywVvK
         tx2byuS8jFwYvEu1YS6f7SojUXBTmI/MOlDp2hY78Yw9oqqLXvQpXP0AgAN0Q/eD5790
         a2US/5FXUoW7jbW9wuZyAYaDpKecZOWv0Y6YXuluWv7VRB4QorkS/K2McQ/qVT6AzFss
         fExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896649; x=1795501449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8z5Io8RhbyyeuDISboM7YRSTMS03SBG0kjxtz0W9A=;
        b=ZWi2sE0m/cSUI8TmPSDLA8pcDJZl4SLA1a/1/8fAn2P7w0kpVP4aOofRRH5afkcfxQ
         FcuA9kGEVHJHR6/RZyDU3JozNS6FzuQvD551XU0PobfIKsTc8AoJC3ucxB4JJ8Lof4Z8
         kHKkeaE5zNpQkEnOHbjqrx7YGbLjbvb9BPvPSDc784OQVXlMlH/20z+BXxme3ieyymL9
         lIWjL94zEdns1lQpiycwKJoastMH5IT/kB/6ChB5YE62x13l/Cgb36TM0+MmhhcDW9t3
         XfGqnud0mZVX02TzQWtv86gZJQ1XG0vgme+6DlXl8taGUgCXpXC5rh51jSiZb5QV0qyL
         yccg==
X-Forwarded-Encrypted: i=1; AL+hErFd/B8YlqmYcv5t6Z6tJ7IxcW9CqYQgMz6HyeJt3v+7VhKjiBjiOYaHp7UPJuKdOTHYlAx/1e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BCybew/VRsTf5EGxMoD9WFthZP/V/eVD80xSyV0U+3RaLRsIK
	g2UGst59nawZRUS34zcSctqTezD8WkvjPUK0odi0D5ZLTgFVfgyrG7dBZAXZOn8w1KRb5n3aS22
	ELuUUSwmA72YHZAGrP8DAlcQzhEe+XPw=
X-Gm-Gg: AYBFou3HecpboTBCYCMt/B6wojRJDDUQ3aCvw1nIf5xddtBEpQKcuyoV1II2BCdJtRF
	GkC/5tRZJLFJTtP+Rl0rrKAIBsg9GEGf0BCczlEWqmf37DBaeuCAMMtWMaB2vjNvXItuDxAx8Aj
	YBHMGQZzjgF0fAkWTbe7P1ziP7LQDVr9glJzUuh3ZcTngUdvYJAeFJHdMMZ+lbxl0+d8q8uEVX0
	L6cq2Ai+OmnQjKx9KtGpwuBw00dLtAPiyihPL/CA3r0rYsVe8b08d1WVpqqi+/2ofePFM+Qaew0
	nHY2jfQTYj5K+NJ9cQEU34LIqROWDUpjM0fzE0KN0LFfrqV/JTTz0Pn5D+p+vCJKBNI7r+i2tzb
	dT9hGkhMKgwn2k1cPlwSBuRQo1HetURa9FHa1sd41NuDoIOZOzqjosYrEbr44k8S2iNDv5Kca10
	6G8jCgpZTeFNU=
X-Received: by 2002:a17:907:7ba3:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c509636a832mr966830466b.23.1794896648621; Mon, 16 Nov 2026
 22:24:08 -0800 (PST)
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
 <20261116183012.11a7ba72@kernel.org>
In-Reply-To: <20261116183012.11a7ba72@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 17 Nov 2026 14:23:56 +0800
X-Gm-Features: AclHuK_nLO104gw1yCZjvRwQLJzYX6sO8gDm56OtDyoqEcCmc11J_KEsaJmWM1U
Message-ID: <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO
 to core
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Heiko Stuebner <heiko@sntech.de>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=8C 10:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 11 Nov 2026 00:05:53 +0800 Coia Prant wrote:
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -159,6 +159,9 @@ typedef enum {
> >  #define DECLARE_PHY_INTERFACE_MASK(name) \
> >       DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
> >
> > +#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
> > +     DECLARE_PHY_INTERFACE_MASK(name) =3D { 0, }
>
> I wonder who suggested this, hiding the init inside the macro seems
> a bit subjective. I see no such defines today. We'll need an Andrew
> ack for sure.
>
> Please try to add lore links to previous versions of the patchset
> in the cover letter.

Hi Jakub,

Thanks for the review.

The macro was originally introduced locally in the Wangxun (txgbe)
driver (commit 47f848aac4e7) to handle the uninitialized stack variable.
However, their local version incorrectly uses PHY_INTERFACE_MODE_MAX as
the array length instead of BITS_TO_LONGS(), which allocates far more
stack space than necessary.

I was just trying to fix that bug and move it to the core header so
both txgbe and XPCS can use a properly sized, zero-initialized bitmap.

I understand your concern that hiding the init inside the macro seems
subjective. Since you mentioned an Andrew ack is needed, and he is the
net PHY maintainer (who also looks after the WX driver), I'll keep it
as-is for now so he can review it in context.

If Andrew also feels this doesn't belong in the core, I will drop the
macro entirely and switch to explicit manual initialization using
phy_interface_zero() in both drivers.

I'll also make sure to add the lore links to the cover letter in the
next version.


Coia
