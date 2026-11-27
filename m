Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795754104;
	b=HajACWWHrBUHK6N8Up9OOp2mTAHJWJlApepw4eG08H9gsNrKnkkO/VncnfhkeeoiUXnP
	 2+xiTjVk21g91lI3a8Avx0bwdKb7kCH6UBkFvr1iArqRUT7I8iHDHvXkSuiExXe5DYKKp
	 1Npo1Gtko1TUfGDzVPMA3EhafEEDvnQuacKsoFmVUGjp8wsrAu2GPFkjKO65hKOtDeBjw
	 92ZpAY2BG/MP7JUtJtwCgHXV175pW2NEziP6/PxqQiYTVLbvzPNYJDUubZvZEyMR17Xyq
	 79BB4NgqoMwmrJ6ildwCgBISzq44DwiL2m2c5mu3Di/cvT51IZxzQ+mKhaQKgBh01xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ne+doQTxmSDCmVDa/bZ4XTo6NfFblqj/jFTonnlW8Nk=;
	b=4S6scRVbi2Vu5NOVmzxmMj2Pwph4L4WT8zD9J18UDvCy0SLXElJUNyp916zqtsdq21ER
	 r0ImKbGg4ShYI7jcAYmOAmX27jXZS1CRJX73tqrC2+887caaF6R9E3Tf8ehxNfhzwHzcz
	 7P1gNAucd28xQ6Cbz7enrt6RS13gq82KS39Css75JB8SkRH1SvKalsNGljrUDwQQtsENW
	 zw2yjl71uUWJQJa9ttjrV/UUJyTiXe9FoyEybMYLevkvuDkRJJVxC5qqZmOpSqwdZs2im
	 FUg9yIgDkgnsYjdrCvzo/7wDD6yG5au31GyPtV2HCN3fvQnMrLLTwDHMy7eC79t4jKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrniXXAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE313606A32C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE313606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrniXXAV
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843cf077f10so10216111a34.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795754103; cv=none;
        d=google.com; s=arc-20260327;
        b=ky3S8dcMS11svGTRU5N2j+yKt8SHTy+93uF9g5v3S4/JtRiRruzdKmcM5dUXVu58To
         YRf7f21ER2uCtKEEfBwjcFQ9C1t39TOh9UeLGt9QIW/XTk3IM/4gYQlCbamM335WjB39
         JQHpGIZ+eAcUUZu+uHPPg+AoBpAbRVTO2tpK5exedhOaTzS5okspqUNbMFQc1gweNbjV
         XVHkvY5gmot7uLzBItGweAZCDaQkjU+dez3W3OCKX52iRbRRi4JHGfjI9IIazoX55Iye
         zJuzXQSW3ms/8J3AwJvBGswH16yKqt71GWTLMXZMTcbKikU8Uj9ZPJxINR/wThMWueJb
         kq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ne+doQTxmSDCmVDa/bZ4XTo6NfFblqj/jFTonnlW8Nk=;
        fh=cGl0IifHPMEMUxH9YVQyzAelp6MWHh+xro/ZMJ0EOOs=;
        b=QsS0dlX/enmtH/vG2gS29/p6Nh5RvqYdZOsco4BSRCJ5kXsEjwbNqVhkSWytN4/o+Z
         53+SLJrH0aATDgC0MnNwesK5U8EAmOqCqrUG1d2vCa5seAeRf/m4q7989wH8VaPhd5zU
         oP4Pmj+A2zSDAKEwKivRhT3dK4CLlaedO1X4+F48QqC6jeyNhSyia6824yBdWTXnM0xe
         QidCC2WM+z7zrDmYKRoJKimf0ZH5/3rjJCIF0tsRzmgZmA24EfHC0mv6RlBHpVUd4DQG
         lN1Q2J6L4esYU3Odv9/Eq2JrMZUMYO9+g5amk8b3/UPZg7ZRAjWmj6OkVwAjPAkOftN4
         mzGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754103; x=1796358903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ne+doQTxmSDCmVDa/bZ4XTo6NfFblqj/jFTonnlW8Nk=;
        b=xrniXXAVXQdk8fzvCH8JAiiHHEK2NbRszi7yWJD/VXIZjfS8ljioLUfS/MzUg8EuX8
         aRjWwFFIbYqF2u5C3fZLF5IOxbfsktGmt7wihQE07acgDzWglSoXnkK+iYhiUXnrCOAz
         5pvR3ESQNL+n640CW63cXqD/eIaHE8AfIUF8ObR0i4Uu8XQKAuIjGCGib/BKu3f5rGq5
         ARnss2zdmwOYHQPJclQVe7afDiWkPYvdrsWqaTI/RvR3GvZ6WXNLKszP3TL4zfOgkL7E
         XUsQaA7/U97v0McmjoL3mlxCEXr6GfApj08RAMUQeA/P4S/Qzq9SCNiOG5IKCB/q0luE
         1aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754103; x=1796358903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ne+doQTxmSDCmVDa/bZ4XTo6NfFblqj/jFTonnlW8Nk=;
        b=rqoh1oDvkwyEb+toIIoz8UXDeYPPnezE4GHyusUAeWrfQpGa1PRL8esyGKZ6ZUBrM4
         JJjhj8/YJ4+YxGzGVEGNxu0traL9mIdYB0NOB85atY3uLHW9XCGEGOY7sieJF2wXlBk4
         EkXLjiFM+Oq8MsF3Gax4rouU1aBb0H47iZPDumtIFl2G9sPukkhDic3Hsqflb9r7L/bc
         +5MCKkP5Ya6oruI7tIZWYvAbOZ+FpXK+mDqjO0tSKgjSvZ5A7NNj9/HoVLjgD0plt2Wn
         wxGUgYF55dKndu7EPkFrTuBaZLbMdq3ljAo72Sr5KXXc45PMzG46B+tkx1rIug8njARW
         uTVw==
