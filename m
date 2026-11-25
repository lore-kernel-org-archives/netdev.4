Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573464;
	b=loCAF0tIBI2AskBygrGlg0umOHnMlK632D0eVJzTZxJXFv9dVcB+tP8eh/8vav/wRVE2
	 2s3q0jou4hfTqyii47/13OdUDDVV92ExJqCeLxgI6pBbaD6DrW+9IET5gGxESykYnCcks
	 WiCEuXlsQqcWomRNRIpXNN6Idk9AAQ51MasGi35ogbBvYOmZm97uLN0i1BcjOL8KG3Z04
	 vc8T59O4jm6am3lqdNeh9MibVjUYpGrI6d3dpgtHF+I6cz7R2ZN8QlEHD4E18ugx9Ws6u
	 Oi/c/GLkwvMiTKpYgh8SWRL2YfnCjbmpysimR+Bzr1dilr+Z1IAoZeRohnByZQOBbaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
	b=y79iXnzRWxsg2rjBpFA6+Fm8qVsEgcVxssMlbn8645A7LMHD2ePXAWIZI5pNTBsqnqEV
	 5TP1iYA3RiPd5HaSqJpktUe9nI7J5oBC83TDWEU0que6+20ytWp7FEMyrumd9aFOtx409
	 nCl2JjEemGeWsIVz1ND9Zzi5QMX+atmwc5MXyr10Sd3bdPfBhHplr4bkshY8mDf6qebL5
	 U8oFDIespAZSUiYGef8CVlMdncJVJ8Q6NZF8uSPY08lqGH1bWuTYdkRWa7+vHs8M//x/P
	 JAoSLBJMIzxqZmLfoCBjxIpSNLJloljZKMkSpD1s7bvUEgOKhw/DbBSgU25FU4M2gzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LCYVFbhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5A606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LCYVFbhH
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so4753921e87.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573462; cv=none;
        d=google.com; s=arc-20260327;
        b=Seqoo2R6LfU2pbM4CM6Dqz+U1TpG7wRQ5PfzpQZGGDZwjxry3RBu7RqyYJAB2Ms3zf
         7FpbiOATKJHfvgaBLw2ShME6UKZjW73R3qFKpGofoDlDsw8VVCcnoUSEZQUc2U2ZTmZ2
         lPkbh5rQF04xIuqJq+JrXABskaqiBHsd4jmynj/d+zmiySgbjnstfrGd5/jfggfQFMue
         jeiD8S3f5UKfat/1Q5kuI33nzFjAdWZvMljcyCSWggZol/TjoRrQnCLBb6nLy3/uJkj2
         sQTNMYeFGZspr8P0jXDY6bIXnjpvAm2Lnqe5KMSM9xzbgAp3DUHO+vp/sOc57iyYactA
         K4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        fh=ghjmy5ef/Dw2u4DvOjlveMOHxfsEKF2sdcn3mk1SLvM=;
        b=Co9f8QLdJy8M15YEVjav0u3bsQzp5Xv+gds83FtDrlEI4cwOhJz2NdcuC6iRFsYTK0
         7TGB6GusKGIGH3OL62aEBweu6Z/K6DqQOloM8OF8hhtyZx6q/1IyN/5EWo/YomG3jTYQ
         iFhl3gjqitLSKvlprWqCd8WYM1uwTp3sCEgaejHWN0L/KCCkAumBKN4TKUu7fvAHBQTp
         aL70UutpFJDDDNHLgqAJzu9r3hOZEtwHRveT5uBCujLsLUxFep81ozPEthWJfx1j7HCU
         yWwSEcQNxM4KYt1doWGF+JIa8mm5zXx5MyL7wMnnl0IfaLELXT6YPEpy7mdy49jfrUuA
         g6GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795573462; x=1796178262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        b=LCYVFbhHyL0llXm58JUZKT+EcQfGqmt5jyVRvlsWV/dnt/onfl66G4Mu666/AGQ+lJ
         GiyAF5jHHE0mbADUpxBgJTNYudkrScxjEs/4hPLnF8bzPh91QgBYvABI6OZywQUtpkTe
         G/lwiFvllPOdHdV0r1dcy28T0Mw/pvG9dzolbEE+zPL015apxSTKDTK93+2vnX6LJ8U2
         obaLNGmoekvwapQDHxrIeyYrFDrgaZ1Q2gWRwFEb5xtu/0oSDuTEKETkpOEP0ZdCDeMJ
         mNeadfvtJJSLkJOzvAbDIEJroxO1qsiHSyxvwlRfoY4fXVePZst13IBrpFPze5noB88L
         MiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573462; x=1796178262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        b=Stcr4Fidk6Cycuvro6+ASSfVk8MhGxoEgoZg/OMbCOtDG6R8QQWlBOe2p3yQygweEq
         TqtuN/IvbYljTzjSLsEk/xy74hqpy3zPIJn6CobgMIp/I55O+as6FblkS42d3mlmvXmN
         Ydo13kySnM7u5vPDuwkk9uP3yNcivttNVzaUe1gcRuD6MpKM4d/8oI7YbxSD7SLqIMq7
         4gVksqnh/cK3FMg5V5qFUlv+IiTRhxeJLSPYqYF/xRhfEJ7D3lKl/9k4g9YDJEie0j4t
         Er4RIkeimN6r1rUmvfERdqlOsw7LE4C8Lx+jnZGToPaGvgzEwdV8GlIRWwgpgKx2RE9r
         mADA==
