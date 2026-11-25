Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609368;
	b=K/5f9DVOiVCEftrdiTm8fUINzVlwUM190UYIDSTmzVX8yJaRDDttca+hRps2dp/QLKfZ
	 hSZJivEn2D0+wB2dU00Qh17AEWhmBb0+rHnO9Tx+7d470udBymX9AivoIWzGFgVL3vrE0
	 NBZ0hH+3tAyekh962hJ7cCj7qO9iB9cteEJ1dSOoDAnWBOBoQ0wWlBHh1t1iXKMvVNuKC
	 p4tXorsrlWdWEt4UHKBepNwAiOdyd+h3cUXXlXR4P07z/ljpJWh6qWFqVjwM77QvhU/DP
	 nGLU3l+jnlV7ec715IX2a3zs3exvlxrMEs+M4W2LMu9yNE1e54mKK6jVFygdUVSbTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609368;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CZV5eO5AZ12TcnUy3EmQ/L23MOch/Kx8q4CcdxzUn9c=;
	b=YzGbwngQ5aS/SuCUkzE4kMQXFPVfmbvxuAA8Pjlqm+T5MUvqdoMRJjy9dVtuiYaW1Nof
	 2DpAVMrW6QjuBlNnpjD/VK3Ushvm1tVyHM+rLpv0ojDgwzUWT7JrVzFbnvPmB46OWP4a9
	 RN4rGQY78+aaCJbqOhfjncw0ExrdQDJjaKM9SyhphkituPus84uFzBcB+C7bcnnigcY3N
	 UKKVnoYpgWyomop9It69xAoeQp0jYMeatE+otEB1Dzi6RngYyuALG9hjRJFafcGB5cemp
	 H5GeS7KGrpe3Yug5rTml0AmrEml7qvmEkzYpRbVl1cj2eAJKuYJA1+tCXPrtnFDELow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="PfLFY1/a";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hG0VIAY7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA32606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfLFY1/a;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hG0VIAY7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795609366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZV5eO5AZ12TcnUy3EmQ/L23MOch/Kx8q4CcdxzUn9c=;
	b=PfLFY1/aecTrn5hRZAtHr28FcjHcBeIB6zdKQ72DIKyWAXOQ02eTXuMSwAWzHTzUIla7GU
	mnAk6DpfyBDTP2q9t2ReMHNlNQjUnpuQwjCEEF2jq1DgQg/PGhJ51BBaDLJzAXJ8E5Wd3s
	PjKKnlv5e75FCBXPyiQrfSpTVV9fDrs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-SDkHPUgqMYmRxHWuuUFACg-1; Wed, 25 Nov 2026 12:22:43 +0000
X-MC-Unique: SDkHPUgqMYmRxHWuuUFACg-1
X-Mimecast-MFC-AGG-ID: SDkHPUgqMYmRxHWuuUFACg_1795609362
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so4500828f8f.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795609362; x=1796214162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZV5eO5AZ12TcnUy3EmQ/L23MOch/Kx8q4CcdxzUn9c=;
        b=hG0VIAY72+57Foz+yeCF7uxl5isVyplN/asAJxrDoEajDwbTu58Dj1L3TMw2pwTXXS
         fluvd+Nt14nM/GIsNOGrG9CFVU/YOzThRQxALInxci3cfC6qW8Dp36uryBIc34Jxwb/2
         xj2VTTH9qaf07HAYy/76nrPGBItaYEhVayIvbl38wJi4z6sZdt7M12YkJCEwP5MxDG9p
         Y1U4rhxFrJ/pacdTotJUv5My8ZCXPkjtffCHd3ap6KnrGbbt1N6qlD4F71MnPz6MqaOp
         7fQkHRbqqC69rYdjwH+KX47z9q84O6cNKIf9S7bAtqJZy8/Wyes2ResE/GlLfwrBUYr3
         LgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609362; x=1796214162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZV5eO5AZ12TcnUy3EmQ/L23MOch/Kx8q4CcdxzUn9c=;
        b=j7+t5KOhNya+CBGgE/SOLLVrs/DvYm49UKWNqhdceiR03xWcAC3oJwYSYQwc8xri3I
         rsjRv9t0+zRpPJRkPWFX1Z++B5oWfYdFzi/SPILNsb1wZaF9N/0vI748SGa/8aONeA9g
         wiMVf5vG5rM2o+XTOo/igocmslZBvErQDjgmecllMceb3Q45pn9mVwSAPqWd/9xziSUK
         FKX+VuLmh69fA7rleBG60sluNTj0AWWqUdo23CMdheY7meLtXthgDuvJbih3vpEZSyAj
         0BrR8dQzcQbpGevIL3Uv2phtUadP7+GsRZ6tsXpLTtocQfqfbGFtfZK8N3TM1i1Tdkh9
         2xTg==
X-Forwarded-Encrypted: i=1; AL+hErHNggYfhiA5vWQVYjc3AW/kJHEUmtzXtBW0YcaV7MjWKhVzKBD2f0CdkQTG8gLak3b7lqVoklE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oV1WbcmyB7JT9CeIgmh7yiWEVdc9qFpiUutRtB1geyyHfN/Zh
	GkEn+hRyS/uOt5owED6Hd13m8LhwkTu31tFrQaq1+3pCriITx1Yajqr7QgiiA2hjL/TwErLQRF/
	cr+C2TFcNqGnOz2bdQiMaTXRDIxucacLuWYj0ANHmrj7W8yLW6B15yh0aJg==
