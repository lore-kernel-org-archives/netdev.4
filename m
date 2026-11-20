Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194895;
	b=FzpZ+gmYwIyZGZxUX+0wj6Khtea2VQbVUSPlZVzeeTTaSvUYyA7j66ItOPg6qITF6l7t
	 14eY6XGPpVSKZzI5/HjbYovjmZzRZLPs28cRv4NvqGcKpnfNkhzzFhwGCGEcpMXO6G2/i
	 daB3Q0sWxtQWAhr/GjI/735iROqF7xgbjcs7nU55So5eZcmzB+kGOk1rn43D6tqyYhV2I
	 l7zTST4jdfmBY0gDmvHcj6Uv/Fy4Yxc/cXyY6lxib4zBeSEUgL2IGA+B0DX6fCoJeT86R
	 ukHudwMxdva/eayGltGLbtsbXQx75wqSnE/r5+fohUEqfmsqvm52tp/JyLnavrABFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
	b=M2v+3sdTrzZMQdQyp/RVKPx8iWtKgWlYDPIRR2v9HIb0iozBgaTLsfKvvMjgdVZ9VMvg
	 LW10orGzMGwz0ERgcEdOyMxP6EGMQ9ICT/U+vZZYL9bLJWD+eko02nNqhCERpGaOgLPRF
	 pIa2Zv6Et+uvDFq4D3Y/ESb8hQmd6yvtXitP8AxMJ4P8JHhKVAR0Lj34HTBh0K6vNnmr3
	 4XCxyBhq0E5QQWsGg2kWhb808cbfghBIBklbCEWmC3MmFkjICugeVWlnyta7TwOeIQdYn
	 5A+qXjaTOOCs5GSl993cgWEiT5jnf/Kh4RgiaYJ743Z5QL5rNXroZh8AHv9xPllnazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5JzbllR;
	arc=none smtp.remote-ip=74.125.230.195
Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E6606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5E6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5JzbllR
Received: by mail-qk2-f3.google.com with SMTP id d75a77b69052e-536403312b1so5222821cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194894; x=1795799694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
        b=h5JzbllRY3FFd7SIlh0QHu3I3pNyf2yBnW2eYr8i9y2WY8PUKpO6C0LnWiy/0p0xH9
         Efz3vuIykc6aRoNZE3Ar6sFTIWmBCvtC6CWCwJu2ipXHHsgbLsUhDIWVqKO5P/9SVZLK
         IEZDUKZFV79jb8XUORh13uLelSXXNTemAw1RfDRIJh4C4RmqHr94Aw1JHoU4EtWxjeM3
         RbZJp4jfvF55Q1A+Ix1ERuQ8Iyp8iv0qki41OhjQ3wNcd1Uk8XX50JJyTil6lCuvX94K
         zasNhD4NETRKK/ruAOeeFZKNgz5N2pOn6TxPQDJWzHWaB+ZwXPwPfFXSnFrc9ccFzUoI
         6DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194894; x=1795799694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkHPVV5puI4vDTHgviLsfMcYaMRsroW0UN+lwZ6xwNI=;
        b=SxgkYMRfeDyns0LGk+n5YtDw2OxyRFb0L4b5G8xks/J2iLcqMkrolSp/k4pPVlJZ2r
         ry6GrxK5BJ2A2U3+9JFRynKdvdjPREJN/5RfD+rAp/BeTq9oRrHH8f8MPJPsVsTgvw1l
         /2BNArLDLP/eHPGsxhZ3AkDibBWXi4eBuf7zBntWNUpt9nwxDQpFQXveaGCKk/O2mB2F
         4qxq8V1qw5ol+eY/OoxAojHcEdCdkV/WpKRZ5VmTtz78CRBpae0wl365/ynqLkHMOBll
         jdfr1O1paWaP670XuSVKw7Qn8zbJffqYOPYzcdg/DzYYTsd4TuTKgMuHsY8b1XFg3hrk
         XkHQ==
