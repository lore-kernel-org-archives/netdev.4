Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859536;
	b=xCekQIGYN4+cz14LHdgGFwkIubQQO2UyZWg9HrjskxSdp/LOZvATMkpAkAX91vSIqaMR
	 8GVp4HZc4PXpkCEplHUgdx5rlHGM2/VUYTCiSjUe6ciR5LxTMxs3LT6cYEycVmrc5pGCu
	 bOOGbQGDZbNzvEeF0U9XuKXcX0FvhNK5pmcmV8tvL6yBlDKMV9t2VwJJZYA2lbNimkgtZ
	 znF3I3D7Z3myViJsIrDwQZHwJRwfNxSI976dgEdid5yqNu9GizY7gQuC0y+HOZTjWNjq/
	 +IZfGPcB8mB41tv0bS6IkGkd6OUSu2LzKdQRGssdrY49N4znSDLDrYB36prYnTtXGrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
	b=OH+y1jsBWgNBFvMeMPADGE2elbYKq6ERKKESSw/MZDd10UCZuQ0sBUpMhay5I0+oV/ts
	 oCS58LeIKXD1Euh3Y4HUO7r9UI1H7NlEmyPR8uY7oiX4tnInScS+9qSwhuX5PGOr2AGNe
	 QgKlk7QMWFsimeDtc1UDHb9to5tVfJ5Wip+W8XKmfFWys+zoRqGw8t6AduxpuqHcPpyaD
	 UC5x5qBXKvfixZQS9rJRNv4sG7kj9F8RiEDmBzKl+7LRE1eDUXmWhFjt1ktkPHjmtl9de
	 3K+va+T+u+sl38IsuW2RRYkaVSQs88A6N7Mx2H43xTISNL0WpQUWpUlurz+0qiIcbUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkksPml8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D1606A338
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281D1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkksPml8
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1851a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859534; cv=none;
        d=google.com; s=arc-20260327;
        b=NxJ5/yzI84xgRva3j8JzN2AxDROr425zF/Z1UujXATuc5yWYx/NL8L78LJl6SaW7sw
         6nvdGqk9jucbs01fXG0sBUGLtG6kGtmy6EJl9Mc3+n5ayh62dA3hc0lAgWpCadwakgcK
         +L9lhrj8aeWB2aPq6JwPVCCg7vG2cqo1AIKOcwPZH7+BeHh+qYCnGlCVdsz9dLAdRB2/
         XI6iFyD+ZgCN1jyXT0mbsvZNoGFlR5azD1pApJm+pONJj+tgB6UUFathUmpin2bXCxR8
         BYDPIa35aR8DQM78LJWptqkwNu+WRsrI8L6Iub2CkPRhCawnWxC7vYV4OrpXFyU50S7G
         ZRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        fh=e6ZrBnM+M64eKsEjvHBvJRmtBwPL6qtpDLVo9uQShKQ=;
        b=lEfBH+dDew0UEQEUK7tQYU6d9YEk5TxPAtbxZydRH73wAc2EY/UH0DeApxhPZ1FmmI
         bTEePDDwwqDTLzMpKtQ244qLrYn+nsAiSkoULrwfpG3CBRxCPAo2w3eNuH471+gqf+a7
         7NLIPl3CNbEW2ECwza1j0ddRwv9ZAf56Y1EejHb7VIZpsSgdL74uRph5yoeHmt8rkZkH
         VRU3gs/f3gQUWuAQ/+lRnJh54jcrrAtaqfxvNOAq4BoIjYzJK4lKkTjFufh2yY0kQxAl
         c83BNKotK3KtbyIMJHuLAbwKuXBLkRwKGGXhl1rf0mrX8RifEswiGnKd3BE+4nDyKPHU
         gPHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859534; x=1795464334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        b=IkksPml8E3hyTIxztKkLwWNm1VbUqDLEUUeOgZbiZlOAbOPlMK+i6fRCs/pkslK+S0
         AoQijbjLAoJdk6OzJ9w/HqLoOeJvtTmRW9cKaWBp2F2nidc/BrJsK8iVc2LaYj4dLWQr
         89u/N2AMvOoMfqct8NqjQv8AixlzjhSVovdYKDH6Yx5391GZwCD2FAADrLFSuE+rZObO
         c01IWug4iCdjZHswB2JK0S4kB9UXsoXVs/0c8hscDbY1L0C4xByQI0VthmXPN7kIcO1t
         4vRLVwCTnjp8BvaXwdPftIuUI3Qkrds0yKBicQ77EbgVdpbew7w9NmgeVp04fwmQTkVy
         Pybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859534; x=1795464334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FbHC+AouLeCTX4lljlFzinGOTMD7NXf67uVcoKnZkY=;
        b=DF4GACcfZvGRq1Peds98v8eQmbo4B92WQuNIWJuyTobhG8SJEvS7Hgy4zPRIrCKDQ3
         zEsOJ6FL4su8CpxmfMuSIGk/yFeTwiOjPA7Rqo4qMIdnJuTE0EcPILurCLJtx4dHHhXY
         zd+fRwdDWsWKfL/x0kQ6jvfILC1HqXZZ61vEhR++EPq1ikHn0PA9L27w/vJsOxkKq3Sw
         zM3NL7A+zS2ZsalIieCRk8t54czOSC5xHBXIp4O2wkx+1GCGzq0cNMDAfxkOP/dCKa2Z
         UGdO8MfVId+idRoxCvK1/xAOJTGihyVua0KCivJ5CUXcSxbbVHF9XLFhtXMhymSRjYO7
         4EAQ==
