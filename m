Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129151;
	b=SdaOWzKiGyy7tVtUShTma9YJmfJgt6E5/2wZ8NvEsy5H+gVq8a789VSOFwI7dF038nB3
	 cgl1hzIbSDxfSSS8J3w1m/qf5NYWBj/MAPtejFUECpuN50Xkyx7gt1HZrfIByLOPEwebV
	 kyP8Zsyf2/LkHYm1kAG+TfXUnMBL2d4mTbBEd7+v9aO2DlWSkIWgpxCxYD1ZeJS9Czd+o
	 Hy4ez8QPv+e4liKPE/pnXZfW2GXHod7SCG+7T8EBQgjQVow5yx5DpJUGQjGYBN6mqTZ7u
	 u2nqtmz2jC1+SdXVSYc0dP9MFmfJGFLJWEPwzcVfpeIEwGb3yw6hsmVrED+H1JDb4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X33xQ79Q3sAPrSsIWHfJ2vy/Yc9AnxiTMwHndBcciU8=;
	b=jwPXDIH9CXJ7vByRbRXTWkAeldefaLNPcATaOAefRsEBtXE6M9BAqAxoa20FrNOCJ347
	 YaOtrswCcnO7wEyx7l/XlnQa37Ans0lXjb9GGFilIv8dWwh/YjXLUxV4wVAUXiwv3KYCV
	 tzpq/4f19dW7HpPP0+uYuoZoziGprmEGSTLP+HKjHPuS9Pgy74GGygLspVAZ0d58XZVvq
	 ZwKbe9eNrcMOhYCBvJPrgqy2EyX09pLP2z8ONVRCxfEcroGKs1AgfPSnCai/GSGZSiVX6
	 HzCemnTwkIZOZQdRqjziVYnUW0ogQIrMz1m7HCIT+YZ6nTpDWChcd4jeGvqdQ1LmT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=valzTcqs;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D853606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D853606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=valzTcqs
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9212aaefc11so3760996d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795129149; x=1795733949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X33xQ79Q3sAPrSsIWHfJ2vy/Yc9AnxiTMwHndBcciU8=;
        b=valzTcqsJ7RvV3PWpkJUoMkgKqdtPM37jB3OlNlElSHPhP6jDryhok2z0pR9E4vmcu
         CXIDiAP2AqlUY01qMDokeJcYMtmqcmGASBQ9TBH2ZTL9J7eqe9Y+00nsw7pZxNPYPSCa
         F/RdIME5fSa1+vU/D/b4QfhI8ayHlS2X40eNMme1WGDrXN55ZQ+YVI0961ohw3V0a/Em
         +IJkd1K8aJWfNk+C8Am4np0L5UwYMFxmzhSCgG/gWD2C6HZulWiSbLzUqdaLt6jhLkTt
         aF+dbuyHaM6KC6be0SbRUxVSa6UpwpgTKlaQ8pBGwOHUMT4DgB9ThdjTzdJriBbQtZKo
         9RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129149; x=1795733949;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X33xQ79Q3sAPrSsIWHfJ2vy/Yc9AnxiTMwHndBcciU8=;
        b=M+RjAFs7qRWJUe7sYY3OidwimY0mRVkujFpdaTBL6nVVWtlA5IRUAFr6sGu2nGIG4D
         oL30kM+DfjzgPXTwi5oaFlfeRbdQ7rD5K81in3czKAQi7Bd6PLdngD736o7QmYr446ko
         JZO011I9RdZdGwAqzpin1k7TJp8YvngsVZO9h6Z3cXLc6oczG8t2VKgMClFUgUSY1o3J
         E/TMA2bh9zJske3TNasez++aEf0+JQx/wRGfL9tNiJGO3ILMILoxz9cn1xXPNfDHHwXX
         URTXYjZi2mp8kYURAN+PWzIeugPCaGFAqjj7zeGcw3FwmfiWAZJ+nfug9EQhj0omKMuh
         jxqQ==
X-Gm-Message-State: APuU4Z9/AnSTRXEcFA5y6eJfXdZ0blNZGLtuI9Syh8ZUw6GrypzxFq3+
	o+hqAuyzoRAo7AKa1YsAnpLwRhjfSAg0nr2YFt1iskWWH9/7ToBNnHHU
