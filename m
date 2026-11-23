Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442381;
	b=qVWG18zH8h8a9El5PV2phTIyz9TLOZbiSn3hs6CtWVuwj/XdnGMbbqwyP+cFWWGNym5+
	 1pwqgUj+AKQBp5du/gigIZtRgN/zJqAHN7DNsgO7/szL3IHKWhIUafHSuGMORPfbKOnxx
	 8RkJVSJHcomqYA/+liefghItBgK7W4CCKDWxqDDyAAU7g7mc/3Cd8MyHcKsEl17e2TyoH
	 FMVH1p+DivpFBxPZ1Van6w5J0/oJJUxwwt8ISFBgwzWJLEnFeho2ijaFEgZkl9SLtYHVn
	 19Acd0/SRuV6xl97b/IPA57JeDvYTa5s4gYIGdHxnM/xOWQA7zJlsVZsbhbIWKZ65xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tlfO4B45EC9cuyRt8phU696ACnOeHZNE/KodroKLqGY=;
	b=ZaQhtzFS/kZwOI2rFKrfrpizHpLoZXOtl/6hGKHLvisbh9gUtHK7D52459YUH4fJMzks
	 +O1iWYbcojwlJeJ5RWjkt/KYc53bi4GHFHtVND3Ud/8c9g/qOzmOwxaK+SsMRzrEHaQSk
	 4+OSB7DJXdExJfm/C2wskhoTHY8ly1Bt3sfzWhd5ikTYbLrrYk8He02QfCG8q5Jymt9J1
	 2m6FrdaKgD5xqhJ1FFvZhcORpYZYKlmAp5GIYr9WyUJlXb/Yuaxi7LtKlHrxZnn193C2z
	 RGcPW10Vb6PBlCdvjOwL98ey1UAKcHtgXdG18hCwRz+/JkM5sCy9KWXftReag9TM+RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b30ClGti;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A139606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A139606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b30ClGti
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2307173b3a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795442381; cv=none;
        d=google.com; s=arc-20260327;
        b=eu8NbKEZY/Xhv/4KUp8mHA/uBp8OlBE465HmsgvIZBKSI0EaV0xd8GlHaDRmigZFMt
         JaOdom8QfShhF7UAWW428sjHQjq+dh7YukCrlfjGi4gvEpllYXioIrrKpDUXD8OEeCLD
         oHvWXt38EU79uQohkKfscEkOxLA64F0xTyiLnLgiE3HeFysGEzyKXgZcF4CWEmFm7kuv
         KWBvKKePmZDumkNiLVeahSSsCRhfncPI+/jaavdgO+EytWGqskl8ZYEa6NoRSRmP61vx
         Nv1K8LVgS/3YdO8ymnHSf5iO2bAyNPdMrtUJlE9gXS/lhZveDUlRQRvLkMy36e8RID2c
         AJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tlfO4B45EC9cuyRt8phU696ACnOeHZNE/KodroKLqGY=;
        fh=S9AQ5gj24FsFhXgmO2NK7o9Z55IC12wRdIW8cQLGtcA=;
        b=J0Ig5D34dZktnTMw2G071A9xDQEinL50sZ8lm/g6F7i5f50btd9xT2ON+NblX1cDn+
         s1d91aMHpCdSby8mGXtBzO6zpuya1seZM/OrUG1uFcYopzsgH9x92awJpSPG/Em1B8wV
         ZN2IYB/5aD2rrXxM/40ybzunmkACXZU83dbHhjrD/vEXRL3VqM2sV9OJL/HXoxrir5C/
         rNcstp7NdCtoZGZEaH8AZV84p7KrT0iEC+dKL6l5/oadzcN52q+40q4aDaL6EscrQvYO
         eJFILVFjl0LfK0IywL6DDoR+IqJuUCm9bnLFcOlDnAoxLOzXB2DIkyOOImlVH1UCTWSa
         4KIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442381; x=1796047181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tlfO4B45EC9cuyRt8phU696ACnOeHZNE/KodroKLqGY=;
        b=b30ClGtiUDNpYpkL7g/n7rOyh+LauH8++kaim7jNvo2JRHTgqcxH5jaz6D/j54HHPl
         w8K1xB1OjRUr8mKNyvV5fIbjuqSmXvYa+Max5Nx4PpQoHlsxIUGP5sLfADnOA3rm5ItY
         A8VFEfncL8kq4HQXXZ3HndSreO2LiHXMYNfAo5v80JgkZ4KD+t4+PycoFwhj19hCmpKS
         6rxFR5X2kQsziMJgt+DPJhZQVjtIy/XCMHrA63ExfUYMaMUdQsru2f6WKEgg5CGH7ONv
         7kvEO4BNtonqjaLMUNlC4SXCX0NnRG4CeY5jHPuaNOWgJFFs5632whhQedsBqiQbKiKT
         hBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442381; x=1796047181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlfO4B45EC9cuyRt8phU696ACnOeHZNE/KodroKLqGY=;
        b=xNiPqMxxSxjWmoNa2L+cOARd1dVU44UBLSi3e8pEoMe/h3YBOu9r3s64/zWcpOhpkF
         BWqjV5fM9VQHhAMWdhm5TvTVJCyfyZhmFs9LUdiPHWFPaIlDzSOsWpdG8brPgrCokeK5
         wh/mWmIOXNdhLoi1jj7JlvuNoOrsSvnbWJX5YitRYjD171O72fJ7PK6J/XSKBYonI2WP
         Q52KSvWA7BYFhqpQ8dPx+EQCRGLSuDaa9ah4b+NFakw28dML3cviR7AOZv/cm9nYspw+
         YQYB9s7WiiGAJDKhG4zc8fT4OXP32PmB/R6n06FrN7XBQRzuO1un/l0En9pYr4LKcDwl
         TdXg==
