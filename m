Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196627;
	b=c6gGUMgZwx/H37F/rP7m9yr3hoj+DelOqinrsUBVjDbZRZqbJBTUu3Nm4OuT9zSa4s9y
	 Cu1elEV6lQKkvo6lDqM8rD+BkAkRu/imuTUD3BZH8sjcet3C2sjjrt9m3ggMRqdZSRXqE
	 /JAFN2kDGeur3GTjrtCxhFyc/PgKFJSH3lmJSi5QtI1/l/s/FcuAb92y7HsAzA0/QU1Gs
	 JJnJL7T+kQg4e6UduvDoURR0eZTYv0vMKCguQf8/3RGsx8A6uMlN9CZlH/EXecpgURxG6
	 sBNhClyk46Rd/bw0KdCOG94WytSd4z5WPxvjuaQia8HYWotMInc2A1vigkbNgoY9UAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196627;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pQ3fmyjnI7iaYkxdHU1FocI1IG6sGSuP8ezfFh3hoxo=;
	b=0bhv4RU4tDZp1t1Yv2qJuTo7G+wFrPptm7Z5iDfgV24n8+1U7DIliTleiICBtM5vhCI7
	 9D6/a1DrRnPqYzessZVedPyOeVRiDY9vEdlWhZ2Xnc7Whtqw36bcrP+hr1KYQ1FJmLvXD
	 WSGizwppBNBYsOm3n4ld6BI7Ye+bZ774Cuy3ktHQH42FlwRV6f1xpkzYWpxwcmSsGtzdC
	 clZYlQt5kUX/LVXm7sylp7zXW7CzBFHnxgTUUAV1nGRKcMHZ2JtXZCyHbztWpedc5EBjQ
	 AXV1WDV42R2MadunlCzjmV2RPR1oFhDoGmJrSz3hyUjI93qRvUpT/ZOswhEJ6ngAyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="W/YbbJT1";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KioDSP8I;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9A606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC9A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W/YbbJT1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KioDSP8I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795196625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQ3fmyjnI7iaYkxdHU1FocI1IG6sGSuP8ezfFh3hoxo=;
	b=W/YbbJT1T6SPfyhgdV+k/AJsU52R5OTRWdc3fkr3VhM5KnxXlwD/MOnF8gpENvlc+5ccOH
	MNrQRpSMjABb0TSp415Wva8bGXLsqbR1xyVz7OBMwJ4nzet6sz04HbZZjqrpKlM19Zacs5
	6WtITXSrwfh5fBt4HoUA23R6U3J1Cbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-KxUWi17tP128BxMlT5F1Xg-1; Fri, 20 Nov 2026 17:43:43 +0000
X-MC-Unique: KxUWi17tP128BxMlT5F1Xg-1
X-Mimecast-MFC-AGG-ID: KxUWi17tP128BxMlT5F1Xg_1795196622
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so7564705e9.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795196622; x=1795801422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQ3fmyjnI7iaYkxdHU1FocI1IG6sGSuP8ezfFh3hoxo=;
        b=KioDSP8Iyl4FnM43FYjKyB5+9zvHR8M6gyfSRy14jmsNMH7rP9Xt9yY7V42lSfg0TR
         V/MUw1vy9X9jN27+neVPxgsnOMxxy7mJDtGhVNeyDpaS3aBQMKxlB43fpkT5nddD6FqK
         Gq/QSHg1s1Bpi1fNplkZCIHGF0gl6nLxUxU8C8ecTNmbdjlAV01lH7LswXM0Q209qNkq
         mK289KCOuMYWHwhdHW5N6ZLiTKMVNsP8q5KCXJyE+8eiaXvFlmSlgi6b5I+X2Rg8VHK1
         mQ4TyqJeK4z0gAf9A+ZgnNHL3XIHRLyIpuIbADYXVRJcAafeLnBpNlkYDW3uUdpK/yil
         oexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196622; x=1795801422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ3fmyjnI7iaYkxdHU1FocI1IG6sGSuP8ezfFh3hoxo=;
        b=h+wDQeqSvAQgB4Iq9w71Tb1WQcvPKmUp9sdX/2LOpu31yjMk1Iqon6MdOrF/NyBr/P
         YIPmyHwgXGXu02p+lvoufoW6rtTB/6atqhQo9hvTYtHvDq3pha/l2Zo/a86/rC4KdPOq
         yfal7AmEfO8KcL+V2fp+TJ3V0Xjxe/MfhkHZnJfh1BXq9fuBM4snu09TT6X4dBKU6tnD
         7S7Nrx77JMqGs+tIMfq7pZ/9c9Hsjppsb119YT2DpV0IRa2QmYwlD7FFIKaIx5PgGIA4
         MId5DHrpaGvSteSMYBVKfmsn5/eD1MDnvpgrX4yqaTxWChHwtniUPSSLWnrKqNC67xfL
         yv4w==
X-Forwarded-Encrypted: i=1; AL+hErF3RvzO6pF7C2mmtP9C25ZLlTm4VtDc2IonGcHytY5xrW52K/0t3yj1XKAQx7OHGWq9Y0IXiFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oYVmLEKld7jPkoj/NcV4YGPApxpnSA21wxckvkq9KnLTQLdZw
	KRMMSFMEJAZNxdHPM6/odnA4Lvtpxp6aRmMmt5mWMIU/IIHJuTwyUHcS2kiszmZMf6dOYFuUwBE
	KNd66VXqOpeY4gQHzMjl3MBMpmi5qSfUqyrylY0jwRLtcJB5CyY6+62zS1Q==
