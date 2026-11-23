Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393928;
	b=bzxvY5yeA88MZx0j78a4JW6ds3temJPEDA5mseO7Th1wejGNLwzwIckOGZeNELO+ZFTZ
	 irPCozI1S5mSVqy9qqBei0+TA0HsRWlMlE9bTNr9TWfJ1y4PmjYG7RuAkUQYUPm2d8cO9
	 EL61wdI7RT06l2VjWTVligx1+pobXhc+aRJAy5StwGlu4gsTJOacRI88aMqcgwI+/vJv9
	 HLlKJv3Xzys+x78l2t8NUb+YObUpciZD8kgi0ITm3lqOV0366TxYFTBfwe/cnNXtmLZjs
	 U/hh+gA9vwuosxBgR0ksSUAT7rneQZ6DgqbBBqo21sZOH7wLTKV+KrpVM7Egaw/qu4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393928;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YRKkf6nc7f3tZk7YlEhMT7qVdNgLPnpyZ43zRztHbsI=;
	b=he7fuv1wGA1qDm57gl6SWoEtYppYcZYMmBSZNxZ8Qdz3mQKBO0OSIWu59ThWXL0L2A5u
	 r5ywT+JYIVYysfMda4LT4D8SicMtRIJ1xBeG+M0shPo11yZfL1X1C/kPO5aS1Abz/Ghhd
	 I7Dipd5/p+ujs1PlJkMwqfyMMNlkrOCOaSWP+jWFYs6RInH6AyOJWv+syALl/TRj4jJd2
	 qgP3cKScvFGLxFJm8w/UZ029Qm08ELuDTeBCoAOMP2VyDYjL5cQ76O8yP2tI3p+i8Qtdp
	 06AuJdf9MnkvBtmDWwTGyWSuz9VLg7qFe1lsGTagcLstDZ3e4iuEYWowfK46E31lpqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVMkv766;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB09606A32C;
	Mon, 23 Nov 2026 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVMkv766
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243901F000C6;
	Mon, 23 Nov 2026 00:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393927;
	bh=YRKkf6nc7f3tZk7YlEhMT7qVdNgLPnpyZ43zRztHbsI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hVMkv766zzv7gAE+4/CLCVsMZAQckpNZ6lLX+v/X/avUIuHn5SQE5zcn4RKPJt6hQ
	 UfBfs/IAZAFiHKRYzb59kp5H/v3hM6BPLPAG6ornc78hFawCgd3MfqwaCkfstjWzak
	 4Q+iunlrUjECauSSthWWga9vCdmXUcD/uzobeBqfV6vXt+HXEXBLZWMFRsE8+7lLeE
	 /Jql5KIg92gQiLq0C9PuWnLKPVG88AlbbfJxMGBFbY7LyxbyP4NsvzKxptQij9GDa0
	 GuEY5ffm3n4w3DyEdYlrNkub4nQI9TkIfEN5jaNNDr1bYEnAZHb8AfSkE13Bj/lL4/
	 U9iU8il5y0r+w==
Subject:
 Re: [PATCH net-next v3 3/6] enic: recover V2 VF mailbox after request failure
From: netdev-bot+sashiko@kernel.org
To: satishkh@cisco.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com
Date: Mon, 23 Nov 2026 00:32:06 +0000
Message-ID: <179539392669.3135.1675208321907591748@kernel.org>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-3-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-3-2cb25677aa8c@cisco.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] enic_reset() still sends CMD_SOFT_RESET to V2 VFs through the
  generic enic_dev_soft_reset().
- [Medium] The commit message says the patch will "Keep other ENIC
  functions' capability and fallback behavior, with INIT deferred until…
- [Medium] The patch adds devcmd_lock around runtime CMD_INIT
  (enic_vnic_dev_init()) and the V2 CMD_HANG_RESET/CMD_HANG_RESET_STATUS…
- [Medium] enic: stale generation in enic_vf_mbox_recovery_finish()
  causes spurious reset
