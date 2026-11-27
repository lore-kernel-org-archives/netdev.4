Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798591;
	b=M7MJkcc5JAz5+ZBzcN6VE4sjyGyrxDzjl7S0tqyy1byxspriWB7bcQcvgJSm5F5cCPsX
	 /kOilyasAuFrOEE1/tVEs+CVmdi66VAjSXrk666Xd+wxEiZ5ZGRBY6uXIExvYiQ1I+XAu
	 Pen9sE9RXssZ8CNlBD7tARi1sOERS/q1+kV7geGXSi7p143MKOrJEoHYM/pxT1uVDLB9A
	 Sq7VBJf2233FhSI+mCE32/tvk3Mk3wOyuqEkb8YQ9StoBpMImsN1MkGdipn7YTJV886mk
	 wdsHMVyRwaHUbYR4kx5BBRDFPr2kG6vGYR+lwWJn8VpYY+G4BaZsBnjoOXpej2yFNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798591;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V9s5cE0YFouh5jmUZ3qtfKF7Wf5pwrkzWs9hUWaorfQ=;
	b=nd4q7J69vSlZCKJAW33Qjc5lhLHnZ50eWtBuFHbmrl3MnuNWHGELZekF1WL+eEqzz1VS
	 HOlqrJt/kW7SuJs4Ehwug+kECloOUtotnU+vWxA5JnUF4YSLP3xa59Rc27TYHfNp3bwDd
	 5Gf+Ltb4mS/eJ9m2bvd6ll+BWKM7dMzkx4kVd6+erYullDeWEWxj1kg9PBh3uEihfPa1d
	 dKly8bwcOjbry9abg3WgYb7FWpzDK8Vmq4sCp+cN78XIB76UkM8SBNIBrJ3trayI7JoTG
	 skBwvdJp6RYl691EgDoxcMVmjjSAd0kivayAj4qGstRL5jCEZUEKfRLoXO1ORMTvA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqajruAc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79641606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqajruAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7A81F00930
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798591;
	bh=V9s5cE0YFouh5jmUZ3qtfKF7Wf5pwrkzWs9hUWaorfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RqajruAcR6zloTFF9yw5YIV2Y3qMAhDUo15smivVrvxMIjmpi1Dg32UTAhlRlcFsr
	 UKLfOvt0GbAIWYvaOynCACibHxabakYD35LazrIFriffOBsOoiOG7MNv6FJMwvbx43
	 Sv45hfvkBDGCcWPdABDvCeENnCbyF23zAJFZzg6cyqE/yPq9YQFenTIWhDwZb0sW2z
	 q8VDTAbP7zUDQZKmb7JFOQ1/67cnV/iARtxXwaMAETkmuJKF30hrwnN4xP5AVBKMqr
	 rWwmDgDEG/hOsMzX535nwZ6cJbdg3KD7kCFnUH3WXnOaoMfFmnk9UXyqg1P05UhEPL
	 eZB6WJXZuqnBg==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-949664ee41cso839020185a.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:56:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHumsHhv7njmqhin764+UFBiANyJCaLYwQczda4El7tUmXJ+eTU7akG0kjYnXGDEb3XRH39dJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mq3NKWm+F5Z5lmDCu/Z+Lt6pcqoZZjsresjmr9bDOh3evSSg4
	4YgiH4NXT4ngmPtsXK4INGVmrSnVKjyx8Kzw6DjLKa8Ip4G04jeSYFXHKzw8B2/q3OWv1dP3O3C
	JxzsqDxQ2rXXCvxjrIVNWlBXdxGzS5L0=
X-Received: by 2002:a05:620a:649a:b0:949:752d:31e6 with SMTP id
 af79cd13be357-949bac8557bmr4188486185a.79.1795798590170; Fri, 27 Nov 2026
 08:56:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127142131.3527737-1-bjorn@kernel.org> <20261127142131.3527737-4-bjorn@kernel.org>
 <awmmhuuailYkTtLu@boxer>
In-Reply-To: <awmmhuuailYkTtLu@boxer>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Fri, 27 Nov 2026 17:56:18 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNhwOrsGZoUz4wYokaGOOzEeCTAdkVUtvY5REV27gkbDww@mail.gmail.com>
X-Gm-Features: Aa3M54rS-Z7TnayrDFO8SKtWi5cnEqowLhI7xQRnBgqe0ZPhgLbFwKqxRVt_Mys
Message-ID: <CAJ+HfNhwOrsGZoUz4wYokaGOOzEeCTAdkVUtvY5REV27gkbDww@mail.gmail.com>
Subject: Re: [PATCH net 3/3] selftests/bpf: Drop the zero-copy tailroom from
 the xsk tests
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Tushar Vyavahare <tushar.vyavahare@intel.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, Colin Ian King <colin.i.king@gmail.com>, 
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Nov 2026 at 16:49, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Fri, Nov 27, 2026 at 03:21:29PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> > The xsk tests take the size of the shared info off the UMEM headroom
> > of RX_DROPPED and off the growth of XDP_ADJUST_TAIL_GROW_MULTI_BUFF,
> > as zero-copy multi-buffer pools kept it at the end of each chunk.
> >
> > The previous patch moves the shared info into the buffer pool, so the
> > UMEM headroom limit and the frame size no longer leave room for it.
> > Drop it from both tests.
> >
> > Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > ---
> >  tools/testing/selftests/bpf/prog_tests/test_xsk.c | 10 ++++------
> >  tools/testing/selftests/bpf/prog_tests/test_xsk.h |  2 --
> >  tools/testing/selftests/bpf/prog_tests/xsk.c      | 13 +------------
> >  tools/testing/selftests/bpf/xskxceiver.c          | 15 +--------------
>
> This is based on old xskxceiver location, would it be better to have this
> one send to -next out of this set? I assume the move might not have been
> back-propagated yet...so seems we would have to double the effort?

Ya, good call. I'll pop this out of the series, and respin a v2 w/o this.

Please have a look at the Intel side of things if 1 and 2 is a good
fit. I'll spin a v2 when Sashiko has spoken!


Bj=C3=B6rn
