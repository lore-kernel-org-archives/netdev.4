Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436846;
	b=y+LVS3+uGMycV2tK8ucft6SievYjFKP7w8BVqmqiRP8ADq/TbYBHZ/MvvAFWgDgR34Se
	 RCE+xgQV46U3IajWfDG/tMcJZKJpEUHCmFkQX+0UocV3183HoTZYQdCf1K/3XtXkn4DIy
	 ZbHreq9w+Z8q/eBnvIC4jGq3Tgf09hPSdaw+WyN+6roEDoalM0Bj8DZiGc0OqyjwQ39Kb
	 h7TcAYu8iCg4OO3D/R7rMhmc/FGcCDTC2nfEqsZQklkSnyWOezrcE44JOOgBezlFe6+Vh
	 0Z7GKBwuUD6KtRTHDh2LVYkf2pAaX5APnr6Nr93yeW1USZFZ+T7uwRQqKVPJcTYFiRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436846;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
	b=2e1fbDkBJ+N8oOdwpRnE8z68CQ0HQClbN/QgEmAWBQbLk9HhfNhSti4frPwE20no/blK
	 njFs3IZUkQTmB2sksBqv2aJyCD0zNqrGSQl/KUYfOLNwDWInOGsSNG/Tnf1LLcQCOAWJj
	 MywXBs/HrxyPSVEkQ7u0Tssk6nTQRezoo936nyUilAGpCpgq2av04HqQdlV6j3ki3lnTz
	 U8BJ8BtoqaaG1L8OQ24EiPRETkcKk3VVM6h5e6Sq/k1s/vZDRGsfChzghUcAjxRH+1o/5
	 kjN8cbDiHduSXwyYHk1ce4bgsfbsVTKfcnhJYOpqR3g7kcdg9qXxZCIqS/gmWXNvlTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=austTnm7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=r6w62NAl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1824606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1824606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=austTnm7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=r6w62NAl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795436844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
	b=austTnm7GrXvKGBWWbH7EvCQRT/3bOSu4hhfoJ8Pnc9yCya1+YU0j6JMjuXyAder4h2uOh
	szhZaW/9DV8y1eI0olivAEHPnDLG/tWAgMr297bwBRx1kGOtt5MPFKxZ6wxPF6wjnKPm3W
	8v4G2N2GgOXhQ5LVO0ChNlIe4AvLjuI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-gsmtfFlIM5-0-VhXtozDIg-1; Mon, 23 Nov 2026 12:27:22 +0000
X-MC-Unique: gsmtfFlIM5-0-VhXtozDIg-1
X-Mimecast-MFC-AGG-ID: gsmtfFlIM5-0-VhXtozDIg_1795436842
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4ca583164so42647487b3.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436842; cv=none;
        d=google.com; s=arc-20260327;
        b=q/Mm6if1XxaLaC1tLCjqx4olxIWv3U9RQT03voiusffTiGuAI7Y1dB2XTb6DNgoaDr
         PHCXIyU9MloIc7k50LkFk1pzXwvwu3VoOe0fVy8acJnknpN+bwOMnmAbTnuXzkzEoDRY
         d61MDSVBXCmh0lAAW7kIU5cGTLhHnum0/kUo0PJWRp5JMxawr1nXhjUcoiH2X8YP0kIe
         OdDp90ABbYEoI5y5l/LaJZ5gIOMpwA8E9faVcAgqZAstMH7SXaCBPkKy7pNOU/xyaUzk
         lWqSRBXFoWLdkGE9y3kBCDkgvWP22yBrKWfcPSmgpFQEJ1t5RNI+yq6sB3454XTHrfR2
         ArRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        fh=5LT53ZO0wSVZiMfSCnV7LMJKVSLPIe6oTt1kPayu+cI=;
        b=MxtY4px66w3yMAbBdOYmh93kE/5OSGwN7KEMJK1NaNarp6ojPZMs6lPqMXu3eRjN2z
         5vKpbtEjNP9LahcFCZP5TjDDBqs4uL6Lw15egZKq24rDkIOe50nl+sPC+VIYNHxnpLcp
         mMc7XBqo0HPh+EG0NxHt9sgVJUwy+VbChZGDppyXzz5cJkESwlRbER/o87Km8SaTP450
         XJr8s58FNCKDT2XNPt6754e9MFxmCHwqVcbBurP+Np5LW4FV6dPzYE7tdf/ZtuT2Uqoe
         mnm86M5H2A1PJxS9TzYZVr1t19D9PlFUA1bM6RiSb4DwNAag30D1uvjCmW3DySCftyyN
         vQIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795436842; x=1796041642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        b=r6w62NAl3QizXChqrT6VrkZuctSZXJf7Z8pFsIjugwtc+ZXOirD6gqfjliR6j/TN8F
         OB8TTkAd2Xo2fshfeRfM2I2Cju3ML9LHMioQEXEO2Tgy1Dr8Ut/cseYXH3aDivUL8isY
         /IIHZuBmw/xcV6WpbDE74pix/KgvaKqLL3xH165G2XdOW0ZGDP01xdrYNEpgjyEwBnxK
         7HOEww1DJDeXUZF1mSV+JbUhB3+k//oOzfMsWvUK7DNdBzt6pNX2RiwNnKPIyFNpgQ0t
         2Ev2eUiSyBGTm6YbsHqtYi6JzE9CgHqTuwZNN2ToCmTeEjceuIvAZTNG3n/lLQB0yzSv
         Psvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436842; x=1796041642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YImJ/ALCtekb57+DaL5zQvBLKaVvYqpkrQRdHCmg3Uk=;
        b=g0c8Wk8Wso1dzhuMHm9lIKZ/ZRo4M8mrogp9vjkCr5kADYqL68I+7vulPi5rFun4Ns
         M2YRbW9eLJosWAGT9pfgjZ4b16w0Hk9MYtmzfJ7rP7wOWyaIHzipdjgz/gFSw214O00v
         c3V+gxa1O0pcSlM/V3UAoOaS3PR71QkoMiEfAqOO6qqgQOvO0BATesbzzRP/PZTk5BUl
         O/Uq4rQS38Qkqqr+4oZgEZNfZp0AsQ6mQrZyxMiHPMv5Vkpk7doK6F76idG/I0dNFzGY
         HCcLY6xirJT2RXPld2e1Q0zG1gZ2pqKUvmrZiqm2pmXnKFEhXqFbjXUcUbbV6G3zzdB+
         JlEg==
