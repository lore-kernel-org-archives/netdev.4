Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099542;
	b=EitIKICFE9T8A672Bkk8+lkxrhYF2LhlqDjMKZo8oJqsBHYbxx2w7Wxyk9nRRUp65ERX
	 xQjZL79rwNzBEJjqmBHtyODKD4P8RhmqINDM3MexX9IMHrj9Pbbm/OOKgS52uXNJqZNJ8
	 9VDyD0gLWAw8OaSCrH8nKLCbP5ZpIcfxzED+6k07EGBQj71nyS46JuNxlin3B7AHeqFQw
	 rHb8RQ4dRVgm5mzDA6D63U4DPjBfsC0I8CnYD+xGGyvlPYzvXS+Ci53h15bSbYOLkFt0L
	 uqnGS5OdhNP8eKa/2b9PBLILugmQkf/cBKEQ3RKspdoHTl6lHOQxJc1b6N/RaEWdpoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099542;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mErUvWvSAMQID0KQkYNWkXS0wwrTWA1UHG2jXHEQYNo=;
	b=SeJsu+Lrq6we84Crs9UXeSZCjemnBdSj0v8cV8bA3MmTq7wBL42X7ZBJ7e1loxvypGr3
	 tMQlvAAXEMpydIBBF5u9mzgk0OrjRbUwt4OpebEB6BgB8gOTqHip9VXNYfwI8JOGQwyVt
	 MqHMF/ItPtSbhOycHM9HbcjfsCywNI2X9p553j2n838o8h85Q6azgLR6wD2alaB1ShDeh
	 xX0XoKSf0tSlyRgV8kyk7enPIiSO0gseKr9HZb+/5ff8kVtlaFzq19XzznWVGpAA0+t32
	 RFYsTHGxlPlW8GmJyO4BRbiJZSpw189XmY+zC1Ixa9T1wSgah34HHDjqww6viXV3NtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEHPJjDt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hkFoYruY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988760A2606
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3988760A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hEHPJjDt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hkFoYruY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795099541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mErUvWvSAMQID0KQkYNWkXS0wwrTWA1UHG2jXHEQYNo=;
	b=hEHPJjDtYuPdAJaw7QEE58tL3LKG17TeMXVSjitBwO4W4zWZ86RC+72XoScS+exZ2WSvgs
	+MyEN/4zwNe3qPj6ZokdjOgQpN7w4KbUDHCXe6RthftZfp7GEl1oFG8EtpJzuLIcnTHMIz
	sYjSYdAkLKszU+3Dqyy85KRX2hjUY2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-nLVY0m8-OVWuOgCy-YVa5A-1; Thu, 19 Nov 2026 09:45:39 -0500
X-MC-Unique: nLVY0m8-OVWuOgCy-YVa5A-1
X-Mimecast-MFC-AGG-ID: nLVY0m8-OVWuOgCy-YVa5A_1795099538
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso5432565e9.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795099538; x=1795704338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mErUvWvSAMQID0KQkYNWkXS0wwrTWA1UHG2jXHEQYNo=;
        b=hkFoYruYMjIwGmFg5iFhCNH1tiPnbK1D43q4NJrNFZKIx4DIjtPY4js1wGzbTdqOOk
         coCY5jXM3B7YXO557EdvrHot1SyVjU8uiXn9gFmL4weiHUYzFcWDuSuzbDbGGGuI9Zj8
         Sz3NaAZb9yIqs0bY0QnYRaXOXNSiXb6m+L1BQvXy3rV0f5LcPv4bfReoDnhS+/gVN6ba
         /Nw9tSGW4i6MYRAtBwmAxFguxkHmAlfIQ9DexvoIG2Mv4lSqNJocu7CRlOG/E50ulveP
         uoz7iPXXQ8J7F+AALRkD1gzqB0HbyHgjTjKu4pC7PBYLZHlgARx6guNg4rZtfLVsCO93
         pBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099538; x=1795704338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mErUvWvSAMQID0KQkYNWkXS0wwrTWA1UHG2jXHEQYNo=;
        b=JdrRlSG6xURWYqYDMWPoy0fqkMpYnVsJZn1fxzqLku6tvN3uDjR/RKR1pkLCDeU+UC
         YWKfwXK77xAyvE6B5fOFd93g0kawLEvbsyhYBNZaWCoqCai1IbT5KHva3l7bv+gV1bJ5
         jfGw3h+TxugXaH584bWb2SOACWfoVbxf3sIkOLLwE1tTT4Ir6sj8ymUKspPajrgoKYyG
         3QkxaKxaMpcYphGq5Lsyqk4qcYur0sSlPc2O/GmN0iUXbAR2P5zKii1mMPjAZlTWLAVu
         kZvuVQ1hC3ySxmLry6aZAvQCkAmSGdsn65f5XI1IUhHO5Dcjk2pWNeCerjrgCOqoxVH6
         FQiw==
