Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448997;
	b=RtCVPzMcmwDSbe7dhEvknqFx1D+r6B+jZ69Rqv91EwZR2r9vtQQiU4EyyIYwxfVOzwhw
	 +KhjaqnEAm1R3FXpZptLGUYtpiWpA0+rKQqMojyKVcg1dfL8eyoMg5iUxqvHAKOvS+KLV
	 ZmKFmwNbmqGcTXhXb/QQSxbM/1pIP/IPRI6mUr1DnUA+IO4W8fY6THK4PLG4dXfcKgHWR
	 YYbUkeZeJLCQDqAh7gUJvCqSq4ML/KRzANpEJ96dg77IG1NrIZuNboAd+b9AbpaLdVpT6
	 G7j8U5n6D8/eExktpYXS6daziQ0g52yCAYtl2DKKqpmscy5DT2ldbZDWwxHit7u13GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CMmQ6INmXiwcGVG7cDEb9gETIEOSBjI9cIVQ8TCWVFM=;
	b=F3G+v4Aky72IY46ikMVHC1eJQbPo5aNDQHM0rK36CHZyV/7r9qVfu0ODlUOc+TpUF3LL
	 Vyao36eENA7HiuEZXaY0SrNFX+nzTKaBRBxWVRY5TVIQQ4om9d0ebDkRlp4f3WIZbf4tN
	 OAGh5MPTGNcjGKkaPx+Vh4eyaIA3rf+PVh4x1sUCkwYDQepmj08LdKse8Xuf4mRT7u/aC
	 v9L9FhRF6pZaK3DLQH3fyTREMqi6WucKHC69YAqeLsrADVcF+wvC4mvgR0wi/ryaFbtcF
	 G2os1ldf94tUHUcJ67TmSdjRj6bc77pgsQAZEELmIYMN/A/xMvOQ5g/5NKfgclv3+lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eedCJ9tf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F10606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F10606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eedCJ9tf
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1292742b3a.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448996; cv=none;
        d=google.com; s=arc-20260327;
        b=CB6LF4FmIEOGbdhxjDQxOn14c7pYOcfroOICorg3g38YXDwFYFLhr1UQ/bkc3sXLs7
         4RGCfZ70eMACt/BtTmfa09Pqs2eZHBmTJYr7vLwr6U+xIs2Mmq0WenNHhnMPcej2EYPA
         YaXvKWF/jcsfF+If5ggxlCmfX67duZc7Ypy3GASywP/DGhwuB8hJjztze1UF6CrIXptm
         vqAYh2QrAsFbhjALyzG+Dqcj3y9enWK/5b3vM1/5Wvno+1tW7tBSHj7T6pgZrHOuoATf
         Ua7Y545akwqb0hElLZIwhx0W01NTnVNqKbdCsI+LXzwHPfBEiizEZ0vHlucZAuvvwmkz
         4ZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CMmQ6INmXiwcGVG7cDEb9gETIEOSBjI9cIVQ8TCWVFM=;
        fh=ghJ1UPgPWr5VnZE8myhcu1MOnxiIGrQClKxo/o+x7+g=;
        b=oWamI4boA50sz+6LgwzoG2GgBGY3BRKeA8H/qibV6sB7XFM/5loMe/QLyWFqoEP7/V
         pNO6undpeY/oy8UtB+JlYF112yeg7u3Qc4onuNKf2J6S6AhY0to5QLd19/J9AKlximKO
         tR+V1IDggpLE5rmyFiXZ0TUcViKe2saCzzyTWZ/rNlRYivokidcf2wHK2YzdlF1N1hrA
         DpKOIpcHM+ZQ96HsPTjck7XDy5FSOA3c6F9maoccUBvj9eC3MVydNFJiMOXoefvD0ubt
         kSBZcgBm7gJ5h6HCjHc2zFsgwjr4P1q0ORSkeMb7AS0021Klhk/f7y9Ud8dNfNQzmjAp
         sCJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448996; x=1796053796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMmQ6INmXiwcGVG7cDEb9gETIEOSBjI9cIVQ8TCWVFM=;
        b=eedCJ9tfTDSRzyln54EeHnzpZvJfRz9BWwilFHCmrk/prroJ6ckCamqhW2ClVr6O6H
         K1tBqT42ZInhovMBN+MJJlyhWHgDwmPIpbcYon/qGKi/kcF/eCt0u3L4uNHC766R7sD3
         9wZ4rAh0i1mt9s/6WrftWFKrSnF0O7STxc64IMTqKaUkQcBz26o9DPF3iVaFL8oGwXIC
         arGnIFv55TOKvFGwSbG9WX8VkFx1tGNTsvG5+9C5fRImsxaZdkQz0w/Iu5BYG+54ZiW5
         NvCElLl6ipiS41t2CUz7VeAb5l4cx933/Vi5COeXfxyguJH9y9uKD/qH6TYB1UK0FvXy
         2RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448996; x=1796053796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMmQ6INmXiwcGVG7cDEb9gETIEOSBjI9cIVQ8TCWVFM=;
        b=1y7z86XaJC7im0EKgIZUVCCCTcqQ4Y5GkhqF93ZDYYsj9Z7wipy2Rv0FLiXQ8lv2EU
         vpAAKMmX7bq0Qs/Y+Ay1e1p8LGkWjPEEfY1P39sZfwyh4aWVFGP2yV5sTreDljfC+B7i
         mhczBfjp0XzqAQdXxnXBcH7Jx7fmeC2EcFxKd1bMGyg3JDf8+X4Wq0pX5IIksDv4EMXN
         /6KiTtDRv+veoC730eQJHlROmKTRnQWyl0sJLG81p3e/6rvLu+3q7seBpbWWEGvhWKMo
         fXoP6LK19HkHSXOYK0Iu8rTEqB9niwbbMya0qajLuVCJs3mXWd+a8vqlLYL2861fwIkx
         SZCw==
