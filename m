Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836895;
	b=iE3AnBi1KFDDC5CQUZL3of+XDXF4oeTdTER/DvhiO5tycrEKTwaBndQMs9d59qO7E5+j
	 7agjkOBXtp9fWYp2gsfvltBpJp2zMg/W0QXXRr31RSO2SzFwTisqJ368sQGcoQIqsOaC9
	 EhGgaP+s62MUoP3jejmhh7Nj/0caOerctlYbHlq4kRj8KJHTZOKpQOvlHqpS5sbIzFC58
	 fWEnM1+OUfP0194chjpK6r+OjgR7rxPZonz8IcMIuYiT1/Kh6+4eFojKQWKxvBwDet4YY
	 CUpm2rrj9ZYXqFGahAongOf3OZ/UGHjzpbX5wvOkk+K4r19GzFRc2FE60zdTHH2hMhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
	b=VfSyxgHHW4gHp+Wp/8c87hGpSR3YLWL3dXEJj3h1x17yiUDsXb5bGEzlNfTgx1loPMUw
	 BTUgBptzujFL0NmAIQzU6I8Ql/t/9Avoopq0bEE/LeVClSeHRhGi6ww0PgUko76Ho2xib
	 B0c/T3YUuzxJGsGvrVE5Yk0yuYZeDwU9lp8PcY5ViVU82F1FU0ryhkXkYD/vKk5FWTeqE
	 CWc0O8HV0osdQ91UkVZ5WBaBON9nX7cbB0qVpPaBxcfiE12RHevMJQEEf5u47qK0vnZNw
	 nHuCWIAPHzQi03N9vzxh4vM4BuBPhkJUdF2rWXEWFqPHznYS36Vg+1G+bbO5HDMI9nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365C606A893
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7365C606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDjM7ouN
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716c0217635so4563983eaf.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794836894; cv=none;
        d=google.com; s=arc-20260327;
        b=Ohk6TMJCX1YkTYdUXdD/yEuE7U7tOL/iCewIEKXk3o/qAesUXs3fYcmxeo9oCh0/52
         WPCLbgti+Rlov6w8HAeFy9GNpu3WEFc6ZgNTWoXOB6hs1tjZY55clVfZURrYTsPyR0JM
         JFyAWx6/mr+xtuLRRpL4fW9OZw037SGWSxCBlhOe8+G59you4SxTjDeGyVX3/pcYmjS0
         nJFcHuZYnZ53HFt9p0ghqyKJEAAReOjRuP6cxx8lEn86zW0nSJ9wmd9DvLDPYi6diDUH
         QL8UNA6dpANmXQDXDzs1heQCD7X0VDI34EHKJExH+vVOy9w2s/my0VWB5GxnZ/Zgsymu
         HUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        fh=xZEdZQk/DP63Xnr2hjvjOUqwocjf+rsqONY0m9BhZsw=;
        b=fBa3bZdAmZMyL8Xd2qZogZ/O4y2jiqGaPCvdQSVYkVapSkkcNvAlDbs7vvdfF0Vh0T
         JHRLtk8sf4HvqoXGQAuu96Ngd1aJlrWoKj4eNGDDH6N7jiY7N9N/zNpvgspzlwhmPcfE
         z2Bmi63HdkHtdCNwl5pQmKw+5+Rt4pwAqYzHUb/i2OlkHZThrRYL8tOmEXY2fVc1p/z1
         t3eCMYxhDHcdm74rhI+hVQ7J06IqkolNEM4Sc89AcJ28w5WsMNywQvJx+5FywbhkRTmm
         WNka4NTK5hdyD58sNgSPF7K9qD0oeZKIPktKmRSlFkeFFXFK1SPgLrTqqp5hVEa+72MD
         143Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836894; x=1795441694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=LDjM7ouNloY/7f4uugMx8sCMqrD6kfbljijeB4PG+tnLFVO+oAN/fiqW9jdms0z3pS
         /zmH8zyb4dNbBmmMtJfIR7BSJN86jOe5aP+nZvjRwF8TdpO5bCQMQSWyawa0rYSy0JYe
         ADdTvKPDNphWiPS9zI4SG9TcYJln7akD9XYGepcjJDAUM65KvyB0z1smGYXH9XQ2Lyec
         Do4sgLYXnWA+LwoZfmcn+E/qKJigSWynCPT8kcCdMftw7Q3BId5OdeSDzv3AwEzwAq2C
         s2hmxV2O5lOCQInQOCTkaPuLjS+ezhoWJKBtCMM5hD3IGE5/VbIM/0bFYFZh1ijUq1Mi
         mkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836894; x=1795441694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LcwRAV6Cfn51LvqO8NBKcDJcN92DAtlraZaE+7y7lYQ=;
        b=kGvR8ZzSDAVLNY+L3G6T06SGAZtog6fp9o91ZUc7Qwlt0aKvDb22JKTTA1EmUgwADH
         1NFb2AfWIVRKDG/pwokrpqkWM3mDjuVHJp14YczP2auucEPeDBQzsHlkacMxGLXbXh3U
         zi+kLAHfoi+0rn4xlJot/yNUq+jDln/l6EHVTBWZqhgB3+qE1UtF96M2I40YM2/1J0uP
         LO4H5CrjkWC/xbRKiCs1BUp3BGBuRBdtqVXgQI3642HEUBygoypmhhb5rzmyoX8CAi7r
         GS7qjszFBBNyGG07pr4D63+I2c0G3kmhZKLvKJhkg6wt+VBL76NrAuOsARg/QvSUY4LL
         bnBg==
