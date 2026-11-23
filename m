Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401723;
	b=lzarU4CAHKZXAmkgxU/pMLxQyDAzp7RHgzvJH4VChyYIa2Np+NDZ4O4yt9UgMz0oXrFV
	 I9ub4HQVbXSGJZ9G2Aa4bT8Zr27o3uT2/2O+NY4bg4qwdHSssasepEI7ZTxgQq+eJFzX2
	 y5on5vRKIAdaDgG5Ik59n6LUk+l2U/U4CsfIKB0EKUG5pmHH/vkXgQb+lg6PW36obEbSy
	 Bjx8oHpcou+F3AyN3JstQrni4rMJwRwo6UvjuvHuj9zbfkYcUV5w74N/sHi27+mAHx8OF
	 AnfStDQG6zZCVGb7oVwAbJolQpqFWxEB1I8LsDU4zjtk8B4fcLmgRSX35czGq3H4G6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401723;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=mfL5Wgk6pZ0N+3mT3cQv6ztLBcyTk1MQkPmbfooOQOQ=;
	b=Wpwm8yAWfw6KIIHOLkg0NeAni8nwko1OInNmUOgD4zLZy3XOnZcJyt7fmkhOSNgq7qI5
	 U3LX8Dd7A6clMncuiyAYAIoloGNfqG9B/DTPERZEwE2itG2ickMZ0Ixq8OUTjC4vDH37X
	 L6W8t87LIPGA43zjrjCEtAZNADtvkwxGECB+Knm0/ituCFpYbJRTX/QIl6EKqqY3xxqtM
	 Jlj1EmEXoN6obR8J93RmlMB/zielYEzinN1SJJthBjcWImhHvKYmyKTOk5m3o7moWqgP0
	 GeOo1byX6OZ0ogLnBkGPXhaH+AUJUIsYmOaga9jrAhy9cfahVCh7V7U2WSUR3IU9YQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE6606A31A;
	Mon, 23 Nov 2026 02:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz10t1795401610t2ee855ed
X-QQ-Originating-IP: xqRzMGlNuotEU1WUJME9cGTUhHEAQ9meuvI+SdzLkks=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 10:40:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6404561023919649307
EX-QQ-RecipientCnt: 10
Date: Mon, 23 Nov 2026 10:40:07 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 5/5] net: rnpgbe: Add hardware and queue
 statistics
Message-ID: <9D6BBC7AB42EE9D4+20261123024007.GA35839@nic-Precision-5820-Tower>
References: <65EB247A8B937B64+20261116031055.1330377-1-dong100@mucse.com>
 <179510098686.3136.4654059971237578202@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179510098686.3136.4654059971237578202@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NAYFIXJ3sbUsJGws8Ctu4wc5qcVT679qDmqUbcMZE4SWbHIPhJRwGvlQ
	sxB5GMEnVGwLwzqkOOFWgN9cs+IgAZ7VJVYC/6M/Q10cVwMtOwlwLai7e4t7UFZujhUlm56
	V89hQEegsPE2UxrXsxXySxEzg7ipP0/jYyKjOV6LP2P6O4n6V1vdGt8Gw3y2lhUNhGPNohv
	IBSqdGAKOHTCr664pjN9flOtuDTuEqTbjgb3SpOW5q+3z/wQudutICr9TNn5FuhdGQxPV8U
	4zt25r/yaRQo8oooipBAgCXzHSy3YNC1qKGeul/TvNHvnTtwqkl3YmA5FxQhTtQYPfGGjjv
	61I/7iTTNe/2nLQMyj2iRRKii2syMDFUEuJcuxO6bH9lO1Og19r3xsmIx5QY3rOU0AM6Us3
	sdxpqlKmzQ9YbHn6o0YT+daaq86+LJwBWGdw2JGE75w5hPyIx4L/oxXrptbAT1pCT/b190e
	/i94aK/2ojvXn5bGfzdSjiDsNzYPbMNBG/5UUH+/69YdaN6v6lhoZD7YPa9JzDy5MeEVUVZ
	y3oVQ/aCE+rGpX437rqoM7pmvf0YRAj6AbI4JGSwVpVLLqhvPE7ESZxkczzN8ouPBBEe+rj
	WxxmtKfGdybramqnYX8PKCjFPfYBsLQ1kToFYMbj8ZMzCMmaX0cE3ma0+EG2TCMp2DkVSxD
	2tm/4CsyIEzRt6YJ2ZJkzgluVypgxsFwydoPOExZ8A10IBX8Ghn9ZOZgYokSpasVcmvc9b5
	TwtJWmOX4l4uCH2YiZ1QKfLaYAlNjThAjHJb+uD+hjC2BSQ98K4mlcQlwHSeiHINgDv/7Mu
	B2XBtST6K29M6F2Y1bzE7AiWust50r+kuSfAn69XEspRbtkUgWSLA5V7YcmzCplzxrOGcN8
	/qZyMMohFk7TtRDDXMsPTj/qYp69Sl+R2x1L5AIl/jNmbyvHxxCwp39k9GNt5buvAXoyjL9
	9LDhzkDkInVFeEGU8FpSzk5pg+reLdo9cA9QAEtOHFF6oOXcG6SaGEHAj6DJiaHe0CqHIdb
	GoYpqfpysd3FysIKqkbdxHOj36vHaooYuen3HqZ3i1yBLtIDiaSPj/RWcN7d/5qv+Aem8W5
	CFQn4FLhA0BhV0ixxXc3PmGIM4jWfYVQLKrrocDUqHvLuLZRPrn3d4=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Thu, Nov 19, 2026 at 03:09:46PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch makes the device-level RX packet and byte counts in