X-Gm-Message-State: APuU4Z/9PIdOu3jI6oK8XcoBzT3R0pm71U2N9aMCuWtK438dfEkQoJeR
	RoKiaaL/nQckcxcLJ3vMomLNsuQewYgreiHWb8kK7zTZ2EhU9qvqI2HPzqkXUg1YGoKck5oRkdA
	sNFIGik3RWiPHWMVXBsBVKHSsnENJOFeTqGOOPmSv
X-Gm-Gg: AZFdTZfXacbb68s1arlYBn2nr98q9dn8QIjuRdWPQmGKXf7hxBW4RgliZe6LUnPkdqq
	3Fvkoi0fdCmctfylZVpi6uUVvro0va8lwA8Su844ZCj3PzDnYKxIZeT+v8vpu93xhXCp/GUs/a/
	A9eg6BqkGAhWCDk4SMllbvXelaI/Qe2PllYGxo/O/9M1uqfxolhl6VBQoZpofwAZTvNN7k83Mp7
	k6A4Cy77uWyvToGzI4t0KdtKLSgEaKJkrXi/85ZxD3SjHWwOwVyqJr9kvc9xBta03fS310rBY5C
	Sv1bd0VjuvHJqeXa8CdzgiCxLxTe32wUm4ui6CrTZyTd5+zMvRC+/h3KiM0TEMjVS6Ou0/GpD24
	Uzni7f02/eMvZ3jlNZ+Zh7U4cM/kDEdMvxegFBeRaaFQjRYLpG9yKpXemQfJTFUUqedUB34ZTKD
	/Y2UJzW84XbBvmjCjq3CH93gnNJiAskZNlrTem+IDkz0yKpsvrcr/08f+nmuL6iOyzqefK6kLhi
	KDJeiMf28l/LOuNI/C+QcQQOWJx2gKRMH8tIQ==
X-Received: by 2002:a05:6512:3d24:b0:5c1:4c4b:6b68 with SMTP id
 2adb3069b0e04-5c1bc802f62mr5014716e87.31.1795573461524; Tue, 24 Nov 2026
 18:24:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 24 Nov 2026 21:23:43 -0500
X-Gm-Features: Aa3M54pQBVeIsj5CnW0SePR69-QmnWtg_nSpVkvLRc6_t3yxWi8NAbPfND57CTY
Message-ID: <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:50=E2=80=AFAM Mina Almasry <almasrymina@google.c=
om> wrote:
>
> Support leased RX and TX devmem bindings when either the virtual device
> (e.g. netkit) or the physical backing net_device is unregistered:
>
> 1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
>    can lock either binding->map_dev or binding->bind_dev.
> 2. Rename binding->dev and binding->vdev to binding->map_dev (physical
>    DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
> 3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
>    netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
>    unregistering physical device reached through a queue lease.
> 4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
>    xarray lookup, validation, device check, and reference acquisition
>    run under a single rcu_read_lock() section.
> 5. Always populate bind_dev on RX and TX bindings and handle teardown
>    and netdev unregistration of both bind_dev and map_dev, waiting for
>    synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
>    unmapping bindings whose map_dev is unregistering.
> 6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
>    leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
>    bind-rx when map_dev differs from netdev, assert both devices are
>    locked, and check netif_lease_valid(map_dev).
> 7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
>    bindings across both virtual-first and physical-first netdev
>    unregistration orders.
>
> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series (and subsequent mailing list
> review) and confirmed by code inspection (not observed in production or
> reproduced on real hardware). Tested with the nl_netdev.py selftest on
> netdevsim added in this series.

Is it perhaps possible to avoid the dual device tracking?

AI summary so YMMV, but worth considering if the alternative is sound
and a lot simpler (to maintain long term too):

  The leased RX UAF on physical NIC removal and reconfiguring a dying
physical queue on unlease (plus the bind-vs-unregister race) are
  worth fixing.

  Before going with the dual bind_dev/map_dev tracking, have you
considered resolving leased RX queues to phys_dev and phys_rxq once at
bind-
  rx time instead? Since mp_params, page_pool, and dma_dev all live on
the physical queue anyway (and netkit doesn't store any memory
  provider state on virt_rxq), storing phys_dev in binding->dev and
phys_rxq in binding->bound_rxqs=E2=80=94plus clearing rxq->mp_params in
  dev_memory_provider_uninstall() and passing phys_rxq in
netif_rxq_cleanup_unlease()=E2=80=94would let dev_memory_provider_uninstall=
()
and socket
  teardown operate directly on the physical device under netdev_lock(phys_d=
ev).

  That would keep binding single-device (vdev stays an opaque TX-only
cookie), avoid most of patches 1, 2, 4, and 5 (no dual-device locking,
  no two-pass net_devmem_dev_unregister(), and no TX behavior change
when only the virtual device unregisters), and let physical-first
  teardown clean up directly while virtual-first unlease can unmap
immediately when the queue closes cleanly.
