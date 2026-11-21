Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303900;
	b=a/VKo8T3e6Xe2IbdsbD2udzfKHBfpx84giSGdJ/iPoP2NhSJdpa53cl54vF/5H4jPQbq
	 va9uMpak2mAvgGKRMxASxCX18mBmN9MRSf6XlurjcowLngaMbMNpxz0acb191ewFrBbU9
	 wZOz5D5TaqKEG9DTWZt7LgsOvuSAQiyZ5QkPNcdC2kixPCAVhDwHzxPkzT+9WDKcxn/cC
	 RbSdC1Pa0Ygj3IQ++SjNilB25uPBFVsUtO/UOcGa4NysrJyJbiYkk1SeXv3/gAHh+4iNi
	 lSUffHb/iH7lFQS4gvkZZ7xxBxEdG5rXcA2Vz75EQpZQOqCnr4B7a7l22bc+fuBH1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303900;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IvyuRXnInawipB2cJGBNWPwhGf8PgkWfz1a69u9Bqrg=;
	b=NdEAZ50FUB+c/RGDRp2F7cAS2FLYzg++o9yKuEq1MOe9cUi3NZYWtR/FFpLqTDT6XTRB
	 zLNHvUOOURYZ/cknSnON8jdJ1oSkPAuSsVAvn8VcuPJKpJKUzyGBE5K9dOB/RhphEZ+sX
	 X8YBs2Ue9BgPGkgty2GSLAGu/n2AtgZ+s4yV5IKJtJ74+pjJf+TWlv7Bws8wnJZ4A0HHu
	 BO194sJg7LrS2vNZy2wmpbpWZusds65P30p0W5nyyAZfLYpUgNm7kK289ipjBms0FFA/S
	 wLOcLAa+cQXUZVviQLctI2UBrO6CUd369yXfxnnkWWm3HpKgL8g0EBm8m6EwN92A3qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6R2ud8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB3606A320;
	Sat, 21 Nov 2026 23:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6R2ud8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5088B1F000C0;
	Sat, 21 Nov 2026 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303899;
	bh=IvyuRXnInawipB2cJGBNWPwhGf8PgkWfz1a69u9Bqrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G6R2ud8wqCwXSl+/99FJpua6qFVOew9Ww4xeKfmWaN3kpruplIl4gZLT4JODgYwOE
	 pnDCGULeMBbbrYe314Z/kIE6XcYMMaHhzonyMvHwiUqMPWRVqThN/6KVEeBjzGN1WD
	 XHXtAnblY+uj61BZ83WwFbT8V9WQe/6nKsOSbQPQx3o+n/rySOo+25BsW6Eka8sDeG
	 PVm9pCkeBHjKAPKuhLxPY/J6t9QquCnINWbJ3jb+72gy/W9hr0g34Y92pjqVLJMjdZ
	 Onm/c2ueG1DGYnf1HhILsU6sYoqbeppgbp/85KH/hqTAKRHFQkdDIoTvc4vcqKRVTU
	 lLGofD3Os0PTA==
From: Jakub Kicinski <kuba@kernel.org>
To: han.junyang@zte.com.cn
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	ran.ming@zte.com.cn,
	han.chengfei@zte.com.cn,
	zhang.yanze@zte.com.cn
Subject: Re: [PATCH net-next v6 2/3] dinghai: add MSI-X interrupt pools
Date: Sat, 21 Nov 2026 15:31:37 -0800
Message-ID: <20261121233137.1369263-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113135220713uvE1CCvGgC9U59hVZGJsZ@zte.com.cn>
References: <20261113135220713uvE1CCvGgC9U59hVZGJsZ@zte.com.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dinghai: add MSI-X interrupt pools

This commit allocates the device's fixed 78-entry MSI-X vector layout. It
also adds a reference counted IRQ pool implementation in zxdh_irq.c. Only
the async event queue pool is wired up so far, and interrupts are fanned out
through a per-IRQ atomic notifier chain.

