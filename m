Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995203;
	b=BP14E2KKO040d04aK3npueC3j5x57ikcdg5G1z7YX8SLIGvTQs5ny0psHxr8T+pjSsnt
	 x6QYwkISLfRIJ62VTaQJZgeUfuwe0elxJsavTfYB6rtYIgkxwg1qBacDx6vTCVEemH/oZ
	 KZ6TX42Tan00Wsi96HicjEDjM51d1Nq/CqHPwDMVRCHy68NNnKZmH6I2hlwUg9VQ+e+mn
	 kfCEth5ScAXD8CP9z6B+LQbadIZKCQvBQAcJJq1jh/AoTkbnlbA24U2f08LlF6FI3XsFE
	 bv2tBsPnZvDfKmOT6CK9My85w+M36VwCuCrUEZodXbDHauV0gWZhlgR71d7HwUCKyrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995203;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qyh3BGz+xXrwdu09M6MdR6wn1lMg+k/MQ3sZ0Ll+x24=;
	b=3l3hLMOUoEVGaWfRkF4k6mvbK3TxSM87vbtgo4gPVt+5c2JgF2F8GMtCdp69PYDTD/lo
	 5R7mTVlnks2qcxwYY5d3m/guRCrNIJPoInjvMKyrYVL7Z8vLDb1NPFRtNGK5y8jxKvuNF
	 OhKKAH0s5353V/3byJuUQ/y1bsZPT0eJhhVHB6JjuGgoknQb6yrOrhUJhLq27Nyu2gzWR
	 Rns+Uy+Wq9W8JuPAtd5urElN23jvlaYmdnczTYhYwNzdHHXQZyAqqqWgtCUwXVt8FW/RJ
	 VuR1tveDBycmyLrteuaXPt9bVP0YlLgH7c4wG7A54PyBHBrhjyeDS6jhkYr5rAXrRkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDduR7wk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4EC606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDduR7wk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ACB1F000C6
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995203;
	bh=qyh3BGz+xXrwdu09M6MdR6wn1lMg+k/MQ3sZ0Ll+x24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cDduR7wk1MnAv/PyRiN4wvfpW2ao2yP1tuEr7xUULh6rrsBzAXD/y8v98zxSAw5kK
	 4zZZzzabHJGdeDH2IThNgzyrxgcoKv1ZNg/WLHh4lDHTBOloVjTIlwbWQYAMkg4q9c
	 dy62iSOcEDgwT72GmREBI+IJ9SDRxruBzNcgUfg5dBLpsoPrV46qmAmDRNUyzraH74
	 dG7mQ5hmwKG7ZFLKHuJ5spCasD05ZiCsXq3PIIi73AivcnYGHll2ArjNgjSi3OCTRt
	 bRFPUZvZH+K1ATaQKZ8KQXm8N4YWNKsgjj5laLqY1wHTCFN2J7b2b8Zn0XZDf/2OP4
	 O63NPZluykvUg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-705cb6ceebaso693362eaf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEW46qSCg3SUq25OIp9oGO37chDKgNbmw72LmTiOBRaN1Hubu9q1ha98uP7y9E9JhzLZrrAfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V+FxrXOw3WWHTD0CA2aIUcDLdLa3QwRypkly8chN+m2IkhcRl
	seRkQK23on3DzxvpbDGau/F5M1DNcE6nk4HaAo4FGMt2kG3XXi4EA/mcE6iOgdk1G2T91AEi3hr
	tNNaqc2vaeY5ieSf0mILvDMNeD5jX1Hc=
X-Received: by 2002:a05:6820:1c8c:b0:71a:cf71:eac8 with SMTP id
 006d021491bc7-71b1857247cmr1648907eaf.57.1794995202636; Wed, 18 Nov 2026
 01:46:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118005048.53393-1-mason@kernel.org> <20261118005048.53393-3-mason@kernel.org>
