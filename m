Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097833;
	b=m1msopwhteltMcxQWuLVPfOIGqQFMH5/SAo5je/rhg0dXoF9zvRdpMvgG8wq5rB9ohBr
	 vw/phE3rx/NVyadCj1VHJ2gfafH3WFpe8IO0u+yCnzDI/aQOUZi2jSCf26W/eg9v5o5kM
	 u/ypHEQ0IYx0iT++e6B3tb3LjDKonDSzy9TrqMr+WDRugewcBRYDHo7TU5+zO9I+KHGxb
	 2iL6o6jzbNk91DbgHtnBDdzA/gV++MMrsEEhiSeFbEvRu+/6Y+XAIXbLd8vOQmesT5Ik1
	 BdJjT6HEcZ9OoJFHizGV9aysyGtHAyd3q/H9p7v1/rzKGn8IlXMGWVw00Nz79t1VQ7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
	b=vN68NtFLulH5gVHbQtGj3R5iOJBOi/M/yQgtKsXlPBXLsL7/mEudSOvrA3rUlxOuwqFj
	 AyXns8z8nh7UPQ85gSmS3R15S8WRyERwulcSk99T/Zt1zt1uyne/ZFsu00Ldc5jN01DWI
	 EvrG9k+H+Cq/nz5wO6y83YPPt2IEgHlrSmFJQZ68FF/QnR/Trwsex1IafuoEVDnymTRIJ
	 +zeHdva2IcF7cwkFW7YvLxs8HlFbmVbVkhUifj467M6SBYKtcvD18F5IP5KMNAmlSteEj
	 2iPx7xF6E+407oKQrrycStA/dA8qrGElw0bPPpzy3ifHq5svDKl8C0Qp3U3BLoPlWCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYLCrU1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12E0606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12E0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYLCrU1b
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae3a5d440aso21775341fa.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097831; cv=none;
        d=google.com; s=arc-20260327;
        b=N4b3YrhjP0jD8eevShHSq2Uvu98zjDXrJh/vthxO3WMeFMuFx+lu+rC8CiqnBX88yc
         j5bFCwHTqCNUQsGQYrSCy7POCvY2sshOtEJQSy+xeFpTeaC4IgnLL//n+G07kG4GBtNJ
         04H3rifklZr9+2qgpImvmMK56aLm9cfIDy0LzmghXth1bAvn3EAcpQ1LXXMm5iUZI3Pz
         wc92NRO6PTqpUM+D9cAKLfIY6DUiubrEO02CMK5HoE3KTIfc0kqomk7RVyilkivypfv+
         mLDIiRIKNg0uTGb3XZsjwhzBQW50POle7j7Gw4vkl7Q3pXkPTtGyo+Ac1TxYT8sOv/BP
         7hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        fh=A/aid7ZNnTxMniDLoXI1WWJQQ0hJo5Uif2rACN/fTKA=;
        b=EAZxLDgSyRis+MqLk1eorrMtQSdDpUOvIJw5g7DcmJxl2En5ruDrPcObflwuMysyXu
         Qts6O+ymPR7EhuiZfOIVRiEkPmbeNHvKcwbIjGwKlR83haWV3WVEOztUEg5v8wubDZBu
         wR+HN9AbYpFMuxp5bp+OZEtj0Q6d+NHzugwZJXH6JGt2JyYo1iGyYhQvxE9GTZFS5F/v
         EdzRtlSACXVfUG7br/G0GttlMIEskPcqgMskoU7aqHGtiM5bl21/5/tNx/+/Rh8MvGRl
         MeWSyrz/5yqaF9esyzBL/kU3TLpIy87OX33HAtY5/JLqe1Z0/kKys02HgK9TT8trVNiA
         eUkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097831; x=1795702631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        b=gYLCrU1b14FtyWF9J9rRGDjfdc0Otf4TgsztKEFyUN8vJ9fEW00iNlVqaoT2i619GN
         PxW3UzyGLeWoFiRpiteOsZMxbyCOnwB0I4Vz7wka/NNZaRvwxaLO+iTNj7edK7aSpb2E
         6dlsAyjI70MyFpVX27aztVirR/jyfNLlLk0ArU3X1/lW/5ew9DP4mA3FM2CFLrkx5a8B
         Q7S3hXRSwI+Kfx8e2500V5OyhAsVHtbBuYy2Lmdx6wFHL1iEJgod36lZbX66g9lksG4J
         PlM0PO+aDLTSGc+5+rIr20nfPTNKiUbTBRQwHd+HMGzbCyYY9lMv1PoV78+PQOtZFcf6
         kgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097831; x=1795702631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Sn/6cW9iuG1tj9bDWj2gzrauRJ8z3JBJoW668E6FQ=;
        b=nToLPEfsSgxP/MZ1cbITXyv7loD3c4YS9I9xrvQTU+FsFLeOeJOevTRHiuuLDcnCWO
         jdHx6VXSiIpBRz1ro4yYY4fkoLz/5SSwG1d+XN0pB2NL2YFKK6VDGCXgTqxMieXVP1SC
         4QuGO/bKFU4yMb4TAovzZmxCk7IrBOC1/3RSijQjKp7ns5WYHgeeRUKQXuBP8ezUakoz
         Qf0rIKtwrFDZ8/udFm/neHKAPp5/v4bng3u0KnOlxCNs1bzRhS5eq5xhxljXcC3ZPgQS
         kI0sBjNRwF1L5VqnQajyv4SXqoNBfbKQbeRMx9wkWCfGKW94EU2f3xPscLCcHl0yJjBQ
         4ebA==
