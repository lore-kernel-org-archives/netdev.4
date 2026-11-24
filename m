Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557446;
	b=pcEcO6yEtJ2z+6uwIJWOlEcbiH6BWr7W9XEpEFsR8Tg6WTw7T61xYxA2XeOto04m7L42
	 nY2ghWyzWHnZkI1Mqm8BP1d1puoUPh9YGdqKTqNQmjJG04xScMYDnP6BSj7QQLcLsmZHe
	 NlZZqmodOVTu2xVJo2xE7vX+QZq7Pl0xTJJQ3R18Tyqxq4bvCosWmXhbrq0BXflRjXy7w
	 zROsRUk7xGxQSktq4otSOfK58LBBG5sGMFyZ4XYUaGRTESiVd9w4zbn3v9LJngjMXSj8O
	 tdtLMDmebbsAT4e6i1cmVdDe+CokQ/xDR+6VSRzgdnmtCTIuWbSUUBnlf4mKtLDIpBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557446;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/bDLU+KnXBiyE6EZcw6JsgqTTPV2XJQMAz2Sh3kOrzI=;
	b=rTr3YGhkRpHlYWM8ZZaGjs48SC6eSu3eNCTlnBSB02qcLBTvFV5z5fuG6Kn6GT7mRWpk
	 g+s4M0sC2KlKNIrQbZ6qpcVaV91/omW2mQ5y06U9/NknOWKA6/yJT+8FM8xY420jp2by2
	 MZbq2aFGQS9PqgXzYDXuTlzdR435RzKoODbY/NhBMnqW8bQR+qzd8Klz5qZnAJE1HQh03
	 TWKIatEr2oT1XVbXRP/FFtEk73MG1EEHk2NQ+BJtj+2GtPEZD++as5L+zlQm5CyaYP1dM
	 m+jUtvoimKcrDib2qO5AwInjd7wsoFF6GnqLZLkSVF+tWL2ks0x1Nt10PSyictUM5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7pOxDge;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8E606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7pOxDge
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4A31F000C0;
	Tue, 24 Nov 2026 21:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557446;
	bh=/bDLU+KnXBiyE6EZcw6JsgqTTPV2XJQMAz2Sh3kOrzI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z7pOxDgerHL5c9trnSjC/PYZx8av8GvmRKAWdjhwmF7RPSIfpnVGbqCxOtIrPxSem
	 d9Jj6rG6k2G937wLeUWan4yTuKsIlkfCV9xNhuEmWefDpmK5IKlc7bdaFHenIHEKRB
	 +GQ1YVjqJV1YER3RIthP6CW57IWaLhb0uhP7uURvcx2GxJi2sE9zuMKsrIilgpGwng
	 zm2FABs2v1l9JWpGdaGsQYABZN1tWYR4QQPCxOyHZ1ThxOBxlmFrzVKuJAcU/uMXmH
	 z4BzJukgCxPFAOrGyJZk+qUwR/Kj532vYQpjx90bCWDmlV1cFG34Gpbj8L3SDPcdBS
	 AXAmgZsS2r1zA==
Subject: Re: [PATCH net-next v7 01/15] iavf: keep RSS config across resets
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, jiri@resnulli.us,
 anthony.l.nguyen@intel.com, aleksandr.loktionov@intel.com,
 mschmidt@redhat.com, edumazet@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, poros@redhat.com,
 donald.hunter@gmail.com
Date: Tue, 24 Nov 2026 21:57:24 +0000
Message-ID: <179555744418.3135.2924449587168522535@kernel.org>
In-Reply-To: <20261121230123.316391-2-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-2-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The aq_wait_count fix is incomplete.
- [Medium] When the RSS buffer reallocation in
  iavf_parse_vf_resource_msg() fails, the RSS buffers and…
- [Medium] While init retries with the netdev registered, adapter->vf_res
  is zeroed.
- [Medium] iavf: premature ethtool_rxfh_indir_lost() broadcasts zeroed
  LUT on reinit
- [Low] This commit fixes several pre-existing bugs without a Fixes: tag,
  and bundles them with a new feature, so the fixes cannot be backported…
