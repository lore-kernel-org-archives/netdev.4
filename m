Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557657;
	b=2cA/ObksbVFbEueFXmr5RA/yEJsTRg3qxA4tVPAc5QlFWqHEj3dQ/58W4b/bAqiysZnM
	 9E/pCzrhW6cI5NS3z9kdNgyIuepTVB1orlq82O37r9pCmSel3u5Cm5K9PjYuvIQ8VrC/Y
	 MdViB4s3hlEVgd1CzAcrjYHD5t4EDct/yskZwbBe3U8xKjDzUHxwIScR5tApFg21y2QX4
	 ddiMbpJ9STv+hyXYLynLQ1ZRerZIeF0CdIZpaC2lw1NQznAJQW/y3wDfbmFaks7w9QF3e
	 DXZ0j+GbprgJNuQYSu4UelPrxqHfnIFXC1dY30iswsRdTiLP19An+D1YBEbhIyM+qUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557657;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FVH5FPtfJO7PCnnlFrVIHQchlOb+hJTsrV7TH24bPa0=;
	b=HpIApohu+wrDBadDmzKtKmtinKSjzALdNiX+aWl/C2AjA1LQ6r8WCwUnpeiUpidt28sQ
	 HmOBSJhPsq0Jea/xY7cL17TW715WJBxk3dQyRUZnQe36Lu1fB85i+iCokos9pWkbgAHFI
	 e+H9nWRd1BUJHwSlb3xQAHQntgnN1N172jbwuZGeM9G9vXS8mFFzvzVJSPJYv5dBxPiMf
	 Qg9hUIFOS/xy/3cHWbiqdPd/f42e6E7OXh/tPZXwL/Ry+ksrJnjXLn7QDQaPM141Grj6W
	 3j1iKbeFPVq90JaRkVtu44exbeG2/9WzsUHppeXVw7wTHC/OKmTvJiiDWfJWdD3wMcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kp23W1rt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE763606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kp23W1rt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DBA1F000C4;
	Tue, 24 Nov 2026 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557657;
	bh=FVH5FPtfJO7PCnnlFrVIHQchlOb+hJTsrV7TH24bPa0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kp23W1rtlEdn3OD2E7JySTO+KlPpinOB7n9ZDXXzn8lrFSb816IrbMpWt6wpm5Uyv
	 EIcI+1CdV5hlbwkPof5ummZHUO7qukAgVOPv/SKMOop1QEIwHt/3aQOGO1qDpWridG
	 h+TtjsEAruyA71EuK0KKts85s3+X3KaAG+vz3vxzS+fvHZ7bq984JNumMkzkqT5Z2B
	 NfjapZyepyXGUt5SIC+bAD7TiWze/c3tSYlZbm/tcRaZ7Kv8vHRHRgwGbelD4+KPLX
	 Vu4Vagvi8TJrx+s7MDDpfdB01sLM0I1hXhHvX1AffDpjAy14K9SIqtf+/7ymSIc/PN
	 YV6k+qo6VoFvw==
Subject: Re: [PATCH net 1/4] ixgbe: fix MDIO bus lifetime
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 tomasz.lichwala@linux.intel.com, ripatel@wii.dev, xiaolinkui@kylinos.cn,
 xiaolinkui@126.com, runyu.xiao@seu.edu.cn, horms@kernel.org,
 marcin.szycik@linux.intel.com, przemyslaw.kitszel@intel.com,
 rafal.romanowski@intel.com
Date: Tue, 24 Nov 2026 22:00:56 +0000
Message-ID: <179555765601.3135.4530614438146845451@kernel.org>
In-Reply-To: <20261120220022.3133664-2-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-2-anthony.l.nguyen@intel.com>
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

- [Medium] The patch now clears adapter->mii_bus only after
  unregister_netdev() has returned.

--

ixgbe: fix MDIO bus lifetime

