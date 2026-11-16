Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862883;
	b=DdUFdPhMR0TlbBN0AqOu4KayB0fflyJe+CunDv6mIO0XzRxOcQwO+28UY7/AYAbLgSsS
	 hDHnvUbpD+TxT1Oo7N3PwhmO/+7l/V514lTeSYZKucpWr6MhblmNRR98keM6lBTV7Gi7J
	 Bd1l8D+u0p/o54pOsKI5DBu/sePaGxM2/P1CtXjGmoWzv1ITdoZP2vcYbBiH1QGnqtU6Y
	 a5OTqXXYaty/5keDT/XUqXwybvc10z+MJkYDL7OtXwS9kBBSvgeYOy6u/iTD+2GdvCF4e
	 F5b4HvQeRGa+e8tk3CNkFfCYaNSgAaw/kiDzUEYdkqclB0BKkRLx8NHLsgUSB7Iv1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862883;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SZoIL09apRESCSVy9LvCJwT2nl+8SSwpAsQe0tMlFOU=;
	b=Pf2IbA4Xn1dDHX9H1AivTKOKbWbXckifLnPgG550EPH9bpabizISvYnT2GqtETMZULfD
	 flICrIwNISGUB7HnpkB24/upA4DiBp+Gonk2NzRgYM+gQ3rBn72B37RWVMAtZIwIoiodX
	 PYBqWmO1WN/GDC5rR1y84CMYOuhQp1+T5KioDLbda4h9OdBRLm4L0Na+UFWv/TS4+cbTx
	 U28PqolV9v7rN5MQjDPXXJ1qPxp/DxKzrWH4ucYgRVLOErJY4w7tjdVYe4NNlIFrmlaJK
	 r8B8pQhdPSroXJJ3YO3LpkZFwOZ2b1InH4qgdVtGkQhrK/vP6tfjiSa+Kmf51ZID0sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L6uUzIuu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UWmCt+L1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFED606A337
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFED606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L6uUzIuu;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UWmCt+L1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794862881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZoIL09apRESCSVy9LvCJwT2nl+8SSwpAsQe0tMlFOU=;
	b=L6uUzIuu9sGhWZiaXdVNhmWShvxtQC9UDHSuU/qCHzS0corWiFXBXbybYvNUI9qDheRkPF
	R6EVj4NCJrY2qUO7YG8bWn9LWTbaSzdBmi2BTlOeIyQxHQtOz2bevupKBQbaszHX6VrPCD
	UKlk/aTPNJYakgZ3hLi/CwIi+TUV0Tw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-rRxCntpONcu3VEUBUjOToA-1; Mon, 16 Nov 2026 16:01:18 -0500
X-MC-Unique: rRxCntpONcu3VEUBUjOToA-1
X-Mimecast-MFC-AGG-ID: rRxCntpONcu3VEUBUjOToA_1794862877
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso13613725e9.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794862877; x=1795467677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SZoIL09apRESCSVy9LvCJwT2nl+8SSwpAsQe0tMlFOU=;
        b=UWmCt+L1yLojGLi1JJPb1er1CIug5BOIcWzK9D6Ki1BKVE5blUkly6BNf8C/uhOpPn
         OeRlOd0MItNECGd4XYpI9Xhq7vpEE+XXYjG4Q4OQ9xuusdVvzgWsiKzgmwh53AzNbb4k
         4SkvDtvRNqySsS3I9KoQVuqlf+35Jltx1PqUQySH46UOVT3C20wD3OAXVKvFKXxe6sWh
         PS/fRs9lniuiBEcaLoflMIvKXU8K6y8HV92M+MBhgu0qgFvifZIG4EEn9qokPEbFXnMh
         8bHHzTVNSZWTIn377zoLSKga96oDcjGBWFWDXMe3FUPVawEV79s+/uAJHzCy1pAgZkmu
         lZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862877; x=1795467677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZoIL09apRESCSVy9LvCJwT2nl+8SSwpAsQe0tMlFOU=;
        b=U6rsTPdPR/cxlZ4BlGNrt1+viGGHz1bZp8EYB50LmFzpc62fOFQRwBFRqkgRuzX6uz
         jMyaxzScmjSH9pYbwNtVNgATVS01AZgZ22VEMJqBW5OHmADss1tkDOWQRAjmp45RuMaO
         cqwdJaxypf/t33L5LATpYqseknmn2BqQ8RiJj5TbBPRPalTIU4QLXGdAZh8WomoX4sMI
         dWsnIjOcS0zYru5sBI/i6yggaOGdPW54TrwYh8SOa7j/XMUlLcD1yd9fHhicPpMi6GgP
         qDAclUN7Sqe+x2KDueCqIS+8CI+oNT8XToELE2PYjrAMiDCL8KTVov4eE/eEM5thYQpc
         DAEg==