- [Low] Besides V2 VF mailbox recovery, the commit carries several
  changes that stand on their own and affect every ENIC function, with…

--

enic: recover V2 VF mailbox after request failure

This commit adds recovery for V2 VF mailbox failures. After a lost or
inconsistent reply, or a send timeout, the VF reconnects and re-registers
with the PF from the reset workers, using the hang-reset command pair. It
also tracks datapath open/stop pairing, detaches the netdev when a recovery
step fails, quarantines VF RX until registration completes, and moves VF
ACK transmission to a workqueue.

> diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
> index dde9098357d16..e6232927af808 100644
> --- a/drivers/net/ethernet/cisco/enic/enic_main.c
> +++ b/drivers/net/ethernet/cisco/enic/enic_main.c
> @@ -1038,12 +1038,13 @@ void enic_reset_addr_lists(struct enic *enic)
>  {
>  	struct net_device *netdev = enic->netdev;
>  
> +	netif_addr_lock_bh(netdev);
>  	__dev_uc_unsync(netdev, NULL);
>  	__dev_mc_unsync(netdev, NULL);
> -
>  	enic->mc_count = 0;
>  	enic->uc_count = 0;
>  	enic->flags = 0;
> +	netif_addr_unlock_bh(netdev);
>  }

[Severity: Low]
This isn't a bug, but this locking change looks like a fix for an
existing problem. Before this patch, enic_reset() and enic_pp.c called
enic_reset_addr_lists(), and so __dev_uc_unsync() and __dev_mc_unsync(),
while holding only RTNL.

Could this go in its own patch with a Fixes: tag?

Several other changes in this commit also affect every ENIC function, not
only V2 VFs:

  - enic_set_ringparam() gains netif_device_present() checks
  - __enic_stop() now frees IRQs before the queue disables and
    enic_dev_notify_unset()
  - enic_rq_indicate_buf() now tests vf_rx_quarantined for every packet
    in the shared RX path
  - VF ACKs for PF link state notifications now go through a workqueue

Could these be split out of the 750 line recovery commit, so they can be
reviewed and backported separately?

[ ... ]

> @@ -2036,6 +2154,46 @@ static int enic_dev_open(struct enic *enic)
>  	return err;
>  }
>  
> +static int enic_dev_hang_reset_start(struct vnic_dev *vdev, int arg)
> +{
> +	struct enic *enic = vnic_dev_priv(vdev);
> +	u64 a0 = (u32)arg, a1 = 0;
> +	int err;
> +
> +	/* Historical async PFs allow HANG_RESET for a V2 VF but reject the
> +	 * CMD_CAPABILITY query used by the generic helper.  Issue the known V2
> +	 * protocol command directly so that rejection cannot select SOFT_RESET,
> +	 * which those PFs do not allow.
> +	 */
> +	if (!enic_is_sriov_vf_v2(enic))
> +		return vnic_dev_hang_reset(vdev, arg);
> +
> +	spin_lock_bh(&enic->devcmd_lock);
> +	err = vnic_dev_cmd(vdev, CMD_HANG_RESET, &a0, &a1, 1000);
> +	spin_unlock_bh(&enic->devcmd_lock);
> +
> +	return err;
> +}

[ ... ]

> @@ -2062,6 +2225,21 @@ static int enic_dev_hang_reset(struct enic *enic)
>  	return err;
>  }
>  
> +static int enic_vnic_dev_init(struct enic *enic)
> +{
> +	int err;
> +
> +	/* Runtime init shares the device-command registers with statistics and
> +	 * other netdev operations. Probe-time init has no concurrent callers and
> +	 * intentionally remains direct.
> +	 */
> +	spin_lock_bh(&enic->devcmd_lock);
> +	err = vnic_dev_init(enic->vdev, 0);
> +	spin_unlock_bh(&enic->devcmd_lock);
> +
> +	return err;
> +}