X-Gm-Message-State: APuU4Z8S4I/s0lHCtZomZtmj1YqnJ/xB4fO+lB+9x5c0eviZSXS2WfcC
	6t0oivOLHF0MTljKe5hFZbVM4KDWzdMBoJypa2kfqy3XI7py3JELKp6zQGilaVkBejwy9gOdHSE
	F2FoMWWB2kPKO48y5Owtxbm1KXn+gC+8lkqLbQyzfxSwZ5u7O2cObBALBYA==
X-Gm-Gg: AYBFou1uIxsu4VAYg6iJoCn9VfEpE1cEAl3WOQ8J8pTUN1GqAd2RFDiCmB25pl/2oNH
	DR3ei5rBjpfr5MP5EuVbhiu9GD+I6ID3oMGjzT99MkFvGV5MkNFkS01bxuQgeEvT4Op8qCmDH0k
	HjCiIPVxdAiDE4uIR9E8B6Ijx2bmu/xHUdaXw+0aBL/imPImXYfeiAh9TVRE1mPVWCArARACO3x
	fREeiRfKpwTg0kV7J07sZPgUpAogFXVc32IXKTmRmDgLVb3+buOz+aG7PaVyqN4G5sJUVCY0ysN
	XYrPiOFQpsYAHmXNFXYrL6Bt/W4NA7v9uW46AXlJ3vuJn62WeZ8eCD0k6s7yl2c6ra+zR2/kfOp
	4JnbTK5z93G0gDxn5qCrPGTwhdxf0easQqPIkP4hXIg==
X-Received: by 2002:a05:600c:674b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb860ffbaamr32242095e9.5.1795099537824;
        Thu, 19 Nov 2026 06:45:37 -0800 (PST)
X-Received: by 2002:a05:600c:674b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb860ffbaamr32241545e9.5.1795099537283;
        Thu, 19 Nov 2026 06:45:37 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm34711455e9.4.2026.11.19.06.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:45:36 -0800 (PST)
Date: Thu, 19 Nov 2026 09:45:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jianlin Shi <shijianlin11@foxmail.com>
Cc: netdev@vger.kernel.org, virtualization@lists.linux.dev,
	jasowang@redhat.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, talgi@nvidia.com, hengqi@linux.alibaba.com,
	horms@kernel.org
Subject: Re: [PATCH v2 0/2] virtio-net/dim: fix irq moderation init failure
 unwind
Message-ID: <20261119094456-mutt-send-email-mst@kernel.org>
References: <cover.1790751008.git.shijianlin11@foxmail.com>
 <20261102155145.23144-1-shijianlin11@foxmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102155145.23144-1-shijianlin11@foxmail.com>

On Mon, Nov 02, 2026 at 11:51:43PM +0800, Jianlin Shi wrote:
> net_dim_init_irq_moder() leaves dev->irq_moder dangling when
> profile allocation fails.  virtio-net probe then skips the
> virtqueue teardown if that init fails after init_vqs(), leaking
> the virtqueues and their DMA mappings.
> 
> Patch 1 makes the dim init failure path clear dev->irq_moder, so
> net_dim_free_irq_moder() is a no-op afterwards.  Patch 2 sends the
> virtio-net failure through the existing free_irq_moder unwind
> (reset + del_vqs), matching the page-pool failure path.  Patch 2
> depends on patch 1.

this is not how u submit a patch to netdev:

1. start a new thread
2. put "net" in the prefix as in [PATCH net v2 ....]
> Changes since v1 [1]:
> 
> - Patch 1's commit message now documents the call sequence the
>   maintainer asked for: on current mainline the dangling pointer
>   is never dereferenced by the only in-tree caller (virtio-net
>   probe does "goto free", which only reaches free_netdev()).  It
>   becomes reachable once the caller unwinds through
>   free_irq_moder as patch 2 does, which makes patch 1 a hard
>   prerequisite rather than a standalone bug fix.
> 
> - No functional changes; both patches are identical to v1.
> 
> [1] https://lore.kernel.org/netdev/cover.1790751008.git.shijianlin11@foxmail.com/
> 
> Jianlin Shi (2):
>   dim: clear irq_moder on init failure
>   virtio-net: unwind VQs when irq moderation init fails
> 
>  drivers/net/virtio_net.c | 2 +-
>  lib/dim/net_dim.c        | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
> 
> --
> 2.43.0

