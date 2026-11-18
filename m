Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027874;
	b=0i09aTgyvOGNhy9MpsszLhFwIbdDQFBxAZKo+TiFaxbt4SRkNj/NFsavK09tNZ4Sgk+h
	 UtqVS9wzPD83+k9nfkaxNshpND7xnPsj+wbwXGfrjciclsdhQIwc6nHX2pKuo5+lrheWu
	 sJ+ZKeL0E8dv+HHhVKOz0i4LCPFagpOdacTlkSqgZw3k/BW6RmrpTvwNvroxKgdS8Dl3o
	 pdJT3UV8sICWppX4SkBaQDGVXvy6cNGxAOS3DjeIBjFNCF4kQoZjDk6eQ1+a3aI5wgFeC
	 ZFLFamWVBq+PLPVDB94K7/reE9bzPWCQqMcjxXZn2NwjrzSsl1HeV6sNfaAFDvFb/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ooPu190hYrxFNAoK26yIiEdMi4rBDWGb04lJsrsyuUU=;
	b=miIfD6p4L1eKdGAiCf476OgiOv/IG0HAu7GnFrQ3Oxb9S6fWg+ujhBXKH1IMmjQFizi8
	 Tc+TmEpsC781gxuEnHZRM+uicg5m2M/Vl8XeDoMw8S+eItKzMgA8LjoGuKD0Izht39P2Y
	 /k0c2oc5c26kXHdy7YlFaReVRZX8qckefau19VjiFPi2XfQcS8yUVI+AUhqtSFrPuhbVY
	 zGF+SmnJM2j8AwJ4RI7VWnX49JdKn0/TXf5hanixIuWDfjbsj3FEoDbG3WepQ5QiiaGnq
	 e1x1c0IVY7g5/BX8rmEQRDUpmI4Q8HPNMNH+FfJZ/kOStysuFbPjLIFD4AEyVKBWkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h94tLiIC;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE2606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27FE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h94tLiIC
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa5103so822096f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795027871; x=1795632671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooPu190hYrxFNAoK26yIiEdMi4rBDWGb04lJsrsyuUU=;
        b=h94tLiICWG7t+0Vm3kWdtbOmQuIqyihf+G5+MCWtJ/ujCKEewTRT0+wUXBL5kkfNfD
         tBQE7hYCWyKBgSQaZlKnsjtOFuP9CXhD8NhCxXIPhC7us4/U4dJUoPMFxJLXpqeh+jL+
         C3mWma30bS1LYM/jfQfdqBLJJahMuUdv/br6fz3JeQ6upSj736eem3q97caF9W3mZF6H
         hxmP/sncUiAB9NsQXw3Gk1gMhHUA9pAxPLRpXvbBOaMt4t2eO/n1ML3M538bBc4pqyfA
         u0k29fnztyWNZQ0XlxYug1/mmD5d4gsfR7UGpffveGv39y/pebRpEHL91DoikgHsbiW4
         SrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027871; x=1795632671;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooPu190hYrxFNAoK26yIiEdMi4rBDWGb04lJsrsyuUU=;
        b=H5OxjNy4ShM0FNeX5EYxt1H6k4nYhuDirJuepvzQI5F9f1YZ88aLX3x5qMgAWjoeQm
         C/nFIgh8Gp/SjeXCgTCo/bOBBKCCz00JBHB0Az2SDw6RZLi+/H1EIzkBs3hNzGcCIR4+
         iPEzeDlMz1enCqykxmmu3OLh7jdsEL2Ek1ZtZlu7lnFWmwE9GbhYVnUhxxc/vHinP9lR
         jCoDD74mGLv57q+Um86aSQTHp5V9sqcMshXMfZKUpmKJxzD/VEFh0WUU1zl+LGCC4hU+
         xBj/WJFWaxd+N866R59EN8ZCSJZ6FsJd9iE7jsUVcOhFH7dpVeH5672NHBX+B7kbkEeU
         J4Eg==
X-Forwarded-Encrypted: i=1; AL+hErGJF2gtFN+BVkEpvFSdblS10Whto8iuf/JKg61Rp3MbQ71EX5xH2QQhNAJ0cKsnjpanz64C0ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UYsXnkj24fX+rHsnqUUFhvAmh71BGNDRUmS+U8B2taeUzb2VC
	T8xJzTWRwdIwls2YcCrMvlDOyIiOY/VjQ8fCXwvd9cs9YdiB1e37UmlZ
X-Gm-Gg: AZFdTZeR4s7nEVz9XvkJ4fWwrMzah93RRHZYK4lmxSnKXaIwH5SAPDMSZ32MWsk8ZfQ
	g+anR4uTd4BmKuWOtwX4uoWKGzlWHR3sUmNHT+AjubcDgUeCXgr4ogh7tyHD29gMgBHUgC/29mV
	OwHGNI50FKfBekb2vUb986bYNoIx6Wyy5dXflr6YVjrlQ9NZBSqYzYVynicOa82lD7EidGhJLKb
	5suOHjJLPkZL6IDE2mY1ZD882UltPfDBD62X5FbqnL2hpFgeePsShWy/I3533dLnBrwRbDO4wkR
	69F6ZQHXKWKv5UIGUekHrdnKRkWCkqZwxqe4lb45GJeMc6n5VfIhhQ4yAtdyfeFBXiuIjKrHUx/
	t3tXdYJvDLE4InNJ+gCdoFTYxyqzVyM4nOM+BNZhspAp0im9oZKK9QUlq2QPle65DvLb+3NqBJr
	LIA9lHxMld41/POIBSZHfmqbEw7At8fa9S/lp5BzmUVkeN860Pv9eOkGeHmVxWzKS8LEp3d9e5n
	t2rBZ0EGZNI/uAdHd2B8fHPhWMvwqI3uzeV2SKeqSxyHhy4CsNo0Y5ANScB/scy/4QGCx2vbpvu
	m8ecTR6ePgcmz1/uiAtj7XcXdKJSOFqtttvWg8E4tUeesK6ODuYwrBrQi0O1UaDCoA==
