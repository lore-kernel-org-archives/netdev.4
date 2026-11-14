Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674040;
	b=39yw1IVdG4kGXziZYao6+qdHNYrSNZSMEWs1//B+zq7ar7J2ULPp0aEjXiNpyUkRdP+2
	 6Wt3ov86JqZ/bqibnK6VIuFB2VMn3FchnT48X3lxE8VyyEUiOHJa0KnrV1ioLK22pZNyr
	 o+KRPeP2cyPt9yjZbvnN4MhyxtunymkE25Iejwqc2dtx9yqsRi+cS5UlfvYFU+cnk6Jww
	 KHliTriaSn8npKU/5v1vE94RFvjADxj4kv1Fb9qTKFGvlIBSqGDGAR+4JIE01+4eLuC+j
	 GCoEA3AI9wljGugEBNpL1D0Ya3p/dxbqU2NUpFfa5DaQAshNdqQLHC0BPownJRpD3OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
	b=2v4T8P7nlvoZp5rG+Qr+swCacwIWljAE53Pho66TRp3ST6oNzo5o+dsdq04W/7Nzz/Lt
	 pA9PXsGRQw6FEs9KV1Whp23HhWYzITRH+fgUkP/4GYg0Xvfq70vGyOOtK5zdf7SVBKcr3
	 OWTeMzq3joLrm0bF6FpCxUlh9yUtO+PV6nLZnK0IJ3tZXe3b8+LXuR5D6DJET8Ue8x4ud
	 892G3J6tob3Fl8EcngUmbOeGlh5nobG7nh6o6g6u+rORgnJY83tsmWLPr2tHekTR6kTCX
	 T3Fo4m3SlyoVV1g42tE5MtmVvrZ01QQB+cdiS72nRafZZJriNYkpvICAiV5iFR21vGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWFmu6R0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F060A2625
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022F060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWFmu6R0
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8490a7d6696so2046500a34.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674039; cv=none;
        d=google.com; s=arc-20260327;
        b=HlAFgDtiblku4j2OaYiujql/8wNHO2ikMYDBVpeWFPohGxFyCYiIa1d3TvGubR0DDL
         0LT2cZQk+oeNStcv30nrVDNRQMe/h83O6zJbTdercITWcs3Qboe9T/FEhKHYu+AHFA4V
         W9OPEaTmvfj0O6t85Yb3vCahnwln21mmP/nCjUJiVW+HE7M9okVSHw/NPqlzsDi5qg+6
         xM69qWTRNrb7uYoGwmDAanNxXo571RIDh23n0KjOPzHJ+jLcBK3AqmtUYtrrkPMRxuxC
         ADyWsWZcSlypRV2lCfmsXt0QP53wHQNxbfZTAiyjXCiwM2WQ5fSEzj5v2sjBCgMaKsTU
         aJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        fh=YGPmnbT5iHb84eZ/YeHcCo1+/rX48SlK194wGLbQIU0=;
        b=e6AKGVKMuPJ9lPtFxmJIa8A/MbosvVc2kupAipmWnFE2gf7p3tr179FkX+sfWtcTau
         ZXvr8t6c9Va+rktpDIQHuZjvxwgkA+oqdbNmFKOchC03EBARhWW8TTTp70rvJDc0f4A4
         fxh/hwJS2EoQBt7gafV0cRyY23Efjsn/uxvHVcXoeCFbNJzkbusbnTNnsRrDj90c083P
         Um1IgFWCDeqfOtkk0Pn3JYr51Z48YypbCSMYjcpkCV30Rvkhl79bo+XWk1cSMlnNOHRz
         /trAhCSLN/leozdokcc6PWexI2GH9l68DPBOj3gDAkitA0mjzDILNlGHO0j8MBTxXsMd
         hUuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794674039; x=1795278839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        b=OWFmu6R0C8YL4ENs8faaN0ciYYzcVEDiys7E3Uc06wkN9wS0JTVIkyPPsPF0wk6kgC
         JlrWhzO3erRR+pXGWPERJc5tNwtVLL6gpoj3j2D8QLHnm9Eai/MocsOJ6BU52Y5zWdkz
         y5a00k06+ZzW6RGk6KasshxUDxNFsF5JMuA0DLG/kc/1tTLB5cig1EexuJMDKQIW0OU3
         JcfOl+rZExxQx26gAzKbJFglqWVh+5ROuZJ6vIurtJtxxFw+VrImfiWRA7HWPMUlSdhO
         N20GoErMxH/K6Awi7nNir4kqVtf3WJWqWCBmYrwxv2IYBER1VSgMSALqlWuDFx1DlgGF
         SO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674039; x=1795278839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lo58poqNgMRn9QhqN2THpqX3X97MVjPAOqUhBfMg0U=;
        b=DMl6IMtX9Ed4MvSytdFQvboQ5NtvKcFxm4UivH3fXYHAvlxuDYaG7E2kYBwVberkLH
         wyzIcuoOGV50HAlC8N5MDwcsQ9e3Y9VpkkpY6l3z3hFCiIXKWoS35iUSz4KiKlJz9lyR
         cr6nI3k9KHR5Z19NkE2VQhiYDdg5MnTIwaNqqb1sQSDo0n2lL2JrlNa3KuKSTWa0SlcC
         dCnM6chFvrz8Z1IrrYxcVarzTw+BPbFHdhbnm3QTrANRwGoVbH7jem/kgh3P35X8/IF1
         abaDdqMbOzLFPrfdy8NrW/qvXCtc0QIzfrZvJf43aAG+XOVAlirpMUn0tAGUDt2OVbrG
         dcuA==
