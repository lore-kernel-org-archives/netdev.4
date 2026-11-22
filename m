Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384227;
	b=fdTWYvU9oi5daJ2WNOpQpQc3o9R1mJJej/R8wTe8ac21GsWDOHTUF5F1vdSpCu3tdgcF
	 e6axRffe3bfTXLnU7vw8TKH5sK8ozpZ4IB35di79PZw0dXqW3kMn65iNNKC+7OiUNE++I
	 Azu5VlMDhSnV0aWitFIyRG/eDBgJ/gLVMRn/ZNzQmatpuD/7zd321G+s5fcJXY4E0Qr1C
	 V2UKWpkCK7IiQqZjf0aU7/uOoK1HElMECiC/HeG3hhJ7A8ByOTNYUc6+UTf8I4OPVYUsR
	 iRalxhOtYdgXWUzat2FiGdStgEWEbjygcKu9QY9uLPZehOsrwLWMU9/0pcLCEmbgCKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384227;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eGbs1Yuhkxx9FWUw+IvdWa5GoVs3JCcIuL+KJq7lsYc=;
	b=V5oQboteR8ZowsJ/LsuiHzJ5Dw3VCu8YGyEe3Au2OoWS/Y7OwoWHcMmrh54Vv1Wdv6RV
	 LAn3tp6vz3buj4vQqos2Du4GNfgd47E0+8iKLYsMkSiKgxqJfLtuLjAvZo0fPH2mAbBG3
	 9pNCayZd9TJFFvHZV1TMq4Kdkn0SYO40st9xy4O4MDf5TFGvOkdgZLdkn5+SXiPJAmb7C
	 MNwGcRERxXdShHjsZBr29BusTdgV2bkMyuYzGPGlCes5QH5aVpEAufmb7QLa2j1MKzXA4
	 t0lJ5jb/FghSEYQc8729qbOy4DsNDgaCFAjTQvliIUf1wzfiV4bqgxkSxJtrFnzHb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avhUO0ox;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L5n0JvdK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C92606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=avhUO0ox;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L5n0JvdK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795384225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eGbs1Yuhkxx9FWUw+IvdWa5GoVs3JCcIuL+KJq7lsYc=;
	b=avhUO0oxcVPd8T75LoxnkP3691/oc/YoO4TrpY5RrLLzoLMsIBJCECSQjxuF0FDctbxZZa
	R1182VeRYoNS/ntu6i7WuHYkiWXmbBk+6T45/4U58qiN8ipJQnP1p5TIRI4Tt9x5QulLJp
	0sWAM/dyNiYsd4xZ2z2SWchvEtZgwLI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-FnbY87eaPEOxsgTfLNIxSg-1; Sun, 22 Nov 2026 21:50:23 +0000
X-MC-Unique: FnbY87eaPEOxsgTfLNIxSg-1
X-Mimecast-MFC-AGG-ID: FnbY87eaPEOxsgTfLNIxSg_1795384223
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490d2ac331bso2258615f8f.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795384222; x=1795989022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGbs1Yuhkxx9FWUw+IvdWa5GoVs3JCcIuL+KJq7lsYc=;
        b=L5n0JvdKzYL7iR8ASqGCadlbl5yFLwaFbdbMlVswMz5/9dahz1QAOvt7W9NYTl32b8
         dDwaOEEFlgleq8g5tTTIkrTSxNhYTyvHvBuzST1WyqiwVHAPvFeMNqGsCA4ts20AVy07
         gGAv9OXpcaVQ/sZU/EOFG+9pLjpes1S21Vwbl0cyM6MXy1EPpbP1cS2r0KUGD0bomLeS
         BgvoEusM5cOISZuCxpugYSclK7R1scV741O5OYFy/5EOa/ID6UxF8VixePz1ROg+XazC
         dkFdTHUakmFbnGEtK5ayeDAKfnSDVm8y8LoajtgR/DAsjTMartpbusd7P4arK00y/Tl0
         lrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795384222; x=1795989022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGbs1Yuhkxx9FWUw+IvdWa5GoVs3JCcIuL+KJq7lsYc=;
        b=bKE+ntKBF837/P5poOuZxFWH525hKLSssZ8cJZmNltgueTB7TXIgh+rbI/AVKbQV7Z
         +eNiYvo+ZcptNi1kZtsqqqZCg/pFp8vVK52VHPSYBT+AO3EMERx6hidxNwe7phgPgYow
         uP+Oo8vAgffM4cCXsfgZeUckOTluXZF7SHnPHaDMgGzTPPlsJzL3yJSdKdEyLupRRsvh
         xpCt8X+Dto5HbN/UCrG8nT4Y4vWCirdTsqQ/bz1gH9ouRblksHdaBWov5lgo87krtfM4
         AGb7B0EbIvSd0kOgd/hkFIwwXn4/waWu0u5fu3KlUuag0ynh5ecEj612zuDE7SgKy+qA
         Te0w==
