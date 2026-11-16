Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858108;
	b=aQ0j0mbjwGKiJ3D76SBVUwxwW07ZHx2DanWOt8jcGsGSxoWk3k4WdDtdoGufaF8fiDmP
	 o0Yd77wSyQdAtRRftKt4DM1cNiZ62QiAxh6fOozIKTvlUEzYyCLH0tFqJUesiKzjBLRCL
	 GsRqkR5U7cLi19nwCEYzIJJ/U0D3fe6r0Y+HkY6FrZ/4P8krZIEEnEMwYmmRU4GbPZfaN
	 EzZ3QMwZdIi0H241CinheONa6QNzMRe0kDgdfe8+joAVBUt4itRCtizR/a4+FGbxfBkYL
	 pVJAyYYkib8GaOfWX6sUlBGjjK5UJ/h5r7P5FH/0BOzuTlJ3xOnYwvRD2s45aVe9Pxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8Qpg7Lun+rjFdnth3IEW1w73RGChqMu8em9m1BLidsM=;
	b=qJylDtvFZsnwyR/gZ4aFAS3vwm+Op/d/Eg2BUZmZbBIf1zP/bCjcMxFp8bQb8mid7AY6
	 vv5cYkKr9RUZu+WJZxTOx12oP7pjWGaeY3WuJEXqijXlv9B2x2Z6OrYzqFMLG5SA5tgV4
	 DyfjB2UaZNLES2Ju+8c4atrI26OwrT35nXaHZhENWtLkf6ZLPrFezVnWrYTB6rIYZ1JKL
	 TmwUo/ybg8p6iGlVMhfcde1JIncg2Lkx7iezlpl+s4yEGvEw+XbRzC7Glec5pz3UMI/8e
	 Ez+1oI5yEiAszsDM9OvWI/kCjlQh0xOvviyheAjutfhVld3l5WvNNI3DOsEGM2UDzsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mzfzFhIU;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E08606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mzfzFhIU
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4765609a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794858107; x=1795462907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Qpg7Lun+rjFdnth3IEW1w73RGChqMu8em9m1BLidsM=;
        b=mzfzFhIUgJ3D0WOPqxyezYM8JZ/K/Pl0BrLHzyeMNcvyMVII6OA//jCm4TMd0TwQTK
         s6oDFbTRQ8nb3wAF7IjVqSQdMDs+/9NOjRtfMbxLv2Y83t12bi1seyLxyMoF1qF26Gzs
         7CPKRXW6wQIEzHFD2IgdV12wy2w2WOekUlY0E7T1l8lvNSL78kavkCkYGamvD2FfqTLr
         7bYHnMaW8MNYQEJ2fh/04zAscTLNAfz7hDxStZcDuCv53yRJ+rYoa5UUhgkcmUtR+BIm
         +RsPgupzA3koqw7pNcxRc7Jv10xjLdnU8aHwftzBjXCM+KCQ5o2AtHRZIogZQN4k6Mdq
         u5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858107; x=1795462907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Qpg7Lun+rjFdnth3IEW1w73RGChqMu8em9m1BLidsM=;
        b=PgcBy5xPBgsEsHVChgJBQRZXMKc7fOFAx89kLGyE0t+hbU49GgnMR/XvMo7eDJIw9U
         V7ftHdLibHYgBf2mle8T7/JdM5lbDbTVVwORTPODx1A/xfZ8+NDwUtHr+bODdRrlOCdk
         I/nuWfECLxg4wThDAu1TkUx1Isf7OGb5lrk30TndRNKVxSrAwPO/3I8noTHLHuxuZ8+T
         koggejkbaUm7B5NUOnI+K/tTkp4V86lEB7kf6MOOuooCKF2zYezPT6cqQ09YEZKg0Xrd
         qtldNBq8jHjxqlr2r5o+isDuZv7gJbWZl4F0JYWaPTNn1laqTn2inH98A34/kwnNgc/x
         Z8vg==
X-Gm-Message-State: APuU4Z+r2/swa2P5ufyTYMPAoH7Je5AgzFae+NnJqwap8qvUoKYfCifU
	oPvWg4LiZrQEtl8x15Y+K3JCPjStuHai202f4J5vxAeHO4txh9wgyzuB9hcgPpVjZgChecmw/mS
	rXqDz9dE=
