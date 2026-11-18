Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983614;
	b=WeqfAJ7AgRMZxh1sqEoV2X9mVhYKSPkwosixj9Wp90Pds2URXyBxzcz7AxHmkhu0I1o1
	 +QkUBn2BF5NSg8//tNhTZaAUg9lVQwndqFhXkH1hqVH+UlaIwGZ4vZU9sy5A+rP7poqXy
	 1+gS42G9UT6N7WXOrIdDwWN7VwSlA4ho83+pJdfUx4b7KnbRMo+2ExhSaEyLpQi6qZA/r
	 N8zyzDtJm4pSaNuAoSB9RfKup+CCThNqKuprmCXqiyFGIcSrtn+loQoCABKXnk2GRvL5U
	 erAMvY1mFVu/XjFv6QQ/ohSqnliWyekTw9UfcgFqZroJOO2LWwnHi8l6CQcFW8SkOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983614;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jm9UtSkj5qTjc2aQp3GV2uLJyBITV/apzUIo7FVG7gI=;
	b=QPkA9ag/Mc0fgLiy9JPNQqzYcd2irvqVAWfyNGe0kSz/u6oWKB0dZgtREbULJJj1lguv
	 FmKSigS2c///U+q34LHEKAZZZ1ug8DNCGJob/kFMVjI6CjdN5mTUHLO69VjCKs27BAZKw
	 Cj7CxgImOs4QwWiJnjeGH1cm1V5F++FUrUsdLkCioKuVwt+DiostRwp0E8f/NVpTN3VXA
	 nqD9h3p+vg3yKFme/HRrvljgHVvg1yNPZsozW3nlGQL0XL8hhxSR4QB4/PrNh/kTC/YRJ
	 I9/Icaa9d8VK0aSsGB3v9BtQE4HYVRSDCIvkhLOwBpA5E1U9Vij+4RVF3qRyP9uOnvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ivQghRHa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fp4fJ3jX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34932606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34932606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ivQghRHa;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fp4fJ3jX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794983613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jm9UtSkj5qTjc2aQp3GV2uLJyBITV/apzUIo7FVG7gI=;
	b=ivQghRHa7aHXycTCAk13nbpBx5z3W1dNgH+vQvlGMON2X+QF8CBPBJYbgBV97RbUwDRtir
	exKvSiGE3g88NUClB4MN3HXn5hqkE0eHVgrayFvP8p0bUp39vPsN01tn3Pl+j+4cRTPjmT
	esvnfSTamqwBk1Sndn3g4AOGQaE90ak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ysQLyFGJOa2GOFtgviWMEQ-1; Wed, 18 Nov 2026 01:33:31 -0500
X-MC-Unique: ysQLyFGJOa2GOFtgviWMEQ-1
X-Mimecast-MFC-AGG-ID: ysQLyFGJOa2GOFtgviWMEQ_1794983610
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso5145855e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794983610; x=1795588410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jm9UtSkj5qTjc2aQp3GV2uLJyBITV/apzUIo7FVG7gI=;
        b=Fp4fJ3jX8fL3RkP2MYtSO/q5wVOjCaqut2mwdt3VSNCGIWBmalQYnQEsH/v/Wp7w36
         ppoCCpu6jqoQWcmpIKe6gsQnZUMBvAzBMk+W71ojaWP9ncG6lGw10PhcK8nDDi9gcukU
         8Xce9Ujz27J7Nr2MYnUTyRls4WOCxuIfejnwF+RLNtpsMWAjeDrWOXEfombtByHcmuAc
         O52cL4ND9OMyLIYVc5jvbt1NjWIeAjHn2noPkhTb+vstAcWbNJypjGOPXDNkxhVCbL4I
         /OU8BKWNVeCeLR44YJJsrBPcx7A7FoNv+frcRCsKviZfdVJBvdyooV1r7cUcUUNE/ycW
         7zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983610; x=1795588410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jm9UtSkj5qTjc2aQp3GV2uLJyBITV/apzUIo7FVG7gI=;
        b=mmpCNQckcqWRlVw+c5TFXvQVBMItCWrPQGktB6x7owGZD3lwHgelE7Sb1uDektQ5qV
         IFWUzWRzN5mvY0AiiCf2oU5MS5nNQrsj8zMkZdQJHE68VmLwuVXPA3hpf9yHjE/lIufh
         9JHIUSzNwPALhMgUGANlAZlcOPX49DhubBvcnTfURktrXoOCmEeU0YiL5P/xrBA2MdiP
         2+MDcegkSy9nX56Hf5aAZeyKn2IQe0AAqiFiv0H3hdEnyUzhzNyPFzRq92qBqzKNXdhm
         ReQ6WSCTgxNAxV7xppmKY1LdcMZ1bPZSjfVHyzgP7uVNv4A22VGPDkuGHN7A/IG5AyUi
         LhBg==
X-Forwarded-Encrypted: i=1; AL+hErGQfq7JT/tBWbRFpGs74agZnvugEinY3NK5r0wBhkItv/8glbPl9gKcv88Joupqmktgt9tLUa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A7O3RrJeYioEgMDAi0siRQe2jUlIREdl4mosH3CYV4txDB1mz
	D6z4HvEqsyqp5CarTzVnWRIkr0j8JFs7+HZ393Sxd3m+Ro8AaBdxAqZvGUbQImXp53TEY8JKuOd
	LGBfKQ2USxCn1NL1m+LzhY163OKtDir84zq5shlZ4wlKWqYjEzpA0BawgIA==