- [Low] The new iavf_init_rss() call in the size-change branch of
  iavf_parse_vf_resource_msg() (iavf_main.c:2600) skips the RSS_AQ…

--

iavf: keep RSS config across resets

This commit keeps the user-set RSS key and LUT across VF resets. When the
PF reports a different key or LUT size, it reallocates both and folds the
LUT, and it reinits the queues when the PF cuts the queue count. It also
fixes the RSS buffer leak on reinit after iavf_disable_vf(), keeps vf_res
allocated on a failed resources message, checks what
iavf_parse_vf_resource_msg() returns, and resets aq_wait_count.

> Most of these issues are old and affect every PF, but are rarely hit.
> The rest of this series makes them common: the VF is reset on each
> change of its RSS LUT via devlink, and on init, after iavf asks the PF
> for more queues and waits for them in __IAVF_INIT_FAILED. Hence fix
> them first.

[Severity: Low]
This isn't a bug, but could the standalone fixes be split into their own
patches, each with a Fixes: tag? As far as I can tell, this commit fixes
several old bugs:

- the rss_key/rss_lut leak when iavf_init_config_adapter() allocates them
  again on reinit after iavf_disable_vf()

- the NULL adapter->vf_res left by the err_alloc path of
  iavf_init_get_resources() while the netdev stays registered; ethtool ops
  dereference it through RSS_PF(), ADV_RSS_SUPPORT() and
  LARGE_NUM_QPAIRS_SUPPORT()

- aq_wait_count never being reset

- the ignored return value of iavf_parse_vf_resource_msg() in
  iavf_virtchnl_completion()

They are bundled with the new RSS preservation feature
(IAVF_FLAG_RSS_LUT_LOST, the LUT resize, the reset on a queue cut) and
have no Fixes: tags. Stable kernels would not pick up the leak and NULL
dereference fixes this way.

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
> index 4de3ea8525b3f..c7b12de63c2f5 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_main.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_main.c

[ ... ]

