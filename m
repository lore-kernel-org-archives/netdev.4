Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805940;
	b=VD7N+NSxn+yAfhSVQcQmfqzDtcV/h8dfF95VGKPc7wOTnCR8+vpJzHshRD3g+alRwu2C
	 oYQcuQQLlyKjIqoUo0sUAaoPFOkdIkdO2uV25eIGPjdIi+CHlocAqJf04lHzlIfyuPWD2
	 1z6BNZlVTvCUVKqhs0FsmO+GDk6/F9EHiXpQUPxA3kTuiMDYzg2QzdeHW0sKRX1yJUFrB
	 8D0lDB1qke9MQoyILUNvPhawV7AiOwc/MIL/3W11+wVeP6h2RkkdiKn6tg1NhT4RW0cmI
	 aOfqrirHHwF4oTF7UDcSb3AwYYmfFNzeZeGa09kDfjNpEpE41vMHBONsb+ZIybpzSDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805940;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
	b=di84v31yN7PsFtmS37VxiPJuSzc6XqzGW+p1UJNRAdAmP5SVDNL4S/9LLmlmXY6Z8v4N
	 oDlNhGGg3yUnUfA9LVyRRF6t6FP4K95Fg4vjaj/vJTygcjb9NrRzxDodl2afxPyInbEXF
	 MWE2cMeKCk5OHl09tROiIrt37o9kJU9BhA45TeCKSboLb/zcPZLUoKwuzWrb9X6VOP2D1
	 nZZnIFTQuJwUNepbmQIi6GbuwL0ZQLHmPLp0PfFeqQ+XImUi80lgquTtoG/diaebJ8mLS
	 wKxJMZj9Sj+ZkEWJ6Ms4M92x9D4JxMgy9CXJmBT7LY07+oqf5MWOOAQezvI3ImB67Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gu+RjFap;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVkxJOwc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18FE606A32E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 18:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18FE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gu+RjFap;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVkxJOwc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795805939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
	b=gu+RjFapXwdZmlA49keavaDZllvt18GZ0ZNDeUIKTKrEIcTqcwyLo740e5oqIdpYnE31Yq
	hTz0IWMITMGfy44s71wd43Exx7Ley0uS0fJduEgXDo1iAPchimRzi5lUSu0zNM3Ah7nFod
	rB3RydZuSbv3/g5DFD23MjTCCiVtN90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-QjqrURxAMMOF4ZK_RT5k0g-1; Fri, 27 Nov 2026 18:58:57 +0000
X-MC-Unique: QjqrURxAMMOF4ZK_RT5k0g-1
X-Mimecast-MFC-AGG-ID: QjqrURxAMMOF4ZK_RT5k0g_1795805936
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fcb657f32so4946575f8f.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795805936; x=1796410736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
        b=SVkxJOwcMjK9s+rPQpn+sQVX3Lbi75QxwYQZqf1pva5cEkZvAt1lMndrOVX5jhnX9z
         cD/4ntDol/dIExvxi8+/BHLE0+arVu2SXXO6rCKr/K2ElLXvgbNYO/CYxyLV206lee31
         6m94MGQHGnEUMh5ZOtkP1f82936GBJ6L9Hl0IN3A3umpVDIKd4JwFDq9gyFgS0GsqqDX
         z2+fTQ/Dj7Xz3ClXBIUVC6Rz+SIWksJl4fsZPlxe6wa8U4u42CzoKDJfvj4SEW9dbg2o
         rnDayg2IyFr1fRrYZlrMinZxm+xYOn5DRCqGNstLoklqFbrrJjh8fBbEtIO8X2iEUerN
         zZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805936; x=1796410736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
        b=UhDMG7DE062pFIDEKr8UVce5gJsysACwP1BH2OEhsMe7cTH/73/QT74dSUSEOMp12H
         NrPOO+BAfOj6gJN0JoUZV7lmDPhPSsr6z+IhQsE+hQdo6g4W1aZ43cGMIJzTBd1M09yz
         tQ5wE4zARNs+EHe+TnESEsKhumPsmpdaNqBYvMDr4znM2zeEkWKQvOOqUOSFyanXn9fF
         ++P612wbTN2LVuDSFGnTa+GqtFw1jlu75DWmYlQ7tRk67DtVTV3itZG9Qbwo6zicwwTR
         YW5x/JBw2cGmKaUZNjVvAJKfvnQPBhAvZ9Sl+1NF3BVcG2z/ximX0wOI3zZ3FaX2VB9T
         ZmYw==