X-Gm-Gg: AZFdTZciUZtoJVhbmxBBAN0TF5yNfFduQI8BtlaNWsz58YOZsYMBvGZ6DILLHdqjwqT
	t713QcbDL3anRI4l/+jGz1+0XGmt2vl9d1u0pNqOi06tBzcYkcuvWEL7WVZ46vAcA+Q+BngFO/b
	sKwPvRxeG440OmeOx5ttSEvL0C51ZCofd1aJS2dpHX+xh/8BMdS6SWJk5IwrRvbX3MZAdQyqWUg
	EaDdih9GxRCKO9JOZUTaJIxbUYSIrQjr06uORmPTorWliROeBSvJtd+7Xhu/q//slFQriIMZ//V
	JAGlJLysiWZdk1Sr/UszIzDRroQYOjeIKdtgk1lr7MrZZR0dzhvGl9EoNQvIU9d9SaToyN5uF5d
	Fz1erkS/13P8fGlEi8583OiaZxkOB9MhDuEVexnsuFb4+i/dDo4JgG4HO4FfHoNEnF+pt5RD0rw
	tEC/uVxlgM4FRWHX8xcVfj3OoWYNHxOLq9/Uvv5jtaIIB0VKcDdNyH1J/RlvdynQUVLF81wYCV9
	mOgO8vHjdfSs7ln0o77nHsUfgRCTA+EGnkJ8XmkI7IxrOtnDHuG/ycUJ7HmpSpglg/KEySy+WlL
	JVgsiaNsXB0eW9KwNhYuR8HzeFuujtv2YIoFPEIlIrqS5Q2Gk64i+Gzt1XgUp+gHPkFzM/+ydmt
	ZBKGsZCaUxB08P3fCdGGv
X-Received: by 2002:a17:90b:4cca:b0:3b1:96fe:f5d2 with SMTP id 98e67ed59e1d1-3b1b0da20c4mr11326055a91.65.1794858107296;
        Mon, 16 Nov 2026 11:41:47 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeb2517sm573244a91.15.2026.11.16.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:41:47 -0800 (PST)
Date: Mon, 16 Nov 2026 11:41:44 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: ojab <ojab@ojab.ru>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH] tc: fix build with flex>=2.6.5
Message-ID: <20261116114144.45ccac93@phoenix.local>
In-Reply-To: <20261112084107.517-1-ojab@ojab.ru>
References: <20261112084107.517-1-ojab@ojab.ru>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 08:41:07 +0000
ojab <ojab@ojab.ru> wrote:

> Since flex-2.6.5 [1] `yyunput` takes a single argument and build fails
> with:
> ```
> emp_ematch.l:35:69: error: macro =E2=80=98yyunput=E2=80=99 passed 2 argum=
ents, but takes just 1
>    35 |  static void __attribute__ ((unused)) yyunput (int c,char *buf_pt=
r  );
>       |                                                                  =
   ^
> emp_ematch.lex.c:466:9: note: macro =E2=80=98yyunput=E2=80=99 defined here
>   466 | #define yyunput(c) yyunput_r( c, (yytext_ptr)  )
>       |         ^~~~~~~
> emp_ematch.l:35:39: error: variable or field =E2=80=98yyunput=E2=80=99 de=
clared void
>    35 |  static void __attribute__ ((unused)) yyunput (int c,char *buf_pt=
r  );
>       |                                       ^~~~~~~
> emp_ematch.lex.c:1836:13: warning: =E2=80=98yyunput_r=E2=80=99 defined bu=
t not used [-Wunused-function]
>  1836 | static void yyunput_r (int c, char * yy_bp )
>       |             ^~~~~~~~~
> make[1]: *** [../config.mk:34: emp_ematch.lex.o] Error 1
> ```
>=20
> Use new `YY_NO_YYUNPUT` to silence redefinition warning in this case
> and skip `__attribute__ ((unused))`.
>=20
> [1] https://github.com/westes/flex/commit/721622ea6e6aaf3aa7e55d939679f21=
e98b76d86
>=20
> Signed-off-by: ojab <ojab@ojab.ru>
> ---

There are couple of concerns with this patch.

First, Signed-off-by should be a "Known identity" not short alias because i=
t is interpreted
as Developers Certificate of Origin. If you resend, please use something mo=
re than just "ojab".

Also, it looks like flex version 2.6.5 change was later reverted.
AI discovered:
  flex 2.6.5 renamed yyunput() to yyunput_r(), but 2.6.12 reverted that
  and restored the 2.6.4 behaviour (flex commit 160a160). Every version
  in that window, 2.6.5 through 2.6.15, was tagged within the last week;
  flex had been on 2.6.4 since 2017. So this works around a rename that
  upstream has already backed out, in releases no distro ships.

Bottom line: don't use development versions of flex

NAK
