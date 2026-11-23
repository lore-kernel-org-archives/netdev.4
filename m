Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795473523;
	b=4V6AwOeiwPOX8iN1M+wGvcdHjvjbynqk2ifqfxsZquUGAapKrC7fLWzutJ66wc6aLj6r
	 +6xMc42z9uVwRwMchrZJMg29//M5jZk6ivHXZ09KhDUziNNXygtlh8nZuTmMXbhZal9rQ
	 WC4UGmOfStUYUidmvKhLpcIz74vgL77JmAIvkvvcXgDkhUGalDS68YlPIup8Jvhoesp3P
	 RJz/hdzx9oajYeZ2E415nby3yB+qiL4QLw8df43PFCeyAgEfTkhO8u/EaUGVd31FsVp+X
	 JZ9iJZyMuol6EGGdFLRJeFU9gLl7fzIxbh1dRQ0u97O9W1E8WhwMg7dB+uyNmJPHELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
	b=Vn07pbsZHkqrj14x2eI7dKNed1UkW3FCUS7Mi5i36Kz49e/KrgD1VXPDZkLj2/oCHFbO
	 wt3MC2yA//e9/MaMX6qFLO8vYfl1mJgjg2wYBKoVG+/OAjIEY1xVasjNiTt7q7gqnZF+e
	 BKo27vmGPYK6/e/SRmQRBtjPurbwQfRo8G9IMWhy1WbkFHIrj/jlWQk6BEJGHojgdDUMo
	 VChbQ4nNuUfCc40vPXVWRtEvIUAd6PKgu0gM8iFq6X7nXRvlgSrkeaYLKiKE6zKXnT+GG
	 epXVycZ8Cr1xQjSY0dKnnQV3qnKrakF6JwqMFfdYC0M6l8aYkyP6LFkTuxDUBQSN4Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=zyiUCvTu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769D606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9769D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=zyiUCvTu
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ecda93627eso1228273e0c.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795473521; cv=none;
        d=google.com; s=arc-20260327;
        b=WOlJ3IyWLcbnST3e8oi+XlwpXBIzN5QwOrrYf2uWBeB4VsoC4Q+lfsk+JfCu28m929
         2VV5d9y5UexojpcCX/Tmlt7udxznnau2DR4YKAh2rHI1hDHPqgeVf8IdOLoImQSSxfb2
         iVyMMJ+7BdyMZLP4epU0/7FFQqFwrOH67/cfJdhT8p2fUfjKwFaJG7yxQafqQqkk1Bzk
         CmhHQutAjgRwcqIDLCPACW763lxwaclv1Rg/pX+espIeeiX7I2qO+Ru2VX6nrhfA2siY
         yfZUE9t5COKiljE2h7afeeI+yU0VeJZLHUn28zuz7O6tV8x4hdHiNFqAbXtXXc4oRgT0
         b2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        fh=nD4qmdcCQtT0ccs34FZExfJVUN334SGxjGUJvvgJuNI=;
        b=lAevlZ17BThmq08BC05X6uvcpV1DtJpzlUW3yuADoGfKOLO8UVZIyk7KkZv2JKeogS
         evzd7ICRmxNC2Q6xaDOBPTYuS5YIkREEJKGO45BZGvhPJb+xLLJEgJP3hidCRdptUffl
         66iwXD0xiCUOE9ddLLJu0GHynos4eExzOfbgsy3bnn8sxhOhYvC0xw+VTd8aN1LNU9lV
         hJJqGI5uIOKzvbL/1nHrxLsc5YzPv49hZSsSr+4Zq4x06QMjpct41VHe5EF4LNRBh4bf
         NvUKEBYHHTvQ3inSqYkOwAJ34ogjPwdhwvGD/NMK6kzj8sT0XP6+OQbiffObTzSvwkNM
         xgHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1795473521; x=1796078321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        b=zyiUCvTuUruIC9KA7f/TKpjXXvuqRdzyyyrawPTRvar9oKK+YD/nxCoP33rGakGsav
         sVJ8T1hmCDgtZ2JwIyRdjkY8XfyO/0ttbF/16+Roobqw4ueTWztO+hRTpK39RF0TbRMu
         GHMKhS4DubOZklj70d+rMG+P2cp+iMlHMljBdjmehin9OoDpP3DNGbNmzG47jJ6KN6ho
         Dy5oKTNcCyaDipy9l2RsVqWSfXZRs5MIVqMqTjIjt9Xw8b5QCjTEiLhgNUkS7ZUQzT9Z
         a1UdIhaowt9Qr3ksyQErDAyEvTtAnO1e6+sviza4NqZYQIlIVjK5g652ikTPpAbrHzWv
         Wh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473521; x=1796078321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cwh//GNxXkDtdeGWxHy4iPFypYSAhLQNf5Ufwrx4yf8=;
        b=YXzXmabMh1mB5sc6R9BMvfrg1Zj8oAypwbkrxR8PY2T1mAg6vm3U0Xd4gn6xEuuD9V
         jdoJ50wfSvKXXGJBDdUji7f/iUqfiaR/aL5Awgg4cE737jccMJGjgp+kKqcIliFPD7Rq
         dTpcLDXmtQrBRZE1EMfcDVB4CXd0aEVYa5iMlqSJTDDBnJevULmqC/Wevas8zJSepy+s
         gHx7CC8H+SuaxawAyXZZ5l2d0cas1YBfi/wCbWxlnqf9kJv1ErDgBDuiDsThedW/vZ8S
         VPThClUZJiDDI19wegdQjYSJ1W4J2p/rPxrRyM1jkDFXPae+0mdmP4iXXCdsl+W6cxmc
         F/jA==