>   netdev qstats disagree with the rtnl stats64 counts, so the in-tree…
> 
> --
> 
> net: rnpgbe: Add hardware and queue statistics
> 
> This commit adds the hardware RX CRC-error and multicast counters to
> ndo_get_stats64. It also reports per-queue RX and TX packet and byte
> counters through netdev queue statistics, and exposes per-queue TX DMA
> mapping failures through ethtool statistics.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> > index b7b0c45a0f664..fe320c4f389ba 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> 
> [ ... ]
> 
> > @@ -615,6 +620,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
> >  
> >  		/* probably a little skewed due to removing CRC */
> >  		total_rx_bytes += skb->len;
> > +		delivered_bytes += skb->len;
> > +		delivered_packets++;
> >  		rnpgbe_process_skb_fields(rx_ring, skb);
> >  		rx_desc->wb.cmd = 0;
> >  		napi_gro_receive(&q_vector->napi, skb);
> 
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
> > new file mode 100644
> > index 0000000000000..efd2284fd93af
> > --- /dev/null
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
> 
> [ ... ]
> 
> > +static void rnpgbe_get_queue_stats_rx(struct net_device *netdev, int idx,
> > +				      struct netdev_queue_stats_rx *stats)
> > +{
> > +	struct mucse *mucse = netdev_priv(netdev);
> > +	const struct mucse_queue_stats *queue;
> > +	unsigned int start;
> > +
> > +	queue = &mucse->rx_stats[idx];
> > +	do {
> > +		start = u64_stats_fetch_begin(&queue->syncp);
> > +		stats->packets = queue->delivered_packets;
> > +		stats->bytes = queue->delivered_bytes;
> > +	} while (u64_stats_fetch_retry(&queue->syncp, start));
> 
> [Severity: Medium]
> 
> Will the qstat rx-packets and rx-bytes reported here ever match the
> rx_packets and rx_bytes that rnpgbe_get_stats64() reports?
> 
> rnpgbe_get_stats64() reads queue_stats->packets and queue_stats->bytes.
> rnpgbe_clean_rx_irq() also increments those for good packets that the
> driver drops. One example is the skb build failure path:
> 
> 	if (!skb) {
> 		atomic64_inc(&rx_ring->stats->skb_alloc_failures);
> 		...
> 			if (rnpgbe_test_staterr(rx_desc, M_RXD_STAT_EOP)) {
> 				total_rx_bytes += size;
> 				total_rx_packets++;
> 				total_rx_dropped++;
> 
> The same thing happens when a MUCSE_RX_DROP_RESOURCE frame reaches EOP,
> and when rnpgbe_cleanup_headers() fails with size >= ETH_HLEN. None of
> these paths update delivered_packets or delivered_bytes.
> 
> rnpgbe_get_stats64() covers all RNPGBE_MAX_QUEUES. So do the qstat device
> totals, which pick up inactive queues through rnpgbe_get_base_stats().
> That means after the first such drop, the rtnl RX counts stay above the
> qstat RX counts for good.
> 
> tools/testing/selftests/drivers/net/stats.py pkt_byte_sum() expects the
> two to match:
> 
>     # Compare stats, rtnl stats and qstats must match,
>     ...
>         if stat_cmp(rtstat, qstat) > 0:
>             raise KsftFailEx("Qstats are lower, fetched later")
> 
> Once any RX drop has happened, wouldn't this test fail on rnpgbe? The
> commit message describes the split: "RX queue counters cover packets
> delivered to the networking stack, while interface RX totals also include
> good packets dropped by the driver".
> 
> Could both interfaces report the same packets and bytes? Alternatively,
> could driver drops be counted only in rx_dropped, and not in the rtnl
> rx_packets and rx_bytes?
> 
After checking the documented semantics, I think these counters need to
remain different when the driver drops a received packet.

include/uapi/linux/if_link.h defines rx_packets as including good packets
received by the host but subsequently dropped, even within the driver.
In contrast, Documentation/netlink/specs/netdev.yaml defines qstats
rx-packets as packets successfully received and passed to the stack.

The pkt_byte_sum selftest can consequently fail after such a drop. I do
not think changing the driver counters solely to satisfy that equality
would preserve the documented semantics.

> > +	stats->alloc_fail = atomic64_read(&queue->page_alloc_failures) +
> > +			    atomic64_read(&queue->skb_alloc_failures);
> > +}
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
> 
