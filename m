Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995907;
	b=bPHBD78Bni5jyZ5qAaCLZMEEvW5N+1QOGt6Bodm9atHBuVKoYtsJ1nzG1Na2tbcVEMBG
	 rWlnCTwopcZw3gIPpc577K///bfhAlX1x4/fyHQ1/1M24bsdtndyzfZ8L1AcwXjdr6Pad
	 2JkLuL4ANm+lbYnhflMck2IzHytPAtWGDeTNgTNECL3CQTW6Z/7ot1dYTH/VMQN6bsJp9
	 IRYdHH12z/54noIOl80zPC/o6a8iNEDsc8MTBHNWtcaTu2jVy8iEsJQbnCbVg1BaIebqB
	 +OQx0trkNs0SgKPyPwcl4w8UVSYT+XV+Ve2BnATEbF+gqrb2eZt1MBTPulaMJKL4WXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995907;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WiSEjdmRUij76poSmxRxZE6Dq+7HtnbMFRWS6zrLgIs=;
	b=DNJA9dL4n892zNMafuHbKcUq0ZY3q/dUN6X5czW83KhnzKR05/3RY0YssmrEHY6Gg8a8
	 zFAb07LA2bJejc0Q7dcaCk3lFxg+Y8UvqgpsXO1S3fJClaRMbNGtWOha5BEoeoRzIMzi9
	 rED0MTsl1I1v9yXYI9UJf0oeu3itWFX5bGn6Qah7w+1C1ceiPafWN7fvwcJdQf8zePegK
	 MI4v/UGJLkHspRMOOKaL0woJsn1Bo/Ai9nbJw3Qo2RQ6zTpH+eJhgFJdkXpnhzZa8xrev
	 +tBGtOGpnULz8zlqV/PaKNVr5bNlMZ/MDmWHwkZ7wwohPd5yEc2BYhQDIQjpAdL5gMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlSeYrF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D5606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlSeYrF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46EA1F000C8
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995906;
	bh=WiSEjdmRUij76poSmxRxZE6Dq+7HtnbMFRWS6zrLgIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IlSeYrF0+IEjF2c+7KKfE4E3b9OEXfmxBzeId0UkNI8sZymrHHDtzzO9fIDv0f6ZS
	 ZRV/qz13WXJHkYRpMIF3byB4GVOLkZiPveHQIFBvgykTsn44LbG31CtQGLm0uP85Qs
	 E/zxLJUWUk3XFVv1nodX8RuzjSasrGdYSF6pBvs/z/bZgEqfrHTJY4G2OEpt+ykq+m
	 BBVCEp+kzmGW2360i22quA+OeOWRvINxDQvpsDyjrGG/JwJtzVMF5KmGZ4FZy69Svq
	 udO5maMnniA7YPq/mejCACnpDusMGBqbdYctpGFPY/KIR4Zn+QTkxjtKItJ1rs8PrM
	 AzYbipV7gICPQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ad5f20016so625075eaf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERNrEu9FwJZs8A5jjmGFx8caUh0zgQQlFT5Gbrl5pxqWgDVjK3W9oRoLSLJFhEixs+AxLihMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NfyrV5zUmF2hLTAHrDkSVaKdRz22Smny6ra5M9WVVGXgg6BrM
	5TYviMzxqG35s0WksrQz9F6NrtOvffMgPy5FHC79708Ef+ccODp7XA4N1B3st1o9gN1zQx80/5Q
	8sVTsJScUEnpavKDdAPkJsESfKrZOymk=
X-Received: by 2002:a05:6820:350c:10b0:716:b9a3:e7ae with SMTP id
 006d021491bc7-71b1853c24emr1187607eaf.15.1794995905895; Wed, 18 Nov 2026
 01:58:25 -0800 (PST)
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
In-Reply-To: <20261118005048.53393-4-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 10:58:14 +0100
X-Gmail-Original-Message-ID: <CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
X-Gm-Features: AclHuK_ABZllJ1iBjoU4ptzM_Hf08ezYRwAee3kAJBSfLAiZ62fPIw4n2Ct5u_s
Message-ID: <CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
> sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
> the sample is the age of that timestamp, not an RTT.
>
> tcp_ack_update_rtt() takes this sample for an ACK of retransmitted data.
> tcp_rtt_estimator() clamps it to 120 s. The congestion control gets the
> sample unclamped, in rs->rtt_us.
>
> tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
> which computes sample << 3 in u32 arithmetic. That wraps from 536.9 s
> on.
>
> The fix used here is to reject a sample from TSecr above 120 s, for both
> callers of tcp_rtt_tsopt_us().

This only covers one of the two callers of tcp_rcv_rtt_update().

tcp_rcv_rtt_measure() is called from tcp_event_data_recv() for every
data segment, with or without timestamps:

delta_us =3D tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
if (!delta_us)
        delta_us =3D 1;
tcp_rcv_rtt_update(tp, delta_us, 1);

delta_us is the time the peer took to send one receive window. Any low
rate flow can take more than 536.9 s for that, no bogus TSecr needed.

Then 'sample << 3' wraps, and since win_dep is 1, the wrapped value
is kept whenever it is smaller than the current estimate:

if (old_sample =3D=3D 0 || m < old_sample) {
        new_sample =3D m;

For instance a 540 s sample ends up as rcv_rtt_est.rtt_us >> 3 =3D=3D ~3.1 =
s.

We should also clamp in tcp_rcv_rtt_update(), like patch 2
does in tcp_rtt_estimator(), so that both sources are covered [1]

With that, 'old_sample - (old_sample >> 3) + sample' converges to at
most 8 * 120 s, which fits in u32 too.

>
> An ACK of retransmitted data whose TSecr is more than 120 s old now
> gives no RTT sample. So it no longer resets the backoff, as on a
> connection without timestamps.
>

This seems fine to me. We send a retransmit at least every
TCP_RTO_MAX, and the retransmit filling the hole updates TS.Recent on
the receiver, so a well behaved peer does not echo a TSval that is more
than 120 s old in an ACK of new data.

[1]
Something like this on top of your patch (compile tested only):

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 2d739cfdae8c33d12cd34e00388a29f0f4229806..708a989e5a63bb6ad67cc777d57=
815ae197c451e
100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
 static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int win_de=
p)
 {
        u32 new_sample, old_sample =3D tp->rcv_rtt_est.rtt_us;
-       long m =3D sample << 3;
+       long m;
+
+       /* Keep sample << 3 and the smoothed estimate within u32. */
+       sample =3D min_t(u32, sample, TCP_RTT_MAX_US);
+       m =3D sample << 3;

        if (old_sample =3D=3D 0 || m < old_sample) {
                new_sample =3D m;

Thanks.