> @@ -2494,11 +2562,45 @@ int iavf_parse_vf_resource_msg(struct iavf_adapter *adapter)
>  	vsi->netdev = adapter->netdev;
>  	vsi->qs_handle = adapter->vsi_res->qset_handle;
>  	if (adapter->vf_res->vf_cap_flags & VIRTCHNL_VF_OFFLOAD_RSS_PF) {
> -		adapter->rss_key_size = adapter->vf_res->rss_key_size;
> -		adapter->rss_lut_size = adapter->vf_res->rss_lut_size;
> +		key_size = adapter->vf_res->rss_key_size;
> +		lut_size = adapter->vf_res->rss_lut_size;
> +	} else {
> +		key_size = IAVF_HKEY_ARRAY_SIZE;
> +		lut_size = IAVF_HLUT_ARRAY_SIZE;
> +	}
> +
> +	if ((adapter->rss_key && adapter->rss_key_size != key_size) ||
> +	    (adapter->rss_lut && adapter->rss_lut_size != lut_size)) {
> +		u8 *rss_key, *rss_lut;
> +
> +		rss_key = kzalloc(key_size, GFP_KERNEL);
> +		rss_lut = kzalloc(lut_size, GFP_KERNEL);
> +		if (!rss_lut || !rss_key ||
> +		    iavf_rss_lut_resize(adapter, rss_lut, lut_size)) {
> +			kfree(rss_key);
> +			kfree(rss_lut);
> +			/* old buffers and sizes are kept, retry via reset */
> +			iavf_schedule_reset(adapter, IAVF_FLAG_RESET_NEEDED);
> +			return -ENOMEM;
> +		}

[Severity: Medium]
Can this failure path leave the RSS sizes out of step with the
capabilities in adapter->vf_res?

When this runs, iavf_virtchnl_completion() has already copied the new
reply into adapter->vf_res. RSS_PF(), RSS_AQ() and RSS_REG() therefore
follow the new vf_cap_flags, but rss_key_size and rss_lut_size keep their
old PF-reported values.

Suppose the old negotiation had RSS_PF with a LUT larger than 64 bytes
(512 or 2048, which ice gives VFs later in this series) and the new reply
drops RSS_PF. Until reset_task runs, an ethtool -X would go:

iavf_set_rxfh()
  iavf_config_rss()
    iavf_config_rss_reg()

which does:

	dw = (u32 *)adapter->rss_lut;
	for (i = 0; i < adapter->rss_lut_size / 4; i++)
		wr32(hw, IAVF_VFQF_HLUT(i), dw[i]);

IAVF_VFQF_HLUT() only has indexes 0..IAVF_VFQF_HLUT_MAX_INDEX (15).
Would the 128 or 512 writes land past 0xD03C, in other VF BAR registers?

With RSS_AQ, iavf_config_rss_aq() casts rss_key to a fixed-size
struct iavf_aqc_get_set_rss_key_data. Could that read past the end of the
old key buffer if the old key was shorter?

This needs a small GFP_KERNEL allocation to fail, so it is unlikely to
trigger.

> +
> +		if (adapter->rss_key_size == key_size)
> +			memcpy(rss_key, adapter->rss_key, key_size);
> +		else
> +			netdev_rss_key_fill(rss_key, key_size);
> +

[ ... ]

> +		adapter->rss_lut_size = lut_size;
> +		/* no queues yet on init, iavf_init_config_adapter() sets RSS */
> +		if (adapter->state != __IAVF_INIT_GET_RESOURCES)
> +			iavf_init_rss(adapter);

[Severity: Medium]
Can this notification go out before the new LUT has any content?

On reinit after iavf_disable_vf() the netdev stays registered, and the
RSS buffers are now kept. So iavf_parse_vf_resource_msg() can run from
iavf_init_get_resources() with adapter->state set to
__IAVF_INIT_GET_RESOURCES and an old rss_lut_size. Suppose the PF
reports a different LUT size and ethtool_rxfh_indir_can_resize()
returns false. Then iavf_rss_lut_resize() leaves the kzalloc()ed
rss_lut all zeros and calls iavf_rss_lut_lost(), which queues
finish_config right away.

iavf_parse_vf_resource_msg() then installs the zeroed buffer as
adapter->rss_lut. It skips iavf_init_rss() because there are no queues
yet. The LUT is only filled later, by iavf_init_config_adapter(), and
that is several watchdog steps away: __IAVF_INIT_EXTENDED_CAPS comes
first, and the watchdog runs as delayed work.

iavf_finish_config() only needs rtnl and the netdev lock, so it can run
in that window. It clears IAVF_FLAG_RSS_LUT_LOST and calls
ethtool_rxfh_indir_lost(). As far as I can tell, that sends an RSS
notification which reads the table back through iavf_get_rxfh(). If so,
userspace is told that every entry of the new table points at queue 0.
When iavf_init_config_adapter() later programs the default spread,
nothing sends a second notification, so the reported table stays
wrong.

Outside init this does not happen, because iavf_init_rss() fills the
new buffer right after the swap, in the same call.

Would it be enough to only set IAVF_FLAG_RSS_LUT_LOST while in
__IAVF_INIT_GET_RESOURCES? The iavf_schedule_finish_config() call at
the end of iavf_init_config_adapter() could then report the loss once
the default LUT is in place.

[Severity: Low]
Should this call handle RSS_AQ the way the other callers do? Both
iavf_init_config_adapter() and iavf_reset_step() defer it:

	if (RSS_AQ(adapter)) {
		adapter->aq_required |= IAVF_FLAG_AQ_CONFIGURE_RSS;
	} else {
		err = iavf_init_rss(adapter);
		if (err)
			goto reset_err;
	}

Outside init, this code runs from the VIRTCHNL_OP_GET_VF_RESOURCES case
of iavf_virtchnl_completion(), where current_op is still
VIRTCHNL_OP_GET_VF_RESOURCES.

The commit message names a PF that stops offering RSS_PF as one of the
cases this patch handles. If such a PF grants RSS_AQ instead,
iavf_init_rss()->iavf_config_rss()->iavf_config_rss_aq() will always hit:

	if (adapter->current_op != VIRTCHNL_OP_UNKNOWN) {
		/* bail because we already have a command pending */
		dev_err(&adapter->pdev->dev, "Cannot configure RSS, command %d pending\n",
			adapter->current_op);
		return -EBUSY;
	}

The -EBUSY is ignored here, while iavf_reset_step() treats an
iavf_init_rss() error as reset_err.

The deferred IAVF_FLAG_AQ_CONFIGURE_RSS handler in
iavf_process_aq_command() only clears the flag, so the end result matches
the other call sites. What this call adds is an error log that always
fires and a failure that is silently dropped.

[ ... ]

> @@ -2563,8 +2665,8 @@ static void iavf_init_get_resources(struct iavf_adapter *adapter)
>  	return;
>  
>  err_alloc:
> -	kfree(adapter->vf_res);
> -	adapter->vf_res = NULL;
> +	/* keep it allocated, ethtool ops may run on reinit */
> +	memset(adapter->vf_res, 0, IAVF_VIRTCHNL_VF_RESOURCE_SIZE);

[Severity: Medium]
With vf_res zeroed while the netdev is registered, RSS_PF() and RSS_AQ()
both return false. iavf_set_rxfh() has no adapter->state check, so can it
end up writing the RSS registers directly?

iavf_set_rxfh()
  iavf_config_rss()
    iavf_config_rss_reg()

iavf_config_rss_reg() writes rss_key_size/4 dwords to IAVF_VFQF_HKEY(i)
and rss_lut_size/4 dwords to IAVF_VFQF_HLUT(i). The RSS buffers and sizes
are now kept across reinit, so these are the PF-negotiated sizes from the
last successful init.

The HLUT register file has 16 entries (IAVF_VFQF_HLUT_MAX_INDEX is 15).
Later in this series ice gives VFs 512 or 2048 entry LUTs under RSS_PF.
Would that mean 128 or 512 writes, reaching 0xD7FC?

Even when the sizes are in range, this writes RSS registers directly on a
VF whose RSS is managed by the PF, and ethtool is told it succeeded.

iavf_disable_vf() already zeroed vf_res like this before this patch. This
change adds a second such window and keeps the large sizes alive across
both.

>  err:
>  	iavf_change_state(adapter, __IAVF_INIT_FAILED);
>  }

