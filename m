Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795763867;
	b=Dmq4tmEw7xXgB5QFazrZz4SiE5+ObiGUtxuF3w4Vmyi4q+cxs1WnpUxtXflStkZz4G+3
	 UGuF4XVYsw5d8UrhhghdEnl2banLNayY10ub15ZM5mO/YEQr1/fkmYjuMGT/TsU8iQsTs
	 FveFo7IKEh832Q/9ItDr08dDY1JuOG3MvgIW0c76VrYCcI9oXRA0OpSaFBQeGmi929bQm
	 1aVW/qWYrvffjyFqaJCY1dC5G25DGtnhNxQ6oGnh1Z0sRKcOdHshHX92clqs+WrwMqUHN
	 yvwaIPgyq4H9UBMDY2JTeHYk44RhgcH7yQiCXdPCQINTvQSC40zUG1YoXIB1EulHDcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sBfs1qfDj+NHMwewALTWDBF+xyD4zUqTQJbFv+XxnAA=;
	b=foTf7CBMsAdB6hxHVMhGjDprb2LqY+7kiQmwKcoAuTbJv8uYdGJRf21Iz79Uj+UWUNGB
	 MBs8qODhm/aXOHSs+0unqhhfV//LtaaIIjfcGmZXgcSOioXPtJey2+ClVOVyxRV9RHPgM
	 n/YTDMBDwm1cS62pMbe9U2gHVQVxOPW+3IPB1g/4zCrQEEfO8d8K30djXahkUMKh1LesY
	 3KO8ivuBSYz/zbCB82wieaWYdPux2MS4tCqqrwt0XPUsH4HpwkALvFKrtBmHTbSQE0oJp
	 QhogGYZbgPj3MSDMo9xB1RmHH8fcYnF2ng2qrHtz7yh4ZpxoOVCu6qirJ1po8CQMzFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oocRs+XQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FEA606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oocRs+XQ
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48e94879f02so2496164fac.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795763866; cv=none;
        d=google.com; s=arc-20260327;
        b=OinPuub54oR4709x7OzW8wtp62iTSM5xxqrqPguuEvLOpeyM9gJayS66RX5rVb0Lkp
         exApgXk0BMjLGa95XT9yeUwS08JXAOwGQV90IdrNyjZ5zQUhaUIEOPyUUWEMPC1P27bT
         HIigDgfl0CpT5S1Adw3PXs8kOR2t12HOR4oX577x2//j0HfOXYuDgOx8rtj534ASAuFz
         W9frIQYd0E9cES4RhQkhP1Up94fuLTacJxKNvq2cpmThddyvYN9Wgdj3+Fm7C6sst3Yh
         GjBivYJJW0ZQe8mR5o339KgB+p2JOaMIeoiMgkY2B16bKISikkgXwdmm8ab3zsifXIMg
         S6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBfs1qfDj+NHMwewALTWDBF+xyD4zUqTQJbFv+XxnAA=;
        fh=ETyMDPt3t0hLL74Rjkpk80XYeQAXRUjJTuQdk2T1NN0=;
        b=k33SNYAhAsD8VQ0jNAqrbLb5XGV/LncdXUf8xsI1vckFBs3T1Y4A2CfYNTNHVoN2Z7
         y8T/5Wk9D16T/hpRAs0hJFFmG0Hf9/ERtBRQG93CjFqtY25qrnzflfsQEadurMrYc2Ne
         1EVnDncnxoW3T3UX6/OmB9bTPcSmTJ/SdL23SxthH2x7FRh6dZEciVbw8B5bcndl/TQh
         ACcGuZOoG69xOzx7mm6YJt2ffwRk7aqu+0mYaYKjNxGa3pvby0yiHk+Rn4ESERDR2+Xg
         S/Z+6NedSMiisLFAnxYcJJArnQKiSZBcp4ptdBxrAmPDeUrLhuj+qVdgmAZrd4s4i8ri
         BLRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763866; x=1796368666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBfs1qfDj+NHMwewALTWDBF+xyD4zUqTQJbFv+XxnAA=;
        b=oocRs+XQom86AYc9F+GSpT5+CcbGoQHTjcwNAEeoOI59tQQ7SG3I+jItQAcOPyRBPM
         TwVPSXFgIcsfc3RVvvikz7WNa3lLWxUG2PHEA/NtwQU3Iq+rALzDsrlcgOsbxg8EnMoM
         TFKirg/HJ9StG151IPSoTgYp1hDt4LYK5mWZmGA/mF0GK642TX18u6xndpaVVMW9q1TY
         KRLjHM+pwd1d/qusT/yIfNLkkPQ0w35Y9D1UBx2UdSdB8KAcI7nSQnKnHDZYMbnayxHK
         6JNZ22yO6thXpMF2MebdIKB22bCIWjU0wCljv67HCyVOqHYEDnYSpUBXnzr5P7qxzwde
         G6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763866; x=1796368666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBfs1qfDj+NHMwewALTWDBF+xyD4zUqTQJbFv+XxnAA=;
        b=unG9IfLXSX58WTvh2/u1CruE71vjIWEpY+5wb8nEEHBCiWp5DgiZYAgGIILbSHiYEa
         Fsa88JN4RnDwtHtJHNPkMn2MfvfI5QrWD6u5i3az4TeeFM/2C8V0k0l5ZMSKZJUzj1Gp
         JRf2Udf3AIWVBegy3y0rawKGylCr/hua+HKEU8W9SUKoVZcVXvhlCYYMEBXH63Urb9Jd
         72yQduVSZRwL+b90bzcyVj03oNHTjZMbGHeWKHvprr4u7x9kJf8Hn5bz8r9/xQBvaM+D
         yeNy1Y+WnG8+8peb6Z/Z+U2W88RjPcsELIMUD5bPAcyae71pVIFkHNLv291vUKyYDrUt
         wdCw==
