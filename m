Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303901;
	b=X6XP+Bfr/02wKppZ2XiHjZpJoOkd5Arlr//NcpcH14lNEvd0q8JxUvmui6w8nBbhTg5L
	 eS8MzCEZONeXFMNucOd8uetIRgLpt++n1nfm/6F/VA/stwuJviQoRfbE+3vYZu847Qgu8
	 JDwuUe8Z/5AfGQMx481H84P4IThhYoHe9ajACsocxlfBvFRcZukTzYcO2FIEI5C4RS39i
	 CaDH92b+3GQZ4cL7dJ8DCX9Q9Bh1sHjKePGdTnyze4tmOc2suzxEoM5f1Ms+EVP9WkD1I
	 +kVnvdpX0rRyEU98tWzk1MKcHDVTbdyZCURelQOj1DMtnGzPNUubfGdKx0iwlF9vusA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303901;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qKu1oEyHCDGwqnBjrX4cH/5CtPCm1dDJXRhNVXxniYM=;
	b=BV0wskJ7FYFAWXLl/Z1+wMotJxQBJ3kR3MImO9s7qQotOWnFdubEh2RaKWg01LGJoYuN
	 JLWCf1lhjTzkMqdBstP4s26xt/CCghnG516Pgl3FJPLikjl5Us5x3TrbomSsRcxcHiCm1
	 CphcvgiWvjVShW/u+kOkB0vXv3fy+KZRJHmvVNgjVuMnVSjY2dTKRPGxEFC77dr4SSgvL
	 qBdhHaMpA0hZh1a26NTDvrzAt0hM070Nogr554QVqN25lRzHmiaFXV7XMx8ykWYF5xl5b
	 xDVV66VBf3oqcQkPi75Tm/+kELKoSF5ioyG6kDzjKxDdXioMUKxi1sTVBWTKvE/3P3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwR6lyfH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA12606A33A;
	Sat, 21 Nov 2026 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwR6lyfH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D1E1F000C0;
	Sat, 21 Nov 2026 23:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303900;
	bh=qKu1oEyHCDGwqnBjrX4cH/5CtPCm1dDJXRhNVXxniYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GwR6lyfHOzaf73eVIZgpyFCtsmxqLPzr9hdRtcL/vBLUqI66HZ5ei5nL+GilOowPS
	 VjYh3KGcdDzK5RJyfKOpLNW9mw6mvRYWJMfLJCnJ3cJ4v7CZfxRk2eL9isukPTRrjk
	 QFI7Ikg0zPPD/ENMLZLx+jvBpIa2LM1At3GUPZqyLh4unxV4ZktcBpIHRfoDuN8Civ
	 BcWJz8mMNmU4o8xDig0T/6iwiAyQ1dREtio+mjDTyibJgcWKO8tFhrFQvwYwD18iAg
	 w9ioNOhecFV/BzivQ7/yR4tbJiahCgHpK/O0QDzHVqCwtCM4rQxKCAcOm4U5AbmG0h
	 9iigGyaYqWDEQ==
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
Subject: Re: [PATCH net-next v6 3/3] dinghai: add async event queue for firmware notifications
Date: Sat, 21 Nov 2026 15:31:39 -0800
Message-ID: <20261121233139.1369298-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <202611131353550805pQNJ97v2tR6FK-IhhDQ0@zte.com.cn>
References: <202611131353550805pQNJ97v2tR6FK-IhhDQ0@zte.com.cn>
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
--- Patch [3]: [PATCH net-next v6 3/3] dinghai: add async event queue for firmware
 notifications ---
commit 0beec1cea24be93e6e75a8732e384d617376a13d
Author: Junyang Han <han.junyang@zte.com.cn>

dinghai: add async event queue for firmware notifications

This adds an event queue table and one async event queue that receives
firmware notifications from the RISC-V management core. The queue takes
one MSI-X vector from the async pool. Its interrupt handler reads an
event_id from the PF receive sub-channel of the BAR message area and
dispatches it through per-event-type notifier chains, and the PF
probe/remove paths create and tear down the queue.

> diff --git a/drivers/net/ethernet/zte/dinghai/en_pf.c b/drivers/net/ethernet/zte/dinghai/en_pf.c
> index 5927f1f39b02a..f7400d66bc690 100644
> --- a/drivers/net/ethernet/zte/dinghai/en_pf.c
> +++ b/drivers/net/ethernet/zte/dinghai/en_pf.c

[ ... ]

> @@ -617,10 +614,18 @@ static int zxdh_pf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_irq_table;
>  	}
>  
> +	ret = zxdh_pf_eq_table_init(zxdh_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "zxdh_pf_eq_table_init failed: %d\n", ret);
> +		goto err_eq_table;
> +	}

[Severity: Low]
Does this queue have any users in this series? Every probe now takes an
async-pool vector and installs a hard IRQ handler:

zxdh_pf_eq_table_init()
  zxdh_pf_async_irq_request()
    zxdh_get_irq_of_pool()
      zxdh_irq_affinity_request()
        zxdh_irq_pool_request_irq()
          zxdh_irq_alloc()
            request_irq()

When the interrupt fires, zxdh_eq_async_riscv_int() dispatches to
zxdh_dev->eq_table.nh[], but nothing registers on those chains. Under
drivers/net/ethernet/zte/, the only reference to eq_table.nh[] is the
atomic_notifier_call_chain() call in zxdh_eq_async_riscv_int().

zxdh_eq.h also exports only zxdh_pf_eq_table_init() and
zxdh_pf_eq_table_destroy(), with no register/unregister helper. Later
subscribers would have to reach into struct zxdh_eq_table directly.

