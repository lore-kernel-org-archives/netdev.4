Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996509;
	b=RJ1Vmig/7/dznMcMefxRSdpVY0LNoAr5MuHDOSYTThNUWK39EqGVtoDJ6Bgp9XC5OvPi
	 akcHDye6DhASetvbxipWpMULmQXazrZ+zrVjt0YXrPbFB+iDrgQo9JVlZZk/HfX5vu21H
	 Tmiik724TDmw/c5HwjmuSaT9t/DYVESoT+nmnXY1N4QQAeT6CmDhvcTBihwszaNGDJW7P
	 4BU19CewTlobetQrCl1L+VFvtBKEMvjFdcCZyNuUnGgIYywICiDWH6vxgwVC1HIjUfKPM
	 22yWvo2oHswOoiKJAYIrrkEFMuCXpLLZlzCskwImdT2lehb363308ff3ZOWFEM2KLNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996509;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HJGHBkg8q9GeoAXMt47s20vWqfkaH+s6d3oyuiKMFTI=;
	b=jSnSOe2o0gLi+hIMQDInesuJpoOCL9y3SSPvNkdMafgN3veDGehzBouc9l4zQdr64dtO
	 +YfgmEC7GlQTrbdmlm62B21cQi79MbEHc8sq3zh7F5CV58nGGX6b1h0vGbsN9tM2WUnfz
	 daJkjgbyMA77NbOe5K119bjlOCgrb6a8hTsGSqC4N7Ygb9tauS83BdJOrFJw//YKKGoEY
	 aNkzNfze5A676YjyZljvKg93EGoJSqKVJX4c/RYPdeYiPikREmgw0uI5vIaIfnfdIu6XX
	 vOKlVnBbou+AZ9H/avUUgntT2WDIzViv5gTR+YsEQddVwhI0AlLCM/Q/PObegpSypjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0MfZbn2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CE606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0MfZbn2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6331F000C4
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996508;
	bh=HJGHBkg8q9GeoAXMt47s20vWqfkaH+s6d3oyuiKMFTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=o0MfZbn2MHboK60qcGlg22D5CdWPmwCpHEprZnLSHVzHe1UPSAxCC5GARFAfQRxTU
	 Grwuz8e4QSeYNdQwYDID8vc1cfD3tUKhX8vQGjscZE8oyX6IuV+cEh2usPlTiOx0a+
	 yy85z0MTjRB6uc4OCROtsRETR3Sl9GhK7XZI7JtdJEh8kloADvzuGyN1WR2/UkS8aR
	 XAY9zKUwh2JVILiSlWzN6sMEvsSYRqJECp2JCbbjKdrhC4IqOKT0KklTbHIlqOHH4l
	 XvKYLz0DLorSwJCHkpuzjjp18dShiVcyl+0TI3rxS/J9TIFxAFFQgkiBicSqD/KeJf
	 TW1bgQKSFa1KA==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-716d052dc23so405859eaf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHFxs8bBqtyzyYXuReYx1tSbkDZGPFWlz9bV0vZ4tW9YESl33b4FZ9BgmdEOp4Uwelc6TOg1So=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nqzjv2uaU6AHXqvxX7iWyOO+kLC0NbFW2MJB2Cz/tL26iDoZj
	h/jagZw4fZcyySF7tmMl4WkWentbWs5x72E72vtxdWBUycGqOAWUkk6wD7Gxnbyy2iK6KpSBrum
	vSBxkDs7YKXXPdQ+P4bQK6Pm6qTjiT74=
X-Received: by 2002:a05:6820:4912:b0:6b3:bb82:2736 with SMTP id
 006d021491bc7-71b18485659mr1455456eaf.17.1794996508190; Wed, 18 Nov 2026
 02:08:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118005048.53393-1-mason@kernel.org> <20261118005048.53393-2-mason@kernel.org>
In-Reply-To: <20261118005048.53393-2-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:08:16 +0100
X-Gmail-Original-Message-ID: <CAL4WiipsyMP6_XMtCMLhDVNpKEEZvus79KKDJQoRwFafatRgYQ@mail.gmail.com>
X-Gm-Features: AclHuK_0_ncZ97x_WGsloQNvidD6Heqolgw-euDceyg4XymZYSrp8qoyHOmD_Yw
Message-ID: <CAL4WiipsyMP6_XMtCMLhDVNpKEEZvus79KKDJQoRwFafatRgYQ@mail.gmail.com>
Subject: Re: [PATCH net 1/3] tcp: don't let __tcp_set_rto() return 0
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> __tcp_set_rto() computes the RTO as (srtt_us >> 3) + rttvar_us, in u32
> arithmetic and with no lower bound. A comment in tcp_set_rto() says that
> the algorithm guarantees an RTO above TCP_RTO_MIN. But tcp_rto_min() is
> only applied to rttvar_us, so that guarantee is lost if the sum wraps.
>

The wrap is what patch 2 fixes. Once samples are clamped to 120 s,
the sum is bounded by ~600 s and can not wrap anymore, so this
paragraph no longer justifies the patch.

Also, usecs_to_jiffies() rounds up, so a wrapped sum only gives
rto =3D=3D 0 if it lands exactly on 0 modulo 2^32. Any other value gives
at least one jiffy, and the backoff recovers from that.

There is another way to get 0, with no wrap, and I think this is the
one the changelog should describe:

tcp_rto_min() can return 0 if the route has a locked RTAX_RTO_MIN
metric of 0. ip_metrics_convert() only rejects a zero locked cwnd.
All other knobs have a non zero floor (tcp_rto_min_us sysctl,
TCP_RTO_MIN_US, TCP_BPF_RTO_MIN).

Then a first RTT sample of 0 usec gives:

  srtt_us   =3D max(1U, 0 << 3)            =3D 1
  mdev_us   =3D 0
  rttvar_us =3D max(mdev_us, tcp_rto_min_us(sk)) =3D 0

  __tcp_set_rto() =3D usecs_to_jiffies((1 >> 3) + 0) =3D 0

A 0 usec sample is possible with usec TS, because tcp_rtt_tsopt_us()
returns delta before min_delta is applied in that case.

> tcp_retransmit_timer() backs off by doubling icsk_rto, so the backoff
> only works if icsk_rto is nonzero.
>
> Of the three callers, only the thin-stream branch of
> tcp_retransmit_timer() clamps the result. tcp_set_rto() and
> tcp_ld_RTO_revert() store it in icsk_rto with an upper bound only.
>
> The fix used here is to keep the result of __tcp_set_rto() from 0, for
> all of its callers, so that the backoff recovers from any state of the
> RTT estimator.
>
> Found by LLM code inspection, and confirmed with LLM generated
> reproducers on an unmodified kernel. Fixed by LLM, and tested with
> the reproducers and existing kernel selftests.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Linux-2.6.12-rc2 had no rto_min setting at all. rttvar was floored
by the TCP_RTO_MIN constant, and tcp_rtt_estimator() had:

        if (m =3D=3D 0)
                m =3D 1;

So the comment was correct at that time, wraps aside.

The configurable minimum came with:

Fixes: 05bb1fad1cde ("[TCP]: Allow minimum RTO to be configurable via
routing metrics.")

Please use this tag and reword the changelog in v2, or drop the
Fixes: tag and send this one to net-next as hardening, since it needs
a zero locked rto_min route metric.

Thanks.