[Severity: Medium]
The comment here says runtime devcmds share the command registers with
statistics. The V2 branches of enic_dev_hang_reset_start() and
enic_dev_hang_reset_done() take devcmd_lock for the same reason.

Are the other reset commands in these sequences still sent without that
lock?

enic_dev_soft_reset() is unchanged and polls with no lock held:

static int enic_dev_soft_reset(struct enic *enic)
{
	...
	err = enic_dev_wait(enic->vdev, vnic_dev_soft_reset,
			    vnic_dev_soft_reset_done, 0);
	...
}

The non-V2 branches also call vnic_dev_hang_reset() and
vnic_dev_hang_reset_done() without the lock. That covers their
CMD_CAPABILITY probes, CMD_HANG_RESET, and the new CMD_SOFT_RESET
fallback.

enic_dev_wait() can poll for up to about 2 seconds. In that window, a
stats read (for example /proc/net/dev) can issue CMD_STATS_DUMP on the
same registers:

enic_get_stats()->enic_dev_stats_dump()

That path holds devcmd_lock but not RTNL. _vnic_dev_cmd() returns -EBUSY
when it sees STAT_BUSY, and vnic_dev_cmd() memsets the shared
vdev->args[].

Before this patch a spurious reset failure was ignored. Now enic_reset()
and enic_tx_hang_reset() call enic_detach_after_recovery_failure() on any
reset error, and nothing in the driver calls netif_device_attach().

Can a concurrent stats read during recovery now leave the netdev detached
for good?

[ ... ]

> @@ -2271,135 +2482,335 @@ static void enic_admin_chan_reopen(struct enic *enic)

[ ... ]

