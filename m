Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991442;
	b=vHt70wWvbpKRmgmYePuPyeQz3Ge50FVYsXjSTKxTXZJvuvgEt14nY5jSnob5L7alRQxD
	 6r02E02h6nE/6wmkoQmYgnvCtFcZX2TBZFybTWVvHMCmkWNl7RTzPnxTu/ejEemCwv4ft
	 8PWfxWPzUkByD9AXHGu73djP/5IjPINONusPARjlkTCCP+UzqOAKeZ1ewhYxw5hpauBvV
	 mhBIV4Q6WHuiUQ5ujX9FoZPZF/lGOSD42y04KaMQoxx8wU28qHZ44FnfH1pzn6bjxe2yv
	 pwq3ddvMer3p2SPnBtGLENg8zEGNTAs/N+HnnraXoekknG/SescVZjjGM/beluLZl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991442;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=m5E0xbPg5Lg3znsYSuRlgF/XDIdYe05B1Qq1q6qrD3Y=;
	b=xh+X48lzwXhzpeImxfo3K9QUubnolxlDL5gkyrRTZzgttCj5e4YZ7ffEhdjggDLsbiY9
	 5wm96C8iVbGcDmxc+hBeXzeK1QpDH7EklYhR9qKe6+C6S/SHz4TEhiWzZikfHhNwnzUri
	 XFp+1wd0/Zk6um6tyWl6FJAIe7KdejHuaxTOsZCqI9jQpyM7FzTvsZ5oIGS+WWcqSAFSK
	 S57mQo5gOfH10KBqHFayegSvjUqLm/gYV0OwsZM7AOlNz10xgTGTXvX8j6ZOq3yAObEPc
	 L79YZOV+rEr44OdjHVDzkTlt9FYUTbuD9A/BAkkbQ2TexdL7yiAf0mxyLwS+4aVLdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJqyg5O6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555C1606A31C;
	Wed, 18 Nov 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJqyg5O6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614AA1F000C5;
	Wed, 18 Nov 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991441;
	bh=m5E0xbPg5Lg3znsYSuRlgF/XDIdYe05B1Qq1q6qrD3Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YJqyg5O689eBAKMonOt4VqZfqldn+ZCNDkSUuPtpDJN8X7wCzfFToumn4LierSbBM
	 SXIVzl+Y4BZ/YNa5IDINAF14LnIqLgidF7YMYJddESMnhYPMxwSkXWFqbgxV4oVG9M
	 Bx7kfFJ2dkDCLAWw4KQ1RUjHY5mUuHk/W8ZfP6QKNsV5OJVI/x80J+FnuJ2oXLRnat
	 79aGVgBbQm0MxEKs05U2iG6RJko3Z93WlvH09/VuQSy5OaHBC+nMjuUTr105rtXk2G
	 phgy1NybT66y1eicGNQnpPIQjDBEG2WyvJCMQ2rmDyVF0A1AaTFD68Z8a7YuhYh+i7
	 s3nUsTv0x2EtA==
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
From: netdev-bot+sashiko@kernel.org
To: narcisav.kernel@gmail.com
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 08:44:00 +0000
Message-ID: <179499144094.3136.198428718668517773@kernel.org>
In-Reply-To: <20261116204313.23023-1-narcisav.kernel@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] __bnxt_tx_int() treats every completed skb with skb_is_gso()
  && !tx_buf->is_sw_gso as segmented by the NIC into gso_segs wire…
- [Low] The patch adds per-ring TX HW GSO counters
  (txr->tx_hw_gso_packets, txr->tx_hw_gso_wire_packets) to struct…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  bnxt_start_xmit() lets a GSO skb (gso_size != 0) take the TX push path…

--

eth: bnxt: report TX HW GSO queue stats

