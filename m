Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083400;
	b=GtrWkDkfgikzQTblffIMUMMtmOrqIO0K98GXNa89bIu9s2t0oCz/bXF7PHPkUlCntMTX
	 kLQ+sYWtppQ67XTCY3AUPL5xNSg5nfb8KfoOKPsQaaHU/RPzw4t3QP7+j3xYK2GHVaPZq
	 +VNrPGkpkbDHKQkkbaT5lFoDuDAbb93vNTHc4pJA8ST1iLVCrR+X8qdOCqLvfh0tEe1hT
	 nCwYsB2BoELKQb9aJFqTcgcsUKJRkIoPY50qEFhfXIyBMEhgXxM1WzrzAuFZDo2ySzc5M
	 PaWWridWerN6sUT7jJzv5crBIrT5DTHiyn+OK3qGl6oaLy1dygSeP6mHqvCqj1khlUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083400;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:X-Clacks-Overhead:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ou+Gp5BS/8angTvg2T4BgOhVLXLf9DNpXxP+o9wGoRE=;
	b=CLN3o5BVSgxxxvEHH9mVdVzHSUkT0waz2gc6OWPPMwYJlz6fnv93Howdhc+unT6fZBNh
	 VIWf1HvcYhYdcRT1B8A4yRBkaLCNQljGCF7qJX70uQOcaPzxwcs/Uyzbm//So+PFBpEEK
	 R2m/qIcSlG+0XgNL2Bgr6lT80xRujeV63S/q6haIvPFslcgZeo/02CeaUC4lqJ1Nu/IJA
	 nJDraVBCXnRCEMeRdMmncyEQ9XoiKw6nhNDRNBwr0HTqbtOmqoxd3mDcqLtoKfn9jsSLd
	 dSnrxFGj8t7Oy+4jRU8jF1lLtT0MEu0ZR3k1W9hBRKqD2P51OsS68/D5UaFN0Q5W4qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxF9S5XO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vm3dJCmn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E14606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxF9S5XO;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vm3dJCmn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795083398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou+Gp5BS/8angTvg2T4BgOhVLXLf9DNpXxP+o9wGoRE=;
	b=AxF9S5XOC8KeyGUgnXA+due5LbqX2oEtMzNWQTua7q3oUop2N7RgDVCxxySYtSk3Oulpbq
	z6yTKnrWtx9CCgTZjAGS+ykHD2mnokzaex23BJ1xqiIFPvcQXR7F8NTDVIPo90QRjL/4+f
	mQyP/8C2NMaK2MZwjtFhA16v37gDFRo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-pfuQimNtOeu1ea6jROxwFw-1; Thu, 19 Nov 2026 05:16:36 -0500
X-MC-Unique: pfuQimNtOeu1ea6jROxwFw-1
X-Mimecast-MFC-AGG-ID: pfuQimNtOeu1ea6jROxwFw_1795083396
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b35b88aa94so27221387b3.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795083396; cv=none;
        d=google.com; s=arc-20260327;
        b=HMdcdG25PCbJF90jkD5U08L+7n3/w+gYczJaIeu++LnPTDc1ZimfmIVsrufQ7NEMl7
         jX3VQNSJhAGivOH8mlRGDOQ3+OMEQLTt44x/eEprNuiU03vXAqpMek99bNOkUoHe1Iio
         IHzAdgYTWb16ET7ubPifLSVxskQ+4wKb3kjIlMvTe6AZKI+IYvuC2OKke397qF+UGFLD
         LI/EwtgemRnlo+UbwoUMsuZ0fy/WNm6nHsI1w2QNKGNnIDSH/hyUTD8S6a8qSgS+L4BB
         0uDxm1/ei972AIniUkrdXk2QVzZTD5UQ+p/5lzTUlnnDmx728I6wIIRIc0rZeJnsly5o
         3T4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Ou+Gp5BS/8angTvg2T4BgOhVLXLf9DNpXxP+o9wGoRE=;
        fh=pgm/8VX4mWz3sjzQHNfwh4yHQrA0/Eyw5VcZNgRw6cU=;
        b=abjjTR/aF7LkCh3JMoZQscUiHQAQrNq1LZSw+0kf675jUAVjq4C871oMdhbBrQW8Np
         bbLxiuYNjyd8xg8p2X2mi1KuQT2t9CwnaSkdrj7mV58OESSO/DDsq2A9g8S3MJ3MJCqL
         yozLxX7wHBMBvOiKuQjit+FdfYs4qL11EfrejmjSymYNMB+fAA2HX4U7NpywTQZARnMT
         Z5sKo1kdl6U94uf/VkzW0ImqdkRew95JD0JBgQ9+iB7DqzAtGOki5VhJ2CoBapAXFB0h
         KKyKQmBj3+ECc/m0DU73zJ45+wlRy5bZmo5jLE4tG0JcBG/a0QwbH4Fjowm4Q59ACuv/
         KABA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795083396; x=1795688196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ou+Gp5BS/8angTvg2T4BgOhVLXLf9DNpXxP+o9wGoRE=;
        b=Vm3dJCmnKpkOxUTj3aonMjwyR6OtBeiReU8TcBQqV6o+1hzHmTiRsb1Pdv68EZ79AA
         jra6TaSKr0g1TTcDDD78YiICYVZSlw8puEksAc77I2itoR/t0yyaRcpIOyMLsbrznu8t
         UJlJvcscJkeFdKDJ5qnL1kJDmcPPQLW8yBDrQs1GdYbQKfH+Vx0gapF8j0f67qs7Tynj
         88lSutCBwbr6Zq6EBxMXoeN6vc7LnwHp8oIQmoM7eSo4UBFs7G686U38YneH7FCsLaSe
         SmLCyVQqZ9E2CCMyjHMQjk68V8v6mZrKdChPJS+2NADX+M6dq+CptNzOEnp9Ws28nU2q
         gcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083396; x=1795688196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ou+Gp5BS/8angTvg2T4BgOhVLXLf9DNpXxP+o9wGoRE=;
        b=xdJ6f4AnNhVhnpsneKWzIlDkcYGpT8oV/UwbAcRafgq5SzLVc0NAIUNIW9WMJy8U67
         YcU53WpxGMmg0AO2m0hv0r4tck1AKG98ShFuhJ3H9bljdSTA3Z47RmLwXR0GunH1PSEv
         6t4ZCkhycE6amvT4eTot/UjCHzlBrVxXOuLZmupDM1aYrYEkH4clgF1bb2EINBy64yM3
         qZfdnxmxrngCwlZmz/oZixOLhtknqrCbZH/0mOM8CRZyir75T8RWKeuzfIva89710L9b
         AFLB0I5WiAuGZDw+FYIqe2ehUG6+Z8EAxtHq6lR7Q7VvmIyvAgqfXL88QJnveUeXdl5p
         WUvA==
