Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393931;
	b=UWrYhtRAs68wp2oEdNo4sHCJkCYOie/NNPBj/lPHOrOwccrsIgxkVZzKlaqSgImb94pk
	 WNUM6DEclQqg3HUdWU60uXLxy7onXE41xqve9Xl+m01zxLanT3oDN0F81MHRkkE0VPUQl
	 SWYs9dwbIumM5WctbTNZA3EReH9T0F8LoWyJ3cKle/PnD24v3ALpRSFXnN75SyQZMVLgj
	 dpLlY/xTrxHukbu3ekbTOGVEZ5NDNwJaj1fgne3tHsrExuW6v3T0FISWHIno1deA/U70W
	 Ffew2AWndMTSUD2+MNZ/dCyTtR7YGp3syhkSf1ZzQ776b2g13s53lrn683PdyKdKM/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393931;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2uYRp7/Ef59U+/haM1zcSqHD7SDB4ISljPTiqfaeLlU=;
	b=ZkUt9UHnaC8SUHSBjgRVHQfpppM6gUKkx0LR5sKRF4gIkrXhZdrZ/VmKCEcF2kcTI5k3
	 RLqwsqYpkQBQre/II4068S8AFMzuR7Y26xq+Ck8AiydFeuFS5da5wKCiTWgCvJZBRAZci
	 MDxCvOD8vRcJhZ1zx3xxB103Y8WzRyEsWaLmLhGR+EN+DPHCESg3xdZ9BL29Kz8cBcQD7
	 lzmp1gEVdEy5jia42zW80ZK79cfR7isWa+UHZa3SxMI/KkJS5YkmkTOsg0hoEPTWcJOZP
	 sUUt2+IedYzXdzez1UOs2CHQmxu4+ZzRsAaICjVrlZ4Qu/lLLVe8kMlg6DXgsw6jNXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eplvf9kU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB8606A32C;
	Mon, 23 Nov 2026 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eplvf9kU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABBE1F000F0;
	Mon, 23 Nov 2026 00:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393931;
	bh=2uYRp7/Ef59U+/haM1zcSqHD7SDB4ISljPTiqfaeLlU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Eplvf9kU3EI6ah430CgKdN3qFlwxwMcml8ZhO94RuqZDwQa2k+a2Ev+Y+2MyUnzxD
	 F/99BeeufZ+w0Hr1Oy9j8ZW/2R+MG7cKOLIJXqCp0eJU555P05ku5TBLBQ8T4D5rh6
	 ZwikTanjrn3ekWrmpn8x1PYoRZw/QAU99I5chqYTCGcQ8UBqcel4G1pdxWHb08iw2q
	 XxFZNXwDHRrWU/RZFPDCwkLmBIk8s9MhYF4etu/ojL/8LTjtl9nbdzBphIx8nq4TW+
	 R+7teRO6w5/Qn3kJjRzUuEB0PDy4JzP1ucex2T08Sub7ylW0++KRktfp6W1lSR+LB4
	 MmSwwP0yOESTQ==
Subject:
 Re: [PATCH net-next v3 5/6] enic: manage V2 VF station and administrative MAC
From: netdev-bot+sashiko@kernel.org
To: satishkh@cisco.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com
Date: Mon, 23 Nov 2026 00:32:10 +0000
Message-ID: <179539393028.3135.14682126531016324837@kernel.org>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-5-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-5-2cb25677aa8c@cisco.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] During probe, enic_vf_admin_mac_refresh() runs before
  register_netdev() and now sets netdev->addr_assign_type.
- [Medium] enic: untracked PF station MACs while closed in
  enic_vf_admin_mac_work()
- [Medium] enic: stale dev_addr used in __enic_open() when admin MAC work
  is pending
- [Low] The commit message says the patch will 'Detach the netdev under
  RTNL before remove-time channel teardown so receive-mode work cannot…

--

enic: manage V2 VF station and administrative MAC

This patch makes the V2 VF manage its station address through the V2
mailbox MAC operation. A replacement is sent as one DEL+ADD request, and
a partial result makes the VF register again. The PF administrative MAC
is treated as authoritative: notifications are handled from a delayed
worker, and the policy is re-read with CMD_GET_MAC_ADDR after every
registration.

> Install the station address during open and remove it during an ordinary
> stop. Detach the netdev under RTNL before remove-time channel teardown so
> receive-mode work cannot race the mailbox shutdown.

