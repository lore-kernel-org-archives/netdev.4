Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014316;
	b=n8et8ni/r6lvzrYzsLxSWBZAZceRMVH7bvFqmVEFGNlNUhNVQUeg9aG95TY6OXjGAKoB
	 3ka4hf/2IK6UAfTMTvTmHbLWREm731kOqffFGFG2fyWLXouUAWTrv1s+dcoENGomEj2pp
	 2mRMY94omRTYXnjDKtcTvzlMsZTi6/x7AR8Yi0PZppbkb+0JOO8pNj/0vfmVZzueVlrXt
	 Ipj4CE4Shu4TcAZ0uxTTaprYGqejJHfWTAkMnfLEmSb0q0cUY8zOGoIpNXAUdzLAOPUnx
	 Lu/O/EtyBxkY1FbPsYzP5CqcRJOIjIbAwWimBvhPrTy0MNkn1DLhSbJWYm8kKa9ekoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014316;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Lz1QdUMe27LCdf6G1Y1DFNn2GN9+azDTK9VSxTlk49k=;
	b=rVatHFMmgHWgokODV1zeMnlQiYAMT+zSfdWwjrR6pnt9ngQe4HrmrH/BJ+ekI1jZxZZo
	 ykXbdSWYMmMQftc3JQIh2IQGrEBEOdEZ/AogKN4vs62eX9U57r2frOOG//AWtivsob2Qz
	 Cww+8XJ0eGoZVRplUD43Y03CznlgMkD7HpLQhkhESgsmVISMJXJv0jlIrbBjf+g1T0HrB
	 69NP30UAoqI598tswbXHM+YAzn3yx3aRSp27Wke4bVNEiP3ZzlEHq3L6H46aWDnipCu6D
	 4yp5eau3lKeeK7Jcp3/DKiovl7O/l7+CftEuTU2wVNBQ66F7TilFEnE2HvLxzavvTtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JG/Pgo8g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C962606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG/Pgo8g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D841D1F000C8
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014315;
	bh=Lz1QdUMe27LCdf6G1Y1DFNn2GN9+azDTK9VSxTlk49k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JG/Pgo8gq5RRuSQIIC/oWtlyuaLjVTXUMApB/FzwjyuvGbjJ5wBxWtqTaD1s8LXYM
	 DaE7qoKV2BpLPGJjGusUhCLmcvgDyoUv92i3ZAfk3NbOE+TaII+s8jR+qF2JjUfeD+
	 SXsjgAHOb4e90orULfw4au9xxURZzyWuHIsQAYMPjf/sdL1vDGsW4maYFzaEXEwslZ
	 b9kIqgXfcoRZH43QOcECH1OBRK6d3ybxEhdIsU2AFSfanldRpJmKJ6EToi2cAT+zUn
	 gvjnaLE4wcVQRzOAN07fTxCsLqoUoZceIezuoMglooKc2Xgw9+9gwBkXbKFjPBzxjY
	 AkfJkTINQyoag==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716b58a4365so623963eaf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:05:15 -0800 (PST)
X-Gm-Message-State: APuU4Z8b84qaxap9dg/w4el2LHSva6ov9BB6mwXJmNy+Yh9NaOp+Ldct
	dioPvgN4iKE6V3XCi4aml5601pXbDZc0YmVL+WTT0XcJ9a9T6SViuMgas3E4QjEs3pNWMxCXuGj
	3Kck7MVsZVrUVY+jpxpCLj1DfHkaMn2I=
X-Received: by 2002:a05:6820:c3c8:b0:717:da:ba3e with SMTP id
 006d021491bc7-71b1843987dmr1511462eaf.19.1795014315202; Wed, 18 Nov 2026
 07:05:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118144249.358481-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261118144249.358481-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 16:05:03 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiqo2f7WxE0uccUOvGyLMhu66cwYWSFS1ZCQU=Lkaxp1Bg@mail.gmail.com>
