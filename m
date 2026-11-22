Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353842;
	b=0pubz7hb8YD47m4KdI+ButHz+PCR5aB2xtQ918X89C5EYLAgD6NoTiH/mPO2INEJ0CRN
	 l7VeX9bLld+69w/pR0KwNCZovj6M8tmtKquM3vv9C84oW325iVDat4Fk2T3WPola166Bq
	 g0ta6OyEe51m/DIe882/1dtmWXRbgSLJ4lp92IaC7MoST3o1Sf7heMTm0Dy6c482lWJLN
	 aHE5AGydUVobbRaZYlJjOcB9RMu618lRYQ5h8JJotez8Vqk1Eagqqka9uMOt40+3KcKsy
	 yNDhw/fO0J6yqXFqXLaVpyLl96Z1qAesvbtXTIoldXS5lejrSzkqyHyD4siDhFkBn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353842;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PQK6gUTcJDGFmOsJs5LQLSNWPOQXRYFyM0J1ILvMPSk=;
	b=hJFSLC9BgOsPrmr5D0drv7JtuyCkJNTaXyE3wnrCHZxpbKpYrov/Mxb29MMgMEUzjTl5
	 4tDLgGbJoeWGt+1ahO6DtKHB764SE9sov2WYjzOgvK3p2VHaZgc4GfC3P2H6EAeAF8dSS
	 +f/NkFKKz+22cYOutOVZfs+uL+IU4yhDXS61h0PcJmY3BFqF+wsWLxSfe5BBqJI9/6HEa
	 tyo7RBGFYOCtDSH+GIlF5i/HFiADcZ0+O+U1k18p1zOuMRjiZ0lMKVGpxjocRVljLWkBu
	 yIt5eE5y5KPq503JKn5ZhDc8tezdAC6Ch2PnDMsckmovekZC6ZD+PfnQVGPsjLgJ0iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjKixtYE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F8606A320;
	Sun, 22 Nov 2026 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjKixtYE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1925C1F000C6;
	Sun, 22 Nov 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353841;
	bh=PQK6gUTcJDGFmOsJs5LQLSNWPOQXRYFyM0J1ILvMPSk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YjKixtYEZAbNsLetRVKuuSrWcUhQ0gmvwLg9tHviz6aabPdKI/wPsGDWyjwPL3adg
	 CCfNwP3OBVSEqhlYLK58ObeZsnZVR1uOIiLW5h3IcMH9QroK+6RM3wPqGiASpfpMFi
	 q0Y6jR8Jh1rDVlt+I1twhwOfuayq6JflDIS5gv4Z7GQDCCIiN9Ihiuv++H18eXgQwo
	 Q7m6eLC8uhe2flZtDZvGBt6Y97KhtwFzcn32pxigXDZ/gZmWnYJIMbwvgMiCVa7l7I
	 CLlQYJO/9kAZnFBq0zWyUIP8O8u0A8ol3CbmvZxJl7t9cRZBW1e54BGioN7xybFP33
	 7qIFVyeF3fs2w==
Subject: Re: [PATCH v5 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
From: netdev-bot+sashiko@kernel.org
To: shaojijie@huawei.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
 liuyonglong@huawei.com, chenhao418@huawei.com, yangshuaisong@h-partners.com,
 ningwei15@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 13:24:00 +0000
Message-ID: <179535384062.3135.791733868582964041@kernel.org>
In-Reply-To: <20261118130330.3026625-4-shaojijie@huawei.com>
References: <20261118130330.3026625-4-shaojijie@huawei.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] hns3_oom_task() (hns3_enet.c:4456-4470) reads
  HNS3_NIC_STATE_DOWN once into the local `down` at entry.
- [Medium] The patch adds a new private ethtool -S string,
  HNS3_TQP_STAT("rx_oom_cnt", rx_oom_cnt), to hns3_rxq_stats[] in…
- [Medium] rx_oom_cnt can be incremented twice in one NAPI poll, which
  contradicts the stated v5 semantics ("Count rx_oom_cnt for each NAPI…

--

net: hns3: fix interface stuck after OOM with full hardware rx queue

This patch adds a 250ms delayed_work that re-schedules NAPI for RX rings
that hit an allocation failure. A per-ring bitmap tracks those rings. The
patch also replaces the earlier approach of returning budget from
hns3_clean_rx_ring() on allocation failure, and adds a per-ring rx_oom_cnt
ethtool counter.

> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> index 5677e32fc3da4..60fc296020ab2 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

[ ... ]

> @@ -4161,6 +4163,7 @@ static int hns3_add_frag(struct hns3_enet_ring *ring)
>  			if (unlikely(!new_skb)) {
>  				hns3_rl_err(ring_to_netdev(ring),
>  					    "alloc rx fraglist skb fail\n");
> +				hns3_ring_set_oom_state(ring);
>  				return -ENXIO;
>  			}
>  
> @@ -4450,6 +4453,30 @@ static int hns3_handle_rx_bd(struct hns3_enet_ring *ring)
>  	return 0;
>  }
>  
> +static void hns3_oom_task(struct work_struct *work)
> +{
> +	struct hns3_nic_priv *priv = container_of(work, struct hns3_nic_priv,
> +						  oom_task.work);
> +	bool down = test_bit(HNS3_NIC_STATE_DOWN, &priv->state);
> +	struct hnae3_handle *h = priv->ae_handle;
> +	struct hns3_enet_ring *ring;
> +	u16 i;
> +
> +	for (i = 0; i < h->kinfo.num_tqps; i++)
> +		if (test_and_clear_bit(i, priv->rx_ring_oom_bm) && !down) {
> +			ring = &priv->ring[i + h->kinfo.num_tqps];
> +			napi_schedule(&ring->tqp_vector->napi);
> +		}
> +}