X-Forwarded-Encrypted: i=1; AL+hErGfaapAGEOycMa2XQ83Y77VBh1U/Qm5HmcOCA7a5amqrtV+A7wRzM/B6TweHB+6XiN0QaKjWXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o1oJR/hQlRgHTvF4AunXd7wnw18s9AUSO6WhNXH9VddXrZOoV
	XL8WxX9AiA62cmzC08zEMwbQk0k9GgYe4dAh+yV/wokVxXzWoqJMRqYAwTL6FbtltMomgwoOMF1
	jauplRpB6a3srkwOmpysWxZZc/GpBKpkB7l/9FV/inGLRf1S15usbW4pIbhVQz1AmujqbZEBjfS
	ChPgdwRR8bUPLDHdEczu4doQUWmgtpe0XM
X-Gm-Gg: AZFdTZdtHjm/2xBf9x8KUUuAlq4LKzNJXY9nAF2x3eo5uuhcOGYHJLsbp7eUYYcjh8x
	eCGH0gqo6LwSNIC5dsT01RzEAmk+9k0+FT3EPrvb+zX/ko3Jggfcb0iA27wmmPZypFIC/EFktdj
	Hi5+3TIOsmZr/4YbRXJnCVLJ5Wy1weYQNfDvC4HZoVSdFX5tPXYPfr0BAQbSTyY50Cfu346fA2q
	1JfEavFqBZe0fv8H6Oi6Ghs8F4L4yUJC3/Z3yeykJHL4jOOkchGyXoGv30=
X-Received: by 2002:a05:690e:11c5:b0:67d:a3c2:c95 with SMTP id 956f58d0204a3-67dec2bd130mr4963377d50.3.1795436841801;
        Mon, 23 Nov 2026 04:27:21 -0800 (PST)
X-Received: by 2002:a05:690e:11c5:b0:67d:a3c2:c95 with SMTP id
 956f58d0204a3-67dec2bd130mr4963360d50.3.1795436840812; Mon, 23 Nov 2026
 04:27:20 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-v1-1-fc1253d60351@pm.me>