This commit changes ixgbe_mii_bus_init() to register the MDIO bus with
devm_mdiobus_register() on the netdev device. The bus is then unregistered
and freed when unregister_netdev() runs device_del(). The explicit
mdiobus_unregister() calls in the FW error path and in ixgbe_remove() are
dropped, and adapter->mii_bus is now cleared after unregister_netdev() in
both the unsupported SFP path and the FW error path.

> diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> index b9496f0bee131..2b6d1177addab 100644
> --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> @@ -8471,6 +8471,7 @@ static void ixgbe_sfp_detection_subtask(struct ixgbe_adapter *adapter)
>  		e_dev_err("Reload the driver after installing a "
>  			  "supported module.\n");
>  		unregister_netdev(adapter->netdev);
> +		adapter->mii_bus = NULL;
>  	}
>  }
>  
> @@ -8693,11 +8694,8 @@ static void ixgbe_service_task(struct work_struct *work)
>  	}
>  	if (ixgbe_check_fw_error(adapter)) {
>  		if (!test_bit(__IXGBE_DOWN, &adapter->state)) {
> -			if (adapter->mii_bus) {
> -				mdiobus_unregister(adapter->mii_bus);
> -				adapter->mii_bus = NULL;
> -			}
>  			unregister_netdev(adapter->netdev);
> +			adapter->mii_bus = NULL;

[Severity: Medium]

With the NULL store moved after unregister_netdev(), does adapter->mii_bus
point at a freed bus for a while?

The bus is now registered via devm on &adapter->netdev->dev in
ixgbe_mii_bus_init(), so unregister_netdev() itself unregisters and frees
it:

unregister_netdev()
  unregister_netdevice_many_notify()
    netdev_unregister_kobject()
      device_del()
        devres_release_all()
          mdiobus_unregister() + mdiobus_free()
            put_device() -> mdiobus_release() -> kfree(bus)

phy_mask is GENMASK(31, 0), so no PHY devices hold extra references. That
means the bus memory really is freed at this point.

Next, unregister_netdev() calls rtnl_unlock() -> netdev_run_todo(). That
function drops RTNL early and then sleeps in rcu_barrier() and
netdev_wait_allrefs_any(). During that whole wait, adapter->mii_bus still
holds the stale pointer and no lock is held.

The old FW error code cleared the pointer before it called
unregister_netdev(). The new hunk in ixgbe_sfp_detection_subtask() has the
same after-the-call ordering.

The reader is ixgbe_mdio_read() (and likewise ixgbe_mdio_write()). It
checks the pointer without a lock and then dereferences it:

	if (adapter->mii_bus) {
		...
			return mdiobus_c45_read(adapter->mii_bus, prtad,
						devad, regnum);

		return mdiobus_read(adapter->mii_bus, prtad, regnum);

Both calls take bus->mdio_lock, which is inside the freed object.

ixgbe_reset() can get to this reader without RTNL, for example from
ixgbe_io_slot_reset() or ixgbe_resume():

ixgbe_reset()
  hw->mac.ops.init_hw / reset_hw
    phy.ops.identify -> ixgbe_identify_phy_generic()
      ixgbe_probe_phy()
        mdio45_probe()
          hw->phy.mdio.mdio_read == ixgbe_mdio_read()

Nothing serializes these paths against the service task. The service task
is only cancelled in ixgbe_remove().

This chain only runs when hw->phy.type == ixgbe_phy_unknown. In the trigger
paths traced so far, phy.type was already known, so no concrete
interleaving has been shown. It also hasn't been ruled out for every
MAC/PHY combination.

Would it be safer to clear adapter->mii_bus before calling
unregister_netdev() in both ixgbe_service_task() and
ixgbe_sfp_detection_subtask(), as the old FW error path did?
WRITE_ONCE()/READ_ONCE() or a shared lock around the pointer might also be
worth considering.

>  		}
>  		ixgbe_service_event_complete(adapter);
>  		return;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120220022.3133664-1-anthony.l.nguyen%40intel.com
