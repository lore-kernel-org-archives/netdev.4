Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393933;
	b=Eecv+9afIwXwfjyL89OOyVMbOO3KdwhDv2Wo6QHVCf/VTvBbWaKpA4VRVv4uP9vofhlv
	 +h5wDEwcNRGtY4RIZAlhfsbiNm3BtrEmV9GAtLP4f/aS3xRg9QVRg5MBCxDivEf5WZNzM
	 a0UX61EPhRLIbl7QJzPX6VikFl/EgtyECrhk0h/BGHXhCEqfinA2ZT1GPncSgGxuhhwJo
	 HNqsQ2MNsRGwtiSBZ0zSyRJ/1igSIbNc5aaAXK+roSYzGH8jNDtGOZRDCCobOcfzI8MIa
	 qDQn55g/B082xZC2CAsTrp6dtGeLvtsnUMq7KKnwLwMrCilDqJ/F1CmSTAQYQS6UX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393933;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mHZxjWeUCyzV80XymySYAyg/3CSJZugSBAN+67hUF58=;
	b=WyR3GykRP7rwmfZZClAHZJCgpIG8rd08xSS9z1s0Cgqf5eiyQXZrTdnFXyO+eY49mxkr
	 nEEUF3S5KXTLgrLCn0r0VQsDLb2uOZLdgFsN4yhwc7Dyt4KE+Pog/Nj905/c0BjVwf0pp
	 DdmTOef/vrGD7R+XYTvnQxTinouPHkHr3Cq++rewGhHexswxSgaVM3gQ6+9Fg9nqM3PWB
	 1sJSCNHzxQZVeB0+0aus3iUrMKbUC5+O9wgo2HmeiXHBKD0j5MNMmWVb3kMAbu0bXqAX9
	 vS7klWt2G8FRBzNWTnqd/uUkH9Y5WGO+59ZKxRymkHIw/Hwa+5HC1eoAbGHs5WnMniQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e91snGDV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A0606A336;
	Mon, 23 Nov 2026 00:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e91snGDV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDDE1F000D3;
	Mon, 23 Nov 2026 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393933;
	bh=mHZxjWeUCyzV80XymySYAyg/3CSJZugSBAN+67hUF58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e91snGDVO5aDv/uC4w59KIUB9VjTyvVxV2SJH1H17zDXPf/ho3gaoMzu/NaSjEQ1f
	 WcInG4qwaE04NMDxVe0Kq4pD0gsxxtp1IkH5ousl6S15VCLFP8WghrI9cvpw9WH/Fv
	 qgI9j7S8G9iBT/MxMucWcdiBbcMy0no8Jum7V9k20yehR/jG7KfMxXRIpDYGBAv/nX
	 ynjXpFU/WzLk52G32Q0VALfQeJGjuaC2e3Gbyd3N1STKppThlcWSUyDYGXIL8cbt2i
	 ouruUpsoFSoMYkHodSN4HACb4RaZpLJ/0cIm0U/AFWy3N5eBCaWYxyLMU4+l47GMIf
	 sWWlIXTNxsqBQ==
Subject:
 Re: [PATCH net-next v3 6/6] enic: configure V2 VF receive mode over mailbox
From: netdev-bot+sashiko@kernel.org
To: satishkh@cisco.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com
Date: Mon, 23 Nov 2026 00:32:11 +0000
Message-ID: <179539393186.3135.6117001594095681852@kernel.org>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-6-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-6-2cb25677aa8c@cisco.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Exact-filter ADDs that the PF denied permanently
  (PERMANENT_MASK) leave ha->sync_cnt at 0.
- [Medium] enic_vf_sync_mac_filters() handles any SKIPPED DELETE as fail-
  closed: it calls enic_mbox_vf_require_reconnect(), which sets…
