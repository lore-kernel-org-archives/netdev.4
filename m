Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668356;
	b=FGawB1KA1VGRzF7Lhk/UvKnXtbzmdw+IindmgaUICuB8qrv6CQ2vX1g6brpwwVXS+6C0
	 TNy1AOD0FwjvUO1eXDz0MHVBj9SrG9GdASaY4bDm5XFnb7K3GWS0h79YXu0bKBAkRych5
	 TofJiOfs2iae7RXohRdgUX6vNuSVjgOGmPjZv7PFz+BAoSWINJZTnYxH6o6oxK/mOkk8C
	 ciu2aTCwR0FUYnDePHMfZzNEp7vO4iA4r49CViNOnFlxVGiz1I7sc3pRGCp23ETBWDxqj
	 zOkV1aJP+CQGf2CxJqMc84mO1lRvk8Z99Fqz+kbTM2SHsRYQlVPUuDHvbLi86bNQDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668356;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fIx82z7dtyvFUbpbC6xHsEPhC6lo7HHgvkP3d2/TOmE=;
	b=etHdEd1FWrgDttACsmIRcePM5GChdBNd9eoe4g6yJG9BP4cs5Gr2ePdUc3NTVTShXZSw
	 WHO3vBec5WRUpjSyk+GPPFZdPK4+WLDNEn9JodU84ANcbrGtzUU+Z+yiLmc9oQf4c/ypJ
	 zoYELUMAG6z2VvQpvrwJdXd4Y0IkyCNh5J82k9zH5FwJq032Pa/ffoUD8SVgJd9hSVB0c
	 53oW6mj38N2o8J3gjGBxQMtkuaeo4mBAT3EsLiH0dIbFZhGHuK8HTodcCM+0l7NESXsqy
	 +VywB5NGrqFFOH57FhyImgOi3SV7stD9UvFBaPQq69Vt0W7CATuJYSPsk6/mg8suN0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjGAsjyU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDF606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjGAsjyU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAEC1F000C7
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668355;
	bh=fIx82z7dtyvFUbpbC6xHsEPhC6lo7HHgvkP3d2/TOmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjGAsjyUpaHFCgtYM2TMUnMaz+hvAfA3RlTbTMVyysmgKpXMzNTUFSBlBitHOB2nL
	 20QdaPP4fJFToDgmUO7LIDnOT167aPOSbfEcPrFtOgClH2wgRBBTOgtheilE9RPy6H
	 lv1Czo2/63jkhtxHGDAFbftUe2IH3OjMOZtePxoeDM93/axyjFQ9Lkq1tu/6J7+RKL
	 3RVox34sSimB8mr82VVUWEnyanPO/mSPq5MxReQpBe5sI1TzUVVhmXEZ02xT1wxMCt
	 tkwbldbbcIqcLAUj7aD2xTyOd1lQ0GW019x2wOA+mwJGGVeE6BtjAoHH7aMCaXyhfe
	 RmGCF4iwqcMjA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ad047710aso424044eaf.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:59:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHQwnitJdT7Ml78gWhZ0KPMm5RTCiqfQev8kPYUasb2wJSwa0F+OrI0DCPXJ41YR9IhSH1JNYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dvONZHghFZqGoXJ3E8G/2+qB8jUctGG7ZYI5+yv7q0ABNXuo1
	a7eGceylaf47wRrv/EyvxBiztvPSp7GcWfsTru8YuJQPortM2XSF9H1K21XLdM9uJ1K/HiwKAtq
	adBpdtx0wKScfvCWRCdZKOhAVDoPuc90=
X-Received: by 2002:a05:6820:168c:b0:6cd:3fdc:5ff9 with SMTP id
 006d021491bc7-71acc4cba02mr1943392eaf.74.1794668354566; Sat, 14 Nov 2026
 06:59:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114141315.19007-1-zhiqizhangg@gmail.com>
In-Reply-To: <20261114141315.19007-1-zhiqizhangg@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 15:59:01 +0100
X-Gmail-Original-Message-ID: <CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com>
X-Gm-Features: AclHuK_kLEzEIQepPyl2uDX2_95s--m9_-umQ9e7hSMXMrKCpLgGBt3DohoipTo
Message-ID: <CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com>
Subject: Re: [PATCH net] tcp: roccet: do not restart from idle on RTO retransmission
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Tim Fuechsel <t.fuechsel@gmx.de>, 
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 15:13, Zhiqi Zhang <zhiqizhangg@gmail.com> a =
=C3=A9crit :
>
> roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
> early and roccet implements the idle restart in cwnd_event_tx_start().
>
> An RTO retransmission also raises CA_EVENT_TX_START.  tcp_enter_loss()
> marks the outstanding packets lost, which drains the in-flight count
> while packets_out stays non-zero, and the RTO timer expires at least
> icsk_rto after the last send.

