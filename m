Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626729;
	b=XbYrowAt6xYgwdVfX7Es+JlvEBSRW6Y/N8elaevazrj9J2iXoLMOiE2whxSmIbqpVz+H
	 /IBISnjsBr9fmP3qjpoy2l0tBlvz1ujYeNTf7t1QiQZDhoqM+srmvXcCGmPwiS4NKkpVv
	 CmmtvjF/LBe99CO47EivR+vo/s7rudqeAY9HveMmD2cGoUD6edfPCtvEWxeKt7dmFsYn8
	 pVbNvqh6zPPI44C8ZgRR6B5i+f/aA/x/1DEV5QOPDmC7twWpKAYAg+FsgrMQVZoGFtabF
	 gwnHxqz4EOZHaL6btvy8UxnaZcdRDOBAiVM6eWVl0KFEzKkfGDp1KCJtFK2N8ERzfpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
	b=neKXBWHuwpS3NlhQYt5JDH+eS1VnG/VycwQ6DLJFouEyBV2OYtjdm6zWp47xiBi2Ctgp
	 9LpdfBLy0628gq7jIYQV+zBcLscnKWpxRQzo2TgEfcPZPVAJRPeX9UwYMUs6NF013L9lW
	 qKdz6YyGazCRnObgmMGaqNhWP3wmp6xiC+hJ9Ev3BCHR7+q/aJe6SDhdudRmqmKBh2RE+
	 DAjJexzsaXSPqoo3HCdIzLfxdWvJYp8S7/GnDyxV4YqEW30fhCUnEnuKoC9IiLwTBsJdj
	 raW8IPQsz6S9yEEZFhiBh3OGibeSDl/SUgTva1oNIPTRcelNv8FjftESrBRX8e49MjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8e5Ggm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0953606A330
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0953606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8e5Ggm8
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba2bd43dd8so51786a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626727; cv=none;
        d=google.com; s=arc-20260327;
        b=Rl/6xf7Ka3vCOzus+5nPmhiNIeXzbhc7PRxgVbf7+jParBiR57OB2shWiDy9y/21y2
         xas/AdOU2ObcksPJAjnnwYdIPt4r59qnME+Wx9dMw+nOwIugkTccIIyCCdBXSZ6EdNT4
         x/pP0LQrLxzPp0ZW2mXSlxrwR67VikivTcv8uYbeaEyP05p5yO8oA8vP/FNPMV8TmM9v
         PIw4XLOAzDVg2XrLuMHubZbE4WVsPHm5qv9O60HOSJttDJgUcb7B07vCA8vOpXVg8RY+
         aBQ1E2ZwQb7jhWspOrM1qy+4DcLl/FKW8cDjI+dZ9RQvDD81XD8tM9C/ms6O3bW2lXjj
         ViUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        fh=QQsrqkNgQHQacntaVXLSm+SjfekpPdxNaoD28md8UiE=;
        b=R0wFfnsyFh3NMzu2AAiauBwS8ccleBBItuKgifBYJ2ta5bs7OlGaNrfp1/0YDzihR8
         +x4atqo4L9jBKkIOkfTzqCqeKPoUyNlJX7EVD2yecNPzhWQhWpUkssXzOgwvAhGrhP5A
         jzifzUXXySzPmutzRVHbAbROSlqTNWEqD4G4Y/CAWZNCVNzuaUgPgiIrK7BUCF0iGlKe
         jn3to0QhQTladZdoZ0nafWS6a0hstgEcyeHdl9oprz7bWkvTWn9Ub58MgP62SJppWlBF
         BBbVf+H2tgIWF1Pf+NXFblw+Y9qVdr2PqUbQ1dIOZrA7GKzavOYCkbqx0luQa+5XW26d
         c6Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795626727; x=1796231527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        b=V8e5Ggm84inOCQAMYdSzZXXtwJhtKZGa3opq9z1u/ygc7Cgvs3z918oJs3ToJLw7oU
         fCIdlQx3YW7fwfa3MvqmFwEVGA/cH80K5y45fHseumRQDYwVP5JL9FNBFFBkQGhyp/7+
         CdnfXm+OFERmvEfRmZRda7WADVdA8s7Hz7Ws6kl4Uww/UlySc1XE7K8rQ2FyWXjVL5CC
         jdXKNdR6yMG3CWPw7Oe9VxXrj72H0VOKx+H37KQtOfKyJ6zCm3qY4EMqOqLxNmwmIgN6
         ftKr/KHB+HRvvJvBSV84Vu7yMAd4Dao5AN9X9O1+nNoSlSEsxLxzcBQ3y5VaOM0ImSyS
         9+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626727; x=1796231527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        b=EVm68klWkjwJtLsvbH9Dpp+C4mByd3gYgCEWpandcKV6fPzJp5Hfvv6zTr6Nvd6bVx
         /HUcIRKJ2/HHyz5WxBoJa0dseOmUxh51cDFf6KPAmtLG1uVnlLa8hVN1htCC6BuLRavW
         InO7VDtxzhd3l2JBodh/ldyrQH//qHS2fPaaZPEiHiElYUbTblxmGiWhVyqtNbSHqTy+
         iJ3gt1hNQ0n/IVn2AI8yft1v7/jz7d/FscxvaiEyZ6kR5PW6kNN3in5Wpx1b56dAC7Fm
         N/wGqaXgxuYa1try2oECkzcWGcTNOhtzGtzWLSYftiKnUsFt2MCYOTRocU3rhyr+PTxD
         UAFw==