X-Forwarded-Encrypted: i=1; AL+hErHVKCmV9dEHoOgg0BJaKkmmXQSDXVgQhcQRKJjutmgQ9KlOJbHsoD0qrRl+O2DRjmjuamMhIzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JZkqykjJA6qxF5d9J36weme1L3WcDESAKcgLwj6+SodrigccY
	rqbu29aY2mOB4NzBAPg4LoJdHrIV6kjBPv+rYYXoXQsvzBKOYawcnjQF9CYF9muUy1drxG2xsCA
	kdc1D+U1ave5eVl6Jen55hzWWs4TvETo=
X-Gm-Gg: AZFdTZfJfmA390QVCs5pOIY/VxnSX9Dhf8iOVaYeIrryievGz4gQ8sKx80qcINqVQ+2
	46KOrG4Fmb6fAMUCpk/LoAg91zc5EL/fnF6SwGikOvOD7E/RYKfw071ge2eU/WcZPx8cWPv+Gfd
	lLnQnAQbrhfAzoCLtvMEHDbkEeyxcrqhGpySBEglDttJSTvmr0WqeWYAbICSWTrBqGhOx4D6jcF
	Zc0eGtu77sy0PIOu6NMgdS48g+y4cTZ6WtKeGdcrrmaz2PX60h4L87pRY33pPfNIgoU0hmdiJMW
	Dgv33NBKC9pB6uZMYSYlFvuWR5IdXFPvR/9G2X9umbEcqllPPgc5ofS2YYaNvCpeOnx5zJ1TDFL
	X6xrt92kp/ikOL1cjtXB9K/OdSAApRrfwE31p
X-Received: by 2002:a05:6a00:984:b0:8bf:e028:7864 with SMTP id
 d2e1a72fcca58-8c87663e154mr11101894b3a.0.1795442380482; Mon, 23 Nov 2026
 05:59:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-4-magnus.karlsson@intel.com> <awBXmCqkMKxsc+9i@boxer>
 <CAJ8uoz2tKthHN6MHUJoixtjzkGqJR0ukdJCWRG0_2_J11PN_uw@mail.gmail.com> <awQBgefjtxMdZYWg@boxer>