X-Gm-Gg: AYBFou3ve8s1q+K46hQhcpD+8VJ0cpCUpOQsGVt6OIVmwl3qgZhmKmAZuxIFXbqwH4e
	eR+c5NiWXeN040Uyzb72jC2yR+v0J+UhtCcp/qeTTK/k4rnjd7g+kE/GypAK164CsZ9VdXkQXf5
	eU30YPOmsjKRurtK8zo67/FRUR4N0ZBfEiz3isk7H30rmuGWVHWkjTtjkXU4mU6GJo1EtPfCtLG
	8MQ2YM/q3jyoO1/3O+nL8w79Ej1uklXL+YP6+9eTTRqU5CsV+4+2/0us+QJ3MnIG8xPm17nwFST
	4TIkZWyLlh/Poo5QtDIZtrEZQ5q/ih2/1odm8peWJJu7grlqHsTO206j4N7umNZKg2t9e87KipY
	beTfPeV/zxuq39cYV51VonrSUytsmk/jxenDPd4YbA1rsMeeMYiV8HyBSAclezH8ycdYSHqdVCo
	whdnlhiLgd0Amw/ZzAQqoxXtgZhQqqWlwKssmClOQSmatjq0d3c7xumvod/EoiWNIINgBRm3t4x
	4T2gsb6tTQUPyPyu1D+zmYJvCthSSJ4U31Rijk53Xh9MwIOX+vqjcVwPnBEpe3Amq/XPZ3hRu+M
	ACnRmWrpuxJPhBQeov4uq7JfdWX/tII/tN2XWzo4mT2lGj0W2nj1Lo2cdW2LdNn+tu8TQ+juPSV
	iiyQcBz+kz9R7l+e3zwjpHaNNlGo9wx45aLS5+kBWHAtDodayWa8VKknK0rOLSGw=
X-Received: by 2002:ac8:5d08:0:b0:55d:2caf:ae85 with SMTP id d75a77b69052e-55d76a1e921mr25459981cf.18.1795129149061;
        Thu, 19 Nov 2026 14:59:09 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796329sm10045486d6.2.2026.11.19.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:59:08 -0800 (PST)
Date: Thu, 19 Nov 2026 17:59:08 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 michael.chan@broadcom.com, 
 manishc@marvell.com, 
 joshwash@google.com, 
 hramamurthy@google.com, 
 tariqt@nvidia.com, 
 saeedm@nvidia.com, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 sdf@fomichev.me, 
 willemb@google.com, 
 przemyslaw.kitszel@intel.com, 
 bpf@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.7756e60d4e06@gmail.com>
In-Reply-To: <20261118232315.3593731-4-kuba@kernel.org>
References: <20261118232315.3593731-1-kuba@kernel.org>
 <20261118232315.3593731-4-kuba@kernel.org>
