Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795534423;
	b=V/AHhB4hQIE4xUCRC/J17qCtp/oBx3RTQXP7WvJR/Z5/mQ9D0dorWozKxhfXdtCUb98G
	 pKKf9TGY2CAHc501xMxTbar6efCaCQsMd9DeI9jx1vpCzay1OaKJWHMwS89kDJbmDEA0N
	 6Qk0iJaktmaTAhQzDvbyPIUFnOZvAjxzyJYqnZ6Uz653yB0tJbPsWA5ky6vmCBBvARiXd
	 JUrYdNDUXCPWnyoQLNz3nwfQMZBixCr0nMTqVhX8AKaIW86vwy3BIkNGYJpNMFHzSqzcK
	 gkzH2U5sF4avyySW4Hsm5UwD1zTmf7Zw9CCuw7GEs1dZ6FaemlDkDFRCUE35MZdOGNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AiTGA5Xpq0Cd4i3jFQ3r/irB8WJlGQxKq84ORbCBNp4=;
	b=aFXdmMKHac5+MR+7sEMFNEO98HaFvsplweTM7ApZzt/knRarf7R3aJyhZxJCX6UwonYQ
	 CM8zCiYdf8Tf5RYcUnd9Tn6zoJP860rgZamR60++5q1ILovgV13uDgNk8hUcfOQKNdL2G
	 hiOJ4/N7t+XkG/D2SAZebobw3j7Nc7JoM/Ddk0DmUy1mhaPexmjklGwxjquRidfZ5PFci
	 nH9MbAF4f8lMSSVIl03VztsSma5Ml1C1PAXMkpD1/t6Ti3XlVNQw37OPdEaf7lfefPIqy
	 lE5K5UEcbUX9evmQtCv4SVU3nCYWh8rcrDYLQSV4mKM4QSaZnciLkuCFF+mMXkGr/mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDdZCvOy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BD606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDdZCvOy
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so3563320a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795534422; cv=none;
        d=google.com; s=arc-20260327;
        b=IE+DY0WITf0tV2iSM24aHtm0ePCNxCVFs13GHcxOm4z19EEtuZCkyMYe9tGdNpNfgA
         G06zLNXFb2Ba1ErhqsHYBBRMWH7yBTYf2yN1ZK3Ez5JkJgnX9RaJ4L7hKz5KaT2p3U6k
         EMKs0VTvIMzA4vb3gGocjOngdDUGwn2DhZfnp4a/IzcSEtT4AiIB7yOOLiFTfYMsRHPC
         lHJX9pb4jGDh1cusy2iNwrwy8iQt0EsgROJqe8gypTvDV3WlP5gjeCCfEqBS0qvj3Ngd
         gACzNxGjhYixPZ4MQEfm6McTz3HwZL+l+dgBYSzr1d7Nr+2CVgjgVEL6kIFF2wlTP+Vb
         ixNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AiTGA5Xpq0Cd4i3jFQ3r/irB8WJlGQxKq84ORbCBNp4=;
        fh=1R3vTiFfch35Bqx2BPgljwSvqYEbW38dxziQP7BdkFU=;
        b=CwtWUKTLT9uwAJWpDvqrmvGA43UqaWKRSdI1LNwAz5AmgjxjmOSW5QV5mu+AGlWB9n
         5MAq0yMViE9n0IB4eriVK8fls8n82Tl+StPO9rBstETQMeTxlsPRJCkjZoMcNJwWZotP
         LLFULdST5S1dlL63BAbECHd+pOpU56SRVu2qMmICaj9yMcfzn3DV/RHep4DUSOr8r+hV
         ckny94TeW3OQMy4TTIsxHCgYQkC0XvKJ+r/UxUll3+G5OBIfQOneiahQgdtw/lBf6ZOU
         0iMzN+I2QHIN6F4CRwiNlB9YfGK0mMZ0e1GSyEgB6ZY0e0CKG+PW+L5uznHipSdTGjuh
         B7Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534422; x=1796139222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiTGA5Xpq0Cd4i3jFQ3r/irB8WJlGQxKq84ORbCBNp4=;
        b=KDdZCvOyGE7GCV4fQ4F+BWVIpTVjAVKcFByv/hOzXD515jlCBNiEtWiqXh2/TLfOZB
         f87tDzJVvnLXOIK2bhed7G7sinasmdxq+2JFwS3Ak/1ZkIGaoqTxJjqpfDRC1rI6x95K
         hf9DlTg0RdnyRUI2Z9RkXOzqYN4/RPfDODBHvQJ3ZhXr5rtzkeZ7nHUw7b31KP7/IdmH
         9iesT8+87g+IcB4bM+o5Iezn2hI1svA3/GQqJjMOTavZ/VPlaFpd0WpSXQjz0iBUxtGU
         2fAi1KvCiaX/q9/Qzodo4ehRq0GMoi8H+8fR0zoU8v9lBufqeXn0JG3ab8pPj95FiF3z
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534422; x=1796139222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AiTGA5Xpq0Cd4i3jFQ3r/irB8WJlGQxKq84ORbCBNp4=;
        b=oyLFEZGQXXIYU4X6TTGwuhPAqHsbn5bbednLytsi9pWwUKhn5Dl2LbuNM7ce8hhaC+
         U7HFv8hHsxNjBt5skOI4LS9tQOndewRXm3+ArgXmXm7AwlTvh+Rf4XDGem80UcAGXXF7
         OcKptM00kz+dnRQdGOtK36LK/yZwOOsqDFz+qQA++r5820tXau0zDSJ9svysCEj0Rf9R
         dkINJqCzz6NeMOEu9vrRfPYbYRlz2EEdV6Wm1K/AGMaqY6bVpTKGJhCU4E3hox2Q29zE
         cSuXg5vWjcJfk0NeK3lPzS6EHvBxH2/30jTEe3jcnRrdq7BvCG/4HHQh2sbxO4/4vdhi
         21EA==