In-Reply-To: <20261118005048.53393-3-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 10:46:31 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip__FkPjvz6BSrZWGrMYLmmy-_eQb_huzaBOwbHkdSYvA@mail.gmail.com>
X-Gm-Features: AclHuK81Muueg_eFMCiAQx-woYob7DjbNz14hpkCZNftxQy8FlEnDPMSuHJid2s
Message-ID: <CAL4Wiip__FkPjvz6BSrZWGrMYLmmy-_eQb_huzaBOwbHkdSYvA@mail.gmail.com>
Subject: Re: [PATCH net 2/3] tcp: clamp RTT samples in tcp_rtt_estimator()
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 01:50, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> tcp_rtt_estimator() keeps its state in u32 fields, in microseconds.
> srtt_us holds 8 times the smoothed RTT, so it wraps at an RTT of
> 536.9 s. Samples can be larger than that:
>
> - For an ACK of retransmitted data, the sample is the timestamp clock
>   minus TSecr, and tcp_rtt_tsopt_us() accepts a sample of up to 2,147 s.
>
> - For a SACK of a segment that was never retransmitted, the sample is
>   the age of that segment.
>
> Samples from TSecr could wrap these fields when they still held jiffies.
> The age of a segment can wrap them since commit 740b0f1841f6 ("tcp:
> switch rtt estimations to usec resolution"), which took the wrap of the
> smoothed RTT from 2^29 jiffies to 2^29 us.
>
> The fix used here is to clamp each sample to 120 s, the largest possible
> RTO, in tcp_rtt_estimator(), where the samples of all sources meet.
>
> The smoothed RTT now saturates at 120 s. A path with a larger real RTT
> sees that in TCP_INFO, in the pacing rate and in the metrics cache.
>
> Found by code inspection (Eric Dumazet), and confirmed with LLM
> generated reproducers on an unmodified kernel. Fixed by LLM, and
> tested with the reproducers and existing kernel selftests.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: 740b0f1841f6 ("tcp: switch rtt estimations to usec resolution")
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
>  include/net/tcp.h    | 7 +++++++
>  net/ipv4/tcp_input.c | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 6a714189bcc7..a617a72ee2c6 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -164,6 +164,13 @@ static_assert((1 << ATO_BITS) > TCP_DELACK_MAX);
>
>  #define TCP_TIMEOUT_MIN_US (2*USEC_PER_MSEC) /* Min TCP timeout in micro=
secs */
>
> +/* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT=
, and
> + * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like t=
he sum
> + * in __tcp_set_rto(). A larger sample could not raise the RTO, which
> + * TCP_RTO_MAX bounds.
> + */
> +#define TCP_RTT_MAX_US (TCP_RTO_MAX_SEC * USEC_PER_SEC)
> +
>  #define TCP_TIMEOUT_INIT ((unsigned)(1*HZ))    /* RFC6298 2.1 initial RT=
O value        */
>  #define TCP_TIMEOUT_FALLBACK ((unsigned)(3*HZ))        /* RFC 1122 initi=
al RTO value, now
>                                                  * used as a fallback RTO=
 for the
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index f65697bc96c9..10a23ee20e61 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1098,7 +1098,7 @@ static void tcp_event_data_recv(struct sock *sk, st=
ruct sk_buff *skb)
>  static void tcp_rtt_estimator(struct sock *sk, long mrtt_us)
>  {
>         struct tcp_sock *tp =3D tcp_sk(sk);
> -       long m =3D mrtt_us; /* RTT */
> +       long m =3D min(mrtt_us, TCP_RTT_MAX_US); /* RTT */
>         u32 srtt =3D tp->srtt_us;
>

Nit: the two tcp_bpf_rtt(sk, mrtt_us, srtt) calls below still pass the
unclamped sample, next to an srtt computed from the clamped one.

Maybe clamp the argument instead:

        mrtt_us =3D min(mrtt_us, TCP_RTT_MAX_US);

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