X-Forwarded-Encrypted: i=1; AL+hErHZEZNuEkdeoN0/Xhqg+WvVm0SNOPalzucNjoPsQkr2EJHc8ZfP8a5VgJUmAhSAeWB38P8JRDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z95h64f8BebITN9wDOk29hM5Z+Nt63+mVLk+P+6qvOVXsMRyktp
	0YigB45UJjZl+Ga8CzgTFEQGGSYKdfG0terUml+JWqKQoQW9IwvGQqUM
X-Gm-Gg: AYBFou2syT8tHilUcjrpe8g77pkeAtDYPxql77GZ4O9g5y9CUbctHRPUgbPQbl1iwu+
	SrGdKovnY5o2QVZsUFosbHacqD18K/F78vz81TOlfLXHXET8dGuxMFMg0aqf0JI7932dhO4nV02
	pf+rP45p+RYaFJBkGv/GdaVpjTRbnb1Rqj3+hNqbHEbL+5lgobvCXX6SjZwMSE3Q1qFxwjzD6E9
	lYI46WASUOhMldSbQ8jWNJw9waT/JD6tmLI1nx5GGU+QwGpqFMgYaxXcOpVMKTzj23RER+zUO5o
	MXuvqK7o2CltIeY0Xpsf4lGYWkf1zyAOwjsXxO5Ecpf/ZXTvnGlTfT33NzmgwQ+4Vji+LK1pvKU
	j4II4yZFuOd362VIXywwIabO+zCKMzqLrFNZW44kVPkVez1T0FP7HJNogroFhIqjdGfr16bARZI
	f0EV18N4bVYR9rD0Z8+Hnd/mWu7rSaAJIoLVBPQ9QLmQ9vVmUjFqun68OMplnLtBFYmk7Nz6PIi
	K+D2zndzfuos9DZnKh8uuevSTLeRFxnsjYrSEeSb8JTIPEH3qK6R1EK/uWgUgYlaFmHVmZMyUIo
	vByZLTBhikGfIZlab5JFgbM=
X-Received: by 2002:ac8:5f0b:0:b0:54b:5cc6:6036 with SMTP id d75a77b69052e-55d76afed61mr72126961cf.58.1795194893996;
        Fri, 20 Nov 2026 09:14:53 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm27280191cf.4.2026.11.20.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:14:53 -0800 (PST)
Date: Fri, 20 Nov 2026 09:14:49 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Mina Almasry <almasrymina@google.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Wei <dw@davidwei.uk>, Erfan Sharafzadeh <erfansh@meta.com>, 
	Gal Pressman <gal@nvidia.com>, Jacob Keller <Jacob.e.keller@intel.com>, 
	Kaifeng Wang <kaifengw@google.com>, Leon Romanovsky <leon@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, William Tu <witu@nvidia.com>
Subject: Re: [PATCH net-next V2 00/13] net/mlx5e: Add netdev support for data
 direct
Message-ID: <awB_rJxrIDQ3u-73@devvm16445.scu0.facebook.com>
References: <20261110183826.2927274-1-tariqt@nvidia.com>
 <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
 <CAHS8izMhSVabXgMmNbHHLm8cYqW_EVQbpXME2z_tUEJuN2BTnA@mail.gmail.com>
 <0a1be802-1c53-46ff-a08c-614c3a2d6f41@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a1be802-1c53-46ff-a08c-614c3a2d6f41@nvidia.com>

