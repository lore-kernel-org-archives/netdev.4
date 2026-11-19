Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100988;
	b=LxVoUkAOfOX1YgqIerRQA2cQwr8R0zCk/IR6OYAeWkx9QwEIca5vnFygsBCCms4KoNzp
	 WAGEac3z5hjkXj5lMVp8zL1s9Kqz26y/QUgW5UqYc9szryI7jPWdpEptFkLnVkpV3Np0m
	 3fwP3QUOXl4oC5hqrpBhsFz8OHd3bYmcNaCAIVVdm719chA59Cg6Qj7+tIyOrlvJH840c
	 TXzj3KvHHECwzMHcIS+7x3C60hanhg5voUgmkWYyM59J6WG+InSzu9cjS4ku9mepU2yqO
	 1s+i1Pxyu75Zx8aSnxikmCpyIBKrjrTTPZgJTB/y4zK9ItzlCABdS8Ax2AEIwou/Img==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100988;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M9653napI0p8zNI7iq+j4iPWK2c0oBZ02qhHfwFDJ2w=;
	b=FZi3zvgroWJnWQ9xGqsUjWC+mjRmm5QQHq6gZHwjmswSC/T5zf1FZw/hPqbWEpESkMs9
	 AliKKEn20Jd2tIsgJ52qqAv4JtXwNAu9x+JHDLcBTjDEorTHYoOprIH4RtDMXVRVT7z3N
	 SIOO/REylgUUt0Ce6HbU9QYQDPYIb7Hn6p8HQfmHwS7I9zC4s3AqlIhSJ05J7bBTMHFAS
	 HR1xnlSLjd5zjcku18GOnC0kw8n7aS0B4YIRfwbU0pMpZTPqkztB4g8NjsTf6KIVZpg/n
	 gCI56neQxoqKXsMtCZ57gVyqBAj7xjTrv8AplDCw/06mLHO4FUCJThDR3UsMSAd4OWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTHpn8kQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DD60A2606;
	Thu, 19 Nov 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTHpn8kQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA981F000C4;
	Thu, 19 Nov 2026 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100987;
	bh=M9653napI0p8zNI7iq+j4iPWK2c0oBZ02qhHfwFDJ2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NTHpn8kQlcFJyY2BgBPKmZbi5AsQKNb6TzQfcQKhC4UMU3rDjYSaeWOzx7E5VAMH8
	 ywFYCwSsQdtasr3dNSOCE4M1YOCe4Pm0Ziv7lBm1s1dHOgKJQp6e+WiRPoc8phMI9C
	 lsIb2J0gSBxgmcLLO56WL48ak64FCgdHDdiZjTBAWvns7R2KOtXjXiPuK2rCjlSJYB
	 U8bRHrr8UmDoF18xq6a+tjMFdKYp301O1P91bWjSaLSX9bAyzRH2J8MyYUcq7Yn8jr
	 rts0d1PcA59GOkGDsnZFFpEt6pBgCvJ7k49NdvUjCdBtgLKfIyjRm8MUWWwDq1ikA4
	 QJaeYYraBTUZg==
Subject:
 Re: [PATCH net-next v2 5/5] net: rnpgbe: Add hardware and queue statistics
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Thu, 19 Nov 2026 15:09:46 +0000
Message-ID: <179510098686.3136.4654059971237578202@kernel.org>
In-Reply-To: <65EB247A8B937B64+20261116031055.1330377-1-dong100@mucse.com>
References: <65EB247A8B937B64+20261116031055.1330377-1-dong100@mucse.com>
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

- [Medium] The patch makes the device-level RX packet and byte counts in
  netdev qstats disagree with the rtnl stats64 counts, so the in-tree…

--

net: rnpgbe: Add hardware and queue statistics

This commit adds the hardware RX CRC-error and multicast counters to
ndo_get_stats64. It also reports per-queue RX and TX packet and byte
counters through netdev queue statistics, and exposes per-queue TX DMA
mapping failures through ethtool statistics.

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

Will the qstat rx-packets and rx-bytes reported here ever match the
rx_packets and rx_bytes that rnpgbe_get_stats64() reports?

rnpgbe_get_stats64() reads queue_stats->packets and queue_stats->bytes.
rnpgbe_clean_rx_irq() also increments those for good packets that the
driver drops. One example is the skb build failure path:

	if (!skb) {
		atomic64_inc(&rx_ring->stats->skb_alloc_failures);
		...
			if (rnpgbe_test_staterr(rx_desc, M_RXD_STAT_EOP)) {
				total_rx_bytes += size;
				total_rx_packets++;
				total_rx_dropped++;

The same thing happens when a MUCSE_RX_DROP_RESOURCE frame reaches EOP,
and when rnpgbe_cleanup_headers() fails with size >= ETH_HLEN. None of
these paths update delivered_packets or delivered_bytes.

rnpgbe_get_stats64() covers all RNPGBE_MAX_QUEUES. So do the qstat device
totals, which pick up inactive queues through rnpgbe_get_base_stats().
That means after the first such drop, the rtnl RX counts stay above the
qstat RX counts for good.

tools/testing/selftests/drivers/net/stats.py pkt_byte_sum() expects the
two to match:

    # Compare stats, rtnl stats and qstats must match,
    ...
        if stat_cmp(rtstat, qstat) > 0:
            raise KsftFailEx("Qstats are lower, fetched later")

Once any RX drop has happened, wouldn't this test fail on rnpgbe? The
commit message describes the split: "RX queue counters cover packets
delivered to the networking stack, while interface RX totals also include
good packets dropped by the driver".

Could both interfaces report the same packets and bytes? Alternatively,
could driver drops be counted only in rx_dropped, and not in the rtnl
rx_packets and rx_bytes?

> +	stats->alloc_fail = atomic64_read(&queue->page_alloc_failures) +
> +			    atomic64_read(&queue->skb_alloc_failures);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
