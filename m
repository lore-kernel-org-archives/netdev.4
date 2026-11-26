Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718941;
	b=El4Sqzb4493P1qKCL2c1P5kxuMIWnhYJnTYKiCdY35w1wJBxAzVlHZ83+fmHL64l0RQa
	 tPji0kyjFdT6xPb5Mo2xPsGGlJwe6U0tA4cLmtQp6/ZQxd8L/o4A0FXg+L/lr9lWk4Dxj
	 27KpIHPh21kldBw9LgYC1g7ISI7N6MWWDG4S0gvpykuXfyKI1VMy/QQSrIQbi40eNJCUb
	 jz3y/ARBfJmjrGaaSXUjDCA3ZU9mAYGZpjWKnbumTtWLi9zqKylSPrd+88JKlbk/2HJy0
	 n//E8IKxrkJHrooXorzoVdqY4A5/mA/R7O2zGFM8aWzV02GWdW+3z7aCgP23R5XbI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fBtb0BMz5hkNQGeq8zzQt7EyteYPxkW8SwexoB3Gq1M=;
	b=W9ntZpjfCd9vUK9UmmXPVEzZ2GU1fhT115FtnOAf2V3GjyUXhnCuyx/FPwhoo0EgBQKM
	 ZPlv79z5V7lvNL98S4EAs9only3qcsHPecI+09Z9aeQUQBNplajDDX0Tr/6X0XR57uFjD
	 84BkiiIs0yHsUCkfRzOD1m87NtnMFTfMUifRF/Ase3gB3Zcjld8MPULhbBeq/4T1mFoZ6
	 srWJx834KZ+XErEGqBc3IfQe0c8u+XBMvHrK4S9z4vfrsoquB/iXtNXOR7qEOYshOXSNA
	 z6VYS/SpXbSvPhB2t87r4hSSTjBt0KIWAz1QkKMCgQs9+MGAnNrk+f0eOJWXoWoKtEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bhqpbwgU;
	arc=none smtp.remote-ip=209.85.219.70
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3F606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bhqpbwgU
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9213730b07eso118416006d6.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795718940; x=1796323740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBtb0BMz5hkNQGeq8zzQt7EyteYPxkW8SwexoB3Gq1M=;
        b=bhqpbwgUDX6KpywFECdFKx+yR6Vmxexr77cWP7CfQ5RrH7RlteE5HSiWONA+v1gFDG
         lx2uRNLgEy/P0pEGf9XCQO2Q3Jm6ysDvrB9BJRPT1DHC4qImbkCSo2Bzl7UQ9bjiijHv
         I1I8arFPDQVPqz4QkStm1Faw4/Uhr7cyBTdnA3Ap72OZAUOOixub0LWeQGcR6FXCt5Zq
         xTra2RXtW3u+N+3f/UFzlyUqX27/9L6ibodGkodwU5mQsym30uyP3DnZHYD0mZdrSLGr
         zG1RjB0kvOOjMC8cpiZBfjZT4GurB8jE330ChQ6qlIt5EY98MNd/ApmiP33G3Hg9e9N0
         fMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718940; x=1796323740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBtb0BMz5hkNQGeq8zzQt7EyteYPxkW8SwexoB3Gq1M=;
        b=mSI4JCiOEWVr4D0lY2MHQanYm3CWaNnTwEfi3jKd8N8HKwYpl/MbjWP+msf6KxBqCo
         zmc2sZr0SgZNnL0UqVGT1qhh5m1+Pt3Vxwc3O+pREhWVsqJ6qQ5eaSeHqYR8AmyVAZ5o
         jzgCkodbWccpuphMEkQuMa04xM8ATODumGKQ7i9FpAZt4fobq4Df4XJ7YcUOXUtvVHYM
         Dx2F4AOi452kqsudVzeq8sw+t8oRYrqZK06ShFt+ilwGnZ0lDDjf/aeH1q8S1Of0cfIE
         YwVCh3oPDnYlWHMmJpWh745thLP+hpWqdeNFpVQnG8czjCnHPPHdPBpmNV/weAmMSZFw
         BcaA==
X-Forwarded-Encrypted: i=1; AL+hErGN1j77BNLVcHGI5k398W0KZdVeiJGY6H/UA3EpiAvT2UZM+4QyrGKW9WtW1ujkhUwzhJZGHrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LuBPEl4uBqrhbUplrgy2h/6ltA19Tu1W3iIRrdt1N8XwG1O8W
	LiA9YJTbAg00B9GoCbnZxy5UBTC837I4UGzr3ypxFGvZe+mlorHlFfSkldwuRVcgfnB3hNJrm8S
	VLL5r1irDlA==
X-Received: from qvbw16.prod.google.com ([2002:a05:6214:6350:b0:921:8507:17fc])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:4902:b0:921:4095:deae
 with SMTP id 6a1803df08f44-9214095e374mr373511836d6.42.1795718939796; Thu, 26
 Nov 2026 10:48:59 -0800 (PST)
Date: Thu, 26 Nov 2026 13:48:59 -0500
In-Reply-To: <20261124235959.1141963-3-antonio@mandelbit.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124235959.1141963-1-antonio@mandelbit.com> <20261124235959.1141963-3-antonio@mandelbit.com>
Message-ID: <willemb.880316e8f949@google.com>
Subject: Re: [PATCH net-next v2 2/2] tun: skip the virtio-net header parsing
 without IFF_VNET_HDR
From: willemb@google.com
To: Antonio Quartulli <antonio@mandelbit.com>, willemdebruijn.kernel@gmail.com, 
	jasowangio@gmail.com
Cc: Antonio Quartulli <antonio@mandelbit.com>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	sdf@fomichev.me, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Antonio Quartulli wrote:
> Without IFF_VNET_HDR, tun_get_user() still passes an all-zero header to
> tun_vnet_hdr_tnl_to_skb(), which then only resets the MAC header. The
> parser is not inlined, so that costs two nested calls per packet. Reset
> the MAC header directly, as tap_get_user() already does.

> 2.0% fewer instructions per 1400-byte UDP packet written and dropped at
> the raw table, 1.2% fewer when forwarded (qemu -icount, x86_64).

> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> ---
>   drivers/net/tun.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)

> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index 408bb0b40348..79aaadd9a2aa 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -1951,11 +1951,18 @@ static ssize_t tun_get_user(struct tun_struct  
> *tun, struct tun_file *tfile,
>   		break;
>   	}

> -	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr,
> -				    (tun->flags & TUN_TYPE_MASK) == IFF_TAP)) {
> -		atomic_long_inc(&tun->rx_frame_errors);
> -		err = -EINVAL;
> -		goto free_skb;
> +	if (tun->flags & IFF_VNET_HDR) {


     Checking tun->flags & IFF_VNET_HDR a second time here is not tied to the
     earlier check at line 1832 and introduces a narrow TOCTOU race with
     tun_set_iff()

     snapshot `unsigned int flags = READ_ONCE(tun->flags);` once at the  
start of tun_get_user()

> +		bool has_eth = (tun->flags & TUN_TYPE_MASK) == IFF_TAP;
> +
> +		if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr,
> +					    has_eth)) {
> +			atomic_long_inc(&tun->rx_frame_errors);
> +			err = -EINVAL;
> +			goto free_skb;
> +		}
> +	} else {
> +		/* a zero hdr would only reset the MAC header */
> +		skb_reset_mac_header(skb);
>   	}

>   	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP)
> --
> 2.56.1



