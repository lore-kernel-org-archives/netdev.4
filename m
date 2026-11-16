Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794835058;
	b=wHqv7it+tTAv9vbr+4eB3SV/T/qfX87Wir0w/e7f8+TecO1sDsT5L35GFXXKKsKf43uI
	 rnuUyLhAvxREjedQqtfuQSIA6r4AppMmEiEWUitnAezSecWDi+KFN5wYLr1bG9i/8FnOI
	 8J6TFmiaeQuhoAC5W+smofRysErI3sFdjInoZniEhCLz0irn87V+oLz/osxNGI+/hK3yR
	 qbh0frW4uZEhhHasbJs2eQbNqLRv5DNnoDdNH72p/G/tbTi13RBig3CrEg3rOpVm/U1sn
	 4pRoDzV1HX3Q+7QhGc9ij8tXiD2y+6qCEw4jMJ+++BxfHrDWP2DtdKsPw0awB59J2yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
	b=eYR1y+/EijhAV9gqRFM15zTBnTXYWxSoILGdD1HNuHbZvBlbTS80F2GM5GeNmBGmYTrF
	 waqXBBBzxOiCqLchBrmv0VTylhjIprek/lzvhGmNXMH6J1fu3u/AqpD1YY1iqRXXcgDGm
	 3poc4xP6p9pDgrOAJkgwhP5/x6p59EKJ3Urrv3V5g2lr2e7ndKMy0O59plZlEXhC4Y9+g
	 rRTVLvjeiuiZfVMCPI0ZB8GQl9s4i1XhhObjve1KrAv0LQf+VwF+H7jegsO6tfCywLN+u
	 bEJ6l9QurJcZpm+ja7ots8IQXepTS5QBJzFYOb9RWivwIpJcDw9uJuvVL87TdttBZjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A71606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A71606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716c0217635so4534747eaf.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835057; cv=none;
        d=google.com; s=arc-20260327;
        b=SR5QXR3OCAFqN1aEBS+N1lbAvqJ0LZxKjyvisHp9nVGqAe46+tPeoJ4CkKyyAr8Db/
         pnF7DbnQPFkXJ8Nhjeb/8T+4Dk4R0eRzXFo9TgIGze4Ls8dbaSoolVmVjxCrfCjUBX6l
         VdeFymANMgdyNEf+qTHol8D4ydhm90rFfZRsSSf6Zd+c4QJSFn6caLm1wY/KF0OF4CaF
         BlzvrPS8bPWvZF92oVX1yZqyxAgJEnn+sEA4NhBXWZN2EvhCIAA6DBZW+x0RwRjQ8P2R
         6acRpsByyNL1MX6cXyesIJp2hRzM+tumrLyTYeBOkzfbEPLWTshHL0RP5kWwZHXcGbmD
         xIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        fh=Tv4nmKKS/3DcYsEA0fEPFWk4c5F6b82N2CTbuDzVaiI=;
        b=NpOlX04ipTxzznYUQV3x1OQUrcGRFGy8fNdUTasdKVp4Fp9A4g5usPHn6u9KZXCfcd
         OCcNZNb9Xhhx3x+s6QxYQ1OTxXJRivW0/wvN2BqF6YC1DxT/yGmbCbYIWlMPlzudetRH
         zfFQp0UPNnE3z53XZLw+afvahD+UcEguK3uSdCVLhFbM6SJj3R/eTaUDfwQhkwAxwdhr
         NnrBlx/BqCN9a6R2AqfID2FmtZ1KAk32rtGhGpj4+WymuRvDY+Ima5azWaCwdkueeaOO
         NVTOsqG2rJFKjVorQJBaaJNbxYFnSj8JcnmLrznGISX1NakVwF5NxMpvKJzEGIypGPkZ
         bKPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835057; x=1795439857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=VdeHwEXLxTQ5wqSxntNGvc9Ws38HB2eJrHvik4aokKDtjy0XuYwT0HmNIXQkAvE3FI
         oO0WG9M/cs+ZkDGSQ2qAD8FahJH1JxbX205leePGzXfIq40RpvwyWBBa7cK1kjeiHoJO
         adVyZ6kBjdwSJbPGckd6m9d8Wpeba28HJmhc8UI4rgFcxKSInSYHr+lgMydjFrDIj7E2
         Ioi/sCbpL/FjcAcl6H5XjiyeV4uEXkf2RtXo1m08PhyHynVM3NDJJelJE9wDafX+lfOm
         fexyWP4kBMyhpxjtolVoEZVEJd7whEkLSpsECAJoP4cdKmL9uNNO1aQAfiLYSkfbDLec
         QLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835057; x=1795439857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=L9hAhJlveFrgkhnVduj4kEPZ1Kon6YogQkC45grpXTh7JQjyD+uhj7YjZTS0WSJJ9Y
         Px7BMKZvVoxkv1m0Z+ES5mZ1sOvC9TTKSAvaVQkPn8y/asdroVjTdfZDHWKYqAezssVZ
         bqYaTWQfEl7+ov8CGMJ8qBfxNxwsadf/xHp8QS0cwjed5eCz2ccfG0j2A1EXw+U8kaZt
         f+2CtxmcepswSwghidK7a+zMcRv2nqV1+a7ap2bQkzJzg0QbIl/jN+M4ejvflT7l4+CZ
         Lwypkd0wtYs3nzug6kRrkK111aTuKGpMpPKhXYUaeMP5ncmr+OOX/8QoAnkMFVUIbo37
         1PTw==