X-Gm-Features: Aa3M54piHjPwp_y_R61vPpndNd95o_tqH2TJpVGd8jo1PrAJ9sbocGNqFSQPXG4
Message-ID: <CAL4Wiiqo2f7WxE0uccUOvGyLMhu66cwYWSFS1ZCQU=Lkaxp1Bg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] tcp: fix shift-out-of-bounds in SYN-ACK
 retransmit timers
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 15:43, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> req->num_timeout counts the SYN-ACK timeouts of a request and is used as
> a shift amount:
>
>         /* tcp_reqsk_timeout() */
>         u64 timeout =3D (u64)req->timeout << req->num_timeout;
>         /* tcp_fastopen_synack_timer() */
>         req->timeout << req->num_timeout
>
> Once it climbs past the width of the shifted type the shift is UB. Seen
> with tcp_synack_retries=3D255 and a peer that never completes the
> handshake:
>

> The sysctl is not needed: TCP_SYNCNT=3D127 on the listener gets there
> too, and the TFO shift is 32-bit, so it is UB from num_timeout 32.
>
> The value can also wrap to 0 before the shift count is out of range,
> which arms a zero-length timer. E.g. with HZ=3D1000 and req->timeout =3D=
=3D
> 1000, (u64)1000 << 61 and (u32)1000 << 29 are both 0.
>
> num_timeout is a 7-bit field. Once a retransmit limit is above 127 the
> "num_timeout >=3D limit" check can never be true, the request is never
> expired by that limit, and after the field wraps to 0
> reqsk_timer_handler() decrements queue->young again on the next expiry.
>
>  - split tcp_reqsk_timeout() into tcp_reqsk_timeout_sk() and cap the
>    shift at 32 there, same as inet_csk_rto_backoff() in the next patch.
>    req->timeout << 32 is already above tcp_rto_max(), so the clamped
>    result does not change.
>  - cap max_retries / max_syn_ack_retries at MAX_TCP_SYNCNT (127), the
>    largest value the field can hold. The sysctl range is left alone:
>    narrowing it would make setups that write 128..255 fail with
>    -EINVAL, and the caps are needed anyway for TCP_DEFER_ACCEPT and the
>    TFO "+ 1". 128..255 now act as 127.
>  - cap the TCP_DEFER_ACCEPT conversion in secs_to_retrans() at 127 too;
>    larger values kept an acked request from ever expiring. getsockopt()
>    now reports at most 14527 instead of 29887 seconds.
>  - route the TFO path through the same helper.
>  - document that tcp_synack_retries values above 127 act as 127.
>
> Found by checking sysctl ranges against their users. Reproduced in a VM
> with UBSAN: tcp_synack_retries=3D255 and tcp_rto_max_ms=3D1000 on the
> server, and an iptables rule dropping the final ACK of the handshake.
> The splat shows up after about 64 seconds, and is gone with this patch.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: e6c022a4fa2d ("tcp: better retrans tracking for defer-accept")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
> v2 -> v3:
>  - drop READ_ONCE(req->timeout), cap the shift at 32, reuse
>    MAX_TCP_SYNCNT, simplify the doc text (Neal)
>  - changelog: mention TCP_SYNCNT, the wrap to 0, why the sysctl range
>    is not narrowed, how it was found and tested (Neal)
>  - add Fixes: 1da177e4c3f4, the shift was already there
> v1 -> v2: reworded the commit message, no code change.
> v2: https://lore.kernel.org/netdev/20261026123244.239766-1-jiayuan.chen@l=
inux.dev/
> v1: https://lore.kernel.org/netdev/20261023064915.401112-1-jiayuan.chen@l=
inux.dev/
> ---

Note this might conflict with Chris series, which changes __tcp_set_rto():

https://lore.kernel.org/netdev/20261118005048.53393-2-mason@kernel.org/

No big deal, just FYI.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