X-Gm-Message-State: APuU4Z/5ddX5TmiwNt6/n9klekQoFO5qvq//E671DVgEODBzkHAWarVr
	Hs4dk3NKFvJZdI4f0ne7tEDeDXcKvLROiZeWDmLnIdr3OhSbeISdM8J0EQKW1wsgqNhPXWfeYSb
	s21Xioe+d34B6VWjkxKj4vYZtP0z4xjI=
X-Gm-Gg: AZFdTZfkbm1wKuRPKCqGQV1NsfMNGux3t1bB0o+ktgwRZlv4xjyw0Cl8KHOTJDk5PGW
	tQEkCxELHGtZZVIUQiathcr34E2hUemQpMVX0bv6DbYf5fME3YyrrkK3vWEiYMUyob8rGAmPuPD
	Bpq0IFvXf+jLSjzoecz3Z5kttLCGZhuVa/9W0W5w9BlU6MDmtz5ZGNJE/eUcHvDXWkf+ijHjZBP
	YcptPM6gHeim9FWWMbKX4hauo9P7dxVRawP3Tbed488L0dpMj4cvr5I7Eq9LPEanBXtajsz2U3Y
	+2GBKElstEK+aQ4V0OOCCJbUcCT7dmCWiBA9j3GPxrvvy0IlcvBsNcGR8G7VEc5CI145O3ybieg
	7OothgPRJCu1MhUmL05sCwEoYYrFm79DTgjyDMRN/ncBV9S80x0xYp3TzrUltvB5MW7aFQqE=
X-Received: by 2002:a05:6808:c16a:b0:4f1:7c39:8a7c with SMTP id
 5614622812f47-57a0d0e3adcmr22394807b6e.62.1795754102684; Thu, 26 Nov 2026
 20:35:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126034725.64709-1-mmyangfl@gmail.com> <897d6fa1-69f6-4f4f-a7d5-88480128174b@lunn.ch>
In-Reply-To: <897d6fa1-69f6-4f4f-a7d5-88480128174b@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 27 Nov 2026 12:34:25 +0800
X-Gm-Features: Aa3M54qe4WkLOw6iZqjxIQV9eoAJv9dXosiiJurJ1khXtUOICoeoUyAFT56dzsc
Message-ID: <CAAXyoMPVCXc3ob96O7YD5JTt_v3vuACA56jqN6s7-NOPVkYiEA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses
 on teardown
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 9:53=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +void yt921x_mbus_int_remove(struct yt921x_priv *priv)
> > +{
> > +     struct mii_bus *mbus =3D priv->mbus_int;
> > +
> > +     if (!mbus)
> > +             return;
>
> Can mbus be NULL when this function is called? Either setup was
> successful and it exists, or setup failed and it does not.
>
>         Andrew

Yes, mdio and mdio-external are optional.
