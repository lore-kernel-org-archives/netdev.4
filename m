Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518448;
	b=5sWwKKUC8hFlmffgxhoRHiWApxebJZYYalzjnWPlH20v3C5KXFWA60ZnK0xCHEvw5rTM
	 zNAD73p3refCGHOUyFens57p0qL2S9KbqoWEjiAVzQRksytuvdfpBkMYPPbyD0RpB3HSA
	 /s0Fv1cTWTpfg1hMFhSb5+MMQ2UA0P6hFZ2RIIzwVxhs4b+6gDz2FX23VzEgVvuDJ6h+y
	 pTWP3VmQWFO4TZptUGH9ZTCHyq5Wyy4ObWAApomxTOyGsyo5pqsBbzcOoJgvGJRu19Znz
	 CrqktvpO8umuXbYWlajiQdZnRTJhHTlR7YFiVJsH0yTY9woEA214tElEeXbhBOtbbrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518448;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
	b=a5mPub7iEUiGezGJiuyvYRfdRgqoZLIBxK44PmG6btCTEfzI+QP63RjkscEh1nUz8Whn
	 +GbmUGtZq7gM8brEcykYF0UkskcLqBI2uQcI2Yq2OKqb0nePLKnyXsA9aIy7oIbIXMhpE
	 TDD0JPbf41VKK4Mn8GE1GbaqOOcxyFBo8rofaspu570oscUlJDH8heqB+tHBuuzSdS/q/
	 V8gXh2IeKeqJPXLXK1hzo6ANKAT2N0pIahfXMmg60oQDuRD4P+yTvNuMjGECLuTrinktA
	 Nyn7TffmEfOOVE/1bCpIXScGkF/1e5ogFwBDtHBDWqFmbOMKxD27EqJvK82Fu3wkcBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYi00JXt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SitU1Tuz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35A606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C35A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYi00JXt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SitU1Tuz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795518447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
	b=OYi00JXtnQeRvNyKFw+HZ2u+GyIMK6ve7TQngUQ9Lag5s30IZa8q1hSyhYYHXu4/ALfX2H
	OjTZUFt6IHoy8Jyg4Pwu8unhEXnOQR0z9KmRg2UvrIdDmNnyZUgqieKNHr5bmnNzmibpm8
	tP2xjsmjAsi2/hqFBh+S632ljuPPgnE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-2Y1AxthyPw-bXiRXobfv9g-1; Tue, 24 Nov 2026 11:07:25 +0000
X-MC-Unique: 2Y1AxthyPw-bXiRXobfv9g-1
X-Mimecast-MFC-AGG-ID: 2Y1AxthyPw-bXiRXobfv9g_1795518444
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so2388746f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795518444; x=1796123244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
        b=SitU1TuzSpfITjVZshQbgJpyKVCokMRHXEa6+qt/sl5QTAG00MUDpglQ4WJdfUOUHw
         3oam4EMlg6F9VvMzEBCCmtVaJi3nRRge6A0dRQvmAzCHXpQs3Xncnq1XwDGxNd9+Gh/s
         d2xoqmTHOhReqmu/LSMRkfzQcQAFCA9b2yBakZ/aODxc6FNueVe5k6IsghaVb5n4Eof0
         g0VrupCBJCFvkT6m3TBZfMYID2ZHleLG3gzEEuLkZQAnjuldI3wfigp8sr+IQUmE2/lk
         UW9aYmVsMpPRYAO4njY/nDv71vjTUk771nUCWjFJy0Alw6Jg2u9WEiqbFOAf1f11JqEa
         fZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518444; x=1796123244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
        b=Vr7kq78rYf/bZjoZaZPe9Q+wezqAIRLXJr9p/3nv4//kR09vsuo7ihThGiIKW5ZgrB
         FEuggT2t6wz8od2Q5RGKytdTALFZ0VDYtSgIs8WL1+f3gtE78exoaS5d+td11gyX/HqX
         BPmm0ncnphPQBIpYPy3HoQZs9mJbSJaX1Gru5ELwMPbttc+qt0rKXjRe9m+vqSt6O0/Z
         EdhwQH+vSM1FjJVQo3wFMM2UkWIN8rAHq7qYS49aGlhx32GIXRs7xkU4e1JqWIa/TddK
         HGP4g5N+beC+6bG60/M/42Bd6GOclUMf+Rx1dxxAFN6wrp7/s6IDIa2H9osVTmCIOzMC
         lA6w==
X-Forwarded-Encrypted: i=1; AL+hErG+QoUVs37RCQyWDew9T1+zhgP9DCuF2qmxuwfRx0P3qZM+roofOCFBNT2OYkEhOD7o7S30v+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/natejGYGS7xZ+19LrAx3/0HOM+XVBz7LgCTgePL5M1AwXTeeC
	BfC4mMYL3g/D/O1+Tf1ZqghDXGPxoO52JpsvTAOTYxPfJ3pH6ssX15U47FMKgxth627fMLhhI1a
	Db6R0XmCANlS6RelNqEssJ47r/5wSYxobKa2VAHPkLibQ/tsUNakq+9aeIw==
