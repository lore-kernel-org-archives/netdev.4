Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446564;
	b=5HNgmt3rJ4cTycRibr5/i1JlSpAL7HGRKp2F7jbj5OF185S3RTQRpLbTFSUVNpxdcvod
	 xgRuwPTe6amRmmSB27541prbLOI5qiSf3fTCnGLlrU+MRn0knxODKcaeoTxet3I4oCPXj
	 8V8TJdAD5A2vvqogBjLAeo7UrWp3f0HFWX4AaHOB3HeS4nqTSSiQDX84Ec53lxX1avSNd
	 HcIoMIbqSJC8bN0IFnSvoy1vW3G6n22x/USbhJRO/U2QOH9i5rbX57mSR1vayEHi/6QuU
	 f0Ga0oPWgN4owRtyj8m8stvzKB5AuG0eQVwYo8Ku0STCPHlzfkInraPOgUE6YKpqsyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
	b=BVOwRK6wdzUrxM8/trLEDkSwZvbbGsM68eHnPUYT1LEOIwRk7BnW7tYJVHkqgwz6Ybkt
	 sgDnMWGt/3PhnZ3GWBoDZQ/r1Q9Kxo5BKvLJ6xwlxRldJTdVjzxwj87Dg5hZWaZpgrkoE
	 vltqqpc/S8GbY+OIruT6EHTpfCqULGz+zTMHW0YGvQXdm4HVVyPS/MS5E3wGAAvj+wngX
	 PdRQnD2Af8yuI7xHigbCXMRnYDPfZs544urq7dgg6QUb+bZKLApjQeq7hjBEts0aH30Aq
	 qn/jUQ0IbM7m7AVWlUzjpUYHzzS0lqM3OrAtQ6rMYIiqcLFbL7/tEkqiILeR+2ZZjtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYfvIHm5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18BF606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18BF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYfvIHm5
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so16835a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446562; cv=none;
        d=google.com; s=arc-20260327;
        b=ORspDrcOB1x8tM/PaiWesdZdrDtQ6Ilhd55eRt14K081+XWLV6zG5S8vhoeFj6bs5p
         8h21zZoNHqCFO3V+e28EPXxbxM1/hdu9uWU4oUEWTs9ZyqEfVhaWQWTi/5dlogPqdjDc
         qUkOYDuzx0f+zBVxAPpTqInvUtmFDRYy+D9lACGeNz5hgP2qPA7lIbQiGGSLeL8+42tf
         PwczeVEwVvrkMssco/BXsPp/SmS3epJFHXvK9tjdVTFlPNUhc2dxikxTGgyEcAhu19XS
         A1epv9KzJgClA3+SF7bsmVq/lI73XUd/vhxC9E29cxf+rHk+QpM9W6blrFu2lj64h3Jb
         CYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        fh=VvUgftNV5IYXRnq3IicxynsBRD5YIONB+ovQ+xaSexE=;
        b=k9Kd5Puow6bgw7NVLTfI04Gk2fMuAj5tsODh7zmHvQd1kc2u2Fyez7LR/iAkadBlOI
         b1fwgoKANKVWdyfP0qENOCVqNGurw7TxT3YywFY23ZBg61H++0VQ7LrmwP0JhK8GVMfq
         mAMpYwrECgEFpfdMkRa1Ig6sB8ioSXMFfj0T6203T+UEWdPIKbxyX4oLNRAd5gOJDEIj
         x8XpfXxcRKbJdUm+wx8+TcdBu+kzcJBQ+cBC0+egHfI2YMYdAm8qnXMHKQf2teDgHOB9
         A8K2IBb2RoAnsi0SjzjRSHWBSAHMVPoMZX4sIIQnlcOQgHLRZgrYq1tTJuiDzejfTibd
         VsGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795446562; x=1796051362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        b=QYfvIHm51hQXR/eUaGZRXmA4issLNXn/O6pcRRxwPOiArg+TEDks2DdPx0ca6z6l7a
         vtvW+kbq/iaPK9tUDHoAV+ViEJTh0hTyCM/BAVoSMfQ3EK2DHlsAy3CFJPlTlgagkG9r
         z2LUP5xMVst9YHSSN8RrL9qrwWWFrunPYSjfnfmk2ANUwj0jSH4c883kVGz876fODsT5
         ZBDomhcPQwZcFC9yPcPU3UuCWbtkmKM0G/P5Ag4EKwboUw/DiTtjZpeBafC70GVHL9p7
         GG3XuNg7AuaLsq6q0AXdR5PrzselMImJYBDAIpgG7ULEskl8Vrh+rmOpxuHmd4KFEcMb
         4oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446562; x=1796051362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iROMKK4E2qrBJd8xzjbJ+DTtYIKryOK0KQ3FE39oKk=;
        b=pgvDQShcKgeBz5Lt630x1T+cv10NV2L4CaBgLbMkq//c8W9RJvWFrdgFRz8xQgOnyS
         X/tbZL1x0lJYpNpumwZK8N/esjo93MHhm5PL6HNXdecSD4aYFZtxHFwZ96CuGraSf9tc
         a13HLkVypdfUhfo5b4uCRbcH7HmOHUDCPHMdr/mQCMo5ErtuWkfHBrkGqqD720lMdikR
         cJPoj/Pkj2xFVBrZ5tH1Jj6l580kFXzU5hg82OpoHGvporQ45jSruj/vkKAL/6sZ+qA0
         y2CRFj7PaIZaPq0GLm+9R3isj59bqhGVAnFB49S8uXPUwIXXZd/5s+plKsp0GLfJu0pk
         Yogw==
