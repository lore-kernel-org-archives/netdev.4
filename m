Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008992;
	b=3bcC+EEhheJ25QF5OnLiL4qgwsPBsSe9VIfYf/RjF7yCLtwS9bVhU+OgH6L+JzV6lNDk
	 FhK/RezaLCUVDsEoqjUUPf23qqjptma47F13e3BAvvnh2b9oABDBHP7FgCcYdij3oR/po
	 8InANVCzJNMBakbO1N98SKukKJ+P5XxkF7s+vZuROG7vDDo1hTUT+f3fAfFaQ5A5H8e8F
	 0rZXiXMxSZnR3GUgMstaTVVlHMF0L2FZbKlS81KMwBQXkJ4rlpw/15Im4HcmCJjnUgLLV
	 wHHWSVvPdo2oFRflmaPaA/UzZA/Y+CAeblaeIN6VBr59hS2dpNrUs52pFs2gDXdHgLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Rjo73h4z6lxvsI8gaNf28And7gUEPL6GIiSTU2ZRTEE=;
	b=F4HPy8PMSAog2kF57mQKgD/P34KKug8CjIRVq0r3bltO8enxpO+XkMtvi8dHBh6UCxoI
	 2oTYR4pLJQd247Ry/i0NUE0DMyNdvqKndadOoOUym+923Q6HkYI+/p27uviqHKB5b95NK
	 hw60kiZssmRynnsYqAfjvf0ojcXc23lUQdSeyelip9THWfQ2hMadTLESJxDpCUFsvNDUO
	 iwXPTmQbQyRS6QAUg6MkT+XdXzBsnAPp4eGHSg4HLW3yB3T1LI6SD4g4A9H9KFghexBd5
	 ax1ZVlgG0a+Cbs8x/HpPwofQtH8WpNAhUjKEGYFNqeLPoV/HrfTJXRePD45f7F/LmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwwByKpn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E53606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwwByKpn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6613615e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008991; x=1795613791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rjo73h4z6lxvsI8gaNf28And7gUEPL6GIiSTU2ZRTEE=;
        b=fwwByKpnADdE/EaknDuSMxbKtGtTmU8wthRvTJ+gAwTdZasKuPriFeQvShyLIYACnP
         WfTK/xBKkfaQiwzn2eaBpAfiG6ElQ1PgWr4Ul0fb5sVMSt39vpw0J3EgWE0ZbykIaT51
         bjDrlCjQ6WXQAWUicoByEVTq7PlCZVuT4lOxaWTMra02mr4obRs7OI36AG6yzqUhC5xQ
         VmXGDHRd+xx0YwHeAC0hdJVoPpeA21Kl5cxE+Ld7G5pixUh3gxCi75RPYM/hw34CaiPV
         6sIoPVqzhMJ28vjbPHt/d5Kg/N/6KosRsO59Q7UYHVLSK5cus+6OZWYYQbWn3eFrr7gb
         xqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008991; x=1795613791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rjo73h4z6lxvsI8gaNf28And7gUEPL6GIiSTU2ZRTEE=;
        b=qpd6a/xm1+b2l7BDnvY4aALt00Hmf0g71V5H1vk64Gl0CQB/O9m4dno/V6ehp2uD3P
         wPLXpJEgv7haoYzDiD3nsJT6HySm0mG/wBlDMneYULV+XDGIaSSuplyTyD+TfUYWmRn6
         xnN7KBuNdxjYujeNmUZ14+6/xIWxA4+dYnB7gq2aWG0JkkliZHEHcHX8JbaU+FwyMCKc
         z5pV6ODDG8skBx7B6Fok8G6rWQ+WGO9dmn6FA5PCs+buO1x42jcAC+s48XJ49gcfaU8l
         9iCMLVVwdvoAlu+9XyU7S7gfE7+Gzf1jqS8CTf6OJOcKhTod77RKWIi9kLHSn4sGHgWn
         CI1Q==
X-Forwarded-Encrypted: i=1; AL+hErEjHWO9Zf2lZQzZ0v1Thott9ir8QPkwYvVKMsVmLL291SybmNFw35nvylbXYGX07mI+0yy+Kqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nq8VeGdkmfr5KhF49oI3uMmcPKdiA6I7wnCuFhyTBqAJGncgS
	JzyDntVJ62Rdp85cvyDsAgBwkoxFHq8K1rqC0kGsR9E4vxBIGudq/Gyn