>  static void enic_reset(struct work_struct *work)
>  {
>  	struct enic *enic = container_of(work, struct enic, reset);

[ ... ]

> +	if (READ_ONCE(enic->datapath_open))
> +		stop_err = __enic_stop(enic->netdev);
>  
> -	enic_stop(enic->netdev);
>  	if (enic_is_sriov_vf_v2(enic))
>  		enic_mbox_vf_link_state_reset(enic);
> +	if (stop_err || enic_control_dma_unresolved(enic)) {
> +		err = stop_err ?: -EBUSY;
> +		netdev_err(enic->netdev,
> +			   "Recovery blocked after close (datapath stop %d)\n",
> +			   stop_err);
> +		goto reset_out;
> +	}
> +
> +	err = enic_dev_soft_reset(enic);
> +	if (err) {
> +		enic_detach_after_recovery_failure(enic);
> +		goto reset_out;
> +	}

[Severity: High]
Can this permanently detach a V2 VF?

The commit message says deployed async PFs "deny soft reset and its
capability query". The comment in enic_dev_hang_reset_start() also says
SOFT_RESET is something "those PFs do not allow".

Yet enic_reset() still calls the generic enic_dev_soft_reset() for V2
VFs, and that function has no V2 branch.

A queue error on a V2 VF still schedules this worker:

enic_isr_msix_err()
	if (enic_log_q_error(enic))
		/* schedule recovery from WQ/RQ error */
		schedule_work(&enic->reset);

enic_isr_legacy() does the same. This patch also adds a V2-VF-only
trigger: __enic_open() calls enic_schedule_datapath_reset().

When SOFT_RESET is rejected, the worker has already closed the admin
channel and stopped the datapath. It then calls
enic_detach_after_recovery_failure() and skips both
enic_admin_chan_reopen() and __enic_open(). Before this patch the error
was ignored and the device was reopened.

Nothing in the driver calls netif_device_attach(). dev_open(), both reset
workers and enic_set_ringparam() all refuse a non-present device.

Because err is set, enic_vf_mbox_recovery_finish() does not schedule
tx_hang_reset either. So the hang-reset pair added for V2 VFs is never
tried on this path.

Would the interface stay out of service until the driver is rebound?

The last patch in the series still leaves this enic_dev_soft_reset() call
in enic_reset() unchanged.

Should V2 VFs use the hang-reset pair here instead?

> +	/* Firmware completes SOFT_RESET in OPEN state.  Non-dynamic vNICs need
> +	 * CMD_INIT to recreate and enable their LIF before resource restore.
> +	 */
> +	if (!enic_is_dynamic(enic)) {
> +		err = enic_vnic_dev_init(enic);
> +		if (err) {
> +			netdev_err(enic->netdev,
> +				   "vNIC init after soft reset failed: %d\n",
> +				   err);
> +			enic_detach_after_recovery_failure(enic);
> +			goto reset_out;
> +		}
> +	}

[Severity: Medium]
The commit message says:

  "Keep other ENIC functions' capability and fallback behavior, with INIT
  deferred until soft reset completes."

Does this match what changes for PFs, legacy VFs and dynamic vNICs?

First, enic_reset() now sends CMD_INIT after SOFT_RESET for every
non-dynamic vNIC. The old enic_reset() never did. The new comment reads
like a fix for an existing PF problem, but there is no Fixes: tag or
separate explanation for it.

Second, the vnic_dev_hang_reset() fallback used to call INIT for every
device:

-		err = vnic_dev_soft_reset(vdev, arg);
-		if (err)
-			return err;
-		return vnic_dev_init(vdev, 0);

enic_tx_hang_reset() now reissues INIT only when needs_init &&
!enic_is_dynamic(enic). So dynamic vNICs no longer get INIT on this path.
That matches probe, but it is a behavior change rather than a deferral.

Third, both reset workers now call enic_detach_after_recovery_failure()
when SOFT_RESET, HANG_RESET or INIT fails on any ENIC function, PFs
included. Before, the error was logged and the device was reopened.

Since nothing reattaches the device, one transient firmware failure
during recovery would leave a PF netdev unusable until rebind. The commit
message mentions detaching only for queue-stop failures.

Could the commit message describe these changes for non-V2 functions, or
could they go in separate patches?

[ ... ]

> @@ -2271,135 +2482,335 @@ static void enic_admin_chan_reopen(struct enic *enic)
>  		 */
>  		schedule_work(&enic->link_notify_work);
>  	}
> +
> +	return 0;
> +}
> +
> +static bool enic_vf_mbox_recovery_begin(struct enic *enic, u32 *generation)
> +{
> +	bool claimed = false;
> +
> +	/* Both reset workers claim ownership only after taking RTNL. This state
> +	 * lock still makes the handoff atomic with mailbox fault producers.
> +	 */
> +	spin_lock_bh(&enic->mbox_state_lock);
> +	if (!enic->vf_mbox_recovery_active) {
> +		enic->vf_mbox_recovery_active = true;
> +		*generation = enic->vf_mbox_fault_generation;
> +		claimed = true;
> +	}
> +	spin_unlock_bh(&enic->mbox_state_lock);
> +
> +	return claimed;
> +}
> +
> +static bool enic_vf_mbox_recovery_finish(struct enic *enic, u32 generation,
> +					 bool succeeded)
> +{
> +	bool restart;
> +
> +	spin_lock_bh(&enic->mbox_state_lock);
> +	/* Only a fully committed recovery may consume one late-fault retry. A
> +	 * failed handshake remains quarantined for an external recovery event;
> +	 * it must not create an unbounded reset/re-registration loop.
> +	 */
> +	restart = succeeded &&
> +		  enic->vf_mbox_fault_generation != generation;
> +	enic->vf_mbox_recovery_active = false;
> +	spin_unlock_bh(&enic->mbox_state_lock);
> +
> +	return restart;
>  }
>  
>  static void enic_reset(struct work_struct *work)
>  {
>  	struct enic *enic = container_of(work, struct enic, reset);
> +	bool recovery_owned = false;
> +	bool restart = false;
> +	bool reopen;
> +	u32 recovery_generation = 0;
> +	int stop_err = 0;
> +	int err = 0;
>  
>  	if (!netif_running(enic->netdev))
>  		return;
> -
>  	rtnl_lock();
> -
> -	if (!netif_running(enic->netdev))
> +	reopen = netif_running(enic->netdev);
> +	if (!reopen || !netif_device_present(enic->netdev))
>  		goto unlock;
>  
> -	/* Stop any activity from infiniband */
> +	/* Serialize a live V2 VF protocol recovery and preserve its one bounded
> +	 * late-fault follow-up.
> +	 */
> +	if (reopen && enic_is_sriov_vf_v2(enic)) {
> +		recovery_owned =
> +			enic_vf_mbox_recovery_begin(enic,
> +						    &recovery_generation);
> +		if (!recovery_owned)
> +			goto unlock;
> +	}
> +
> +	/* Stop any activity from infiniband. */
>  	enic_set_api_busy(enic, true);
>  
> -	/* Close the V2 admin/MBOX channel before the soft reset. Release its
> -	 * DMA resources only after both queues report stopped; otherwise
> -	 * quarantine the channel and abandon the reset.
> +	/* Close the admin channel before reset without sending DEL_MAC; reset and
> +	 * fresh registration discard the old VF-requested state. Release its DMA
> +	 * resources only after both queues report stopped. Otherwise quarantine
> +	 * the channel and abandon the reset.
>  	 */
>  	if (enic_has_admin_chan(enic)) {
> -		enic_admin_channel_close(enic);
> +		int close_err = enic_admin_channel_close(enic);
> +
> +		if (close_err && enic_admin_channel_is_quarantined(enic))
> +			netdev_err(enic->netdev,
> +				   "Admin queue did not stop: %d\n", close_err);
> +		else if (close_err)
> +			netdev_warn(enic->netdev,
> +				    "Admin QP disable returned: %d\n",
> +				    close_err);
>  		/* Channel close has drained registration replies. */
>  		if (enic_is_sriov_vf_v2(enic))
>  			WRITE_ONCE(enic->vf_registered, false);
>  	}
> -	if (enic_admin_channel_is_quarantined(enic)) {
> -		/* Core close excludes netpoll and clears __LINK_STATE_START first. */
> -		dev_close(enic->netdev);
> -		goto reset_out;
> -	}
> +	if (READ_ONCE(enic->datapath_open))
> +		stop_err = __enic_stop(enic->netdev);
>  
> -	enic_stop(enic->netdev);
>  	if (enic_is_sriov_vf_v2(enic))
>  		enic_mbox_vf_link_state_reset(enic);
> +	if (stop_err || enic_control_dma_unresolved(enic)) {
> +		err = stop_err ?: -EBUSY;
> +		netdev_err(enic->netdev,
> +			   "Recovery blocked after close (datapath stop %d)\n",
> +			   stop_err);
> +		goto reset_out;
> +	}
> +
> +	err = enic_dev_soft_reset(enic);
> +	if (err) {
> +		enic_detach_after_recovery_failure(enic);
> +		goto reset_out;
> +	}
> +	/* Firmware completes SOFT_RESET in OPEN state.  Non-dynamic vNICs need
> +	 * CMD_INIT to recreate and enable their LIF before resource restore.
> +	 */
> +	if (!enic_is_dynamic(enic)) {
> +		err = enic_vnic_dev_init(enic);
> +		if (err) {
> +			netdev_err(enic->netdev,
> +				   "vNIC init after soft reset failed: %d\n",
> +				   err);
> +			enic_detach_after_recovery_failure(enic);
> +			goto reset_out;
> +		}
> +	}
>  
> -	enic_dev_soft_reset(enic);
>  	enic_reset_addr_lists(enic);
>  	enic_init_vnic_resources(enic);
>  	enic_set_rss_nic_cfg(enic);
>  	enic_dev_set_ig_vlan_rewrite_mode(enic);
>  	enic_ext_cq(enic);
>  
> -	if (enic_open(enic->netdev))
> +	/* A V2 VF needs PF registration before enic_open() can install its
> +	 * station address.  A V2 PF reopens afterwards and replays carrier.
> +	 */
> +	if (enic_is_sriov_vf_v2(enic)) {
> +		err = enic_admin_chan_reopen(enic);
> +		if (err)
> +			goto reset_out;
> +	}
> +
> +	if (reopen)
> +		err = __enic_open(enic->netdev, false);
> +	if (reopen && err) {
> +		if (enic_is_sriov_vf_v2(enic) && enic_has_admin_chan(enic)) {
> +			int close_err = enic_admin_channel_close(enic);
> +
> +			WRITE_ONCE(enic->vf_registered, false);
> +			if (close_err)
> +				netdev_warn(enic->netdev,
> +					    "Admin close after datapath reopen failure returned: %d\n",
> +					    close_err);
> +		}
> +		netdev_err(enic->netdev,
> +			   "Failed to reopen datapath after reset: %d\n", err);
>  		goto reset_out;
> +	}
>  
> -	/* Re-establish the admin/MBOX channel after the data path is back up.
> -	 * It was fully torn down by enic_admin_channel_close() above;
> -	 * enic_admin_chan_reopen() reopens it and, for a PF re-pushes link
> -	 * state, or for a VF re-runs the probe-time PF handshake.
> +	/* A PF reopens its admin channel after the datapath and re-pushes link
> +	 * state.  The VF handshake, which open depends on, completed above.
>  	 */
> -	if (enic_has_admin_chan(enic))
> -		enic_admin_chan_reopen(enic);
> -	if (enic_is_sriov_vf_v2(enic) &&
> -	    enic_admin_channel_is_quarantined(enic))
> -		dev_close(enic->netdev);
> +	if (enic_has_admin_chan(enic) && !enic_is_sriov_vf_v2(enic)) {
> +		int admin_err = enic_admin_chan_reopen(enic);
> +
> +		if (admin_err)
> +			netdev_err(enic->netdev,
> +				   "Failed to reopen PF admin channel after reset: %d\n",
> +				   admin_err);
> +		if (!err)
> +			err = admin_err;
> +	}
>  
>  reset_out:
>  	/* Allow infiniband to fiddle with the device again */
>  	enic_set_api_busy(enic, false);
>  
> -	call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
> +	if (reopen)
> +		call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
>  
>  unlock:
> +	if (recovery_owned)
> +		restart = enic_vf_mbox_recovery_finish(enic,
> +						       recovery_generation,
> +						       !err &&
> +						       !enic_control_dma_unresolved(enic));
>  	rtnl_unlock();
> +	if (restart)
> +		schedule_work(&enic->tx_hang_reset);
>  }
>  
>  static void enic_tx_hang_reset(struct work_struct *work)
>  {
>  	struct enic *enic = container_of(work, struct enic, tx_hang_reset);
> +	bool mailbox_recovery = false;
> +	bool recovery_owned = false;
> +	bool restart = false;
> +	bool needs_init;
> +	bool reopen;
> +	u32 recovery_generation = 0;
> +	int stop_err = 0;
> +	int err = 0;
>  
>  	rtnl_lock();
> -
> -	if (!netif_running(enic->netdev))
> +	reopen = netif_running(enic->netdev);
> +	if (!reopen || !netif_device_present(enic->netdev))
>  		goto unlock;
> -
> -	/* Stop any activity from infiniband */
> +	if (reopen && enic_is_sriov_vf_v2(enic)) {
> +		recovery_owned =
> +			enic_vf_mbox_recovery_begin(enic,
> +						    &recovery_generation);
> +		if (!recovery_owned)
> +			goto unlock;
> +		mailbox_recovery =
> +			READ_ONCE(enic->vf_mbox_reconnect_required) ||
> +			READ_ONCE(enic->mbox_tx_poisoned);
> +	}
> +
> +	/* Stop any activity from infiniband. */
>  	enic_set_api_busy(enic, true);
>  
> -	/* Close the V2 admin/MBOX channel before the hang reset. Release its
> -	 * DMA resources only after both queues report stopped; otherwise
> -	 * quarantine the channel and abandon the reset.
> +	/* Report an actual Tx hang before stopping and cleaning its queue. Mailbox
> +	 * recovery reuses the VF-allowed hang-reset pair but must not report a
> +	 * spurious Tx hang. As in the soft-reset path, skip DEL_MAC because reset
> +	 * and fresh registration are the cleanup boundary. Release admin DMA only
> +	 * after both queues report stopped; otherwise quarantine the channel and
> +	 * abandon the reset.
>  	 */
> +	if (!mailbox_recovery)
> +		enic_dev_hang_notify(enic);
>  	if (enic_has_admin_chan(enic)) {
> -		enic_admin_channel_close(enic);
> +		int close_err = enic_admin_channel_close(enic);
> +
> +		if (close_err && enic_admin_channel_is_quarantined(enic))
> +			netdev_err(enic->netdev,
> +				   "Admin queue did not stop: %d\n", close_err);
> +		else if (close_err)
> +			netdev_warn(enic->netdev,
> +				    "Admin QP disable returned: %d\n",
> +				    close_err);
>  		/* Channel close has drained registration replies. */
>  		if (enic_is_sriov_vf_v2(enic))
>  			WRITE_ONCE(enic->vf_registered, false);
>  	}
> -	if (enic_admin_channel_is_quarantined(enic)) {
> -		dev_close(enic->netdev);
> -		goto reset_out;
> -	}
> -
> -	enic_dev_hang_notify(enic);
> -	enic_stop(enic->netdev);
> +	if (READ_ONCE(enic->datapath_open))
> +		stop_err = __enic_stop(enic->netdev);
>  	if (enic_is_sriov_vf_v2(enic))
>  		enic_mbox_vf_link_state_reset(enic);
> +	if (stop_err || enic_control_dma_unresolved(enic)) {
> +		err = stop_err ?: -EBUSY;
> +		netdev_err(enic->netdev,
> +			   "Recovery blocked after close (datapath stop %d)\n",
> +			   stop_err);
> +		goto hang_reset_out;
> +	}
>  
> -	enic_dev_hang_reset(enic);
> +	err = enic_dev_hang_reset(enic, &needs_init);
> +	if (err) {
> +		enic_detach_after_recovery_failure(enic);
> +		goto hang_reset_out;
> +	}
> +	/* Native HANG_RESET preserves firmware's desired admin state and the
> +	 * firmware reinitializes it.  Only the legacy SOFT_RESET fallback sets
> +	 * needs_init and requires the deferred CMD_INIT below.
> +	 */
> +	if (needs_init && !enic_is_dynamic(enic)) {
> +		err = enic_vnic_dev_init(enic);
> +		if (err) {
> +			netdev_err(enic->netdev,
> +				   "vNIC init after hang reset failed: %d\n",
> +				   err);
> +			enic_detach_after_recovery_failure(enic);
> +			goto hang_reset_out;
> +		}
> +	}
>  	enic_reset_addr_lists(enic);
>  	enic_init_vnic_resources(enic);
>  	enic_set_rss_nic_cfg(enic);
>  	enic_dev_set_ig_vlan_rewrite_mode(enic);
>  	enic_ext_cq(enic);
>  
> -	if (enic_open(enic->netdev))
> -		goto reset_out;
> +	if (enic_is_sriov_vf_v2(enic)) {
> +		err = enic_admin_chan_reopen(enic);
> +		if (err)
> +			goto hang_reset_out;
> +	}
>  
> -	/* Re-establish the admin/MBOX channel after the data path is back up.
> -	 * It was fully torn down by enic_admin_channel_close() above;
> -	 * enic_admin_chan_reopen() reopens it and, for a PF re-pushes link
> -	 * state, or for a VF re-runs the probe-time PF handshake.
> +	if (reopen)
> +		err = __enic_open(enic->netdev, false);
> +	if (reopen && err) {
> +		if (enic_is_sriov_vf_v2(enic) && enic_has_admin_chan(enic)) {
> +			int close_err = enic_admin_channel_close(enic);
> +
> +			WRITE_ONCE(enic->vf_registered, false);
> +			if (close_err)
> +				netdev_warn(enic->netdev,
> +					    "Admin close after datapath reopen failure returned: %d\n",
> +					    close_err);
> +		}
> +		netdev_err(enic->netdev,
> +			   "Failed to reopen datapath after hang reset: %d\n", err);
> +		goto hang_reset_out;
> +	}
> +
> +	/* A PF reopens its admin channel after the datapath and re-pushes link
> +	 * state.  The VF handshake, which open depends on, completed above.
>  	 */
> -	if (enic_has_admin_chan(enic))
> -		enic_admin_chan_reopen(enic);
> -	if (enic_is_sriov_vf_v2(enic) &&
> -	    enic_admin_channel_is_quarantined(enic))
> -		dev_close(enic->netdev);
> +	if (enic_has_admin_chan(enic) && !enic_is_sriov_vf_v2(enic)) {
> +		int admin_err = enic_admin_chan_reopen(enic);
>  
> -reset_out:
> +		if (admin_err)
> +			netdev_err(enic->netdev,
> +				   "Failed to reopen PF admin channel after hang reset: %d\n",
> +				   admin_err);
> +		if (!err)
> +			err = admin_err;
> +	}
> +
> +hang_reset_out:
>  	/* Allow infiniband to fiddle with the device again */
>  	enic_set_api_busy(enic, false);
>  
> -	call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
> +	if (reopen)
> +		call_netdevice_notifiers(NETDEV_REBOOT, enic->netdev);
>  
>  unlock:
> +	if (recovery_owned)
> +		restart = enic_vf_mbox_recovery_finish(enic,
> +						       recovery_generation,
> +						       !err &&
> +						       !enic_control_dma_unresolved(enic));
>  	rtnl_unlock();
> +	if (restart)
> +		schedule_work(&enic->tx_hang_reset);
>  }
>  
>  static int enic_set_intr_mode(struct enic *enic)