[ ... ]

> @@ -2967,6 +3073,7 @@ static int iavf_watchdog_step(struct iavf_adapter *adapter)
>  			 */
>  			iavf_change_state(adapter, __IAVF_STARTUP);
>  			adapter->flags &= ~IAVF_FLAG_PF_COMMS_FAILED;
> +			adapter->aq_wait_count = 0;
>  		}

[Severity: Medium]
Does this fully fix what the commit message describes?

  "It was never reset, so once it reached IAVF_AQ_MAX_ERR, the first wait
  for a PF reply sent init back to __IAVF_COMM_FAILED."

The new reset only runs in the __IAVF_COMM_FAILED recovery branch, which
is after the limit has already been hit. The only other place that
touches the counter is the __IAVF_INIT_FAILED case:

	if (++adapter->aq_wait_count > IAVF_AQ_MAX_ERR) {

Nothing resets it when init makes progress or completes. Nothing resets
it when iavf_reset_step() restarts init either:

	if (adapter->state <= __IAVF_INIT_FAILED) {
		iavf_shutdown_adminq(hw);
		iavf_change_state(adapter, __IAVF_STARTUP);
		iavf_startup(adapter);
		...

So the counter still adds up every __IAVF_INIT_FAILED visit, not just
consecutive failures, and several ordinary waits end up there:

- each extended caps RECV step polls the ARQ without blocking, shortly
  after its SEND

- GET_RESOURCES and VERSION_CHECK polls that run before the PF reply
  arrives

- later in this series, init also waits there for the reset that grants
  the queue request

Once the total passes IAVF_AQ_MAX_ERR (20), won't init still set
IAVF_FLAG_PF_COMMS_FAILED, shut down the admin queue and restart from
__IAVF_STARTUP, even though the PF answered every request?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