X-Forwarded-Encrypted: i=1; AL+hErF7J+TpiH1SRkvZMD4t2Uy4Ijdt/Ty1l6V333NZKNTG1+MTKS09dktAzaGOy9gFm3u+d64kZxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LeSX3C9s8aDEvH3U11eR8lTiK/yhODQfJvtPtGn6elNBzeRIq
	xMI28nUHxUXfWUYCWQbsQtBJpVK6zXt/g+2mhnjy/ER9k5oF6Oj6294oowUmh2EDgg9EfXrOcj9
	G+Q3y7bXKE4aZw4Gf4WsZTa4Y8qVZ3rk=
X-Gm-Gg: AZFdTZehei3es0vWKYfVWo89w1nNzSOQYuqGPpw1xe4Qk7e2eb91JlKDq4gYVoa7Sy3
	M8nIrQzzLpmc+1aofrRJaEQFhIZp1fPJAksa4oSUrWXVn7DHsii9bTamJNEWiN+ohyFrmb+8rU4
	NBVcy6Hm0umSkKUTJndnfvHBnAE3pckidQPb9xwuQiCthu5+fntEr4y3BiaiNpVeskYIwD+sJ79
	5kWYnnHYxSJDFyFAloK1Knw1mnCEOOYcD4n9juIgPYsUTqk4r+PF7/ol9RNgcDkjaM8ptbbUWrS
	x5lncqK9WVUxoNF5AlqwLtifLcXmN0qrWxfOCXv7VTqiBIWp9VAHI7ecPsbeQDWbevzPDavDL75
	K2Pcute7U0JvQd3vjMzCD10E78utjuFU/CwGU0RU=
X-Received: by 2002:a05:6372:a70f:b0:3fb:4a1e:2f7c with SMTP id
 adf61e73a8af0-4014e351c1fmr13889151637.57.1795534422128; Tue, 24 Nov 2026
 07:33:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124134808.1103307-1-magnus.karlsson@intel.com> <awWnS2rr3OT9OZ1L@boxer>