X-Forwarded-Encrypted: i=1; AL+hErEW3UkEmfy/aGJAsl+kBX8SZgxWUk9Hj1HQPTKNB+g2jTVjwTspEtnsWsQ+C6N3ha3LfXGp/Ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tChDH/9Lu80ZzJrhThBMXwlbgQKIgmtLoJ/LnbxYa9EOLfoIq
	AusL5PsLKfSUu/pKspOc+h1COa0QqrqoIs/Utk69f8WFxH0GarW/ykcTOwDRenRQEtAD0LAbt1d
	mIwVyYOx4iHUiF1IbZ6ou1sVG3xrRedHxiYwFVFXWQwfxVVJcabEUd16JMWsYNZnuM/fbY211+p
	rInlcgINEFxvWQdE1aGVxa6F2eTWdm40RY
X-Gm-Gg: AZFdTZcFP69f7Val09ElLWdr+Rh+bRoqflPsEzHzMj8I21yYFUuykQbutMQeRKECM/6
	G/dQWHwXmkCzGmw1ADf5PxToP3I4wlJ2fTMfLRFibUCOI+t08D/+yLK/9W5UMBFZ4QEgj3On7el
	lSyHrgZEfM4SpeEJXalB24DPgs5HGbLJsFGRvqMeGbULm5l+a/fqA8+sC/no2F3CAZ/LXwgkapR
	diFK0KFWMmgUhWv
X-Received: by 2002:a05:690c:22c7:b0:8b2:ff9a:5862 with SMTP id 00721157ae682-8b4fecfac4emr18352677b3.35.1795083396058;
        Thu, 19 Nov 2026 02:16:36 -0800 (PST)
X-Received: by 2002:a05:690c:22c7:b0:8b2:ff9a:5862 with SMTP id
 00721157ae682-8b4fecfac4emr18352617b3.35.1795083395567; Thu, 19 Nov 2026
 02:16:35 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 02:16:34 -0800
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
In-Reply-To: <20261119001539.2868072-6-stephen@networkplumber.org>
References: <20261119001539.2868072-1-stephen@networkplumber.org> <20261119001539.2868072-6-stephen@networkplumber.org>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 02:16:34 -0800
X-Gm-Features: AclHuK-nkXDnRAMIfnK7ZdzrLQiNsi9yOUpklw_g8DNkjtZx1Arujrfghn4t1f8
Message-ID: <CAPB2EAo+pcVzGB2g5wEzSRJBzFQg+OAnRE8z-xWcDUEwzr9JCg@mail.gmail.com>
Subject: Re: [PATCH iproute2-next 5/5] lib/bpf: check for missing bpf fs mount point
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
Cc: dsahern@kernel.org, Hangbin Liu <haliu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stephen Hemminger <stephen@networkplumber.org> writes:

> bpf_get_work_dir() returns NULL when it cannot provide a usable
> work directory. It does so even after finding a valid bpffs mount,
> because bpf_gen_hierarchy() fails if the tc/ subdirectory cannot be
> created: running unprivileged against the default mode=3D700 mount,
> or as root against a read-only one.
>
> iproute2_get_root_path() passed that NULL straight to snprintf("%s"),
> which glibc renders as "(null)":
>
>   $ tc filter add dev lo parent ffff: bpf obj prog.o sec egress
>   mkdir /sys/fs/bpf/tc/ failed: Permission denied
>   Continuing without mounted eBPF fs. Too old kernel?
>   mkdir (null)/globals failed: No such file or directory
>   Unable to load program
>
> Check for NULL and report it instead. Also check the snprintf()
> return, since root_path is handed to libbpf as pin_root_path and a
> silently truncated pin root is worse than a hard failure.
>
> The "Continuing without mounted eBPF fs" warning in bpf_init_env()
> goes away with it. The legacy loader could carry on without bpffs,
> which is what that message described, but the only remaining caller
> needs the pin root and now fails, so the warning no longer matched
> what happens next. The "Too old kernel?" guess was misleading as
> well: the mount is usually present and simply not writable.
>
> Fixes: 6d61a2b55799 ("lib: add libbpf support")
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

