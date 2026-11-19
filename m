Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083403;
	b=uPr6wny/FCfp3GO/vdxNodxTt4RFy5AuYZvCHmrrVkmc6xPKRfLvdw4+l3gqxLZVbkFi
	 htkXMCMm3J/egagN8DH5P3ptPmAN9i4jETKQz6U65QX668x7hltEa4pmFUcibVgeU0h8p
	 Zo6Qlnplrvh4aPnef44tyZGDT0AE0jO09XZpqNa19EjeTzQxvBtxN9xHgAZjIIdIa2xnx
	 cAL6sTLO6Gawg1z+rTghT6V16+/br7X2nwIIQYTQMTtM8K8Qf5PrIzPTigjtbcnKoUHcS
	 Ns5eAbGH6ZKYCGgF3lq4KEgYaO1EmwNp9WzDDRY4BCa4jFPJqQI346GaamRZNkyzo4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
	b=Fs1vA5DQsZ1GD6ozbFhFUXuoXOYlhEHuUBrwE/wvlGfPtfoAMarZqa/ldMZxvK523uLP
	 TKhgcCsh8StcCh1kixNcJXy4HlUl55jNpPuYyievXufaIVs3JUsZYAgJ7orGuqY3bW4XP
	 qgRPlHS3eQGSL2UQfLA0M9nqQLNojYHykHLJshmH1JHMwT+k0q/sROuppri7oyVJpxfHF
	 K5doyPHP7VMWGPn+78SqPHDmF2JrbUEby5iSwU3l3kxf+MswV9D1aS39CNkzJwp5K8DiX
	 2mUCUkauSzKbh0s/OOEMe4Dyha0VDZsS+BVuF1J8BkCVmpD+Qxp6oTby2ss6tvZPqew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfYzBwxs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0542606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0542606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfYzBwxs
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a358881793so1053152f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795083400; cv=none;
        d=google.com; s=arc-20260327;
        b=AaTDqksbOlxyePfYI/UFhA++B0sTP0IPpCyXmzn1Gf+4yEOtrDh9XYRC+MuomEqPlI
         heWuS4m6nONKIhCzKVa2BcZE9D5N1jzTHNvcB+Uc/WzdmrFuBCHnkUK8hcVxx2OwwQ1J
         FwC6mxD6zizPF/LoADUIHkTmtctMx/8eeEDYVnT+LVso08JpZXJyZWJddCiwvJc8afDY
         M5ynAoP5hHZ5FxRQLYLH1A3cszU+uO1TCzLAQJZ9QMev324WJLjt77I8u+1CJ+E5d7OW
         K8iufP2+XyW4iARZk+dwzbyJndh+O9PnVdTKnRER29aCWkS87LM3KWcsP+3XdSalbD0g
         +MrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        fh=+hdAyfxNqFSVGczh1cEcSsNYNcMHlvtMVRUY0GseX2U=;
        b=O+2SX0k6c5Al+PT80Usf3BLaAtQOl/eozehT9usxG1K0k3yvsW5yoajYDtdwkl/vHr
         yNEmnu8ah4XfouOCE8/VA2drXEX1HV95pCx4Jgr7gGJyzkFeEPFKmP6Briq7IahNfsny
         0c4emVYgVRHo93lmqieXDRlN9JAw1OBMLsQmZV8M470DQ/FnMfkIfD5pOfHoX8iE4a6z
         20syTj2AvlLEV5B/D/ci3TpYpvxDq8uw1l9MtUJ6x6WrP3jSgt+torEM2lnvHyYZLup8
         95ySIUOp7q9Y1Uxg/ZKS8eEv+Hs/P31/3a/PSWJSJd4WyfPOASHiBovf7k58UMlLxucW
         s2ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795083400; x=1795688200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        b=lfYzBwxsT9U7ylJXY0sfQJTL5g2+pJaJckEy3Jm7MMozfDKx1lk7v1M08TZl0ESbXw
         p8c234b17gzBV4Rp2pwGQa8FfFCh3MBxjQI3v6lALsKJl00SEXsDdFezGiQHqP880una
         fIWgf600eJxpSpqYjBRDt3oQxKagVBQ12XtSqE77+JJHJtv1iNjGFTa+LrCEy6kbfOfk
         5VwgWQ0kr54h21kXjzkY/CTzjz3SA1rIuKSEz0kV1jE7AHi2w4KU4EzZxtoXYreQaaMA
         oQy3lgYmE6vL/IuMcEiIvJKrGrfKzR7rdqOOBmss5pcS8UQ1MC7Xb6QTuPD33QN6zX71
         wEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083400; x=1795688200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1yda0oNcQ3dTlRMr9OgT/gY+usASYUmww7AeKEP0Go=;
        b=H5yjpBfCc2BTId02QLL7i4Bxb2RW0JA0+9gEZckbf+KNWpEUP64o+NKWfHHVdiWEbP
         iDtjv4T26hxm08dTEom5KFpoD8N72/IimH60bqIs3yqsh0bEFxiIhtVKvBVICMxgsQtZ
         UCCiDvKI6H4XB+Vn7hwpitX764H2wz0wStLhmWLlPzg6iYZRX0YJpWerd8QQeEVs46z3
         1zLjP9zEhalSzSvWMC7xYd5yeaUHYhS2xPDdTNsRxucg985YmX3jkifo68NM9kwXlKiD
         nJMYjlLx4cEP/08waHdY5P07bxHPEkWX8+xusP0GXJZ/Ch/mTr9m5diET2Ylm3AY3bAI
         31nw==