X-Gm-Gg: AZFdTZe1VcRLIvFC+qO/u5Ckl70//Hy3i/yxCA8+8LjW9+4y21y9LrUbGzfROmGvcYJ
	fIadYfWkKpsvll0jnCTw7ApDq0rKlOQK983FTQwS6MV15Yyxut0YsU672lMzS2gQBapOjHc9HL8
	B8aN8gynhsBukhEIYUjWlMYQSszn/Kl5RfuaxKdfzMZRG5mM5CA2+2FXlb8xwYkH4wD+pPPc+LL
	WFrLHLs5zncgIBdzD6FDlEsVak1v4gNSMxnpFb20v9CcgAFkLBnEcKaGDWUSXEpvDH+f7Dk1Uma
	mQSqfcEjnJ1JEYG4EhDVCNJSr8WTcwACLP1EcP2AXvNFDsNqLMKn92fg34/PeEaeznoUsQBHW97
	sLtYASbNqGm4Aq3avpc5JDPHlrV2z82tZ58zZhqvSzEA=
X-Received: by 2002:a5d:5d0d:0:b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4a7963080e7mr331959f8f.47.1794983610345;
        Tue, 17 Nov 2026 22:33:30 -0800 (PST)
X-Received: by 2002:a5d:5d0d:0:b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4a7963080e7mr331922f8f.47.1794983609777;
        Tue, 17 Nov 2026 22:33:29 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm2935743f8f.21.2026.11.17.22.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:33:28 -0800 (PST)
Date: Wed, 18 Nov 2026 01:33:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Asias He <asias@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vhost/vsock: annotate lockless accesses to guest_cid
Message-ID: <20261118012321-mutt-send-email-mst@kernel.org>
References: <20261117164916.2332953-1-phind.uet@gmail.com>
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
In-Reply-To: <20261117164916.2332953-1-phind.uet@gmail.com>

On Wed, Nov 18, 2026 at 12:48:43AM +0800, Nguyen Dinh Phi wrote:
> vhost_vsock.guest_cid is written by vhost_vsock_set_cid() under
> vhost_vsock_mutex, but It is also read without that mutex in
> vhost_vsock_handle_tx_kick(), and vhost_vsock_get().
> 
> KCSAN will report data-race if we issue VHOST_VSOCK_SET_GUEST_CID
> ioctl while the device has TX traffic. For example:
> 
>  write to 0xffff88810f1596ac of 4 bytes by task 7914 on cpu 1:
>    vhost_vsock_dev_ioctl+0x25f/0x720
>    __x64_sys_ioctl+0xc2/0x110
>    x64_sys_call+0x299/0x20a0
>    do_syscall_64+0xc9/0x510
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
>   read to 0xffff88810f1596ac of 4 bytes by task 7910 on cpu 3:
>    vhost_vsock_handle_tx_kick+0x41b/0x740
>    vhost_run_work_list+0x97/0xc0
>    vhost_task_fn+0x98/0x1f0
>    ret_from_fork+0x2e2/0x3c0
>    ret_from_fork_asm+0x1a/0x30
> 
>   value changed: 0x0000004d -> 0x00000032
> 
> Both readers load the CID once and works correctly with either the
> old or the new value.
> 
> Mark the store with WRITE_ONCE() and the two lockless loads with
> READ_ONCE(), so KCSAN knows the race is intentional.

You make it sounds like it is just KCSAN false positive.
Is it?
if yes, this should be data_race. If no, document why.



> 
> Fixes: 433fc58e6bf2 ("VSOCK: Introduce vhost_vsock.ko")
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
>  drivers/vhost/vsock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 88a310390eb0..f26c59013075 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -78,7 +78,7 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_cid, struct net *net)
>  
>  	hash_for_each_possible_rcu(vhost_vsock_hash, vsock, hash, guest_cid,
>  				   lockdep_is_held(&vhost_vsock_mutex)) {
> -		u32 other_cid = vsock->guest_cid;
> +		u32 other_cid = READ_ONCE(vsock->guest_cid);
>  
>  		/* Skip instances that have no CID yet */
>  		if (other_cid == 0)
> @@ -572,7 +572,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  		hdr = virtio_vsock_hdr(skb);
>  
>  		/* Only accept correctly addressed packets */
> -		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
> +		if (le64_to_cpu(hdr->src_cid) == READ_ONCE(vsock->guest_cid) &&
>  		    le64_to_cpu(hdr->dst_cid) ==
>  		    vhost_transport_get_local_cid())
>  			virtio_transport_recv_pkt(&vhost_transport, skb,

Will prevent compiler from hoisting the reads out of the loops.
Does it matter?


> @@ -859,7 +859,7 @@ static int vhost_vsock_set_cid(struct vhost_vsock *vsock, u64 guest_cid)
>  	if (vsock->guest_cid)
>  		hash_del_rcu(&vsock->hash);
>  
> -	vsock->guest_cid = guest_cid;
> +	WRITE_ONCE(vsock->guest_cid, guest_cid);
>  	hash_add_rcu(vhost_vsock_hash, &vsock->hash, vsock->guest_cid);
>  	mutex_unlock(&vhost_vsock_mutex);
>  
> -- 
> 2.53.0