This is true when a TLP probe was sent: the RTO timer is rearmed for
a full icsk_rto at that point, and the probe is the last transmit.
So the first RTO is affected.

Without TLP, the first RTO can escape: the timer is armed when the
first packet of the flight is sent, and pacing spreads the following
ones, so (now - tp->lsndtime) < icsk_rto. The second RTO is always
affected, since it fires one backed-off icsk_rto after the first
RTO retransmit.

Please make the changelog a bit more precise about this.

> The idle restart then overwrites the
> snd_ssthresh that roccet_state(TCP_CA_Loss) just set:
>
>   tcp_enter_loss()
>     roccet_recalc_ssthresh()       ssthresh =3D 0.7 * cwnd
>     roccet_state(TCP_CA_Loss)      cwnd =3D TCP_INIT_CWND,
>                                    ssthresh =3D max(ssthresh, cwnd)
>   tcp_retransmit_skb()
>     tcp_event_data_sent()          CA_EVENT_TX_START
>     roccet_cwnd_event_tx_start()   ssthresh =3D cwnd =3D TCP_INIT_CWND,
>                                    state =3D LAUNCH
>
> The flow loses the reduced ssthresh and cannot slow start back to the
> pre-loss window; CUBIC growth restarts from TCP_INIT_CWND with
> last_max_cwnd reset.

roccet_state(TCP_CA_Loss) calls roccet_reset(), which clears the whole
private state. LAUNCH being 0, ca->state is already LAUNCH and
last_max_cwnd is already 0 before roccet_cwnd_event_tx_start() runs,
with or without your patch.

The only thing the idle restart breaks here is tp->snd_ssthresh.
Please limit the changelog to that.

>  Skip the idle restart while packets are
> outstanding, matching tcp_slow_start_after_idle_check().
>
> Measured with a loopback sender and 100% netem loss after cwnd reached
> about 126, reading TCP_INFO on the sender:
>
>   before fix: ssthresh during RTO =3D 10 (TCP_INIT_CWND)
>   after fix:  ssthresh during RTO =3D 88 (0.7 * cwnd preserved)
>

A packetdrill test is much better for this kind of issue.

I wrote the following one, it fails at the first RTO without your
patch (ssthresh =3D=3D 10) and passes with it. Feel free to include it
in V2, as a second patch.

A variant with /proc/sys/net/ipv4/tcp_early_retrans=3D0 (no TLP, so
one less retransmit, first RTO checked at +.45) fails at the
second RTO only, and also passes with your patch.

CONFIG_TCP_CONG_ROCCET=3Dy needs to be added to
tools/testing/selftests/net/packetdrill/config

// SPDX-License-Identifier: GPL-2.0
// Test that ROCCET does not take its "restart after idle" path on RTO.
//
// An RTO retransmit raises CA_EVENT_TX_START, because all outstanding
// packets were just marked lost (tcp_packets_in_flight() =3D=3D 0) while
// tp->packets_out is not zero. If (now - tp->lsndtime) >=3D icsk_rto,
// roccet_cwnd_event_tx_start() used to overwrite the snd_ssthresh
// that tcp_enter_loss() had just set with TCP_INIT_CWND.
//
// TLP is enabled here. The RTO timer is rearmed for a full icsk_rto when
// the loss probe is sent, and the probe is the last transmit, so the
// very first RTO is affected.

`./defaults.sh
./set_sysctls.py /proc/sys/net/ipv4/tcp_slow_start_after_idle=3D1`

    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
   +0 setsockopt(3, SOL_TCP, TCP_CONGESTION, "roccet", 6) =3D 0
   +0 bind(3, ..., ...) =3D 0
   +0 listen(3, 1) =3D 0

   +0 < S 0:0(0) win 65535 <mss 1000,sackOK,nop,nop,nop,wscale 7>
   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
  +.1 < . 1:1(0) ack 1 win 511
   +0 accept(3, ..., ...) =3D 4