The commit message says:

  "the PF side wired here is live as soon as that channel is enabled.
  Subscribers for the RISCV_READY event register on the notifier chains
  in later series as well."

Even with the channel enabled, every RISCV_READY dispatch would go to an
empty chain. Could this be merged together with the BAR message channel
and the first subscriber? Then the design could be reviewed against its
consumers, including the event payload, valid/ack handling and ownership
of the mailbox offsets.

[ ... ]

> diff --git a/drivers/net/ethernet/zte/dinghai/zxdh_eq.c b/drivers/net/ethernet/zte/dinghai/zxdh_eq.c
> new file mode 100644
> index 0000000000000..3e70f4f3063fe
> --- /dev/null
> +++ b/drivers/net/ethernet/zte/dinghai/zxdh_eq.c

[ ... ]

> +/* Fetch the event_id the RISC-V core posted in the PF receive
> + * sub-channel of the BAR message area. The field lives at byte offset
> + * 2 of the 12-byte message header, so a single 32-bit read of the
> + * sub-channel start covers it.
> + */
> +static u16 zxdh_eq_event_id_get(struct zxdh_core_dev *zxdh_dev)
> +{
> +	struct zxdh_pf_dev *pf_dev = zxdh_dev->priv;
> +	void __iomem *subchan;
> +
> +	subchan = pf_dev->pci_ioremap_addr[0] + ZXDH_BAR_MSG_SUBCHAN_RECV;
> +
> +	return ioread32(subchan) >> 16;

[Severity: Medium]
Should the handler check that a new message was actually posted before
it uses this event_id?

The >> 16 discards bytes 0-1 of the header. In the 12-byte BAR message
header, byte 0 holds the per-message flag bits (valid, sync, emec, ack,
poll, usr).

The BAR mailbox protocol isn't in the tree yet, so this is based on the
DPDK zxdh PMD. Its header layout matches the comment here (event_id at
offset 2, RISC_READY = 13). Its receive path rejects any header without
the valid bit in zxdh_bar_chan_msg_header_check().

zxdh_irq_int_handler() calls the chain on every interrupt:

	atomic_notifier_call_chain(&zxdh_irq->nh, 0, NULL);

	return IRQ_HANDLED;

so nothing earlier filters these events. If the mailbox still says 13,
ZXDH_EQ_EVENT_TYPE_RISCV_READY would be dispatched again on any
interrupt on this vector. That includes a stale header from an earlier
notification, an uninitialized mailbox, or a spurious MSI-X. It also
covers interrupts meant for other users if zxdh_irq_affinity_request()
shares the vector when the pool runs out.

Can subscribers then receive a RISCV_READY event that the firmware
didn't post for this interrupt?

> +}

[ ... ]

> +static int zxdh_eq_async_riscv_int(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct zxdh_eq_async *eq = container_of(nb, struct zxdh_eq_async, irq_nb);
> +	struct zxdh_core_dev *zxdh_dev = eq->priv;
> +	enum zxdh_eq_event_type event_type;
> +
> +	event_type = zxdh_eq_event_type_get(zxdh_eq_event_id_get(zxdh_dev));
> +	if (event_type == ZXDH_EQ_EVENT_TYPE_MAX)
> +		return NOTIFY_DONE;
> +
> +	atomic_notifier_call_chain(&zxdh_dev->eq_table.nh[event_type],
> +				   event_type, NULL);
> +
> +	return NOTIFY_OK;

[Severity: Medium]
What gives the receive sub-channel back to the firmware once the
message is handled? This handler is its only consumer, and it returns
without writing anything to the mailbox.

In the DPDK zxdh receive path, zxdh_bar_irq_recv() resets the header's
valid field to usable. For sync messages it also writes a reply header
with the ack bit set.

Without this, could the RISC-V core keep seeing an unconsumed message
and fail to post the next notification? Could a sync-flagged sender
wait for an ack until it times out? The old header would also stay in
the mailbox, so the stale re-dispatch described above could repeat on
every later interrupt.

> +}

[ ... ]

> +void zxdh_pf_eq_table_destroy(struct zxdh_core_dev *zxdh_dev)
> +{
> +	struct zxdh_pf_eq_table *pf_eq_table = zxdh_dev->eq_table.priv;
> +	struct zxdh_eq_table *table = &zxdh_dev->eq_table;
> +	struct zxdh_eq_async *eq;
> +
> +	if (!pf_eq_table)
> +		return;
> +
> +	eq = &pf_eq_table->riscv_eq;
> +
> +	mutex_lock(&table->lock);
> +	if (eq->irq) {
> +		zxdh_irq_detach_nb(eq->irq, &eq->irq_nb);
> +		zxdh_irqs_release_vectors(&eq->irq, 1);
> +		eq->irq = NULL;
> +	}
> +	mutex_unlock(&table->lock);

[Severity: Low]
This isn't a bug, but what does table->lock protect? zxdh_eq.h
documents it as:

	/* Serializes async EQ setup/teardown. */
	struct mutex lock;

zxdh_pf_eq_table_init() only calls mutex_init(). It then sets eq->irq
and calls zxdh_irq_attach_nb() without taking the lock. This
mutex_lock() in zxdh_pf_eq_table_destroy() is the only place it is
acquired.

The driver core already serializes probe and remove, and the hard IRQ
path can't take a mutex. Holding the lock here also keeps it held across
synchronize_rcu() in atomic_notifier_chain_unregister(),
synchronize_irq(), pool->lock and free_irq().

Could the lock be removed, or the comment changed to match what it
actually guarantees?

> +
> +	mutex_destroy(&table->lock);
> +	kvfree(table->priv);
> +	table->priv = NULL;
> +}

[ ... ]