X-Gm-Message-State: APuU4Z94Xxeze5SwWz7RP41pQAaU4pd/FfqfAvTAeKZalhyMGhfjyQPY
	hWr4mfWVN6zm0lCuqs7lyCmVAAkmDJ87d4xL6k/D47ERJ40OjoPRrXQict+HXqxQY4pmlHY0Ch/
	77yUDjEGAWl8q/RZLkHGajv6MQD2Z+BQC1dESzFC+
X-Gm-Gg: AZFdTZcYfhg9SxfqE3uiK6BuBCdpWWtnoq7Z/2/IW3PmUidXc5pnNl7Mhk5k67r4ykP
	FDLGaM9b5Zh0LYqHXOQYFPArP0qZeXgk3daxvRbpyzm4xROCFIkXsVHXhXGJ4R5gkA0QXN9JSlH
	R6z/ZDK+7RGQZlMOK5uvZIdIcwwtrXUvSnuKU2vqguoGnU3Y0Ec5BeV7tDvSQ8NzadiGQIZZKNP
	dKevgIyRJQ94Ythciipd3zNvO3qp5j+X9MP1olvijFL0hie4W3B3krmKfI7akUWV1Efm4MI8Sns
	qeSgKYPFXNjaW+LTCRBiZtQN8P9EamV2DfDSK7Rn/f+yWGqRSsD7I7Imx6y5LfDqvIfKl0wWrQK
	8jX4JytomIqeSCgPhqj9DKO64iooogMFa4mFAhQ==
X-Received: by 2002:a05:6402:1c05:b0:6b6:ee14:5096 with SMTP id
 4fb4d7f45d1cf-6ba6edd1421mr395825a12.10.1795626726540; Wed, 25 Nov 2026
 09:12:06 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com> <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
In-Reply-To: <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 25 Nov 2026 09:11:54 -0800
X-Gm-Features: Aa3M54rtHxu24NDH6LtxWg_kyJM9Tle0yl5VdSQDTOsl7lzOpGstdr23hcQlHN0
Message-ID: <CAHS8izP3c6V_2EaQVHSXOq3hCNP4xM=gNWtBikbV1CHK_YeVgg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
To: Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:24=E2=80=AFPM Willem de Bruijn <willemb@google.co=
m> wrote:
>
> On Fri, Nov 20, 2026 at 12:50=E2=80=AFAM Mina Almasry <almasrymina@google=
.com> wrote:
> >
> > Support leased RX and TX devmem bindings when either the virtual device
> > (e.g. netkit) or the physical backing net_device is unregistered:
> >
> > 1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
> >    can lock either binding->map_dev or binding->bind_dev.
> > 2. Rename binding->dev and binding->vdev to binding->map_dev (physical
> >    DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx)=
.
> > 3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
> >    netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
> >    unregistering physical device reached through a queue lease.
> > 4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
> >    xarray lookup, validation, device check, and reference acquisition
> >    run under a single rcu_read_lock() section.
> > 5. Always populate bind_dev on RX and TX bindings and handle teardown
> >    and netdev unregistration of both bind_dev and map_dev, waiting for
> >    synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
> >    unmapping bindings whose map_dev is unregistering.
> > 6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
> >    leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
> >    bind-rx when map_dev differs from netdev, assert both devices are
> >    locked, and check netif_lease_valid(map_dev).
> > 7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
> >    bindings across both virtual-first and physical-first netdev
> >    unregistration orders.
> >
> > These issues were discovered during AI code review (Sashiko) of the
> > earlier non-leased devmem unregister series (and subsequent mailing lis=
t
> > review) and confirmed by code inspection (not observed in production or
> > reproduced on real hardware). Tested with the nl_netdev.py selftest on
> > netdevsim added in this series.
>
> Is it perhaps possible to avoid the dual device tracking?
>
> AI summary so YMMV, but worth considering if the alternative is sound
> and a lot simpler (to maintain long term too):
>
>   The leased RX UAF on physical NIC removal and reconfiguring a dying
> physical queue on unlease (plus the bind-vs-unregister race) are
>   worth fixing.
>
>   Before going with the dual bind_dev/map_dev tracking, have you
> considered resolving leased RX queues to phys_dev and phys_rxq once at
> bind-
>   rx time instead? Since mp_params, page_pool, and dma_dev all live on
> the physical queue anyway (and netkit doesn't store any memory
>   provider state on virt_rxq), storing phys_dev in binding->dev and
> phys_rxq in binding->bound_rxqs=E2=80=94plus clearing rxq->mp_params in
>   dev_memory_provider_uninstall() and passing phys_rxq in
> netif_rxq_cleanup_unlease()=E2=80=94would let dev_memory_provider_uninsta=
ll()
> and socket
>   teardown operate directly on the physical device under netdev_lock(phys=
_dev).
>
>   That would keep binding single-device (vdev stays an opaque TX-only
> cookie), avoid most of patches 1, 2, 4, and 5 (no dual-device locking,
>   no two-pass net_devmem_dev_unregister(), and no TX behavior change
> when only the virtual device unregisters), and let physical-first
>   teardown clean up directly while virtual-first unlease can unmap
> immediately when the queue closes cleanly.

Huh, I thought dual device tracking was essential especially with
Nvidia's upcoming Data Direct series, but my bot calls out that this
approach works and even extends well to that series. Let me prototype
it and see if I run into issues. Thanks for the suggestion!

--=20
Thanks,
Mina
