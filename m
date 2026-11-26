Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693998;
	b=SkNjpi5pk/MGMImc3f2cys088EltKmYTKHWAI2r+at+iXqjlOgGsKHf9AuxAh/+ab+1a
	 bp2ERgAmVTsbAwu/F45Iu/A78MzLTD/1K9kjALsjCN9KIXhPaWUKKxDpDSY7Shed0In4L
	 zIjt9QzjHPrdhfx1KZhonVizSTnFBWZoI7IJyJi3rvc0jZljTw06E4DCSWxLeE1PF9Yxa
	 fRRoSAXbQotRYyo1F4e/g7ZhxXzNyeLsJdjAPIMD+ZHGsRqg9DIO04ZgscKKIQ9wZtbaG
	 Bnh8cTmxBoaFTRk6GAdi1VbEj4lhZ1Sn+tC3H0QgYEXMXhD1dnEaKaX7WM+brHmjRTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
	b=Ru1t0sk6TK5qBcydyKfYU6Vx5uqWvg2fIz11H7LiXDMm51tGplVkxXl+s+j49hTVdRXv
	 /tEE5wZ2tqrl58A164y7BB4eZxQ6uoL8XozYBPUYEASDm0HMNAtthtcqKnakvWm8ZQOB4
	 9sg17LSXkrywmuQ06TNcNyam2O1IrNBsbyiQohLqYi+jfZRybIhrpLzEfy3IsdJa9cwlh
	 zSM3SKyJi1AEOXSNAPUDys/6MpD5VStwQfZzbAnaZzMOfxh5albnbHw3AyyDJn4XI3F9D
	 xtRWTv1CAIOQezLA5Z3qHIqH+kKqk/acwtfiC6CdMnQoiJtk1J1uU+wmSVELoRbVobg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfdIASAB;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C2E606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfdIASAB
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f07a960666so47763525ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693997; x=1796298797; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
        b=bfdIASAByiwJfbqAAD1+4UTRO9VRc/1cw8CO1aAbFYAINIWPK1sjcGXTYBHg8ue4OC
         ALBdw5OPrfz9wafd7mzefxe1Yi6eLsKJu15ZlAA50EruSbNaCH7EDlhJQtJCvE47DBth
         4bztgRiNEa3EYUQPqvifGMissfDxwdTl3XHAwzEUVkNf1TpK2O1+dYqkEy/wBk5/hE5t
         aobhOuiFfLfcQEuTiDsXwUbOg6Ikt2BXTk7LZfnb93R/1nhk28DHy1jKLpjzKewoFN4l
         NPn1BPuV14cJrkAaCuU0eb/7J+POzSNPYEKAJmFCYfJZXwsKgr7pGmqFw1uelx8gyZF2
         p+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693997; x=1796298797;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kI5IDFfNjtsFoeKUBTQbibyFH609QEEO0MmiaXh0bc=;
        b=ul/Hw3WL8N1BKlH1ZQXqtjA4RtB3P3rbxYI3n4zbFLHnFH6afXPHOtK+PVnGs7RvuF
         2ZGFYMK39YoX40iR66U5Ko+it3GUl6riknM7rNg236L9JC6GcdlSFhSpbuVkOyDIMJ4V
         c4sTQYqZwDjc/4bxTieVMjA8iOXEKynSyKwNj8JlaGjqIHfy8UzEpu2VB9p2iB3Z7+ys
         HQzglGbxNtQ/D20YnfieC2LVx/0fPN+1/teURSTepsMaSZdrJmXW34vAGRpS1XAhjFB9
         PtpZvuzO1uwSDjVUaIb5kAvLKximUbOnpDQTzflrV3a6KeSKqY2Jw750KDG6BO48vwfj
         2TQQ==
X-Forwarded-Encrypted: i=1; AL+hErHK4ezWOekK4DLDQ8rUPqJuO6uQOTTutiRiZSPzoXtCMwNnTCZua9qm1X1sLw7kz8ILQkTlcts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BMVYoUtWbIt6o0xU7kS2fVmlkUxn3B62uXjBIQkbq+H4b2GiO
	rjPnry9vQ4L7WPw68zZHiPjxCM1xXcjsfhWiYCYOQyTQhbe27Wg/2Eg=
X-Gm-Gg: AZFdTZeuh3fiZIAEdLW2WqcOb9bTL4prNQU+ZvzLj7sd+ARIimWKw/FhT5Dno320qdp
	zjCEHpeMvCNUJJ4AknVZLNjW8VdGYI4StTOhS/csDFG0f2yPSHO0Xgk7fDCr1/9/Qd08bOX3BSN
	/LIu5zS1dWxRn9FYrjaDH1dJLyOIyf/OWTV1/08Ftk3myq4f0Yf7K3PktMosHYZjAwBH620TsxE
	g99idjRQWb6KTcvK2YXKiza49SVhkLMXtjebmHSO7kZcgRdRUexO8pjzxapzeg5SK9Nul7n9tIs
	VXa8wGSC1zcvDyHGGl/dD0gO74pGjlYlmsy2tc6i9f4t7lQRjC/0jFRYMe0FAIRT+VX9c+H6W06
	UsUOSmlpS7Uz11yuJB9JlXv62OYRQfIoU2cII56+ulfUg56U32xeH0ZfG7+9S4daizRFgEWcnef
	OmO/KVnIbnoo6r660o1t+8Beq4y/d2p+FUwXuTUAhm6s177I8sOJbu9gT/DVor68XrJx2RFEN4T
	MYU/4Cady9BBhsYNYdRt2TA9oUCZRwghWOlWsyyMVpD3CdiATZoBQfWRQv0wRtwM+YjTLaWIBvF
	v4EztVHXIAQNXARjhk8vJeMlT/XC7qHomolDWOulEk8fYGDrvhZ+N9rZbSWP
X-Received: by 2002:a17:903:2450:b0:2ef:f312:b848 with SMTP id d9443c01a7336-2f03f16ca8emr221908695ad.48.1795693997244;
        Thu, 26 Nov 2026 03:53:17 -0800 (PST)
Received: from smtpclient.apple ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm93559375ad.38.2026.11.26.03.53.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:53:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH net] fsl/fman: Drop device references when
 dpaa_eth_add_device() fails
From: Yige Jiang <yigejiang86@gmail.com>
In-Reply-To: <179568615995.3294.18215982267016488454@kernel.org>
Date: Thu, 26 Nov 2026 19:53:02 +0800
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C42B38F-A7A5-4152-9B25-5BDD067AD267@gmail.com>
References: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
 <179568615995.3294.18215982267016488454@kernel.org>
To: netdev-bot+sinfo@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi,

A static analysis warning about of_node_put() led me to look at
mac_probe(). The warning was a false positive. During an LLM-assisted
review of the surrounding error paths, I found that a failure in
dpaa_eth_add_device() bypasses the cleanup for the FMan device and
both port devices.

I compile-tested the fix on arm64 but did not reproduce the leak at
runtime.

Thanks,
Yige

> On Nov 26, 2026, at 5:42=E2=80=AFPM, netdev-bot+sinfo@kernel.org =
wrote:
>=20
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.
>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