X-Gm-Message-State: APuU4Z/C7TdamKbfacwS8F+wNSyLtULS4ZKCR/YZ/BD1DPk78rsfstk/
	XfQNp63xv9ZNlej6kQfCKr7qBv5fj6ivglWmD2jlIk79GlatdaN9xPngh1XYAN/j3SQsTSYObmw
	LRmbatJaI4JqIAZbhy32RCmGu0OI13IswRf56tlOb
X-Gm-Gg: AYBFou0Yp0prBZ/EYKCRVUAuO0Lmfy7bxzRkRnO0XeoyIQFqjoxTqX0+K4Y8fAeHGch
	uu7IJnprVZvIUoM9NJOfyxsipCjz6iFuoOKR0NxFlPHK/smfDYoAy9MphGQ9zOVdwxVLljUmReR
	Y0io47wlOdKEyljVQAq4Be6BjxtBYbMAKk1dWvmG3PjByf+A58lI1gfH4l/Y8+mUwcC5KxxWldx
	CenLRoDk3cv4x4LdVsuVSzwJL3dpSY48hWYn7dugrZA4aH0VtSbOpVs9Ed1wxLknBn3nrS43+Xl
	HBnIg8KtcxXSmrYcVESTFczZjE7un7XjLnkvW7neYxKmQKhjgRHz019EP+ulLqZJ5uzZneG+eK1
	HN6qdDvADDA79q3RBMix9P63oAprFskfDIYs=
X-Received: by 2002:a05:6402:c51b:10b0:6b7:91a7:a637 with SMTP id
 4fb4d7f45d1cf-6b85b54dacbmr11086a12.6.1794859533949; Mon, 16 Nov 2026
 12:05:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com> <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
