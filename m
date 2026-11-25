Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588567;
	b=iaNftEoucbcXoBM/oJdQru0MgxZGL+b95/m+UOgqjNQ6OpcVfLm7esXTmW1v713He5W3
	 L0G1fPFK6s8iaobobBXnvbGF6hVX+BvutON0/pi98ydUmt3h4zB1amJFQ2WIswH9RhWbR
	 2W+s4RdnY4mulkzFLfFjjOVlKQyTgXycJhfxeEkzb+GBgoUgDo2OT5dHlAGeskiQYBQaT
	 eQ/Zf7AbFlvOxybDnRyBzCbB36yW3aW9SYTlq/L7QyaFvp1tSUs53Hldb0FqvZ/Uclz1g
	 suKdhwdvcas2EGQeRij5ADQpoHcIGZfYZFEzvO5M/CLVhsD36Dm8b13T4cPITIT4FKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588567;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZYLJZ6q+uI9UPksDd4iVcjy9aW9Y3HRmtIfdwK4ESxI=;
	b=XNXpvF2AmCWUEzPi6ylau+3xAWq9bXMJSJY5saM2pv/QlTeG0/zBCx/CHBCQ1mURxscE
	 gAFI/ae2q9RTeYAF9BIMq06egvBDfiM0mF1xtJy3X0TKwWAmOk/E3TNbx5tZYPZHnUXdl
	 phBZTILDoWdC1gqIMZmZp+b4LFfQxOMxdEXRS7lgTi3iJHboRYDrhVf+mbDJYrLssgYzW
	 jHFaVaF9A0CflaMa6dPaiVTWqctoED5xXfDiWskl54GY9twGN4tB0vKJ3B1fQ1csTcYE+
	 nJNOlRu2OfxY4yic2VHoXugJnuRRH4WC6wBhjseJpsBYsISSPuUuIDSsku3vtWGhPBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Erf5VTqp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A27606A33C;
	Wed, 25 Nov 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Erf5VTqp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A65E1F00ACF;
	Wed, 25 Nov 2026 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588566;
	bh=ZYLJZ6q+uI9UPksDd4iVcjy9aW9Y3HRmtIfdwK4ESxI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Erf5VTqpoqaVrI6hJ90XfSP4/P/gDGaLqOGN3CknZ2RFhCOwu8LhSm5fyPMYZsjpC
	 crAad+KIQUZofKFZD74471SgplmJ+Mml43usYfHVEG5Vfs0Nc8IN2zbZT5afhIUn4E
	 jbKe1UQ34/L49tPaedo72v843Hcrx6Vk2h2Pq+vC+n356iWp+6mFer3eqECL/c6LMD
	 cUcrr59/rqDR99Ajonw5wwjQYbJzuhscMsvjT+4rHvhkEX7b7JAXlCpVhqop3d+TOc
	 fl+bpA6NU/7uPSOrVY+/W7dxDAjrSBiYz9VL17Y9AsUcsswkd2/BLR5C7k783qcsxl
	 cGJQyCPNtqiRQ==
Subject:
 Re: [PATCH net-next v3 5/5] net: rnpgbe: Add hardware and queue statistics
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Wed, 25 Nov 2026 06:36:06 +0000
Message-ID: <179558856602.3135.7505371780005583025@kernel.org>
In-Reply-To: <DB48C65C5764A9FD+20261124060623.411536-1-dong100@mucse.com>
References: <DB48C65C5764A9FD+20261124060623.411536-1-dong100@mucse.com>
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

- [Medium] After this patch the driver reports two RX totals that
  disagree.

--

net: rnpgbe: Add hardware and queue statistics

This commit adds hardware RX CRC-error and multicast counters to
ndo_get_stats64, accumulated from the service task. It also reports
per-queue RX/TX packet and byte counters through netdev queue stats, and
exposes per-queue TX DMA mapping failures through ethtool statistics.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> index b7b0c45a0f664..fe320c4f389ba 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c

[ ... ]

> @@ -615,6 +620,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
>  
>  		/* probably a little skewed due to removing CRC */
>  		total_rx_bytes += skb->len;
> +		delivered_bytes += skb->len;
> +		delivered_packets++;
>  		rnpgbe_process_skb_fields(rx_ring, skb);
>  		rx_desc->wb.cmd = 0;
>  		napi_gro_receive(&q_vector->napi, skb);
> @@ -626,6 +633,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
>  	u64_stats_update_begin(&rx_ring->stats->syncp);
>  	rx_ring->stats->packets += total_rx_packets;
>  	rx_ring->stats->bytes += total_rx_bytes;
> +	rx_ring->stats->delivered_packets += delivered_packets;
> +	rx_ring->stats->delivered_bytes += delivered_bytes;
>  	rx_ring->stats->length_errors += total_rx_length_errors;
>  	atomic64_add(total_rx_dropped, &rx_ring->stats->dropped);
>  	u64_stats_update_end(&rx_ring->stats->syncp);

[ ... ]

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
> new file mode 100644
> index 0000000000000..efd2284fd93af
> --- /dev/null
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c

[ ... ]

> +static void rnpgbe_get_queue_stats_rx(struct net_device *netdev, int idx,
> +				      struct netdev_queue_stats_rx *stats)
> +{
> +	struct mucse *mucse = netdev_priv(netdev);
> +	const struct mucse_queue_stats *queue;
> +	unsigned int start;
> +
> +	queue = &mucse->rx_stats[idx];
> +	do {
> +		start = u64_stats_fetch_begin(&queue->syncp);
> +		stats->packets = queue->delivered_packets;
> +		stats->bytes = queue->delivered_bytes;
> +	} while (u64_stats_fetch_retry(&queue->syncp, start));

[Severity: Medium]
Can this leave the qstat RX totals permanently out of step with the rtnl
RX totals?

rnpgbe_get_stats64() adds rx_stats[i].packets and rx_stats[i].bytes into
rx_packets and rx_bytes. In rnpgbe_clean_rx_irq(), the driver-drop paths
increase those counters but leave delivered_packets and delivered_bytes
alone. One example is the skb == NULL path at EOP:

	if (!skb) {
		atomic64_inc(&rx_ring->stats->skb_alloc_failures);
		...
			total_rx_bytes += size;
			total_rx_packets++;
			total_rx_dropped++;

The MUCSE_RX_DROP_RESOURCE EOP path and the rnpgbe_cleanup_headers()
failure path with size >= ETH_HLEN behave the same way.

This callback reports only delivered_* as qstat rx-packets and rx-bytes.
rnpgbe_get_base_stats() uses the same callback through
netdev_stat_queue_sum() for the inactive queues. So after the first
driver RX drop, the rtnl totals stay higher than the qstat totals. An
skb allocation failure under memory pressure is enough to cause that
drop. Nothing resets these counters, so the gap never closes.

The generic selftest expects the two sets of totals to match:

tools/testing/selftests/drivers/net/stats.py:pkt_byte_sum()
    # Compare stats, rtnl stats and qstats must match,
    ...
        if stat_cmp(rtstat, qstat) > 0:
            raise KsftFailEx("Qstats are lower, fetched later")

The commit message says the split is intentional. Even so, could both
interfaces report the same packet and byte counters? One option is to
use packets and bytes here. Another is to keep driver drops out of the
rtnl rx_packets and rx_bytes totals.

> +	stats->alloc_fail = atomic64_read(&queue->page_alloc_failures) +
> +			    atomic64_read(&queue->skb_alloc_failures);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
