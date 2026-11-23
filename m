Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438330;
	b=0Nopc2aikmtAqNSdjRK4zN2dUOaY3weQm4Z+haAFj0/JFqtHTdiQ/xPVwyh2l7aq1ZAH
	 PmWBdJL05dkG8oo7XzKApjqhkIBAAHFyDPdsR4/f6CkHhthQVc6i6nK5FYStpTLlKXqjy
	 Z4/ibfex6blqKF57zKdMlA7+MsQfpWHhEGBDU9D51aH7L5SL+D3orObA+jKpVWarwkMvl
	 YmzqAXbW0MTP20s3Y2w4N4uTEQN/QHQdfQQfhoAXtuU9zkRosvEohMO+m5B8ZFd34hAI7
	 N0dtx+3WlEbpB6F0D65F208SRxLRhde5eeGxGwKZQNep08QPv8asSu+3Ce9QMsnrT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438330;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h9ZUjDmunpwZz8eMoC/Lxj2yys6gfAnkin9JNTfCTAg=;
	b=trOykrSk790XdNgQ+55z1lowWPYxPkCVv8G/l+dur1c78A74FYyjaqYcUpOo0UMMyG07
	 FUrCpreyPe+bkJoOWp4RaUTjK7gpA0r1GqW30ywRGl5vWnOKs+eLrI2B52kNgcaWZF4ug
	 7+YY5cFffunnPO8/KOzDR7Csl6ZVta2bgrHO6qrZicwccLSaRM4BR7N/PnCqY57RKGufF
	 oiRFpJz/uT4gzypzKLis3XjlAwV/Ctyo3hjFZoN+Z4gFHAnGFf/UOFxikd1a/KlVAWyRi
	 YWGJbGg6+uWGIo5iCytpWUVCpzFG6uyvBvdZi5fVrGcqiTaqSsE54sTDdilE1zKS+IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xijd59ht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202F606A696;
	Mon, 23 Nov 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xijd59ht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8981F00A19;
	Mon, 23 Nov 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438330;
	bh=h9ZUjDmunpwZz8eMoC/Lxj2yys6gfAnkin9JNTfCTAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xijd59htkxGoFzxiJoIN8sIAueVLHqPCSS2GYYh1CHo7Q1thsb4UFk6eZW31D67Zy
	 qfXZNcg40F7Ewz9Zl+3Bobwd6czDw4wSEQxiOrCBKwL8uwVzDJl48c8SO1mA6AyFaP
	 bUoMWf5tGZNdDvmAlvfvFXTAXorTMVO5Ob8AWiLqwAjLpgX4+x0/ZD7MsGgRQbqXuG
	 NRvb/i7SPLPgsjy3hXSetAqqLpoi4q75XeNMMJStnNE9oichjrkVnT+Wmqb48zdy88
	 2CwzrfJM9KiXa01AB1RfevDofHc3YUbU3glx7a5EE07B39im0Kl8JgGNbp91fUylnh
	 QOy5U0ZbzlBmQ==
Subject: Re: [PATCH v35 net-next 8/8] net/nebula-matrix: add common dev
 start/stop operation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:09 +0000
Message-ID: <179543832921.3135.12200832894176272241@kernel.org>
In-Reply-To: <20261119113530.32107-9-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-9-illusion.wang@nebula-matrix.com>
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

- [Low] The commit message and the new comments argue against earlier
  review feedback more than they describe this change.
- [Low] This patch adds a third queue_work() site for the mailbox clean
  task: the hardirq handler nbl_dev_clean_mailbox() calls…
