Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454041;
	b=o0W4lzV8e3vcZRIbeajZJ4kWEGpGUWLCaTml7MIpbMwGQR7G/EimjX3+p/uF5VfENvvp
	 LIA+ni3hyYXBf2nF9jWdI3pGqMnczNsZhOYFJ2vWAx7QFdsG/wwujudiFfJyxe+lj7eLZ
	 bllM/l0jxNYc8EakNZ8Ru40xHCuPd9/qTsPuyPTmN0PiJBCUMM9fl4K/RGQGLtb/Nuy5k
	 lfRpLClj5PmKwR2+L3/oy5NpRCCM2xP6jefpvtrssPs3I6OhMEyTVHAhoeQquC97MiD0u
	 SDJDJpgz0jLD+V6TGVSeRJgDQtthadyscb3o9oqpGNjmXl9rvCLlVTQeqNEq1JExjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454041;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=78jy483vydXvK4ltornXtEtoywkGAA7A3QJIuSYEOhk=;
	b=ZHfnrG10Crv6O3QI5SY2wg+n/tuHa6xoME5QydbnbKNdvYwgGXZPSNYXlcW1uWG4pwV1
	 hEU7ooxugUpUvdXEzdrrM90DIKtMhoKqI/xlNH3w/b646f62t1fdxPulZct6972NEh0Am
	 T45SuDCOxhBaADCkWQ8NpQOjI2hBAUHQg09iXBbxX5UV42HQ44ne4EPPi+9kng4uaHHhw
	 vGXinnn6QSp8N8/1Q4rWlQ4uHVaXfh7ZCrX6Rr73mZA4UXHV5b3SMxGVCA9n6HQFYB/44
	 GdzVZH+glmMqB+dmjNlzxejRFS8Q26TPnLVgntKApdO7i+SdDyb3gMkm+6XLJvy+Opg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8eZOIXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE0606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8eZOIXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92991F000C4;
	Mon, 23 Nov 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454040;
	bh=78jy483vydXvK4ltornXtEtoywkGAA7A3QJIuSYEOhk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U8eZOIXAjxgeoiQO4it/28fvml6bUCB2gJiyrS8DYsrrwdbIsm8niCnap5YgX+46O
	 r3xZ4lkFcCXt4XgZZQjjV4JDFsYVsueQkthuSw6be6PcwOiJTmZ/K8eQ9R6y/DwQKh
	 /U0bG5u+kJIt037k7vxxvsVcKdTCdvZuF+t//L5W81tH1aTl9tmKmUinvLvq7yqppD
	 tv5XWF+Hx4/rFZvcdkyES0G8PzMGPaV7cjU3LfV6GOVZ8Wg3gsGWn5bUphVKKUsZXk
	 5pmpygQu94f1C42wwD+30DWseZr4Tb9A51D51GBjr2eNX23ZX3U6ZMLC09EZ2JefU7
	 U0/7wJpIQY4Gg==
Subject:
 Re: [PATCH] net: cxgb3: complete the cleanup operations on error paths
From: netdev-bot+sashiko@kernel.org
To: b.lane130@outlook.com
Cc: bharat@chelsio.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org
Date: Mon, 23 Nov 2026 17:13:59 +0000
Message-ID: <179545403948.3135.3451259084551088603@kernel.org>
In-Reply-To: <BN8PR06MB6177F1B73B4D37AC2315B428A4462@BN8PR06MB6177.namprd06.prod.outlook.com>
References: <BN8PR06MB6177F1B73B4D37AC2315B428A4462@BN8PR06MB6177.namprd06.prod.outlook.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new unwind under out_close_led in init_one()
  (drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c, lines 3384-3391)…
- [Low] The commit message says only that the error path in init_one()
  'lacks some cleanup operations to release sources', which reads like a…

--

net: cxgb3: complete the cleanup operations on error paths

This patch adds offload unregistration, netdev unregistration and MSI
teardown to the out_close_led error path in init_one(). That path is
taken when sysfs_create_group() fails after the ports have been
registered.

> If sysfs_create_group() fails, the error path lacks some
> cleanup operations to release sources. Add corresponding
> cleanup functions under out_close_led label.

[Severity: Low]

