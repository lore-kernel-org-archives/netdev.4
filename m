Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623688;
	b=Wf8IRQKNM0wl65jUdzz9uy20rH5xuN+f9Y84it9A+Sr31Ystl6T2v1CclaU+ojhNw9M3
	 TE/6fuZRCwDbsHSg5RLHDUL+UbEpAyuhFpYi7IM5CUnGNQcZCSmzs3hB/l0soKC0Y5dwn
	 PKM4H9hLWfWqWzQHAX/1NljCyZpK+WkUKJDAFzgsrrBJ+JOx0ozHhyi68qk6gRGVAxGem
	 0HYIsUVuFTYc/b/nhA/tHE0Ut4NwEznzO2L+cq7he2xnXFOn5SgY8ZkL+8bu4fZcNM89V
	 +Jqh+80FggD2s/Wydtf6z22n7nPjFpOm+a/W1HXB4qDMorDMXMFN7nqsy4RyZS7mmTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
	b=qPhppYKsSjEpuhWa4xUnJfTDim4k7exKiRtADVLpKxOu8dtZlKl9IjKTj6KaV2GjfB8z
	 WQMvARaYO+2pW5dY3mzPvJ1Wihjs/+ad7O8D+Frj4K3Aun0pVpwTBtn/0g3scnt+cYYOM
	 jlW68PPO6Mt7lkqxPzJC4Z9ECxuMIEJvz6tT4O85pGkWa9ol4SofRpwCv5TcHMxUG9kt2
	 AeX3FwXV6d7/06aR/Iz2gvIfRz0nVdxNNK5fFqDHXGu53oUZVikZUqFVMhrx9NpujIgQ3
	 UDcsVGAsOX/jIlTmjPkC+OLyQfd/IgCxrDcN0FVJ2foR4fAwcUAKr8KjgN2V480KC9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2cVcbdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A537606A33C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A537606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2cVcbdD
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so4148967b3a.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623685; cv=none;
        d=google.com; s=arc-20260327;
        b=L+PK5o8c8vJ4LJY2qiDgaVRmRlH5w24iUAclAfWlXJ6MrI+HZ6kSivEg4UvDzKmYPj
         Y6B8EK0JcTC/FTV6jKh/RjVf9owm4B4drD9hQmYc6kEpMXQEzpSbdqTDpdourM6Yb0sm
         /00ujBzYkmY2F8ZmI4MWhjsAPjYSX+sStdtv6X+CjjpQo6pjCnfHZ4hjuGJvy60nP3cy
         sIfpeO/cK+YEr3Zogl1gBV0LTBwazg96SDkUgqGa3wmWI5QdxJ9SyEO5S1lGtXPUyQjx
         hQ4CM1cvwE/TPhvtCn77aWSmeKLG2v/meta46QlsO0Q/BZBbvMvWSEtKQ7rmnJMdoIao
         pnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        fh=Q44qy7rVmEssU9q4ascC//HzX7jl2aqKOhPuYMvWMzg=;
        b=QJ0Z58c6UXTYQ44DrHqURpbhOEnMSNPb29Sg8cgyCy2p/7l+LLEmXcxWhbyHLdSQZi
         Jbj2lqEUB8mVyttC6hf3ORuEh3dmrTCBd+gFgmkazvGTydA39yb/7ynd70JJI7cIDfqP
         QSqcP3Pd1jzgL5OydHE/HPylix1ormJikqCMS+oTuSYJHo1808aOxPCEbYjBJc65wM55
         0ks//8YJR6wo+ejLwzYRC/jbP9bF6iDpRAeGQerdmjVwPPmbYxoDbn02PIdZaSfOMbJk
         +w8T/gcrL/84BO1EiHnC55+dMz8L9uGiGWkqmClYYYdpCjCF5wT/J5Gc6KPpu+u4qiRK
         1UiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623685; x=1796228485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=f2cVcbdDMZEBlcPjE5sRYlQQrXQH5IkfJ0JumUh5DhLd02TOS7lHGh7klAYhjSYHJl
         otaDveuL5cU+KMtGh+/+Bf6IY3zU3eXioGymzHuyHTjcyUT2SF3oTWyNxee8v1lSPCGK
         HstZRfacXh1mMm+8rKcVE231hanIhmXe3FvDJHOqbWwkuHeRvPbCm1qgjOLWCJtQ38kn
         bMc3NRN1ioMI0hqEgSr/o5QHa6UBv97kUp8sZ7gWB2u8+aZ8seA4hYYQij2Q/FFRiYwf
         Edpov13WE1eSNLJWBHQB/5pSVTJo174EZy+4jn3K2DLw2NuFmqBAbPvySesrdinDhSHX
         n/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623685; x=1796228485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jL/0Bwl1ePYdGwOEmrzwhpq81wxXh5l9YreMntjOUuk=;
        b=iaYcsaeTzE+yd+JPeJZUJPVJb7VPyDoYNIlq19/j9M0Utu5P97UWvwKmO+tVKdQzZ7
         w/hBmAuhVl/UHYi2Q/nCdBZdXTiIyUBRxcm85VxY9VB8v2gBIkf/Otr3KoU8xN0M1ETj
         XTJpXTFyRUJj8e9Kdb2hdnVnewGgp3RBLUh7chDBYf8DtrIhO24GdDZrJsOxuP9Xwudn
         iDrz9pYCNqggecFBRvyFyiZRpy4BjqgxKrCEju4QbAX2pe6MCWpDzY9UyJ523ifZtDA2
         B55vX1xwNk46Lu1VfbKFT6hoIqNxk084XZjjyVB2n4VkhUDV36odlKmXb6ZIgpzB+uI5
         d2Eg==
