Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338968;
	b=4KntuaoWdg/N2ZLIaiQxd3H/6RWGJpj7zQMMj1IRU9bIW10eA2nR3ukQhV5XrpijWw7b
	 +M1ONw+U03a0HbPEpl1DQbomUTUQ937SmLBdUCie9z+wuNrMPZhFrhjPvXoPIsifybtZ9
	 ce1DckKTb5wNMGwvza4HIYVnGdx9MQtkTzFpvbwiUudlGtc65hAex67Q/VLrlB4hI3dUG
	 JVdtbB62akhci3txas2BweyHLEvwpsWdAnp4Exw4Fg6kHw2fqpPDQVNCXqBpGxzV2e920
	 YANxZSnm7sA4fm+bEgc3HJw1Pzwg3+7S/fBXfiJJlotQSDwiaR2cV+F6oh6LqLi3lBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0KmhmqWZGey7mXaEaM39Yzuu4YAG3T1qaBpPiWLL0gM=;
	b=zjQM5NhAtZcFnT/O7Z9IE25h3hLvdPuHEuULeIHD0BDNdCahzMXeBzraqPo+7/bWFRGk
	 Zkhyz8R2YFetKkIbGNiKcM+NHwdgrjqTnmAIKplu+3xBghOZcnQefMuKnmLj0LL0Gwuuq
	 wjEZ+VOmUYovHuu+riZ+PADEvdHw/20peta5Q03P9/1Ygat2R/6ssnUu6AiNep3N6DyVD
	 JFxKtZAMNmrgbYBYV+fg2/2+IVRebUe5416mayZk1AAZLCJgF4b7/W8MOCmhqQbd1DnlK
	 Ny4T8QF51axRqbt4GlWdFxXZTkzGk2+ASC4fLVYnB5CiqI8b2wdbhGE6CQmtzHATEvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=N48KdldY;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA5606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CA5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=N48KdldY
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1256573f8f.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795338965; x=1795943765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KmhmqWZGey7mXaEaM39Yzuu4YAG3T1qaBpPiWLL0gM=;
        b=N48KdldYkQjaF/ngDujTZE6Al8clD0ZABH8Hwlk3by70BFtk/LFt1h1KBlEim1qTak
         TscYtqyoJhYd+t2xBeovlUCH5YA13JRwUhwg/R6csWedfGyUpwtwfO1Iw5QThnf0ySiD
         hCXVz61t55ZhKaYFXj+aLhrvlcBGM9S76VlycOzGpNJUl6ZxhRVQGiMCVYnu5UMaxaYC
         X3pkeuuPFi2Xvif5OAaar1Qu3z8ZsZAh2qf8QT4ZAQbhA3hwaqvJQfDXYg36G2PFlf7v
         SJyFZ55FrdfWRWjNovTf3iur4sD52UlCmkQyQC6IFvEPq6OguYPD4WXf2Jjun+dk3M+2
         Rkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338965; x=1795943765;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KmhmqWZGey7mXaEaM39Yzuu4YAG3T1qaBpPiWLL0gM=;
        b=aw6ztr4dmjuwUCtbCL+tjF/LLuKr2m3zj+S37TCmSCcKuoqNxFzOkXeeVkBm5WWrUW
         gXguWAqHV4u1FTIPLS+9KJsPgOVljx6PFnPBTR9ASCG1OTajRxObXhnddRKguyaH4vlx
         qcCW18qods1Z7axfkqmPg0292FberuF1JhyrFuuUlRuq1jCYP35IpncBwda/dN+sAupc
         TAlHS1ijz8VdDigx43O+8sSOgI2ea9M94rqWA7/wVsrt+gWb88cFv6oH+VOU06QKUdJM
         tV+hlKOZD+9HxKBT1lnBJj4yUSDeq3NTQ3FCIqjJKMw3Plb/ZiHHydeDIhY9hlqaSPeL
         tP0Q==