Does this description undersell what the patch fixes? Before this change,
out_close_led fell straight through to out_free_dev. That calls
free_netdev() on ports still in NETREG_REGISTERED, which hits this check:

net/core/dev.c:free_netdev() {
    ...
	BUG_ON(dev->reg_state != NETREG_UNREGISTERED);
    ...
}

The adapter was also kfree()d while its t3cdev was still on the offload
device list via cxgb3_adapter_ofld()->register_tdev().

This failure path seems to have come from commit 7c099773b086 ("net: cxgb3:
add error handling for sysfs_create_group").

Should the commit message mention the BUG_ON and the use-after-free? Should
it also carry a Fixes: tag for that commit?

> diff --git a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> index 3bee82bc06806..a6693f332d259 100644
> --- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> +++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> @@ -3381,6 +3381,15 @@ static int init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	return 0;
>  
>  out_close_led:
> +	if (is_offload(adapter))
> +		cxgb3_adapter_unofld(adapter);
> +
> +	for_each_port(adapter, i)
> +		if (test_bit(i, &adapter->registered_device_map))
> +			unregister_netdev(adapter->port[i]);
> +
> +	cxgb_disable_msi(adapter);
> +
>  	t3_set_reg_field(adapter, A_T3DBG_GPIO_EN, F_GPIO0_OUT_VAL, 0);
>  
>  out_free_dev:

[Severity: High]

Is this teardown complete if a port was opened before sysfs_create_group()
failed?

Userspace can see the netdevs as soon as register_netdev() returns. So
udev, NetworkManager or "ip link set up" can open a port before
sysfs_create_group() runs. Opening a port goes through
cxgb_open()->cxgb_up(), which does:

cxgb_up()
    setup_sge_qsets(adap)
    request_irq() with dev_id == adapter
    t3_start_sge_timers(adap)
    adap->flags |= FULL_INIT_DONE

On an offload adapter, offload_open() also sets OFFLOAD_DEVMAP_BIT in
open_device_map and calls cxgb3_offload_activate(). That may register the
netevent notifier, and it adds the adapter to the global adapter_list.

remove_one() tears down the same state like this:

	t3_sge_stop(adapter);
	...
	if (is_offload(adapter)) {
		cxgb3_adapter_unofld(adapter);
		if (test_bit(OFFLOAD_DEVMAP_BIT,
			     &adapter->open_device_map))
			offload_close(&adapter->tdev);
	}
	... unregister_netdev() ...
	t3_stop_sge_timers(adapter);
	t3_free_sge_resources(adapter);
	cxgb_disable_msi(adapter);

The new error path is missing t3_sge_stop(), offload_close(),
t3_stop_sge_timers() and t3_free_sge_resources().

While OFFLOAD_DEVMAP_BIT is still set, open_device_map stays non-zero after
unregister_netdev()->__cxgb_close(). So cxgb_down() is skipped:

	if (!adapter->open_device_map)
		cxgb_down(adapter, on_wq);

That leaves the IRQs requested and interrupts enabled, and cxgb3_wq is not
flushed. cxgb_disable_msi() then disables MSI/MSI-X vectors that may still
have handlers attached. Even without offload, cxgb_down() does not stop the
SGE reclaim timers or free the qsets.

The code then falls through to iounmap(adapter->regs), free_netdev() and
kfree(adapter).

Can sge_timer_tx() and sge_timer_rx() still fire after that? They
dereference qs->netdev and pi->adapter, read registers through
adapter->regs, and rearm themselves with mod_timer().

There are other leftovers too:

- The IRQ handlers would still have a freed dev_id.
- adapter_list and the netevent notifier would still point at the freed
  adapter.
- The SGE DMA rings would leak with their hardware contexts still enabled,
  because only t3_free_qset() disables them.

The sysfs_create_group() failure can happen in practice. If
register_netdev() failed for port[0] but another port registered,
port[0]->dev.kobj has no sysfs directory. internal_create_group() then
returns -EINVAL.

Would it be better to follow the teardown order in remove_one()?
Alternatively, the failure point after register_netdev() could go away
entirely, for example by attaching cxgb3_attr_group through
port[0]->sysfs_groups[] before registration.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BN8PR06MB6177F1B73B4D37AC2315B428A4462%40BN8PR06MB6177.namprd06.prod.outlook.com