X-Gm-Message-State: APuU4Z9Cs9ypwH7rdBPTIQS1zppDDNmTe0hP94nRqw0q10YdLecT8NHh
	4NZen+1uQ9sxYuTT3ewmat+J6EwadAtomPs5OshRyjQ5QVN6lmb4Wy/55b1YHdx5VG1aQe6HJpT
	cUlzyYJ3yDHlvFw/4pVWL+fO6ulcIOxBWIodKA5Mw
X-Gm-Gg: AZFdTZc+5WglHK2hoyKV3rIGQzgutMav8L4dgnxv9zGDlEjbaJs+OZmsZIz/3ltgJwE
	wjvluwAe9kO+J+FNLaZjHtYZnZn37/uWVlEYeySSMbtQK2oqAwNfGLkS1rmM2RJKdqoU3WXzYiB
	OmfOKjYRy315SDT3q0A16DCtEsIdEWeWK+6MGxcP4juv+dTfayUUj+T41VIZF3lIavYH7aoMfVM
	jl/kHrebFFfi67irdfzqIROlI8b0ooghXpd0zs9RUeM5X9FXgz3UmBOzo7iTZriG6ELmP9+e8kI
	lrcFbkEHU9ZID/YOCpe7x7tV6nD75loX7sy2TzfNv3VyTMgXJPy0HbvUkqNlIgsT5rPQTPYyyCQ
	yU3byZ3z9vC1g5z7w4+jfT8vxcPkLs+HbLGw=
X-Received: by 2002:aa7:c0c8:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba65a847bbmr156680a12.2.1795446561840; Mon, 23 Nov 2026
 07:09:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-6-almasrymina@google.com> <179540996620.3135.3612533688050456273@kernel.org>
In-Reply-To: <179540996620.3135.3612533688050456273@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 23 Nov 2026 07:09:10 -0800
X-Gm-Features: Aa3M54qGzgsg7LGdQaLFwL502JFh5W00x6CdU2_DLyJYa834Njv81crjgh4M-NU
Message-ID: <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com, 
	bobbyeshleman@meta.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 8:59=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Undisclosed user-visible behaviour change for leased TX