X-Forwarded-Encrypted: i=1; AL+hErG/w1wT/Pp6RVOfz/83Uk/mxPA01Jz97e549pmvIe5/gCnuvULuiIkAWOr9dsk+mcJlZ6QgycM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YMEm9d45EFjuOP5P3YLrwE+qLD0/zH4z13wOK4zpdGCdPW+E4
	aAKTIW8C3yVo2g5e66CC8Ok004FGsfKbPblHr/KxYktYkYC94mcARMANSkckZYZIRss=
X-Gm-Gg: AZFdTZfBBfYF7nI7r7IGL/3P6q8HOp1ZxcpL90Td0YW2TQfZUgxzelFGkOW4uxACXEb
	VG9AcX+0JgyhQC5+fMyRnI7Yi+HWywt2Gcjdb/+dN0xD8aLkxNssHR8vacVtLPlNXUmkWlSch7k
	9o/mIen4yzxo+eKoWzEM4X1zZ9oKNvrrOx/BJX4E6eeNqAuLLbE2PzprSi/rJf9biOCS3exNkIt
	TzDjmNDZ7dbqI/xHaHRkHqRuE0z7hYLVT4GOfjNGqFaiDGWjcK3rGD+ZG9bOkbr3HDYsLUMQBMU
	duDy0XZkMbDuU5UEPM2/GmMziwOsHAfBDWvTPZi2W8AcafDhlIHLDkJbk7dMJcqoyc7bjQf/5W7
	/I1hcF6/YTqTEZhXeAa97GTNlBUHvnRgcBIfLdqSy36ooKfpwyU1Hxrl5KIV0XHvQ3OFxRC6jOL
	bPAY7es4qeqp6Il/c1ceK+cEWUm7gsGb0sVY1SCbTLXG/5Sm2Qv8z8ctItIPIOSqg3RMfTD0L9+
	PDojqOSrrgNAnztCIelMEtycovsTr34Bqo1AoVtoX9IVQ11FqfHELTE5wk2aXfBfpap/VEymcFI
	ZgR2f2hSUoIxTlmDvjg1/O3xMDzmJSnZf65U9CuS34OlMa7xYhI/E5V592giCFQKRIsZ3s1GwQ7
	0UyYM
X-Received: by 2002:a5d:5d01:0:b0:4a7:851a:e617 with SMTP id ffacd0b85a97d-4abaac5777cmr17246463f8f.7.1795338965324;
        Sun, 22 Nov 2026 01:16:05 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm15828914f8f.6.2026.11.22.01.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 01:16:04 -0800 (PST)
