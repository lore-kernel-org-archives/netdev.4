Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153799;
	b=2KNlRT9855b36ZrbqpzVmg1bS7qjFvgOPeibXlvAXZAzrOqvHHMZfnNOpN4jT/gaPG5j
	 Jieomjd71UqJH0s/WaKw4FSXmgNAW2Nw+EwH2UmO/aJAh6/FKbsXWkqNXAi00yJ2dkC5v
	 rw+OxZbpquFfcl2bMsQgrt3Q6GPrYkuj+3Cj4ixkh0ggFMMFYdgQLZ9lpYKMimPtsz3dT
	 fqYRcWtHSBxF/hoohGWg6P9P6zcSqg3vNPQsBuLSAnBkbzdgPUa9BP12VCVk0CS7U8bDg
	 rytihcWnMfW8USjwi2aNvSGJasv6UIDGBEYwcDlAcMHtzUB8iQHF4e3ZwaY/NLMhqWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=8UF8BKZr/PlanibZT8mYgrWg11NSrRSfUMYZM1sw1ow=;
	b=zJf9oVJSBwU543GC4w0iB4H7Ev+vXX1AuMcEmj+RoG7Z4JStrTNEUbqspWwF1CH+gA9K
	 Q0xUlx0bcOds6F0vRpLTKnEuLFE0hkHijhjB8VQtSOBgulfSSEB7ZW6tQy8W1c+atNfA3
	 +PuZ1vBBWoP6YHvKjzXdcy17IPv6AArX8msF1lNrY7PSJ7KVQFYW62GXlT7BJWu0eoCuY
	 XehMGpPwUtHpDx8ei59d5I4Jrb26oNY3sBUWr3T7sZl1vhy2GSKvhTu0nFxkGmjOBu3ZR
	 1H1qRsjRG2JOENdO6467iX3jgfxNfprULewiB7ywwoEfxyhC8J+Jp1utQxlcCD83DgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvOQrSaR;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25348606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25348606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvOQrSaR
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1123246c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153798; x=1795758598; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UF8BKZr/PlanibZT8mYgrWg11NSrRSfUMYZM1sw1ow=;
        b=cvOQrSaR2mrHRMOAsAe0QrLi0fTMNmQ8zRmvDoSy+opL4iSRI5PHwbxj5NQzo0xIM8
         YMi54dvwySBqnghmqhwy0MTaS5q0ByfMJUAl2uDB19XH+CcpL3S0kyyugj5BkbQL+FnX
         k0mFEngdiTfdqbLuw8dwNZxL1gIjWSkw5Ksb/n2NJJACY3dsvpMl+q+tJSbE2IPULI9l
         6MM4lPMiN+bYTDQxGP3Kx8zXZyQu5QMZDxml0xMSkw2EaaqWGsXYo0a5WY/+xeKp92TR
         FsWCspBIPxHgelRbeiU2udJy0xDdhpKEh4WqHeE6KJoQWGBpUlHXhOJlwGTqIvjdjvTW
         Bjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153798; x=1795758598;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UF8BKZr/PlanibZT8mYgrWg11NSrRSfUMYZM1sw1ow=;
        b=rzDI3eZ8kHiQMbVh23C3ji+QA21BsPdZGOaPPeYYrCH7qiWmOX1snf7D1yiCcPgQwf
         iElipQhV+8fnIBjKqvXY5q3ykPzaaPSCgvrtHr1QdciwFrpWOk3tJXVGAsBlydeZMt9r
         JeMEVtakj42x+vlgs9br8GBPCrDqnG26XMZZb1Rd4LOYtKabQFvqzcV5wmBMLhoZbKXH
         DHp9Zwl3xzGzmhKTXPz5XbFn0rSDSzMN5ko6flQuH/+iOH4rKXvfHre0udfXxT1DvXm7
         ke7gH4n/FO7Pg+/ifDFVOgV+0B9+ht12s1p/6n5GMoBiTIGLlXYjJBZodB9RsRGsgrXE
         kUUQ==
X-Gm-Message-State: APuU4Z8vnP7PgRJf7rQqJCIPsxFXI4Op/aAvUHmXWDDWf6ftC1+NXpiV
	ggXvJaYUBjvXAUWAwAyFr8tRqpKkONaBEogowbTT7SMYTfZKQqXjIqejZ33kzmj05/QAg3zDn+Q
	Qf4q8bGpovoeOhk/oOhl/e/U9unEfENI9FF2x7zOXmK01Oc4HgrCNhfw6tvczJzRL3h4uWEiMr6
	7xzj3QQZ7K5eT3Iz8xYx6Vw4VPkPOX0ddRZggtB9WHOC1qOZ976m+KUdEMKRFQwrM=