X-Gm-Message-State: APuU4Z/YRzzlFgAkDjqRpPU5QSHKYM8Rsoaoct3xEMoHU0yu0GnCIyyV
	mzFS6fvEVS8yNhcdUpwNmcWASD/u7nptsEm4krB/+omn50D3ouRtL9IcK+CAYhOoYMm2fhQRqVm
	PVefStABez5KvFx/+dhcoQTwSXqa/AyY=
X-Gm-Gg: AZFdTZdxyfy7YzRbuV70NgGPanJaQtcBZM7GjrPr0QyONO22FchMj4/S0M9joLd3RUm
	1eLeDy7k0oouh61zQZLwPlhScIc7689UoejtppYVF5tYemrBKBj8lWBZR0hs8HuQwcB6Y35/kGS
	yjBYNDq4DhTJ3cAS7irja71gIyQo7y0oKJjp3QjFn6/SX6EvZQFXpJSRlPVM13mQban1e3No4rq
	vKArGbWZcM5ARyhVLPHVWjmW+o3kwGveDTTdC3bd57aMYFGz6lykC+0EPy2NaD3ZNLuMHPYLw8u
	TX/v1+dqIGgLme70NHZMyAzBK/qY6UNChMc5n2GKKwf/lmW3KK1Z2Nn9Vi7fbhjdexSpusilekm
	iATTrWm/Sqn0uMWyeihgzGUKvADLjqpTh2NrCPRvnOVvFQoiofa5ZhX8z7hSUuhy9ZHqLjsJEGL
	O/yTeqj949IiuJ/dXC9rUdNGZjBK+Ck1+5y5EpYaBKZ7leuJr3XpRJeFfo4/j7idjlhyiM
X-Received: by 2002:a05:6a00:2185:b0:8b5:8fcd:a5d6 with SMTP id
 d2e1a72fcca58-8c87ca51d89mr16484911b3a.41.1795623685392; Wed, 25 Nov 2026
 08:21:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b69a2cad6c2faeab9ee1e90ad11c4b64168c8235.1795393691.git.lucien.xin@gmail.com>
 <179548327865.3135.16261562840994895440@kernel.org>