In-Reply-To: <20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-v1-1-fc1253d60351@pm.me>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Nov 2026 13:26:44 +0100
X-Gm-Features: Aa3M54pt5PWY45sVKrMEfHYWn7Rl4h8pw_TEQAIUnc03qW3ChT2fpOFP_O-rkHg
Message-ID: <CAJaqyWdOF3LVF+WHaGw8gimULaCunRkuLnKAhciB7HWpYhnm9w@mail.gmail.com>
Subject: Re: [PATCH] vhost: mask the in-order used-ring log cursor
To: fadouse@pm.me
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Linfeng Sun <linfeng.sun.dev@gmail.com>, Fang Xieyan <fangxy@xiaopeng.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:20=E2=80=AFPM YanXin Li via B4 Relay
<devnull+fadouse.pm.me@kernel.org> wrote:
>
> From: YanXin Li <fadouse@pm.me>
>
> vhost_add_used_n_in_order() plays the batch of used-ring writes back a
> second time for dirty logging.  Commit e244725e86be ("vhost: fix used
> ring index wrap in vhost_add_used_n_in_order") masked the index in the
> descriptor-publishing loop.  The dirty-logging loop introduced by
> bfcde6b64769 still uses the single-subtraction form
>
>     next =3D start + nheads[i];
>     if (next >=3D vq->num)
>         next -=3D vq->num;
>
> If the guest refills the available ring while get_rx_bufs() collects
> one mergeable-RX packet, that packet can consume more heads than
> vq->num.

Although I'm ok with the proposed patch as hardening or optimization,
this sounds more like a bug in get_rx_bufs. Where are the memory
addresses for these pieces stored if there are no more buffers in the
virtqueue? Or is it able to loop through the vq?

> get_rx_bufs() permits up to UIO_MAXIOV =3D 1024 descriptor
> chains in one call, so a single subtraction is not enough.  For
> vq->num =3D 32, last_used_idx =3D 0 and nheads[0] =3D 64, next becomes
> 64 - 32 =3D 32, which is still equal to vq->num and out of bounds.  The
> next iteration then logs
>
>     used =3D vq->used->ring + 32;
>     log_used(vq, 4 + 32 * 8, 8);
>
> which starts past the end of the 260-byte ring body (4 + 32 * 8).
> For a used ring placed inside page 7 at guest address 0x7ef8 (so the
> entire 262-byte ring occupies [0x7ef8, 0x7ffe) and
> vq_log_used_access_ok() validates only log_base[0]), log_used()
> marks [0x7ffc, 0x8004) as dirty.  log_write() then sets a bit in
> log_base[1] for page 8, past the single validated byte.  On a
> vhost-net RX queue configured with VIRTIO_F_IN_ORDER,
> VIRTIO_NET_F_MRG_RXBUF,
> VHOST_F_LOG_ALL, VHOST_VRING_F_LOG, vq->num =3D 32, and
> log_guest_addr =3D 0x7ef8, delivering one 8 KiB frame consuming 64
> mergeable buffers followed by one 1-buffer frame in the same
> count =3D 2 flush writes
>
>     log_base[1] =3D 0x01
>
> where log_base[0] =3D 0x80 is the only byte the kernel was entitled to
> touch.  A guest attached to a vhost-net backend with dirty-page
> logging enabled (for example during live migration) and a small RX
> ring can therefore corrupt dirty-log bitmap memory that the VMM owns
> outside the region registered for this ring.
>
> Wrap the logging loop index the same way the first loop does:
>
>     next =3D (start + nheads[i]) & (vq->num - 1);
>
> vhost_vring_set_num() already enforces that vq->num is a nonzero
> power of two, so this is well defined for every accepted ring size.
> The coalescing invariant is preserved: if a run is not flushed,
> next =3D=3D start + 1.  When start =3D=3D vq->num - 1, start + 1 =3D=3D v=
q->num,
> whereas the masked next is always less than vq->num.  The run is
> therefore flushed before the cursor wraps.
> With this change the same vhost-net configuration publishes
> used->idx =3D 65 and confines the dirty log to log_base[0] =3D 0x80,
> leaving log_base[1] =3D 0x00.  The mask keeps next in [0, vq->num) for
> every accepted power-of-two ring size.  As a bounded cross-check of
> the index arithmetic, a Z3 model over ring sizes {1, 2, 4, 8, 16, 32}
> and buffer counts in [1, 64] finds an out-of-range result for the old
> subtraction (vq->num =3D 16, start =3D 15, nheads =3D 17) and none for th=
e
> mask within those bounds.
>
> Runtime verification and fix validation were performed in an x86-64
> QEMU/KVM guest running mainline after v7.4-rc3, with Generic KASAN,
> UBSAN, lockdep, and DEBUG_OBJECTS.
>

Can you post the reproducer? Even better if it is integrated in
tools/virtio/vhost_net_test.c.

Thanks!

> Fixes: bfcde6b64769 ("vhost: fix dirty logging for in-order used ring ent=
ries")
> Cc: stable@vger.kernel.org
> Signed-off-by: YanXin Li <fadouse@pm.me>
> ---
>  drivers/vhost/vhost.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index dc973287567..80b887e1511 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -3206,9 +3206,7 @@ static int vhost_add_used_n_in_order(struct vhost_v=
irtqueue *vq,
>                                 log_start =3D start;
>                         log_count++;
>
> -                       next =3D start + nheads[i];
> -                       if (next >=3D vq->num)
> -                               next -=3D vq->num;
> +                       next =3D (start + nheads[i]) & (vq->num - 1);
>                         if (i + 1 =3D=3D count || next !=3D start + 1) {
>                                 used =3D vq->used->ring + log_start;
>                                 log_used(vq,
>
> ---
> base-commit: c44104f3642da720164042623e4832836aefdd8e
> change-id: 20261122-b4-06-vhost-in-order-log-oob-v1-35efdba8fbab-43734ad1=
0f0a
>
> Best regards,
> --
> YanXin Li <fadouse@pm.me>
>
>
>