In-Reply-To: <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 12:05:22 -0800
X-Gm-Features: AclHuK9UKGjj2K-M9UCbTvhamuiZBM47PX_Z2xi10nURBXzwNATp7PsG82osGLU
Message-ID: <CAHS8izN4eCMub+douN8P29KstidvsxVmpvDKhjZ4JDH9yXAJ9w@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:05=E2=80=AFAM Stanislav Fomichev
<sdf.kernel@gmail.com> wrote:
>
> On 11/15, Mina Almasry wrote:
> > Prevent coalescing, shifting, or appending skb fragments from
> > incompatible memory providers or different devmem bindings.
> >
> > Add skb_net_iov_provider(), skb_mem_provider_compat(), and
> > skb_frags_can_coalesce() to check readability and fragment provider
> > compatibility (net_iov_owner(niov) for devmem, niov->desc.pp for other
> > net_iov providers such as io_uring zcrx, and NULL for page-backed skbs)
> > across skb_try_coalesce(), skb_shift(), skb_gro_receive(),
> > skb_gro_receive_list(), tcp_skb_can_collapse(), and
> > tcp_skb_can_collapse_rx().
> >
> > Also add net_devmem_skb_binding() and use it in tcp_sendmsg_locked(),
> > zerocopy_fill_skb_from_devmem(), and validate_xmit_unreadable_skb() so
> > TX skbs cannot mix different devmem bindings or transmit non-devmem
> > unreadable frags on DMA TX devices. Reject converting linear head_frag
> > payloads into page frags on unreadable skbs in skb_try_coalesce() and
> > skb_gro_receive(), and propagate skb->unreadable and compare
> > skb_frag_netmem() in tcp_clone_payload().
> >
> > Update netmem_ref_test_net_iov and netmem_ref_test_try_coalesce so thei=
r
> > target skbs carry a compatible unreadable net_iov frag before shifting
> > or coalescing.
> >
> > This issue was found by manual code inspection and LLM review; it was
> > not triggered in production. Verified with the net_core KUnit test
> > suite; not tested on real hardware.
> >
> > Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> > Fixes: bd61848900bf ("net: devmem: Implement TX path")
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
> >  include/net/tcp.h      |  5 ++--
> >  net/core/datagram.c    |  4 +--
> >  net/core/dev.c         | 14 ++++-------
> >  net/core/devmem.h      | 22 +++++++++++++++++
> >  net/core/gro.c         | 16 ++++--------
> >  net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
> >  net/core/skbuff.c      | 24 +++++++-----------
> >  net/ipv4/tcp.c         |  3 ++-
> >  net/ipv4/tcp_output.c  |  4 ++-
> >  10 files changed, 142 insertions(+), 47 deletions(-)
> >
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index 1d6832878930..867e3ab17c17 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -3770,6 +3770,61 @@ static inline void *skb_frag_address(const skb_f=
rag_t *frag)
> >       return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
> >  }
> >
> > +/* Return an opaque pointer identifying the memory provider instance o=
f @skb's
> > + * net_iov fragments:
> > + * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area,=
 1:1 with
> > + *   the binding across RX queues and TX).
> > + * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp =
(shared
> > + *   across all areas of an io_zcrx_ifq).
> > + */
> > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > +{
> > +     struct net_iov *niov;
> > +
> > +     if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
> > +             return NULL;
> > +
> > +     niov =3D skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
> > +     if (!niov)
> > +             return NULL;
> > +
> > +     if (net_is_devmem_iov(niov))
> > +             return net_iov_owner(niov);
> > +
> > +     return niov->desc.pp;
> > +}
> > +
> > +/* Return true if the memory providers of @skb1 and @skb2 are compatib=
le
> > + * for coalescing. For any struct page-backed provider (the buddy allo=
cator
> > + * or a future provider handing out struct pages), coalescing is assum=
ed
> > + * feasible. For net_iov-backed providers, the provider instance point=
er
> > + * must match.
> > + */
> > +static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
> > +                                        const struct sk_buff *skb2)
> > +{
> > +     /* Check skb_frags_readable() first to reject readable/unreadable
> > +      * mismatches and avoid chasing frags[0] and struct net_iov when
> > +      * only one skb has unreadable frags.
> > +      */
> > +     if (skb_frags_readable(skb1) !=3D skb_frags_readable(skb2))
> > +             return false;
> > +
> > +     return skb_net_iov_provider(skb1) =3D=3D skb_net_iov_provider(skb=
2);
> > +}
> > +
> > +static inline bool skb_frags_can_coalesce(struct sk_buff *to,
> > +                                       struct sk_buff *from)
> > +{
> > +     if (to->pp_recycle !=3D from->pp_recycle)
> > +             return false;
> > +
> > +     if (skb_zcopy(to) || skb_zcopy(from))
> > +             return false;
> > +
> > +     return skb_mem_provider_compat(to, from);
> > +}
> > +
> >  /**
> >   * skb_frag_address_safe - gets the address of the data contained in a=
 paged fragment
> >   * @frag: the paged fragment buffer
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 25d11fab1b03..bf5f28e52fca 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -1275,14 +1275,15 @@ static inline bool tcp_skb_can_collapse(const s=
truct sk_buff *to,
> >                     mptcp_skb_can_collapse(to, from) &&
> >                     !skb_cmp_decrypted(to, from) &&
> >                     skb_pure_zcopy_same(to, from) &&
> > -                   skb_frags_readable(to) =3D=3D skb_frags_readable(fr=
om));
> > +                   skb_mem_provider_compat(to, from));
> >  }
> >
> >  static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
> >                                          const struct sk_buff *from)
> >  {
> >       return likely(mptcp_skb_can_collapse(to, from) &&
> > -                   !skb_cmp_decrypted(to, from));
> > +                   !skb_cmp_decrypted(to, from) &&
> > +                   skb_mem_provider_compat(to, from));
> >  }
> >
> >  /* Events passed to congestion control interface */
> > diff --git a/net/core/datagram.c b/net/core/datagram.c
> > index ecc30a6f8302..88cc0a6c62f6 100644
> > --- a/net/core/datagram.c
> > +++ b/net/core/datagram.c
> > @@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, =
struct iov_iter *from,
> >       size_t virt_addr, size, off;
> >       struct net_iov *niov;
> >
> > -     if (i && skb_frags_readable(skb))
> > -             return -EFAULT;
> > +     if (i && net_devmem_skb_binding(skb) !=3D binding)
> > +             return -EMSGSIZE;
> >
> >       /* Devmem filling works by taking an IOVEC from the user where th=
e
> >        * iov_addrs are interpreted as an offset in bytes into the dma-b=
uf to
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index a230ecce9327..51f5e4800eee 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [..]
>
> > @@ -4175,8 +4175,7 @@ static struct sk_buff *sk_validate_xmit_skb(struc=
t sk_buff *skb,
> >  static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *sk=
b,
> >                                                   struct net_device *de=
v)
> >  {
> > -     struct skb_shared_info *shinfo;
> > -     struct net_iov *niov;
> > +     struct net_devmem_dmabuf_binding *binding;
> >
> >       if (likely(skb_frags_readable(skb) ||
> >                  dev->netmem_tx =3D=3D NETMEM_TX_NO_DMA))
> > @@ -4185,14 +4184,11 @@ static struct sk_buff *validate_xmit_unreadable=
_skb(struct sk_buff *skb,
> >       if (dev->netmem_tx =3D=3D NETMEM_TX_NONE)
> >               goto out_free;
> >
> > -     shinfo =3D skb_shinfo(skb);
> > -
> >       /* All net_iovs in an unreadable skb share the same binding. */
> > -     if (shinfo->nr_frags > 0) {
> > -             niov =3D netmem_to_net_iov(skb_frag_netmem(&shinfo->frags=
[0]));
> > -             if (net_is_devmem_iov(niov) &&
> > -                 (net_devmem_iov_binding(niov)->direction !=3D DMA_TO_=
DEVICE ||
> > -                  READ_ONCE(net_devmem_iov_binding(niov)->dev) !=3D de=
v))
> > +     if (skb_shinfo(skb)->nr_frags > 0) {
> > +             binding =3D net_devmem_skb_binding(skb);
> > +             if (!binding || binding->direction !=3D DMA_TO_DEVICE ||
> > +                 READ_ONCE(binding->dev) !=3D dev)
> >                       goto out_free;
> >       }
> >
>
> Should we limit this patch to the real fixes only? This part does
> not look essential. validate_xmit_unreadable_skb already does skb_frags_r=
eadable
> check above, it already does nr_frags > 0 check here...
> so why go through the same stuff again via net_devmem_skb_binding?
>

So this is a real fix actually, although I agree it's kinda clobbered
into a patch with an unrelated fix. The existing checks do not catch
io_uring zcrx RX packets that have been received and the stack is
trying to forward them over a netdev where the memory is not mapped,
and this patch fixes that.

> If you want, maybe move this to a separate patch at least? And do
> something like:
>
> binding =3D net_devmem_skb_binding(skb);
> /* I hope likely() below properly unwraps net_devmem_skb_binding similar
>  * to existing likely(skb_frags_readable) case... */
> if (likely(!binding)) goto out;
> if (dev->netmem_tx =3D=3D NETMEM_TX_NO_DMA) goto out;
> if (dev->netmem_tx =3D=3D NETMEM_TX_NONE) goto out_free;
> if (READ_ONCE(binding->dev) !=3D dev) goto out_free;
> return skb;
>
> And call it cleanup with no fixes tags.

I could break it into a separate patch and reduce some of the
duplicated checks, but it's still a fix. It may be good as-is once you
realize it's a necessary change?

--
Thanks,
Mina