X-Received: by 2002:a05:6000:4553:b0:4a3:8b21:51bc with SMTP id ffacd0b85a97d-4a63c468b74mr5497707f8f.46.1795027870966;
        Wed, 18 Nov 2026 10:51:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm5805865f8f.10.2026.11.18.10.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:51:10 -0800 (PST)
Date: Wed, 18 Nov 2026 18:51:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Chris Mason <mason@kernel.org>, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
Message-ID: <20261118185109.166c9c58@pumpkin>
In-Reply-To: <CAL4WiiqBXkr5tQZ2oe04ZA2ZqeLQWCdc9tnJWe3NcDFZDcUc3A@mail.gmail.com>
References: <20261118005048.53393-1-mason@kernel.org>
	<20261118005048.53393-4-mason@kernel.org>
	<CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
	<20261118133629.1e9714b4@pumpkin>
	<CAL4WiiqBXkr5tQZ2oe04ZA2ZqeLQWCdc9tnJWe3NcDFZDcUc3A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Wed, 18 Nov 2026 16:27:28 +0100
Eric Dumazet <edumazet@kernel.org> wrote:

> Le mer. 18 nov. 2026 =C3=A0 14:36, David Laight
> <david.laight.linux@gmail.com> a =C3=A9crit :
> >
> > On Wed, 18 Nov 2026 10:58:14 +0100
> > Eric Dumazet <edumazet@kernel.org> wrote:
> > =20
> > > Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =
=C3=A9crit : =20
> > > >
> > > > tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
> > > > sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
> > > > the sample is the age of that timestamp, not an RTT.
> > > >
> > > > tcp_ack_update_rtt() takes this sample for an ACK of retransmitted =
data.
> > > > tcp_rtt_estimator() clamps it to 120 s. The congestion control gets=
 the
> > > > sample unclamped, in rs->rtt_us.
> > > >
> > > > tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
> > > > which computes sample << 3 in u32 arithmetic. That wraps from 536.9=
 s
> > > > on.
> > > >
> > > > The fix used here is to reject a sample from TSecr above 120 s, for=
 both
> > > > callers of tcp_rtt_tsopt_us(). =20
> > >
> > > This only covers one of the two callers of tcp_rcv_rtt_update().
> > >
> > > tcp_rcv_rtt_measure() is called from tcp_event_data_recv() for every
> > > data segment, with or without timestamps:
> > >
> > > delta_us =3D tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
> > > if (!delta_us)
> > >         delta_us =3D 1;
> > > tcp_rcv_rtt_update(tp, delta_us, 1);
> > >
> > > delta_us is the time the peer took to send one receive window. Any low
> > > rate flow can take more than 536.9 s for that, no bogus TSecr needed.
> > >
> > > Then 'sample << 3' wraps, and since win_dep is 1, the wrapped value
> > > is kept whenever it is smaller than the current estimate:
> > >
> > > if (old_sample =3D=3D 0 || m < old_sample) {
> > >         new_sample =3D m;
> > >
> > > For instance a 540 s sample ends up as rcv_rtt_est.rtt_us >> 3 =3D=3D=
 ~3.1 s.
> > >
> > > We should also clamp in tcp_rcv_rtt_update(), like patch 2
> > > does in tcp_rtt_estimator(), so that both sources are covered [1]
> > >
> > > With that, 'old_sample - (old_sample >> 3) + sample' converges to at
> > > most 8 * 120 s, which fits in u32 too.
> > > =20
> > > >
> > > > An ACK of retransmitted data whose TSecr is more than 120 s old now
> > > > gives no RTT sample. So it no longer resets the backoff, as on a
> > > > connection without timestamps.
> > > > =20
> > >
> > > This seems fine to me. We send a retransmit at least every
> > > TCP_RTO_MAX, and the retransmit filling the hole updates TS.Recent on
> > > the receiver, so a well behaved peer does not echo a TSval that is mo=
re
> > > than 120 s old in an ACK of new data.
> > >
> > > [1]
> > > Something like this on top of your patch (compile tested only):
> > >
> > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > index 2d739cfdae8c33d12cd34e00388a29f0f4229806..708a989e5a63bb6ad67cc=
777d57815ae197c451e
> > > 100644
> > > --- a/net/ipv4/tcp_input.c
> > > +++ b/net/ipv4/tcp_input.c
> > > @@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
> > >  static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int =
win_dep)
> > >  {
> > >         u32 new_sample, old_sample =3D tp->rcv_rtt_est.rtt_us;
> > > -       long m =3D sample << 3;
> > > +       long m;
> > > +
> > > +       /* Keep sample << 3 and the smoothed estimate within u32. */
> > > +       sample =3D min_t(u32, sample, TCP_RTT_MAX_US); =20
> >
> > You can't need min_t() here.
> > =20
>=20
> Sure, on current kernels min() is happy with an u32 against a non
> negative signed constant.
>=20
> But this series carries Fixes: tags going back to 2.6.12, so it is
> going to be backported as far as stable maintainers can take it.
>=20
> The relaxed min()/max() checks landed in v6.7. I do not have cycles
> to check if they were backported to stable versions.

It got backported to some of them a while ago.
I suspect it is in all the current ones.

David