// ROCCET paces its packets: do not expect precise outgoing packets,
// rely on TCP_INFO instead.
   +0 write(4, ..., 10000) =3D 10000
  +.1 < . 1:1(0) ack 10001 win 511
   +0 %{ assert tcpi_snd_cwnd =3D=3D 20, tcpi_snd_cwnd }%

// RTT is 100ms, RTO is ~300ms. Nothing is acked from now on.
   +0 write(4, ..., 20000) =3D 20000

// TLP fires ~250ms after the write.
  +.4 %{
assert tcpi_ca_state =3D=3D TCP_CA_Open, tcpi_ca_state
assert tcpi_total_retrans =3D=3D 1, tcpi_total_retrans
}%

// First RTO, ~300ms after the TLP probe.
// ROCCET is still in LAUNCH state: ssthresh is set to the prior cwnd.
  +.3 %{
assert tcpi_ca_state =3D=3D TCP_CA_Loss, tcpi_ca_state
assert tcpi_backoff =3D=3D 1, tcpi_backoff
assert tcpi_total_retrans =3D=3D 2, tcpi_total_retrans
assert tcpi_snd_cwnd =3D=3D 10, tcpi_snd_cwnd
assert tcpi_snd_ssthresh =3D=3D 20, tcpi_snd_ssthresh
}%

// Second RTO, ~600ms after the first one.
  +.6 %{
assert tcpi_ca_state =3D=3D TCP_CA_Loss, tcpi_ca_state
assert tcpi_backoff =3D=3D 2, tcpi_backoff
assert tcpi_total_retrans =3D=3D 3, tcpi_total_retrans
assert tcpi_snd_cwnd =3D=3D 10, tcpi_snd_cwnd
assert tcpi_snd_ssthresh =3D=3D 20, tcpi_snd_ssthresh
}%

// Reset sysctls
`/tmp/sysctl_restore_${PPID}.sh`

> The same issue was raised in the Sashiko review of the initial series.
>
> Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
> Link: https://lore.kernel.org/all/179179785248.434549.1682983764935138274=
8@kernel.org/
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
> ---
>
> AI assistance:
>
> - DeepSeek (deepseek-flash) generated the code change.
> - I wrote the tests and reviewed the code.
> - I wrote the documentation and the changelog, and used DeepSeek to
>   polish the wording.
>
>  net/ipv4/tcp_roccet.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
> index 04b9e5246..4b4621a79 100644
> --- a/net/ipv4/tcp_roccet.c
> +++ b/net/ipv4/tcp_roccet.c
> @@ -1144,8 +1144,15 @@ static void roccet_cwnd_event_tx_start(struct sock=
 *sk)
>                         ca->epoch_start =3D now;
>         }
>
> -       /* After idle periods, go into LAUNCH with slow start */
> -       if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle=
) &&
> +       /*
> +        * Skip the idle restart when packets are outstanding.  An RTO
> +        * retransmission also raises CA_EVENT_TX_START: loss marking dra=
ins
> +        * the in-flight count while packets_out stays non-zero.  Restart=
ing
> +        * there overwrites the snd_ssthresh preserved by roccet_state().
> +        * Cf. tcp_slow_start_after_idle_check().
> +        */
> +       if (!tp->packets_out &&
> +           READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle=
) &&
>             delta >=3D inet_csk(sk)->icsk_rto) {

The code change looks correct to me: tcp_event_data_sent() is called
before tp->packets_out is updated for new data, so a real restart
after idle is still detected.

Please keep the comment style used in this file, and make it shorter,
the details belong to the changelog. Something like:

        /* After idle periods, go into LAUNCH with slow start.
         * We are not idle if packets are outstanding (e.g. RTO retransmit)=
,
         * see tcp_slow_start_after_idle_check().
         */

Please send a V2  (in at least 24 hours) with [PATCH net] in the subject.

Unrelated to this patch, a question for ROCCET authors:

On a repeated RTO, tcp_enter_loss() sets cwnd to 1, then
roccet_state(TCP_CA_Loss) sets it back to TCP_INIT_CWND.
This means a burst of 10 packets after each timeout, including
the backed-off ones.

This is a more serious issue IMO.

Thanks.

>                 tp->snd_ssthresh =3D tcp_snd_cwnd(tp);
>                 tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clam=
p));
> --
> 2.54.0 (Apple Git-157)
>
