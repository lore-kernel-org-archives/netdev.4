Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436777;
	b=ZxbjVjq4fNMX4nJld7Lqj+/5cdw0qJ9AvdwB/BddhPLIQHBhek88swGfxQt5S4Rh0Z0q
	 UAJdX/tzYQQHetZRbYl3oMkG0EVoqnD80dWkO827PVQiYu7+aBc8PVo8c6Sww4TLpMHGP
	 mF46DQTREbD6snKaaHDGMXFcreO+V97jqWIVGHiALMjQWYBDnOt8OoqKUsAvn10Oy6KXf
	 0EwE+oBWRgZM5YzCwilIoWRyimlMFg6A8zrs25OBdCfvSh7KuU9liCgbJHbCqNXNvgzER
	 oEcMPTG4ro5TjdzVaLMJgN+oOKn4psTEECuDEZUUb5V/PU6FQr9i43VmzWIGNJdNgIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436777;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hap4NqfDUAtYDZTLDfzwkUrvXAq3qrwrlgF3SqTYS88=;
	b=iQdtDHdbPEAwC188klBzLVVk7OCynxB8OY4CLRJ+mHu0/VWVbG0M7NTtkGGTO5B+3ni6
	 XzZoJJtdUHBD4WSiBUpTUyF13++qDrPHLLgA2i0c+8TkYhz15nTeST5jucYyaUOjzeqdd
	 ISP2LslEUehOS/9PtkSnaUSblEyaAAoCkD8QsNoxr7jAloCHNDZQqhm0+dHBFkpNryvOE
	 ZW/FdE6vtPWANGYhMvQ4POiMKMCf1o4+cXybL2l/Ol1CWTNhbCe4Prf5SFStQKapTLIaZ
	 VTu9xqp9FhiLU46QbaLIsA94xsdiM+hc/dstgFAooTByr0HcjqpOS2agn4B+ahUPmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdHtvZPf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1A606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdHtvZPf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375A01F000D2
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436776;
	bh=hap4NqfDUAtYDZTLDfzwkUrvXAq3qrwrlgF3SqTYS88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HdHtvZPfch1IfdAgGiJaMLZbRLsvzOsEzvLtKuage9+EsNlosx51aV908GNMly9IJ
	 bEGKSjYjxNeGFxpfEZcE4dVldF2l9K1v2SqYUQBC2ZkeJTv8tbnbEO0T6go0RVxWY4
	 BZvu2Num6LklaouSjzt8XUmiZz0AWwrb/ZngD63lQ8cnOFZZbWUaM2MTGHQOXcXbVR
	 4TdhWIwL1OiCkkHOPSZK83qrJPe/Fw3jsgN9Sy5449Ec32aFodUH5GStn0PWKkoaAq
	 J13UgWSY19JEajLY6T9wkp+A2MEa10E2FlLS0cy40+M6WsP7EsBrjbUD3bDAv5/TMc
	 8Rap3sqEIFoVQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d68de53053so2455225eaf.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:26:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHsvJOEgWfUFOzol0V2HWwO6MxlYR0ladKZq1CxTEoS8a0cei9JuemPMbmzGEfbrv8drKbBDX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lrLoZoe22tKZU5hGH6dMnmInVzMyEKym8J62kuNAokHosc32j
	WXkO+ofLEUNTAg+WHy5UzLCMPk3Z3tkSFtjbYFLnGDzWb3vVCDjfXQt50fuoFciV1OJ73DHfTJ2
	wOva3b45BqmHRfAUFu92ENbRoZyEncSE=
X-Received: by 2002:a05:6820:809:b0:702:dd8d:3177 with SMTP id
 006d021491bc7-71b39208ce6mr8755968eaf.9.1795436775489; Mon, 23 Nov 2026
 04:26:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123121325.3137049-1-bsdhenrymartin@gmail.com> <CA+7S2v+CpMWyD89XQiWq5qC=NPQWFtJ49_7mm-GcxTOCt+gZ3Q@mail.gmail.com>