In-Reply-To: <awQBgefjtxMdZYWg@boxer>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 23 Nov 2026 14:59:27 +0100
X-Gm-Features: Aa3M54r-NCsZ4ZM4AX2tCeJg_MUvFpna-XwzlPMyitDwRzQ8QlsFoNm6MG0GkWA
Message-ID: <CAJ8uoz3rJ3saU3eErZVYRQnCckggEjDAY9EV05yqdX8vy5dP=g@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] xsk: ice: add USO zero-copy support
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, sdf@fomichev.me, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, bjorn@kernel.org, kerneljasonxing@gmail.com, 
	intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, jacob.e.keller@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 at 10:04, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Mon, Nov 23, 2026 at 09:40:37AM +0100, Magnus Karlsson wrote:
> > On Fri, 20 Nov 2026 at 15:22, Maciej Fijalkowski
> > <maciej.fijalkowski@intel.com> wrote:
> > >
> > > On Thu, Nov 19, 2026 at 05:53:38PM +0100, Magnus Karlsson wrote:
> > > > Add UDP Segmentation Offload (USO) for AF_XDP zero-copy and impleme=
nt
> > > > it in the ice driver. Drivers advertise support with tmo_supports_u=
so,
> > > > which is reported to user space as the tx-uso-zc netdev XSK feature=
.
> > > >
> > > > The core exports xsk_tx_uso_parse() and xsk_tx_uso_prepare_headers(=
) for
> > > > drivers, which snapshot, validate and prepare the packet header, an=
d
> > > > xsk_tx_invalid_descs() for accounting dropped requests. Drivers wit=
hout
> > > > tmo_supports_uso keep handling a USO request as invalid metadata, s=
o
> > > > xsk_tx_metadata_request() ignores the packet's metadata. As in copy
> > > > mode, requests that produce more than one datagram also need
> > > > NETIF_F_GSO_UDP_L4 on the device.
> > > >
> > > > Packet headers are copied into kernel-owned memory before they are
> > > > validated and handed to the NIC, so that user space cannot change t=
hem
> > > > afterwards. ice keeps a DMA-mapped header slot for every two
> > > > descriptors of the XDP Tx ring, as a USO packet takes at least a
> > > > context and a header descriptor. The slots hold only header bytes a=
nd
> > > > are allocated page by page to avoid a large contiguous
> > > > allocation. They belong to the ring: they are allocated when a pool
> > > > that can carry USO requests is assigned to the ring, and freed with
> > > > the ring. They therefore follow XDP attach and detach, ring rebuild=
s
> > > > and netdev unregistration rather than the pool. Only the copied hea=
der
> > > > bytes are synced for the device. With fewer XDP rings than CPUs,
> > > > queues share XDP rings and would share their slots, so no slots are
> > > > allocated and USO requests are ignored for now, though support for
> > > > this could be added as a separate patch set in the future. tx-uso-z=
c
> > > > is still reported in this case, as documented. The slots are only
> > > > set up when an XDP program is attached. If they cannot be allocated
> > > > when a ring is reconfigured, the ring keeps its pool without USO an=
d a
> > > > warning is logged, while a bind fails.
> > > >
> > > > When the slots exist, ice_xmit_zc() processes descriptors one packe=
t
> > > > at a time. A USO packet gets a context and a header descriptor, the=
n
> > > > shares the data-descriptor loop with ordinary packets. The Tx budge=
t
> > > > reserves worst-case descriptors per packet. The per-packet path is =
used
> > > > for every pool with a Tx metadata area that can carry USO requests,
> > > > whether or not it sends them. Other pools keep the existing batched
> > > > fast path. Both paths share the budget, tail, stats and wakeup
> > > > handling. If the Tx ring cannot hold a maximum-size packet in this
> > > > worst case, such a packet could never be peeked and Tx would stall,=
 so