X-Forwarded-Encrypted: i=1; AL+hErGdAqS8vTkWxoD5oJQ01uaTfOp2zB1TmzQNWpt3WC9X1lAsxoiLDXfTUAlhK3GqNiiNrQmpKvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8asrX2rdGB2r1OHgtVjfCSvtqOPIqLYB0Plkx0bfQJ9VOlYBIz
	ECx/GYCvJm6/+V+i+H2xC6Nc8Gt0Kl1XnJY4HXUwN9ltv9pgIpzhlB0bz3sQy93XZ60uzHuy4La
	qvpimj0u38lDa5ds97ZVxojGitqFjWC4=
X-Gm-Gg: AYBFou265ehBvCagsIBqpBAT84HX8Qna/5hlxChw57uONaKZ9N0aIxgVVY/blNxPpic
	hLXf31qADXNmkeNoTGwJRY0aTWpBjzyplUMFlLQb5F3L5y04iXG0q17vNiJHusAeokL7k89DHRE
	HUMi1gKz9V+Vy/b8IX1quMOoMPG2Lox016TkyYh0xogO19DdjunuWBw3K5z7FQ3B5aDcuz3eS5m
	+fleWchFrZ7vYvdskM0CmhTUstk8VAT7aUz7Smjmi6KUu8XOeLrjZIxiGPFDx+Ga+WFweYpLHjz
	ZSk3Jl9bE4hwVRhdVXT8p8/msIDztqykX4kO9INIk8Ato9fjTzUgwdLJQydX2TYq5jijT6591Uq
	XzsnL3rStCjNU6fmZfVvYzYQsnVqZtWg0Hw9gwmM=
X-Received: by 2002:a2e:ac01:0:b0:3ac:dc69:e62a with SMTP id
 38308e7fff4ca-3ae7f8d3febmr335241fa.2.1795097830717; Thu, 19 Nov 2026
 06:17:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118120102.3717000-1-graypanda.inzag@gmail.com> <willemdebruijn.kernel.37588f5cf382f@gmail.com>