In-Reply-To: <CA+7S2v+CpMWyD89XQiWq5qC=NPQWFtJ49_7mm-GcxTOCt+gZ3Q@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 13:26:03 +0100
X-Gmail-Original-Message-ID: <CAL4WiirmFNN-2S6YiDZVfx_2FmdNxzGSO0VhDqe0eZ9t2TvbYA@mail.gmail.com>
X-Gm-Features: Aa3M54rI-zzW4XJI4pXhhM8icWw0efWld42-HsWzk_Y3mIlBZkYMrvm7I1Gld_A
Message-ID: <CAL4WiirmFNN-2S6YiDZVfx_2FmdNxzGSO0VhDqe0eZ9t2TvbYA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: zero the tail of ha->addr when allocating
 address list entries
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, sdf.kernel@gmail.com, nicolas.dichtel@6wind.com, 
	horms@kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Machon <daniel.machon@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 13:21, Yuyang Huang <sigefriedhyy@gmail.com> a =
=C3=A9crit :
>
> On Mon, Nov 23, 2026 at 9:13=E2=80=AFPM Henry Martin <bsdhenrymartin@gmai=
l.com> wrote:
> >
> > __hw_addr_create() allocates entries with kmalloc() and initializes onl=
y
> > addr_len bytes of ha->addr, but the dump paths emit each entry using th=
e
> > current dev->addr_len, so an entry created with a smaller addr_len is
> > dumped with an uninitialized tail.
> >
> > dev->addr_len can grow at runtime and nothing flushes the lists.  While
> > addr_len is 0 every addition collapses into one node, because
> > __hw_addr_add_ex() compares zero bytes, so the test adds one zero-lengt=
h
> > multicast entry to each of 64 tun devices and switches them to
> > ARPHRD_IP6GRE (addr_len 16).  RTM_GETMULTICAST then returned 64 entries
> > of 16 bytes, 37 with non-zero bytes and 21 starting with a kernel heap
> > pointer (e.g. 0xffff8188_04857ee0).  tun has to flush dev->uc and
> > dev->mc in TUNSETLINK as well, which is a separate patch; qmi_wwan raw
> > IP mode and the HDLC attach/detach paths change addr_len in the same
> > way, so tun is not the only case.
> >
> > Allocate with kzalloc() so the tail is zeroed at creation; the explicit
> > ha->sync_cnt =3D 0 then becomes redundant.
> >
> > Found by an automated static analysis scan (Tencent CodeBuddy Security)
> > and triggered at runtime on v7.4-rc3 as an unprivileged user.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLIN=
K processing")
> > Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrym=
artin@gmail.com/
> > Link: https://lore.kernel.org/netdev/20261118125443.1137177-1-edumazet@=
kernel.org/
> > Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> > Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> > v2 -> v3:
> >  - describe the test setup accurately: one entry on each of 64 tun
> >    devices, since all additions collapse into one node while addr_len
> >    is 0
> >  - point Fixes: at cca8ea3b05c9, which made the leak reachable from tun
> >  - link to v1 instead of the earlier review thread, and link to the
> >    companion tun patch
> >  - note that other drivers change addr_len without flushing the lists
> >  - state how the issue was found
> >
> >  net/core/dev_addr_lists.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> > index d827cc21867b..9613c8a9ed7f 100644
> > --- a/net/core/dev_addr_lists.c
> > +++ b/net/core/dev_addr_lists.c
> > @@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_=
len,
> >         alloc_size =3D sizeof(*ha);
> >         if (alloc_size < L1_CACHE_BYTES)
> >                 alloc_size =3D L1_CACHE_BYTES;
> > -       ha =3D kmalloc(alloc_size, GFP_ATOMIC);
> > +       ha =3D kzalloc(alloc_size, GFP_ATOMIC);
> >         if (!ha)
> >                 return NULL;
> >         memcpy(ha->addr, addr, addr_len);
> > @@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int add=
r_len,
> >         ha->refcount =3D 1;
> >         ha->global_use =3D global;
> >         ha->synced =3D sync ? 1 : 0;
> > -       ha->sync_cnt =3D 0;
> >
> >         return ha;
> >  }
> > --
> > 2.43.7
> >
>
>  Reviewed-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
