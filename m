Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029421;
	b=IIyze3wMgeVu13XObbLQNTIvRDJu7yFdQ/R5LzuKiuKH9N5R6BTlPUm6gqcI14DcNUMf
	 OU8yrfjSkUhGpcxfELxrVUmEQxfKg9FUOaXUQ5sdGfK7c8VXU8d7YPJZEx5uX5bs7ow+k
	 GZgY1ADsGhZ6t+4GuqNjTstxaJXbmCrihDwQJ1F74ehfAMMq22ECgK+W+UASNMnF+ug1B
	 FAED9rluEBfFKBtODTbB12vSBwq6sNxWe3G6EqrlN2O4UKdpGSJOXw4EVgwLFpiPDHMcQ
	 nnNofvMGorPZZuutcUbzdfGmvob/YNUSwlXAg9909ej8+PjNmDqJPwQs/97ZHVvH9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029421;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=DqpYKIEMDFnr6DXsmFk4VjFp/z1LPJDYqBbkxiBlEWU=;
	b=rJInKrtTy8g0OF5ksrB+io6ULjbf/ZIDWDEcqh0EBCG1ntc1Xvzz4XlU6yN980FAshrN
	 u4O+zMpuGGDjYlz3HgGa+eyz9JnHw6VCquj4I5pFpYCm3/AljhXiovHHbESc0OSFpFEe+
	 CCMd0KAO0+DMzZXVnoUX3Y3wy1WfFlZxJqcwBRD1i5D4Q0cfEVeIwxjwUSjIDVm3Z0jta
	 6nMqUmL6UpgeHZIF86MgTqXrayEecly56jEMX074ltG+XKqg6eOi5O45sQ4XPxJk/IG88
	 7FKMQMfJpdvSRn/wMzrev/S0MnXguDp2/Ilw5R/SIAjZRJhdXDzMKixBrDCfKijhObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2x1natC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5D8606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2x1natC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037881F000C6;
	Wed, 18 Nov 2026 19:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795029421;
	bh=DqpYKIEMDFnr6DXsmFk4VjFp/z1LPJDYqBbkxiBlEWU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=E2x1natCfGgEiFNWpjzk/V5v36iRXqBeJPcozqhxZGFxCvp8pBuNqyJoPzblXHPl/
	 I8IAhgIR0PsPXsV+68qfKaX+zsuTE6MXKAVZrwcPdy0FykAmQTTL/h4bqi4mJqpeOX
	 F+Ko/BPlAPGlWZuikHnoyH9CCRXGP4jCDH/34gbiWCZkS86zYcGnE5IPppM51QIF3R
	 96XJER9sJSQdALqXrUzHWOu4CVzT02YSHkNpuXIqgPOjMxdkHLdJNpzWHPk3LXrS/q
	 4nPmnlmv4nb8Cw6fZ0H+RXfWUGGK4eBPBzxu40xqyckHQPHeHrJNpwDwfSonazSGpN
	 gbQgWmQncjH7Q==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 3C6D2780043;
	Wed, 18 Nov 2026 14:17:00 -0500 (EST)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 14:17:00 -0500
X-ME-Sender: <xms:q_n9ahyFhgLaAxvegUdFVVm4qJ3-H136NBqhlzRzFAjCrSaosacFwA>
    <xme:q_n9asGoPMhpJASYl30f5X-AAXChYMRr57BhoNljo3t4jBjAVh2kCdsF32f3xy5Ky
    rmJgazJcMIF48-GYvk5dgfdZgVF5BTbpUsDkcSThae7WPm6YgLwxJdHbA>
X-ME-Proxy-Cause: dmFkZTEyKcc76hCh2u8u3dtg3sZ4r7ZN+wsNvn2CUuntp5DDADxOYihgWuvyhD5RzOMvVe
    aTozo0M3nyzuJGYvuRP5ZZemzPGsE4lcI1uKJw5sTW3b2TZY2muHu7UbLOspUleiPibdv7
    3Yju4qY6SZ3decoASgsx9aKHWORsubFmnijHMswAamTmzBKN9MvgSNeW85JpKpp6L+d/vb
    D41gZNGvleVJXMR/6f5Csm4xdLP3Xy7sntH/V7NQWjXtt3MYuitIGYSdbKmVFkox2daey7
    CnAQpP/m3hzoC/VKqLA8r77ACybP9SZwgzd+7Qxu0XMbl99rB6arSs8hJFD5A7HVJPsScY
    mEJbBq1PCISysziahI5FQRKBg7oK43aM7Cl4uIaJ16nntALyGyok5f8haDsUC7jttf9d9Q
    4sE5cjpONNC/DYpN79RPArj5X5zZsDMVicjrsq6QAtbysMb4ZmZXcvs1H/e0wWtB3eW/R6
    40tCW7fxTZrJ96v+NL/VCDKn3wYq9ap95m+eW0/R0cVtFOiXl3MmJbRw/wtLjw2ll6PCgg
    PXH0RcdN/eNyJ/5r814Y2BMSN2dSU9U4pmr8PxaA374Oujdy0Z4E2rKgpy8KtfT2lXM2+V
    t8rVLI0OxAUTH799xzYBNnoVNdsQQXJzJcPSoOkXuxi39w79GVuKq2ycygXw