> diff --git a/drivers/net/ethernet/zte/dinghai/en_pf.c b/drivers/net/ethernet/zte/dinghai/en_pf.c
> index ddff9b0438fb3..5927f1f39b02a 100644
> --- a/drivers/net/ethernet/zte/dinghai/en_pf.c
> +++ b/drivers/net/ethernet/zte/dinghai/en_pf.c

[ ... ]

> @@ -485,6 +495,74 @@ static int zxdh_pf_wait_riscv_ready(struct zxdh_core_dev *zxdh_dev)

[ ... ]

> +int zxdh_pf_irq_table_init(struct zxdh_core_dev *zxdh_dev)
> +{
> +	struct zxdh_irq_table *table = &zxdh_dev->irq_table;
> +	struct zxdh_pf_irq_table *priv;
> +	int total_vec;
> +
> +	priv = kvzalloc_obj(*priv, GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	table->priv = priv;
> +
> +	total_vec = ZXDH_VQS_CHANNELS_NUM + ZXDH_ASYNC_CHANNELS_NUM +
> +		    ZXDH_RDMA_CHANNELS_NUM;
> +	total_vec = pci_alloc_irq_vectors(zxdh_dev->pdev, total_vec, total_vec,
> +					  PCI_IRQ_MSIX);
> +	if (total_vec < 0) {
> +		dev_err(zxdh_dev->device, "pci_alloc_irq_vectors failed: %d\n",
> +			total_vec);
> +		return total_vec;
> +	}

[Severity: Medium]
This asks for exactly 78 MSI-X vectors (min_vecs == max_vecs). It doesn't
check the function's MSI-X table size with pci_msix_vec_count(), and there
is no smaller fallback layout. If the call fails, zxdh_pf_probe() aborts.

The same probe path is also bound to the VF device ID:

    { PCI_DEVICE(ZXDH_PF_VENDOR_ID, ZXDH_VF_DEVICE_ID) },

Will a VF, or any function with fewer than 78 MSI-X table entries, now fail
to probe? This commit only uses the 8 async vectors, but it requires all 78.

The commit message calls this "the fixed MSI-X vector layout of the
device". Could it also say whether VFs expose the same table size, and that
probe now fails without the full set?

[Severity: Low]
Probe now requires MSI-X. But DINGHAI_PF in
drivers/net/ethernet/zte/dinghai/Kconfig only gets depends on PCI from its
parent DINGHAI:

    config DINGHAI_PF
        tristate "ZTE DingHai PF (Physical Function) driver"

With CONFIG_PCI=y and CONFIG_PCI_MSI=n, the pci_alloc_irq_vectors_affinity()
stub returns -ENOSPC unless PCI_IRQ_INTX is set and min_vecs is 1. Neither
holds here, so the driver builds but can never bind.

Should DINGHAI_PF depend on PCI_MSI, as other MSI-X only ethernet drivers
do (amazon, google, huawei/hinic3, intel/idpf and others)?

> diff --git a/drivers/net/ethernet/zte/dinghai/zxdh_irq.c b/drivers/net/ethernet/zte/dinghai/zxdh_irq.c
> new file mode 100644
> index 0000000000000..bc5348dfa5ba3
> --- /dev/null
> +++ b/drivers/net/ethernet/zte/dinghai/zxdh_irq.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ZTE DingHai Ethernet driver - IRQ pool management
> + * Copyright (c) 2022-2026, ZTE Corporation.

[Severity: Medium]
The pool code in this file looks closely derived from mlx5's
drivers/net/ethernet/mellanox/mlx5/core/irq_affinity.c. That file carries:

    // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
    /* Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved. */

The functions match up as follows:

    zxdh_cpu_get()/zxdh_cpu_put()      -> cpu_get()/cpu_put()
    zxdh_cpu_get_least_loaded()        -> cpu_get_least_loaded()
    zxdh_irq_pool_request_irq()        -> irq_pool_request_irq()
    zxdh_irq_pool_find_least_loaded()  -> irq_pool_find_least_loaded()
    zxdh_irq_affinity_request()        -> mlx5_irq_affinity_request()

The control flow is the same, apart from the renames:

  - the early break on a CPU with no IRQs
  - the cpumask_first(cpu_online_mask) fallback
  - the cpumask_weight() > 1 split
  - the goto out/unlock structure and the "sharing" fallback
  - the overload message that divides by the refs per IRQ constant

The comment in zxdh_irq_release() about clearing the affinity hint before
free_irq() is a rewording of the one in irq_release() in mlx5's pci_irq.c.

Should this file keep the NVIDIA copyright notice, and should the commit
message mention where the code comes from? Picking the GPL-2.0 side of the
dual license is fine, but the original copyright line is dropped here.

[ ... ]

> +static irqreturn_t zxdh_irq_int_handler(int irq, void *data)
> +{
> +	struct zxdh_irq *zxdh_irq = data;
> +
> +	atomic_notifier_call_chain(&zxdh_irq->nh, 0, NULL);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct zxdh_irq *zxdh_irq_alloc(struct zxdh_irq_pool *pool, int vecidx,
> +				       const struct cpumask *affinity)
> +{

[ ... ]

> +	ATOMIC_INIT_NOTIFIER_HEAD(&irq->nh);
> +	snprintf(irq->name, ZXDH_MAX_IRQ_NAME, "%s_%d@pci:%s", pool->name,
> +		 vecidx, pci_name(zxdh_dev->pdev));
> +
> +	err = request_irq(irq->irqn, zxdh_irq_int_handler, 0, irq->name, irq);

[Severity: Medium]
Can a firmware event get lost here? request_irq() unmasks the MSI-X entry
while irq->nh is still empty, and the only consumer is attached later.

At the end of the series (after "dinghai: add async event queue for
firmware notifications"), the order is:

zxdh_pf_probe()
  zxdh_pf_wait_riscv_ready()        /* firmware already up */
  zxdh_pf_irq_table_init()          /* MSI-X enabled, entries masked */
  zxdh_pf_eq_table_init()
    zxdh_pf_async_irq_request()
      zxdh_get_irq_of_pool()
        zxdh_irq_affinity_request()
          zxdh_irq_pool_request_irq()
            zxdh_irq_alloc()
              request_irq()         /* unmasked, chain empty */
    zxdh_irq_attach_nb()            /* notifier registered here */

A message raised while the entry was masked is latched in the PBA and sent
when the entry is unmasked. If that happens before zxdh_irq_attach_nb(),
zxdh_irq_int_handler() walks an empty chain and returns IRQ_HANDLED.
Nothing re-reads the BAR message channel after the notifier is attached.

Would using IRQF_NO_AUTOEN and calling enable_irq() after the notifier is
attached avoid this? Re-checking the event source after registration would
also work.

Whether this happens depends on firmware signalling async vector 0 before
the driver's vector handshake, which a later series is said to add. No
subscriber registers on eq_table.nh within this series yet.

[ ... ]

> +	if (affinity) {
> +		cpumask_copy(irq->mask, affinity);
> +	} else {
> +		/* No preference requested; spread over all online CPUs. */
> +		for_each_online_cpu(cpu)
> +			cpumask_set_cpu(cpu, irq->mask);
> +	}

[Severity: Low]
This isn't a bug, but can the affinity == NULL branch ever run? The only
caller, zxdh_irq_pool_request_irq(), always passes req_mask or auto_mask.
Before that, it already dereferences req_mask in cpumask_weight() and
cpumask_first(). zxdh_get_irq_of_pool() always passes a copy of
cpu_online_mask.

The comment suggests NULL is a valid input, but a NULL mask would crash
before reaching this branch. Could the branch be removed?

[ ... ]

> +/* Find the least loaded CPU, i.e. the CPU with the fewest IRQs bound
> + * to it, within the requested mask.
> + */
> +static int zxdh_cpu_get_least_loaded(struct zxdh_irq_pool *pool,
> +				     const struct cpumask *req_mask)
> +{

[ ... ]

> +	pool->irqs_per_cpu[best_cpu]++;
> +
> +	return best_cpu;
> +}

[Severity: Low]
This isn't a bug, but the comment says this only finds the least loaded
CPU. It also increments irqs_per_cpu[best_cpu].

zxdh_irq_pool_request_irq() depends on that increment. It calls
zxdh_cpu_get() only in the single CPU branch, and undoes the count with
zxdh_cpu_put() on error. If someone followed the comment and added a
zxdh_cpu_get() to the multi CPU branch, the CPU would be counted twice and
the WARN_ON() in zxdh_irq_pool_free() would fire.

The lock in struct zxdh_irq_pool in zxdh_irq.h has a similar problem. It is
documented as:

    struct mutex lock;		/* serializes IRQ creation */

The code relies on it for more than creation:

  - zxdh_irq_release() and zxdh_irq_pool_find_least_loaded() both assert it
  - the "cannot fail" zxdh_irq_get() in zxdh_irq_affinity_request() is only
    safe because release is serialized by it
  - it covers all irqs_per_cpu updates

Could both comments describe what the code relies on?

[ ... ]

> +/* Request an IRQ for the given mask: share the least loaded existing
> + * matching IRQ once it passes the pool minimum threshold, otherwise
> + * create a new one.
> + */
> +static struct zxdh_irq *zxdh_irq_affinity_request(struct zxdh_irq_pool *pool,
> +						  const struct cpumask *req_mask)
> +{
> +	struct zxdh_irq *least_loaded_irq;
> +	struct zxdh_irq *new_irq;
> +
> +	mutex_lock(&pool->lock);
> +
> +	least_loaded_irq = zxdh_irq_pool_find_least_loaded(pool, req_mask);
> +	if (least_loaded_irq &&
> +	    refcount_read(&least_loaded_irq->refcount.refcount) < pool->min_threshold)
> +		goto out;

[Severity: Medium]
Does the header comment describe the opposite of what the code does? It
says an existing IRQ is shared "once it passes the pool minimum threshold".
The commit message says the same:

    The pool hands out the least loaded matching IRQ once it passes
    the pool minimum threshold

The code shares an IRQ only while its refcount is below min_threshold. At
or above the threshold, it creates a new IRQ with
zxdh_irq_pool_request_irq(). It shares only if that fails because the pool
is exhausted.

The early return in zxdh_irq_pool_find_least_loaded() and the inner
comments here match the code, not the header comment or the commit message.

For the async pool, ZXDH_PF_ASYNC_IRQ_MIN_COMP is 0:

    #define ZXDH_PF_ASYNC_IRQ_MIN_COMP	0

So pool->min_threshold is 0, and this unsigned comparison can never be true.
Every async request creates a new vector until all 8 are used. Only then
does it share, with the "exhausted" warning.

Is that the intended policy? If so, could the header comment and the commit
message be updated to match?

[ ... ]

> +out:
> +	/* Holding pool->lock keeps the IRQ alive, so this cannot fail. */
> +	zxdh_irq_get(least_loaded_irq);
> +	if (refcount_read(&least_loaded_irq->refcount.refcount) > pool->max_threshold)
> +		dev_warn(pool->dev->device,
> +			 "irq %u overloaded, pool %s, %u refs on this irq\n",
> +			 pci_irq_vector(pool->dev->pdev,
> +					least_loaded_irq->index),
> +			 pool->name,
> +			 refcount_read(&least_loaded_irq->refcount.refcount) /
> +			 ZXDH_EQ_REFS_PER_IRQ);

[Severity: Low]
This isn't a bug, but the units look mixed up here. Each event queue takes
two references: one from zxdh_get_irq_of_pool() and one from
zxdh_irq_attach_nb(). So refcount / ZXDH_EQ_REFS_PER_IRQ is the number of
queues, not "refs on this irq". The mlx5 version prints "%u EQs on this
irq".

The comment in zxdh_irq_pool_alloc() has the same mix-up:

    /* Thresholds are expressed in queue references, two per IRQ. */

The factor is two per queue, not per IRQ, and the ZXDH_EQ_REFS_PER_IRQ
name has the same problem.

This warning also prints the int returned by pci_irq_vector() with %u.
Could it use least_loaded_irq->irqn instead?
