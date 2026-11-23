Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395978;
	b=xcirmul93JtuWbGUvAqUjAbAxNcUBmmqq7iQaF/M7Jc6ve5QoR5dtu4tWS+T0Xgpd+y7
	 1V3hZ+r+4d5AZbM2mhCCyUQullXfxu4z42He9zO71SwjvSpGhviGXfY9gVD9r/6hPEw/G
	 m/v63Fb2IoPVlHsNdo4OJaSb49hjheawGuddLdvB30H2Mj/FklqS9GPVrMDbK8uIIjQtj
	 hpShjdjUkh/E51UpjSHO8CdB3aLhhOOme6h7+01dJqWSdgWaAo953xZz1TDvD9/kAt10o
	 B7bMPf5F1b+cFca6SuMu8e7u6GP7jqp1igReGgK++5gRFz2YmiJY2HuumQX+5jHOTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395978;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lRX8+TAe/A3hOjyZQJpqESHbzA31Kj7ZIZkFU1RGn48=;
	b=Ji0P2btIpDXvxq11IO7p2jDzrI5WJpih3JVj9VOwmp68oFYVhXUoYb6YFsNdTGd7ClzZ
	 fVpULIK32O5mSr427JYOUT0TcJtdHhhJ2ExSy0KBu7GCLL+JxDwfQSpLStTkqTD9NUkYX
	 mIsPBy0wBp7e0yWWR7xtYKXYvdfyc2/2dnjV95QD6CEKgql7rWRi/y9z24Y65CFxPwZ+e
	 XXEB65J3OK/detb6S0yX3XglheVJeCTne/LRyI4XLbNdHxjlAdYuNrrH4RXbpcPcLUAsH
	 yTGwGjcQxIoQzeFwgN9n4ofzUCGYCU/IdGeuPguRMfyeHNdfyV637UNzwL8e9RfKakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDK36XgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D3606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDK36XgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D931F000C4;
	Mon, 23 Nov 2026 01:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395978;
	bh=lRX8+TAe/A3hOjyZQJpqESHbzA31Kj7ZIZkFU1RGn48=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aDK36XgVjtrozghjMQye3X4wfuXlH5dliW3XQ6MzM/YV1Flk+WkjJ/x9/us17myDF
	 B01FnWUfj0X+YkyRouAM1rSVyZKoWfhWLT455oxv1ekqbc79KddPsCTKe1NzEOSWDG
	 xC+T6lHvp0wXXipCI2687GnUQFIK1wXzlhXN71D3yEP3n3TcvUAP9tGj2gZVwWv6/X
	 K9pjt31SEB8CWOlTMtyxrlodmKU2j8zA0+CkpvkOE1Nb6IUpBP1Ee/ns/EWfx53CHt
	 cHLY/0FP+BMDryVlOnhZZEJF8GWm2KqGmG/c/BgxFOOCYYEP6Nu2CYYYw9243BuNWx
	 WecGmEYjM1ifw==
Subject:
 Re: [PATCH net 2/2] vmxnet3: keep the XDP program across device resets
From: netdev-bot+sashiko@kernel.org
To: filzador@gmail.com
Cc: ronak.doshi@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, kuba@kernel.org
Date: Mon, 23 Nov 2026 01:06:17 +0000
Message-ID: <179539597786.3135.350150131775018719@kernel.org>
In-Reply-To: <20261122002847.616-3-filzador@gmail.com>
References: <20261122002847.616-3-filzador@gmail.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] On a failed XDP attach, the patch leaves a dangling bpf_prog
  pointer in adapter->xdp_bpf_prog.

--

vmxnet3: keep the XDP program across device resets

This patch stops vmxnet3_rq_cleanup_all() from clearing
adapter->xdp_bpf_prog. The attached XDP program then survives the
quiesce and reset paths, such as MTU changes, down/up and ring resizes.
It also rejects MTU changes above VMXNET3_XDP_MAX_MTU while XDP is
attached.

> diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
> index fb98eb7712584..e84bf116a3baf 100644
> --- a/drivers/net/vmxnet3/vmxnet3_drv.c
> +++ b/drivers/net/vmxnet3/vmxnet3_drv.c
> @@ -2104,7 +2104,6 @@ vmxnet3_rq_cleanup_all(struct vmxnet3_adapter *adapter)
>  
>  	for (i = 0; i < adapter->num_rx_queues; i++)
>  		vmxnet3_rq_cleanup(&adapter->rx_queue[i], adapter);
> -	rcu_assign_pointer(adapter->xdp_bpf_prog, NULL);
>  }

[Severity: Critical]
If an XDP attach fails inside vmxnet3_xdp_set(), does removing this line
leave a dangling program pointer in adapter->xdp_bpf_prog?

vmxnet3_xdp_set() publishes the new program and drops the old one before
it rebuilds and reactivates the device:

drivers/net/vmxnet3/vmxnet3_xdp.c:vmxnet3_xdp_set() {
    ...
	vmxnet3_xdp_exchange_program(adapter, new_bpf_prog);
	if (old_bpf_prog)
		bpf_prog_put(old_bpf_prog);
    ...
	err = vmxnet3_activate_dev(adapter);
	if (err) {
		NL_SET_ERR_MSG_MOD(extack,
				   "failed to activate device for XDP.");
		return -EOPNOTSUPP;
	}
    ...
}

When ndo_bpf fails, dev_xdp_install() in net/core/dev.c drops the
reference it took for the driver. It also does not record the program:

	err = bpf_op(dev, &xdp);
	if (err) {
		if (prog)
			bpf_prog_put(prog);
		return err;
	}

Before this patch, every error label in vmxnet3_activate_dev()
(activate_err, irq_err, rq_err) went through vmxnet3_rq_cleanup_all().
As a side effect, that reset adapter->xdp_bpf_prog to NULL. With the line
removed, nothing clears the pointer on that path.

vmxnet3_activate_dev() can fail in three ways:

- vmxnet3_rq_init_all() returns -ENOMEM because vmxnet3_create_pp() or
  vmxnet3_rq_alloc_rx_buf() failed.
- vmxnet3_request_irqs() fails.
- The device rejects VMXNET3_CMD_ACTIVATE_DEV.

The vmxnet3_rq_create_all() error return in vmxnet3_xdp_set() leaves the
pointer in the same state.

Take an attach of program P on a running interface (old NULL, new P).
After this failure, adapter->xdp_bpf_prog == P, but neither the driver
nor the core holds a reference to P. Once userspace closes the prog fd,
P and its JIT image are freed.

vmxnet3_xdp_enabled() still returns true, so on the next down/up the rx
rings are rebuilt in XDP mode:

vmxnet3_open()
  vmxnet3_activate_dev()
    vmxnet3_rq_init_all()
      vmxnet3_rq_init()
        buf_type = VMXNET3_RX_BUF_XDP

Received packets then go from vmxnet3_rq_rx_complete() into
vmxnet3_process_xdp() or vmxnet3_process_xdp_small(), which do:

	xdp_prog = rcu_dereference(rq->adapter->xdp_bpf_prog);

Could this run the freed program on every received packet?

A later attach of another program would see old_bpf_prog == P and call
bpf_prog_put() on the freed program. dev_xdp_uninstall() only calls
ndo_bpf for modes the core has recorded, so unregister would not clear
the stale pointer either.

The detach case (old P, new NULL) can still end up in the same state.
The same failure leaves the driver with NULL after P has already been
put, while the core still reports P as attached. That is the core/driver
disagreement the commit message describes.

The commit message says:

  "The program is exchanged and released by vmxnet3_xdp_set()"

The error paths in vmxnet3_xdp_set() do not roll back the exchange,
though. Would it be safer to publish the new program and put the old one
only after vmxnet3_activate_dev() succeeds? Another option would be to
restore old_bpf_prog on the error paths without dropping its reference.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122002847.616-1-filzador%40gmail.com