X-Gm-Message-State: APuU4Z9AdlEGznneTBbF96t7Z4FTyAXVT/bkzNo2k7TBEekp3LrQ+2Bw
	fYXMzvBR9NgM65EZOepsRp4U0uUVD5E3PDU+d7RRXH+jfGTaFw6UMF83+U3ycOIAqLqi4/1Wzm0
	p3k7ij0NQEKDCVDefNRmIaLwSCU6hPmLntMlB3G8q+VVifjbCoHXJTytKzw==
X-Gm-Gg: AZFdTZd5Nqblm1EysJUE3iCXRle+Pqc4s91CM0f3ab/gZmVk3hQn7Gx4J2FS1+KoS+u
	Jh2bBc5t4x9u6TfZPHOmTbjCeCIr+Zb9BSOyPF7B+ALTUiugMOSJv2VrtgGsreTI87bdZ6cQlyT
	YJxTXoPL5+cdj0HwsjP9qhi6aM4+y1VtkZdT8gNxlIqY+RRMm1pOw++InJGJhhZ4jr3gB7BIxo7
	J23k6WBH5iXJ8i0vgqPI85BYjqD+z3WmALYvYpYD17upkcIMGQfNs6z5SUCcDidq2wXMRi0x5HG
	l0sn5gBQfn1uBXtG6k/amQVmfRJSHPW+u4mrenCOlvyNKUeSMkNjpXVoGXOeYeDnE+2H6YQdyD4
	GknXKgsKGWRwMgcfmudpl8Nzy3Z7Pu2Yb1jT5hgXkO+IP
X-Received: by 2002:a05:6000:310b:b0:4b7:6dcb:e92f with SMTP id ffacd0b85a97d-4b76dcbea9emr28203583f8f.21.1795805935768;
        Fri, 27 Nov 2026 10:58:55 -0800 (PST)
X-Received: by 2002:a05:6000:310b:b0:4b7:6dcb:e92f with SMTP id ffacd0b85a97d-4b76dcbea9emr28203553f8f.21.1795805935295;
        Fri, 27 Nov 2026 10:58:55 -0800 (PST)
Received: from redhat.com ([2a06:c701:73fa:9a00:793e:eac1:d749:dcc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm48971276f8f.42.2026.11.27.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:58:54 -0800 (PST)
Date: Fri, 27 Nov 2026 13:58:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Jonas =?iso-8859-1?Q?K=F6ppeler?= <j.koeppeler@tu-berlin.de>,
	Jason Wang <jasowangio@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] ptr_ring: add PTR_RING_BATCH
Message-ID: <20261127135832-mutt-send-email-mst@kernel.org>
References: <20261125152311.805325-1-simon.schippers@tu-dortmund.de>
 <20261125152311.805325-2-simon.schippers@tu-dortmund.de>
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
In-Reply-To: <20261125152311.805325-2-simon.schippers@tu-dortmund.de>

On Wed, Nov 25, 2026 at 04:23:09PM +0100, Simon Schippers wrote:
> Name the batch size in which the consumer frees entries, so that users
> of a ring can size their own work to it. The next patch uses it in veth.
> 
> No functional change.
> 
> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> ---
>  include/linux/ptr_ring.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/ptr_ring.h b/include/linux/ptr_ring.h
> index 631c43fde4407..b851a9c170bf6 100644
> --- a/include/linux/ptr_ring.h
> +++ b/include/linux/ptr_ring.h
> @@ -27,6 +27,11 @@
>  #include <asm/errno.h>
>  #endif
>  
> +/* Consumed entries are freed in batches of this size, unless the ring is
> + * smaller than two batches
> + */
> +#define PTR_RING_BATCH	(SMP_CACHE_BYTES * 2 / (int)sizeof(void *))
> +
>  struct ptr_ring {
>  	int producer ____cacheline_aligned_in_smp;
>  	spinlock_t producer_lock;
> @@ -506,7 +511,7 @@ static inline void **__ptr_ring_init_queue_alloc_noprof(unsigned int size, gfp_t
>  static inline void __ptr_ring_set_size(struct ptr_ring *r, int size)
>  {
>  	r->size = size;
> -	r->batch = SMP_CACHE_BYTES * 2 / sizeof(*(r->queue));
> +	r->batch = PTR_RING_BATCH;
>  	/* We need to set batch at least to 1 to make logic
>  	 * in __ptr_ring_discard_one work correctly.
>  	 * Batching too much (because ring is small) would cause a lot of



If this helps, sure:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> -- 
> 2.43.0