In-Reply-To: <willemdebruijn.kernel.37588f5cf382f@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Thu, 19 Nov 2026 23:16:58 +0900
X-Gm-Features: AclHuK_LIRKFgU_S2fFfC6XZS0j4HJsS0X8_nxwW8loTln1Qz37v8K9q7GCKYcQ
Message-ID: <CAO7ntTQpeuWE4t-e_3d_aFzug=KiUd7dZjXpZgO-Fm=8iY8=jw@mail.gmail.com>
Subject: Re: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload length
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Commit 2506251e81d1 ("tun: Decouple vnet handling", v6.15) introduced
> the premature check, replacing if (hdr_len > len) with if
> (hdr_len > iov_iter_count(from)) and crucially before
> iov_iter_advance(from, sz - sizeof(*hdr))
>
> Commit 6a53fc5a8770 ("tap: Use tun's vnet-related code", v6.15) then
> brought that bug into drivers/net/tap.c

Thanks for the review and tracking down those commits.

Mixing the two examples in my v2 commit message made the timeline
confusing:

- The second case (sz=3D512, hdr_len=3D256 bypassing __tun_vnet_hdr_get())
  is indeed the v6.15 regression from 2506251e81d1 and 6a53fc5a8770.

- The first case (246-byte padded vnet_hdr + 14-byte frame with
  hdr_len=3D0) predates v6.15. Because vhost-net checks the 260-byte
  total descriptor length against VHOST_GOODCOPY_LEN (256) before the
  vnet_hdr is stripped, this short frame still enters the zero-copy
  path. With len=3D14 after subtracting vnet_hdr_sz, hdr_len=3D0 passed
  the old "hdr_len > len" check, and GOODCOPY_LEN (128) was chosen as
  copylen. Keeping Fixes: 97bc3633bec7 on tap (and 0690899b4d45 on
  tun, which has the same unbounded GOODCOPY_LEN issue) ensures
  pre-v6.15 stable trees pick up the fix as well.

> We still should also include this fix (or skip zero-copy when
> copylen >=3D len)

I checked both options. Clamping copylen keeps skb_zcopy_init() intact
even with zero frags and completes cleanly via skb_zcopy_clear(),
whereas falling back to zerocopy =3D false invokes
uarg->callback(NULL, uarg, false) and increments vhost's tx_zcopy_err
counter on valid short frames. So keeping the copylen clamp in both
tap and tun looks cleaner.

> So there is more work to protect all paths. This on its own fixes
> one issue. It should probably be respun to fix the Fixes tag. Let
> me know if you want to take on the other work and send a series.
> This can certainly also stand on its own.

I will take on the full work and send out a v3 series shortly, split
by Fixes target:

  1/4 net: tun_vnet: validate hdr_len after skipping header padding
  2/4 tap: clamp zero-copy copylen to remaining payload length
  3/4 tun: clamp zero-copy copylen to remaining payload length
  4/4 selftests: net: check padded vnet hdr_len in tun and tap

Thanks,
Junyoung