X-Forwarded-Encrypted: i=1; AL+hErHuz1lE3Bo4TlktavgS37I+YRDYIHxGINX4PmxD+BqEas6zsTQAMuWTNNIQoN4twHzs9Hl+DEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B2t8jMzYAFZlYvT/FnPyYp/wFPRHcDI7dhU+rG8toRtZ/lZHP
	bToPyILocWbyGz1ACfMTkQBjU9cLUAfoQqPzcD4hzAnQFyYplR2cLymrCUSN+sLSCoP2E+6n1A9
	U0/luuchpVGhj/BCLuyLeF/TTxTHNJ5c=
X-Gm-Gg: AYBFou336C4Tv/ZpQjRTpdsapooCtR5WwuQzhdu7by+YXKSPOlhwLCo6kheJ+pUq8P1
	MnLMEs0tURcAGm8LERQr3meE3HZRgNwA2W1Xdh1z6fs65fqmcB83dhPSr0oMXJ5E6un+FL1+eAY
	J17qE1HGMBwZ5TnJefLG2iTE1Pxo1OyDEEPDOwLVq9zzEbQ+etFEPzn/pUuVDtHt/d3qAK9/EA2
	l9fEu/TLCUI7cpcn8M/vD7wfAxqXFk7UsGLkBgZbz1WQwfW3Znr6JnX6RpZBZAm4FaR4c4PZPmg
	upIjdpwMJ7upeFyeu0vXe1VjJcaiaC5kuQDtSAuapf42RC7u3enPcmxMancm+AKfEn98USmZP6v
	nKd3qznQVi1qbbHfDmSivdIJeVwLR39xVRS7iV0LxSXWuq91wQ3qKl6Fu/WfBMDwKuIk1K408wA
	L7Gz57ua9iSEQ47Ezp2AvNoVovA80gMUaSNkQJ0voOfHQRg2vdReIMGVT9
X-Received: by 2002:a05:6820:2911:b0:71a:dc2c:ae3b with SMTP id
 006d021491bc7-71adc2cd460mr3609748eaf.16.1794835057100; Mon, 16 Nov 2026
 05:17:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com> <179481441244.3136.17001607410238147789@kernel.org>
In-Reply-To: <179481441244.3136.17001607410238147789@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:17:26 +0900
X-Gm-Features: Aa3M54okYT4QHq5C_H4ZZaGZh80n2pqronqCTMY0U8ewYc3mFcR6BO0CjcHXiwg
Message-ID: <CAGAB665suSc88922+wdYBJrmMsZvtx8KtwQmo72KZGm1oGN8Zw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 2/3] rust: net: phy: make Device
 generic over a lock context
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
> Does PHYLIB really guarantee exclusive access for Driver::suspend?
[...]
> [Severity: Low]
> Is Driver::resume actually called without the lock?

Until v2, I had left suspend and resume out of the context analysis
because the existing comments already said the lock might not be held.
Running it now, resume is always called with the lock held, while suspend
is not.

v3 will give suspend the MaybeLocked context, list resume with the locked
callbacks, and fix both SAFETY comments. I'll also move dev.genphy_suspend()
into MaybeLocked context (while it holds MDIO bus lock by itself)

> [Severity: Medium]
> Does a shared reference give match_phy_device any protection here?

No. I had kept match_phy_device for API compatibility, but like read_mmd
and write_mmd it has no Rust user, so v3 will drop it.


> [Severity: Low]
> The commit message says:
>
>     Update the documentation and SAFETY comments to match.
>
> The from_raw() callers in Adapter<T> weren't updated, though. None of
> them says which context it is in or why; they all get Ctx = Locked by
> inference.

I'll try to compose better SAFETY comments on v3.

Best regards,
SeungJong

pw-bot: cr