X-Gm-Gg: AYBFou3dtXTlGpUy1srWHo7YcUV5fVegGlWVcVS+67q4jSiCPJRuup231lqGUunO3z7
	cbbq6UTwkWOLi0fTL2vNn/N4L5pCM8PnwNZP2CBTZih8+8O0YKJvT7fDPHKZ8sainCLUAJEiDqG
	p7Mtl8sRanO3rdW0CBOQRg1SVehz1YVH+gOA+359BXhrsfnOiyYs4zbL7TUmJfgzKaguDjlXqBg
	YtP8bbCxcWN1IvoQin74Z/sqnvwb9cQr+iD1URLamiGWxys6al3W5J3KF6xyIKvjSbrZ2A5D5lV
	5RKoff3jWTNGK28pO7111yUIzoaZcNZYIlumOpAaATyoercODi+rWpMRgzdcRstIfDlL/DpCCiO
	PWZS9pXySxGhzUYWsPmqAnhkebpwQj3b9sTJOmgAMcgic
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr93398475e9.2.1795196621623;
        Fri, 20 Nov 2026 09:43:41 -0800 (PST)
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr93397795e9.2.1795196620944;
        Fri, 20 Nov 2026 09:43:40 -0800 (PST)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm158225955e9.14.2026.11.20.09.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:43:40 -0800 (PST)
Date: Fri, 20 Nov 2026 12:43:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Longjun Tang <lange_tang@163.com>
Cc: kuba@kernel.org, eperezma@redhat.com, jasowangio@gmail.com,
	xuanzhuo@linux.alibaba.com, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, tanglongjun@kylinos.cn
Subject: Re: [PATCH v2 1/3] virtio: add virtqueue_get_last_used_idx() helper
Message-ID: <20261120124307-mutt-send-email-mst@kernel.org>
References: <20261120071826.198604-1-lange_tang@163.com>
 <20261120071826.198604-2-lange_tang@163.com>
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
In-Reply-To: <20261120071826.198604-2-lange_tang@163.com>

On Fri, Nov 20, 2026 at 03:18:24PM +0800, Longjun Tang wrote:
> From: Longjun Tang <tanglongjun@kylinos.cn>
> 
> Expose last_used_idx through a new helper, which is used by both the split
> and the packed ring and denotes the position the driver has last consumed.
> It is useful for drivers that need to detect whether the device has
> produced buffers that have not been consumed yet, by passing the returned
> value to virtqueue_poll().
> 
> The split ring now writes the field with WRITE_ONCE() (the packed ring
> already did) to document that the new reader can run concurrently with
> the poll path.
> 
> Signed-off-by: Longjun Tang <tanglongjun@kylinos.cn>



This kind of low level API is not reasonable in virtio.h



> ---
>  drivers/virtio/virtio_ring.c | 18 ++++++++++++++++--
>  include/linux/virtio.h       |  2 ++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index f683a2d6a200..e8af6d5c6432 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1005,7 +1005,7 @@ static void *virtqueue_get_buf_ctx_split(struct vring_virtqueue *vq,
>  	/* detach_buf_split clears data, so grab it now. */
>  	ret = vq->split.desc_state[i].data;
>  	detach_buf_split(vq, i, ctx);
> -	vq->last_used_idx++;
> +	WRITE_ONCE(vq->last_used_idx, vq->last_used_idx + 1);
>  	/* If we expect an interrupt for the next entry, tell host
>  	 * by writing event index and flush out the write before
>  	 * the read in the next get_buf call. */
> @@ -1072,7 +1072,7 @@ static void *virtqueue_get_buf_ctx_split_in_order(struct vring_virtqueue *vq,
>  	ret = vq->split.desc_state[last_used].data;
>  	detach_buf_split_in_order(vq, last_used, ctx);
>  
> -	vq->last_used_idx++;
> +	WRITE_ONCE(vq->last_used_idx, vq->last_used_idx + 1);
>  	vq->last_used += (vq->vq.num_free - num_free);
>  	/* If we expect an interrupt for the next entry, tell host
>  	 * by writing event index and flush out the write before
> @@ -3236,6 +3236,20 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned int last_used_idx)
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_poll);
>  
> +/**
> + * virtqueue_get_last_used_idx - get the ring's last consumed position
> + * @_vq: the struct virtqueue we're talking about.
> + *
> + * Returns: the vring_virtqueue's last_used_idx.
> + */
> +unsigned int virtqueue_get_last_used_idx(const struct virtqueue *_vq)
> +{
> +	const struct vring_virtqueue *vq = to_vvq(_vq);
> +
> +	return READ_ONCE(vq->last_used_idx);
> +}
> +EXPORT_SYMBOL_GPL(virtqueue_get_last_used_idx);
> +
>  /**
>   * virtqueue_enable_cb - restart callbacks after disable_cb.
>   * @_vq: the struct virtqueue we're talking about.
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index f923e42cfd01..1aed4d9235c8 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -112,6 +112,8 @@ unsigned virtqueue_enable_cb_prepare(struct virtqueue *vq);
>  
>  bool virtqueue_poll(struct virtqueue *vq, unsigned);
>  
> +unsigned int virtqueue_get_last_used_idx(const struct virtqueue *vq);
> +
>  bool virtqueue_enable_cb_delayed(struct virtqueue *vq);
>  
>  void *virtqueue_detach_unused_buf(struct virtqueue *vq);
> -- 
> 2.25.1