Message-ID: <9c6546b4-d88d-48ce-a4f7-721eed72d4b2@blackwall.org>
Date: Sun, 22 Nov 2026 11:16:03 +0200
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
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
Content-Language: en-US, bg
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 David Wei <dw@davidwei.uk>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20261120045918.1239746-1-almasrymina@google.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 06:59, Mina Almasry wrote:
> Support leased RX and TX devmem bindings when either the virtual device
> (e.g. netkit) or the physical backing net_device is unregistered:
> 
> 1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
>     can lock either binding->map_dev or binding->bind_dev.
> 2. Rename binding->dev and binding->vdev to binding->map_dev (physical
>     DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
> 3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
>     netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
>     unregistering physical device reached through a queue lease.
> 4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
>     xarray lookup, validation, device check, and reference acquisition
>     run under a single rcu_read_lock() section.
> 5. Always populate bind_dev on RX and TX bindings and handle teardown
>     and netdev unregistration of both bind_dev and map_dev, waiting for
>     synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
>     unmapping bindings whose map_dev is unregistering.
> 6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
>     leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
>     bind-rx when map_dev differs from netdev, assert both devices are
>     locked, and check netif_lease_valid(map_dev).
> 7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
>     bindings across both virtual-first and physical-first netdev
>     unregistration orders.
> 
> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series (and subsequent mailing list
> review) and confirmed by code inspection (not observed in production or
> reproduced on real hardware). Tested with the nl_netdev.py selftest on
> netdevsim added in this series.
> 
> v4:
> - Rebase onto latest net-next/main.
> - Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() under a
>    single rcu_read_lock() (deferring net_devmem_dmabuf_binding_get()
>    until after all checks pass) and update net_devmem_dev_unregister() to
>    use a two-pass loop with a single synchronize_net() after clearing
>    NET_DEVMEM_BINDING_LIVE and before unmapping bindings with
>    map_dev == dev (Paolo).
> - Document issue discovery, validation, and testing in commit messages
>    and the cover letter (netdev-bot+sinfo).
> - v3: https://lore.kernel.org/netdev/20261115022607.348112-1-almasrymina@google.com/
> 
> v3:
> - Rebase onto latest net-next/main.
> - Add netif_lease_valid() helper and keep lease validity checks in the
>    lease-aware callers (netif_mp_open_rxq(), netif_mp_close_rxq(),
>    netif_rxq_cleanup_unlease(), and net_devmem_bind_dmabuf()) rather than
>    inside __netif_mp_open_rxq() / __netif_mp_close_rxq(), and document why
>    mp_params is cleared directly when !netif_lease_valid(dev) (Stanislav,
>    Sashiko).
> - Guard the bound_rxqs loop in net_devmem_unbind_dmabuf() with
>    if (binding->bind_dev), keep the !netif_is_queue_leasee(dev) guard in
>    net_devmem_dev_unregister() in patch 4/6 until patch 5/6 resolves
>    binding->map_dev to the physical device so the series is bisectable at
>    every commit, and document the use-after-free in dma_unmap_sg_attrs() on
>    physical netdev teardown in patch 5/6 (Sashiko).
> - In nl_netdev.py, verify dmabuf and lease on the physical queue after
>    binding, skip when queue_create returns EOPNOTSUPP, probe the physical
>    device on EOPNOTSUPP so a broken lease lookup is not masked as SKIP, and
>    clean up nk_ifname between loop iterations (Sashiko).
> - v2: https://lore.kernel.org/netdev/20261108055809.2122934-1-almasrymina@google.com/
> 
> v2:
> - Split patch 3/4 from v1 into 3 smaller commits (patches 3/6..5/6).
> - Clear rxq->mp_params and return 0 in __netif_mp_close_rxq() whenever
>    dev is already unregistering, avoiding queue reconfiguration on an
>    already-shut-down map_dev during cascaded lease teardown (Sashiko).
> - Drop unnecessary xa_erase() in net_devmem_unbind_dmabuf() and use a
>    local map_dev variable in net_devmem_get_binding() (Stanislav).
> - Restore ASSERT_EXCLUSIVE_WRITER(binding->bind_dev) in
>    mp_dmabuf_devmem_uninstall(), drop redundant bind_dev->reg_state check
>    in net_devmem_bind_dmabuf(), and expand commit message rationale
>    (Dragos, Stanislav).
> - v1: https://lore.kernel.org/netdev/20261103232659.1340283-1-almasrymina@google.com/
> 
> Mina Almasry (7):
>    net: devmem: pass net_device pointer to net_devmem_lock_dev()
>    net: devmem: rename binding dev and vdev to map_dev and bind_dev
>    net: guard memory provider RX queue open and close on unregister
>    net: devmem: fold net_devmem_lookup_dmabuf() into
>      net_devmem_get_binding()
>    net: devmem: always populate bind_dev and detach both devices on
>      unregister
>    net: devmem: resolve physical map_dev for leased RX bindings
>    selftests: net: add leased devmem RX and TX netdev unregister tests
> 
>   net/core/dev.c                           |   2 +-
>   net/core/dev.h                           |   7 +
>   net/core/devmem.c                        | 178 ++++++++++++-----------
>   net/core/devmem.h                        |  31 ++--
>   net/core/netdev-genl.c                   |  59 +++++---
>   net/core/netdev_rx_queue.c               |  31 +++-
>   tools/testing/selftests/net/nl_netdev.py | 159 +++++++++++++++++++-
>   7 files changed, 333 insertions(+), 134 deletions(-)
> 
> 
> base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e

The set looks good to me, I also ran a few basic lease queue tests w/ netkit.
For the set:

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