[Severity: Medium]
Can this restart a recovery that has already succeeded?

enic_tx_hang_reset() samples recovery_generation in
enic_vf_mbox_recovery_begin() before enic_admin_channel_close() has
masked the admin interrupt and cancelled admin_msg_work and the other
admin workers. Those run without RTNL. A fault reported from the old
channel in that window still increments vf_mbox_fault_generation.
Examples are a truncated or bad FCS admin completion, a full admin msg
backlog, or a malformed reply.

enic_admin_chan_reopen() then takes its own snapshot after the close and
the hang reset. It registers again and clears
vf_mbox_reconnect_required, because nothing changed relative to that
later snapshot. The late fault is therefore already covered by the
fresh registration.

The same thing happens when __enic_open() sees the flag set again and
runs its own close and enic_admin_chan_reopen() at the top.

enic_vf_mbox_recovery_finish() still compares against the older value
from enic_vf_mbox_recovery_begin(). It sees a mismatch and returns true,
so tx_hang_reset is queued again. enic_reset() has the same tail.

On that second run, vf_mbox_reconnect_required and mbox_tx_poisoned are
both false. So mailbox_recovery is false and the worker calls
enic_dev_hang_notify().

The commit message says HANG_NOTIFY is skipped for mailbox recovery
because it reports an actual Tx hang. Here a hang is reported to
firmware anyway. The worker then closes the admin channel, stops the
datapath and resets a VF that had just recovered.

Should the restart decision use the generation that
enic_admin_chan_reopen() actually committed? Or should it restart only
while vf_mbox_reconnect_required or mbox_tx_poisoned is still set?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c%40cisco.com
