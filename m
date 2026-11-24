Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557663;
	b=MGEYGfOjviNxVOxAknUiH3/WztqvOo5FZwVa6zOcJjsWRUB5MNKnFTplHRgNRrBFNomf
	 agw5ZT8UhHIDb6h2M0/euJLi6tVs0sLPG9PXjcMEuAoUcP819OSizLalN++joUCXPr5mK
	 fKWELAUYAh9q+4ybx7goafpiYYPwgRbvPybPmrXfWRx+3cXm4wXQ7B/XNRez2m8+BVHWF
	 FxJ8cBmuDOKk42x+7ielqJO2bok5Jib9h8iZdKi7cmlONWXvXW3ppOTOXKPvhaY5MisQe
	 bjjcdKFLmsYrF6BcMlZZU5p6VgRChTusp0L8tLekBLltRq/bbvMGKTKQOeZh/Sr8kmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557663;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7Iw06C0uAQE8VpS3U2wauc0pen/95IfFi8+ybk4rgMc=;
	b=yZDvQmRaztFyqDs2IHudCMXlniwAlHWueNUnwfIKyFY+AERyCgfYeB8I8jfbmSHmNHEV
	 mPfMiKeprg7EISAY4dfMJyDxkG7qyYrovaROp/H2g7eJhJ+JOQrxLhywsba/DVgpr6h7n
	 aTSxR14LQWfG7lqjA72BnokAl501qwss6fdfa63OimW7X1EhpocSGOXMda1LYNjc8bgWs
	 CJQfHZqPmKhRElnDmsytCKqVqrIwNnJWpuBhZZvhoxMAd5gXItawi4Selnj6QzgOoYkdz
	 33BnJWur8rrmkc7qoopNj5GH78DBqgf/oHMyEHSOKGXFV7dYFx/UsthOMDyCJ9H46Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mxy//ikf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD9606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mxy//ikf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF19F1F000D1;
	Tue, 24 Nov 2026 22:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557662;
	bh=7Iw06C0uAQE8VpS3U2wauc0pen/95IfFi8+ybk4rgMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mxy//ikf1Ou6fUU2MPhl3ecbDRa5FYHxpNUsM30uAxf1nleYNuRlLyANEdkS5CCP3
	 gk/umybYRk+LQZo9OIt+XBpNlvs0aW9Bxn4v2Yt79ktoGxPFChG4JLRLPmojX93Z9Z
	 SB2Ms4w8HH4FK1lZ/INKRcLB6dIAjNkna5zWmatdJWDV3tIlBM8RYLb1Uwgt9of4ah
	 VDTwXFgsVh2k9ammxTR1zZBbZGuhzGsuYlfWNi/JTdeTKtBv3QYoSx9suVtGAolqJv
	 MwnpIOjtzVNShiCchzfL1sigAy/3PpaQzU+bozAUFcThdQxhPRME/k/GlaRxIVhy4G
	 N9ooQ7KnLsVcw==
Subject:
 Re: [PATCH net 4/4] net: fm10k: shut down the service timer during removal
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 tomasz.lichwala@linux.intel.com, ripatel@wii.dev, xiaolinkui@kylinos.cn,
 xiaolinkui@126.com, runyu.xiao@seu.edu.cn, horms@kernel.org,
 marcin.szycik@linux.intel.com, przemyslaw.kitszel@intel.com,
 rafal.romanowski@intel.com
Date: Tue, 24 Nov 2026 22:01:01 +0000
Message-ID: <179555766132.3135.9591349459787272243@kernel.org>
In-Reply-To: <20261120220022.3133664-5-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-5-anthony.l.nguyen@intel.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message gives the wrong reason why timer_delete_sync()
  is not enough.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the service
  work item has the same lifetime bug as the timer this patch fixes, and…

--

net: fm10k: shut down the service timer during removal

This commit changes fm10k_remove() to stop the service timer with
timer_shutdown_sync() instead of timer_delete_sync(). After the change, the
timer cannot be rearmed once teardown starts, so it is not left pending
after free_netdev().

> The fm10k service timer rearms itself from its callback. During PCI
> removal, timer_delete_sync() waits for a running callback but does not
> prevent a callback or another service path from rearming the timer. This
> can leave the timer referencing the fm10k_intfc after free_netdev().