On Thu, Nov 19, 2026 at 1:37=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Junyoung Jang wrote:
> > tap_get_user() derives the linear copy length for zero-copy TX from
> > hdr_len or GOODCOPY_LEN without bounding it to the payload remaining
> > after the virtio header. tap_alloc_skb() exposes that length in the skb=
,
> > but zerocopy_sg_from_iter() copies only the available payload bytes.
> > The unfilled tail is transmitted on the underlying link and can expose
> > stale kernel heap contents.
> >
> > For example, a 246-byte padded virtio header and a 14-byte Ethernet
> > frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128=
.
> > With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
> > passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
> > padding. That makes copylen 256 for the same 14-byte frame.
> > Larger padded headers can raise copylen as far as good_linear.
> >
> > Clamp copylen to the remaining payload length before allocating the
> > skb. The minimum Ethernet frame size has already been checked.
> >
> > Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
>
> Thanks for the fix.
>
> This appears to apply to both tun and tap. But to have been introduced
> later
>
> Both macvtap/tap and tun originally subtraced len -=3D vnet_hdr_sz first,
> and rejected hdr_len > len with -EINVAL. We should reinstate that for
> both.
>
> Commit 2506251e81d1 ("tun: Decouple vnet handling", v6.15) introduced
> the premature check, replacing if (hdr_len > len) with if
> (hdr_len > iov_iter_count(from)) and crucially before
> iov_iter_advance(from, sz - sizeof(*hdr))
>
> Commit 6a53fc5a8770 ("tap: Use tun's vnet-related code", v6.15) then
> brought that bug into drivers/net/tap.c
>
> We still should also include this fix (or skip zero-copy when
> copylen >=3D len)
>
> So there is more work to protect all paths. This on its own fixes
> one issue. It should probably be respun to fix the Fixes tag. Let
> me know if you want to take on the other work and send a series.
> This can certainly also stand on its own.
>
> Side-note: it is also somewhat surprising that we have allowed such
> massively padded vnet_hdrs all this time. But that is perhaps too late
> too fix. Certainly for net and stable.
>
> > Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> > ---
> > Changes in v2:
> > - Replace the Fixes placeholder and add the co-developer trailers.
> > - Document and reproduce the guest hdr_len > GOODCOPY_LEN path.
> > - Shorten the code comment and keep the C reproducer separate.
> > - Link to v1: https://lore.kernel.org/netdev/20261113164903.785381-1-gr=
aypanda.inzag@gmail.com/
> >
> > Tested on Linux 7.4.0-rc2 (067c5c24cef2) in x86-64 QEMU/KVM with
> > two vCPUs, CONFIG_MACVTAP=3Dy, CONFIG_VHOST_NET=3Dy, and CONFIG_VETH=3D=
y.
> > The guest used vhost_net.experimental_zcopytx=3D1 and init_on_alloc=3D0=
.
> > Each case ran in a fresh VM with TUNSETVNETLE enabled.
> >
> > Before this patch, with a 14-byte Ethernet payload:
> >
> >   [POC] case=3DA
> >   [POC] case_a_hdr0 received_len=3D128 expected_user_frame=3D14
> >   [POC] case_a_hdr0 tail_bytes=3D114 tail_nonzero=3D98
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D128 control=3D14
> >   POC_EXIT=3D0
> >
> >   [POC] case=3DB
> >   [POC] case_b_hdr256 received_len=3D256 expected_user_frame=3D14
> >   [POC] case_b_hdr256 tail_bytes=3D242 tail_nonzero=3D82
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D256 control=3D14
> >   POC_EXIT=3D0
> >
> > With this patch applied, using the same inputs:
> >
> >   [POC] case=3DA
> >   [POC] case_a_hdr0 received_len=3D14 expected_user_frame=3D14
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D14 control=3D14
> >   POC_EXIT=3D0
> >
> >   [POC] case=3DB
> >   [POC] case_b_hdr256 received_len=3D14 expected_user_frame=3D14
> >   [POC] control received_len=3D14 expected_user_frame=3D14
> >   [POC] used_idx=3D2 trigger=3D14 control=3D14
> >   POC_EXIT=3D0
> >
> > Disclosure: An in-house LLM-based analysis tool developed by the author=
s
> > assisted in surfacing this bug candidate and drafting the initial notes=
.
> > All root-cause analysis, patch code, and QEMU/KVM reproducer results
> > were manually reviewed and independently verified by the authors.
> >
> >  drivers/net/tap.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> > index 2f19fb07bb2d..f25c58d6e986 100644
> > --- a/drivers/net/tap.c
> > +++ b/drivers/net/tap.c
> > @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, vo=
id *msg_control,
> >               struct iov_iter i;
> >
> >               copylen =3D clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good=
_linear);
> > +             /* The remaining payload may be shorter than copylen. */
> > +             copylen =3D min_t(unsigned long, copylen, len);
> >               linear =3D copylen;
> >               i =3D *from;
> >               iov_iter_advance(&i, copylen);
> >
> > base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
>
>