X-Gm-Gg: AZFdTZeBq8hl1ldK7OhUXVSwXycBdLzC8YqHbNbgF3hZt1kM1angO/plu4vWVas3cOS
	Tjj9fR3S1H+n9vHKUhE/xAO70l20LUw6WQ3StZBTwt4Z1oIkZZ36MhM0P0T/e1ZIHctgeCwdpF8
	T3lk1n5FZsDMjN3xdZA4PNpPNogF+tED9lEUTdo2alBab0DHQs2ZEl7utgtNLlvdXqBrF4hgM+j
	GOZaeyjxAwgD4IocZVlOS5iAM6z0QtX0Fkj6+9ipiYaVwFDiWnnjiGy5SYuNKzw+j0Ewz5zCrlV
	zVIjmzzkK1cH7WsOOJ4kCqTUA4VKKgSbnPSsaYpSDaVmvFVI9yH3zBZvMIW41RlSyrmBNN7JEjz
	WZ6Jz430N+lVfaHcIMQthiTT8HdvgQnbuUW8xqII6e3RA0zzmn7e768/zXEUPpdQJi/m3aypMfG
	18RUnXlPDYxkbgARl7FAh9/K6Hj9QYPdfz8nJYBkPfUu6g
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr23350977f8f.44.1795609362113;
        Wed, 25 Nov 2026 04:22:42 -0800 (PST)
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr23350937f8f.44.1795609361608;
        Wed, 25 Nov 2026 04:22:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm28560787f8f.46.2026.11.25.04.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:22:41 -0800 (PST)
Message-ID: <f38e588a-91cc-4ded-a0fa-08f129b1c920@redhat.com>
Date: Wed, 25 Nov 2026 13:22:39 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] xfrm: interface: drop non-IP packets before
 pskb_inet_may_pull()
To: Shuai Liu <847807867@qq.com>, netdev@vger.kernel.org,
 steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, q.h.hack.winter@gmail.com, stable@vger.kernel.org,
 syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com
References: <6afdcf01.ca6cd63e.174a34.0001.GAE@google.com>
 <tencent_46F20906773869221623F9FA26275C133107@qq.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <tencent_46F20906773869221623F9FA26275C133107@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 06:08, Shuai Liu wrote:
> AF_XDP sockets bound to an xfrm interface submit skbs with
> skb->protocol unset (0) and skb->network_header still 0 from the
> __alloc_skb() zero-initialization; skb_reserve() only moves data
> NET_SKB_PAD bytes into the headroom.
> 
> Since commit 86de3a1118a16 ("xfrm: interface: validate the IP header
> on xmit"), xfrmi_xmit() calls pskb_inet_may_pull() unconditionally.
> For such a skb, pskb_inet_may_pull_reason() selects nhlen = 0 for the
> unknown protocol and pskb_may_pull_reason() receives
> len = skb_network_offset(skb) = network_header - data = -64, which as
> unsigned int exceeds INT_MAX and trips the
> DEBUG_NET_WARN_ON_ONCE(len > INT_MAX) in pskb_may_pull_reason():
> 
>    WARNING: ./include/linux/skbuff.h:2856 at pskb_may_pull_reason [inline]
>    WARNING: ./include/linux/skbuff.h:3286 at pskb_network_may_pull_reason [inline]
>    WARNING: ./include/net/ip_tunnels.h:483 at pskb_inet_may_pull_reason [inline]
>    WARNING: ./include/net/ip_tunnels.h:488 at pskb_inet_may_pull [inline]
>    WARNING: ./include/net/ip_tunnels.h:488 at xfrmi_xmit+0x1844/0x1eb0
>      net/xfrm/xfrm_interface_core.c:534
>    RIP: 0010:pskb_may_pull_reason include/linux/skbuff.h:2856 [inline]
>    Call Trace:
>     __dev_direct_xmit+0x4b6/0x730 net/core/dev.c:5164
>     __xsk_generic_xmit net/xdp/xsk.c:1288 [inline]
>     xsk_generic_xmit+0x27d8/0x47a0 net/xdp/xsk.c:1344
>     xsk_poll+0x326/0x670 net/xdp/xsk.c:1472
> 
> The packet is dropped by the pull returning PKT_TOO_SMALL and hitting
> the default case afterwards anyway, so the only visible effect is the
> warning; reject unknown protocols before the pull to restore the
> pre-86de3a1118a16 behavior of dropping them silently via the switch
> default.
> 
> Reported-by: syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=d29af9ef5c96a3f5e96c
> Fixes: 86de3a1118a16 ("xfrm: interface: validate the IP header on xmit")
> Cc: stable@vger.kernel.org

The blamed commit is in the current release, Cc: stable is not needed
No need to resubmit just for this, I can drop the tag while applying.

> Signed-off-by: Shuai Liu <847807867@qq.com>
@Steffen: looks good?

/P