In-Reply-To: <awWnS2rr3OT9OZ1L@boxer>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 24 Nov 2026 16:33:28 +0100
X-Gm-Features: Aa3M54qyvwiwiPvbu1fg29SlZrcSOeklrRqDEno8f-IoB3UrUf5GnQcu2hokNNo
Message-ID: <CAJ8uoz3-xx1FBranaLCvpDmTXZeAZqbHaJUX6RHLhFTgDtkoMg@mail.gmail.com>
Subject: Re: [PATCH net] xsk: parse Tx batches in packet units for all
 shared-UMEM pools
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, sdf@fomichev.me, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, bjorn@kernel.org, kerneljasonxing@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 16:05, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Tue, Nov 24, 2026 at 02:48:08PM +0100, Magnus Karlsson wrote:
> > Zero-copy drivers that use xsk_tx_peek_release_desc_batch() are meant to
> > receive only complete packets of at most xdp_zc_max_segs descriptors.
> > Single-socket pools and shared-UMEM pools with XDP_UMEM_SG_FLAG get this
> > from xskq_cons_read_desc_batch(), which also drains invalid and
> > oversized packets. Shared-UMEM pools without XDP_UMEM_SG_FLAG still use
> > xsk_tx_peek_release_fallback(), which peeks one descriptor at a time,
> > on the assumption that such pools never carry multi-buffer packets.
> >
> > That assumption does not hold. Descriptor validation accepts
> > XDP_PKT_CONTD whether or not the UMEM has XDP_UMEM_SG_FLAG, so
> > descriptors from such a pool can form multi-buffer packets, as they
> > already do on a single-socket pool. The fallback then hands the driver
> > a batch that can end in the middle of a packet, packets longer than
> > xdp_zc_max_segs, and, as xsk_tx_peek_desc() moves on to another socket
> > when the per-socket budget runs out, descriptors of another socket in
> > the middle of a packet. On ice, a packet with more than eight data
> > descriptors triggers a malicious driver detection event.
> >
> > Use xsk_tx_peek_release_shared_desc_batch() for all shared-UMEM pools,
> > so that they are parsed like a single non-SG socket, and remove the now
> > unused fallback.
>
> Should have done it from day 1 - thanks!
>
> >
> > Implemented a test for this in xskxceiver that opens two sockets in
> > shared_umem mode and from one socket sends a packet with too many
> > fragments in between two single-fragment packets. Without this patch,
> > the NIC resets, but with it the two single-fragment packets are
> > received and the test passes.
>
> I don't see it anywhere so this reads a bit weird. I would appreciate the
> follow-up with this new test case.

Should have said explicitly that it is not included here as it has to
go to net-next. I will contribute it as soon as your stuff is in.

> Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
>
> >
> > Fixes: d5581966040f ("xsk: support ZC Tx multi-buffer in batch API")
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> >  net/xdp/xsk.c | 17 -----------------
> >  1 file changed, 17 deletions(-)
> >
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index ab2e4fa87a4f..7d0701e0e025 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -604,18 +604,6 @@ bool xsk_tx_peek_desc(struct xsk_buff_pool *pool, struct xdp_desc *desc)
> >  }
> >  EXPORT_SYMBOL(xsk_tx_peek_desc);
> >
> > -static u32 xsk_tx_peek_release_fallback(struct xsk_buff_pool *pool, u32 max_entries)
> > -{
> > -     struct xdp_desc *descs = pool->tx_descs;
> > -     u32 nb_pkts = 0;
> > -
> > -     while (nb_pkts < max_entries && xsk_tx_peek_desc(pool, &descs[nb_pkts]))
> > -             nb_pkts++;
> > -
> > -     xsk_tx_release(pool);
> > -     return nb_pkts;
> > -}
> > -
> >  static void xsk_tx_commit_batch(struct xsk_buff_pool *pool,
> >                               struct xsk_tx_batch *batch)
> >  {
> > @@ -763,11 +751,6 @@ u32 xsk_tx_peek_release_desc_batch(struct xsk_buff_pool *pool, u32 nb_pkts)
> >
> >       umem_shared = !list_is_singular(&pool->xsk_tx_list);
> >
> > -     if (umem_shared && !(pool->umem->flags & XDP_UMEM_SG_FLAG)) {
> > -             rcu_read_unlock();
> > -             return xsk_tx_peek_release_fallback(pool, nb_pkts);
> > -     }
> > -
> >       /* This is the backpressure mechanism for the Tx path. Try to
> >        * reserve space in the completion queue for all packets, but
> >        * if there are fewer slots available, just process that many
> > --
> > 2.38.1
> >