X-Gm-Message-State: APuU4Z+Tjq1ZHQzZfWubd4mnIcojY6hJBlEb5eC6LHeS2/ggNLV10OrM
	+MHg9jkBO+xGKT+lWBfqU3+hcyG76aYQPsvvueJfnVhRum3ZdRHrenzN7K+QAYhkSkaRR/YjLWg
	Vez1IXL2Jyexs4fYqUVVs9jGaCl24cq0=
X-Gm-Gg: AYBFou2JFZFw/aOXLO/RP+UmgTJOUufDaXNp4yt7EVz+hmP//JPw9U2x7jDK7fPIAUx
	F6uEO+xuKeFqycNeR30WrkX1D2LzxUc7bsceWBcW+LxC6So/2qHD4qzz+VwKUcruuc1qxJK/kHe
	+o/XQo3ILaH4dbyoTQBjXTYetLq8qLRtRUXcrmNZijq+WQStRebmE9EzLduAVSuqvQM76qY7i7y
	VohNEyAdIqCtAeeWdmymjOe8tMGzY21wYlQwLAoQGwSC0aqz7SVlGUYfK6aU3rMZcoaCbUIf1yh
	wBlaUfKuoVRfZ16kigbhS9HnW6iQjaYXI1e4zacead16kkHVYybFniiZq+HwcvEw/l3bobISSMp
	IbZQc/Bbdo7Ya1wIZ4TFwehqMCJhSj2IGxKldwcOqSme9NCQze3ts44qIAU2eaiqK/sktwhmMkU
	b9+qGbeB3lXNmEktqVkwPVVt/70BQ=
X-Received: by 2002:a05:6808:1828:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-56e62c65aebmr5235131b6e.16.1794674038766; Sat, 14 Nov 2026
 08:33:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111163954.1132921-1-mmyangfl@gmail.com> <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
In-Reply-To: <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 15 Nov 2026 00:33:23 +0800
X-Gm-Features: AclHuK-bXIpGCX3Wcq3WkSJlabtqODxxVnCuSNH-sxjj3O3IH3tG0EmoCH-wbAY
Message-ID: <CAAXyoMOokp1yJYKo-r9MFehrVTLcL9+eQQ386Ycwmw0ut-KVYg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 11:40=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> >  static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
> >  {
> >       struct yt921x_reg_mdio *mdio =3D context;
> > @@ -108,6 +196,12 @@ static int yt921x_reg_mdio_read(void *context, u32=
 reg, u32 *valp)
> >       u32 val;
> >       int res;
> >
> > +     if (!mdio->synced) {
> > +             res =3D yt921x_reg_mdio_resync(mdio);
> > +             if (res)
> > +                     return res;
> > +     }
> > +
> >       /* Hold the mdio bus lock to avoid (un)locking for 4 times */
> >       mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> >
> > @@ -136,6 +230,9 @@ static int yt921x_reg_mdio_read(void *context, u32 =
reg, u32 *valp)
> >
> >  end:
> >       mutex_unlock(&bus->mdio_lock);
> > +
> > +     if (res)
> > +             mdio->synced =3D false;
>
> Why defer the recovery to the next transaction? Why not do it now. And
> if the recovery fails, you can report the transaction which actually
> killed it, which might be useful for debugging.
>
>        Andrew

If the recovery fails, you have to, anyway, try to resync in the next
transaction, so recovery here does not help other than adding more
code. And we did not and do not report failure here, instead we let
the caller do it.
