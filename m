Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996464;
	b=rkLsiBRCxuXzvhUYigXnk2MC65FAwO7YGYtMUxfrUQGa/ESYkrhM8wGLY39DwR2jJ52p
	 nVk/b9rr1Ac50WlWdLsG4hozemgzy/s6VDxfVywPzbWc2tl5ukeSpv7jAue/PY8qpgIQo
	 c5PvatqZqKSjtRUAoBrSPN/YcJ1t07q940bklUTX+hYaloLjDTEeep5W2h817AnuNPR/j
	 PJUdu1y/COrtukjcyiCgwFdwju1HwNL9V4Afm+nShYKh1epZwZKRX2deDhEVUfniE8jXY
	 /qMV65d490qhgc31X8rEzrqhwrWGETsSYtaGgUtXnaCXY92HocdjEdkOIjj5eKve3qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996464;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2S2OrGUTyqGlhWvrNAZiu9DXCwxg30V+8Q1xNJW0oww=;
	b=qRPWtfyztD6jC2N3wJCJ1u3JOioLQKqbwMTojZZH70sPjSSTUenQpzXxoJSVG7+YDAEn
	 uTtmNFO5FutsaqQ1yHN8MLKD7OI8PJcNWW0Y4laixn0VckRabC5VLcfXB8EIHwMlzXWye
	 V3J3IPrVHwcqdftcotoITG+ID6d6ZE/dXJsBng02CqdQtobmH4IgBTf8oppusUUZLPa2a
	 YK1ZkYGtXvIO7dt8AAFnS/el2f4lCydz1YNrNm13owaODRyDs/kBn/ze/aaAVZWwvdPsJ
	 Evzq9DZKDGClK+dr1GgzvhmhtW1KAVd7eL2Fk9DrQWG8yw3lA0yqTo1Ytz/o8YlHzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZtn0TEv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3D606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZtn0TEv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCD01F000C6
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996464;
	bh=2S2OrGUTyqGlhWvrNAZiu9DXCwxg30V+8Q1xNJW0oww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kZtn0TEvz54Qb4vGb1liXxbJgWqOxNba/uH96QwKFJLapoMIX6/OXw/+s9hC7AH8A
	 viLts0q7dqu1OK/HITIw3WUMtfAlbPz3Ty+05kIcfkYchoNqwuE1Hby221PYdGXQn/
	 Joq4eqFoiawDSM36o1kBWEpt5eTidT82NJNoxmjor3aNLErSQz7ATqvJTt0AMH4tNG
	 TZUOg50d1xKqGlhPRK44KmdVCEGeqsYJ0Uuzuo51iF27xMlrOdJCa1knXl4Hl3c63R
	 qTrPk9nxbGYaJHft+7GbBzZhVTh2cJfvY6CrlszjJm4Wt5VOpN8j4pBfzJDDrtdSyg
	 VdBB2/p/W8/1g==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-717080a2d50so691577eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:07:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFedxkj30LurFLlJdGd0yuyaAyDmx5IAEaRX9T9G0SIcLnbN0Xc/6gVmlGnUnphJXCzF7Xm8GQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ioSzklSYWJB6XVaeXZeWc7OvSI1x9MhB/fGkijTJ04hbNF4cv
	r33a6RrFQr+lm+qh0bo/TXL34CaG/17s40ldhhFDeOMsm/62r3dvy3XTDC4YWPa6pEk0vB85Phd
	+rb+ALCHIJTsRLY4xO5BOdUEV7F76GiE=
X-Received: by 2002:a05:6820:3416:20b0:718:968a:75f5 with SMTP id
 006d021491bc7-71b18549405mr1087021eaf.52.1794996463552; Wed, 18 Nov 2026
 02:07:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118022813.9778-1-zhiqizhangg@gmail.com> <20261118022813.9778-2-zhiqizhangg@gmail.com>
In-Reply-To: <20261118022813.9778-2-zhiqizhangg@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:07:31 +0100
X-Gmail-Original-Message-ID: <CAL4WiirJXVjo_b_5zkBCz6rfuwWXfJcpOrnVFpZ=2kBqMf5w+Q@mail.gmail.com>
X-Gm-Features: AclHuK9FIl21h5B6xIKkXM1xm-w7vDNAJG8Rm2vJL9VhueNWzOpX9FejS4ubxGQ
Message-ID: <CAL4WiirJXVjo_b_5zkBCz6rfuwWXfJcpOrnVFpZ=2kBqMf5w+Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: roccet: do not restart from idle on RTO retransmission
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Tim Fuechsel <t.fuechsel@gmx.de>, Lukas Prause <lukas.prause@ikt.uni-hannover.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 03:28, Zhiqi Zhang <zhiqizhangg@gmail.com> a =
=C3=A9crit :
>
> roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
> early and roccet implements the idle restart in cwnd_event_tx_start().
>
> An RTO retransmission also raises CA_EVENT_TX_START: tcp_enter_loss()
> marks the outstanding packets lost, which drains the in-flight count
> while tp->packets_out stays non-zero.  If delta >=3D icsk_rto,
> roccet_cwnd_event_tx_start() then takes the idle restart and overwrites
> tp->snd_ssthresh with tcp_snd_cwnd() =3D=3D TCP_INIT_CWND.
>
> When a TLP probe was sent, the RTO timer is rearmed for a full icsk_rto
> at that point and the probe is the last transmit, so the first RTO is
> affected.  Without TLP, the first RTO can escape: the timer is armed
> when the first packet of the flight is sent, and pacing spreads the
> following ones, so now - tp->lsndtime < icsk_rto.  The second RTO is
> always affected, since it fires one backed-off icsk_rto after the first
> RTO retransmit.
>
> roccet_state(TCP_CA_Loss) calls roccet_reset(), which clears the private
> state; ca->state is already LAUNCH and last_max_cwnd is already 0 when
> roccet_cwnd_event_tx_start() runs, with or without this fix.  The only
> field the idle restart breaks is tp->snd_ssthresh: it overwrites the
> value preserved by roccet_state() with TCP_INIT_CWND.
>
> Skip the idle restart while packets are outstanding.  The packetdrill
> test in the next patch fails at the first RTO without this fix
> (snd_ssthresh =3D=3D 10) and passes with it.
>
> Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
> Link: https://lore.kernel.org/all/179179785248.434549.1682983764935138274=
8@kernel.org/
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