X-Forwarded-Encrypted: i=1; AL+hErFDgv4ynB8YEoYtmhw1KhAoL8jXsGfXwF5wUjgTtiKzSajyLbcoFAMFv42AQ4pesxEFYSTqSrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vWKlRbd6b64arF31AEJBqiEzKk6xpl6KBRZ3gGxHET8gHy8PC
	HFI3Npf7p5N+Wb54xXCuErYnTmIauQFZ/7ywHqa7le7dUxCeGw4PBmehbeu6jsf/gDr5lHvI7xD
	NIoS7AxFpbleg3JcHodkUMGlptTDBGa4=
X-Gm-Gg: AYBFou37L8Mzw6TQkG09I/jDpO8YooeYpzC2WAsCRzeJcxSPhle5MmeIC+99/ckY1xn
	pqFEVGG5BBMeBvPccPV339G17xmNm/wZ79HQ9ioV+VFmcjszZuUXe097nRlCuIHikdGxCBfI4FV
	4x5tm0gsMWvH1W7TpqPza7Zjiw7tP0cTAiNN9LruFfC1dt/xxIhOkxwHfnHhencpkwf4KwfC2ve
	zUtf2thE/EeIX8v1FVX13qGVhQWUC0bm2FBPKdqKpmaSHSHtOaUTsuBaKVxOjtb5Gh168vthklM
	V2Ta0/EnL6ryRUueNKHJdAWqZtf1R18zruE447AmC67CeN0Rwde1p55H5ilnlCoZ0GgKcB5j0jN
	PpLoD0kgtw4W2gdKu5ayT+ogU37qQHiqI0IOIkn+Ds3u2VYtcJGIvAz0mm18FLpsDvjMsBimJ++
	OL51VvlPt41amacqQg+3UyRs6dDTumo+HCOL9MHes7dWblreaK0EGGeH/u
X-Received: by 2002:a05:6820:2485:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71ab5228714mr4375156eaf.38.1794836894278; Mon, 16 Nov 2026
 05:48:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com> <179481441455.3136.11985756118593625944@kernel.org>
In-Reply-To: <179481441455.3136.11985756118593625944@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:48:01 +0900
X-Gm-Features: Aa3M54qDodNhNTwL1i0nBiBJxcrabpOvbxYPWu_JZsDXPNfRjaemdjKWEiiohJ8
Message-ID: <CAGAB667OsSkw_iKDqVwjJjWvwWoz5fSY7Cy3DUU1nFnWnrhaHg@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
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

On Mon, Nov 16, 2026 at 4:33 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: Medium]
> Is it sound to call genphy_soft_reset() on a Device<MaybeLocked> when the
> caller is phy_mii_ioctl()?
[...]
> The race itself is older than this series. C drivers that use
> genphy_soft_reset() have it too, and phy_mii_ioctl() is documented as
> incompatible with the PHYCONTROL layer. However, this patch is the first
> to call genphy_soft_reset() on a MaybeLocked device based on the new
> soundness claims.

As you say, the race is older than this series, and I think the fix
belongs in phy_mii_ioctl() rather than here.

> Would it make sense to take genphy_soft_reset() out of the generic impl?
> Alternatively, the MaybeLocked/Locked docs could describe the exclusion
> that the unlocked callers rely on, and note that the phy_mii_ioctl() path
> breaks it.

I would rather keep genphy_soft_reset() there, since C drivers call it on
the same path. v3 will document that the unlocked callers rely on the
state machine not running, and that phy_mii_ioctl() does not.

> [Severity: Low]
> This fixes the lock-held SAFETY comment in soft_reset_callback().
[...]
> Is that still accurate for either of them?

No. As in my reply to patch 2, v3 drops match_phy_device, and the
get_features comment will rely on the same assumption as probe.

Best regards,
SeungJong
