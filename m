Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114009;
	b=BGLuKn4TXL6KEHFSnPfA31MmGbt9s06FnNR8FdI6tk7B8Qoixt45Uvg9IJY6a6NzGI9J
	 70yX1Owegcbr6K7AhyWD5KBXXj+ySINMXPGRtnM94uXt2EQvAEMX6w3WrINQY9Z+/0JUu
	 7vdpB2QT5uA231WwNFZzN7I938QeacYS/HJ4p1X3oM8g5A8p3tvfun+ZUui3GctPXMx8A
	 NOJU4H2wlGJpynFcN0bU6Cc9eYDfLOyTqlI7dR5krOdQdSo7wnj0XUISr5ISMUuUY8Vak
	 qdhc4H+DTAhnouSBS6OYXoFmv9IZvra4o4nl6FHFOzMbQg9GHS3V39mnnZR8F8PD9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114009;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tpiPU8++XfQSCP9ULe9LXdelFvKTKcALUKX3kHYjn+4=;
	b=pCZcBtWD1gjttgFRZKswRRxQqDWQNEwPtJPONb/3/RADqwfmBTfEZ+nCJxzqHLjtAtP/
	 dgDV2kMkymBJE9PqLBI7qmb9Xl9oe1HZluKlLhtqA/mpb48cWS7hbBsihzvFbacAJHpv7
	 /s8rGo0U8yZgP8E8GN3aOzsNJ0oA2bI1t6fuodxaiv5SJKQaG4xnPwvj0tBMH5ZVq/Cft
	 yPDOJcSrLGGImfVthH6krJ2xmcS8so0DXtuMbyLCWaX684jnLKFARvQOEUS2+I71/kc15
	 ZnX3igblkX/BV9ZT9CU8DQrZrFExI64cTH8OjIK1SwADB/pDa2gu6+qsTVSmJ1+ccpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUNG9Hmm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF5606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUNG9Hmm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115411F000CE
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114009;
	bh=tpiPU8++XfQSCP9ULe9LXdelFvKTKcALUKX3kHYjn+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fUNG9Hmmpnw906AVNfBTDC24dtOuJFtFSrE4knpssFOSWboTWgU/TUr/Fzor9QkD5
	 Z1wC8SKht2FYjEBPA2qVVbDmz61NVZrfbJyHVTloXjzmVbsgycNAUugiLyzT0gz53u
	 afA9XGO7x/cjK8lYSUlAqH4E8JshyiZeklTcrQw8uVnxN2zq4WX+Wwvm5bhJe4k93D
	 3lhw/vnDiYT9uJZBUrR+saoY3Qr1RwzooKtI9/H8Vl8d5tCdbR1MNhcj9VS4NRz7Bm
	 +d9GUoxbMuBhqZTrCS0QQa77gmAPWaIHzxOzFBmaBOyWZG74QNOq7GApeAoJhITJrR
	 CFcG04gVC5LOA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4b0348a4c79so112444fac.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEvq8dPnP8vhKM083O5KiKjzbkWuDvKxWKggaWpofHCwHHNwCHMSC1fomu0X+vGnGFQzw3/leM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UtwGfskfJcDqT0luIXX5dmVju2AK6OjgXzLr0JD/2yuLBQW5B
	CtRiVEfWI8LXglnywd+NWLxlnWbQXdR8efGnos/ZDUt+nyqqmcYAyqukk2EYsJ5YtD5mMW0i7Br
	QajejkD95/5MKeCyexijagII9yuVKDn4=
X-Received: by 2002:a05:6870:9d98:b0:442:175:cea7 with SMTP id
 586e51a60fabf-4bc7beb0334mr556077fac.1.1795114008363; Thu, 19 Nov 2026
 10:46:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com> <20261119180143.2912138-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-2-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:46:37 +0100