On 11/20, Dragos Tatulea wrote:
> On 20.11.26 17:38, Mina Almasry wrote:
> > On Fri, Nov 20, 2026 at 6:39 AM Dragos Tatulea <dtatulea@nvidia.com> wrote:
> >>
> >> Hi all,
> >>
> >> On 10.11.26 19:38, Tariq Toukan wrote:
> >> [...]
> >>>
> >>>  .../ethernet/mellanox/mlx5/core/data_direct.c |   9 +-
> >>>  drivers/net/ethernet/mellanox/mlx5/core/en.h  |  14 +
> >>>  .../ethernet/mellanox/mlx5/core/en/params.c   |  18 +-
> >>>  .../ethernet/mellanox/mlx5/core/en/params.h   |   2 +
> >>>  .../mellanox/mlx5/core/en/reporter_rx.c       |   1 +
> >>>  .../mellanox/mlx5/core/en/reporter_tx.c       |   1 +
> >>>  .../ethernet/mellanox/mlx5/core/en_common.c   |  38 ++-
> >>>  .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  67 +++++
> >>>  .../net/ethernet/mellanox/mlx5/core/en_main.c | 253 +++++++++++++++++-
> >>>  .../net/ethernet/mellanox/mlx5/core/en_rx.c   |  33 +--
> >>>  .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   4 +-
> >>>  .../net/ethernet/mellanox/mlx5/core/main.c    |   1 +
> >>>  include/linux/mlx5/driver.h                   |   1 +
> >>>  include/net/netdev_queues.h                   |   1 +
> >>>  include/net/netmem.h                          |  24 ++
> >>>  net/core/devmem.c                             |  85 ++++++
> >>>  net/core/devmem.h                             |   6 +
> >>>  net/core/netdev_queues.c                      |  51 ++++
> >> While working on V3 I realized that keeping the core part in
> >> this series is not the best approach. Initially it made sense
> >> because the change was small.
> >>
> >> I think I should re-spin it in a separate series with netdevsim
> >> based selftests for the new APIs. I would base it on Mina's devmem
> >> leased queues unregister [1].
> >>
> >> Any reason not to?
> >>
> > 
> > I honestly wanted to comment that you should base it on the leased
> > queues series from me but didn't want to be annoying, especially
> > because I made you wait for the previous series.
> >
> I realized that quite a few changes were needed after your series
> so I decided to base it on it.
> 
> > My series creates binding->bind_dev, and binding->map_dev, and core
> > will (should) handle things correctly across both devices. This seems
> > perfect for you, because you have a bind device and a separate map
> > device and their lifetime is different.
> > 
> In my series I am actually skipping leased rx queues in
> net_devmem_unbind_dma_dev() because we need some kind of notification
> mechanism + netkit implementation. I think this should be added later
> if there is a usecase. For now mlx5 simply doesn't support the combo.
> 
> One note on net_devmem_unbind_dmabuf(). Posting it here as I don't
> find the right place to mention in your series:
> 
> @@ -234,8 +234,17 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>                                 busy = true;
>                 }
>  
> -               if (binding->direction == DMA_FROM_DEVICE && !busy)
> +               if (binding->direction == DMA_FROM_DEVICE && !busy) {
> +                       struct net_device *map_dev = NULL;
> +                       netdevice_tracker dev_tracker;
> +
> +                       /* Leased queue: attachment readers hold map_dev's lock. */
> +                       if (READ_ONCE(binding->map_dev) != binding->bind_dev)
> +                               map_dev = net_devmem_lock_dev(&binding->map_dev,
> +                                                             &dev_tracker);
>                         net_devmem_dmabuf_binding_unmap(binding);
> +                       net_devmem_unlock_dev(map_dev, &dev_tracker);
> +               }
>                 WRITE_ONCE(binding->bind_dev, NULL);
>         }
> 
> map_dev devmem lock is taken to prevent use after free in
> netdev_has_dmabuf_binding() when called in parallel with
> net_devmem_unbind_dmabuf(). As this can happen in my series I added it
> there.
> 
> Waiting for feedback from Stan/Jakub/Paolo for a few more hours and
> will post the series tomorrow.

More and more workloads are moving into ns/netkit setup on our side,
so it would be nice to have netkit support as well. We can start with
what you have so you're not blocked for too long, but we do want the
netkit portion as well :-)