[Severity: Low]
Does this sentence describe a change made by this patch? In the baseline,
enic_remove() already detaches the netdev under RTNL before the admin
channel teardown:

	rtnl_lock();
	netif_device_detach(netdev);
	rtnl_unlock();

The enic_remove() hunks here only add enic_vf_admin_mac_quiesce(),
enic_vf_admin_mac_purge() and a longer comment.

Could the commit message be reworded so it doesn't attribute the
detach-before-teardown ordering to this patch?

> diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
> index e6232927af808..46a5f46b192eb 100644
> --- a/drivers/net/ethernet/cisco/enic/enic_main.c
> +++ b/drivers/net/ethernet/cisco/enic/enic_main.c

[ ... ]

> @@ -1064,6 +1067,469 @@ static int enic_set_mac_addr(struct net_device *netdev, char *addr)

[ ... ]

> +/* CMD_GET_MAC_ADDR is the PF-owned policy store. Re-read it after REGISTER so
> + * a lost notification cannot leave the VF using stale administrative policy.
> + */
> +static int enic_vf_admin_mac_refresh(struct enic *enic)
> +{

[ ... ]

> +		changed = !ether_addr_equal(enic->netdev->dev_addr, selected);
> +		eth_hw_addr_set(enic->netdev, selected);
> +		if (!zero_policy || changed)
> +			enic->netdev->addr_assign_type = zero_policy ?
> +				NET_ADDR_RANDOM : NET_ADDR_SET;

[Severity: Medium]
Is this assignment safe on the probe path? enic_probe() now calls
enic_vf_admin_mac_refresh() before register_netdev(). With a nonzero
PF-administered MAC, !zero_policy is true, so addr_assign_type becomes
NET_ADDR_SET. With a zero policy and a newly picked random address, it
becomes NET_ADDR_RANDOM.

register_netdevice() only fills perm_addr for NET_ADDR_PERM:

net/core/dev.c:register_netdevice() {
    ...
	if (dev->addr_assign_type == NET_ADDR_PERM)
		memcpy(dev->perm_addr, dev->dev_addr, dev->addr_len);
    ...
}

So the sequence on every V2 VF probe with a PF-assigned MAC is:

enic_probe()
  enic_mbox_vf_register()
  enic_vf_admin_mac_refresh()
    addr_assign_type = NET_ADDR_SET
  enic_set_mac_addr()
  register_netdev()
    register_netdevice()
      perm_addr copy skipped

Doesn't this register the VF with an all-zero perm_addr? ethtool -P would
show 00:00:00:00:00:00, and sysfs would report addr_assign_type 3, as if
userspace had changed the address.

Before this patch, enic never touched addr_assign_type, so the VF
registered as NET_ADDR_PERM and perm_addr was filled in. Later patches in
the series don't appear to change this.

Should the probe-time refresh leave addr_assign_type as NET_ADDR_PERM, so
register_netdevice() still records the permanent address?

[ ... ]

> @@ -1064,6 +1067,469 @@ static int enic_set_mac_addr(struct net_device *netdev, char *addr)
>  	return 0;
>  }
>  
> +static void enic_vf_station_recovery_required(struct enic *enic)
> +{
> +	enic_mbox_vf_require_reconnect(enic);
> +}
> +
> +static void enic_vf_station_addr_set(struct enic *enic, const u8 *addr)
> +{
> +	ether_addr_copy(enic->vf_station_addr, addr);
> +	enic->vf_station_addr_valid = true;
> +}
> +
> +static int enic_vf_keep_nonstation_sync(struct net_device *netdev,
> +					const u8 *addr)
> +{
> +	struct enic *enic = netdev_priv(netdev);
> +
> +	if (!ether_addr_equal(addr, enic->vf_station_addr))
> +		return -ENOENT;
> +	if (WARN_ON_ONCE(!enic->uc_count))
> +		return 0;
> +	enic->uc_count--;
> +
> +	return 0;
> +}
> +
> +static void enic_vf_station_sync_reset(struct enic *enic)
> +{
> +	if (!enic->vf_station_addr_valid)
> +		return;
> +
> +	/* The PF keys its MAC ledger by address. A station entry is also the
> +	 * receive filter for that address and must not retain a second core
> +	 * synchronization reference which could later delete the station.
> +	 */
> +	netif_addr_lock_bh(enic->netdev);
> +	__dev_uc_unsync(enic->netdev, enic_vf_keep_nonstation_sync);
> +	netif_addr_unlock_bh(enic->netdev);
> +}
> +
> +static int enic_vf_station_addr_del(struct enic *enic)
> +{
> +	int err;
> +
> +	if (!enic->vf_station_addr_valid)
> +		return 0;
> +
> +	err = enic_mbox_vf_add_del_mac(enic, enic->vf_station_addr,
> +				       false, true);
> +	if (!err) {
> +		enic->vf_station_addr_valid = false;
> +	} else if (READ_ONCE(enic->mbox_tx_poisoned)) {
> +		enic_mbox_vf_link_state_set_running(enic, false);
> +	} else if (err == -EACCES) {
> +		/* A definitive rejected DELETE leaves an unrequested station
> +		 * filter installed. Fresh registration is the cleanup boundary.
> +		 */
> +		enic_vf_station_recovery_required(enic);
> +	}
> +
> +	return err;
> +}
> +
> +/* End every replacement with an equal-address DEL+ADD pair. A bare ADD could
> + * report DUPLICATE for a secondary exact filter without applying the current
> + * station-address policy. If another station is tracked, delete it first in
> + * the same compound request.
> + */
> +static int enic_vf_station_addr_replace(struct enic *enic, const u8 *addr)
> +{
> +	struct enic_mac_addr macs[3] = {};
> +	bool all_deletes_skipped = true;
> +	bool deletes_converged = true;
> +	u16 num_macs = 0;
> +	unsigned int i;
> +	u16 result;
> +	int err;
> +
> +	if (enic->vf_station_addr_valid &&
> +	    !ether_addr_equal(enic->vf_station_addr, addr)) {
> +		ether_addr_copy(macs[num_macs].addr, enic->vf_station_addr);
> +		macs[num_macs++].flags =
> +			cpu_to_le16(ENIC_MAC_ADDR_FLAG_STATION);
> +	}
> +	ether_addr_copy(macs[num_macs].addr, addr);
> +	macs[num_macs++].flags = cpu_to_le16(ENIC_MAC_ADDR_FLAG_STATION);
> +	ether_addr_copy(macs[num_macs].addr, addr);
> +	macs[num_macs++].flags = cpu_to_le16(ENIC_MAC_ADDR_FLAG_ADD |
> +					    ENIC_MAC_ADDR_FLAG_STATION);
> +
> +	err = enic_mbox_vf_add_del_macs(enic, macs, num_macs);
> +	if (err) {
> +		if (READ_ONCE(enic->mbox_tx_poisoned))
> +			enic_mbox_vf_link_state_set_running(enic, false);
> +		return err;
> +	}
> +
> +	for (i = 0; i < num_macs - 1; i++) {
> +		result = le16_to_cpu(macs[i].flags) &
> +			 ENIC_MAC_ADDR_FLAG_REPLY_MASK;
> +		if (result != ENIC_MAC_ADDR_FLAG_SKIPPED)
> +			all_deletes_skipped = false;
> +		if (result && result != ENIC_MAC_ADDR_FLAG_NOT_FOUND)
> +			deletes_converged = false;
> +	}
> +	result = le16_to_cpu(macs[num_macs - 1].flags) &
> +		 ENIC_MAC_ADDR_FLAG_REPLY_MASK;
> +	if (deletes_converged && !result)
> +		return 0;
> +
> +	/* A policy-rejected ADD can be reported with all preceding DELETEs
> +	 * skipped. No operation changed state in that coherent result tuple.
> +	 */
> +	if (all_deletes_skipped && result) {
> +		if (result & (ENIC_MAC_ADDR_FLAG_DUPLICATE |
> +			      ENIC_MAC_ADDR_FLAG_PERMANENT_MASK))
> +			return -EACCES;
> +		return -EIO;
> +	}
> +
> +	/* After any other partial or contradictory result, the VF does not know
> +	 * which station address the PF kept. Re-register before accepting traffic.
> +	 */
> +	enic_vf_station_recovery_required(enic);
> +	for (i = 0; i < num_macs; i++)
> +		if (le16_to_cpu(macs[i].flags) &
> +		    ENIC_MAC_ADDR_FLAG_PERMANENT_MASK)
> +			return -EACCES;
> +
> +	return -EIO;
> +}
> +
> +static void enic_vf_admin_mac_cache_selected(struct enic *enic,
> +					     const u8 *addr)
> +{
> +	/* A zero administrative policy delegates the operational address to
> +	 * the VF. Preserve a successful user selection across reconnects.
> +	 */
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	if (is_zero_ether_addr(enic->vf_admin_mac)) {
> +		ether_addr_copy(enic->vf_admin_mac_random_addr, addr);
> +		enic->vf_admin_mac_random_valid = true;
> +	}
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +}
> +
> +static void enic_vf_admin_mac_work(struct work_struct *work)
> +{
> +	struct enic *enic = container_of(to_delayed_work(work), struct enic,
> +					 vf_admin_mac_work);
> +	u8 policy[ETH_ALEN];
> +	u8 selected[ETH_ALEN];
> +	unsigned long delay = 0;
> +	u32 generation = 0;
> +	bool changed;
> +	bool mutated = false;
> +	bool reschedule = false;
> +	bool station_installed = false;
> +	bool stale = false;
> +	bool zero_policy;
> +	bool pending;
> +	int err = 0;
> +
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	pending = enic->vf_admin_mac_pending &&
> +		enic->vf_admin_mac_work_enabled;
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +	if (!pending)
> +		return;
> +
> +	/* Teardown owns RTNL while synchronously cancelling this work. Do not
> +	 * block that owner.
> +	 */
> +	if (!rtnl_trylock()) {

[Severity: Medium]
Can a pending admin MAC change make this open fail?

enic_vf_admin_mac_notify() runs from admin_msg_work without RTNL and
updates vf_admin_mac immediately. netdev->dev_addr, however, is only
updated by enic_vf_admin_mac_work(). That worker backs off on
rtnl_trylock() and retries every 10ms while RTNL is held.

Suppose the notification lands while dev_open(), enic_reset() or
enic_tx_hang_reset() holds RTNL. __enic_open() then reaches this call
with the old dev_addr. Nothing here looks at vf_admin_mac_pending or
vf_admin_mac, so the request asks the PF to install an address which
is no longer the administrative MAC.

The PF presumably rejects that ADD with all preceding DELETEs skipped.
In that case enic_vf_station_addr_replace() returns -EACCES without
requesting a reconnect.

For an ordinary open this is a spurious failure of the link-up
request. In the reset paths the result looks worse:

enic_reset()
  rtnl_lock()
  enic_admin_chan_reopen()
    enic_vf_admin_mac_refresh()
    enic_vf_admin_mac_rearm()
  <- notification arrives, worker backs off on RTNL
  __enic_open(netdev, false)
    enic_vf_station_addr_replace(enic, old dev_addr) -> -EACCES
  enic_admin_channel_close()
    enic_vf_admin_mac_quiesce()
      cancel_delayed_work_sync(&enic->vf_admin_mac_work)
  WRITE_ONCE(enic->vf_registered, false)

enic_tx_hang_reset() follows the same sequence. Recovery ends with the
admin channel closed and the datapath down, and the pending
administrative MAC is never applied.

Should __enic_open() apply a pending vf_admin_mac under RTNL before
installing the station, as the worker would have done? Or should a
policy rejection here be deferred until the worker has run, rather
than failing the open and tearing down the channel?

> +		spin_lock_bh(&enic->vf_admin_mac_lock);
> +		if (enic->vf_admin_mac_pending &&
> +		    enic->vf_admin_mac_work_enabled)
> +			mod_delayed_work(system_percpu_wq,
> +					 &enic->vf_admin_mac_work,
> +					 msecs_to_jiffies(10));
> +		spin_unlock_bh(&enic->vf_admin_mac_lock);
> +		return;
> +	}
> +
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	pending = enic->vf_admin_mac_pending &&
> +		enic->vf_admin_mac_work_enabled;
> +	if (pending) {
> +		ether_addr_copy(policy, enic->vf_admin_mac);
> +		generation = enic->vf_admin_mac_generation;
> +		zero_policy = is_zero_ether_addr(policy);
> +		if (zero_policy && enic->vf_admin_mac_random_valid)
> +			ether_addr_copy(selected,
> +					enic->vf_admin_mac_random_addr);
> +	}
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +	if (!pending)
> +		goto unlock;
> +
> +	if (zero_policy && !READ_ONCE(enic->vf_admin_mac_random_valid)) {
> +		eth_random_addr(selected);
> +		spin_lock_bh(&enic->vf_admin_mac_lock);
> +		if (!enic->vf_admin_mac_pending ||
> +		    !enic->vf_admin_mac_work_enabled ||
> +		    enic->vf_admin_mac_generation != generation ||
> +		    !is_zero_ether_addr(enic->vf_admin_mac)) {
> +			stale = true;
> +		} else if (enic->vf_admin_mac_random_valid) {
> +			ether_addr_copy(selected,
> +					enic->vf_admin_mac_random_addr);
> +		} else {
> +			ether_addr_copy(enic->vf_admin_mac_random_addr, selected);
> +			enic->vf_admin_mac_random_valid = true;
> +		}
> +		spin_unlock_bh(&enic->vf_admin_mac_lock);
> +		if (stale)
> +			goto unlock;
> +	} else if (!zero_policy) {
> +		ether_addr_copy(selected, policy);
> +	}
> +
> +	if (!netif_device_present(enic->netdev) ||
> +	    !READ_ONCE(enic->vf_registered)) {
> +		err = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	/* A nonzero notification describes a station address the PF has already
> +	 * installed. Zero delegates selection to the VF, which registers the
> +	 * selected random address through the policy-safe replacement request.
> +	 */
> +	if (!READ_ONCE(enic->datapath_open)) {
> +		station_installed = !zero_policy &&
> +			(!enic->vf_station_addr_valid ||
> +			 ether_addr_equal(enic->vf_station_addr, selected));
> +	} else if (zero_policy) {
> +		mutated = true;
> +		err = enic_vf_station_addr_replace(enic, selected);
> +		station_installed = !err;
> +	} else if (enic->vf_station_addr_valid &&
> +		   !ether_addr_equal(enic->vf_station_addr, selected)) {
> +		mutated = true;
> +		err = enic_vf_station_addr_del(enic);
> +		station_installed = !err;
> +	} else {
> +		station_installed = true;
> +	}
> +	if (err)
> +		goto unlock;
> +
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	if (!enic->vf_admin_mac_pending ||
> +	    !enic->vf_admin_mac_work_enabled ||
> +	    enic->vf_admin_mac_generation != generation) {
> +		stale = true;
> +		/* If policy changed while the request was running, the completed
> +		 * station change may no longer match it. Record recovery while holding
> +		 * vf_admin_mac_lock, which also protects VF worker shutdown. Teardown
> +		 * therefore either suppresses the update or sees it first, and already
> +		 * uses unregister/register to clear old state.
> +		 */
> +		if (mutated && enic->vf_admin_mac_work_enabled)
> +			enic_vf_station_recovery_required(enic);
> +	} else {
> +		enic->vf_admin_mac_pending = false;
> +		enic->vf_admin_mac_retries = 0;
> +		enic->vf_admin_mac_recovery_attempted = false;
> +		if (!zero_policy)
> +			enic->vf_admin_mac_random_valid = false;
> +	}
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +	if (stale)
> +		goto unlock;
> +
> +	changed = !ether_addr_equal(enic->netdev->dev_addr, selected);
> +	enic_vf_station_sync_reset(enic);
> +	eth_hw_addr_set(enic->netdev, selected);
> +	if (!zero_policy || changed)
> +		enic->netdev->addr_assign_type = zero_policy ?
> +			NET_ADDR_RANDOM : NET_ADDR_SET;
> +	ether_addr_copy(enic->mac_addr, selected);
> +	if (station_installed)
> +		enic_vf_station_addr_set(enic, selected);
> +	enic_vf_station_sync_reset(enic);
> +	if (enic->netdev->reg_state == NETREG_REGISTERED) {
> +		if (changed)
> +			call_netdevice_notifiers(NETDEV_CHANGEADDR,
> +						 enic->netdev);
> +		netif_rx_mode_schedule_update(enic->netdev);
> +	}
> +	netdev_info(enic->netdev, "MBOX: admin MAC set to %pM\n", selected);
> +
> +unlock:
> +	rtnl_unlock();
> +
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	if (err && enic->vf_admin_mac_pending &&
> +	    enic->vf_admin_mac_work_enabled &&
> +	    generation == enic->vf_admin_mac_generation &&
> +	    !READ_ONCE(enic->mbox_send_disabled)) {
> +		if (enic->vf_admin_mac_retries <
> +		    ENIC_VF_ADMIN_MAC_MAX_RETRIES) {
> +			enic->vf_admin_mac_retries++;
> +			reschedule = true;
> +			delay = msecs_to_jiffies(ENIC_VF_ADMIN_MAC_RETRY_MS);
> +		} else if (!enic->vf_admin_mac_recovery_attempted) {
> +			enic->vf_admin_mac_recovery_attempted = true;
> +			/* vf_admin_mac_lock also protects VF worker shutdown. */
> +			enic_vf_station_recovery_required(enic);
> +		}
> +	}
> +	if (enic->vf_admin_mac_pending &&
> +	    enic->vf_admin_mac_work_enabled &&
> +	    generation != enic->vf_admin_mac_generation) {
> +		reschedule = true;
> +		delay = 0;
> +	}
> +	if (enic->vf_admin_mac_pending && reschedule)
> +		mod_delayed_work(system_percpu_wq,
> +				 &enic->vf_admin_mac_work, delay);
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +}
> +
> +void enic_vf_admin_mac_notify(struct enic *enic, const u8 *addr)
> +{
> +	bool new_policy;
> +
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	new_policy = !enic->vf_admin_mac_pending ||
> +		!ether_addr_equal(enic->vf_admin_mac, addr);
> +	if (new_policy) {
> +		ether_addr_copy(enic->vf_admin_mac, addr);
> +		if (!is_zero_ether_addr(addr))
> +			enic->vf_admin_mac_random_valid = false;
> +		enic->vf_admin_mac_pending = true;
> +		enic->vf_admin_mac_generation++;
> +		enic->vf_admin_mac_retries = 0;
> +		enic->vf_admin_mac_recovery_attempted = false;
> +	}
> +	if (new_policy && enic->vf_admin_mac_work_enabled)
> +		mod_delayed_work(system_percpu_wq,
> +				 &enic->vf_admin_mac_work, 0);
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +}
> +
> +void enic_vf_admin_mac_quiesce(struct enic *enic)
> +{
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	enic->vf_admin_mac_work_enabled = false;
> +	enic->vf_admin_mac_generation++;
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +	cancel_delayed_work_sync(&enic->vf_admin_mac_work);
> +}
> +
> +void enic_vf_admin_mac_rearm(struct enic *enic)
> +{
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	enic->vf_admin_mac_work_enabled = true;
> +	if (enic->vf_admin_mac_pending)
> +		mod_delayed_work(system_percpu_wq,
> +				 &enic->vf_admin_mac_work, 0);
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +}
> +
> +void enic_vf_admin_mac_purge(struct enic *enic)
> +{
> +	enic_vf_admin_mac_quiesce(enic);
> +	spin_lock_bh(&enic->vf_admin_mac_lock);
> +	enic->vf_admin_mac_pending = false;
> +	enic->vf_admin_mac_random_valid = false;
> +	enic->vf_admin_mac_recovery_attempted = false;
> +	enic->vf_admin_mac_retries = 0;
> +	enic->vf_admin_mac_generation++;
> +	spin_unlock_bh(&enic->vf_admin_mac_lock);
> +}
> +
> +/* CMD_GET_MAC_ADDR is the PF-owned policy store. Re-read it after REGISTER so
> + * a lost notification cannot leave the VF using stale administrative policy.
> + */
> +static int enic_vf_admin_mac_refresh(struct enic *enic)
> +{
> +	u8 previous_policy[ETH_ALEN];
> +	u8 random_addr[ETH_ALEN];
> +	u8 selected[ETH_ALEN];
> +	u8 policy[ETH_ALEN];
> +	u32 generation;
> +	bool apply_policy;
> +	bool changed;
> +	bool pending;
> +	bool policy_changed;
> +	bool zero_policy;
> +	unsigned int attempt;
> +	int err;
> +
> +	for (attempt = 0; attempt < ENIC_VF_ADMIN_MAC_REFRESH_RETRIES;
> +	     attempt++) {
> +		spin_lock_bh(&enic->vf_admin_mac_lock);
> +		generation = enic->vf_admin_mac_generation;
> +		pending = enic->vf_admin_mac_pending;
> +		ether_addr_copy(previous_policy, enic->vf_admin_mac);
> +		spin_unlock_bh(&enic->vf_admin_mac_lock);
> +
> +		err = enic_dev_get_mac_addr(enic, policy);
> +		if (err)
> +			return err;
> +		if (is_multicast_ether_addr(policy))
> +			return -EADDRNOTAVAIL;
> +
> +		zero_policy = is_zero_ether_addr(policy);
> +		if (zero_policy)
> +			eth_random_addr(random_addr);
> +
> +		spin_lock_bh(&enic->vf_admin_mac_lock);
> +		if (enic->vf_admin_mac_generation != generation) {
> +			spin_unlock_bh(&enic->vf_admin_mac_lock);
> +			continue;
> +		}
> +
> +		policy_changed = !ether_addr_equal(previous_policy, policy);
> +		apply_policy = pending || policy_changed ||
> +			!is_valid_ether_addr(enic->netdev->dev_addr) ||
> +			(!zero_policy &&
> +			 !ether_addr_equal(enic->netdev->dev_addr, policy));
> +		if (!apply_policy) {
> +			ether_addr_copy(selected, enic->netdev->dev_addr);
> +			if (zero_policy) {
> +				ether_addr_copy(enic->vf_admin_mac_random_addr,
> +						selected);
> +				enic->vf_admin_mac_random_valid = true;
> +			}
> +		} else if (zero_policy && enic->vf_admin_mac_random_valid) {
> +			ether_addr_copy(selected,
> +					enic->vf_admin_mac_random_addr);
> +		} else if (zero_policy) {
> +			ether_addr_copy(selected, random_addr);
> +			ether_addr_copy(enic->vf_admin_mac_random_addr, selected);
> +			enic->vf_admin_mac_random_valid = true;
> +		} else {
> +			ether_addr_copy(selected, policy);
> +			enic->vf_admin_mac_random_valid = false;
> +		}
> +		ether_addr_copy(enic->vf_admin_mac, policy);
> +		enic->vf_admin_mac_pending = false;
> +		enic->vf_admin_mac_recovery_attempted = false;
> +		enic->vf_admin_mac_retries = 0;
> +		enic->vf_admin_mac_generation++;
> +		spin_unlock_bh(&enic->vf_admin_mac_lock);
> +
> +		changed = !ether_addr_equal(enic->netdev->dev_addr, selected);
> +		eth_hw_addr_set(enic->netdev, selected);
> +		if (!zero_policy || changed)
> +			enic->netdev->addr_assign_type = zero_policy ?
> +				NET_ADDR_RANDOM : NET_ADDR_SET;
> +		ether_addr_copy(enic->mac_addr, selected);
> +		if (changed && enic->netdev->reg_state == NETREG_REGISTERED)
> +			call_netdevice_notifiers(NETDEV_CHANGEADDR,
> +						 enic->netdev);
> +
> +		return 0;
> +	}
> +
> +	return -EAGAIN;
> +}
> +
>  static int enic_set_mac_address_dynamic(struct net_device *netdev, void *p)
>  {
>  	struct enic *enic = netdev_priv(netdev);

[Severity: Medium]
When the datapath is closed, this branch treats a nonzero notification
as a station address the PF has already installed. Can that lose track
of a PF-installed station when more than one notification arrives
while the interface is down?

Consider nonzero policies P1 then P2, both with datapath_open false:

enic_vf_admin_mac_work() [P1]
  vf_station_addr_valid is false, so station_installed = true
  enic_vf_station_addr_set(enic, P1)

enic_vf_admin_mac_work() [P2]
  vf_station_addr_valid is true and vf_station_addr != P2,
  so station_installed = false
  dev_addr = P2, vf_station_addr is still P1

Nothing in the closed branch deletes P1, and P2 is never recorded in
vf_station_addr. If a third notification (P3, a zero policy, or P1
again) arrives before the next open, dev_addr moves on. P2 is then no
longer referenced anywhere in struct enic.

The following __enic_open() calls enic_vf_station_addr_replace().
That only deletes the tracked vf_station_addr (P1) and the new
dev_addr, so P2 stays installed at the PF as a unicast station filter.
It remains there until the next unregister or registration.

struct enic only tracks a single vf_station_addr. Should the closed
branch first delete a differing tracked station, as the datapath_open
branch does with enic_vf_station_addr_del(), so the newly installed
address can be recorded? Or is there a reason the mailbox cannot be
used here while the datapath is down?

A related question for enic_vf_admin_mac_refresh(): when it consumes
a pending nonzero notification, it clears vf_admin_mac_pending and
sets dev_addr, but never calls enic_vf_station_addr_set(). Is the next
open's equal-address DEL+ADD enough to cover that case?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c%40cisco.com