X-Gmail-Original-Message-ID: <CAL4WiirdYsiR9a2BtHO4MtPtJX3st48mtfAwTvzft5JuQXT59g@mail.gmail.com>
X-Gm-Features: AclHuK-tsqmjCJGsuoHtwqpC8EpbRAKIkGBsk_sdnPDFvh8WOjjREis7vqFOKyo
Message-ID: <CAL4WiirdYsiR9a2BtHO4MtPtJX3st48mtfAwTvzft5JuQXT59g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] tcp: export CE count in rate_sample
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com, Olivier Tilmans <olivier.tilmans@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> Store the number of newly ACKed/SACKed CE-marked packets in rate_sample.
> This will be used by upcoming congestion control algorithms, e.g.,
> TCP Prague, that need access to AccECN-derived congestion info.
>
> For RFC3168 ECN mode, acked_sacked_ce equals delivered when FLAG_ECE
> is present. For AccECN mode, it carries the derived CE-marked packets
> from AccECN options or ACE field based on RFC9768.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Signed-off-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> --
> v3:
> - Improve commit message
> - Rename ece_delta to acked_sacked_ce
> - Remove redundant rate_sample initializer
> ---
>  include/net/tcp.h    |  1 +
>  net/ipv4/tcp_input.c | 40 +++++++++++++++++++---------------------
>  2 files changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 25d11fab1b03..4b1159e6c125 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -1353,6 +1353,7 @@ struct rate_sample {
>         long rtt_us;            /* RTT of last (S)ACKed packet (or -1) */
>         int  losses;            /* number of packets marked lost upon ACK=
 */
>         u32  acked_sacked;      /* number of packets newly (S)ACKed upon =
ACK */
> +       u32  acked_sacked_ce;   /* number of packets ECE-marked upon ACK =
*/

I presume you meant "CE-marked" instead of "ECE-marked"

>         u32  prior_in_flight;   /* in flight before this ACK */
>         u32  last_end_seq;      /* end_seq of most recently ACKed packet =
*/
>         bool is_app_limited;    /* is sample from packet with bubble in p=
ipe? */
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 67e4aa73bd6a..72826cafa246 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -616,9 +616,10 @@ static u32 __tcp_accecn_process(struct sock *sk, con=
st struct sk_buff *skb,
>         return safe_delta;
>  }
>
> -static u32 tcp_accecn_process(struct sock *sk, const struct sk_buff *skb=
,
> -                             u32 delivered_pkts, u32 delivered_bytes,
> -                             u64 prior_bytes_acked, int *flag)
> +static void tcp_accecn_process(struct sock *sk, struct rate_sample *rs,
> +                              const struct sk_buff *skb, u32 delivered_p=
kts,
> +                              u32 delivered_bytes, u64 prior_bytes_acked=
,
> +                              int *flag)
>  {
>         struct tcp_sock *tp =3D tcp_sk(sk);
>         u32 delta;
> @@ -628,11 +629,11 @@ static u32 tcp_accecn_process(struct sock *sk, cons=
t struct sk_buff *skb,
>         if (delta > 0) {
>                 tcp_count_delivered_ce(tp, delta);
>                 *flag |=3D FLAG_ECE;
> +               rs->acked_sacked_ce =3D delta;
>                 /* Recalculate header predictor */
>                 if (tp->pred_flags)
>                         tcp_fast_path_on(tp);
>         }
> -       return delta;
>  }
>
>  /* Buffer size and advertised window tuning.
> @@ -4248,8 +4249,8 @@ static void tcp_xmit_recovery(struct sock *sk, int =
rexmit)
>  }
>
>  /* Returns the number of packets newly acked or sacked by the current AC=
K */
> -static u32 tcp_newly_delivered(struct sock *sk, u32 prior_delivered,
> -                              u32 ecn_count, int flag)
> +static u32 tcp_newly_delivered(struct sock *sk, struct rate_sample *rs,
> +                              u32 prior_delivered, int flag)
>  {
>         const struct net *net =3D sock_net(sk);
>         struct tcp_sock *tp =3D tcp_sk(sk);
> @@ -4260,8 +4261,9 @@ static u32 tcp_newly_delivered(struct sock *sk, u32=
 prior_delivered,
>
>         if (flag & FLAG_ECE) {
>                 if (tcp_ecn_mode_rfc3168(tp))
> -                       ecn_count =3D delivered;
> -               NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE, ecn_count);
> +                       rs->acked_sacked_ce =3D delivered;
> +               NET_ADD_STATS(net, LINUX_MIB_TCPDELIVEREDCE,
> +                             rs->acked_sacked_ce);

In RFC 3168 mode this is every packet delivered by an ACK carrying
ECE, not the number of CE-marked packets. This was fine for a MIB
counter, but once exposed to congestion control modules it should be
documented in the field comment, especially since rate_sample already
has delivered_ce with a different meaning.

>         }
>
>         return delivered;
> @@ -4327,7 +4329,6 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>         u32 delivered =3D tp->delivered;
>         u32 lost =3D tp->lost;
>         int rexmit =3D REXMIT_NONE; /* Flag to (re)transmit to recover lo=
sses */
> -       u32 ecn_count =3D 0;        /* Did we receive ECE/an AccECN ACE u=
pdate? */
>         u32 prior_fack;
>
>         sack_state.first_sackt =3D 0;
> @@ -4441,10 +4442,9 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         tcp_rack_update_reo_wnd(sk, &rs);
>
>         if (tcp_ecn_mode_accecn(tp))
> -               ecn_count =3D tcp_accecn_process(sk, skb,
> -                                              tp->delivered - delivered,
> -                                              sack_state.delivered_bytes=
,
> -                                              prior_bytes_acked, &flag);
> +               tcp_accecn_process(sk, &rs, skb, tp->delivered - delivere=
d,
> +                                  sack_state.delivered_bytes,
> +                                  prior_bytes_acked, &flag);
>
>         tcp_in_ack_event(sk, flag);
>
> @@ -4470,7 +4470,7 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>         if ((flag & FLAG_FORWARD_PROGRESS) || !(flag & FLAG_NOT_DUP))
>                 sk_dst_confirm(sk);
>
> -       delivered =3D tcp_newly_delivered(sk, delivered, ecn_count, flag)=
;
> +       delivered =3D tcp_newly_delivered(sk, &rs, delivered, flag);
>
>         lost =3D tp->lost - lost;                 /* freshly marked lost =
*/
>         rs.is_ack_delayed =3D !!(flag & FLAG_ACK_MAYBE_DELAYED);
> @@ -4481,17 +4481,15 @@ static int tcp_ack(struct sock *sk, const struct =
sk_buff *skb, int flag)
>
>  no_queue:
>         if (tcp_ecn_mode_accecn(tp))
> -               ecn_count =3D tcp_accecn_process(sk, skb,
> -                                              tp->delivered - delivered,
> -                                              sack_state.delivered_bytes=
,
> -                                              prior_bytes_acked, &flag);
> -
> +               tcp_accecn_process(sk, &rs, skb, tp->delivered - delivere=
d,
> +                                  sack_state.delivered_bytes,
> +                                  prior_bytes_acked, &flag);
>         tcp_in_ack_event(sk, flag);
>         /* If data was DSACKed, see if we can undo a cwnd reduction. */
>         if (flag & FLAG_DSACKING_ACK) {
>                 tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &fla=
g,
>                                       &rexmit);
> -               tcp_newly_delivered(sk, delivered, ecn_count, flag);
> +               tcp_newly_delivered(sk, &rs, delivered, flag);
>         }
>         /* If this ack opens up a zero window, clear backoff.  It was
>          * being used to time the probes, and is probably far higher than
> @@ -4518,7 +4516,7 @@ static int tcp_ack(struct sock *sk, const struct sk=
_buff *skb, int flag)
>                                                 &sack_state);
>                 tcp_fastretrans_alert(sk, prior_snd_una, num_dupack, &fla=
g,
>                                       &rexmit);
> -               tcp_newly_delivered(sk, delivered, ecn_count, flag);
> +               tcp_newly_delivered(sk, &rs, delivered, flag);
>                 tcp_xmit_recovery(sk, rexmit);
>         }
>
> --
> 2.34.1
>