- [Medium] When an ADD-only ADD_DEL_MAC request fails as a whole with
  -EIO (for example ret_major = GENERIC or an errno-like value, which…
- [Low] The comment above the enic_mbox_vf_add_del_macs() call in
  enic_vf_sync_mac_filters() says the single batch "bounds time spent in…
- [Low] In enic_vf_sync_mac_filters(), the per-result loop sets `err =
  -EIO` when a DELETE result would decrement an installed-filter counter…

--

enic: configure V2 VF receive mode over mailbox

This patch adds an ndo_set_rx_mode_async callback for V2 VFs. The
callback sends unicast/multicast address changes and packet-filter
settings to the PF over the mailbox. It orders broad-mode transitions
around one exact-filter batch and maps per-address PF results to retry,
reconnect or stable-denial outcomes. Receive mode is also replayed after
reset, hang-reset and MTU reopen.

> diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
> index 46a5f46b192eb..47b84bc282f7d 100644
> --- a/drivers/net/ethernet/cisco/enic/enic_main.c
> +++ b/drivers/net/ethernet/cisco/enic/enic_main.c

[ ... ]

> @@ -1621,17 +1623,404 @@ static int enic_set_mac_address(struct net_device *netdev, void *p)

[ ... ]

> +static int enic_vf_collect_mac_ops(struct enic *enic,
> +				   struct netdev_hw_addr_list *list,
> +				   bool add,
> +				   unsigned int *filter_count,
> +				   unsigned int *projected_count,
> +				   unsigned int max_filters,
> +				   struct enic_mac_addr *macs,
> +				   struct enic_vf_mac_op *ops,
> +				   u16 *num_ops)
> +{
> +	struct netdev_hw_addr *ha;
> +	u16 pos = *num_ops;
> +
> +	netdev_hw_addr_list_for_each(ha, list) {
> +		if (enic->vf_station_addr_valid &&
> +		    ether_addr_equal(ha->addr, enic->vf_station_addr))
> +			continue;
> +		if (add) {
> +			if (ha->sync_cnt || *projected_count >= max_filters)
> +				continue;

[Severity: Medium]
Do addresses that the PF has already denied permanently keep using up the
exact-filter budget here?

When enic_vf_sync_mac_filters() sees ENIC_MAC_ADDR_FLAG_PERMANENT_MASK on
an ADD, it sets permanent_add and continues, so ha->sync_cnt stays 0. On
the next run, this loop collects the same denied entries again in list
order. Each one increments *projected_count toward the 31 UC / 32 MC
limit.

Take 35 secondary UC addresses where the PF rejects the first 5 with
NOT_PERMITTED. Only 26 get installed. Each later run fills projected_uc
from 26 to 31 with the same 5 denied entries. The last 4 addresses are
never sent, even though the PF has 5 free slots.

If the PF also denies promiscuous mode, those 4 addresses get no coverage
at all. Does this match "leaving overflow entries unsynchronized for later
convergence" in the commit message?

[ ... ]

> +	/* The protocol carries all changed unicast and multicast addresses in
> +	 * one request.  Besides matching the native ABI, this bounds time spent
> +	 * in the RTNL-held asynchronous receive-mode callback to one MAC reply.
> +	 */

[Severity: Low]
Is this comment accurate? One call to enic_set_vf_rx_mode() can make up
to three serialized, blocking mailbox transactions, all under RTNL. enic
sets neither request_ops_lock nor queue_mgmt_ops, so
netdev_lock_ops_compat() takes rtnl_lock():

  enic_set_vf_rx_mode()
    enic_vf_set_pkt_filter(prefilter_flags)   /* broad pre-enable */
    enic_vf_set_pkt_filter(flags)             /* broad withdrawal */
    enic_vf_sync_mac_filters()
      enic_mbox_vf_add_del_macs()

A combined transition, such as applied PROMISC to requested ALLMULTI,
sets both broad_enable_needed and broad_withdrawal. The second
SET_PKT_FILTER cannot hit the cache, because vf_pkt_filter_requested was
just set to prefilter_flags.

Each request first polls the send for up to ENIC_MBOX_POLL_TIMEOUT_US,
then waits up to 3000 ms in enic_mbox_wait_reply(). A PF that always
replies just under the timeout could keep RTNL held for roughly 9 seconds
per call. The core may also retry up to 4 times on -EAGAIN or -EIO.

> +	err = enic_mbox_vf_add_del_macs(enic, macs, num_ops);
> +	if (err) {
> +		/* The PF may have applied any prefix before a request-wide failure.
> +		 * A batch containing DELETE can therefore leave stale acceptance.
> +		 * Fresh registration is the cleanup boundary unless transport DMA is
> +		 * already poisoned and awaiting its reset fence.
> +		 */
> +		if (err == -EIO && has_delete &&
> +		    !READ_ONCE(enic->mbox_tx_poisoned) &&
> +		    !READ_ONCE(enic->vf_mbox_reconnect_required))
> +			enic_mbox_vf_require_reconnect(enic);
> +		goto free_ops;
> +	}

[Severity: Medium]
What happens when an ADD-only batch fails as a whole with -EIO?

enic_mbox_vf_classify_reply() maps a non-zero ret_major to -EIO with
recovery allowed. As the comment above says, the PF "may have applied any
prefix before a request-wide failure". With has_delete false, no reconnect
is requested. sync_cnt and uc_count/mc_count are also not updated for any
addresses the PF did install.

Suppose such an address is removed before a retry succeeds, or after the
retry budget runs out. The core frees it in __hw_addr_list_reconcile()
while its sync_cnt is still 0. enic_vf_collect_mac_ops() only emits a
DELETE when sync_cnt is non-zero:

    if (!ha->sync_cnt || ha->refcount != ha->sync_cnt)
        continue;

So no DELETE is ever sent. Could the PF keep accepting traffic for that
address, and keep one of its 32 UC slots in use, until the next fresh
registration? The local projection would then also overestimate free
capacity.

> +
> +	for (i = 0; i < num_ops; i++) {
> +		u16 flags = le16_to_cpu(macs[i].flags);
> +		bool add = flags & ENIC_MAC_ADDR_FLAG_ADD;
> +
> +		if (flags & ENIC_MAC_ADDR_FLAG_SKIPPED) {
> +			if (add)
> +				retryable_add = true;
> +			else
> +				reconnect = true;
> +			continue;
> +		}

[Severity: Medium]
Is a full reconnect the right response to a SKIPPED DELETE?

A skipped entry means the PF did not apply it, so sync_cnt for that
address is still accurate. But enic_mbox_vf_require_reconnect() sets
mbox_send_disabled and vf_rx_quarantined, and it schedules tx_hang_reset.

The existing comment in enic_vf_station_addr_replace() notes that the PF
can report preceding DELETEs as skipped when it rejects an ADD by policy:

    /* A policy-rejected ADD can be reported with all preceding DELETEs
     * skipped. No operation changed state in that coherent result tuple.
     */

This batch always puts deletes before adds. A permanently denied ADD
keeps sync_cnt at 0, so it is resent in every later batch. If the PF uses
the same semantics here, could every address-list change that removes a
synced secondary MAC trigger another VF datapath reset while the denied
address is still in the list?

There is a related problem when the PF also skips the other ADDs in that
batch. retryable_add takes precedence over permanent_add, so -EAGAIN is
returned. Each retry rebuilds the same batch and gets the same result
until NETIF_RX_MODE_RETRY_MAX. Could one denied address then stop all the
other addresses from ever being installed?

> +		if (flags & ENIC_MAC_ADDR_FLAG_PERMANENT_MASK) {
> +			if (add)
> +				permanent_add = true;
> +			else
> +				reconnect = true;
> +			continue;
> +		}
> +
> +		if (add) {
> +			ops[i].ha->sync_cnt++;
> +			ops[i].ha->refcount++;
> +			(*ops[i].filter_count)++;
> +		} else {
> +			ops[i].ha->sync_cnt--;
> +			ops[i].ha->refcount--;
> +			if (WARN_ON_ONCE(!*ops[i].filter_count))
> +				err = -EIO;
> +			else
> +				(*ops[i].filter_count)--;
> +		}
> +	}
> +
> +	/* A failed DELETE can leave hardware accepting an address no longer in
> +	 * the requested list.  Registration is the fail-closed cleanup boundary.
> +	 * A skipped ADD changes no acceptance state and can use the bounded core
> +	 * retry path.  Permanent ADD denials remain stable policy results.
> +	 */
> +	if (reconnect) {
> +		enic_mbox_vf_require_reconnect(enic);
> +		err = -EIO;
> +	} else if (retryable_add) {
> +		err = -EAGAIN;
> +	} else if (permanent_add) {
> +		err = -EACCES;
> +	}

[Severity: Low]
Can the -EIO set in the WARN_ON_ONCE() branch above be lost here? This
chain overwrites err without checking its earlier value.

If the same batch also contains a permanently denied ADD, err becomes
-EACCES, and enic_set_vf_rx_mode() turns that into 0. The detected counter
inconsistency is then reported as a successful update. With a skipped ADD,
it is downgraded to -EAGAIN instead.

This is a defensive path that should not normally be reachable, but
should the earlier -EIO take precedence?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c%40cisco.com