This commit adds per-ring counters to bnxt for HW GSO skbs and for the
wire packets they produce. The counters are updated in the TX completion
path and reported through the netdev queue stats ops. Aggregated totals
are also folded into the base stats so the tso.py selftests can run on
bnxt.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 6846a27bfef4c..1a7a93bf684ac 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -869,6 +869,11 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
>  		cons = NEXT_TX(cons);
>  		tx_pkts++;
>  		tx_bytes += skb->len;
> +		if (skb_is_gso(skb) && !tx_buf->is_sw_gso) {
> +			txr->tx_hw_gso_packets++;
> +			txr->tx_hw_gso_wire_packets +=
> +				skb_shinfo(skb)->gso_segs;
> +		}
>  		tx_buf->skb = NULL;
>  		tx_buf->is_ts_pkt = 0;

[Severity: Medium]
Can this over-count wire packets for GSO skbs that were sent through the
TX push path?

This block runs before the is_push early-out. It treats every completed
skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
However, the push path gate in bnxt_start_xmit() does not exclude GSO
skbs:

	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
	    skb_frags_readable(skb) && !lflags) {

The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
the skb as a single frame.

Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
hw_gso_wire_packets, even though only one frame went on the wire.

tso.py reads these counters, so could this give misleading results
there? Fixing the push path issue described below would also fix this.

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
should bnxt_start_xmit() keep GSO skbs out of the push path?

The push path only sets the checksum flag and then skips the LSO setup:

bnxt_start_xmit() {
    ...
		if (skb->ip_summed == CHECKSUM_PARTIAL)
			tx_push1->tx_bd_hsize_lflags =
					cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
		else
			tx_push1->tx_bd_hsize_lflags = 0;
    ...
		goto tx_done;
    ...
}

LSO is only programmed in the normal_tx path:

	if (skb_is_gso(skb)) {
		...
		txbd1->tx_bd_hsize_lflags |= cpu_to_le32(TX_BD_FLAGS_LSO |
					TX_BD_FLAGS_T_IPID |
					(hdr_len << (TX_BD_HSIZE_SHIFT - 1)));
		length = skb_shinfo(skb)->gso_size;
		txbd1->tx_bd_mss = cpu_to_le32(length);

So a small GSO skb that takes the push path goes out unsegmented.

With HW USO (BNXT_FLAG_UDP_GSO_CAP), wouldn't the receiver get one UDP
datagram holding the concatenated payload, instead of gso_segs separate
datagrams? For TCP, a segment larger than the peer's MSS would be sent.

Neither bnxt_features_check() nor gso_features_check() seems to strip
GSO for skbs this small. Would adding a !skb_is_gso(skb) check to the
push gate be enough to fix this?

[ ... ]

> @@ -16369,6 +16385,9 @@ static void bnxt_get_queue_stats_tx(struct net_device *dev, int i,
>  	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_ucast_bytes);
>  	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_mcast_bytes);
>  	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_bcast_bytes);
> +
> +	stats->hw_gso_packets = txr->tx_hw_gso_packets;
> +	stats->hw_gso_wire_packets = txr->tx_hw_gso_wire_packets;
>  }

[Severity: Low]
Are these reads safe against the writer in __bnxt_tx_int()?

txr->tx_hw_gso_packets and txr->tx_hw_gso_wire_packets are plain u64
fields. They are updated with ++ and += from NAPI context.

They are read here, and in bnxt_get_ring_drv_stats() through
bnxt_get_ethtool_stats(), from process context while NAPI can be
running on another CPU.

bnxt_sync_ring_stats() only takes bp->stats_lock around the HW ring
stats accumulation, so these fields are not covered.

BNXT does not depend on 64BIT. On 32-bit builds, could a reader see a
torn value when the low word wraps? On 64-bit this is still an
unannotated data race that KCSAN would report.

Would it make sense to use u64_stats_t with a u64_stats_sync here, with
a fetch_begin/fetch_retry loop on the reader side? The existing
rx_hw_gro_packets counters use the same unsynchronized pattern.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116204313.23023-1-narcisav.kernel%40gmail.com