[Severity: High]
Can the stale down value here lose a recovery bit that was set after the
interface came back up?

hns3_nic_net_down() doesn't cancel oom_task, so an instance can still be
running while hns3_nic_net_up() runs. Consider this sequence:

hns3_oom_task()
  down = test_bit(HNS3_NIC_STATE_DOWN, ...);   /* true */
  <preempted before reaching ring i>

                    hns3_nic_net_up()
                      clear_bit(HNS3_NIC_STATE_DOWN, &priv->state);
                      hns3_enable_irqs_and_tqps(netdev);

                    NAPI poll on ring i, allocation fails
                    hns3_clean_rx_ring()
                      hns3_ring_set_oom_state(ring);  /* sets bit i */
                      hns3_oom_task_schedule(ring);   /* queues new run */
                      return recv_pkts;               /* NAPI completes */

hns3_oom_task() resumes
  test_and_clear_bit(i, ...) returns true, but down is still true,
  so napi_schedule() is skipped and bit i is now clear

250ms later the newly queued instance finds bit i clear and does nothing.

hns3_clean_rx_ring() now returns recv_pkts instead of budget, so NAPI has
already exited. If ring i has no armed RX buffers left, the hardware won't
raise another RX interrupt. Wouldn't the ring then stay stuck? That is the
condition this patch is meant to fix.

The commit message says:

  If it runs while DOWN is set, it clears the per-ring bits without
  scheduling NAPI. [ ... ] Both outcomes are harmless.

That doesn't seem to hold for this interleaving. Two possible ways to
close the window:

- return early without clearing any bits when DOWN is set, or
- re-check DOWN after each test_and_clear_bit() and set the bit again.

Would either of these work here?

> +
> +static void hns3_oom_task_schedule(struct hns3_enet_ring *ring)
> +{

[ ... ]

> @@ -4489,10 +4519,15 @@ int hns3_clean_rx_ring(struct hns3_enet_ring *ring, int budget,
>  	 * FBD number with head pointer
>  	 */
>  	if (unused_count > 0)
> -		failure = failure ||
> -			  hns3_nic_alloc_rx_buffers(ring, unused_count);
> +		failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
> +
> +	if (unlikely(failure))
> +		hns3_ring_set_oom_state(ring);

[Severity: Medium]
Can rx_oom_cnt be incremented twice in a single NAPI poll here?

The commit message says the counter is "incremented for each NAPI poll
that hits an RX allocation failure". When the fraglist napi_alloc_skb()
fails in hns3_add_frag(), the path looks like this:

hns3_clean_rx_ring()
  hns3_handle_rx_bd()
    hns3_add_frag()
      hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ */
      return -ENXIO;
  goto out;
  failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
  if (unlikely(failure))
      hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ again */

-ENXIO doesn't match the new err == -ENOMEM check. But failure can still
be true, either from a failed exit refill or from an earlier failed
in-loop refill. Under the memory pressure that caused the fraglist
failure, the refill is likely to fail too.

hns3_ring_set_oom_state() has no per-poll dedup, so in this case the
counter goes up by two for one poll.

[ ... ]

> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> index 7b92a3c73ef6d..14642f81efe1a 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
> @@ -62,6 +62,7 @@ static const struct hns3_stats hns3_rxq_stats[] = {
>  	HNS3_TQP_STAT("non_reuse_pg", non_reuse_pg),
>  	HNS3_TQP_STAT("frag_alloc_err", frag_alloc_err),
>  	HNS3_TQP_STAT("frag_alloc", frag_alloc),
> +	HNS3_TQP_STAT("rx_oom_cnt", rx_oom_cnt),

[Severity: Medium]
Should this value go through the standard per-queue rx-alloc-fail qstat
rather than a new ethtool -S string?

hns3_ring_set_oom_state() increments rx_oom_cnt on RX skb and buffer
allocation failures. That is the event the alloc_fail field of struct
netdev_queue_stats_rx tracks. Documentation/netlink/specs/netdev.yaml
describes rx-alloc-fail as:

  Number of times skb or buffer allocation failed on the Rx datapath.
  Allocation failure may, or may not result in a packet drop, depending
  on driver implementation and whether system recovers quickly.

The commit message says:

  It is a diagnostic counter for this recovery path, not the standard
  rx-alloc-fail qstat.

Counting per poll instead of per allocation looks like a granularity
choice, and the standard definition leaves that choice to the driver.

hns3 doesn't implement netdev_stat_ops or get_queue_stats_rx yet.
Implementing them would expose this value through the standard uAPI.

The same failures already increment the existing sw_err_cnt ("dropped")
counter in hns3_alloc_skb() and hns3_nic_alloc_rx_buffers().

This patch carries a Fixes: tag, and the new user-visible counter makes it
harder to take through the net tree as-is. Could the counter be split out
of this fix?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118130330.3026625-1-shaojijie%40huawei.com