X-Gm-Gg: AYBFou0ylTmgWM4DI+eiAgz3iy6gpTA/hAlS2Bath76d2j3nChksO7g0XcHRT4A0bPz
	3BZI2M20Rwa3v1wQqXyPlCgvxZs5nc09zElTyyA3OTURO9W5bpcawC0f+iJwWYb02HWeFSdClAj
	HDcYja67dPvBaEvnlOds2BCD/CPvRXbXNIvYKD46D++b0ZD4h3sRQfA32YBM0gRL1UMslaB688J
	bzVM/HHI/VELZaPQwWF4+G3lSOgyrQ6BrvwRpxvxI2bqST75nDWbI5NORb8JaYm67HAL8juHrvO
	X8odUjdJ48243BsEurvuHdHpiUUe98DFbHxW+lQ5PpODDoEyx6iO+DS72/nuZCTw+Rg/N4I9UGD
	jq6ByxwgVLJZX/X3iy7tClzb+1iBwZ+JRjbJVBZV9W4HrsDOz1T8hUZQsZq/iOK/+vByzrwGLaO
	ESTr4/jsN/WynivJIzzQCA6eaZtYBhSz6B5ICkcAWEBHgaM8LsxqRkqJ+381f/i8wHe2nRBDmM6
	8hZASsefQhTokM4EgUuG89ui6gE5XlPgtyMwTS42nRXfYJiKPmsOL8Y4At+ED2Aw9DOV0gU122b
	aZqLG4sH8+NSNVWwepure/PG6Y39UbitKE3CbWVKaR+aAJeutVHa6kzxEsxEri+Mzg==
X-Received: by 2002:a05:600c:500c:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb7da25015mr49022345e9.18.1795008990546;
        Wed, 18 Nov 2026 05:36:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm73299805e9.0.2026.11.18.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:36:30 -0800 (PST)
Date: Wed, 18 Nov 2026 13:36:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Chris Mason <mason@kernel.org>, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
Message-ID: <20261118133629.1e9714b4@pumpkin>
In-Reply-To: <CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
References: <20261118005048.53393-1-mason@kernel.org>
	<20261118005048.53393-4-mason@kernel.org>
	<CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
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

On Wed, 18 Nov 2026 10:58:14 +0100
Eric Dumazet <edumazet@kernel.org> wrote:

> Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =C3=
=A9crit :
> >
> > tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
> > sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
> > the sample is the age of that timestamp, not an RTT.
> >
> > tcp_ack_update_rtt() takes this sample for an ACK of retransmitted data.
> > tcp_rtt_estimator() clamps it to 120 s. The congestion control gets the
> > sample unclamped, in rs->rtt_us.
> >
> > tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
> > which computes sample << 3 in u32 arithmetic. That wraps from 536.9 s
> > on.
> >
> > The fix used here is to reject a sample from TSecr above 120 s, for both
> > callers of tcp_rtt_tsopt_us(). =20
>=20
> This only covers one of the two callers of tcp_rcv_rtt_update().
>=20
> tcp_rcv_rtt_measure() is called from tcp_event_data_recv() for every
> data segment, with or without timestamps:
>=20
> delta_us =3D tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
> if (!delta_us)
>         delta_us =3D 1;
> tcp_rcv_rtt_update(tp, delta_us, 1);
>=20
> delta_us is the time the peer took to send one receive window. Any low
> rate flow can take more than 536.9 s for that, no bogus TSecr needed.
>=20
> Then 'sample << 3' wraps, and since win_dep is 1, the wrapped value
> is kept whenever it is smaller than the current estimate:
>=20
> if (old_sample =3D=3D 0 || m < old_sample) {
>         new_sample =3D m;
>=20
> For instance a 540 s sample ends up as rcv_rtt_est.rtt_us >> 3 =3D=3D ~3.=
1 s.
>=20
> We should also clamp in tcp_rcv_rtt_update(), like patch 2
> does in tcp_rtt_estimator(), so that both sources are covered [1]
>=20
> With that, 'old_sample - (old_sample >> 3) + sample' converges to at
> most 8 * 120 s, which fits in u32 too.
>=20
> >
> > An ACK of retransmitted data whose TSecr is more than 120 s old now
> > gives no RTT sample. So it no longer resets the backoff, as on a
> > connection without timestamps.
> > =20
>=20
> This seems fine to me. We send a retransmit at least every
> TCP_RTO_MAX, and the retransmit filling the hole updates TS.Recent on
> the receiver, so a well behaved peer does not echo a TSval that is more
> than 120 s old in an ACK of new data.
>=20
> [1]
> Something like this on top of your patch (compile tested only):
>=20
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 2d739cfdae8c33d12cd34e00388a29f0f4229806..708a989e5a63bb6ad67cc777d=
57815ae197c451e
> 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
>  static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int win_=
dep)
>  {
>         u32 new_sample, old_sample =3D tp->rcv_rtt_est.rtt_us;
> -       long m =3D sample << 3;
> +       long m;
> +
> +       /* Keep sample << 3 and the smoothed estimate within u32. */
> +       sample =3D min_t(u32, sample, TCP_RTT_MAX_US);

You can't need min_t() here.

David

> +       m =3D sample << 3;
>=20
>         if (old_sample =3D=3D 0 || m < old_sample) {
>                 new_sample =3D m;
>=20
> Thanks.
>=20

