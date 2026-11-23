Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435148;
	b=JLw31zdWUsKRrjABYtaA2ztGhsd4OOu99JUjoi/t9iitK8UMAfDjUkf4YiRrd1b9mRuh
	 9EHUBFHqMm4UUng+VEXBdLT/ahRcO+NPzpW6ogWWnTBbUmBYfQ63tzR/0RdlP5FuxwCeq
	 ocaSl6UyPzkuiXCFgAm82cOnaXclNfWJ/b2MqzNSZwmC8XJtrB4rF1PAZMKuh0qtBHTtw
	 cw29P0HH4JjTwuWg6Kpf3072+9wocL+4TW+QxSXAhDpE1EdDUENF6GB4cV4twLbYk+v63
	 r6xVvokZUACF43BI6WPy8FiKqNTCyP22TiTVKlONwjkW7Z1GPUwMo+KYOmQPYA/PaFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435148;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Sf4JJJGBV0EyT4t00qNZQoxRzVlWI1dxPYmLnfaYzGo=;
	b=MVXFiOCLFlZL7ISrW6t1eI98UfUIb9sPA4ESgdMw+tcNRgOspno//Hqotmz747rhrJhC
	 /qN4O4NunQfBkZgNfeR0HxBv2IIcbXxD/HF/brvm+AHqONm3N/bUeqlLetrz53nz1GGPf
	 P6OgvJ4jDQL3E4urbth5gx0OK5Vj7QWgyAPvTTeMuPEX6XCFjj4q3XqkJxyk6i7NKfQ9K
	 PQBAH0oWdwyN5K/7XIhiqClYXz/BJpbEfRzRu5rQks4CsKHnO+FSxHiRVCuQOtHqkC626
	 ubqoVTmFynOSNJD1QGY6IK/6EbSDTLdX8KLoKhjQD+3Ddqg0k7WOVlhzcAU+hPUEtDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vs/mCGaT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E2606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vs/mCGaT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AFE1F000C4;
	Mon, 23 Nov 2026 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435147;
	bh=Sf4JJJGBV0EyT4t00qNZQoxRzVlWI1dxPYmLnfaYzGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Vs/mCGaTGkJpPGx0uRpe8gfEdkNxiacZpBgrWmSxhGehKbk50ZswGlQTn3jV78lvH
	 3MFVGU+IYzCqD5hS+IvM3uFgPVW7FSqR1DHd77B477CP0ZsuDIjQZSZCBMr23nSGxC
	 biO6SDmvLY1wn08f/XmHRsX7WanHTYvZ3fK4O0+Zwx+Hs0PNIkd4JdKEWarGSjfunJ
	 +WRzQ2ku2Ccy+vgJpoRDpMb8CeuGKAgxwTv7V2dREJyTdcUGsgVckpFH7SldLG767d
	 psSCRYo45wzde3q0oLVxvCfxCL0YxTbDe/S1xF4NCjMeKqeKmrDgTnz2WSXiwHsbAd
	 c52hfOb5HGO3Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org,
 magnus.karlsson@intel.com, magnus.karlsson@gmail.com,
 maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kerneljasonxing@gmail.com
Cc: intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, jacob.e.keller@intel.com
Subject: Re: [PATCH net-next 1/5] xsk: add USO support for skb path
In-Reply-To: <20261119165340.1071525-2-magnus.karlsson@intel.com>
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-2-magnus.karlsson@intel.com>
Date: Mon, 23 Nov 2026 12:59:03 +0100
Message-ID: <877bi321yw.fsf@all.your.base.are.belong.to.us>
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

Magnus Karlsson <magnus.karlsson@intel.com> writes:

> diff --git a/net/xdp/Makefile b/net/xdp/Makefile
> index 30cdc4315f42..b6109e0e5547 100644
> --- a/net/xdp/Makefile
> +++ b/net/xdp/Makefile
> @@ -986,12 +990,62 @@ static void xsk_drop_skb(struct sk_buff *skb)
>  	xs->skb =3D NULL;
>  }
>=20=20
> +static int xsk_skb_uso(struct sk_buff *skb)
> +{
> +	struct xsk_tx_uso_info uso =3D {
> +		.metadata.request =3D {
> +			.gso_size =3D skb_shinfo(skb)->gso_size,
> +			.csum_start =3D skb_transport_offset(skb),
> +			.network_offset =3D skb_network_offset(skb),
> +		},
> +		.header_len =3D skb_transport_offset(skb) + sizeof(struct udphdr),
> +		.len =3D skb->len,
> +	};
> +	int depth, err;
> +
> +	/* Best effort: a bond or team device can change type while the pool
> +	 * is bound, also after this check.
> +	 */

What would be the effect of that? Would it make sense to be more
restrictive?

> @@ -999,18 +1053,43 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
>=20=20
>  	meta =3D buffer - pool->tx_metadata_len;
>  	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> -		return -EINVAL;
> +		goto err;
> +
> +	if (flags & XDP_TXMD_FLAGS_USO) {
> +		u16 nhoff =3D READ_ONCE(meta->request.network_offset);
> +		u16 offset =3D READ_ONCE(meta->request.csum_offset);
> +		u16 thoff =3D READ_ONCE(meta->request.csum_start);
> +		u16 size =3D READ_ONCE(meta->request.gso_size);

Instead of all these READ_ONCE, maybe snapshot (as in patch 3) here as
well?

> @@ -1021,6 +1100,9 @@ static int xsk_skb_metadata(struct sk_buff *skb, vo=
id *buffer,
>  	xsk_tx_metadata_to_compl(meta, &skb_shinfo(skb)->xsk_meta);
>=20=20
>  	return 0;
> +
> +err:
> +	return flags & XDP_TXMD_FLAGS_USO ? -EOVERFLOW : err;

Seems error prone? Better to set the proper error further up, or am I
missing something?


Bj=C3=B6rn