X-Received: from dlbrc10.prod.google.com ([2002:a05:7022:ea8a:b0:1ac:f9af:14c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2616:b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b5568e0a27mr1762200c88.19.1795153797762;
 Thu, 19 Nov 2026 21:49:57 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:11 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120045918.1239746-1-almasrymina@google.com>
Subject: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX queues
 on netdev unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Support leased RX and TX devmem bindings when either the virtual device
(e.g. netkit) or the physical backing net_device is unregistered:

1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
   can lock either binding->map_dev or binding->bind_dev.
2. Rename binding->dev and binding->vdev to binding->map_dev (physical
   DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
   netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
   unregistering physical device reached through a queue lease.
4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
   xarray lookup, validation, device check, and reference acquisition
   run under a single rcu_read_lock() section.
5. Always populate bind_dev on RX and TX bindings and handle teardown
   and netdev unregistration of both bind_dev and map_dev, waiting for
   synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
   unmapping bindings whose map_dev is unregistering.
6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
   leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
   bind-rx when map_dev differs from netdev, assert both devices are
   locked, and check netif_lease_valid(map_dev).
7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
   bindings across both virtual-first and physical-first netdev
   unregistration orders.

These issues were discovered during AI code review (Sashiko) of the
earlier non-leased devmem unregister series (and subsequent mailing list
review) and confirmed by code inspection (not observed in production or
reproduced on real hardware). Tested with the nl_netdev.py selftest on
netdevsim added in this series.

v4:
- Rebase onto latest net-next/main.
- Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() under a
  single rcu_read_lock() (deferring net_devmem_dmabuf_binding_get()
  until after all checks pass) and update net_devmem_dev_unregister() to
  use a two-pass loop with a single synchronize_net() after clearing
  NET_DEVMEM_BINDING_LIVE and before unmapping bindings with
  map_dev == dev (Paolo).
- Document issue discovery, validation, and testing in commit messages
  and the cover letter (netdev-bot+sinfo).
- v3: https://lore.kernel.org/netdev/20261115022607.348112-1-almasrymina@google.com/

v3:
- Rebase onto latest net-next/main.
- Add netif_lease_valid() helper and keep lease validity checks in the
  lease-aware callers (netif_mp_open_rxq(), netif_mp_close_rxq(),
  netif_rxq_cleanup_unlease(), and net_devmem_bind_dmabuf()) rather than
  inside __netif_mp_open_rxq() / __netif_mp_close_rxq(), and document why
  mp_params is cleared directly when !netif_lease_valid(dev) (Stanislav,
  Sashiko).
- Guard the bound_rxqs loop in net_devmem_unbind_dmabuf() with
  if (binding->bind_dev), keep the !netif_is_queue_leasee(dev) guard in
  net_devmem_dev_unregister() in patch 4/6 until patch 5/6 resolves
  binding->map_dev to the physical device so the series is bisectable at
  every commit, and document the use-after-free in dma_unmap_sg_attrs() on
  physical netdev teardown in patch 5/6 (Sashiko).
- In nl_netdev.py, verify dmabuf and lease on the physical queue after
  binding, skip when queue_create returns EOPNOTSUPP, probe the physical
  device on EOPNOTSUPP so a broken lease lookup is not masked as SKIP, and
  clean up nk_ifname between loop iterations (Sashiko).
- v2: https://lore.kernel.org/netdev/20261108055809.2122934-1-almasrymina@google.com/

v2:
- Split patch 3/4 from v1 into 3 smaller commits (patches 3/6..5/6).
- Clear rxq->mp_params and return 0 in __netif_mp_close_rxq() whenever
  dev is already unregistering, avoiding queue reconfiguration on an
  already-shut-down map_dev during cascaded lease teardown (Sashiko).
- Drop unnecessary xa_erase() in net_devmem_unbind_dmabuf() and use a
  local map_dev variable in net_devmem_get_binding() (Stanislav).
- Restore ASSERT_EXCLUSIVE_WRITER(binding->bind_dev) in
  mp_dmabuf_devmem_uninstall(), drop redundant bind_dev->reg_state check
  in net_devmem_bind_dmabuf(), and expand commit message rationale
  (Dragos, Stanislav).
- v1: https://lore.kernel.org/netdev/20261103232659.1340283-1-almasrymina@google.com/

Mina Almasry (7):
  net: devmem: pass net_device pointer to net_devmem_lock_dev()
  net: devmem: rename binding dev and vdev to map_dev and bind_dev
  net: guard memory provider RX queue open and close on unregister
  net: devmem: fold net_devmem_lookup_dmabuf() into
    net_devmem_get_binding()
  net: devmem: always populate bind_dev and detach both devices on
    unregister
  net: devmem: resolve physical map_dev for leased RX bindings
  selftests: net: add leased devmem RX and TX netdev unregister tests

 net/core/dev.c                           |   2 +-
 net/core/dev.h                           |   7 +
 net/core/devmem.c                        | 178 ++++++++++++-----------
 net/core/devmem.h                        |  31 ++--
 net/core/netdev-genl.c                   |  59 +++++---
 net/core/netdev_rx_queue.c               |  31 +++-
 tools/testing/selftests/net/nl_netdev.py | 159 +++++++++++++++++++-
 7 files changed, 333 insertions(+), 134 deletions(-)


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.56.1.750.gf70dc682cf-goog