X-Gm-Gg: AZFdTZcabbR+MJKCyFWoFV1+BaJjJAqgjkcop8EjD7h4XrQMRYgGw/FuPtdgsMY3Ctn
	qrEgH0gaQ3B/iDJsbqluP3ME8JzLhltwPutwFQ/e7bfvPDP6AMcGKLIIAm7WNxnptVIe7ZAs4ng
	HAZaew+JWtEecOLla0Sccy/NgcCuML2WBrTYzzu6wKg+6sG7dcnwGq9qB/bD3d2Ip0RNhq207kr
	RRZwHS3tu08Paq3xoXIl+AaDDYWFd1rDRLe+rIsYUtOTx69BSJF/pM/WxCnshKp3orDSjl1RgLV
	Vqi94+/0rwDws88r2MF+MMa6SLA0G3UI6dDxVK/DAzbhI8esBeqpvtYWD/5pe4HvMfLz94z5I7c
	Du6IiGk/8BI4+uHqcCCewgKlRqM5QWdBLl5tiMRFIL5NyeVd1A1+ycqvSeB7WtXHyVLQ5VQRsmi
	ThPzpVPD9cMCzGd48zDW3Q0vmpSlph8JAr3dsmbvxtJdgd
X-Received: by 2002:a5d:5d0a:0:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4abb71cbe31mr32232529f8f.36.1795518443950;
        Tue, 24 Nov 2026 03:07:23 -0800 (PST)
X-Received: by 2002:a5d:5d0a:0:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4abb71cbe31mr32232488f8f.36.1795518443567;
        Tue, 24 Nov 2026 03:07:23 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27608496f8f.5.2026.11.24.03.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:07:22 -0800 (PST)
Message-ID: <adb6840a-26cc-4b66-a732-abe9f6bba60f@redhat.com>
Date: Tue, 24 Nov 2026 12:07:20 +0100
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
Subject: Re: [PATCH net-next v4 3/7] net: guard memory provider RX queue open
 and close on unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>
References: <20261120045918.1239746-1-almasrymina@google.com>
 <20261120045918.1239746-4-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120045918.1239746-4-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 05:59, Mina Almasry wrote:
> When an RX queue is leased from a physical backing net_device to a
> virtual net_device (e.g., netkit), memory provider operations reach the
> physical net_device through rxq->lease and lock it directly via
> netdev_lock(dev) rather than looking it up via
> netdev_get_by_index_lock().
> 
> Introduce a netif_lease_valid() helper checking netif_is_alive(dev)
> under netdev_lock(dev) and use it in the lease-aware callers while
> keeping __netif_mp_open_rxq() and __netif_mp_close_rxq() unaware of
> queue leasing:
> 
> 1. In netif_mp_open_rxq(), if the leased physical device is already
>     unregistering (!netif_lease_valid(dev)), netdev_get_by_index_lock()
>     on the virtual netdev succeeds before cascaded unregistration runs,
>     allowing a new memory provider to be installed on the physical device
>     while it is unregistering. Reject the open with -ENODEV.
> 
> 2. In netif_mp_close_rxq() and netif_rxq_cleanup_unlease(),
>     __netif_mp_close_rxq() reconfigures the physical RX queue so that it
>     can continue operating with a regular page_pool when the physical
>     netdev outlives the virtual queue or memory provider. When the
>     physical backing netdev is itself unregistering
>     (!netif_lease_valid(dev)), its queue will not outlive the lease and,
>     matching the non-leased unregistration path (where
>     dev_memory_provider_uninstall() detaches the provider without calling
>     netdev_rx_queue_reconfig()), the physical queue should not be
>     reconfigured. However, unlike non-leased queues,
>     mp_dmabuf_devmem_uninstall() on the physical netdev does not match
>     bound_rxqs (which stores the virtual rxq), leaving
>     phys_rxq->mp_params populated until socket teardown or the virtual
>     leasee's netif_rxq_cleanup_unlease() runs. When
>     !netif_lease_valid(dev), skip __netif_mp_close_rxq() and clear
>     mp_params on the physical queue directly so that a subsequent
>     netif_rxq_cleanup_unlease() or dev_memory_provider_uninstall() sees
>     !mp_ops and does not uninstall a second time.
> 
> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series and confirmed by code
> inspection (not observed in production or reproduced on real hardware).
> Tested with the nl_netdev.py selftest on netdevsim added in this series.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>   net/core/dev.h             |  7 +++++++
>   net/core/netdev_rx_queue.c | 31 ++++++++++++++++++++++++++-----
>   2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/net/core/dev.h b/net/core/dev.h
> index 4e9e8cd156977..50cfede051db1 100644
> --- a/net/core/dev.h
> +++ b/net/core/dev.h
> @@ -119,6 +119,13 @@ bool netif_rxq_has_mp(struct net_device *dev, unsigned int rxq_idx);
>   bool netif_rxq_is_leased(struct net_device *dev, unsigned int rxq_idx);
>   bool netif_is_queue_leasee(const struct net_device *dev);
>   
> +static inline bool netif_lease_valid(const struct net_device *dev)
> +{
> +	netdev_assert_locked(dev);
> +
> +	return netif_is_alive(dev);
> +}
> +
>   void __netif_mp_uninstall_rxq(struct netdev_rx_queue *rxq,
>   			      const struct pp_memory_provider_params *p);
>   
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> index a7261fedd5e76..98b51b2ac8ee1 100644
> --- a/net/core/netdev_rx_queue.c
> +++ b/net/core/netdev_rx_queue.c
> @@ -270,7 +270,12 @@ int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>   	}
>   
>   	netdev_lock(dev);
> -	ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);
> +	if (netif_lease_valid(dev)) {
> +		ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);

I'm sorry for the late feedback, but it looks like the above patter could/should
be embedded into a single helper?

I mean something alike:

bool netif_lock_if_alive(const struct net_device *dev)
{
	netdev_lock(dev);
	if (netif_is_alive(dev))
		return true;
	netdev_unlock(dev);
	return false;
}

That could be possibly later used elsewhere.

Other opinions welcome!

/P

