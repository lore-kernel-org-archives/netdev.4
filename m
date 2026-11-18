Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015661;
	b=sOUGuBQtlx6sf39Myq+TIfRC1F/80FpIp+LajPmuf0uCQO6nDmdr/7HMAavHUg5p0+xM
	 Wih0G8GNWEjs6CC0NfV2tyKIk+K7uokQH9WdmEF6MTqOXZYiw9FYqfStMgNxq14pqKlLO
	 +/2xgutuouUaDGDcjolDJLIBoJxyWd9b4qyb35gXJBusnjxzvFBSnaFYbinGjP35E1E5p
	 0W/l4XH+IhUf74dGBXs9JG6aXkiPpMH7aYC4qoQ50gu9wdHPcEq7pQ7JA4iLJDk+P5+0A
	 QsnSECDktehhav4mc8LYIzoKAt0bCcX+slnNAEB2DOodXjEJD6kvQXvnkOvpFLrrXVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015661;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gf6Ib1rw+I4WOeSOkbqpoMDj9eR4OY9jOtVL2Q6HHcY=;
	b=gOktOyKCNDMIdQWAat01Gp6xUUsn4L+b1UwgcckjkziDvhuYHuVvv0uKo35NA0JNePax
	 y6A3AT94gssfb+jyi5K3OWYt543S6iCtNvHDP+79xx7Fj3JAJ2s5qp6nHkNo3gTxkwj+p
	 MV+a9ieV6zuR1xO3zGsTBJjFnoSiMDvvwjpLc7/WpamqI5FVGDLaMjx0KnG2YvALcVjLt
	 geLirSTysBVTZ60QH0qgGDArjphY1TtQYaRMK1l3hFVLapaKgeZ32Ee1/D8hxXoEEjCSS
	 wgCg1EikFgQocAHnDrg6w5h5kAMJyZzMPuWtRKSgCt+HWb2Rf++Z/WA5blMKjQjMznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QzAh8jX/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED260A2602
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzAh8jX/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000EC1F000C8
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015661;
	bh=Gf6Ib1rw+I4WOeSOkbqpoMDj9eR4OY9jOtVL2Q6HHcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QzAh8jX/cciJ8lsLOxBBKRyW7vjRE0N23UwkJ8odn9gzi+rX59z5cvouf4nb+skbR
	 QmltxLodwVFkTOJ+UcKR4x6EBj1DmY5mhblAfVxDH9ToJs4MYFjN9kB3IwQnNI+XlM
	 LkCZfiOLaMNYn2X0/4bIHPPKpXgyKfHrkbwJ82QP/bduWWz7lr66hLdLLoO+5480s5
	 +fmvIMzP/HRPiptfcfgAqYLzgyz//zXb9ld9ptUCzf+yackDSUhKnSOUdJVjIj7Vmq
	 Q4u6KEfVq0GpQdEwsxZ4lri4OPmZeJwHSohZUj4XxGHxs5SnrFiEqH1tdPD5C0NSX4
	 H9YNluDEr+P5A==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4ada9579947so651995fac.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:27:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFZas33JUVD1wtmaoIt8G6SxB/TmYPbtsDhUh+9Ypjc4h5NNy5I/ZKw9jRKFuhiDrv7BGF4HHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z94L0UQUQINIHLLfRe55fqeatCU2bj0OJ1u/N1log+yYIL+gold
	HZRvX0d5LMlixYEElC6kKL1LQlqfuZFucIpCZWfvg5yXrVbqwpofzsUY8YC7m3Zf6KJcXTXTpDK
	m+g6LCPr0Q4c+AEZVcZYqfcw15zmua6k=
X-Received: by 2002:a05:6871:ab05:b0:49d:c88d:8bea with SMTP id
 586e51a60fabf-4b7607f49c3mr2520493fac.42.1795015660236; Wed, 18 Nov 2026
 07:27:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118005048.53393-1-mason@kernel.org> <20261118005048.53393-4-mason@kernel.org>
 <CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com> <20261118133629.1e9714b4@pumpkin>