X-Gm-Message-State: APuU4Z+gpMf/b2mzEcmouoZgzBPylz4ERwMha4jXtCwYWu8FpFcABhol
	Rf437W/mFHrsrpi+pH0dD4pPyKzlETRnT3b8gN58VgKKTfVmrz596bt8TJkDzhWJRSay0SMM3Px
	Nznfm053Na55aG2lIfEpZwCLFi6f3PefuJZgS1XbQXA==
X-Gm-Gg: AZFdTZeYQW/p/cfxbGfHa87thNgNoAqiJ/tiIOtvZyNXVBnCt3/q60VCX0t9rDOgpdG
	3BMM7G72EC+123BAIOsv5a5zTHqIsgtVehw65OOGolZ5rZ95haxTol7THbIIEoNmOw/1cubEyVz
	jmLl5IYeFG7Uiio2AT33cCN4kAjMy9YD8zWLxsf3EXrAuTA9UggHWFRQdcX4Yu2XG7zYtmdh/Zm
	JrMoDeSpm4SkrZkvDw8it4J5dijWbhJGKwsLfO5t+075SLcSZEGd1YTpmO1Dw0pm0C8JfCi/x17
	5kCXplTk5KI+N3/FpogQ5Hw6EJtnh92SPqYHLqtV7xqj8bYN2k38EkqRZ0ZzSNXExWjWd9IoHr7
	4ig8VWuZWrrUsMHCv9fnT3aFyV6ux8o18R1cu3PlRflE2TPYx6eJe7By07NzEiBhR3OxFVoxAgw
	zFFLQH3WYjBhZnjrQKBD9WHivNlxqgsMEB3RTdgr3cjabkM5+U17wRv1tF+O8ZXT7Hdc4vtq8Nx
	Dyw1HfSCVuToL/cHL8HaSWYHsda+0XVI/EDFcd0srsUYf80eFP5byYCfSCEXB3eOuMV4mYkEP6t
	Pxc=
X-Received: by 2002:a05:6122:4b88:b0:5ca:fc48:5634 with SMTP id
 71dfb90a1353d-5ee8aed35femr6594776e0c.11.1795473521432; Mon, 23 Nov 2026
 14:38:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116183519.3314837-1-rjethwani@purestorage.com> <awSQENPQBd7ogyyA@krikkit>
In-Reply-To: <awSQENPQBd7ogyyA@krikkit>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 23 Nov 2026 14:38:29 -0800
X-Gm-Features: Aa3M54o9TN-CRk9fIngUEHWt_m8XYLfhqb3UWdu_Qp60Que949if8U9zCRR-XfE
Message-ID: <CAKaoeS15yiScYY3uokc=DR++M-R2fyeUoK-qAtMPpbkyaqY-rQ@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] tls: fix socket use-after-free during device-down
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alice Mikityanska <alice.kernel@fastmail.im>, Tariq Toukan <tariqt@nvidia.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:12=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.ne=
t> wrote:
>
> 2026-11-16, 11:35:17 -0700, Rishikesh Jethwani wrote:
> > tls_device_down() pins each TLS context, then drops tls_device_lock bef=
ore
>
> pin =3D hold a reference?
>
> > switching ctx->sk's TX validator. The socket destructor can run between
>
> Please stop calling it a "validator". Those abstract references are
> just obfuscation.
>
> > these steps: the context survives, but __sk_destruct() frees the socket=
.
> >
> > Switch the validator while selecting contexts from tls_device_list unde=
r
> > tls_device_lock. The destructor uses the same lock for its context put
>
> Which destructor? We shouldn't have to guess which functions are being
> called.
>
> > and list removal, so ctx->sk remains allocated through the switch.
> >
> > Checking sk_refcnt would miss sockets whose queued SKBs still hold
> > sk_wmem_alloc and require fallback after sk_refcnt reaches zero.
> >
> > Requires commit f08d8c1bb97c ("net/tls: Fix race in TLS device down flo=
w"),
> > which moved the destructor's context put under tls_device_lock. Include
> > this prerequisite in older backports.
>
> Can we add the dependency in the Cc: stable line instead of bloating
> the actual commit message?
>
> > Found by code inspection. An ASan harness running the extracted teardow=
n
> > functions with userspace shims reproduces the UAF before this fix and
> > passes afterward. Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).
> >
> > Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device =
goes down and up")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
> > ---
> >  net/tls/tls_device.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
>
> Changelog? Links to previous versions?
>
> > diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> > index 4cdfbb57ecff..866193a506d2 100644
> > --- a/net/tls/tls_device.c
> > +++ b/net/tls/tls_device.c
> > @@ -1345,16 +1345,19 @@ static int tls_device_down(struct net_device *n=
etdev)
> >                   !refcount_inc_not_zero(&ctx->refcount))
> >                       continue;
> >
> > -             list_move(&ctx->list, &list);
> > -     }
> > -     spin_unlock_irqrestore(&tls_device_lock, flags);
> > -
> > -     list_for_each_entry_safe(ctx, tmp, &list, list) {
> >               /* Stop offloaded TX and switch to the fallback.
> >                * tls_is_skb_tx_device_offloaded will return false.
> > +              *
> > +              * The context reference pins ctx; tls_device_lock keeps =
ctx->sk
> > +              * allocated until the validator has been switched.
>
> I don't think this comment is helpful (and again with the obfuscation).
>
> >                */
> >               WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xm=
it_skb_sw);
>
> --
> Sabrina

I sent v6 before seeing these comments. Please disregard it. I=E2=80=99ll s=
end
v7 once I=E2=80=99ve addressed the review feedback.