X-Gm-Message-State: APuU4Z/Z/Ey3aN035IMWOF+vEIS3ykI2Rd9yFkK8KUsOQlNZU1rTsTQq
	N14xSVTXlgE0gnlc+7HFM3BFJjXyynrOzb4oYHuQ9kmLq0bxMMYYDNs7Ta97t+e2CDuXHGzW5ha
	pTOEd80CWsVq8W1nVhfUTI7f6b4Qj5iLnqurlZPLOehiyR3VRfiB6EJ4GUA==
X-Gm-Gg: AZFdTZdFUM164uDDQucMTMaM7+3ygFa3VYPeSIy8wV4Leq7wf3TPPHtOBbPmesYgEil
	ta+vUBJ6HXYgbVnrb8RL94tXiZYgXDTpr4QFE6L1CxXrm2kl+3fZtaq+bYZeTk/zRDUoZXxtIl2
	SjCHW5wsJLrsmgVGmqkE3aYQXBc9EnUUebKk/NmJPdhQWekZPibG2OEMNqPQ7XfpdpK+QU7ZKSF
	8tO75HVA54eM2Z8GSlidSb1BVjtN9J0FbgSlI6UbHRP8+eD8G9dwxxMp8XFOARSGvRjWav5EH12
	yRfZijtwkUzFA4419KnQA2n0uUkITblDXyyA9sD/OEV7ZzCGQmkzPahtStfvFoXOU1AiyfFZfC/
	SyXsjuT6BHWO1bZSuZ+gHwtmlafetJseeNqY5DWJx
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr9196228f8f.5.1795384222449;
        Sun, 22 Nov 2026 13:50:22 -0800 (PST)
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr9196193f8f.5.1795384221897;
        Sun, 22 Nov 2026 13:50:21 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm17973036f8f.47.2026.11.22.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:50:20 -0800 (PST)
Date: Sun, 22 Nov 2026 16:50:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jianlin Shi <shijianlin11@foxmail.com>
Cc: netdev@vger.kernel.org, virtualization@lists.linux.dev,
	jasowang@redhat.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, talgi@nvidia.com, hengqi@linux.alibaba.com,
	horms@kernel.org
Subject: Re: [PATCH v2 2/2] virtio-net: unwind VQs when irq moderation init
 fails
Message-ID: <20261122165011-mutt-send-email-mst@kernel.org>
References: <cover.1790751008.git.shijianlin11@foxmail.com>
 <20261102155145.23144-1-shijianlin11@foxmail.com>
 <20261102155145.23144-3-shijianlin11@foxmail.com>
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
In-Reply-To: <20261102155145.23144-3-shijianlin11@foxmail.com>

On Mon, Nov 02, 2026 at 11:51:45PM +0800, Jianlin Shi wrote:
> virtnet_probe() calls init_vqs() before virtnet_init_irq_moder().
> When the irq moderation init fails, the error path does "goto
> free", which only reaches free_netdev(): virtio_reset_device() and
> virtnet_del_vqs() are skipped, leaking the virtqueues and their
> DMA mappings.
> 
> Use the existing free_irq_moder label instead, as
> virtnet_create_page_pools() already does on failure.  This is safe
> only after net_dim_init_irq_moder() clears dev->irq_moder on its
> own failure (previous patch); otherwise virtnet_free_irq_moder()
> would net_dim_free_irq_moder() a dangling pointer, dereferencing
> freed memory and freeing it a second time.
> 
> Fixes: dcb67f6a9ead6 ("virtio-net: support dim profile fine-tuning")
> Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/net/virtio_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index dd2c41ef6fbe..d3ad1f1334bb 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -7027,7 +7027,7 @@ static int virtnet_probe(struct virtio_device *vdev)
>  
>  		err = virtnet_init_irq_moder(vi);
>  		if (err)
> -			goto free;
> +			goto free_irq_moder;
>  	}
>  
>  	/* Create page pools for receive queues.
> -- 
> 2.43.0

