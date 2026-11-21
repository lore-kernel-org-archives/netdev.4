Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225824;
	b=ZCZ8PVyjCcY/KoXK8WuqFqutdWLl9nM9wMDi8SZhoi0Q34QTXKXkaPwzzlKtg9KCPp/U
	 FtzFZM5rlLZFSzb2/zhKYC3l1almAjrC2TszuY6u/D8HYjKbU7LfvcgNogSiCr6Q69BUg
	 wWPBF3TfDR/fLkZH9JOz/Ji4ZDEVb/Y/vV4oCSfoE30NfFARqZ3pSIiHBg3esfBC5YqHf
	 UHpYh1l/jCCGofj+CNIbpU8FZOw8kFXvnE+TkwU+wH7EmjP31fi8civhUe4C/VyQzZWZG
	 aJo2jWPa74u6ldwjHQ/qW8+aUZqoddoi3a7wEkq4fJZrmiVpd/CRX6A4fdC+HFeadzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225824;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ngYwgfdeC8tM2vLALasck0hhBjZwgFRev5da8Gpz1k8=;
	b=njYxWjXeCnwN9JMfb+cL1UYAnxBnjXXqvbhhT3AhNXFfDKoLL7Qx3MIt/AaLwjH85MG9
	 apwdDcuzAynPSC3fR7xwkdASi9mGd6oQP7vRokdqUYOzLoRDBBsMkZg6bhLz3J2aBdgPJ
	 l/ZXSKhM75K/HpJWDcnkTHy5p9cxcx3IHbHi3YWrkRmcQj0M4EM30PSLkJf7PR7Xw1H0N
	 aVsGDX3iHyw2Q9b1wzqOx56ZWKYR9JjYWvxAvUckfJ/GF9mdOv7zgYG/c/eTTE0y8t3UJ
	 I7JzXTmA0e6JbDUchaiEaKlrd8abAZfezRcZp/2klnO7dS4GVCzSNlJ+CCMWCB4VSAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzENRqz+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C27606A687;
	Sat, 21 Nov 2026 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzENRqz+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAF11F000E1;
	Sat, 21 Nov 2026 01:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225823;
	bh=ngYwgfdeC8tM2vLALasck0hhBjZwgFRev5da8Gpz1k8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FzENRqz+vZzWWMMqcxuW2G/ON6ca5tFdkeBpuS92CKqM2OY28TmXI9uoiKCkujUSI
	 DnlsddxSaV2l7gVyYGcc2ynCc05X5qmCp/4Teb6nchokjoI+5/b2FLJq7ZWzhgQ8lW
	 a7JfaWnrZPtSRY9pMqfwZzcE64MZrgZibvJLi186B+FwjB1N0IpRYO7VDcEUNBd+sn
	 J0Md3Xv6Mz2ccoAGWEW8xSqD15HeE3cuV9TvESDyVVUS5KnSjtin6080SzqeUnVfos
	 L+7f8oJM9AqPsTDUcVpZvpifCcgw7FzjRXHFW/pEDA4Px4w/e8Cc+O4NTK5AnJGrGz
	 MxqosyAHAUubg==
Subject: Re: [PATCH net v1] r8169: fix RTNL deadlock in runtime suspend
From: netdev-bot+sashiko@kernel.org
To: stefanomunari.sm@gmail.com
Cc: hkallweit1@gmail.com, nic_swsd@realtek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 01:50:22 +0000
Message-ID: <179522582267.3135.2912031877143705376@kernel.org>
In-Reply-To: <20261118000631.17771-1-stefanomunari.sm@gmail.com>
References: <20261118000631.17771-1-stefanomunari.sm@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch makes rtl8169_runtime_suspend()
  (drivers/net/ethernet/realtek/r8169_main.c) return -EBUSY whenever…

--

r8169: fix RTNL deadlock in runtime suspend