- [Low] A comment in nbl_dev_setup_common_dev() (added earlier in this
  series by commit "net/nebula-matrix: add common/ctrl dev init/remove…

--

net/nebula-matrix: add common dev start/stop operation

This commit adds nbl_dev_start() and nbl_dev_stop(). They are called
from nbl_probe() and nbl_remove() through nbl_core_start() and
nbl_core_stop().

Start configures the MSI-X map, fetches the VSI/ETH ids, allocates the
MSI-X vectors and arms the mailbox interrupt. Stop undoes these steps.

nbl_probe() now also rejects a function that has neither the ctrl nor
the net capability.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c
> index b20747d47fde2..de6a30996bb32 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

[ ... ]

> @@ -19,6 +30,247 @@ static void nbl_dev_init_msix_cnt(struct nbl_dev_mgt *dev_mgt)

[ ... ]

> +static int nbl_dev_disable_mailbox_irq(struct nbl_dev_mgt *dev_mgt)
> +{

[ ... ]

> +	lvec = msix_info->serv_info[NBL_MSIX_MAILBOX_TYPE].base_vector_id;
> +	/*
> +	 * Disable sequence invariant: clear the software READY flag first,
> +	 * then mask the hardware interrupt. Must not reverse the order.
> +	 *

[ ... ]

> +	 * This does NOT preserve in-flight ACKs, and must not be described
> +	 * as doing so: the woken sender gives up and resets its slot to
> +	 * IDLE, so an ACK arriving afterwards finds a non-WAITING slot and
> +	 * is dropped by the receive path ("Skip ack invalid status").
> +	 * Interrupt mode is being torn down here; the guarantee is a
> +	 * bounded, deterministic failure, not delivery.  In this driver
> +	 * every ACK-requesting sender runs from probe/remove and the clean
> +	 * task only sends ACK-less replies, so nothing depends on the
> +	 * stronger claim today.

[Severity: Low]
This isn't a bug, but could this comment be cut down to just the
invariant? Wording like "must not be described as doing so" reads like
a reply to earlier review, not documentation of the code.

The same thing happens in a few other places in this patch.

The comment at the top of nbl_dev_start() repeats the commit message's
argument for -ETIMEDOUT over -EPROBE_DEFER.

The lifetime of the control PF's MSI-X resources is explained three
times: in the commit message, at the err_destroy_map label in
nbl_dev_start(), and again in nbl_dev_stop(). This covers the
had_config path, the coherent table being kept, and nbl_intr_mgt_stop()
being the only release.

Those comments also describe the internals of functions in
nbl_interrupt.c:

  __nbl_res_intr_prepare_destroy_msix_map()
  __nbl_res_intr_complete_destroy_msix_map()
  the rollback in nbl_res_intr_cfg_msix_map()
  nbl_intr_mgt_stop()

Won't these comments go stale without anyone noticing when those
functions change?

Most of the commit message is also about alternatives that were not
taken, for example:

    Relaxing the dependency to
    "func 0 finished nbl_dev_init()" would therefore let every sibling RPC
    sit out the full 5-6s polling wait.  Converting the timeout to
    -EPROBE_DEFER would only hide it behind dev_dbg() and make every later
    bind pay that wait again.

The same goes for the pcim_msi_release double free discussion and the
driver_override paths. Could the changelog focus on what start and stop
actually do?

The label rename in nbl_dev_init() (setup_ctrl_dev_fail becomes
out_remove_common_dev, and setup_err is dropped) is not related to
start/stop. Would it fit better in a separate patch?

[ ... ]

> @@ -86,6 +338,14 @@ static void nbl_dev_clean_mailbox_task(struct work_struct *work)
>  				      NBL_CHAN_TYPE_MAILBOX);
>  }
>  
> +static void nbl_dev_clean_mailbox_schedule(struct nbl_dev_mgt *dev_mgt)
> +{
> +	struct nbl_dev_common *common_dev = dev_mgt->common_dev;
> +	struct nbl_common_info *common = dev_mgt->common;
> +
> +	queue_work(common->wq, &common_dev->clean_mbx_task);
> +}

[Severity: Low]
This adds a third queue_work() site for clean_mbx_task, called from the
nbl_dev_clean_mailbox() hardirq handler. The invariant comment in the
channel layer still says there are only two:

drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:nbl_chan_teardown_queue() {
    ...
	 * Nothing can be queued once Step 1 has run: both queue_work()
	 * sites (the sender's ACK poll and the worker's own self-requeue)
	 * check shutdn and clean_task under state_lock, and Step 1 cleared
	 * both.
    ...
}

The new site checks neither shutdn nor clean_task, and it cannot take
the state_lock mutex from hardirq context. It also skips the common->wq
check that nbl_chan_send_msg() makes before calling queue_work().

The invariant still holds today, but only because the device layer
frees the mailbox IRQ first. nbl_dev_stop() calls
nbl_dev_free_mailbox_irq() before the channel is torn down in
nbl_core_remove()->nbl_dev_remove_common_dev(). The nbl_dev_start()
rollback frees the IRQ at err_free_irq.

Should the comment in nbl_chan_teardown_queue() list the hardirq site?
Should it also say that the invariant depends on the IRQ being freed
before teardown_queue() runs? This patch's commit message already
lists three sources ("queued by the mailbox hardirq, by the task's own
self-requeue, or by this function's polling sends").

[ ... ]

> @@ -309,3 +569,189 @@ void nbl_dev_remove(struct nbl_adapter *adapter)
>  	if (common->has_ctrl)
>  		nbl_dev_remove_ctrl_dev(adapter);
>  }
> +
> +/* ----------  Dev start process  ---------- */
> +int nbl_dev_start(struct nbl_adapter *adapter)
> +{

[ ... ]

> +	ret = nbl_dev_cfg_msix_map(dev_mgt);
> +	if (ret)
> +		goto err_destroy_map;
> +
> +	/* Fetch VSI/ETH identity after cfg_msix_map */
> +	ret = disp_ops->get_vsi_id(priv, NBL_VSI_DATA, &common->vsi_id);
> +	if (ret)
> +		goto err_destroy_map;
> +	ret = disp_ops->get_eth_id(priv, common->vsi_id, &common->eth_num,
> +				   &common->eth_id, &common->logic_eth_id);
> +	if (ret)
> +		goto err_destroy_map;

[Severity: Low]
Does this match the comment that an earlier patch in this series added
to nbl_dev_setup_common_dev()?

	/*
	 * VSI/ETH identity is deliberately not fetched here but in the
	 * start path, which is where it is used: the IDs only feed MSI-X
	 * and queue setup.

Here the IDs are fetched after nbl_dev_cfg_msix_map(), and the
cfg_msix_map dispatch op takes no VSI/ETH input:

drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_dispatch.h:
	int (*cfg_msix_map)(struct nbl_dispatch_mgt *disp_mgt,
			    u16 num_net_msix, u16 num_others_msix,
			    bool net_msix_mask_en);

The series has no queue setup yet either. As far as I can tell,
common->vsi_id, eth_id, eth_num and logic_eth_id are written here and
never read. The one exception is vsi_id, which is passed to get_eth_id.

Even so, a failure from either RPC still aborts probe through
err_destroy_map. For example, nbl_res_get_eth_id() can return an error
for a PF/VSI mismatch or when rel_pf_id >= eth_num.

Should the fetch move to the patch that uses these IDs? If not, should
the comment in nbl_dev_setup_common_dev() be corrected?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