Subject: Re: [PATCH net-next 3/8] net: state the "XDP excludes HW-GRO" rule in
 the core
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> XDP has to see the frames as the wire delivered them, so HW-GRO must be
> off while a program is attached. Drivers currently open-code that policy,
> and they diverge: mlx5, gve and virtio_net refuse the attach, bnxt and
> qede clear the feature from ndo_fix_features(), and idpf does nothing
> at all and happily runs RSC under XDP.
> 
> Clear HW-GRO in __netdev_update_features(), and make sure XDP setup
> paths refresh the features.
> 
> Take extra care to make sure the disablement actually works, some
> drivers add the feature back in ndo_fix_features, even when removed
> from wanted features (mlx5 does for header-data-split).
> 
> This change also removes the warn-only check dev_disable_gro_hw()
> performed. On mlx5 with tcp-data-split on, attaching a multi-buf
> generic XDP program reached generic_xdp_install(), whose
> dev_disable_gro_hw() cleared wanted_features, recomputed, saw
> mlx5e_fix_features() put NETIF_F_GRO_HW straight back, and splatted:
> 
>   ------------[ cut here ]------------
>   netdevice: eth0: failed to disable GRO_HW!
>   WARNING: net/core/dev.c:1880 at generic_xdp_install+0x135/0x190, CPU#53: ip/667
>   RIP: 0010:generic_xdp_install+0x17a/0x190
>   Call Trace:
>    <TASK>
>    dev_xdp_install+0x2aa/0x380
>    dev_xdp_attach+0x41f/0x460
>    dev_change_xdp_fd+0xbb/0x110
>    do_setlink+0xfb9/0x1030
>    rtnl_newlink+0x9f5/0xaf0
>    rtnetlink_rcv_msg+0x442/0x490
>    netlink_rcv_skb+0x16a/0x1a0
>    netlink_unicast+0x1fc/0x320
>    netlink_sendmsg+0x2d6/0x380
> 
> and then attached anyway, leaving XDP looking at coalesced frames.
> The device also lost the bit from wanted_features for good, so HW-GRO
> never came back after detach - on mlx5 that took header-data split
> with it, and with it devmem and io_uring zero-copy Rx.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../networking/net_cachelines/net_device.rst  |  1 +
>  include/linux/netdevice.h                     |  6 ++
>  net/core/dev.c                                | 97 ++++++++++++++-----
>  3 files changed, 81 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
> index 7620d3fcb8dc..25cf02a184ec 100644
> --- a/Documentation/networking/net_cachelines/net_device.rst
> +++ b/Documentation/networking/net_cachelines/net_device.rst
> @@ -169,6 +169,7 @@ unsigned_long:1                     see_all_hwtstamp_requests
>  unsigned_long:1                     change_proto_down
>  unsigned_long:1                     netns_immutable
>  unsigned_long:1                     fcoe_mtu
> +unsigned_long:1                     xdp_pending
>  unsigned_long:1                     xdp_from_upper
>  struct list_head                    net_notifier_list
>  struct macsec_ops*                  macsec_ops
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 0325c6f2a7d1..049538b13e61 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -2531,6 +2531,12 @@ struct net_device {
>  	unsigned long		change_proto_down:1;
>  	unsigned long		netns_immutable:1;
>  	unsigned long		fcoe_mtu:1;
> +	/**
> +	 * @xdp_pending: an XDP program is being installed, but is not in
> +	 *	@xdp_state yet. Most users should access it implicitly via
> +	 *	helpers like dev_xdp_prog_count(), rather than directly.
> +	 */
> +	unsigned long		xdp_pending:1;
>  	/**
>  	 * @xdp_from_upper: the program in @xdp_state was installed by an
>  	 *	upper device with netif_xdp_propagate(); it belongs to the
> diff --git a/net/core/dev.c b/net/core/dev.c
> index d88af07aea29..c0bb5eb9fdea 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -1901,23 +1901,6 @@ void netif_disable_lro(struct net_device *dev)
>  	}
>  }
>  
> -/**
> - *	dev_disable_gro_hw - disable HW Generic Receive Offload on a device
> - *	@dev: device
> - *
> - *	Disable HW Generic Receive Offload (GRO_HW) on a net device.  Must be
> - *	called under RTNL.  This is needed if Generic XDP is installed on
> - *	the device.
> - */
> -static void dev_disable_gro_hw(struct net_device *dev)
> -{
> -	dev->wanted_features &= ~NETIF_F_GRO_HW;
> -	netdev_update_features(dev);
> -
> -	if (unlikely(dev->features & NETIF_F_GRO_HW))
> -		netdev_WARN(dev, "failed to disable GRO_HW!\n");
> -}
> -
>  const char *netdev_cmd_to_name(enum netdev_cmd cmd)
>  {
>  #define N(val) 						\
> @@ -6652,7 +6635,6 @@ static int generic_xdp_install(struct net_device *dev, struct netdev_bpf *xdp)
>  		} else if (new && !old) {
>  			static_branch_inc(&generic_xdp_needed_key);
>  			netif_disable_lro(dev);
> -			dev_disable_gro_hw(dev);
>  		}
>  		break;
>  
> @@ -10571,7 +10553,7 @@ u8 dev_xdp_prog_count(struct net_device *dev)
>  	for (i = 0; i < __MAX_XDP_MODE; i++)
>  		if (dev->xdp_state[i].prog || dev->xdp_state[i].link)
>  			count++;
> -	return count;
> +	return count ?: !!dev->xdp_pending;
>  }
>  EXPORT_SYMBOL_GPL(dev_xdp_prog_count);
>  
> @@ -10612,6 +10594,32 @@ static void dev_xdp_set_prog(struct net_device *dev, enum bpf_xdp_mode mode,
>  	dev->xdp_state[mode].prog = prog;
>  }
>  
> +/* Try to clear HW-GRO before the driver reconfigures for XDP.
> + * Driver may add features back in via ndo_fix_features(), due to feature
> + * dependencies. In that case we can't run XDP at all.
> + */
> +static int dev_xdp_clear_rx_agg(struct net_device *dev,
> +				struct netlink_ext_ack *extack)
> +{
> +	if (!(dev->features & NETIF_F_GRO_HW))
> +		return 0;
> +	if (!(dev->hw_features & NETIF_F_GRO_HW)) {
> +		NL_SET_ERR_MSG(extack,
> +			       "unable to disable HW-GRO, fixed on");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	netdev_update_features(dev);
> +
> +	if (dev->features & NETIF_F_GRO_HW) {
> +		NL_SET_ERR_MSG(extack,
> +			       "unable to disable HW-GRO, required by another feature");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
>  {
>  	struct bpf_prog *old_prog;
> @@ -10645,11 +10653,17 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
>  				       "unable to propagate XDP to device using memory provider");
>  			return -EBUSY;
>  		}
> +
> +		dev->xdp_pending = 1;
> +
> +		err = dev_xdp_clear_rx_agg(dev, bpf->extack);
> +		if (err)
> +			goto err_clear_pending;
>  	}
>  
>  	err = dev->netdev_ops->ndo_bpf(dev, bpf);
>  	if (err)
> -		return err;
> +		goto err_clear_pending;
>  	if (bpf->prog)
>  		bpf_prog_inc(bpf->prog);
>  
> @@ -10662,11 +10676,22 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
>  	old_prog = dev_xdp_prog(dev, XDP_MODE_DRV);
>  	bpf_prog_change_xdp(old_prog, bpf->prog);
>  	dev_xdp_set_prog(dev, XDP_MODE_DRV, bpf->prog);
> +	dev->xdp_pending = 0;
>  	dev->xdp_from_upper = !!bpf->prog;
> -	if (old_prog)
> +
> +	if (old_prog) {
>  		bpf_prog_put(old_prog);
> +		/* The last program is gone, HW-GRO may be available again */
> +		if (!bpf->prog)
> +			netdev_update_features(dev);
> +	}
>  
>  	return 0;
> +
> +err_clear_pending:
> +	dev->xdp_pending = 0;
> +	netdev_update_features(dev);
> +	return err;
>  }
>  EXPORT_SYMBOL_GPL(netif_xdp_propagate);
>  
> @@ -10875,19 +10900,36 @@ static int dev_xdp_attach(struct net_device *dev, struct netlink_ext_ack *extack
>  			return -EOPNOTSUPP;
>  		}
>  
> +		if (new_prog) {
> +			dev->xdp_pending = 1;
> +			err = dev_xdp_clear_rx_agg(dev, extack);
> +			if (err)
> +				goto err_clear_pending;
> +		}
> +
>  		err = dev_xdp_install(dev, mode, bpf_op, extack, flags, new_prog);
>  		if (err)
> -			return err;
> +			goto err_clear_pending;
>  	}
>  
>  	if (link)
>  		dev_xdp_set_link(dev, mode, link);
>  	else
>  		dev_xdp_set_prog(dev, mode, new_prog);
> -	if (cur_prog)
> +	dev->xdp_pending = 0;
> +	if (cur_prog) {
>  		bpf_prog_put(cur_prog);
> +		/* The last program is gone, HW-GRO may be available again */
> +		if (!new_prog)
> +			netdev_update_features(dev);
> +	}
>  
>  	return 0;
> +
> +err_clear_pending:
> +	dev->xdp_pending = 0;
> +	netdev_update_features(dev);
> +	return err;
>  }
>  
>  static int dev_xdp_attach_link(struct net_device *dev,
> @@ -10913,6 +10955,7 @@ static int dev_xdp_detach_link(struct net_device *dev,
>  	bpf_op = dev_xdp_bpf_op(dev, mode);
>  	WARN_ON(dev_xdp_install(dev, mode, bpf_op, NULL, 0, NULL));
>  	dev_xdp_set_link(dev, mode, NULL);
> +	netdev_update_features(dev);
>  	return 0;
>  }
>  
> @@ -11385,6 +11428,14 @@ int __netdev_update_features(struct net_device *dev)
>  
>  	features = netdev_get_wanted_features(dev);
>  
> +	/* GRO_HW may be added back in via ndo_fix_features e.g. if driver needs
> +	 * it to honor the HDS config, clear it before the fix features call.
> +	 */
> +	if ((features & NETIF_F_GRO_HW) && dev_xdp_prog_count(dev)) {
> +		netdev_dbg(dev, "Dropping HW-GRO feature since XDP is attached.\n");
> +		features &= ~NETIF_F_GRO_HW;
> +	}
> +

Apparently drivers can enable HW_GRO in some edge case (that can be
plugged itself?):

    The rule is only enforced at attach time (dev_xdp_clear_rx_agg). Later
    recomputes don't re-check after ndo_fix_features. Example:
      1. Attach a multi-buf XDP program to mlx5 with HDS off. HW-GRO goes off.
      2. Enable tcp-data-split. rings.c:253 only refuses this for
         single-buffer XDP, via dev_xdp_sb_prog_count().
      3. The next feature recompute runs mlx5e_fix_features(), and its
         "Keeping HW-GRO enabled" block (en_main.c:4643) sets GRO_HW again,
         after this strip. HW-GRO is now on with XDP attached.
    This already happens today, but once 5/8 removes mlx5's own XDP check
    the core is the only guard, and it misses this case. Either add a
    post-fix_features check here (warn and strip, or refuse the change), or
    make the HDS-enable path in rings.c refuse while any XDP program is
    attached and the driver ties HDS to HW-GRO.

>  	if (dev->netdev_ops->ndo_fix_features)
>  		features = dev->netdev_ops->ndo_fix_features(dev, features);
>  
> -- 
> 2.56.1
> 