This patch replaces rtnl_lock() in rtl8169_runtime_suspend() with
rtnl_trylock(), and returns -EBUSY when RTNL is contended. The goal is to
avoid an ABBA deadlock. The runtime suspend callback keeps the device in
RPM_SUSPENDING while it waits for RTNL. Meanwhile, RTNL holders such as
rtl8169_close() and the ethtool paths wait in pm_runtime_get_sync().

> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> index f151ab6813932..c60d87015eb94 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -5975,7 +5975,14 @@ static int rtl8169_runtime_suspend(struct device *device)
>  		return 0;
>  	}
>  
> -	rtnl_lock();
> +	/*
> +	 * Do not block on RTNL.
> +	 * Other callers holding RTNL may wait for suspend to complete
> +	 * in pm_runtime_get_sync(), which would deadlock.
> +	 */
> +	if (!rtnl_trylock())
> +		return -EBUSY;

[Severity: Medium]
Once this returns -EBUSY, does anything schedule another runtime suspend
attempt?

r8169 arms the suspend from rtl8169_runtime_idle() with a plain timer
request, not with autosuspend:

drivers/net/ethernet/realtek/r8169_main.c:rtl8169_runtime_idle() {
    ...
	if (!netif_running(tp->dev) || !netif_carrier_ok(tp->dev))
		pm_schedule_suspend(device, 10000);
    ...
}

pm_schedule_suspend() leaves timer_autosuspends at 0. As a result,
pm_suspend_timer_fn() calls rpm_suspend() with RPM_ASYNC but without
RPM_AUTO. The driver also never calls pm_runtime_use_autosuspend() or
pm_runtime_mark_last_busy().

On -EBUSY, the fail path of rpm_suspend() only retries for autosuspend:

drivers/base/power/runtime.c:rpm_suspend() {
    ...
	if (!dev->power.runtime_error && (rpmflags & RPM_AUTO) &&
	    pm_runtime_autosuspend_expiration(dev) != 0)
		goto repeat;

	pm_runtime_cancel_pending(dev);
    ...
}

So the pending request and the suspend timer are both cancelled.

The comment in pci_pm_runtime_suspend() says "-EBUSY and -EAGAIN is used
to request the runtime PM core to schedule a new suspend". The core
doesn't do that for non-autosuspend requests, though.

After that, the suspend is only re-armed if rtl8169_runtime_idle() runs
again. That happens on:

  - open/close
  - the LED helpers, which use pm_runtime_put_sync()
  - the ethtool core's pm_runtime_put() in net/ethtool/ioctl.c and
    net/ethtool/netlink.c
  - rtl_mac_link_down(), which calls pm_runtime_idle()

rtl8169_get_stats64() uses pm_runtime_put_noidle(), so stats reads don't
re-arm it.

The patch targets a setup where the interface is up with no carrier and
power/control is set to auto. In that setup the link-down event has
already happened.

Suppose an unrelated task holds RTNL when the 10s timer fires. Examples
are a netlink or ethtool request for another NIC, a netdev notifier, or
an ip -s link dump. Can the NIC then stay in D0 indefinitely, without
WAKE_PHY armed? Before this patch, rtnl_lock() waited, so the suspend
always completed.

The commit message says:

    If RTNL is held by an unrelated task, the device stays
    active until the next idle check (usage count drop or link down).

Is a next idle check actually guaranteed in this setup?

This also looks like the "trylock with fallback to skip the work
entirely" pattern. That pattern is only acceptable when the failure path
reschedules the work.

Would one of these approaches work instead?

  - Convert the driver to autosuspend, using pm_runtime_use_autosuspend()
    plus pm_runtime_mark_last_busy() before returning -EBUSY, so the PM
    core retries.

  - Re-arm from the driver after the callback returns, for example with a
    work item that calls pm_runtime_idle() or pm_schedule_suspend().
    Re-arming from inside the callback won't work, because
    pm_runtime_cancel_pending() in the fail path cancels it.

  - Restructure the suspend path so it doesn't need RTNL.

>  	__rtl8169_set_wol(tp, WAKE_PHY);
>  	rtl8169_net_suspend(tp);
>  	rtnl_unlock();

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118000631.17771-1-stefanomunari.sm%40gmail.com