>   bindings.
> - [Low] The commit message presents this patch as fixing 'issues' found
>   by AI review of the earlier devmem unregister series, 'confirmed by=E2=
=80=A6
>
> --
>
> net: devmem: always populate bind_dev and detach both devices on unregist=
er
>
> This patch always sets binding->bind_dev to the device that bind-rx or
> bind-tx was called on. Socket teardown, queue close and queue uninstall
> now use bind_dev, and net_devmem_dev_unregister() handles bind_dev and
> map_dev separately, calling synchronize_net() before unmapping when
> map_dev unregisters. net_devmem_get_binding() also now requires map_dev
> to be non-NULL.
>
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 6f85b90950f8b..80c3e149cd762 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
>
> [ ... ]
>
> > @@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device =
*dev)
> >
> >       xa_lock(&net_devmem_dmabuf_bindings);
> >       xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> > -             if (binding->direction =3D=3D DMA_FROM_DEVICE) {
> > -                     if (READ_ONCE(binding->map_dev) !=3D dev ||
> > -                         xa_get_mark(&net_devmem_dmabuf_bindings, xa_i=
dx,
> > -                                     NET_DEVMEM_BINDING_LIVE))
> > -                             continue;
> > -             } else {
> > -                     if (READ_ONCE(binding->bind_dev) =3D=3D dev)
> > +             if (READ_ONCE(binding->bind_dev) =3D=3D dev) {
> > +                     __xa_clear_mark(&net_devmem_dmabuf_bindings, xa_i=
dx,
> > +                                     NET_DEVMEM_BINDING_LIVE);
> > +                     if (xa_empty(&binding->bound_rxqs) ||
> > +                         !netif_is_queue_leasee(dev))
> >                               WRITE_ONCE(binding->bind_dev, NULL);
> > -                     if (READ_ONCE(binding->map_dev) !=3D dev)
> > -                             continue;
> > -                     WRITE_ONCE(binding->bind_dev, NULL);
> > +             }
>
> [Severity: Medium]
> Does this change what happens to leased TX bindings when only the virtual
> device goes away?
>
> If bind-tx is called on a netkit device, netdev_find_netmem_tx_dev()
> picks the physical NIC as map_dev, and bind_dev is now the netkit device.
> When the netkit device is deleted and the physical NIC stays registered,
> this first walk matches bind_dev =3D=3D dev and clears
> NET_DEVMEM_BINDING_LIVE.
>
> After that, net_devmem_get_binding() fails here:
>
>         binding =3D xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_=
id,
>                           NET_DEVMEM_BINDING_LIVE);
>
> So every later devmem sendmsg with that dmabuf id returns -EINVAL, even
> when dst_dev =3D=3D map_dev.
>
> Before this patch, the code from ede1618064a9 ("net: devmem: detach TX
> bindings on NETDEV_UNREGISTER") only cleared the virtual device pointer i=
n
> this case and left the binding live. That commit gave its reason as "only
> clear binding->vdev so no new TX sends match the virtual device while
> allowing in-flight TX packets on binding->dev to finish DMA safely".
>
> TX bindings have an empty bound_rxqs, so bind_dev is cleared here anyway.
> net_devmem_get_binding() would then only match map_dev. Does correctness
> need the LIVE mark to be cleared in this case?
>
> If the change is intended, could the commit message say that it reverses
> the earlier design, and why? Right now it only says "first walk the
> bindings to clear NET_DEVMEM_BINDING_LIVE to stop new lookups".
>
> The same goes for the synchronize_net() added further down for the
> map_dev case. ede1618064a9 said a grace period was not needed there.
>
> This behaviour is still the same at the end of the series. The selftest
> added later in the series (devmem_lease_bind_tx_unregister_check with
> remove_virt_first) only checks the dmabuf attach count. It does not check
> whether sends through the physical device still work.
>

This seems like some kind of hallucination? AFAICT after this patch
we're making the binding not live anymore, so we don't match it
against new TX, but in validate_xmit we're checking against map_dev,
not bind_dev, so in-flight packets should be fine as long as the
map_dev is in tact.

Also, I'm not sure we care so much about what happens exactly to the
in-flight TX packets when the binding is being unregistered. The
application is probably ending tx anyway.

Also with so many life cycle bugs in the lease case, I'm worried
someone can reproduce a consistent way to crash some setups with these
issues.

--=20
Thanks,
Mina