X-Forwarded-Encrypted: i=1; AL+hErFmg1Yoc+MBfz/COluLn4/m2+tU/uzKIkg1w8JVlo9tkSmtzijdJtgq5kmd1aSnPYxCQYqbtZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBkZ6C94FFV1uCYzaVhnRAWdRs83r1Wcf+mwWlum4RFsp2RJU
	ZvNf5eiMB5sU5wo8INucUlYlf+fopifSl2gfg2BUOj4V4jhRijynzj11+Wc1ew4XdVPGRVj5NeW
	vlhNMaq66qYcUctX9IGDFHlc3qUA0/sk=
X-Gm-Gg: AZFdTZfn3ChTOTPPvnyCi1DFWqSRI7x05NrFTcnw+gFFBi4568oLqAJT2cgCC90wosi
	AdL8U4442YILIfMZHoG0IoMAj9De9wCaxYQWYIMuriexqHoVP2FAYi/cwuNWJSE/OlwFDDpKrzz
	A61Kc2Zv1HgYlow9oDWUXyczs0JTRIIMxTkNgsF+U/KypTfKpAXBfjH1+1cmsSFan2gEDoF9RaL
	0lIg34rx5ra6rOMiutiuv1nWk0jbTxOA1amJKYU9r0X+V+FKbcXlK7Z2tP1dyFXBEMzHkmE6YeG
	tIcbJosLc0Hk9u5uKwfSLzXPV7qhbdcVWcvFNvlEX7rJDSEJTgf6ekJcpkzINxoi/w6iJWK1/oT
	1U6KBCOrUXE1pyKoZVuAI7GEP7BggjUn61HbTAWyiRoJ75/X9eOdh8TTv44U=
X-Received: by 2002:a5d:5f48:0:b0:4a6:5954:843a with SMTP id
 ffacd0b85a97d-4a659548d0emr11671217f8f.12.1795083399306; Thu, 19 Nov 2026
 02:16:39 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116033855.1792036-1-pkfxxxing@gmail.com> <179480061110.3291.15316004866558271126@kernel.org>
In-Reply-To: <179480061110.3291.15316004866558271126@kernel.org>
From: Yong Liu <pkfxxxing@gmail.com>
Date: Thu, 19 Nov 2026 18:16:28 +0800
X-Gm-Features: Aa3M54ogh544PGKFMgJOF_6_QyLKjCrKPu4i3Uzi_u-cmYcNt0aY1QGx5VWRF4I
Message-ID: <CAGAoTxxpSJgg9S0TrpKJ2uHSSpQMsbzWS1CbLAOj-qqnQPGsiQ@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: fix use-after-free after association migration
To: netdev-bot+sinfo@kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

These issues were discovered by Qihoo 360's Tulongfeng multi-agent system.

Thanks,
Yong Liu

<netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=B8=80 11:43=E5=86=99=E9=81=93=EF=BC=9A
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
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