X-ME-Proxy: <xmx:rPn9ao_mQx-QHqo53KfLqPtUUnptGRc6GjqFf67oaswaQ1TgQwG9uA>
    <xmx:rPn9au8qWkGzwttAwEzu38d29jTR1Hhbm0IH1WJKgQIdYxyxs-ZW9w>
    <xmx:rPn9anVFmaPc5Rw1KzZMjQxftqNdnpYe0Ojb3Q3wjhC2X2flgwWqkA>
    <xmx:rPn9areDatE4zPAYrHOHoGD3uCxm78R9bCvbzjk2mZCV8PoaRwuvlA>
    <xmx:rPn9agaaL8vLuR2SzTV1MCce31KHbo3l52D8y4ubYtQZzka3-vSx2oPs>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id D59A1F60084; Wed, 18 Nov 2026 14:16:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AFdy3QxxzsFs
Date: Wed, 18 Nov 2026 14:16:39 -0500
From: "Chris Mason" <mason@kernel.org>
To: "David Laight" <david.laight.linux@gmail.com>,
 "Eric Dumazet" <edumazet@kernel.org>
Cc: "Neal Cardwell" <ncardwell@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Willem de Bruijn" <willemb@google.com>,
 "Josef Bacik" <josef@toxicpanda.com>, netdev@vger.kernel.org
Message-Id: <9799750b-ac73-4a73-8145-c61db81d26b8@app.fastmail.com>
In-Reply-To: <20261118185109.166c9c58@pumpkin>
References: <20261118005048.53393-1-mason@kernel.org>
 <20261118005048.53393-4-mason@kernel.org>
 <CAL4WiirGtN4e6HO-aEBU57507XxSdEz5b0oto45hbRA_0sivtw@mail.gmail.com>
 <20261118133629.1e9714b4@pumpkin>
 <CAL4WiiqBXkr5tQZ2oe04ZA2ZqeLQWCdc9tnJWe3NcDFZDcUc3A@mail.gmail.com>
 <20261118185109.166c9c58@pumpkin>
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026, at 1:51 PM, David Laight wrote:
> On Wed, 18 Nov 2026 16:27:28 +0100
> Eric Dumazet <edumazet@kernel.org> wrote:
>
>> Le mer. 18 nov. 2026 =C3=A0 14:36, David Laight
>> <david.laight.linux@gmail.com> a =C3=A9crit :
>> >
>> > On Wed, 18 Nov 2026 10:58:14 +0100
>> > Eric Dumazet <edumazet@kernel.org> wrote:

[ ... ]

>> > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
>> > > index 2d739cfdae8c33d12cd34e00388a29f0f4229806..708a989e5a63bb6ad=
67cc777d57815ae197c451e
>> > > 100644
>> > > --- a/net/ipv4/tcp_input.c
>> > > +++ b/net/ipv4/tcp_input.c
>> > > @@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
>> > >  static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, =
int win_dep)
>> > >  {
>> > >         u32 new_sample, old_sample =3D tp->rcv_rtt_est.rtt_us;
>> > > -       long m =3D sample << 3;
>> > > +       long m;
>> > > +
>> > > +       /* Keep sample << 3 and the smoothed estimate within u32.=
 */
>> > > +       sample =3D min_t(u32, sample, TCP_RTT_MAX_US); =20
>> >
>> > You can't need min_t() here.
>> > =20
>>=20
>> Sure, on current kernels min() is happy with an u32 against a non
>> negative signed constant.
>>=20
>> But this series carries Fixes: tags going back to 2.6.12, so it is
>> going to be backported as far as stable maintainers can take it.
>>=20
>> The relaxed min()/max() checks landed in v6.7. I do not have cycles
>> to check if they were backported to stable versions.
>
> It got backported to some of them a while ago.
> I suspect it is in all the current ones.

I missed Eric's reply (sorry), but I had claude check for the backports.

fwiw, d03eba99f5bf and 867046cc7027 are in v6.6.16, v6.1.101, v5.15.164 =
and
v5.10.246.

include/linux/minmax.h is the same file in 5.10.274, 5.15.225, 6.1.192, =
6.6.162,
6.12.118 and 6.18.64.

-chris