[Severity: Low]
Is the callback self-rearm really why timer_delete_sync() falls short here?

timer_delete_sync() already handles a timer that rearms itself from its own
callback. __timer_delete_sync() keeps retrying while the callback runs:

kernel/time/timer.c:__timer_delete_sync() {
    ...
	do {
		ret = __try_to_del_timer_sync(timer, shutdown);
		if (unlikely(ret < 0)) {
			del_timer_wait_running(timer);
			cpu_relax();
		}
	} while (ret < 0);
    ...
}

fm10k_service_timer() calls mod_timer(&interface->service_timer,
(HZ * 2) + jiffies). After the callback returns, the next pass of this loop
detaches the timer that call just armed.

The rearm that timer_delete_sync() cannot stop looks like it comes from
fm10k_up():

drivers/net/ethernet/intel/fm10k/fm10k_pci.c:fm10k_up() {
    ...
	/* kick off the service timer now */
	hw->mac.get_host_state = true;
	mod_timer(&interface->service_timer, jiffies);
}

fm10k_up() is reached through fm10k_open(), both from ndo_open and from
the service task reset path:

fm10k_reset_subtask()->fm10k_handle_reset()->fm10k_open()->fm10k_up()

Both can run between the timer delete and
fm10k_stop_service_event()/unregister_netdev() in fm10k_remove().
fm10k_down() does not delete the timer, so a timer rearmed this way is
still pending after free_netdev().

The code change itself looks correct, since timer_shutdown_sync() turns
those later mod_timer() calls into no-ops.

Could the commit message name fm10k_up() and the fm10k_open() paths
instead of the callback self-rearm? That way stable backporters see the
mechanism that actually needs the fix.

> diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> index afe939f8f4efe..c830417b112ce 100644
> --- a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> +++ b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> @@ -2243,7 +2243,7 @@ static void fm10k_remove(struct pci_dev *pdev)
>  	struct fm10k_intfc *interface = pci_get_drvdata(pdev);
>  	struct net_device *netdev = interface->netdev;
>  
> -	timer_delete_sync(&interface->service_timer);
> +	timer_shutdown_sync(&interface->service_timer);
>  
>  	fm10k_stop_service_event(interface);

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but does
service_task have the same lifetime problem the timer had?

Only bit flags guard the work item. fm10k_service_event_schedule() tests
DISABLE, and then, as a separate step, does test_and_set_bit(SCHED) and
queue_work():

void fm10k_service_event_schedule(struct fm10k_intfc *interface)
{
	if (!test_bit(__FM10K_SERVICE_DISABLE, interface->state) &&
	    !test_and_set_bit(__FM10K_SERVICE_SCHED, interface->state)) {
		clear_bit(__FM10K_SERVICE_REQUEST, interface->state);
		queue_work(fm10k_workqueue, &interface->service_task);
	...
}

fm10k_msix_mbx_pf() calls this from the mailbox IRQ. That IRQ stays
registered until fm10k_mbx_free_irq(), which fm10k_remove() calls well
after fm10k_stop_service_event(). cancel_work_sync() leaves the work
enabled when it returns, so it can be queued again:

CPU1 (mbx IRQ)                      CPU0 (fm10k_remove)
fm10k_service_event_schedule()
  test_bit(DISABLE) == 0
                                    fm10k_stop_service_event()
                                      set_bit(DISABLE)
                                      cancel_work_sync()  /* idle */
                                      clear_bit(SCHED)
  test_and_set_bit(SCHED) == 0
  queue_work(service_task)

fm10k_service_task() never checks __FM10K_SERVICE_DISABLE, and
fm10k_remove() never cancels or flushes service_task again.

Can the work then run at the same time as unregister_netdev(),
fm10k_iov_disable(), fm10k_clear_queueing_scheme() and the iounmap()
calls? If the worker is delayed, can it even run after free_netdev() has
freed the fm10k_intfc that holds the work_struct?

fm10k_tx_timeout_reset() and fm10k_msix_mbx_vf() appear to have the same
window between the check and the queue_work().

Would calling disable_work_sync(&interface->service_task) in
fm10k_remove() close this? Cancelling the work again after
fm10k_mbx_free_irq() might also work.

>  	fm10k_stop_macvlan_task(interface);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120220022.3133664-1-anthony.l.nguyen%40intel.com