In-Reply-To: <179548327865.3135.16261562840994895440@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:21:13 -0500
X-Gm-Features: Aa3M54rsWzghsJWI76cZEUFf_JplE3C1oHkXrqs2BiFz_WXGdtzu3O8u2H29aYA
Message-ID: <CADvbK_fRG1sXR97cXfMMMG30RyM+-vyHMamOje5oxUO6=UEnpw@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/15] quic: add congestion control
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_cong_rtt_update() in net/quic/cong.c begins with `if
>   (ack_delay > cong->max_ack_delay * 2) return;`.
>
> --
>
> quic: add congestion control
>
> This patch adds struct quic_cong for RTT measurement and congestion
> control, along with struct quic_cong_ops for congestion control
> algorithms. It implements a slow start, congestion avoidance and
> recovery state machine, and currently provides New Reno only.
>
> > diff --git a/net/quic/cong.c b/net/quic/cong.c
> > new file mode 100644
> > index 0000000000000..99fe8045d0170
> > --- /dev/null
> > +++ b/net/quic/cong.c
>
> [ ... ]
>
> > +/* rfc9002#section-5: Estimating the Round-Trip Time */
> > +void quic_cong_rtt_update(struct quic_cong *cong, u64 time, u32 ack_de=
lay)
> > +{
> > +     u32 adjusted_rtt, rttvar_sample;
> > +     u64 raw_rtt;
> > +
> > +     /* Ignore RTT sample if ACK delay is suspiciously large. */
> > +     if (ack_delay > cong->max_ack_delay * 2)
> > +             return;
>
> [Severity: Medium]
> Should this early return be here? When it fires, quic_cong_rtt_update()
> skips every update. latest_rtt, min_rtt/min_rtt_valid, smoothed_rtt,
> rttvar and first_rtt_time stay as they are, and quic_cong_pto_update()
> is never called.
>
> RFC 9002 section 5.1 generates an RTT sample whenever the largest
> acknowledged packet is newly acked and at least one newly acked packet
> was ack-eliciting. It has no rule for rejecting a sample because of its
> ack_delay.
>
> RFC 9002 section 5.3 also says the endpoint SHOULD ignore the peer's
> max_ack_delay until the handshake is confirmed. During the handshake,
> peers can legitimately report delays larger than max_ack_delay (RFC 9000
> sections 13.2.1 and 13.2.5). One example is a peer that buffers
> undecryptable packets until keys arrive.
>
> The changelog says callers will cap ack_delay to max_ack_delay after
> handshake confirmation. If so, this check can only fire before
> confirmation, which is the phase where the RFC says to ignore
> max_ack_delay.
>
> With the default from quic_cong_init():
>
>         cong->max_ack_delay =3D QUIC_DEF_ACK_DELAY;
>
> any handshake-phase sample with ack_delay above 50ms would be dropped. A
> peer that advertises max_ack_delay of 0, which is a legal value, would
> cause every pre-confirmation sample with a non-zero ack_delay to be
> dropped.
>
> In that case smoothed_rtt and rttvar would stay at the QUIC_RTT_INIT
> values set by quic_cong_set_srtt(), so pto and loss_delay would not match
> the real path. first_rtt_time would also stay 0. That keeps
> quic_cong_on_packet_lost() from ever setting pc_start_time.
>
> The RFC already handles a large ack_delay safely further down in this
> function:
>
> > +     adjusted_rtt =3D cong->latest_rtt;
> > +     if (cong->latest_rtt >=3D cong->min_rtt + ack_delay)
> > +             adjusted_rtt =3D cong->latest_rtt - ack_delay;
>
> Is the drop-the-sample heuristic needed on top of this?
>
> The commit message describes quic_cong_rtt_update() as "Performs RTT
> measurement" and does not mention this deviation from RFC 9002.
>
> This patch has no caller of quic_cong_rtt_update(), so whether this
> triggers depends on the ACK processing code in the later patchset.
>
False.

This is a defense-in-depth sanity check for pre-handshake RTT samples.
Post-handshake it's unreachable because the caller already clamps
ack_delay. During the handshake, samples with large ack_delay reflect
peer-side key-derivation buffering, not network RTT =E2=80=94 using them wo=
uld
inflate SRTT and delay loss detection. The max_ack_delay =3D 0 concern
doesn't apply in practice: the default QUIC_DEF_ACK_DELAY is active during
the handshake, before the peer's transport parameter is applied. The 2x
threshold is intentionally generous to pass normal samples while catching
outliers.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