X-Forwarded-Encrypted: i=1; AL+hErH+YmI2QvDFsRMA0g/QHv0VoU6TJGfB8RlDIEKwSFLuoXSZKExQlFFfTEQ+rtDCIuqCNxFWnDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8FlGI2yfn0eWaPaqWMLQez2vbW4L+msNjrM5DrRlwop4iWldz
	7qRT6N8uahDPcxrbvWBoaqt8PLGnP9glAXxdkpUjWtJHOBiH4DsR2DvjTIQWbkoiowup4CO5r7Z
	ywNFAWxxOoPZOARTMC/ntFv4UPF1zxQByminFtUMllmVTW0W9HgVQXIxsIQ==
X-Gm-Gg: AYBFou33imHw4Rp+s2jLErp3TKd6Dzs0mq0JocstZeP/ubK2HnEHgCPVF9BOuvWASJO
	u4sYcIvRyS8uFLgSH5mBXFRBxU5kGb7jlfqgkYuu32j7z12Cr5Fi/0QWcheFjXeKPR7O8sEhw9j
	JdSas5KIRfcmH/t09B6QGYAtoX6+55zxc/GwgkdTTcZFIu/R/xy+ur06MA7ZqWSKoC8HG1Kj+bV
	+ibzcR0+U6bWuhpZsM9CSgqT9NTz6D668/3UGEFFJ+Rh58F3q8rGutRgqYo4deXHjrN2jAyldko
	HMiCYwMm8w2oLbV322jx2ufpANolr9blfwrI8heNaQg/nPto8hWwXwlxZxclQ3BYgBPGAc9O87T
	1I4ARPIYqFPAozmAzZU6RJ3PQqUqBXTxXw841/ERyNw==
X-Received: by 2002:a05:600c:e555:20b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb55a50f1cmr166278235e9.14.1794862877103;
        Mon, 16 Nov 2026 13:01:17 -0800 (PST)
X-Received: by 2002:a05:600c:e555:20b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb55a50f1cmr166277685e9.14.1794862876566;
        Mon, 16 Nov 2026 13:01:16 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm22454295e9.2.2026.11.16.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:01:15 -0800 (PST)
Date: Mon, 16 Nov 2026 16:01:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Eric Dumazet <edumazet@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Liang Chen <liangchen.linux@gmail.com>,
	Heng Qi <hengqi@linux.alibaba.com>, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, kvm@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next v5 6/9] virtio-net: assert header sizes
Message-ID: <20261116160026-mutt-send-email-mst@kernel.org>
References: <20261112-v6-7-topic-virtio-net-ptp-v5-0-7ab67b572f4f@pengutronix.de>
 <20261112-v6-7-topic-virtio-net-ptp-v5-6-7ab67b572f4f@pengutronix.de>
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
In-Reply-To: <20261112-v6-7-topic-virtio-net-ptp-v5-6-7ab67b572f4f@pengutronix.de>

On Thu, Nov 12, 2026 at 12:19:38PM +0100, Steffen Trumtrar wrote:
> The header is cast from skb->cb and from device buffers, so its layout
> must not change silently. Add static_asserts for the offset of tstamp,
> the total size, the alignment, and that the header fits into skb->cb.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  include/linux/virtio_net.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index 2abd8a614a23f..e7776a37a486b 100644
> --- a/include/linux/virtio_net.h
> +++ b/include/linux/virtio_net.h
> @@ -29,6 +29,17 @@ struct virtio_net_common_hdr {
>  	__le16 tstamp[4];	/* le64 TAI receive time in ns, 0 if none */
>  };
>  
> +/*
> + * The header is cast from skb->cb and from device buffers, the layout must not
> + * change silently.
> + */
> +static_assert(offsetof(struct virtio_net_common_hdr, tstamp) == 32);
> +static_assert(sizeof(struct virtio_net_common_hdr) ==
> +	      offsetofend(struct virtio_net_common_hdr, tstamp));
> +static_assert(__alignof__(struct virtio_net_common_hdr) == 2);
> +/* virtio_net_common_hdr must fit into skb->cb */
> +static_assert(sizeof(struct virtio_net_common_hdr) <= sizeof_field(struct sk_buff, cb));
> +
>  static inline bool virtio_net_hdr_match_proto(__be16 protocol, __u8 gso_type)
>  {
>  	switch (gso_type & ~VIRTIO_NET_HDR_GSO_ECN) {


Waste of time. We know how to maintain stable UAPIs without this
kind of stuff.

> -- 
> 2.56.0

