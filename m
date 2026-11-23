Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461027;
	b=ETsrRur6KSjJqR+XHQhgfHZvLtouN7TsH/8EZjn0auqDzZdc5wWw9qoY9pzgq0Hv6wNc
	 RksjKpg135IbwAmGcyYQ/5gqhGZ6tjFUInE10R0wUh4nu8qAE435MDQK0Q3/mu9i8G/nW
	 l2EzYm0Ei5EEfl40ZIAQagK1iYpBB8Z+n5V0pwfcpl4l3HjORm3KBnMGIaPClS0j/lzZI
	 juvJmzBmPBTIpZlvDxz4EZTNr3YNW7sSklCzyvpA99rb+wE4saoO/s0numVQqC7OeRybX
	 Pp6Vfgq9fV+U5BEL4bJ0X4GFrbrqzW135OdljJceKqNALWE4mpy8dr36NQ8e0Vh6wOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461027;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7lQOa9vwijiJOoSBFtm+iD2GmNTwzQakCoKwIBOxlmk=;
	b=dnKxYVm1H2QQrozpoIZ+03gKJRG1Cu5FfnxLnCkmk4dkZdhq+t+3Wza+U8kzNkj25KLp
	 CYMl3GR4MbBBj5Y13mLx8AYVcZc0qdC+g1AcbjG46dzD43DC7fAYsY2jykNN/5OReU/jG
	 cPyfTTKqL+gSnI1M1AoP5/MHPgpMt/T3o/acO6zWlLXr0jw11mAoaSlrzHIW0aX0+ihKL
	 j/GkdRYl/8yoHigkQ2E7sTmPnZW+P2fgzA+Wd3JtsLSDkpLZ087vuCMf4H8y4eoUbzLyp
	 wohV/eW/zshXrYwlNuplweJQEGGlzrYEaUO/BIjIk5kdyjsCZIrnymT8qv3AE1Aa0hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9eoMtc2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA7606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9eoMtc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A581F000C0;
	Mon, 23 Nov 2026 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461026;
	bh=7lQOa9vwijiJOoSBFtm+iD2GmNTwzQakCoKwIBOxlmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=W9eoMtc20Pn2Eq72HJ7q5SjHR6Rr1imyXyXfRHYq9ePkWuvUhpdG4Xm25EoBHh8la
	 +oE3aS+RZmuSuOa+bAcxCS0xz+qADvyYfqxUBwyqHB9YAwx4rwOVO7JH6cpCP08zVK
	 +cGfdnCFxRwMo0hH7hWqGgqLRTVssiyyAzzW/ZnUGQgaAxvAEwBScYLmqcuN2LfhA+
	 lA0RpcJNQBpMdxNSQtQbKwP1TZGiBabZJHLmTrDxIx1st/tT0CQnLq0PaclJ7HQHGo
	 ZyiIAvIpN5RXBdtFePhER1MP9WupDivHFLO+/BloZG2EUAFegG5eUODWUB3jn+nWwC
	 aWeKaOQVCNeGw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH v5 net-next 09/13] selftests: xsk: prepare xskxceiver
 for endpoints on two hosts
In-Reply-To: <20261119164636.1071385-10-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-10-maciej.fijalkowski@intel.com>
Date: Mon, 23 Nov 2026 20:10:23 +0100
Message-ID: <87tsl7pdnk.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> drivers/net/xsk.py, added later in this series, runs each hardware
> AF_XDP case on a NIC with a zero-copy endpoint on the device under test
> and an SKB-mode endpoint on a remote host, without negotiating
> capabilities between them. Add what such a pair needs:
>
> - --queue binds a queue other than 0
> - --max-frags, up to 0xffff as it sizes a packet array, hands both
>   endpoints the DUT limit for TOO_MANY_FRAGS, as each one builds the
>   packet stream from its own view of it
> - --timeout, 1 to 0xffff seconds as it is passed on in milliseconds as
>   an int, sets the RX and TX loop timeout, 3s by default, and once both
>   endpoints are ready, each waits up to as long while its link is down,
>   as an MTU or XDP program change on either host can reset a NIC
> - an endpoint probes only the mode it runs in, taking zero-copy support
>   from NETDEV_XDP_ACT_XSK_ZEROCOPY rather than from a probe bind; its
>   XDP_ZEROCOPY bind fails rather than falling back to copy mode, so a
>   false advertisement still fails the case
> - an endpoint that only transmits attaches the XDP program only in
>   zero-copy mode, where a driver can require one for TX wakeups
> - an RX endpoint fills its fill ring before the bind, as a zero-copy
>   driver posts its RX buffers then and would otherwise wait for the
>   first wakeup, which comes only after READY lets the peer send
> - an endpoint that skips a case sends SKIP on the control channel, so
>   that its peer skips too rather than failing on the closed connection;
>   this is how a TX endpoint learns that both XDP_ADJUST_TAIL_GROW cases
>   skip on an SKB-mode RX endpoint. It then reads until the peer closes,
>   for up to the timeout, as closing with unread data resets the
>   connection, which drops a SKIP that the peer has yet to acknowledge
>
> Cases now default to an MTU of 1500 (ETH_DATA_LEN) rather than the
> 1518 byte frame size: IFLA_MTU counts the L3 MTU, so the old default
> changed a standard MTU, which can reset a NIC, for every case. An
> SKB-mode endpoint raises its MTU only when a case needs a larger one,
> so a jumbo-MTU peer is not reset twice per case. cleanup_iface()
> restores the MTU that bind_iface() found once the XDP program, which
> can cap it, is detached, and fails the endpoint if it cannot, so the
> result is reported after cleanup_iface().
>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