> > > > no header slots are allocated, USO requests are ignored and a warni=
ng
> > > > is logged. The pool flag is not cleared, as the pool may still fall
> > > > back to copy mode. This is only possible when PAGE_SIZE is 64K and =
the
> > > > Tx ring is set to its minimum size.
> > > >
> > > > Packets that exceed the hardware limits are dropped and counted in
> > > > tx_invalid_descs through the new xsk_tx_invalid_descs() helper. The=
ir
> > > > completions are deferred behind in-flight descriptors to keep the
> > > > completion ring in order. Packets without USO are dropped as well i=
f
> > > > they would exceed the eight buffers, which is possible when chunks
> > > > larger than a data descriptor are split. A batch from the shared-um=
em
> > > > fallback can end inside a packet. That packet is dropped, and so is
> > > > its remainder in the next batch.
> > > >
> > > > On completion, a buffer of the existing fast path still stands for =
one
> > > > completion, so that path writes nothing to tx_buf[] and struct
> > > > ice_tx_buf keeps its size. Buffers of the USO path carry an explici=
t
> > > > completion count in a union with fields that zero-copy rings do not=
 use.
> > > > USO header slots, deferred drops and buffers split into several
> > > > descriptors are tracked with a per-ring counter, so ordinary traffi=
c
> > > > keeps the fast cleanup path. The header slot of a context descripto=
r is
> > > > found from its position in the ring.
> > > >
> > > > The descriptors are built with the descriptor builders that the
> > > > previous patch added for ice_tso().
> > > >
> > > > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
>
> > > > +/* Returns the number of packets queued on the ring. */
> > > > +static u32 ice_xmit_zc_metadata(struct ice_tx_ring *ring, struct x=
sk_buff_pool *pool,
> > > > +                             u32 count, unsigned int *total_bytes)
> > > > +{
> > > > +     struct xdp_desc *descs =3D pool->tx_descs;
> > > > +     u32 i =3D 0, packets =3D 0;
> > > > +
> > > > +     /* Drop the rest of a packet whose start was dropped in an ea=
rlier batch. */
> > > > +     if (unlikely(ring->xsk_drain)) {
> > > > +             while (i < count && ring->xsk_drain)
> > > > +                     ring->xsk_drain =3D !xsk_is_eop_desc(&descs[i=
++]);
> > > > +             ice_xsk_drop_packet(ring, pool, i);
> > > > +     }
> > > > +
> > > > +     while (i < count) {
> > > > +             u32 cmd =3D 0, offset =3D 0, skip =3D 0, slot_offset;
> > > > +             u32 len =3D descs[i].len, nr =3D 1;
> > > > +             struct ice_xsk_uso_page *page;
> > > > +             struct xsk_tx_uso_info info;
> > > > +             int uso;
> > > > +
> > > > +             while (!xsk_is_eop_desc(&descs[i + nr - 1]) && i + nr=
 < count)
> > > > +                     len +=3D descs[i + nr++].len;
> > > > +             /* The shared-umem fallback can end a batch inside a =
packet. */
> > >
> > > No, it can not... or at least the intent was not to. the shared umem
> > > fallback has been written in a way that it also calls
> > > xskq_cons_read_desc_batch() which is supposed *not* to expose incompl=
ete
> > > multi-buffer packet.
> > >
> > > Is that a special case where you don't set XDP_USE_SG but packets are=
 not
> > > linear due to USO, or what?
> > >
> > > I wouldn't like to propagate the draining disease down to drivers. We=
've
> > > put enough of convoluted code onto layer above, let us address it the=
re if
> > > there's something missing?
> >
> > You are right. This should not be here in the driver. I will fix it in
> > the core instead.
> >
> > At some point we really need to simplify the skb multi-buffer path.
> > Always gives me a headache.
>
> skb mbuf is not a victim here :P regardless I agree on rewrite.
>
> >
> > > I'm gonna cut the review here and keep the comments I had so far.
> > >
> > > > +             if (unlikely(!xsk_is_eop_desc(&descs[i + nr - 1]))) {
> > > > +                     ice_xsk_drop_packet(ring, pool, nr);
> > > > +                     ring->xsk_drain =3D true;
> > > > +                     break;
> > > > +             }
> > > > +             page =3D ice_xsk_uso_slot(ring, ring->next_to_use, &s=
lot_offset);
> > > > +             uso =3D xsk_tx_uso_parse(pool, &descs[i], nr, &info,
> > > > +                                    page->addr + slot_offset + NET=
_IP_ALIGN);
> > > > +             if (uso < 0 || (!uso && !ice_xsk_bufs_fit(pool, &desc=
s[i], nr)) ||
> > > > +                 (uso && ice_xsk_xmit_uso_hdr(ring, &descs[i], nr,=
 &info,
> > > > +                                              &cmd, &offset))) {
> > > > +                     ice_xsk_drop_packet(ring, pool, nr);
> > > > +                     i +=3D nr;
> > > > +                     continue;
> > > > +             }
> > > > +             if (uso) {
> > > > +                     skip =3D info.header_len;
> > > > +                     *total_bytes +=3D (info.gso_segs - 1) * skip;
> > > > +                     packets +=3D info.gso_segs - 1;
> > > > +             }
> > > > +             ice_xsk_xmit_descs(ring, pool, &descs[i], nr, skip, c=
md, offset);
> > > > +             *total_bytes +=3D len;
> > > > +             packets++;
> > > > +             i +=3D nr;
> > > > +     }
> > > > +     return packets;
> > > > +}
> > > > +
> > > > +/**
> > > > + * ice_xsk_setup_metadata - register AF_XDP Tx metadata operations
> > > > + * @netdev: net_device
> > > > + */
> > > > +void ice_xsk_setup_metadata(struct net_device *netdev)
> > > > +{
> > > > +     static const struct xsk_tx_metadata_ops ops =3D {
> > > > +             .tmo_supports_uso =3D true,
> > > > +     };
> > > > +
> > > > +     netdev->xsk_tx_metadata_ops =3D &ops;
> > > > +}
> > > > +
> > > >  /**
> > > >   * ice_xmit_zc - take entries from XSK Tx ring and place them onto=
 HW Tx ring
> > > >   * @xdp_ring: XDP ring to produce the HW Tx descriptors on
> > > > @@ -801,9 +1222,9 @@ static void ice_fill_tx_hw_ring(struct ice_tx_=
ring *xdp_ring,
> > > >  bool ice_xmit_zc(struct ice_tx_ring *xdp_ring, struct xsk_buff_poo=
l *xsk_pool)
> > > >  {
> > > >       struct xdp_desc *descs =3D xsk_pool->tx_descs;
> > > > -     u32 nb_pkts, nb_processed =3D 0;
> > > > +     u32 nb_pkts, nb_processed =3D 0, packets;
> > > >       unsigned int total_bytes =3D 0;
> > > > -     int budget;
> > > > +     u32 budget, cost =3D 1;
> > > >
> > > >       ice_clean_xdp_irq_zc(xdp_ring, xsk_pool);
> > > >
> > > > @@ -811,26 +1232,38 @@ bool ice_xmit_zc(struct ice_tx_ring *xdp_rin=
g, struct xsk_buff_pool *xsk_pool)
> > > >           !netif_running(xdp_ring->vsi->netdev))
> > > >               return true;
> > > >
> > > > -     budget =3D ICE_DESC_UNUSED(xdp_ring);
> > > > -     budget =3D min_t(u16, budget, ICE_RING_QUARTER(xdp_ring));
> > > > +     /* Reserve worst-case descriptors for each potential USO pack=
et. */
> > > > +     if (xdp_ring->xsk_uso_pages)
> > > > +             cost =3D ice_xsk_uso_desc_cost(xsk_pool);
> > > > +     budget =3D min_t(u32, ICE_DESC_UNUSED(xdp_ring) / cost,
> > > > +                    ICE_RING_QUARTER(xdp_ring));
> > > >
> > > >       nb_pkts =3D xsk_tx_peek_release_desc_batch(xsk_pool, budget);
> > > >       if (!nb_pkts)
> > > >               return true;
> > > >
> > > > -     if (xdp_ring->next_to_use + nb_pkts >=3D xdp_ring->count) {
> > > > -             nb_processed =3D xdp_ring->count - xdp_ring->next_to_=
use;
> > > > -             ice_fill_tx_hw_ring(xdp_ring, xsk_pool, descs, nb_pro=
cessed,
> > > > -                                 &total_bytes);
> > > > -             xdp_ring->next_to_use =3D 0;
> > > > -     }
> > > > +     if (xdp_ring->xsk_uso_pages) {
> > > > +             packets =3D ice_xmit_zc_metadata(xdp_ring, xsk_pool, =
nb_pkts,
> > >
> > > nit: could we stick to 'pkts'
> > >
> > > > +                                            &total_bytes);
> > > > +     } else {
> > > > +             if (xdp_ring->next_to_use + nb_pkts >=3D xdp_ring->co=
unt) {
> > > > +                     nb_processed =3D xdp_ring->count - xdp_ring->=
next_to_use;
> > > > +                     ice_fill_tx_hw_ring(xdp_ring, xsk_pool, descs=
, nb_processed,
> > > > +                                         &total_bytes);
> > > > +                     xdp_ring->next_to_use =3D 0;
> > > > +             }
> > > >
> > > > -     ice_fill_tx_hw_ring(xdp_ring, xsk_pool, &descs[nb_processed],
> > > > -                         nb_pkts - nb_processed, &total_bytes);
> > > > +             ice_fill_tx_hw_ring(xdp_ring, xsk_pool, &descs[nb_pro=
cessed],
> > > > +                                 nb_pkts - nb_processed, &total_by=
tes);
> > > > +             packets =3D nb_pkts;
> > > > +     }
> > > >
> > > > -     ice_set_rs_bit(xdp_ring);
> > > > -     ice_xdp_ring_update_tail(xdp_ring);
> > > > -     ice_update_tx_ring_stats(xdp_ring, nb_pkts, total_bytes);
> > > > +     /* Metadata packets may all have been dropped. */
> > > > +     if (packets) {
> > > > +             ice_set_rs_bit(xdp_ring);
> > > > +             ice_xdp_ring_update_tail(xdp_ring);
> > > > +             ice_update_tx_ring_stats(xdp_ring, packets, total_byt=
es);
> > > > +     }
> > > >
> > > >       if (xsk_uses_need_wakeup(xsk_pool))
> > > >               xsk_set_tx_need_wakeup(xsk_pool);
> > > > @@ -939,12 +1372,7 @@ void ice_xsk_clean_xdp_ring(struct ice_tx_rin=
g *xdp_ring)
> > > >       while (ntc !=3D ntu) {
> > > >               struct ice_tx_buf *tx_buf =3D &xdp_ring->tx_buf[ntc];
> > > >
> > > > -             if (tx_buf->type =3D=3D ICE_TX_BUF_XSK_TX) {
> > > > -                     tx_buf->type =3D ICE_TX_BUF_EMPTY;
> > > > -                     xsk_buff_free(tx_buf->xdp);
> > > > -             } else {
> > > > -                     xsk_frames++;
> > > > -             }
> > > > +             xsk_frames +=3D ice_clean_xsk_buf(xdp_ring, tx_buf);
> > > >
> > > >               ntc++;
> > > >               if (ntc >=3D xdp_ring->count)
> > >
> > > I think we could pull out core enablement for zc uso out of this patc=
h
> > > maybe?
> >
> > What do you mean with "core" here? Core as in AF_XDP core, or
> > preparatory stuff to the ice driver?
>
> I meant xsk core as preceding patch and ice changes here would only play
> in its own mud + make use of introduced api before. This would reduce siz=
e
> of this patch.

Will put it in a separate patch. Bj=C3=B6rn commented on this too.