X-Forwarded-Encrypted: i=1; AL+hErE8/fFvWqAb4W8iNXJIazDNa7NB7tlFJ58VEbp6+xf/zwW4edmn6trUesooMFLXK8/BZojiZu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pAHuZC18pAUyLwmMuPKdzVos83ncmcelPvvrcXNberhY91yQV
	ga+4UGCeZO+jMp+p2HHoYL4aYDvmPdoV3oKeG6Ni7ITGiEF7b76x6ZEqEptbDCzYftSf+opwHtB
	CHiKoiPm44TWK7VqPIhJ9AxNveL0cgM8=
X-Gm-Gg: AZFdTZeHHYIb6c0iubxFXPtt3xTHQ+450bufccg5A1Ge5d98OtQHQZk1jXFSXT/O52h
	eB9w97/D30o6yEHuhT6AcWLHAaStJDkI+zwrb5BvjJyFXzukFJ7ZB2qThZFbpkYpfTvzTTMWQgO
	qZ/eKP1ftIRLqOwm/PzVHXvbzq4uo46GsMvVQxqSzEtLUY/rMvRIu+mZJeJh2MxS41JMICLapd5
	GEIUrOkE8pim1TszWA/Yg6e82pvOmPoUgQgDGCAEDpDrZocABbjfXSSfL9y//tE3HmnttyLRjKo
	mXD7l9G6GqMSh/F3yW7DK0jV0KbyX3U1uNhTZtDAgOL3lIW8RaVAE0cIkhtu8OWfpVrxbEnUPb5
	ZQ5vfbmvFT6d9Vys5JqULxSlt5lAUNVdMaXxB7y6Btq39UXQWaquHPiq1X9IAmlbn3WWy7QIZzn
	j6uw/GidSqchEB7J07tt4y0cpak7tB+GLV7arDBwlDMb12FExGXaDgMGyJthirTL+VePrS5IV+E
	8Qo03kCZMXFKITNzA==
X-Received: by 2002:a05:6a20:1a1e:b0:401:e88a:66bd with SMTP id
 adf61e73a8af0-401e88a69afmr7266262637.1.1795448995563; Mon, 23 Nov 2026
 07:49:55 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117110459.44083-1-juny24602@gmail.com>
In-Reply-To: <20261117110459.44083-1-juny24602@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 23 Nov 2026 10:49:43 -0500
X-Gm-Features: Aa3M54pdoBf8iHky-mzKnZEQ3ImMVON5VYmghhM6AEY0RpAbNmQuTFG1XGcluso
Message-ID: <CADvbK_e=_=Vsqp6dxbRtdS6_chO0TebDrwXu-J0WMFrMRBb3Fg@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: preserve stream scheduler across outq teardown
To: Jun Yang <juny24602@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, junvyyang@tencent.com, 
	corvus@tencent.com, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:05=E2=80=AFAM Jun Yang <juny24602@gmail.com> wrot=
e:
>
> From: Jun Yang <junvyyang@tencent.com>
>
> sctp_outq_init() clears the installed scheduler when it reinitializes
> an outqueue after teardown. The streams still have scheduler-specific
> state that the old scheduler needs to release if the scheduler changes.
>
> Initialize the queue counters and flags individually so that
> sctp_sched_set_sched() can use the installed scheduler. A new
> association is zero-allocated and starts with the socket's default
> scheduler as before.
>
> When the socket default matches the installed scheduler, streams retain
> their PRIO priorities and WFQ weights. FC and WFQ also retain fc_length,
> including bytes charged for purged chunks. Those chunks were queued on
> the stream and the accounting converges as new data flows.
>
> Fixes: 5bbbbe32a431 ("sctp: introduce stream scheduler foundations")
> Cc: stable@kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Link: https://lore.kernel.org/r/20261104105507.62743-1-juny24602@gmail.co=
m
> Signed-off-by: Jun Yang <junvyyang@tencent.com>
> ---
> v2:
>   - Initialize the five queue counters and flags individually, as Xin
>     Long suggested.
>   - Document the per-stream settings and fc_length accounting retained
>     when the scheduler stays the same.
> v1: https://lore.kernel.org/netdev/20261104105507.62743-1-juny24602@gmail=
.com/
>
>  net/sctp/outqueue.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
> index e92fb9da4647..3dafa6e6cab3 100644
> --- a/net/sctp/outqueue.c
> +++ b/net/sctp/outqueue.c
> @@ -190,9 +190,12 @@ static inline int sctp_cacc_skip(struct sctp_transpo=
rt *primary,
>   */
>  void sctp_outq_init(struct sctp_association *asoc, struct sctp_outq *q)
>  {
> -       memset(q, 0, sizeof(struct sctp_outq));
> -
>         q->asoc =3D asoc;
> +       q->out_qlen =3D 0;
> +       q->error =3D 0;
> +       q->outstanding_bytes =3D 0;
> +       q->fast_rtx =3D 0;
> +       q->cork =3D 0;
>         INIT_LIST_HEAD(&q->out_chunk_list);
>         INIT_LIST_HEAD(&q->control_chunk_list);
>         INIT_LIST_HEAD(&q->retransmit);
>
> base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f
>

Acked-by: Xin Long <lucien.xin@gmail.com>