In-Reply-To: <20261118133629.1e9714b4@pumpkin>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 16:27:28 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqBXkr5tQZ2oe04ZA2ZqeLQWCdc9tnJWe3NcDFZDcUc3A@mail.gmail.com>
X-Gm-Features: AclHuK86u4FRbqPtoOaWCxP3jKzQ4-88jIlvr906I0oj6ALIcxBlWud-FD8iZJg
Message-ID: <CAL4WiiqBXkr5tQZ2oe04ZA2ZqeLQWCdc9tnJWe3NcDFZDcUc3A@mail.gmail.com>
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
To: David Laight <david.laight.linux@gmail.com>
Cc: Chris Mason <mason@kernel.org>, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 14:36, David Laight
<david.laight.linux@gmail.com> a =C3=A9crit :
>
> On Wed, 18 Nov 2026 10:58:14 +0100
> Eric Dumazet <edumazet@kernel.org> wrote:
>
> > Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =C3=
=A9crit :
> > >
> > > tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
> > > sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
> > > the sample is the age of that timestamp, not an RTT.
> > >
> > > tcp_ack_update_rtt() takes this sample for an ACK of retransmitted da=
ta.
> > > tcp_rtt_estimator() clamps it to 120 s. The congestion control gets t=
he
> > > sample unclamped, in rs->rtt_us.
> > >
> > > tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
> > > which computes sample << 3 in u32 arithmetic. That wraps from 536.9 s
> > > on.
> > >
> > > The fix used here is to reject a sample from TSecr above 120 s, for b=
oth
> > > callers of tcp_rtt_tsopt_us().
> >
> > This only covers one of the two callers of tcp_rcv_rtt_update().
> >
> > tcp_rcv_rtt_measure() is called from tcp_event_data_recv() for every
> > data segment, with or without timestamps:
> >
> > delta_us =3D tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
> > if (!delta_us)
> >         delta_us =3D 1;
> > tcp_rcv_rtt_update(tp, delta_us, 1);
> >
> > delta_us is the time the peer took to send one receive window. Any low
> > rate flow can take more than 536.9 s for that, no bogus TSecr needed.
> >
> > Then 'sample << 3' wraps, and since win_dep is 1, the wrapped value
> > is kept whenever it is smaller than the current estimate:
> >
> > if (old_sample =3D=3D 0 || m < old_sample) {
> >         new_sample =3D m;
> >
> > For instance a 540 s sample ends up as rcv_rtt_est.rtt_us >> 3 =3D=3D ~=
3.1 s.
> >
> > We should also clamp in tcp_rcv_rtt_update(), like patch 2
> > does in tcp_rtt_estimator(), so that both sources are covered [1]
> >
> > With that, 'old_sample - (old_sample >> 3) + sample' converges to at
> > most 8 * 120 s, which fits in u32 too.
> >
> > >
> > > An ACK of retransmitted data whose TSecr is more than 120 s old now
> > > gives no RTT sample. So it no longer resets the backoff, as on a
> > > connection without timestamps.
> > >
> >
> > This seems fine to me. We send a retransmit at least every
> > TCP_RTO_MAX, and the retransmit filling the hole updates TS.Recent on
> > the receiver, so a well behaved peer does not echo a TSval that is more
> > than 120 s old in an ACK of new data.
> >
> > [1]
> > Something like this on top of your patch (compile tested only):
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 2d739cfdae8c33d12cd34e00388a29f0f4229806..708a989e5a63bb6ad67cc77=
7d57815ae197c451e
> > 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
> >  static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int wi=
n_dep)
> >  {
> >         u32 new_sample, old_sample =3D tp->rcv_rtt_est.rtt_us;
> > -       long m =3D sample << 3;
> > +       long m;
> > +
> > +       /* Keep sample << 3 and the smoothed estimate within u32. */
> > +       sample =3D min_t(u32, sample, TCP_RTT_MAX_US);
>
> You can't need min_t() here.
>

Sure, on current kernels min() is happy with an u32 against a non
negative signed constant.

But this series carries Fixes: tags going back to 2.6.12, so it is
going to be backported as far as stable maintainers can take it.

The relaxed min()/max() checks landed in v6.7. I do not have cycles
to check if they were backported to stable versions.