X-Gm-Message-State: APuU4Z89ZUGbYDdsLtKbXlk7PHbbiEAq1s1QpPmVHiqoW7Cibie3EWwc
	LRvkLxOm1dhy5/YHTov9xbobYwztKzO8vSf/ANbh1wT/YXgNe+4bbdthSg75aJzeAM4R5+PFa9x
	KaCIWGL+ccfo1lgLyzOHqwSyZUvIvqa4=
X-Gm-Gg: AZFdTZdt6QRV8nM9YIXZ/c/b9XXQkOpATdDPusDxtmmueIyc6SrYgXD2SQ+enWmNbpx
	RmAviQAPM4INJm3ddT4oJOo5BWZLrCMqsmz+k2CLVBn69NX+t9WjF4X+aLKFjme1Bq55Uxehaj6
	w2D7jTfSaWymik9+pRfKEdziONyj965nFu1gn1kcW753+jr0rf4kDnBchS6AZVfagNt7qRArT8p
	u/EDRTs7PhxXwBrTRyOfknPrOzgv+jwmT78/hFJsUmiT0yQIvwR/z8OjTAPHM3Uvarhy0VTWooA
	e9sP2WhEUEF99UL/Sg7kDMQzMzXFu5+HkAIJAwkEHj2Utl2ag5t/L1YcOaAFEWUntRfZxCnUWYD
	YO9709mMMRirM5VLuS/CrqWSyzz0I6Bya7ejNDJePDcNEo32Syx2FWuSobnGk7FvLc6h7AY4=
X-Received: by 2002:a05:6808:244e:b0:53c:5052:ea07 with SMTP id
 5614622812f47-57a06a105b2mr23575713b6e.5.1795763865546; Thu, 26 Nov 2026
 23:17:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127070354.550198-1-mmyangfl@gmail.com> <179576327645.3294.112285886879692747@kernel.org>
In-Reply-To: <179576327645.3294.112285886879692747@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 27 Nov 2026 15:17:09 +0800
X-Gm-Features: Aa3M54qJYjMk0h_YDrz0gL3uKh4njhTmpI3Hhu8SpudrPXuJO4YNtlv6JT_nGsQ
Message-ID: <CAAXyoMP-qAtN0fmySFEU9=4WBg1akhoJOSjXkU6Fk2Q8-N5Q6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Unregister the MDIO
 buses on teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:07=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
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
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
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

Not a fix, explained in the message.

Sorry, I missed the changelog:

v1: https://lore.kernel.org/r/20261126034725.64709-1-mmyangfl@gmail.com
- fix err path for yt921x_devlink_setup
- make NULL checks explict
